[#]: collector: (lujun9972)
[#]: translator: (FSSlc)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10845-1.html)
[#]: subject: (Inter-process communication in Linux: Using pipes and message queues)
[#]: via: (https://opensource.com/article/19/4/interprocess-communication-linux-channels)
[#]: author: (Marty Kalin https://opensource.com/users/mkalindepauledu)

Linux 下的进程间通信：使用管道和消息队列
======

> 学习在 Linux 中进程是如何与其他进程进行同步的。

![Chat bubbles][1]

本篇是 Linux 下[进程间通信][2]（IPC）系列的第二篇文章。[第一篇文章][3] 聚焦于通过共享文件和共享内存段这样的共享存储来进行 IPC。这篇文件的重点将转向管道，它是连接需要通信的进程之间的通道。管道拥有一个*写端*用于写入字节数据，还有一个*读端*用于按照先入先出的顺序读入这些字节数据。而这些字节数据可能代表任何东西：数字、员工记录、数字电影等等。

管道有两种类型，命名管道和无名管道，都可以交互式的在命令行或程序中使用它们；相关的例子在下面展示。这篇文章也将介绍内存队列，尽管它们有些过时了，但它们不应该受这样的待遇。

在本系列的第一篇文章中的示例代码承认了在 IPC 中可能受到竞争条件（不管是基于文件的还是基于内存的）的威胁。自然地我们也会考虑基于管道的 IPC 的安全并发问题，这个也将在本文中提及。针对管道和内存队列的例子将会使用 POSIX 推荐使用的 API，POSIX 的一个核心目标就是线程安全。

请查看一些 [mq_open 函数的 man 页][4]，这个函数属于内存队列的 API。这个 man 页中有关 [特性][5] 的章节带有一个小表格：

接口 | 特性 | 值
---|---|---
`mq_open()` | 线程安全 | MT-Safe

上面的 MT-Safe（MT 指的是<ruby>多线程<rt>multi-threaded</rt></ruby>）意味着 `mq_open` 函数是线程安全的，进而暗示是进程安全的：一个进程的执行和它的一个线程执行的过程类似，假如竞争条件不会发生在处于*相同*进程的线程中，那么这样的条件也不会发生在处于不同进程的线程中。MT-Safe 特性保证了调用 `mq_open` 时不会出现竞争条件。一般来说，基于通道的 IPC 是并发安全的，尽管在下面例子中会出现一个有关警告的注意事项。

### 无名管道

首先让我们通过一个特意构造的命令行例子来展示无名管道是如何工作的。在所有的现代系统中，符号 `|` 在命令行中都代表一个无名管道。假设我们的命令行提示符为 `%`，接下来考虑下面的命令：

```shell
## 写入方在 | 左边，读取方在右边
% sleep 5 | echo "Hello, world!" 
```

`sleep` 和 `echo` 程序以不同的进程执行，无名管道允许它们进行通信。但是上面的例子被特意设计为没有通信发生。问候语 “Hello, world!” 出现在屏幕中，然后过了 5 秒后，命令行返回，暗示 `sleep` 和 `echo` 进程都已经结束了。这期间发生了什么呢？

在命令行中的竖线 `|` 的语法中，左边的进程（`sleep`）是写入方，右边的进程（`echo`）为读取方。默认情况下，读取方将会阻塞，直到从通道中能够读取到字节数据，而写入方在写完它的字节数据后，将发送 <ruby>流已终止<rt>end-of-stream</rt></ruby>的标志。（即便写入方过早终止了，一个流已终止的标志还是会发给读取方。）无名管道将保持到写入方和读取方都停止的那个时刻。

在上面的例子中，`sleep` 进程并没有向通道写入任何的字节数据，但在 5 秒后就终止了，这时将向通道发送一个流已终止的标志。与此同时，`echo` 进程立即向标准输出（屏幕）写入问候语，因为这个进程并不从通道中读入任何字节，所以它并没有等待。一旦 `sleep` 和 `echo` 进程都终止了，不会再用作通信的无名管道将会消失然后返回命令行提示符。

下面这个更加实用的示例将使用两个无名管道。我们假定文件 `test.dat` 的内容如下：

```
this
is
the
way
the
world
ends
```

下面的命令：

```
% cat test.dat | sort | uniq
```

会将 `cat`（<ruby>连接<rt>concatenate</rt></ruby>的缩写）进程的输出通过管道传给 `sort` 进程以生成排序后的输出，然后将排序后的输出通过管道传给 `uniq` 进程以消除重复的记录（在本例中，会将两次出现的 “the” 缩减为一个）：

```
ends
is
the
this
way
world
```

下面展示的情景展示的是一个带有两个进程的程序通过一个无名管道通信来进行通信。

#### 示例 1. 两个进程通过一个无名管道来进行通信

```c
#include <sys/wait.h> /* wait */
#include <stdio.h>
#include <stdlib.h>   /* exit functions */
#include <unistd.h>   /* read, write, pipe, _exit */
#include <string.h>

#define ReadEnd  0
#define WriteEnd 1

void report_and_exit(const char* msg) {
  perror(msg);
  exit(-1);    /** failure **/
}

int main() {
  int pipeFDs[2]; /* two file descriptors */
  char buf;       /* 1-byte buffer */
  const char* msg = "Nature's first green is gold\n"; /* bytes to write */

  if (pipe(pipeFDs) < 0) report_and_exit("pipeFD");
  pid_t cpid = fork();                                /* fork a child process */
  if (cpid < 0) report_and_exit("fork");              /* check for failure */

  if (0 == cpid) {    /*** child ***/                 /* child process */
    close(pipeFDs[WriteEnd]);                         /* child reads, doesn't write */

    while (read(pipeFDs[ReadEnd], &buf, 1) > 0)       /* read until end of byte stream */
      write(STDOUT_FILENO, &buf, sizeof(buf));        /* echo to the standard output */

    close(pipeFDs[ReadEnd]);                          /* close the ReadEnd: all done */
    _exit(0);                                         /* exit and notify parent at once  */
  }
  else {              /*** parent ***/
    close(pipeFDs[ReadEnd]);                          /* parent writes, doesn't read */

    write(pipeFDs[WriteEnd], msg, strlen(msg));       /* write the bytes to the pipe */
    close(pipeFDs[WriteEnd]);                         /* done writing: generate eof */

    wait(NULL);                                       /* wait for child to exit */
    exit(0);                                          /* exit normally */
  }
  return 0;
}
```

上面名为 `pipeUN` 的程序使用系统函数 `fork` 来创建一个进程。尽管这个程序只有一个单一的源文件，在它正确执行的情况下将会发生多进程的情况。

> 下面的内容是对库函数 `fork` 如何工作的一个简要回顾：

>  * `fork` 函数由*父*进程调用，在失败时返回 `-1` 给父进程。在 `pipeUN` 这个例子中，相应的调用是：

>  ```c
pid_t cpid = fork(); /* called in parent */
```

>  函数调用后的返回值也被保存下来了。在这个例子中，保存在整数类型 `pid_t` 的变量 `cpid` 中。（每个进程有它自己的*进程 ID*，这是一个非负的整数，用来标记进程）。复刻一个新的进程可能会因为多种原因而失败，包括*进程表*满了的原因，这个结构由系统维持，以此来追踪进程状态。明确地说，僵尸进程假如没有被处理掉，将可能引起进程表被填满的错误。
>  * 假如 `fork` 调用成功，则它将创建一个新的子进程，向父进程返回一个值，向子进程返回另外的一个值。在调用 `fork` 后父进程和子进程都将执行相同的代码。（子进程继承了到此为止父进程中声明的所有变量的拷贝），特别地，一次成功的 `fork` 调用将返回如下的东西：
>    * 向子进程返回 `0`
>    * 向父进程返回子进程的进程 ID
>  * 在一次成功的 `fork` 调用后，一个 `if`/`else` 或等价的结构将会被用来隔离针对父进程和子进程的代码。在这个例子中，相应的声明为：

>  ```c
if (0 == cpid) { /*** child ***/
...
}
else { /*** parent ***/
...
} 
```

假如成功地复刻出了一个子进程，`pipeUN` 程序将像下面这样去执行。在一个整数的数列里：

```c
int pipeFDs[2]; /* two file descriptors */
```

来保存两个文件描述符，一个用来向管道中写入，另一个从管道中写入。（数组元素 `pipeFDs[0]` 是读端的文件描述符，元素 `pipeFDs[1]` 是写端的文件描述符。）在调用 `fork` 之前，对系统 `pipe` 函数的成功调用，将立刻使得这个数组获得两个文件描述符：

```c
if (pipe(pipeFDs) < 0) report_and_exit("pipeFD");
```

父进程和子进程现在都有了文件描述符的副本。但*分离关注点*模式意味着每个进程恰好只需要一个描述符。在这个例子中，父进程负责写入，而子进程负责读取，尽管这样的角色分配可以反过来。在 `if` 子句中的第一个语句将用于关闭管道的读端：

```c
close(pipeFDs[WriteEnd]); /* called in child code */
```

在父进程中的 `else` 子句将会关闭管道的读端：

```c
close(pipeFDs[ReadEnd]); /* called in parent code */
```

然后父进程将向无名管道中写入某些字节数据（ASCII 代码），子进程读取这些数据，然后向标准输出中回放它们。

在这个程序中还需要澄清的一点是在父进程代码中的 `wait` 函数。一旦被创建后，子进程很大程度上独立于它的父进程，正如简短的 `pipeUN` 程序所展示的那样。子进程可以执行任意的代码，而它们可能与父进程完全没有关系。但是，假如当子进程终止时，系统将会通过一个信号来通知父进程。

要是父进程在子进程之前终止又该如何呢？在这种情形下，除非采取了预防措施，子进程将会变成在进程表中的一个*僵尸*进程。预防措施有两大类型：第一种是让父进程去通知系统，告诉系统它对子进程的终止没有任何兴趣：

```c
signal(SIGCHLD, SIG_IGN); /* in parent: ignore notification */
```

第二种方法是在子进程终止时，让父进程执行一个 `wait`。这样就确保了父进程可以独立于子进程而存在。在 `pipeUN` 程序中使用了第二种方法，其中父进程的代码使用的是下面的调用：

```c
wait(NULL); /* called in parent */
```

这个对 `wait` 的调用意味着*一直等待直到任意一个子进程的终止发生*，因此在 `pipeUN` 程序中，只有一个子进程。（其中的 `NULL` 参数可以被替换为一个保存有子程序退出状态的整数变量的地址。）对于更细粒度的控制，还可以使用更灵活的 `waitpid` 函数，例如特别指定多个子进程中的某一个。

`pipeUN` 将会采取另一个预防措施。当父进程结束了等待，父进程将会调用常规的 `exit` 函数去退出。对应的，子进程将会调用 `_exit` 变种来退出，这类变种将快速跟踪终止相关的通知。在效果上，子进程会告诉系统立刻去通知父进程它的这个子进程已经终止了。 

假如两个进程向相同的无名管道中写入内容，字节数据会交错吗？例如，假如进程 P1 向管道写入内容：

```
foo bar
```

同时进程 P2 并发地写入：

```
baz baz
```

到相同的管道，最后的结果似乎是管道中的内容将会是任意错乱的，例如像这样：

```
baz foo baz bar
```

只要没有写入超过 `PIPE_BUF` 字节，POSIX 标准就能确保写入不会交错。在 Linux 系统中， `PIPE_BUF` 的大小是 4096 字节。对于管道我更喜欢只有一个写入方和一个读取方，从而绕过这个问题。

### 命名管道

无名管道没有备份文件：系统将维持一个内存缓存来将字节数据从写方传给读方。一旦写方和读方终止，这个缓存将会被回收，进而无名管道消失。相反的，命名管道有备份文件和一个不同的 API。

下面让我们通过另一个命令行示例来了解命名管道的要点。下面是具体的步骤：

* 开启两个终端。这两个终端的工作目录应该相同。
* 在其中一个终端中，键入下面的两个命令（命令行提示符仍然是 `%`，我的注释以 `##` 打头。）：

  ```shell
% mkfifo tester ## 创建一个备份文件，名为 tester
% cat tester    ## 将管道的内容输出到 stdout 
```

  在最开始，没有任何东西会出现在终端中，因为到现在为止没有在命名管道中写入任何东西。
* 在第二个终端中输入下面的命令：

  ```shell
% cat > tester ## redirect keyboard input to the pipe
hello, world!  ## then hit Return key
bye, bye       ## ditto
<Control-C>    ## terminate session with a Control-C
```

  无论在这个终端中输入什么，它都会在另一个终端中显示出来。一旦键入 `Ctrl+C`，就会回到正常的命令行提示符，因为管道已经被关闭了。
* 通过移除实现命名管道的文件来进行清理：

  ```shell
% unlink tester
```

正如 `mkfifo` 程序的名字所暗示的那样，命名管道也被叫做 FIFO，因为第一个进入的字节，就会第一个出，其他的类似。有一个名为 `mkfifo` 的库函数，用它可以在程序中创建一个命名管道，它将在下一个示例中被用到，该示例由两个进程组成：一个向命名管道写入，而另一个从该管道读取。

#### 示例 2. fifoWriter 程序

```c
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <time.h>
#include <stdlib.h>
#include <stdio.h>

#define MaxLoops         12000   /* outer loop */
#define ChunkSize           16   /* how many written at a time */
#define IntsPerChunk         4   /* four 4-byte ints per chunk */
#define MaxZs              250   /* max microseconds to sleep */

int main() {
  const char* pipeName = "./fifoChannel";
  mkfifo(pipeName, 0666);                      /* read/write for user/group/others */
  int fd = open(pipeName, O_CREAT | O_WRONLY); /* open as write-only */
  if (fd < 0) return -1;                       /* can't go on */

  int i;
  for (i = 0; i < MaxLoops; i++) {          /* write MaxWrites times */
    int j;
    for (j = 0; j < ChunkSize; j++) {       /* each time, write ChunkSize bytes */
      int k;
      int chunk[IntsPerChunk];
      for (k = 0; k < IntsPerChunk; k++)
        chunk[k] = rand();
      write(fd, chunk, sizeof(chunk));
    }
    usleep((rand() % MaxZs) + 1);           /* pause a bit for realism */
  }

  close(fd);           /* close pipe: generates an end-of-stream marker */
  unlink(pipeName);    /* unlink from the implementing file */
  printf("%i ints sent to the pipe.\n", MaxLoops * ChunkSize * IntsPerChunk);

  return 0;
}
```

上面的 `fifoWriter` 程序可以被总结为如下： 

* 首先程序创建了一个命名管道用来写入数据：

  ```c
mkfifo(pipeName, 0666); /* read/write perms for user/group/others */
int fd = open(pipeName, O_CREAT | O_WRONLY);
```

  其中的 `pipeName` 是备份文件的名字，传递给 `mkfifo` 作为它的第一个参数。接着命名管道通过我们熟悉的 `open` 函数调用被打开，而这个函数将会返回一个文件描述符。
* 在实现层面上，`fifoWriter` 不会一次性将所有的数据都写入，而是写入一个块，然后休息随机数目的微秒时间，接着再循环往复。总的来说，有 768000 个 4 字节整数值被写入到命名管道中。
* 在关闭命名管道后，`fifoWriter` 也将使用 `unlink` 取消对该文件的连接。

  ```c
close(fd); /* close pipe: generates end-of-stream marker */
unlink(pipeName); /* unlink from the implementing file */
```

  一旦连接到管道的每个进程都执行了 `unlink` 操作后，系统将回收这些备份文件。在这个例子中，只有两个这样的进程 `fifoWriter` 和 `fifoReader`，它们都做了 `unlink` 操作。

这个两个程序应该在不同终端的相同工作目录中执行。但是 `fifoWriter` 应该在 `fifoReader` 之前被启动，因为需要 `fifoWriter` 去创建管道。然后 `fifoReader` 才能够获取到刚被创建的命名管道。

#### 示例 3. fifoReader 程序

```c
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
    if (0 == count) break;                  /* end of stream */
    else if (count == sizeof(int)) {        /* read a 4-byte int value */
      total++;
      if (is_prime(next)) primes_count++;
    }
  }

  close(fd);       /* close pipe from read end */
  unlink(file);    /* unlink from the underlying file */
  printf("Received ints: %u, primes: %u\n", total, primes_count);

  return 0;
}
```

上面的 `fifoReader` 的内容可以总结为如下：

* 因为 `fifoWriter` 已经创建了命名管道，所以 `fifoReader` 只需要利用标准的 `open` 调用来通过备份文件来获取到管道中的内容：

  ```c
const char* file = "./fifoChannel";
int fd = open(file, O_RDONLY);
```

  这个文件的是以只读打开的。
* 然后这个程序进入一个潜在的无限循环，在每次循环时，尝试读取 4 字节的块。`read` 调用：

  ```c
ssize_t count = read(fd, &next, sizeof(int));
```

  返回 0 来暗示该流的结束。在这种情况下，`fifoReader` 跳出循环，关闭命名管道，并在终止前 `unlink` 备份文件。
* 在读入 4 字节整数后，`fifoReader` 检查这个数是否为质数。这个操作代表了一个生产级别的读取器可能在接收到的字节数据上执行的逻辑操作。在示例运行中，在接收到的 768000 个整数中有 37682 个质数。

重复运行示例， `fifoReader` 将成功地读取 `fifoWriter` 写入的所有字节。这不是很让人惊讶的。这两个进程在相同的机器上执行，从而可以不用考虑网络相关的问题。命名管道是一个可信且高效的 IPC 机制，因而被广泛使用。

下面是这两个程序的输出，它们在不同的终端中启动，但处于相同的工作目录：

```shell
% ./fifoWriter
768000 ints sent to the pipe.
###
% ./fifoReader
Received ints: 768000, primes: 37682
```

### 消息队列

管道有着严格的先入先出行为：第一个被写入的字节将会第一个被读，第二个写入的字节将第二个被读，以此类推。消息队列可以做出相同的表现，但它又足够灵活，可以使得字节块可以不以先入先出的次序来接收。

正如它的名字所提示的那样，消息队列是一系列的消息，每个消息包含两部分：

* 荷载，一个字节序列（在 C 中是 char）
* 类型，以一个正整数值的形式给定，类型用来分类消息，为了更灵活的回收

看一下下面对一个消息队列的描述，每个消息由一个整数类型标记：

```
          +-+    +-+    +-+    +-+
sender--->|3|--->|2|--->|2|--->|1|--->receiver
          +-+    +-+    +-+    +-+
```

在上面展示的 4 个消息中，标记为 1 的是开头，即最接近接收端，然后另个标记为 2 的消息，最后接着一个标记为 3 的消息。假如按照严格的 FIFO 行为执行，消息将会以 1-2-2-3 这样的次序被接收。但是消息队列允许其他收取次序。例如，消息可以被接收方以 3-2-1-2 的次序接收。

`mqueue` 示例包含两个程序，`sender` 将向消息队列中写入数据，而 `receiver` 将从这个队列中读取数据。这两个程序都包含的头文件 `queue.h` 如下所示：

#### 示例 4. 头文件 queue.h

```c
#define ProjectId 123
#define PathName  "queue.h" /* any existing, accessible file would do */
#define MsgLen    4
#define MsgCount  6

typedef struct { 
  long type;                 /* must be of type long */ 
  char payload[MsgLen + 1];  /* bytes in the message */  
} queuedMessage;
```

上面的头文件定义了一个名为 `queuedMessage` 的结构类型，它带有 `payload`（字节数组）和 `type`（整数）这两个域。该文件也定义了一些符号常数（使用 `#define` 语句），前两个常数被用来生成一个 `key`，而这个 `key` 反过来被用来获取一个消息队列的 ID。`ProjectId` 可以是任何正整数值，而 `PathName` 必须是一个存在的、可访问的文件，在这个示例中，指的是文件 `queue.h`。在 `sender` 和 `receiver` 中，它们都有的设定语句为：

```c
key_t key = ftok(PathName, ProjectId); /* generate key */
int qid = msgget(key, 0666 | IPC_CREAT); /* use key to get queue id */
```

ID `qid` 在效果上是消息队列文件描述符的对应物。

#### 示例 5. sender 程序

```c
#include <stdio.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdlib.h>
#include <string.h>
#include "queue.h"

void report_and_exit(const char* msg) {
  perror(msg);
  exit(-1); /* EXIT_FAILURE */
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
    strcpy(msg.payload, payloads[i]);

    /* send the message */
    msgsnd(qid, &msg, sizeof(msg), IPC_NOWAIT); /* don't block */
    printf("%s sent as type %i\n", msg.payload, (int) msg.type);
  }
  return 0;
}
```

上面的 `sender` 程序将发送出 6 个消息，每两个为一个类型：前两个是类型 1，接着的连个是类型 2，最后的两个为类型 3。发送的语句：

```c
msgsnd(qid, &msg, sizeof(msg), IPC_NOWAIT);
```

被配置为非阻塞的（`IPC_NOWAIT` 标志），是因为这里的消息体量上都很小。唯一的危险在于一个完整的序列将可能导致发送失败，而这个例子不会。下面的 `receiver` 程序也将使用 `IPC_NOWAIT` 标志来接收消息。

#### 示例 6. receiver 程序

```c
#include <stdio.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdlib.h>
#include "queue.h"

void report_and_exit(const char* msg) {
  perror(msg);
  exit(-1); /* EXIT_FAILURE */
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
      puts("msgrcv trouble...");
    printf("%s received as type %i\n", msg.payload, (int) msg.type);
  }

  /** remove the queue **/
  if (msgctl(qid, IPC_RMID, NULL) < 0)  /* NULL = 'no flags' */
    report_and_exit("trouble removing queue...");

  return 0;
}
```

这个 `receiver` 程序不会创建消息队列，尽管 API 尽管建议那样。在 `receiver` 中，对

```c
int qid = msgget(key, 0666 | IPC_CREAT);
```

的调用可能因为带有 `IPC_CREAT` 标志而具有误导性，但是这个标志的真实意义是*如果需要就创建，否则直接获取*。`sender` 程序调用 `msgsnd` 来发送消息，而 `receiver` 调用 `msgrcv` 来接收它们。在这个例子中，`sender` 以 1-1-2-2-3-3 的次序发送消息，但 `receiver` 接收它们的次序为 3-1-2-1-3-2，这显示消息队列没有被严格的 FIFO 行为所拘泥：

```shell
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

上面的输出显示 `sender` 和 `receiver` 可以在同一个终端中启动。输出也显示消息队列是持久的，即便 `sender` 进程在完成创建队列、向队列写数据、然后退出的整个过程后，该队列仍然存在。只有在 `receiver` 进程显式地调用 `msgctl` 来移除该队列，这个队列才会消失：

```c
if (msgctl(qid, IPC_RMID, NULL) < 0) /* remove queue */
```

### 总结

管道和消息队列的 API 在根本上来说都是单向的：一个进程写，然后另一个进程读。当然还存在双向命名管道的实现，但我认为这个 IPC 机制在它最为简单的时候反而是最佳的。正如前面提到的那样，消息队列已经不大受欢迎了，尽管没有找到什么特别好的原因来解释这个现象；而队列仍然是 IPC 工具箱中的一个工具。这个快速的 IPC 工具箱之旅将以第 3 部分（通过套接字和信号来示例 IPC）来终结。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/interprocess-communication-linux-channels

作者：[Marty Kalin][a]
选题：[lujun9972][b]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mkalindepauledu
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_communication_team.png?itok=CYfZ_gE7 (Chat bubbles)
[2]: https://en.wikipedia.org/wiki/Inter-process_communication
[3]: https://linux.cn/article-10826-1.html
[4]: http://man7.org/linux/man-pages/man2/mq_open.2.html
[5]: http://man7.org/linux/man-pages/man2/mq_open.2.html#ATTRIBUTES
[6]: http://www.opengroup.org/onlinepubs/009695399/functions/perror.html
[7]: http://www.opengroup.org/onlinepubs/009695399/functions/exit.html
[8]: http://www.opengroup.org/onlinepubs/009695399/functions/strlen.html
[9]: http://www.opengroup.org/onlinepubs/009695399/functions/rand.html
[10]: http://www.opengroup.org/onlinepubs/009695399/functions/printf.html
[11]: http://www.opengroup.org/onlinepubs/009695399/functions/strcpy.html
[12]: http://www.opengroup.org/onlinepubs/009695399/functions/puts.html
