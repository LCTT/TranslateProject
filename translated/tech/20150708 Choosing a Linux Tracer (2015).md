选择一个 Linux 跟踪器（2015）
======
[![][1]][2]
_Linux 跟踪很神奇！_

跟踪器是高级的性能分析和调试工具，如果你使用过 strace(1) 或者 tcpdump(8)，你不应该被它吓到 ... 你使用的就是跟踪器。系统跟踪器能让你看到很多的东西，而不仅是系统调用或者包，因为常见的跟踪器都可以跟踪内核或者应用程序的任何东西。

有大量的 Linux 跟踪器可供你选择。由于它们中的每个都有一个官方的（或者非官方的）的吉祥物，我们有足够多的选择给孩子们展示。

你喜欢使用哪一个呢？

我从两类读者的角度来回答这个问题：大多数人和性能/内核工程师。当然，随着时间的推移，这也可能会发生变化，因此，我需要及时去更新本文内容，或许是每年一次，或者更频繁。

## 对于大多数人

大多数人（开发者、系统管理员、运维人员、网络可靠性工程师（SRE）…）是不需要去学习系统跟踪器的详细内容的。以下是你需要去了解和做的事情：

### 1. 使用 perf_events 了解 CPU 概要信息

使用 perf_events 去了解 CPU 的基本情况。它的概要信息可以用一个 [火焰图][3] 来形象地表示。比如：
```
git clone --depth 1 https://github.com/brendangregg/FlameGraph
perf record -F 99 -a -g -- sleep 30
perf script | ./FlameGraph/stackcollapse-perf.pl | ./FlameGraph/flamegraph.pl > perf.svg

```

Linux 的 perf_events（又称为 "perf"，后面用它来表示命令）是官方为 Linux 用户准备的跟踪器/分析器。它在内核源码中，并且维护的非常好（而且现在它的功能还是快速加强）。它一般是通过 linux-tools-common 这个包来添加的。

perf 可以做的事情很多，但是，如果我建议你只学习其中的一个功能，那就是查看 CPU 概要信息。虽然从技术角度来说，这并不是事件“跟踪”，主要是它很简单。较难的部分是去获得工作的完整栈和符号，这部分的功能在我的 [Linux Profiling at Netflix][4] 中讨论过。

### 2. 知道它能干什么

正如一位朋友所说的：“你不需要知道 X 光机是如何工作的，但你需要明白的是，如果你吞下了一个硬币，X 光机是你的一个选择！”你需要知道使用跟踪器能够做什么，因此，如果你在业务上需要它，你可以以后再去学习它，或者请会使用它的人来做。

简单地说：几乎任何事情都可以通过跟踪来了解它。内部文件系统、TCP/IP 处理过程、设备驱动、应用程序内部情况。阅读我在 lwn.net 上的 [ftrace][5] 的文章，也可以去浏览 [perf_events 页面][6]，那里有一些跟踪能力的示例。

### 3. 请求一个前端

如果你把它作为一个性能分析工具（有许多公司销售这类产品），并要求支持 Linux 跟踪。希望通过一个“点击”界面去探查内核的内部，包含一个在栈不同位置的延迟的热力图。就像我在 [Monitorama 演讲][7] 中描述的那样。

我创建并开源了我自己的一些前端，虽然它是基于 CLI 的（不是图形界面的）。这样将使其它人使用跟踪器更快更容易。比如，我的 [perf-tools][8]，跟踪新进程是这样的：
```
# ./execsnoop
Tracing exec()s. Ctrl-C to end.
 PID PPID ARGS
 22898 22004 man ls
 22905 22898 preconv -e UTF-8
 22908 22898 pager -s
 22907 22898 nroff -mandoc -rLL=164n -rLT=164n -Tutf8
[...]

```

在 Netflix 上，我创建了一个 [Vector][9]，它是一个实例分析工具，实际上它是一个 Linux 跟踪器的前端。

## 对于性能或者内核工程师

一般来说，我们的工作都非常难，因为大多数人或许要求我们去搞清楚如何去跟踪某个事件，以及因此需要选择使用其中一个跟踪器。为完全理解一个跟踪器，你通常需要花至少一百多个小时去使用它。理解所有的 Linux 跟踪器并能在它们之间做出正确的选择是件很难的事情。（我或许是唯一接近完成这件事的人）

在这里我建议选择如下之一：

A) 选择一个全能的跟踪器，并以它为标准。这需要在一个测试环境中，花大量的时间来搞清楚它的细微差别和安全性。我现在的建议是  SystemTap 的最新版本（即从这个 [源][10] 构建的）。我知道有的公司选择的是 LTTng ，尽管它并不是很强大（但是它很安全），但他们也用的很好。如果在 sysdig 中添加了跟踪点或者是 kprobes，它也是另外的一个候选者。

B) 按我的 [Velocity 教程中][11] 的流程图。这意味着可能是使用 ftrace 或者 perf_events，因为 eBPF 是集成在内核中的，然后用其它的跟踪器，如 SystemTap/LTTng 作为对 eBPF 的补充。我目前在 Netflix 的工作中就是这么做的。

以下是我对各个跟踪器的评价：

### 1. ftrace

我爱 [Ftrace][12]，它是内核黑客最好的朋友。它被构建进内核中，它能够消费跟踪点、kprobes、以及 uprobes，并且提供一些功能：使用可选的过滤器和参数进行事件跟踪；事件计数和计时，内核概览；函数流步进。关于它的示例可以查看内核源树中的 [ftrace.txt][13]。它通过 /sys 来管理，是面向单 root 用户的（虽然你可以使用缓冲实例来破解它以支持多用户），它的界面有时很繁琐，但是它比较容易破解，并且有前端：Steven Rostedt，ftrace 的主要创建者，他设计了 trace-cmd，并且我已经创建了 perf-tools 集合。我最讨厌的就是它不可编程，因此，你也不能，比如，去保存和获取时间戳，计算延迟，以及保存它的历史。你不需要花成本转储事件到用户级以便于进行后期处理。它通过 eBPF 可以实现可编程。

### 2. perf_events

[perf_events][14] 是 Linux 用户的主要跟踪工具，它来源于 Linux 内核，一般是通过 linux-tools-common 包来添加。又称为 "perf"，后面的 perf 指的是它的前端，它非常高效（动态缓存），一般用于跟踪并转储到一个文件中（perf.data），然后可以在以后的某个时间进行后期处理。它可以做大部分 ftrace 能做的事情。它实现不了函数流步进，并且不太容易破解（因为它的安全/错误检查做的非常好）。但它可以做概览（采样）、CPU 性能计数、用户级的栈转换、以及消费对行使用本地变量进行跟踪的调试信息。它也支持多个并发用户。与 ftrace 一样，它也是内核不可编程的，或者 eBPF 支持（已经计划了补丁）。如果只学习一个跟踪器，我建议大家去学习 perf，它可以解决大量的问题，并且它也很安全。

### 3. eBPF

扩展的伯克利包过滤器（eBPF）是一个内核虚拟机，可以在事件上运行程序，它非常高效（JIT）。它可能最终为 ftrace 和 perf_events 提供内核可编程，并可以去增强其它跟踪器。它现在是由 Alexei Starovoitov 开发，还没有实现全整合，但是对于一些令人印象深刻的工具，有些内核版本（比如，4.1）已经支持了：比如，块设备 I/O 延迟热力图。更多参考资料，请查阅 Alexei 的 [BPF 演示][15]，和它的 [eBPF 示例][16]。

### 4. SystemTap

[SystemTap][17] 是一个非常强大的跟踪器。它可以做任何事情：概览、跟踪点、kprobes、uprobes（它就来自 SystemTap）、USDT、内核编程等等。它将程序编译成内核模块并加载它们 —— 这是一种很难保证安全的方法。它开发的很怪诞，并且在过去的一段时间内出现了很多问题（恐慌或冻结）。许多并不是 SystemTap 的过错 —— 它通常被内核首先用于某些功能跟踪，并首先遇到运行 bug。最新版本的 SystemTap 是非常好的（你需要从它的源代码编译），但是，许多人仍然没有从早期版本的问题阴影中走出来。如果你想去使用它，花一些时间去测试环境，然后，在 irc.freenode.net 的 #systemtap 频道与开发者进行讨论。（Netflix 有一个容错架构，我们使用了 SystemTap，但是我们或许比起你来说，很少担心它的安全性）我最讨厌的事情是，它假设你有办法得到内核调试信息，而我并没有这些信息。没有它我确实可以做一些事情，但是缺少相关的文档和示例（我现在自己开始帮着做这些了）。

### 5. LTTng

[LTTng][18] 对事件收集进行了优化，性能要好于其它的跟踪器，也支持许多的事件类型，包括 USDT。它开发的很怪诞。它的核心部分非常简单：通过一个很小的且很固定的指令集写入事件到跟踪缓冲区。这样让它既安全又快速。缺点是做内核编程不太容易。我觉得那不是个大问题，由于它优化的很好，尽管在需要后期处理的情况下，仍然可以充分的扩展。它也探索了一种不同的分析技术。很多的“黑匣子”记录了全部有趣的事件，可以在以后的 GUI 下学习它。我担心意外的记录丢失事件，我真的需要花一些时间去看看它在实践中是如何工作的。这个跟踪器上我花的时间最少（原因是没有实践过它）。

### 6. ktap

[ktap][19] 是一个很有前途的跟踪器，它在内核中使用了一个 lua 虚拟机，它不需要调试信息和嵌入式设备就可以工作的很好。这使得它进入了人们的视野，在某个时候似乎要成为 Linux 上最好的跟踪器。然而，eBPF 开始集成到了内核，而 ktap 的集成工作被推迟了，直到它能够使用 eBPF 而不是它自己的虚拟机。由于 eBPF 在几个月后仍然在集成过程中，使得 ktap 的开发者等待了很长的时间。我希望在今年的晚些时间它能够重启开发。

### 7. dtrace4linux

[dtrace4linux][20] 主要由一个人 (Paul Fox) 利用业务时间将 Sun DTrace 移植到 Linux 中的。它令人印象深刻，而一些贡献者的工作，还不是很完美，它最多应该算是实验性的工具（不安全）。我认为对于许可证（license）的担心，使人们对它保持谨慎：它可能永远也进入不了 Linux 内核，因为 Sun 是基于 CDDL 许可证发布的 DTrace；Paul 的方法是将它作为一个插件。我非常希望看到 Linux 上的 DTrace，并且希望这个项目能够完成，我想我加入 Netflix 时将花一些时间来帮它完成。但是，我一直在使用内置的跟踪器 ftrace 和 perf_events。

### 8. OL DTrace

[Oracle Linux DTrace][21] 是将 DTrace 移植到 Linux 的一系列努力之一，尤其是 Oracle Linux。过去这些年的许多发行版都一直稳定的进步，开发者甚至谈到了改善 DTrace 测试套件，这显示了这个项目很有前途。许多有用的功能已经完成：系统调用、概览、sdt、proc、sched、以及 USDT。我一直在等待着 fbt（函数边界跟踪，对内核的动态跟踪），它将成为 Linux 内核上非常强大的功能。它最终能否成功取决于能否吸引足够多的人去使用 Oracle Linux（并为支持付费）。另一个羁绊是它并非完全开源的：内核组件是开源的，但用户级代码我没有看到。

### 9. sysdig

[sysdig][22] 是一个很新的跟踪器，它可以使用类似 tcpdump 的语法来处理系统调用事件，并用 lua 做后期处理。它也是令人印象深刻的，并且很高兴能看到在系统跟踪空间的创新。它的局限性是，它的系统调用只能是在当时，并且，它不能转储事件到用户级进行后期处理。虽然我希望能看到它去支持跟踪点、kprobes、以及 uprobes，但是你还是可以使用系统调用来做一些事情。我也希望在内核概览方面看到它支持 eBPF。sysdig 的开发者现在增加了对容器的支持。可以关注它的进一步发展。

## 深入阅读

我自己的工作中使用到的跟踪器包括：

**ftrace** : 我的 [perf-tools][8] 集合（查看示例目录）；我的 lwn.net 的 [ftrace 跟踪器的文章][5]； 一个 [LISA14][8] 演讲；和文章： [function counting][23], [iosnoop][24], [opensnoop][25], [execsnoop][26], [TCP retransmits][27], [uprobes][28], 和 [USDT][29]。

**perf_events** : 我的 [perf_events 示例][6] 页面：对于 SCALE 的一个 [Linux Profiling at Netflix][4] 演讲；和文章：[CPU 采样][30]，[静态跟踪点][31]，[势力图][32]，[计数][33]，[内核行跟踪][34]，[off-CPU 时间火焰图][35]。

**eBPF** : 文章 [eBPF：一个小的进步][36]，和一些 [BPF-tools][37] （我需要发布更多）。

**SystemTap** : 很久以前，我写了一篇 [使用 SystemTap][38] 的文章，它有点时间了。最近我发布了一些 [systemtap-lwtools][39]，展示了在没有内核调试信息的情况下，SystemTap 是如何使用的。

**LTTng** : 我使用它的时间很短，也没有发布什么文章。

**ktap** : 我的 [ktap 示例][40] 页面包括一行程序和脚本，虽然它是早期的版本。

**dtrace4linux** : 在我的 [系统性能][41] 书中包含了一些示例，并且在过去的时间中我为了某些事情开发了一些小的修补，比如， [timestamps][42]。

**OL DTrace** : 因为它是对 DTrace 的简单移植，我早期 DTrace 的大部分工作都 应该是与它相关的（链接太多了，可以去 [我的主页][43] 上搜索）。一旦它更加完美，我可以开发很多专用工具。

**sysdig** : 我贡献了 [fileslower][44] 和 [subsecond offset spectrogram][45] chisels。

**others** : 关于 [strace][46]，我写了一些告诫文章。

不好意思，没有更多的跟踪器了！ … 如果你想知道为什么 Linux 中的跟踪器不止一个，或者关于 DTrace 的内容，在我的 [从 DTrace 到 Linux][47] 的演讲中有答案，从 [第 28 张幻灯片][48] 开始。

感谢 [Deirdre Straughan][49] 的编辑，以及创建了跟踪的小马（General Zoi 是小马的创建者）。

--------------------------------------------------------------------------------

via: http://www.brendangregg.com/blog/2015-07-08/choosing-a-linux-tracer.html

作者：[Brendan Gregg.][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.brendangregg.com
[1]:http://www.brendangregg.com/blog/images/2015/tracing_ponies.png
[2]:http://www.slideshare.net/brendangregg/velocity-2015-linux-perf-tools/105
[3]:http://www.brendangregg.com/FlameGraphs/cpuflamegraphs.html
[4]:http://www.brendangregg.com/blog/2015-02-27/linux-profiling-at-netflix.html
[5]:http://lwn.net/Articles/608497/
[6]:http://www.brendangregg.com/perf.html
[7]:http://www.brendangregg.com/blog/2015-06-23/netflix-instance-analysis-requirements.html
[8]:http://www.brendangregg.com/blog/2015-03-17/linux-performance-analysis-perf-tools.html
[9]:http://techblog.netflix.com/2015/04/introducing-vector-netflixs-on-host.html
[10]:https://sourceware.org/git/?p=systemtap.git;a=blob_plain;f=README;hb=HEAD
[11]:http://www.slideshare.net/brendangregg/velocity-2015-linux-perf-tools
[12]:http://lwn.net/Articles/370423/
[13]:https://www.kernel.org/doc/Documentation/trace/ftrace.txt
[14]:https://perf.wiki.kernel.org/index.php/Main_Page
[15]:http://www.phoronix.com/scan.php?page=news_item&amp;px=BPF-Understanding-Kernel-VM
[16]:https://github.com/torvalds/linux/tree/master/samples/bpf
[17]:https://sourceware.org/systemtap/wiki
[18]:http://lttng.org/
[19]:http://ktap.org/
[20]:https://github.com/dtrace4linux/linux
[21]:http://docs.oracle.com/cd/E37670_01/E38608/html/index.html
[22]:http://www.sysdig.org/
[23]:http://www.brendangregg.com/blog/2014-07-13/linux-ftrace-function-counting.html
[24]:http://www.brendangregg.com/blog/2014-07-16/iosnoop-for-linux.html
[25]:http://www.brendangregg.com/blog/2014-07-25/opensnoop-for-linux.html
[26]:http://www.brendangregg.com/blog/2014-07-28/execsnoop-for-linux.html
[27]:http://www.brendangregg.com/blog/2014-09-06/linux-ftrace-tcp-retransmit-tracing.html
[28]:http://www.brendangregg.com/blog/2015-06-28/linux-ftrace-uprobe.html
[29]:http://www.brendangregg.com/blog/2015-07-03/hacking-linux-usdt-ftrace.html
[30]:http://www.brendangregg.com/blog/2014-06-22/perf-cpu-sample.html
[31]:http://www.brendangregg.com/blog/2014-06-29/perf-static-tracepoints.html
[32]:http://www.brendangregg.com/blog/2014-07-01/perf-heat-maps.html
[33]:http://www.brendangregg.com/blog/2014-07-03/perf-counting.html
[34]:http://www.brendangregg.com/blog/2014-09-11/perf-kernel-line-tracing.html
[35]:http://www.brendangregg.com/blog/2015-02-26/linux-perf-off-cpu-flame-graph.html
[36]:http://www.brendangregg.com/blog/2015-05-15/ebpf-one-small-step.html
[37]:https://github.com/brendangregg/BPF-tools
[38]:http://dtrace.org/blogs/brendan/2011/10/15/using-systemtap/
[39]:https://github.com/brendangregg/systemtap-lwtools
[40]:http://www.brendangregg.com/ktap.html
[41]:http://www.brendangregg.com/sysperfbook.html
[42]:https://github.com/dtrace4linux/linux/issues/55
[43]:http://www.brendangregg.com
[44]:https://github.com/brendangregg/sysdig/commit/d0eeac1a32d6749dab24d1dc3fffb2ef0f9d7151
[45]:https://github.com/brendangregg/sysdig/commit/2f21604dce0b561407accb9dba869aa19c365952
[46]:http://www.brendangregg.com/blog/2014-05-11/strace-wow-much-syscall.html
[47]:http://www.brendangregg.com/blog/2015-02-28/from-dtrace-to-linux.html
[48]:http://www.slideshare.net/brendangregg/from-dtrace-to-linux/28
[49]:http://www.beginningwithi.com/
