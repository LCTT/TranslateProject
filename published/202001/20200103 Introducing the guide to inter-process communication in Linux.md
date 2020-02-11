[#]: collector: (lujun9972)
[#]: translator: (laingke)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11832-1.html)
[#]: subject: (Introducing the guide to inter-process communication in Linux)
[#]: via: (https://opensource.com/article/20/1/inter-process-communication-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

免费电子书《Linux 进程间通信指南》介绍
======

> 这本免费的电子书使经验丰富的程序员更深入了解 Linux 中进程间通信（IPC）的核心概念和机制。

![](https://img.linux.net.cn/data/attachment/album/202001/30/115631jthl0h61zhhmwpv1.jpeg)

让一个软件过程与另一个软件过程进行对话是一个微妙的平衡行为。但是，它对于应用程序而言可能是至关重要的功能，因此这是任何从事复杂项目的程序员都必须解决的问题。你的应用程序是否需要启动由其它软件处理的工作；监视外设或网络上正在执行的操作；或者检测来自其它来源的信号，当你的软件需要依赖其自身代码之外的东西来知道下一步做什么或什么时候做时，你就需要考虑<ruby>进程间通信<rt>inter-process communication</rt></ruby>（IPC）。

这在 Unix 操作系统上已经由来已久了，这可能是因为人们早期预期软件会来自各种来源。按照相同的传统，Linux 提供了一些同样的 IPC 接口和一些新接口。Linux 内核具有多种 IPC 方法，[util-linux 包][2]包含了 `ipcmk`、`ipcrm`、`ipcs` 和 `lsipc` 命令，用于监视和管理 IPC 消息。

### 显示进程间通信信息

在尝试 IPC 之前，你应该知道系统上已经有哪些 IPC 设施。`lsipc` 命令提供了该信息。

```
RESOURCE DESCRIPTION               LIMIT  USED  USE%
MSGMNI   Number of message queues  32000     0 0.00%
MSGMAX   Max size of message (byt.. 8192     -     -
MSGMNB   Default max size of queue 16384     -     -
SHMMNI   Shared memory segments     4096    79 1.93%
SHMALL   Shared memory pages       184[...] 25452 0.00%
SHMMAX   Max size of shared memory 18446744073692774399
SHMMIN   Min size of shared memory     1     -     -
SEMMNI   Number of semaphore ident 32000     0 0.00%
SEMMNS   Total number of semaphore 1024000.. 0 0.00%
SEMMSL   Max semaphores per semap  32000     -     -
SEMOPM   Max number of operations p  500     -     -
SEMVMX   Semaphore max value       32767     -     -
```

你可能注意到，这个示例清单包含三种不同类型的 IPC 机制，每种机制在 Linux 内核中都是可用的：消息（MSG）、共享内存（SHM）和信号量（SEM）。你可以用 `ipcs` 命令查看每个子系统的当前活动：

```
$ ipcs

------ Message Queues Creators/Owners ---
msqid     perms     cuid      cgid  [...]

------ Shared Memory Segment Creators/Owners
shmid     perms    cuid    cgid  [...]
557056    700      seth    users [...]
3571713   700      seth    users [...]
2654210   600      seth    users [...]
2457603   700      seth    users [...]

------ Semaphore Arrays Creators/Owners ---
semid     perms     cuid      cgid  [...]
```

这表明当前没有消息或信号量阵列，但是使用了一些共享内存段。

你可以在系统上执行一个简单的示例，这样就可以看到正在工作的系统之一。它涉及到一些 C 代码，所以你必须在系统上有构建工具。必须安装这些软件包才能从源代码构建软件，这些软件包的名称取决于发行版，因此请参考文档以获取详细信息。例如，在基于 Debian 的发行版上，你可以在 wiki 的[构建教程][3]部分了解构建需求，而在基于 Fedora 的发行版上，你可以参考该文档的[从源代码安装软件][4]部分。

### 创建一个消息队列

你的系统已经有一个默认的消息队列，但是你可以使用 `ipcmk` 命令创建你自己的消息队列：

```
$ ipcmk --queue
Message queue id: 32764
```

编写一个简单的 IPC 消息发送器，为了简单，在队列 ID 中硬编码：

```
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>
#include <string.h>

struct msgbuffer {
  char text[24];
} message;

int main() {
    int msqid = 32764;
    strcpy(message.text,"opensource.com");
    msgsnd(msqid, &message, sizeof(message), 0);
    printf("Message: %s\n",message.text);
    printf("Queue: %d\n",msqid);
    return 0;
        }
```

编译该应用程序并运行：

```
$ gcc msgsend.c -o msg.bin
$ ./msg.bin
Message: opensource.com
Queue: 32769
```

你刚刚向你的消息队列发送了一条消息。你可以使用 `ipcs` 命令验证这一点，可以使用 `——queue` 选项将输出限制到该消息队列：

```
$ ipcs -q

------ Message Queues --------
key        msqid   owner  perms  used-bytes  messages
0x7b341ab9 0       seth   666    0          0
0x72bd8410 32764   seth   644    24         1
```

你也可以检索这些消息：

```
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdio.h>

struct msgbuffer {
    char text[24];
} message;

int main() {
    int msqid = 32764;
    msgrcv(msqid, &message, sizeof(message),0,0);
    printf("\nQueue: %d\n",msqid);
    printf("Got this message: %s\n", message.text);
    msgctl(msqid,IPC_RMID,NULL);
    return 0;
```

编译并运行：

```
$ gcc get.c -o get.bin
$ ./get.bin

Queue: 32764
Got this message: opensource.com
```

### 下载这本电子书

这只是 Marty Kalin 的《[Linux 进程间通信指南][5]》中课程的一个例子，可从 Opensource.com 下载的这本最新免费（且 CC 授权）的电子书。在短短的几节课中，你将从消息队列、共享内存和信号量、套接字、信号等中了解 IPC 的 POSIX 方法。认真阅读 Marty 的书，你将成为一个博识的程序员。而这不仅适用于经验丰富的编码人员，如果你编写的只是 shell 脚本，那么你将拥有有关管道（命名和未命名）和共享文件的大量实践知识，以及使用共享文件或外部消息队列时需要了解的重要概念。

如果你对制作具有动态和具有系统感知的优秀软件感兴趣，那么你需要了解 IPC。让[这本书][5]做你的向导。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/inter-process-communication-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[laingke](https://github.com/laingke)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coverimage_inter-process_communication_linux_520x292.png?itok=hPoen7oI (Inter-process Communication in Linux)
[2]: https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/
[3]: https://wiki.debian.org/BuildingTutorial
[4]: https://docs.pagure.org/docs-fedora/installing-software-from-source.html
[5]: https://opensource.com/downloads/guide-inter-process-communication-linux
