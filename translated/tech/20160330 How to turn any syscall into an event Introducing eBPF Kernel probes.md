怎么去转换任何系统调用为一个事件：介绍 eBPF 内核探针
============================================================


长文预警：在最新的 Linux 内核（>=4.4）中使用 eBPF，你可以使用任意数据将任何内核函数调用转换为一个用户空间事件。这通过 bcc 来做很容易。这个探针是用 C 语言写的，而数据是由 Python 来处理的。

如果你对 eBPF 或者 Linux 跟踪不熟悉，那你应该好好阅读一下本文。它尝试逐步去克服我在使用 bcc/eBPF 时遇到的困难，同时也节省了我在搜索和挖掘上花费的时间。

### 在 Linux 的世界中关于 push vs pull 的一个提示

当我开始在容器上工作的时候，我想知道我们怎么基于一个真实的系统状态去动态更新一个负载均衡器的配置。一个通用的策略是这样做的，无论什么时候只要一个容器启动，容器编排器触发一个负载均衡配置更新动作，负载均衡器去轮询每个容器，直到它的健康状态检查结束。它只是简单进行 “SYN” 测试。

虽然这种配置方式可以有效工作，但是它的缺点是你的负载均衡器为了让一些系统变得可用需要等待，而不是 … 让负载去均衡。

可以做的更好吗？

当你希望在一个系统中让一个程序对一些变化做出反应，这里有两种可能的策略。程序可以去 _轮询_  系统去检测变化，或者，如果系统支持，系统可以  _推送_ 事件并且让程序对它作出反应。你希望去使用推送还是轮询取决于上下文环境。一个好的经验法则是，基于处理时间的考虑，如果事件发生的频率较低时使用推送，而当事件发生的较快或者让系统变得不可用时切换为轮询。例如，一般情况下，网络驱动将等待来自网卡的事件，但是，像 dpdk 这样的框架对事件将激活对网卡的轮询，以达到高吞吐低延迟的目的。

理想状态下，我们将有一些内核接口告诉我们：

> *   “容器管理器，你好，我刚才为容器 _servestaticfiles_ 的 Nginx-ware 创建了一个套接字，或许你应该去更新你的状态？
> 
> *   “好的，操作系统，感谢你告诉我这个事件“

虽然 Linux 有大量的接口去处理事件，对于文件事件高达 3 个，但是没有专门的接口去得到套接字事件提示。你可以得到路由表事件、邻接表事件、连接跟踪事件、接口变化事件。唯独没有套接字事件。或者，也许它深深地隐藏在一个 Netlink 接口中。

理想情况下，我们需要一个做这件事的通用方法，怎么办呢？

### 内核跟踪和 eBPF，一些它们的历史

直到最近，仅有的方式是去在内核上打一个补丁程序或者借助于 SystemTap。[SytemTap][5] 是一个 Linux 系统跟踪器。简单地说，它提供了一个 DSL，然后编译进内核模块，然后被内核加载运行。除了一些因安全原因禁用动态模块加载的生产系统之外，包括在那个时候我工作的那一个。另外的方式是为内核打一个补丁程序去触发一些事件，可能是基于 netlink。但是这很不方便。深入内核带来的缺点包括 “有趣的” 新 “特性” 和增加了维护负担。

从 Linux 3.15 开始给我们带来了希望，它支持任何可跟踪内核函数可安全转换为用户空间事件。在一般的计算机科学中，“安全” 是指 ”一些虚拟机”。这里说的情况不是这种意思。Linux 已经有多好年了。自从 Linux 2.1.75 在 1997 年正式发行以来。但是，对被称为伯克利包过滤器的 BPF 来说它的历史是很短的。正如它的名字所表达的那样，它最初是为 BSD 防火墙开发的。它仅有两个寄存器，并且它仅允许跳转，意味着你不能使用它写一个循环（好吧，如果你知道最大迭代次数并且去手工实现它，你也可以实现循环）。这一点保证了程序总会终止并且从来不会使系统处于 hang 的状态。还不确定它的作用吗？即便你用的是 iptables。它的作用正如 [CloudFlare 的 DDos 防护基础][6]。

好的，因此，随着 Linux 3.15，[BPF 被扩展了][7] 转变为 eBPF。对于 “扩展的” BPF。它从两个 32 位寄存器升级到 10 个 64 位寄存器，并且增加了它们之间向后跳转的特性。它因此将被 [在 Linux 3.18 中进一步扩展][8]，并将被移到网络子系统中，并且增加了像映射（maps）这样的工具。为保证安全，它 [引进了一个检查器][9]，它验证所有的内存访问和可能的代码路径。如果检查器不能保证代码在固定的边界内，代码将被终止，它拒绝程序的初始插入。

关于它的更多历史，可以看 [Oracle 的关于 eBPF 的一个很捧的演讲][10]。

让我们开始吧！

### 来自 `inet_listen` 的问候

因为写一个汇编程序并不是件容易的任务，甚至对于很优秀的我们来说，我将使用 [bcc][11]。bcc 是一个基于 LLVM 的采集工具，并且用 Python 抽象了底层机制。探针是用 C 写的，并且返回的结果可以被 Python 利用，来写一些非常简单的应用程序。

首先安装 bcc。对于一些示例，你可能会被要求使用一个最新的内核版本（>= 4.4）。如果你想亲自去尝试一下这些示例，我强烈推荐你安装一台虚拟机。 _而不是_ 一个 Docker 容器。你不能在一个容器中改变内核。作为一个非常新的很活跃的项目，安装教程高度依赖平台/版本的。你可以在 [https://github.com/iovisor/bcc/blob/master/INSTALL.md][12] 上找到最新的教程。

现在，我希望在 TCP 套接字上进行监听，不管什么时候，只要有任何程序启动我将得到一个事件。当我在一个 `AF_INET` + `SOCK_STREAM` 套接字上调用一个 `listen()` 系统调用时，底层的内核函数是 [`inet_listen`][13]。我将钩在 `kprobe` 的输入点上，它启动时输出一个 “Hello World”。

```
from bcc import BPF

# Hello BPF Program
bpf_text = """ 
#include <net/inet_sock.h>
#include <bcc/proto.h>

// 1\. Attach kprobe to "inet_listen"
int kprobe__inet_listen(struct pt_regs *ctx, struct socket *sock, int backlog)
{
    bpf_trace_printk("Hello World!\\n");
    return 0;
};
"""

# 2\. Build and Inject program
b = BPF(text=bpf_text)

# 3\. Print debug output
while True:
    print b.trace_readline()

```

这个程序做了三件事件：1. 它使用一个命名惯例附加到一个内核探针上。如果函数被调用，输出 “my_probe”，它使用 `b.attach_kprobe("inet_listen", "my_probe")` 被显式地附加。2.它使用 LLVM 去 new 一个 BPF 后端来构建程序。使用 (new) `bpf()` 系统调用去注入结果字节码，并且按匹配的命名惯例自动附加探针。3. 从内核管道读取原生输出。

注意：eBPF 的后端 LLVM 还很新。如果你认为你发了一个 bug，你可以去升级它。

注意到 `bpf_trace_printk` 调用了吗？这是一个内核的 `printk()` 精简版的 debug 函数。使用时，它产生一个跟踪信息到 `/sys/kernel/debug/tracing/trace_pipe` 中的专门的内核管道。就像名字所暗示的那样，这是一个管道。如果多个读取者消费它，仅有一个将得到一个给定的行。对生产系统来说，这样是不合适的。

幸运的是，Linux 3.19 引入了对消息传递的映射以及 Linux 4.4 带来了任意 perf 事件支持。在这篇文章的后面部分，我将演示 perf 事件。

```
# From a first console
ubuntu@bcc:~/dev/listen-evts$ sudo /python tcv4listen.py 
              nc-4940  [000] d... 22666.991714: : Hello World!

# From a second console
ubuntu@bcc:~$ nc -l 0 4242
^C

```

Yay!

### 抓取 backlog

现在，让我们输出一些很容易访问到的数据，叫做 “backlog”。backlog 是正在建立 TCP 连接的、即将成为 `accept()` 的数量。

只要稍微调整一下 `bpf_trace_printk`：

```
bpf_trace_printk("Listening with with up to %d pending connections!\\n", backlog);

```

如果你用这个 “革命性” 的改善重新运行这个示例，你将看到如下的内容：

```
(bcc)ubuntu@bcc:~/dev/listen-evts$ sudo python tcv4listen.py 
              nc-5020  [000] d... 25497.154070: : Listening with with up to 1 pending connections!

```

`nc` 是一个单个的连接程序，因此，在 1\. Nginx 或者 Redis 上的 backlog 在这里将输出 128 。但是，那是另外一件事。

简单吧？现在让我们获取它的端口。

### 抓取端口和 IP

正在研究的 `inet_listen` 的信息来源于内核，我们知道它需要从 `socket` 对象中取得 `inet_sock`。就像从源头拷贝，然后插入到跟踪器的开始处：

```
// cast types. Intermediate cast not needed, kept for readability
struct sock *sk = sock->sk;
struct inet_sock *inet = inet_sk(sk);

```

端口现在可以在按网络字节顺序（就是“从小到大”的顺序）的 `inet->inet_sport` 访问到。很容易吧！因此，我们将替换为 `bpf_trace_printk`：

```
bpf_trace_printk("Listening on port %d!\\n", inet->inet_sport);

```

然后运行：

```
ubuntu@bcc:~/dev/listen-evts$ sudo /python tcv4listen.py 
...
R1 invalid mem access 'inv'
...
Exception: Failed to load BPF program kprobe__inet_listen

```

除了它不再简单之外，Bcc 现在提升了 _许多_。直到写这篇文章的时候，几个问题已经被处理了，但是并没有全部处理完。这个错误意味着内核检查器可以证实程序中的内存访问是正确的。看显式的类型转换。我们需要一点帮助，以使访问更加明确。我们将使用 `bpf_probe_read` 可信任的函数去读取一个任意内存位置，虽然为了确保，要像如下的那样做一些必需的检查：

```
// Explicit initialization. The "=0" part is needed to "give life" to the variable on the stack
u16 lport = 0;

// Explicit arbitrary memory access. Read it:
//    Read into 'lport', 'sizeof(lport)' bytes from 'inet->inet_sport' memory location
bpf_probe_read(&lport, sizeof(lport), &(inet->inet_sport));

```

使用 `inet->inet_rcv_saddr` 读取 IPv4 边界地址，和它基本上是相同的。如果我把这些一起放上去，我们将得到 backlog，端口和边界 IP：

```
from bcc import BPF  

# BPF Program  
bpf_text = """   
#include <net/sock.h>  
#include <net/inet_sock.h>  
#include <bcc/proto.h>  

// Send an event for each IPv4 listen with PID, bound address and port  
int kprobe__inet_listen(struct pt_regs *ctx, struct socket *sock, int backlog)  
{  
    // Cast types. Intermediate cast not needed, kept for readability  
    struct sock *sk = sock->sk;  
    struct inet_sock *inet = inet_sk(sk);  

    // Working values. You *need* to initialize them to give them "life" on the stack and use them afterward  
    u32 laddr = 0;  
    u16 lport = 0;  

    // Pull in details. As 'inet_sk' is internally a type cast, we need to use 'bpf_probe_read'  
    // read: load into 'laddr' 'sizeof(laddr)' bytes from address 'inet->inet_rcv_saddr'  
    bpf_probe_read(&laddr, sizeof(laddr), &(inet->inet_rcv_saddr));  
    bpf_probe_read(&lport, sizeof(lport), &(inet->inet_sport));  

    // Push event
    bpf_trace_printk("Listening on %x %d with %d pending connections\\n", ntohl(laddr), ntohs(lport), backlog);  
    return 0;
};  
"""  

# Build and Inject BPF  
b = BPF(text=bpf_text)  

# Print debug output  
while True:  
  print b.trace_readline()

```

运行一个测试，输出的内容像下面这样:

```
(bcc)ubuntu@bcc:~/dev/listen-evts$ sudo python tcv4listen.py 
              nc-5024  [000] d... 25821.166286: : Listening on 7f000001 4242 with 1 pending connections

```

你的监听是在本地主机上提供的。因为没有处理为友好的输出，这里的地址以 16 进制的方式显示，并且那是有线的。并且它很酷。

注意：你可能想知道为什么 `ntohs` 和 `ntohl` 可以从 BPF 中被调用，即便它们并不可信。这是因为它们是宏，并且是从 “.h” 文件中来的内联函数，并且，在写这篇文章的时候一个小的 bug 已经 [修复了][14]。

全部完成之后，再来一个代码片断：我们希望获取相关的容器。在一个网络环境中，那意味着我们希望取得网络的命名空间。网络命名空间是一个容器的构建块，它允许它们拥有独立的网络。

### 抓取网络命名空间：被迫引入的 perf 事件

在用户空间中，网络命名空间可以通过检查 `/proc/PID/ns/net` 的目标来确定，它将看起来像 `net:[4026531957]` 这样。方括号中的数字是节点的网络空间编号。这就是说，我们可以通过 `/proc` 来取得，但是这并不是好的方式，我们或许可以临时处理时用一下。我们可以从内核中直接抓取节点编号。幸运的是，那样做很容易：

```
// Create an populate the variable
u32 netns = 0;

// Read the netns inode number, like /proc does
netns = sk->__sk_common.skc_net.net->ns.inum;

```

很容易！而且它做到了。

但是，如果你看到这里，你可能猜到那里有一些错误。它在：

```
bpf_trace_printk("Listening on %x %d with %d pending connections in container %d\\n", ntohl(laddr), ntohs(lport), backlog, netns);

```

如果你尝试去运行它，你将看到一些令人难解的错误信息：

```
(bcc)ubuntu@bcc:~/dev/listen-evts$ sudo python tcv4listen.py
error: in function kprobe__inet_listen i32 (%struct.pt_regs*, %struct.socket*, i32)
too many args to 0x1ba9108: i64 = Constant<6>

```

clang 想尝试去告诉你的是 “Hey pal，`bpf_trace_printk` 只能带四个参数，你刚才给它传递了 5 个“。在这里我不打算继续追究细节了，但是，那是 BPF 的一个限制。如果你想继续去深入研究，[这里是一个很好的起点][15]。

去修复它的唯一方式是去 … 停止调试并且准备投入使用。因此，让我们开始吧（确保运行在内核版本为 4.4 的 Linux 系统上）我将使用 perf 事件，它支持传递任意大小的结构体到用户空间。另外，只有我们的读者可以获得它，因此，多个没有关系的 eBPF 程序可以并发产生数据而不会出现问题。

去使用它吧，我们需要：

1.  定义一个结构体

2.  声明事件

3.  推送事件

4.  在 Python 端重新声明事件（这一步以后将不再需要）

5.  消费和格式化事件

这看起来似乎很多，其它并不多，看下面示例：

```
// At the begining of the C program, declare our event
struct listen_evt_t {
    u64 laddr;
    u64 lport;
    u64 netns;
    u64 backlog;
};
BPF_PERF_OUTPUT(listen_evt);

// In kprobe__inet_listen, replace the printk with
struct listen_evt_t evt = {
    .laddr = ntohl(laddr),
    .lport = ntohs(lport),
    .netns = netns,
    .backlog = backlog,
};
listen_evt.perf_submit(ctx, &evt, sizeof(evt));

```

Python 端将需要一点更多的工作：

```
# We need ctypes to parse the event structure
import ctypes

# Declare data format
class ListenEvt(ctypes.Structure):
    _fields_ = [
        ("laddr",   ctypes.c_ulonglong),
        ("lport",   ctypes.c_ulonglong),
        ("netns",   ctypes.c_ulonglong),
        ("backlog", ctypes.c_ulonglong),
    ]

# Declare event printer
def print_event(cpu, data, size):
    event = ctypes.cast(data, ctypes.POINTER(ListenEvt)).contents
    print("Listening on %x %d with %d pending connections in container %d" % (
        event.laddr,
        event.lport,
        event.backlog,
        event.netns,
    ))

# Replace the event loop
b["listen_evt"].open_perf_buffer(print_event)
while True:
    b.kprobe_poll()

```

来试一下吧。在这个示例中，我有一个 redis 运行在一个 Docker 容器中，并且 nc 在主机上：

```
(bcc)ubuntu@bcc:~/dev/listen-evts$ sudo python tcv4listen.py
Listening on 0 6379 with 128 pending connections in container 4026532165
Listening on 0 6379 with 128 pending connections in container 4026532165
Listening on 7f000001 6588 with 1 pending connections in container 4026531957

```

### 结束语

现在，所有事情都可以在内核中使用 eBPF 将任何函数的调用设置为触发事件，并且在学习 eBPF 时，你将看到了我所遇到的大多数的问题。如果你希望去看这个工具的所有版本，像 IPv6 支持这样的一些技巧，看一看 [https://github.com/iovisor/bcc/blob/master/tools/solisten.py][16]。它现在是一个官方的工具，感谢 bcc 团队的支持。

更进一步地去学习，你可能需要去关注 Brendan Gregg 的博客，尤其是 [关于 eBPF 映射和统计的文章][17]。他是这个项目的主要贡献人之一。


--------------------------------------------------------------------------------

via: https://blog.yadutaf.fr/2016/03/30/turn-any-syscall-into-event-introducing-ebpf-kernel-probes/

作者：[Jean-Tiare Le Bigot][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://blog.yadutaf.fr/about
[1]:https://blog.yadutaf.fr/tags/linux
[2]:https://blog.yadutaf.fr/tags/tracing
[3]:https://blog.yadutaf.fr/tags/ebpf
[4]:https://blog.yadutaf.fr/tags/bcc
[5]:https://en.wikipedia.org/wiki/SystemTap
[6]:https://blog.cloudflare.com/bpf-the-forgotten-bytecode/
[7]:https://blog.yadutaf.fr/2016/03/30/turn-any-syscall-into-event-introducing-ebpf-kernel-probes/TODO
[8]:https://lwn.net/Articles/604043/
[9]:http://lxr.free-electrons.com/source/kernel/bpf/verifier.c#L21
[10]:http://events.linuxfoundation.org/sites/events/files/slides/tracing-linux-ezannoni-linuxcon-ja-2015_0.pdf
[11]:https://github.com/iovisor/bcc
[12]:https://github.com/iovisor/bcc/blob/master/INSTALL.md
[13]:http://lxr.free-electrons.com/source/net/ipv4/af_inet.c#L194
[14]:https://github.com/iovisor/bcc/pull/453
[15]:http://lxr.free-electrons.com/source/kernel/trace/bpf_trace.c#L86
[16]:https://github.com/iovisor/bcc/blob/master/tools/solisten.py
[17]:http://www.brendangregg.com/blog/2015-05-15/ebpf-one-small-step.html


