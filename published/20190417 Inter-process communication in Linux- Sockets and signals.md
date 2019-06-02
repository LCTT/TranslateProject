[#]: collector: "lujun9972"
[#]: translator: "FSSlc"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10930-1.html"
[#]: subject: "Inter-process communication in Linux: Sockets and signals"
[#]: via: "https://opensource.com/article/19/4/interprocess-communication-linux-networking"
[#]: author: "Marty Kalin https://opensource.com/users/mkalindepauledu"

Linux 下的进程间通信：套接字和信号
======

> 学习在 Linux 中进程是如何与其他进程进行同步的。

![](https://img.linux.net.cn/data/attachment/album/201906/02/234437y6gig4tg4yy94356.jpg)

本篇是 Linux 下[进程间通信][1]（IPC）系列的第三篇同时也是最后一篇文章。[第一篇文章][2]聚焦在通过共享存储（文件和共享内存段）来进行 IPC，[第二篇文章][3]则通过管道（无名的或者命名的）及消息队列来达到相同的目的。这篇文章将目光从高处（套接字）然后到低处（信号）来关注 IPC。代码示例将用力地充实下面的解释细节。

### 套接字

正如管道有两种类型（命名和无名）一样，套接字也有两种类型。IPC 套接字（即 Unix 套接字）给予进程在相同设备（主机）上基于通道的通信能力；而网络套接字给予进程运行在不同主机的能力，因此也带来了网络通信的能力。网络套接字需要底层协议的支持，例如 TCP（传输控制协议）或 UDP（用户数据报协议）。

与之相反，IPC 套接字依赖于本地系统内核的支持来进行通信；特别的，IPC 通信使用一个本地的文件作为套接字地址。尽管这两种套接字的实现有所不同，但在本质上，IPC 套接字和网络套接字的 API 是一致的。接下来的例子将包含网络套接字的内容，但示例服务器和客户端程序可以在相同的机器上运行，因为服务器使用了 `localhost`（127.0.0.1）这个网络地址，该地址表示的是本地机器上的本地机器地址。

套接字以流的形式（下面将会讨论到）被配置为双向的，并且其控制遵循 C/S（客户端/服务器端）模式：客户端通过尝试连接一个服务器来初始化对话，而服务器端将尝试接受该连接。假如万事顺利，来自客户端的请求和来自服务器端的响应将通过管道进行传输，直到其中任意一方关闭该通道，从而断开这个连接。

一个迭代服务器（只适用于开发）将一直和连接它的客户端打交道：从最开始服务第一个客户端，然后到这个连接关闭，然后服务第二个客户端，循环往复。这种方式的一个缺点是处理一个特定的客户端可能会挂起，使得其他的客户端一直在后面等待。生产级别的服务器将是并发的，通常使用了多进程或者多线程的混合。例如，我台式机上的 Nginx 网络服务器有一个 4 个<ruby>工人<rt>worker</rt></ruby>的进程池，它们可以并发地处理客户端的请求。在下面的代码示例中，我们将使用迭代服务器，使得我们将要处理的问题保持在一个很小的规模，只关注基本的 API，而不去关心并发的问题。

最后，随着各种 POSIX 改进的出现，套接字 API 随着时间的推移而发生了显著的变化。当前针对服务器端和客户端的示例代码特意写的比较简单，但是它着重强调了基于流的套接字中连接的双方。下面是关于流控制的一个总结，其中服务器端在一个终端中开启，而客户端在另一个不同的终端中开启：

  * 服务器端等待客户端的连接，对于给定的一个成功连接，它就读取来自客户端的数据。
  * 为了强调是双方的会话，服务器端会对接收自客户端的数据做回应。这些数据都是 ASCII 字符代码，它们组成了一些书的标题。
  * 客户端将书的标题写给服务器端的进程，并从服务器端的回应中读取到相同的标题。然后客户端和服务器端都在屏幕上打印出标题。下面是服务器端的输出，客户端的输出也和它完全一样：

```
Listening on port 9876 for clients...
War and Peace
Pride and Prejudice
The Sound and the Fury
```

#### 示例 1. 使用套接字的客户端程序

```c
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
  int fd = socket(AF_INET,     /* network versus AF_LOCAL */
		  SOCK_STREAM, /* reliable, bidirectional: TCP */
		  0);          /* system picks underlying protocol */
  if (fd < 0) report("socket", 1); /* terminate */
  	
  /* bind the server's local address in memory */
  struct sockaddr_in saddr;
  memset(&saddr, 0, sizeof(saddr));          /* clear the bytes */
  saddr.sin_family = AF_INET;                /* versus AF_LOCAL */
  saddr.sin_addr.s_addr = htonl(INADDR_ANY); /* host-to-network endian */
  saddr.sin_port = htons(PortNumber);        /* for listening */
  
  if (bind(fd, (struct sockaddr *) &saddr, sizeof(saddr)) < 0)
    report("bind", 1); /* terminate */
	
  /* listen to the socket */
  if (listen(fd, MaxConnects) < 0) /* listen for clients, up to MaxConnects */
    report("listen", 1); /* terminate */

  fprintf(stderr, "Listening on port %i for clients...\n", PortNumber);
  /* a server traditionally listens indefinitely */
  while (1) {
    struct sockaddr_in caddr; /* client address */
    int len = sizeof(caddr);  /* address length could change */
    
    int client_fd = accept(fd, (struct sockaddr*) &caddr, &len);  /* accept blocks */
    if (client_fd < 0) {
      report("accept", 0); /* don't terminated, though there's a problem */
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
  }  /* while(1) */
  return 0;
}
```

上面的服务器端程序执行典型的 4 个步骤来准备回应客户端的请求，然后接受其他的独立请求。这里每一个步骤都以服务器端程序调用的系统函数来命名。

  1. `socket(…)`：为套接字连接获取一个文件描述符
  2. `bind(…)`：将套接字和服务器主机上的一个地址进行绑定
  3. `listen(…)`：监听客户端请求
  4. `accept(…)`：接受一个特定的客户端请求

上面的 `socket` 调用的完整形式为：

```
int sockfd = socket(AF_INET,      /* versus AF_LOCAL */
                    SOCK_STREAM,  /* reliable, bidirectional */
                    0);           /* system picks protocol (TCP) */
```

第一个参数特别指定了使用的是一个网络套接字，而不是 IPC 套接字。对于第二个参数有多种选项，但 `SOCK_STREAM` 和 `SOCK_DGRAM`（数据报）是最为常用的。基于流的套接字支持可信通道，在这种通道中如果发生了信息的丢失或者更改，都将会被报告。这种通道是双向的，并且从一端到另外一端的有效载荷在大小上可以是任意的。相反的，基于数据报的套接字大多是不可信的，没有方向性，并且需要固定大小的载荷。`socket` 的第三个参数特别指定了协议。对于这里展示的基于流的套接字，只有一种协议选择：TCP，在这里表示的 `0`。因为对 `socket` 的一次成功调用将返回相似的文件描述符，套接字可以被读写，对应的语法和读写一个本地文件是类似的。

对 `bind` 的调用是最为复杂的，因为它反映出了在套接字 API 方面上的各种改进。我们感兴趣的点是这个调用将一个套接字和服务器端所在机器中的一个内存地址进行绑定。但对 `listen` 的调用就非常直接了：

```
if (listen(fd, MaxConnects) < 0)
```

第一个参数是套接字的文件描述符，第二个参数则指定了在服务器端处理一个拒绝连接错误之前，有多少个客户端连接被允许连接。（在头文件 `sock.h` 中 `MaxConnects` 的值被设置为 `8`。）

`accept` 调用默认将是一个阻塞等待：服务器端将不做任何事情直到一个客户端尝试连接它，然后进行处理。`accept` 函数返回的值如果是 `-1` 则暗示有错误发生。假如这个调用是成功的，则它将返回另一个文件描述符，这个文件描述符被用来指代另一个可读可写的套接字，它与 `accept` 调用中的第一个参数对应的接收套接字有所不同。服务器端使用这个可读可写的套接字来从客户端读取请求然后写回它的回应。接收套接字只被用于接受客户端的连接。

在设计上，服务器端可以一直运行下去。当然服务器端可以通过在命令行中使用 `Ctrl+C` 来终止它。

#### 示例 2. 使用套接字的客户端

```c
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
  int sockfd = socket(AF_INET,      /* versus AF_LOCAL */
		      SOCK_STREAM,  /* reliable, bidirectional */
		      0);           /* system picks protocol (TCP) */
  if (sockfd < 0) report("socket", 1); /* terminate */

  /* get the address of the host */
  struct hostent* hptr = gethostbyname(Host); /* localhost: 127.0.0.1 */ 
  if (!hptr) report("gethostbyname", 1); /* is hptr NULL? */
  if (hptr->h_addrtype != AF_INET)       /* versus AF_LOCAL */
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

客户端程序的设置代码和服务器端类似。两者主要的区别既不是在于监听也不在于接收，而是连接：

```
if (connect(sockfd, (struct sockaddr*) &saddr, sizeof(saddr)) < 0)
```

对 `connect` 的调用可能因为多种原因而导致失败，例如客户端拥有错误的服务器端地址或者已经有太多的客户端连接上了服务器端。假如 `connect` 操作成功，客户端将在一个 `for` 循环中，写入它的请求然后读取返回的响应。在会话后，服务器端和客户端都将调用 `close` 去关闭这个可读可写套接字，尽管任何一边的关闭操作就足以关闭它们之间的连接。此后客户端可以退出了，但正如前面提到的那样，服务器端可以一直保持开放以处理其他事务。

从上面的套接字示例中，我们看到了请求信息被回显给客户端，这使得客户端和服务器端之间拥有进行丰富对话的可能性。也许这就是套接字的主要魅力。在现代系统中，客户端应用（例如一个数据库客户端）和服务器端通过套接字进行通信非常常见。正如先前提及的那样，本地 IPC 套接字和网络套接字只在某些实现细节上面有所不同，一般来说，IPC 套接字有着更低的消耗和更好的性能。它们的通信 API 基本是一样的。

### 信号

信号会中断一个正在执行的程序，在这种意义下，就是用信号与这个程序进行通信。大多数的信号要么可以被忽略（阻塞）或者被处理（通过特别设计的代码）。`SIGSTOP` （暂停）和 `SIGKILL`（立即停止）是最应该提及的两种信号。这种符号常量有整数类型的值，例如 `SIGKILL` 对应的值为 `9`。

信号可以在与用户交互的情况下发生。例如，一个用户从命令行中敲了 `Ctrl+C` 来终止一个从命令行中启动的程序；`Ctrl+C` 将产生一个 `SIGTERM` 信号。`SIGTERM` 意即终止，它可以被阻塞或者被处理，而不像 `SIGKILL` 信号那样。一个进程也可以通过信号和另一个进程通信，这样使得信号也可以作为一种 IPC 机制。

考虑一下一个多进程应用，例如 Nginx 网络服务器是如何被另一个进程优雅地关闭的。`kill` 函数：

```
int kill(pid_t pid, int signum); /* declaration */
```

可以被一个进程用来终止另一个进程或者一组进程。假如 `kill` 函数的第一个参数是大于 `0` 的，那么这个参数将会被认为是目标进程的 `pid`（进程 ID），假如这个参数是 `0`，则这个参数将会被视作信号发送者所属的那组进程。

`kill` 的第二个参数要么是一个标准的信号数字（例如 `SIGTERM` 或 `SIGKILL`），要么是 `0` ，这将会对信号做一次询问，确认第一个参数中的 `pid` 是否是有效的。这样优雅地关闭一个多进程应用就可以通过向组成该应用的一组进程发送一个终止信号来完成，具体来说就是调用一个 `kill` 函数，使得这个调用的第二个参数是 `SIGTERM` 。（Nginx 主进程可以通过调用 `kill` 函数来终止其他工人进程，然后再停止自己。）就像许多库函数一样，`kill` 函数通过一个简单的可变语法拥有更多的能力和灵活性。

#### 示例 3. 一个多进程系统的优雅停止

```c
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

  while (1) {   /` loop until interrupted `/
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
  wait(NULL); /` wait for child to terminate `/
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

上面的停止程序模拟了一个多进程系统的优雅退出，在这个例子中，这个系统由一个父进程和一个子进程组成。这次模拟的工作流程如下：

  * 父进程尝试去 `fork` 一个子进程。假如这个 `fork` 操作成功了，每个进程就执行它自己的代码：子进程就执行函数 `child_code`，而父进程就执行函数 `parent_code`。
  * 子进程将会进入一个潜在的无限循环，在这个循环中子进程将睡眠一秒，然后打印一个信息，接着再次进入睡眠状态，以此循环往复。来自父进程的一个 `SIGTERM` 信号将引起子进程去执行一个信号处理回调函数 `graceful`。这样这个信号就使得子进程可以跳出循环，然后进行子进程和父进程之间的优雅终止。在终止之前，进程将打印一个信息。
  * 在 `fork` 一个子进程后，父进程将睡眠 5 秒，使得子进程可以执行一会儿；当然在这个模拟中，子进程大多数时间都在睡眠。然后父进程调用 `SIGTERM` 作为第二个参数的 `kill` 函数，等待子进程的终止，然后自己再终止。

下面是一次运行的输出：

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

对于信号的处理，上面的示例使用了 `sigaction` 库函数（POSIX 推荐的用法）而不是传统的 `signal` 函数，`signal` 函数有移植性问题。下面是我们主要关心的代码片段：

* 假如对 `fork` 的调用成功了，父进程将执行 `parent_code` 函数，而子进程将执行 `child_code` 函数。在给子进程发送信号之前，父进程将会等待 5 秒：

  ```
puts("Parent sleeping for a time...");
sleep(5);
if (-1 == kill(cpid, SIGTERM)) {
...sleepkillcpidSIGTERM...
```

  假如 `kill` 调用成功了，父进程将在子进程终止时做等待，使得子进程不会变成一个僵尸进程。在等待完成后，父进程再退出。

* `child_code` 函数首先调用 `set_handler` 然后进入它的可能永久睡眠的循环。下面是我们将要查看的 `set_handler` 函数：

  ```
void set_handler() {
  struct sigaction current;            /* current setup */
  sigemptyset(&current.sa_mask);       /* clear the signal set */
  current.sa_flags = 0;                /* for setting sa_handler, not sa_action */
  current.sa_handler = graceful;       /* specify a handler */
  sigaction(SIGTERM, &current, NULL);  /* register the handler */
}
```

  上面代码的前三行在做相关的准备。第四个语句将为 `graceful` 设定为句柄，它将在调用 `_exit` 来停止之前打印一些信息。第 5 行和最后一行的语句将通过调用 `sigaction` 来向系统注册上面的句柄。`sigaction` 的第一个参数是 `SIGTERM` ，用作终止；第二个参数是当前的 `sigaction` 设定，而最后的参数（在这个例子中是 `NULL` ）可被用来保存前面的 `sigaction` 设定，以备后面的可能使用。

使用信号来作为 IPC 的确是一个很轻量的方法，但确实值得尝试。通过信号来做 IPC 显然可以被归入 IPC 工具箱中。

### 这个系列的总结

在这个系列中，我们通过三篇有关 IPC 的文章，用示例代码介绍了如下机制：

  * 共享文件
  * 共享内存（通过信号量）
  * 管道（命名和无名）
  * 消息队列
  * 套接字
  * 信号

甚至在今天，在以线程为中心的语言，例如 Java、C# 和 Go 等变得越来越流行的情况下，IPC 仍然很受欢迎，因为相比于使用多线程，通过多进程来实现并发有着一个明显的优势：默认情况下，每个进程都有它自己的地址空间，除非使用了基于共享内存的 IPC 机制（为了达到安全的并发，竞争条件在多线程和多进程的时候必须被加上锁），在多进程中可以排除掉基于内存的竞争条件。对于任何一个写过即使是基本的通过共享变量来通信的多线程程序的人来说，他都会知道想要写一个清晰、高效、线程安全的代码是多么具有挑战性。使用单线程的多进程的确是很有吸引力的，这是一个切实可行的方式，使用它可以利用好今天多处理器的机器，而不需要面临基于内存的竞争条件的风险。

当然，没有一个简单的答案能够回答上述 IPC 机制中的哪一个更好。在编程中每一种 IPC 机制都会涉及到一个取舍问题：是追求简洁，还是追求功能强大。以信号来举例，它是一个相对简单的 IPC 机制，但并不支持多个进程之间的丰富对话。假如确实需要这样的对话，另外的选择可能会更合适一些。带有锁的共享文件则相对直接，但是当要处理大量共享的数据流时，共享文件并不能很高效地工作。管道，甚至是套接字，有着更复杂的 API，可能是更好的选择。让具体的问题去指导我们的选择吧。

尽管所有的示例代码（可以在[我的网站][4]上获取到）都是使用 C 写的，其他的编程语言也经常提供这些 IPC 机制的轻量包装。这些代码示例都足够短小简单，希望这样能够鼓励你去进行实验。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/interprocess-communication-linux-networking

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Inter-process_communication
[2]: https://linux.cn/article-10826-1.html
[3]: https://linux.cn/article-10845-1.html
[4]: http://condor.depaul.edu/mkalin
