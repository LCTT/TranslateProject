[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Introducing the guide to inter-process communication in Linux)
[#]: via: (https://opensource.com/article/20/1/inter-process-communication-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Introducing the guide to inter-process communication in Linux
======
This free eBook gives seasoned and occasional coders insight into the
core concepts and mechanisms of inter-process communication (IPC) in
Linux.
![Inter-process Communication in Linux][1]

Getting one software process to talk to another software process is a delicate balancing act. It can be a vital function for an application, though, so it's a problem any programmer embarking on a complex project has to solve. Whether your application needs to kick off a job being handled by someone else's software; to monitor an action being performed by a peripheral or over a network; or to detect a signal from some other source, when your software relies on something outside of its own code to know what to do next or when to do it, you need to think about inter-process communication (IPC).

The Unix operating system accounted for this long ago, possibly because of an early expectation that software would originate from diverse sources. In the same tradition, Linux provides many of the same interfaces for IPC and some new ones. The Linux kernel features several IPC methods, and the [util-linux package][2] contains the **ipcmk**, **ipcrm**, **ipcs**, and **lsipc** commands for monitoring and managing IPC messages.

### Show IPC information

Before experimenting with IPC, you should know what IPC facilities are already on your system. The **lsipc** command provides that information.


```
RESOURCE DESCRIPTION               LIMIT  USED  USE%
MSGMNI   Number of message queues  32000     0 0.00%
MSGMAX   Max size of message (byt.. 8192     -     -
MSGMNB   Default max size of queue 16384     -     -
SHMMNI   Shared memory segments     4096    79 1.93%
SHMALL   Shared memory pages       184[...] 25452 0.00%
SHMMAX   Max size of shared memory 18446744073692774399
SHMMIN   Min size of shared memory     1     -     -
SEMMNI   Number of semaphore ident 32000     0 0.00%
SEMMNS   Total number of semaphore 1024000.. 0 0.00%
SEMMSL   Max semaphores per semap  32000     -     -
SEMOPM   Max number of operations p  500     -     -
SEMVMX   Semaphore max value       32767     -     -
```

You may notice that this sample listing includes three different types of IPC mechanisms, each available in the Linux kernel: messages (MSG), shared memory (SHM), and semaphores (SEM). You can view current activity in each of those subsystems with the **ipcs** command:


```
$ ipcs

\------ Message Queues Creators/Owners ---
msqid     perms     cuid      cgid  [...]

\------ Shared Memory Segment Creators/Owners
shmid     perms    cuid    cgid  [...]
557056    700      seth    users [...]
3571713   700      seth    users [...]
2654210   600      seth    users [...]
2457603   700      seth    users [...]

\------ Semaphore Arrays Creators/Owners ---
semid     perms     cuid      cgid  [...]
```

This shows that there currently are no messages or semaphore arrays, but a number of shared memory segments are in use.

There's a simple example you can perform on your system so you can see one of these systems at work. It involves some C code, so you must have build tools on your system. The names of the packages you must install to be able to build from source code vary depending on your distro, so refer to your documentation for specifics. For example, on Debian-based distributions, you can learn about build requirements on the [BuildingTutorial][3] section of the wiki, and on Fedora-based distributions, refer to the [Installing software from source][4] section of the docs.

### Create a message queue

Your system has a default message queue already, but you can create your own using the **ipcmk** command:


```
$ ipcmk --queue
Message queue id: 32764
```

Write a simple IPC message sender, hard-coding in the queue ID for simplicity:


```
#include &lt;sys/ipc.h&gt;
#include &lt;sys/msg.h&gt;
#include &lt;stdio.h&gt;
#include &lt;string.h&gt;

struct msgbuffer {
  char text[24];
} message;

int main() {
    int msqid = 32764;
    strcpy(message.text,"opensource.com");
    msgsnd(msqid, &amp;message, sizeof(message), 0);
    printf("Message: %s\n",message.text);
    printf("Queue: %d\n",msqid);
    return 0;
        }
```

Compile the application and run it:


```
$ gcc msgsend.c -o msg.bin
$ ./msg.bin
Message: opensource.com
Queue: 32769
```

You just sent a message to your message queue. You can verify that with the **ipcs** command, using the **\--queue** option to limit output to the message queue:


```
$ ipcs -q

\------ Message Queues --------
key        msqid   owner  perms  used-bytes  messages
0x7b341ab9 0       seth   666    0          0
0x72bd8410 32764   seth   644    24         1
```

You can also retrieve those messages with:


```
#include &lt;sys/ipc.h&gt;
#include &lt;sys/msg.h&gt;
#include &lt;stdio.h&gt;

struct msgbuffer {
    char text[24];
} message;

int main() {
    int msqid = 32764;
    msgrcv(msqid, &amp;message, sizeof(message),0,0);
    printf("\nQueue: %d\n",msqid);
    printf("Got this message: %s\n", message.text);
    msgctl(msqid,IPC_RMID,NULL);
    return 0;
```

Compile and run with:


```
$ gcc get.c -o get.bin
$ ./get.bin

Queue: 32764
Got this message: opensource.com
```

### Download [the eBook][5]

This is just one example of the lessons available in Marty Kalin's [A guide to inter-process communication in Linux][5], the latest free (and Creative Commons) downloadable eBook from Opensource.com. In just a few short lessons, you will learn about POSIX methods of IPC from message queues, shared memory and semaphores, sockets, signals, and much more. Sit down with Marty's book, and you'll emerge a better-informed programmer. But it isn't just for seasoned coders—if all you ever write are shell scripts, there's plenty of practical knowledge about pipes (named and unnamed) and shared files, as well as important concepts you need to know when you use a shared file or an external message queue.

If you're interested in making great software that's written to be dynamic and system-aware, you need to know about IPC. Let [this book][5] be your guide.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/inter-process-communication-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_inter-process_communication_linux_520x292.png?itok=hPoen7oI (Inter-process Communication in Linux)
[2]: https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/
[3]: https://wiki.debian.org/BuildingTutorial
[4]: https://docs.pagure.org/docs-fedora/installing-software-from-source.html
[5]: https://opensource.com/downloads/guide-inter-process-communication-linux
