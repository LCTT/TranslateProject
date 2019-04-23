[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Inter-process communication in Linux: Sockets and signals)
[#]: via: (https://opensource.com/article/19/4/interprocess-communication-linux-networking)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

Inter-process communication in Linux: Sockets and signals
======

Learn how processes synchronize with each other in Linux.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/mesh_networking_dots_connected.png?itok=ovINTRR3)

This is the third and final article in a series about [interprocess communication][1] (IPC) in Linux. The [first article][2] focused on IPC through shared storage (files and memory segments), and the [second article][3] does the same for basic channels: pipes (named and unnamed) and message queues. This article moves from IPC at the high end (sockets) to IPC at the low end (signals). Code examples flesh out the details.

### Sockets

Just as pipes come in two flavors (named and unnamed), so do sockets. IPC sockets (aka Unix domain sockets) enable channel-based communication for processes on the same physical device (host), whereas network sockets enable this kind of IPC for processes that can run on different hosts, thereby bringing networking into play. Network sockets need support from an underlying protocol such as TCP (Transmission Control Protocol) or the lower-level UDP (User Datagram Protocol).

By contrast, IPC sockets rely upon the local system kernel to support communication; in particular, IPC sockets communicate using a local file as a socket address. Despite these implementation differences, the IPC socket and network socket APIs are the same in the essentials. The forthcoming example covers network sockets, but the sample server and client programs can run on the same machine because the server uses network address localhost (127.0.0.1), the address for the local machine on the local machine.

Sockets configured as streams (discussed below) are bidirectional, and control follows a client/server pattern: the client initiates the conversation by trying to connect to a server, which tries to accept the connection. If everything works, requests from the client and responses from the server then can flow through the channel until this is closed on either end, thereby breaking the connection.

An iterative server, which is suited for development only, handles connected clients one at a time to completion: the first client is handled from start to finish, then the second, and so on. The downside is that the handling of a particular client may hang, which then starves all the clients waiting behind. A production-grade server would be concurrent, typically using some mix of multi-processing and multi-threading. For example, the Nginx web server on my desktop machine has a pool of four worker processes that can handle client requests concurrently. The following code example keeps the clutter to a minimum by using an iterative server; the focus thus remains on the basic API, not on concurrency.

Finally, the socket API has evolved significantly over time as various POSIX refinements have emerged. The current sample code for server and client is deliberately simple but underscores the bidirectional aspect of a stream-based socket connection. Here's a summary of the flow of control, with the server started in a terminal then the client started in a separate terminal:

  * The server awaits client connections and, given a successful connection, reads the bytes from the client.

  * To underscore the two-way conversation, the server echoes back to the client the bytes received from the client. These bytes are ASCII character codes, which make up book titles.

  * The client writes book titles to the server process and then reads the same titles echoed from the server. Both the server and the client print the titles to the screen. Here is the server's output, essentially the same as the client's:

```
Listening on port 9876 for clients...
War and Peace
Pride and Prejudice
The Sound and the Fury
```




#### Example 1. The socket server

```
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/tcp.h>
#include <arpa/inet.h>
#include "sock.h"

void report(const char* msg, int terminate) {
  perror(msg);
  if (terminate) exit(-1); /* failure */
}

int main() {
  int fd = socket(AF_INET,     /* network versus AF_LOCAL */
                  SOCK_STREAM, /* reliable, bidirectional, arbitrary payload size */
                  0);          /* system picks underlying protocol (TCP) */
  if (fd < 0) report("socket", 1); /* terminate */

  /* bind the server's local address in memory */
  struct sockaddr_in saddr;
  memset(&saddr, 0, sizeof(saddr));          /* clear the bytes */
  saddr.sin_family = AF_INET;                /* versus AF_LOCAL */
  saddr.sin_addr.s_addr = htonl(INADDR_ANY); /* host-to-network endian */
  saddr.sin_port = htons(PortNumber);        /* for listening */

  if (bind(fd, (struct sockaddr *) &saddr, sizeof(saddr)) < 0)
    report("bind", 1); /* terminate */

  /* listen to the socket */
  if (listen(fd, MaxConnects) < 0) /* listen for clients, up to MaxConnects */
    report("listen", 1); /* terminate */

  fprintf(stderr, "Listening on port %i for clients...\n", PortNumber);
  /* a server traditionally listens indefinitely */
  while (1) {
    struct sockaddr_in caddr; /* client address */
    int len = sizeof(caddr);  /* address length could change */

    int client_fd = accept(fd, (struct sockaddr*) &caddr, &len);  /* accept blocks */
    if (client_fd < 0) {
      report("accept", 0); /* don't terminate, though there's a problem */
      continue;
    }

    /* read from client */
    int i;
    for (i = 0; i < ConversationLen; i++) {
      char buffer[BuffSize + 1];
      memset(buffer, '\0', sizeof(buffer));
      int count = read(client_fd, buffer, sizeof(buffer));
      if (count > 0) {
        puts(buffer);
        write(client_fd, buffer, sizeof(buffer)); /* echo as confirmation */
      }
    }
    close(client_fd); /* break connection */
  }  /* while(1) */
  return 0;
}
```

The server program above performs the classic four-step to ready itself for client requests and then to accept individual requests. Each step is named after a system function that the server calls:

  1. **socket(…)** : get a file descriptor for the socket connection
  2. **bind(…)** : bind the socket to an address on the server's host
  3. **listen(…)** : listen for client requests
  4. **accept(…)** : accept a particular client request



The **socket** call in full is:

```
int sockfd = socket(AF_INET,      /* versus AF_LOCAL */
                    SOCK_STREAM,  /* reliable, bidirectional */
                    0);           /* system picks protocol (TCP) */
```

The first argument specifies a network socket as opposed to an IPC socket. There are several options for the second argument, but **SOCK_STREAM** and **SOCK_DGRAM** (datagram) are likely the most used. A stream-based socket supports a reliable channel in which lost or altered messages are reported; the channel is bidirectional, and the payloads from one side to the other can be arbitrary in size. By contrast, a datagram-based socket is unreliable (best try), unidirectional, and requires fixed-sized payloads. The third argument to **socket** specifies the protocol. For the stream-based socket in play here, there is a single choice, which the zero represents: TCP. Because a successful call to **socket** returns the familiar file descriptor, a socket is written and read with the same syntax as, for example, a local file.

The **bind** call is the most complicated, as it reflects various refinements in the socket API. The point of interest is that this call binds the socket to a memory address on the server machine. However, the **listen** call is straightforward:

```
if (listen(fd, MaxConnects) < 0)
```

The first argument is the socket's file descriptor and the second specifies how many client connections can be accommodated before the server issues a connection refused error on an attempted connection. ( **MaxConnects** is set to 8 in the header file sock.h.)

The **accept** call defaults to a blocking wait: the server does nothing until a client attempts to connect and then proceeds. The **accept** function returns **-1** to indicate an error. If the call succeeds, it returns another file descriptor—for a read/write socket in contrast to the accepting socket referenced by the first argument in the **accept** call. The server uses the read/write socket to read requests from the client and to write responses back. The accepting socket is used only to accept client connections.

By design, a server runs indefinitely. Accordingly, the server can be terminated with a **Ctrl+C** from the command line.

#### Example 2. The socket client

```
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#include "sock.h"

const char* books[] = {"War and Peace",
                       "Pride and Prejudice",
                       "The Sound and the Fury"};

void report(const char* msg, int terminate) {
  perror(msg);
  if (terminate) exit(-1); /* failure */
}

int main() {
  /* fd for the socket */
  int sockfd = socket(AF_INET,      /* versus AF_LOCAL */
                      SOCK_STREAM,  /* reliable, bidirectional */
                      0);           /* system picks protocol (TCP) */
  if (sockfd < 0) report("socket", 1); /* terminate */

  /* get the address of the host */
  struct hostent* hptr = gethostbyname(Host); /* localhost: 127.0.0.1 */
  if (!hptr) report("gethostbyname", 1); /* is hptr NULL? */
  if (hptr->h_addrtype != AF_INET)       /* versus AF_LOCAL */
    report("bad address family", 1);

  /* connect to the server: configure server's address 1st */
  struct sockaddr_in saddr;
  memset(&saddr, 0, sizeof(saddr));
  saddr.sin_family = AF_INET;
  saddr.sin_addr.s_addr =
     ((struct in_addr*) hptr->h_addr_list[0])->s_addr;
  saddr.sin_port = htons(PortNumber); /* port number in big-endian */

  if (connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr)) < 0)
    report("connect", 1);

  /* Write some stuff and read the echoes. */
  puts("Connect to server, about to write some stuff...");
  int i;
  for (i = 0; i < ConversationLen; i++) {
    if (write(sockfd, books[i], strlen(books[i])) > 0) {
      /* get confirmation echoed from server and print */
      char buffer[BuffSize + 1];
      memset(buffer, '\0', sizeof(buffer));
      if (read(sockfd, buffer, sizeof(buffer)) > 0)
        puts(buffer);
    }
  }
  puts("Client done, about to exit...");
  close(sockfd); /* close the connection */
  return 0;
}
```

The client program's setup code is similar to the server's. The principal difference between the two is that the client neither listens nor accepts, but instead connects:

```
if (connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr)) < 0)
```

The **connect** call might fail for several reasons; for example, the client has the wrong server address or too many clients are already connected to the server. If the **connect** operation succeeds, the client writes requests and then reads the echoed responses in a **for** loop. After the conversation, both the server and the client **close** the read/write socket, although a close operation on either side is sufficient to close the connection. The client exits thereafter but, as noted earlier, the server remains open for business.

The socket example, with request messages echoed back to the client, hints at the possibilities of arbitrarily rich conversations between the server and the client. Perhaps this is the chief appeal of sockets. It is common on modern systems for client applications (e.g., a database client) to communicate with a server through a socket. As noted earlier, local IPC sockets and network sockets differ only in a few implementation details; in general, IPC sockets have lower overhead and better performance. The communication API is essentially the same for both.

### Signals

A signal interrupts an executing program and, in this sense, communicates with it. Most signals can be either ignored (blocked) or handled (through designated code), with **SIGSTOP** (pause) and **SIGKILL** (terminate immediately) as the two notable exceptions. Symbolic constants such as **SIGKILL** have integer values, in this case, 9.

Signals can arise in user interaction. For example, a user hits **Ctrl+C** from the command line to terminate a program started from the command-line; **Ctrl+C** generates a **SIGTERM** signal. **SIGTERM** for terminate, unlike **SIGKILL** , can be either blocked or handled. One process also can signal another, thereby making signals an IPC mechanism.

Consider how a multi-processing application such as the Nginx web server might be shut down gracefully from another process. The **kill** function:

```
int kill(pid_t pid, int signum); /* declaration */
```

can be used by one process to terminate another process or group of processes. If the first argument to function **kill** is greater than zero, this argument is treated as the pid (process ID) of the targeted process; if the argument is zero, the argument identifies the group of processes to which the signal sender belongs.

The second argument to **kill** is either a standard signal number (e.g., **SIGTERM** or **SIGKILL** ) or 0, which makes the call to **signal** a query about whether the pid in the first argument is indeed valid. The graceful shutdown of a multi-processing application thus could be accomplished by sending a terminate signal—a call to the **kill** function with **SIGTERM** as the second argument—to the group of processes that make up the application. (The Nginx master process could terminate the worker processes with a call to **kill** and then exit itself.) The **kill** function, like so many library functions, houses power and flexibility in a simple invocation syntax.

#### Example 3. The graceful shutdown of a multi-processing system

```
#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

void graceful(int signum) {
  printf("\tChild confirming received signal: %i\n", signum);
  puts("\tChild about to terminate gracefully...");
  sleep(1);
  puts("\tChild terminating now...");
  _exit(0); /* fast-track notification of parent */
}

void set_handler() {
  struct sigaction current;
  sigemptyset(&current.sa_mask);         /* clear the signal set */
  current.sa_flags = 0;                  /* enables setting sa_handler, not sa_action */
  current.sa_handler = graceful;         /* specify a handler */
  sigaction(SIGTERM, &current, NULL);    /* register the handler */
}

void child_code() {
  set_handler();

  while (1) {   /** loop until interrupted **/
    sleep(1);
    puts("\tChild just woke up, but going back to sleep.");
  }
}

void parent_code(pid_t cpid) {
  puts("Parent sleeping for a time...");
  sleep(5);

  /* Try to terminate child. */
  if (-1 == kill(cpid, SIGTERM)) {
    perror("kill");
    exit(-1);
  }
  wait(NULL); /** wait for child to terminate **/
  puts("My child terminated, about to exit myself...");
}

int main() {
  pid_t pid = fork();
  if (pid < 0) {
    perror("fork");
    return -1; /* error */
  }
  if (0 == pid)
    child_code();
  else
    parent_code(pid);
  return 0;  /* normal */
}
```

The shutdown program above simulates the graceful shutdown of a multi-processing system, in this case, a simple one consisting of a parent process and a single child process. The simulation works as follows:

  * The parent process tries to fork a child. If the fork succeeds, each process executes its own code: the child executes the function **child_code** , and the parent executes the function **parent_code**.
  * The child process goes into a potentially infinite loop in which the child sleeps for a second, prints a message, goes back to sleep, and so on. It is precisely a **SIGTERM** signal from the parent that causes the child to execute the signal-handling callback function **graceful**. The signal thus breaks the child process out of its loop and sets up the graceful termination of both the child and the parent. The child prints a message before terminating.
  * The parent process, after forking the child, sleeps for five seconds so that the child can execute for a while; of course, the child mostly sleeps in this simulation. The parent then calls the **kill** function with **SIGTERM** as the second argument, waits for the child to terminate, and then exits.



Here is the output from a sample run:

```
% ./shutdown
Parent sleeping for a time...
        Child just woke up, but going back to sleep.
        Child just woke up, but going back to sleep.
        Child just woke up, but going back to sleep.
        Child just woke up, but going back to sleep.
        Child confirming received signal: 15  ## SIGTERM is 15
        Child about to terminate gracefully...
        Child terminating now...
My child terminated, about to exit myself...
```

For the signal handling, the example uses the **sigaction** library function (POSIX recommended) rather than the legacy **signal** function, which has portability issues. Here are the code segments of chief interest:

  * If the call to **fork** succeeds, the parent executes the **parent_code** function and the child executes the **child_code** function. The parent waits for five seconds before signaling the child:

```
 puts("Parent sleeping for a time...");
sleep(5);
if (-1 == kill(cpid, SIGTERM)) {
...sleepkillcpidSIGTERM...
```

If the **kill** call succeeds, the parent does a **wait** on the child's termination to prevent the child from becoming a permanent zombie; after the wait, the parent exits.

  * The **child_code** function first calls **set_handler** and then goes into its potentially infinite sleeping loop. Here is the **set_handler** function for review:

```
 void set_handler() {
  struct sigaction current;            /* current setup */
  sigemptyset(&current.sa_mask);       /* clear the signal set */
  current.sa_flags = 0;                /* for setting sa_handler, not sa_action */
  current.sa_handler = graceful;       /* specify a handler */
  sigaction(SIGTERM, &current, NULL);  /* register the handler */
}
```

The first three lines are preparation. The fourth statement sets the handler to the function **graceful** , which prints some messages before calling **_exit** to terminate. The fifth and last statement then registers the handler with the system through the call to **sigaction**. The first argument to **sigaction** is **SIGTERM** for terminate, the second is the current **sigaction** setup, and the last argument ( **NULL** in this case) can be used to save a previous **sigaction** setup, perhaps for later use.




Using signals for IPC is indeed a minimalist approach, but a tried-and-true one at that. IPC through signals clearly belongs in the IPC toolbox.

### Wrapping up this series

These three articles on IPC have covered the following mechanisms through code examples:

  * Shared files
  * Shared memory (with semaphores)
  * Pipes (named and unnamed)
  * Message queues
  * Sockets
  * Signals



Even today, when thread-centric languages such as Java, C#, and Go have become so popular, IPC remains appealing because concurrency through multi-processing has an obvious advantage over multi-threading: every process, by default, has its own address space, which rules out memory-based race conditions in multi-processing unless the IPC mechanism of shared memory is brought into play. (Shared memory must be locked in both multi-processing and multi-threading for safe concurrency.) Anyone who has written even an elementary multi-threading program with communication via shared variables knows how challenging it can be to write thread-safe yet clear, efficient code. Multi-processing with single-threaded processes remains a viable—indeed, quite appealing—way to take advantage of today's multi-processor machines without the inherent risk of memory-based race conditions.

There is no simple answer, of course, to the question of which among the IPC mechanisms is the best. Each involves a trade-off typical in programming: simplicity versus functionality. Signals, for example, are a relatively simple IPC mechanism but do not support rich conversations among processes. If such a conversion is needed, then one of the other choices is more appropriate. Shared files with locking is reasonably straightforward, but shared files may not perform well enough if processes need to share massive data streams; pipes or even sockets, with more complicated APIs, might be a better choice. Let the problem at hand guide the choice.

Although the sample code ([available on my website][4]) is all in C, other programming languages often provide thin wrappers around these IPC mechanisms. The code examples are short and simple enough, I hope, to encourage you to experiment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/interprocess-communication-linux-networking

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Inter-process_communication
[2]: https://opensource.com/article/19/4/interprocess-communication-ipc-linux-part-1
[3]: https://opensource.com/article/19/4/interprocess-communication-ipc-linux-part-2
[4]: http://condor.depaul.edu/mkalin
