[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Inter-process communication in Linux: Using pipes and message queues)
[#]: via: (https://opensource.com/article/19/4/interprocess-communication-linux-channels)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

Inter-process communication in Linux: Using pipes and message queues
======
Learn how processes synchronize with each other in Linux.
![Chat bubbles][1]

This is the second article in a series about [interprocess communication][2] (IPC) in Linux. The [first article][3] focused on IPC through shared storage: shared files and shared memory segments. This article turns to pipes, which are channels that connect processes for communication. A channel has a _write end_ for writing bytes, and a _read end_ for reading these bytes in FIFO (first in, first out) order. In typical use, one process writes to the channel, and a different process reads from this same channel. The bytes themselves might represent anything: numbers, employee records, digital movies, and so on.

Pipes come in two flavors, named and unnamed, and can be used either interactively from the command line or within programs; examples are forthcoming. This article also looks at memory queues, which have fallen out of fashion—but undeservedly so.

The code examples in the first article acknowledged the threat of race conditions (either file-based or memory-based) in IPC that uses shared storage. The question naturally arises about safe concurrency for the channel-based IPC, which will be covered in this article. The code examples for pipes and memory queues use APIs with the POSIX stamp of approval, and a core goal of the POSIX standards is thread-safety.

Consider the [man pages for the **mq_open**][4] function, which belongs to the memory queue API. These pages include a section on [Attributes][5] with this small table:

Interface | Attribute | Value
---|---|---
mq_open() | Thread safety | MT-Safe

The value **MT-Safe** (with **MT** for multi-threaded) means that the **mq_open** function is thread-safe, which in turn implies process-safe: A process executes in precisely the sense that one of its threads executes, and if a race condition cannot arise among threads in the _same_ process, such a condition cannot arise among threads in different processes. The **MT-Safe** attribute assures that a race condition does not arise in invocations of **mq_open**. In general, channel-based IPC is concurrent-safe, although a cautionary note is raised in the examples that follow.

### Unnamed pipes

Let's start with a contrived command line example that shows how unnamed pipes work. On all modern systems, the vertical bar **|** represents an unnamed pipe at the command line. Assume **%** is the command line prompt, and consider this command:


```
`% sleep 5 | echo "Hello, world!" ## writer to the left of |, reader to the right`
```

The _sleep_ and _echo_ utilities execute as separate processes, and the unnamed pipe allows them to communicate. However, the example is contrived in that no communication occurs. The greeting _Hello, world!_ appears on the screen; then, after about five seconds, the command line prompt returns, indicating that both the _sleep_ and _echo_ processes have exited. What's going on?

In the vertical-bar syntax from the command line, the process to the left ( _sleep_ ) is the writer, and the process to the right ( _echo_ ) is the reader. By default, the reader blocks until there are bytes to read from the channel, and the writer—after writing its bytes—finishes up by sending an end-of-stream marker. (Even if the writer terminates prematurely, an end-of-stream marker is sent to the reader.) The unnamed pipe persists until both the writer and the reader terminate.

In the contrived example, the _sleep_ process does not write any bytes to the channel but does terminate after about five seconds, which sends an end-of-stream marker to the channel. In the meantime, the _echo_ process immediately writes the greeting to the standard output (the screen) because this process does not read any bytes from the channel, so it does no waiting. Once the _sleep_ and _echo_ processes terminate, the unnamed pipe—not used at all for communication—goes away and the command line prompt returns.

Here is a more useful example using two unnamed pipes. Suppose that the file _test.dat_ looks like this:


```
this
is
the
way
the
world
ends
```

The command:


```
`% cat test.dat | sort | uniq`
```

pipes the output from the _cat_ (concatenate) process into the _sort_ process to produce sorted output, and then pipes the sorted output into the _uniq_ process to eliminate duplicate records (in this case, the two occurrences of **the** reduce to one):


```
ends
is
the
this
way
world
```

The scene now is set for a program with two processes that communicate through an unnamed pipe.

#### Example 1. Two processes communicating through an unnamed pipe.


```
#include <sys/wait.h> /* wait */
#include <stdio.h>
#include <stdlib.h> /* exit functions */
#include <unistd.h> /* read, write, pipe, _exit */
#include <string.h>

#define ReadEnd 0
#define WriteEnd 1

void report_and_exit(const char* msg) {
[perror][6](msg);
[exit][7](-1); /** failure **/
}

int main() {
int pipeFDs[2]; /* two file descriptors */
char buf; /* 1-byte buffer */
const char* msg = "Nature's first green is gold\n"; /* bytes to write */

if (pipe(pipeFDs) < 0) report_and_exit("pipeFD");
pid_t cpid = fork(); /* fork a child process */
if (cpid < 0) report_and_exit("fork"); /* check for failure */

if (0 == cpid) { /*** child ***/ /* child process */
close(pipeFDs[WriteEnd]); /* child reads, doesn't write */

while (read(pipeFDs[ReadEnd], &buf, 1) > 0) /* read until end of byte stream */
write(STDOUT_FILENO, &buf, sizeof(buf)); /* echo to the standard output */

close(pipeFDs[ReadEnd]); /* close the ReadEnd: all done */
_exit(0); /* exit and notify parent at once */
}
else { /*** parent ***/
close(pipeFDs[ReadEnd]); /* parent writes, doesn't read */

write(pipeFDs[WriteEnd], msg, [strlen][8](msg)); /* write the bytes to the pipe */
close(pipeFDs[WriteEnd]); /* done writing: generate eof */

wait(NULL); /* wait for child to exit */
[exit][7](0); /* exit normally */
}
return 0;
}
```

The _pipeUN_ program above uses the system function **fork** to create a process. Although the program has but a single source file, multi-processing occurs during (successful) execution. Here are the particulars in a quick review of how the library function **fork** works:

  * The **fork** function, called in the _parent_ process, returns **-1** to the parent in case of failure. In the _pipeUN_ example, the call is: [code]`pid_t cpid = fork(); /* called in parent */`[/code] The returned value is stored, in this example, in the variable **cpid** of integer type **pid_t**. (Every process has its own _process ID_ , a non-negative integer that identifies the process.) Forking a new process could fail for several reasons, including a full _process table_ , a structure that the system maintains to track processes. Zombie processes, clarified shortly, can cause a process table to fill if these are not harvested.
  * If the **fork** call succeeds, it thereby spawns (creates) a new child process, returning one value to the parent but a different value to the child. Both the parent and the child process execute the _same_ code that follows the call to **fork**. (The child inherits copies of all the variables declared so far in the parent.) In particular, a successful call to **fork** returns:
    * Zero to the child process
    * The child's process ID to the parent
  * An _if/else_ or equivalent construct typically is used after a successful **fork** call to segregate code meant for the parent from code meant for the child. In this example, the construct is: [code] if (0 == cpid) { /*** child ***/
...
}
else { /*** parent ***/
...
} 
```
If forking a child succeeds, the _pipeUN_ program proceeds as follows. There is an integer array:
```
`int pipeFDs[2]; /* two file descriptors */`
```
to hold two file descriptors, one for writing to the pipe and another for reading from the pipe. (The array element **pipeFDs[0]** is the file descriptor for the read end, and the array element **pipeFDs[1]** is the file descriptor for the write end.) A successful call to the system **pipe** function, made immediately before the call to **fork** , populates the array with the two file descriptors:
```
`if (pipe(pipeFDs) < 0) report_and_exit("pipeFD");`
```
The parent and the child now have copies of both file descriptors, but the _separation of concerns_ pattern means that each process requires exactly one of the descriptors. In this example, the parent does the writing and the child does the reading, although the roles could be reversed. The first statement in the child _if_ -clause code, therefore, closes the pipe's write end:
```
`close(pipeFDs[WriteEnd]); /* called in child code */`
```
and the first statement in the parent _else_ -clause code closes the pipe's read end:
```
`close(pipeFDs[ReadEnd]); /* called in parent code */`
```
The parent then writes some bytes (ASCII codes) to the unnamed pipe, and the child reads these and echoes them to the standard output.

One more aspect of the program needs clarification: the call to the **wait** function in the parent code. Once spawned, a child process is largely independent of its parent, as even the short _pipeUN_ program illustrates. The child can execute arbitrary code that may have nothing to do with the parent. However, the system does notify the parent through a signal—if and when the child terminates.

What if the parent terminates before the child? In this case, unless precautions are taken, the child becomes and remains a _zombie_ process with an entry in the process table. The precautions are of two broad types. One precaution is to have the parent notify the system that the parent has no interest in the child's termination:
```
`signal(SIGCHLD, SIG_IGN); /* in parent: ignore notification */`
```
A second approach is to have the parent execute a **wait** on the child's termination, thereby ensuring that the parent outlives the child. This second approach is used in the _pipeUN_ program, where the parent code has this call:
```
`wait(NULL); /* called in parent */`
```
This call to **wait** means _wait until the termination of any child occurs_ , and in the _pipeUN_ program, there is only one child process. (The **NULL** argument could be replaced with the address of an integer variable to hold the child's exit status.) There is a more flexible **waitpid** function for fine-grained control, e.g., for specifying a particular child process among several.

The _pipeUN_ program takes another precaution. When the parent is done waiting, the parent terminates with the call to the regular **exit** function. By contrast, the child terminates with a call to the **_exit** variant, which fast-tracks notification of termination. In effect, the child is telling the system to notify the parent ASAP that the child has terminated.

If two processes write to the same unnamed pipe, can the bytes be interleaved? For example, if process P1 writes:
```
`foo bar`
```
to a pipe and process P2 concurrently writes:
```
`baz baz`
```
to the same pipe, it seems that the pipe contents might be something arbitrary, such as:
```
`baz foo baz bar`
```
The POSIX standard ensures that writes are not interleaved so long as no write exceeds **PIPE_BUF** bytes. On Linux systems, **PIPE_BUF** is 4,096 bytes in size. My preference with pipes is to have a single writer and a single reader, thereby sidestepping the issue.

## Named pipes

An unnamed pipe has no backing file: the system maintains an in-memory buffer to transfer bytes from the writer to the reader. Once the writer and reader terminate, the buffer is reclaimed, so the unnamed pipe goes away. By contrast, a named pipe has a backing file and a distinct API.

Let's look at another command line example to get the gist of named pipes. Here are the steps:

  * Open two terminals. The working directory should be the same for both.
  * In one of the terminals, enter these two commands (the prompt again is **%** , and my comments start with **##** ): [code] % mkfifo tester ## creates a backing file named tester
% cat tester ## type the pipe's contents to stdout [/code] At the beginning, nothing should appear in the terminal because nothing has been written yet to the named pipe.
  * In the second terminal, enter the command: [code] % cat > tester ## redirect keyboard input to the pipe
hello, world! ## then hit Return key
bye, bye ## ditto
<Control-C> ## terminate session with a Control-C [/code] Whatever is typed into this terminal is echoed in the other. Once **Ctrl+C** is entered, the regular command line prompt returns in both terminals: the pipe has been closed.
  * Clean up by removing the file that implements the named pipe: [code]`% unlink tester`
```



As the utility's name _mkfifo_ implies, a named pipe also is called a FIFO because the first byte in is the first byte out, and so on. There is a library function named **mkfifo** that creates a named pipe in programs and is used in the next example, which consists of two processes: one writes to the named pipe and the other reads from this pipe.

#### Example 2. The _fifoWriter_ program


```
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>

#define MaxLoops 12000 /* outer loop */
#define ChunkSize 16 /* how many written at a time */
#define IntsPerChunk 4 /* four 4-byte ints per chunk */
#define MaxZs 250 /* max microseconds to sleep */

int main() {
const char* pipeName = "./fifoChannel";
mkfifo(pipeName, 0666); /* read/write for user/group/others */
int fd = open(pipeName, O_CREAT | O_WRONLY); /* open as write-only */
if (fd < 0) return -1; /* can't go on */

int i;
for (i = 0; i < MaxLoops; i++) { /* write MaxWrites times */
int j;
for (j = 0; j < ChunkSize; j++) { /* each time, write ChunkSize bytes */
int k;
int chunk[IntsPerChunk];
for (k = 0; k < IntsPerChunk; k++)
chunk[k] = [rand][9]();
write(fd, chunk, sizeof(chunk));
}
usleep(([rand][9]() % MaxZs) + 1); /* pause a bit for realism */
}

close(fd); /* close pipe: generates an end-of-stream marker */
unlink(pipeName); /* unlink from the implementing file */
[printf][10]("%i ints sent to the pipe.\n", MaxLoops * ChunkSize * IntsPerChunk);

return 0;
}
```

The _fifoWriter_ program above can be summarized as follows:

  * The program creates a named pipe for writing: [code] mkfifo(pipeName, 0666); /* read/write perms for user/group/others */
int fd = open(pipeName, O_CREAT | O_WRONLY); [/code] where **pipeName** is the name of the backing file passed to **mkfifo** as the first argument. The named pipe then is opened with the by-now familiar call to the **open** function, which returns a file descriptor.
  * For a touch of realism, the _fifoWriter_ does not write all the data at once, but instead writes a chunk, sleeps a random number of microseconds, and so on. In total, 768,000 4-byte integer values are written to the named pipe.
  * After closing the named pipe, the _fifoWriter_ also unlinks the file: [code] close(fd); /* close pipe: generates end-of-stream marker */
unlink(pipeName); /* unlink from the implementing file */ [/code] The system reclaims the backing file once every process connected to the pipe has performed the unlink operation. In this example, there are only two such processes: the _fifoWriter_ and the _fifoReader_ , both of which do an _unlink_ operation.



The two programs should be executed in different terminals with the same working directory. However, the _fifoWriter_ should be started before the _fifoReader_ , as the former creates the pipe. The _fifoReader_ then accesses the already created named pipe.

#### Example 3. The _fifoReader_ program


```
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

unsigned is_prime(unsigned n) { /* not pretty, but efficient */
if (n <= 3) return n > 1;
if (0 == (n % 2) || 0 == (n % 3)) return 0;

unsigned i;
for (i = 5; (i * i) <= n; i += 6)
if (0 == (n % i) || 0 == (n % (i + 2))) return 0;

return 1; /* found a prime! */
}

int main() {
const char* file = "./fifoChannel";
int fd = open(file, O_RDONLY);
if (fd < 0) return -1; /* no point in continuing */
unsigned count = 0, total = 0, primes_count = 0;

while (1) {
int next;
int i;

ssize_t count = read(fd, &next, sizeof(int));
if (0 == count) break; /* end of stream */
else if (count == sizeof(int)) { /* read a 4-byte int value */
total++;
if (is_prime(next)) primes_count++;
}
}

close(fd); /* close pipe from read end */
unlink(file); /* unlink from the underlying file */
[printf][10]("Received ints: %u, primes: %u\n", total, primes_count);

return 0;
}
```

The _fifoReader_ program above can be summarized as follows:

  * Because the _fifoWriter_ creates the named pipe, the _fifoReader_ needs only the standard call **open** to access the pipe through the backing file: [code] const char* file = "./fifoChannel";
int fd = open(file, O_RDONLY); [/code] The file opens as read-only.
  * The program then goes into a potentially infinite loop, trying to read a 4-byte chunk on each iteration. The **read** call: [code]`ssize_t count = read(fd, &next, sizeof(int));`[/code] returns 0 to indicate end-of-stream, in which case the _fifoReader_ breaks out of the loop, closes the named pipe, and unlinks the backing file before terminating.
  * After reading a 4-byte integer, the _fifoReader_ checks whether the number is a prime. This represents the business logic that a production-grade reader might perform on the received bytes. On a sample run, there were 37,682 primes among the 768,000 integers received.



On repeated sample runs, the _fifoReader_ successfully read all of the bytes that the _fifoWriter_ wrote. This is not surprising. The two processes execute on the same host, taking network issues out of the equation. Named pipes are a highly reliable and efficient IPC mechanism and, therefore, in wide use.

Here is the output from the two programs, each launched from a separate terminal but with the same working directory:


```
% ./fifoWriter
768000 ints sent to the pipe.
###
% ./fifoReader
Received ints: 768000, primes: 37682
```

### Message queues

Pipes have strict FIFO behavior: the first byte written is the first byte read, the second byte written is the second byte read, and so forth. Message queues can behave in the same way but are flexible enough that byte chunks can be retrieved out of FIFO order.

As the name suggests, a message queue is a sequence of messages, each of which has two parts:

  * The payload, which is an array of bytes ( **char** in C)
  * A type, given as a positive integer value; types categorize messages for flexible retrieval



Consider the following depiction of a message queue, with each message labeled with an integer type:


```
+-+ +-+ +-+ +-+
sender--->|3|--->|2|--->|2|--->|1|--->receiver
+-+ +-+ +-+ +-+
```

Of the four messages shown, the one labeled 1 is at the front, i.e., closest to the receiver. Next come two messages with label 2, and finally, a message labeled 3 at the back. If strict FIFO behavior were in play, then the messages would be received in the order 1-2-2-3. However, the message queue allows other retrieval orders. For example, the messages could be retrieved by the receiver in the order 3-2-1-2.

The _mqueue_ example consists of two programs, the _sender_ that writes to the message queue and the _receiver_ that reads from this queue. Both programs include the header file _queue.h_ shown below:

#### Example 4. The header file _queue.h_


```
#define ProjectId 123
#define PathName "queue.h" /* any existing, accessible file would do */
#define MsgLen 4
#define MsgCount 6

typedef struct {
long type; /* must be of type long */
char payload[MsgLen + 1]; /* bytes in the message */
} queuedMessage;
```

The header file defines a structure type named **queuedMessage** , with **payload** (byte array) and **type** (integer) fields. This file also defines symbolic constants (the **#define** statements), the first two of which are used to generate a key that, in turn, is used to get a message queue ID. The **ProjectId** can be any positive integer value, and the **PathName** must be an existing, accessible file—in this case, the file _queue.h_. The setup statements in both the _sender_ and the _receiver_ programs are:


```
key_t key = ftok(PathName, ProjectId); /* generate key */
int qid = msgget(key, 0666 | IPC_CREAT); /* use key to get queue id */
```

The ID **qid** is, in effect, the counterpart of a file descriptor for message queues.

#### Example 5. The message _sender_ program


```
#include <stdio.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdlib.h>
#include <string.h>
#include "queue.h"

void report_and_exit(const char* msg) {
[perror][6](msg);
[exit][7](-1); /* EXIT_FAILURE */
}

int main() {
key_t key = ftok(PathName, ProjectId);
if (key < 0) report_and_exit("couldn't get key...");

int qid = msgget(key, 0666 | IPC_CREAT);
if (qid < 0) report_and_exit("couldn't get queue id...");

char* payloads[] = {"msg1", "msg2", "msg3", "msg4", "msg5", "msg6"};
int types[] = {1, 1, 2, 2, 3, 3}; /* each must be > 0 */
int i;
for (i = 0; i < MsgCount; i++) {
/* build the message */
queuedMessage msg;
msg.type = types[i];
[strcpy][11](msg.payload, payloads[i]);

/* send the message */
msgsnd(qid, &msg, sizeof(msg), IPC_NOWAIT); /* don't block */
[printf][10]("%s sent as type %i\n", msg.payload, (int) msg.type);
}
return 0;
}
```

The _sender_ program above sends out six messages, two each of a specified type: the first messages are of type 1, the next two of type 2, and the last two of type 3. The sending statement:


```
`msgsnd(qid, &msg, sizeof(msg), IPC_NOWAIT);`
```

is configured to be non-blocking (the flag **IPC_NOWAIT** ) because the messages are so small. The only danger is that a full queue, unlikely in this example, would result in a sending failure. The _receiver_ program below also receives messages using the **IPC_NOWAIT** flag.

#### Example 6. The message _receiver_ program


```
#include <stdio.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdlib.h>
#include "queue.h"

void report_and_exit(const char* msg) {
[perror][6](msg);
[exit][7](-1); /* EXIT_FAILURE */
}

int main() {
key_t key= ftok(PathName, ProjectId); /* key to identify the queue */
if (key < 0) report_and_exit("key not gotten...");

int qid = msgget(key, 0666 | IPC_CREAT); /* access if created already */
if (qid < 0) report_and_exit("no access to queue...");

int types[] = {3, 1, 2, 1, 3, 2}; /* different than in sender */
int i;
for (i = 0; i < MsgCount; i++) {
queuedMessage msg; /* defined in queue.h */
if (msgrcv(qid, &msg, sizeof(msg), types[i], MSG_NOERROR | IPC_NOWAIT) < 0)
[puts][12]("msgrcv trouble...");
[printf][10]("%s received as type %i\n", msg.payload, (int) msg.type);
}

/** remove the queue **/
if (msgctl(qid, IPC_RMID, NULL) < 0) /* NULL = 'no flags' */
report_and_exit("trouble removing queue...");

return 0;
}
```

The _receiver_ program does not create the message queue, although the API suggests as much. In the _receiver_ , the call:


```
`int qid = msgget(key, 0666 | IPC_CREAT);`
```

is misleading because of the **IPC_CREAT** flag, but this flag really means _create if needed, otherwise access_. The _sender_ program calls **msgsnd** to send messages, whereas the _receiver_ calls **msgrcv** to retrieve them. In this example, the _sender_ sends the messages in the order 1-1-2-2-3-3, but the _receiver_ then retrieves them in the order 3-1-2-1-3-2, showing that message queues are not bound to strict FIFO behavior:


```
% ./sender
msg1 sent as type 1
msg2 sent as type 1
msg3 sent as type 2
msg4 sent as type 2
msg5 sent as type 3
msg6 sent as type 3

% ./receiver
msg5 received as type 3
msg1 received as type 1
msg3 received as type 2
msg2 received as type 1
msg6 received as type 3
msg4 received as type 2
```

The output above shows that the _sender_ and the _receiver_ can be launched from the same terminal. The output also shows that the message queue persists even after the _sender_ process creates the queue, writes to it, and exits. The queue goes away only after the _receiver_ process explicitly removes it with the call to **msgctl** :


```
`if (msgctl(qid, IPC_RMID, NULL) < 0) /* remove queue */`
```

### Wrapping up

The pipes and message queue APIs are fundamentally _unidirectional_ : one process writes and another reads. There are implementations of bidirectional named pipes, but my two cents is that this IPC mechanism is at its best when it is simplest. As noted earlier, message queues have fallen in popularity—but without good reason; these queues are yet another tool in the IPC toolbox. Part 3 completes this quick tour of the IPC toolbox with code examples of IPC through sockets and signals.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/interprocess-communication-linux-channels

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_communication_team.png?itok=CYfZ_gE7 (Chat bubbles)
[2]: https://en.wikipedia.org/wiki/Inter-process_communication
[3]: https://opensource.com/article/19/4/interprocess-communication-ipc-linux-part-1
[4]: http://man7.org/linux/man-pages/man2/mq_open.2.html
[5]: http://man7.org/linux/man-pages/man2/mq_open.2.html#ATTRIBUTES
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/perror.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/strlen.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/rand.html
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[11]: http://www.opengroup.org/onlinepubs/009695399/functions/strcpy.html
[12]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
