[#]: collector: (lujun9972)
[#]: translator: (YungeG)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13632-1.html)
[#]: subject: (Trace code in Fedora with bpftrace)
[#]: via: (https://fedoramagazine.org/trace-code-in-fedora-with-bpftrace/)
[#]: author: (Augusto Caringi https://fedoramagazine.org/author/acaringi/)

在 Fedora 中用 bpftrace 追踪代码
======

![](https://img.linux.net.cn/data/attachment/album/202107/29/222633wjln78my68exj7x9.jpg)

bpftrace 是一个 [基于 eBPF 的新型追踪工具][2]，在 Fedora 28 第一次引入。Brendan Gregg、Alastair Robertson 和 Matheus Marchini 在网上的一个松散的黑客团队的帮助下开发了 bpftrace。它是一个允许你分析系统在幕后正在执行的操作的追踪工具，可以告诉你代码中正在被调用的函数、传递给函数的参数、函数的调用次数等。

这篇文章的内容涉及了 bpftrace 的一些基础，以及它是如何工作的，请继续阅读获取更多的信息和一些有用的实例。

### eBPF（<ruby>扩展的伯克利数据包过滤器<rt>extended Berkeley Packet Filter</rt></ruby>）

[eBPF][3] 是一个微型虚拟机，更确切的说是一个位于 Linux 内核中的虚拟 CPU。eBPF 可以在内核空间以一种安全可控的方式加载和运行小型程序，使得 eBPF 的使用更加安全，即使在生产环境系统中。eBPF 虚拟机有自己的指令集架构（[ISA][4]），类似于现代处理器架构的一个子集。通过这个 ISA，可以很容易将 eBPF 程序转化为真实硬件上的代码。内核即时将程序转化为主流处理器架构上的本地代码，从而提升性能。

eBPF 虚拟机允许通过编程扩展内核，目前已经有一些内核子系统使用这一新型强大的 Linux 内核功能，比如网络、安全计算、追踪等。这些子系统的主要思想是添加 eBPF 程序到特定的代码点，从而扩展原生的内核行为。

虽然 eBPF 机器语言功能强大，由于是一种底层语言，直接用于编写代码很费力，bpftrace 就是为了解决这个问题而生的。eBPF 提供了一种编写 eBPF 追踪脚本的高级语言，然后在 clang / LLVM 库的帮助下将这些脚本转化为 eBPF，最终添加到特定的代码点。

### 安装和快速入门

在终端 [使用][5] [sudo][5] 执行下面的命令安装 bpftrace：

```
$ sudo dnf install bpftrace
```

使用“hello world”进行实验：

```
$ sudo bpftrace -e 'BEGIN { printf("hello world\n"); }'
```

注意，出于特权级的需要，你必须使用 root 运行 `bpftrace`，使用 `-e` 选项指明一个程序，构建一个所谓的“单行程序”。这个例子只会打印 “hello world”，接着等待你按下 `Ctrl+C`。

`BEGIN` 是一个特殊的探针名，只在执行一开始生效一次；每次探针命中时，大括号 `{}` 内的操作（这个例子中只是一个 `printf`）都会执行。

现在让我们转向一个更有用的例子：

```
$ sudo bpftrace -e 't:syscalls:sys_enter_execve { printf("%s called %s\n", comm, str(args->filename)); }'
```

这个例子打印了父进程的名字（`comm`）和系统中正在创建的每个新进程的名称。`t:syscalls:sys_enter_execve` 是一个内核追踪点，是 `tracepoint:syscalls:sys_enter_execve` 的简写，两种形式都可以使用。下一部分会向你展示如何列出所有可用的追踪点。

`comm` 是一个 bpftrace 内建指令，代表进程名；`filename` 是 `t:syscalls:sys_enter_execve` 追踪点的一个字段，这些字段可以通过 `args` 内建指令访问。

追踪点的所有可用字段可以通过这个命令列出：

```
bpftrace -lv "t:syscalls:sys_enter_execve"
```

### 示例用法

#### 列出探针

`bpftrace` 的一个核心概念是<ruby>探针点<rt>probe point</rt></ruby>，即 eBPF 程序可以连接到的（内核或用户空间的）代码中的测量点，可以分成以下几大类：

  * `kprobe`——内核函数的开始处
  * `kretprobe`——内核函数的返回处
  * `uprobe`——用户级函数的开始处
  * `uretprobe`——用户级函数的返回处
  * `tracepoint`——内核静态追踪点
  * `usdt`——用户级静态追踪点
  * `profile`——基于时间的采样
  * `interval`——基于时间的输出
  * `software`——内核软件事件
  * `hardware`——处理器级事件

所有可用的 `kprobe` / `kretprobe`、`tracepoints`、`software` 和 `hardware` 探针可以通过这个命令列出：

```
$ sudo bpftrace -l
```

`uprobe` / `uretprobe` 和 `usdt` 是用户空间探针，专用于某个可执行文件。要使用这些探针，通过下文中的特殊语法。

`profile` 和 `interval` 探针以固定的时间间隔触发；固定的时间间隔不在本文的范畴内。

#### 统计系统调用数

**映射** 是保存计数、统计数据和柱状图的特殊 BPF 数据类型，你可以使用映射统计每个系统调用正在被调用的次数：

```
$ sudo bpftrace -e 't:syscalls:sys_enter_* { @[probe] = count(); }'
```

一些探针类型允许使用通配符匹配多个探针，你也可以使用一个逗号隔开的列表为一个操作块指明多个连接点。上面的例子中，操作块连接到了所有名称以 `t:syscalls:sysenter_` 开头的追踪点，即所有可用的系统调用。

`bpftrace` 的内建函数 `count()` 统计系统调用被调用的次数；`@[]` 代表一个映射（一个关联数组）。该映射的键 `probe` 是另一个内建指令，代表完整的探针名。

这个例子中，相同的操作块连接到了每个系统调用，之后每次有系统调用被调用时，映射就会被更新，映射中和系统调用对应的项就会增加。程序终止时，自动打印出所有声明的映射。

下面的例子统计所有的系统调用，然后通过 `bpftrace` 过滤语法使用 PID 过滤出某个特定进程调用的系统调用：

```
$ sudo bpftrace -e 't:syscalls:sys_enter_* / pid == 1234 / { @[probe] = count(); }'
```

#### 进程写的字节数

让我们使用上面的概念分析每个进程正在写的字节数：

```
$ sudo bpftrace -e 't:syscalls:sys_exit_write /args->ret > 0/ { @[comm] = sum(args->ret); }'
```

`bpftrace` 连接操作块到写系统调用的返回探针（`t:syscalls:sys_exit_write`），然后使用过滤器丢掉代表错误代码的负值（`/arg->ret > 0/`）。

映射的键 `comm` 代表调用系统调用的进程名；内建函数 `sum()` 累计每个映射项或进程写的字节数；`args` 是一个 `bpftrace` 内建指令，用于访问追踪点的参数和返回值。如果执行成功，`write` 系统调用返回写的字节数，`arg->ret` 用于访问这个字节数。

#### 进程的读取大小分布（柱状图）：

`bpftrace` 支持创建柱状图。让我们分析一个创建进程的 `read` 大小分布的柱状图的例子：

```
$ sudo bpftrace -e 't:syscalls:sys_exit_read { @[comm] = hist(args->ret); }'
```

柱状图是 BPF 映射，因此必须保存为一个映射（`@`），这个例子中映射键是 `comm`。

这个例子使 `bpftrace` 给每个调用 `read` 系统调用的进程生成一个柱状图。要生成一个全局柱状图，直接保存 `hist()` 函数到 `@`（不使用任何键）。

程序终止时，`bpftrace` 自动打印出声明的柱状图。创建柱状图的基准值是通过 _args->ret_ 获取到的读取的字节数。

#### 追踪用户空间程序

你也可以通过 `uprobes` / `uretprobes` 和 USDT（用户级静态定义的追踪）追踪用户空间程序。下一个例子使用探测用户级函数结尾处的 `uretprobe` ，获取系统中运行的每个 `bash` 发出的命令行：

```
$ sudo bpftrace -e 'uretprobe:/bin/bash:readline { printf("readline: \"%s\"\n", str(retval)); }'
```

要列出可执行文件 `bash` 的所有可用 `uprobes` / `uretprobes`， 执行这个命令：

```
$ sudo bpftrace -l "uprobe:/bin/bash"
```

`uprobe` 指向用户级函数执行的开始，`uretprobe` 指向执行的结束（返回处）；`readline()` 是 `/bin/bash` 的一个函数，返回键入的命令行；`retval` 是被探测的指令的返回值，只能在 `uretprobe` 访问。

使用 `uprobes` 时，你可以用 `arg0..argN` 访问参数。需要调用 `str()` 将 `char *` 指针转化成一个字符串。

### 自带脚本

`bpftrace` 软件包附带了许多有用的脚本，可以在 `/usr/share/bpftrace/tools/` 目录找到。

这些脚本中，你可以找到：

  * `killsnoop.bt`——追踪 `kill()` 系统调用发出的信号
  * `tcpconnect.bt`——追踪所有的 TCP 网络连接
  * `pidpersec.bt`——统计每秒钟（通过 `fork`）创建的新进程
  * `opensnoop.bt`——追踪 `open()` 系统调用
  * `bfsstat.bt`——追踪一些 VFS 调用，按秒统计

你可以直接使用这些脚本，比如：

```
$ sudo /usr/share/bpftrace/tools/killsnoop.bt
```

你也可以在创建新的工具时参考这些脚本。

### 链接

  * bpftrace 参考指南——<https://github.com/iovisor/bpftrace/blob/master/docs/reference_guide.md>
  * Linux 2018 `bpftrace`（DTrace 2.0）——<http://www.brendangregg.com/blog/2018-10-08/dtrace-for-linux-2018.html>
  * BPF：通用的内核虚拟机——<https://lwn.net/Articles/599755/>
  * Linux Extended BPF（eBPF）Tracing Tools——<http://www.brendangregg.com/ebpf.html>
  * 深入 BPF：一个阅读材料列表—— [https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf][6]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/trace-code-in-fedora-with-bpftrace/

作者：[Augusto Caringi][a]
选题：[lujun9972][b]
译者：[YungeG](https://github.com/YungeG)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/acaringi/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/08/bpftrace-816x345.jpg
[2]: https://github.com/iovisor/bpftrace
[3]: https://lwn.net/Articles/740157/
[4]: https://github.com/iovisor/bpf-docs/blob/master/eBPF.md
[5]: https://fedoramagazine.org/howto-use-sudo/
[6]: https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/
[7]: https://unsplash.com/@wehavemegapixels?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[8]: https://unsplash.com/search/photos/trace?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
