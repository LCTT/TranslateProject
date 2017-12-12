深入理解 BPF：一个阅读清单
============================================================

*   [什么是 BPF?][143]

*   [深入理解字节码（ bytecode）][144]

*   [资源][145]
    *   [简介][23]
        *   [关于 BPF][1]

        *   [关于 XDP][2]

        *   [关于 基于 eBPF 或者 eBPF 相关的其它组件][3]

    *   [文档][24]
        *   [关于 BPF][4]

        *   [关于 tc][5]

        *   [关于 XDP][6]

        *   [关于 P4 和 BPF][7]

    *   [教程][25]

    *   [示例][26]
        *   [来自内核的示例][8]

        *   [来自包 iproute2 的示例][9]

        *   [来自 bcc 工具集的示例][10]

        *   [手册页面][11]

    *   [代码][27]
        *   [内核中的 BPF 代码][12]

        *   [XDP 钩子（hook）代码][13]

        *   [bcc 中的 BPF 逻辑][14]

        *   [通过 tc 使用代码去管理 BPF][15]

        *   [BPF 实用工具][16]

        *   [其它感兴趣的 chunks][17]

        *   [LLVM 后端][18]

        *   [在用户空间中运行][19]

        *   [提交日志][20]

    *   [排错][28]
        *   [编译时的错误][21]

        *   [加载和运行时的错误][22]

    *   [更多][29]

 _~ [更新于][146] 2017-11-02 ~_ 

# 什么是 BPF?

BPF，是伯克利包过滤器（**B**erkeley **P**acket **F**ilter）的第一个字母的组合,最初构想于 1992 年，是为了提供一种过滤包的方法，以避免从内核到用户空间的无用的数据包副本。它最初是由从用户空间注入到内核的一个简单的字节码构成，它在哪里通过一个校验器进行检查 — 以避免内核崩溃或者安全问题 — 并附加到一个套接字上，然后运行在每个接收到的包上。几年后它被移植到 Linux 上，并且应用于一小部分应用程序上（例如，tcpdump）。简化的语言以及存在于内核中的即时编译器（JIT），使 BPF 成为一个性能卓越的工具。

然后，在 2013 年，Alexei Starovoitov 对 BPF 进行彻底地改造，并增加了新的功能，改善了它的性能。这个新版本被命名为 eBPF （意思是 “extended BPF”），同时将以前的变成 cBPF（意思是 “classic” BPF）。出现了如映射（maps）和 tail 调用（calls）。JIT 编译器被重写了。新的语言比 cBPF 更接近于原生机器语言。并且，在内核中创建了新的附加点。

感谢那些新的钩子，eBPF 程序才可以被设计用于各种各样的使用案例，它分为两个应用领域。其中一个应用领域是内核跟踪和事件监控。BPF 程序可以被附加到 kprobes，并且它与其它跟踪模式相比，有很多的优点（有时也有一些缺点）。

其它的应用领域是网络程序。除了套接字过滤器，eBPF 程序可以附加到 tc（Linux 流量控制工具） ingress 或者 egress 接口，并且用一种高效的方式去执行各种包处理任务。它在这个领域打开了一个新的思路。

并且 eBPF 的性能通过为 IO Visor 项目开发的技术进一步得到提升：也为 XDP（“eXpress Data Path”）增加了新的钩子，它是不久前增加到内核中的一种新的快速路径。XDP 与 Linux 栈一起工作，并且依赖 BPF 去执行更快的包处理。

甚至一些项目，如 P4、Open vSwitch、[考虑][155] 或者开始去接近（approach）BPF。其它的一些，如 CETH、Cilium，则是完全基于它的。BPF 是如此流行，因此，我们可以预计到不久后，将围绕它有很多工具和项目出现 …

# 深入理解字节码

就像我一样：我的一些工作（包括 [BEBA][156]）是非常依赖 eBPF 的，并且在这个网站上以后的几篇文章将关注于这个主题。从逻辑上说，在这篇文章中我在深入到细节之前，希望以某种方式去介绍 BPF — 我的意思是，一个真正的介绍，更多的在 BPF 上开发的功能，它在开始节已经提供了一些简短的摘要：什么是 BPF 映射？ Tail 调用？内部结构是什么样子？等等。但是，在这个网站上已经有很多这个主题的介绍了，并且，我也不希望去创建 “另一个 BPF 介绍” 的重复的文章。

毕竟，我花费了很多的时间去阅读和学习关于 BPF 的知识，并且，也是这么做的，因此，在这里我们将要做的是，我收集了非常多的关于 BPF 的阅读材料：介绍、文档、也有教程或者示例。这里有很多的材料可以去阅读，但是，为了去阅读它，首先要去 _找到_ 它。因此，为了能够帮助更多想去学习和使用 BPF 的人，现在的这篇文章是介绍了一个资源列表。这里有各种阅读材料，它可以帮你深入理解内核字节码的机制。

# 资源

![](https://qmonnet.github.io/whirl-offload/img/icons/pic.svg)

### 简介

这篇文章中下面的链接提供了一个 BPF 的基本的概述，或者，一些与它密切相关的一些主题。如果你对 BPF 非常陌生，你可以在这些介绍文章中挑选出一篇你喜欢的文章去阅读。如果你已经理解了 BPF，你可以针对特定的主题去阅读，下面是阅读清单。

### 关于 BPF

关于 eBPF 的简介：

*   [_利用 BPF 和 XDP 实现可编程的内核网络数据路径_][53]  (Daniel Borkmann, OSSNA17, Los Angeles, September 2017):
    快速理解所有的关于 eBPF 和 XDP 的基础概念的许多文章中的一篇（大多数是关于网络处理的）

*   [BSD 包过滤器][54] (Suchakra Sharma, June 2017): 
    一篇非常好的介绍文章，大多数是关于跟踪方面的。

*   [_BPF：跟踪及更多_][55]  (Brendan Gregg, January 2017):
    大多数内容是跟踪使用案例相关的。

*   [_Linux BPF 的超强功能_][56]  (Brendan Gregg, March 2016):
    第一部分是关于 **火焰图（flame graphs）** 的使用。

*   [_IO Visor_][57]  (Brenden Blanco, SCaLE 14x, January 2016):
    介绍了 **IO Visor 项目**。

*   [_大型机上的 eBPF_][58]  (Michael Holzheu, LinuxCon, Dubin, October 2015)

*   [_在 Linux 上新的（令人激动的）跟踪新产品_][59]  (Elena Zannoni, LinuxCon, Japan, 2015)

*   [_BPF — 内核中的虚拟机_][60]  (Alexei Starovoitov, February 2015):
    eBPF 的作者写的一篇介绍文章。

*   [_扩展 extended BPF_][61]  (Jonathan Corbet, July 2014)

**BPF 内部结构**：

*   Daniel Borkmann 正在做的一项令人称奇的工作，它用于去展现 eBPF 的 **内部结构**，特别是通过几次关于 **eBPF 用于 tc ** 的演讲和论文。
    *   [_使用 tc 的 cls_bpf 的高级可编程和它的最新更新_][30]  (netdev 1.2, Tokyo, October 2016):
        Daniel 介绍了 eBPF 的细节，它使用了隧道和封装、直接包访问、和其它特性。

    *   [_自 netdev 1.1 以来的 cls_bpf/eBPF 更新_][31]  (netdev 1.2, Tokyo, October 2016, part of [this tc workshop][32])

    *   [_使用 cls_bpf 实现完全可编程的 tc 分类器_][33]  (netdev 1.1, Sevilla, February 2016)：
        介绍 eBPF 之后，它提供了许多 BPF 内部机制（映射管理、tail 调用、校验器）的见解。对于大多数有志于 BPF 的人来说，这是必读的！[全文在这里][34]。

    *   [_Linux tc 和 eBPF_][35]  (fosdem16, Brussels, Belgium, January 2016)

    *   [_eBPF 和 XDP 攻略和最新更新_][36]  (fosdem17, Brussels, Belgium, February 2017)

    这些介绍可能是理解 eBPF 内部机制设计与实现的最佳文档资源之一。

[**IO Visor 博客**][157] 有一些关于 BPF 感兴趣的技术文章。它们中的一些包含了许多营销讨论。

**内核跟踪**：总结了所有的已有的方法，包括 BPF：

*   [_邂逅 eBPF 和内核跟踪_][62]  (Viller Hsiao, July 2016):
    Kprobes、uprobes、ftrace

*   [_Linux 内核跟踪_][63]  (Viller Hsiao, July 2016):
    Systemtap、Kernelshark、trace-cmd、LTTng、perf-tool、ftrace、hist-trigger、perf、function tracer、tracepoint、kprobe/uprobe …

关于 **事件跟踪和监视**，Brendan Gregg 使用 eBPF 的一些心得，它使用 eBPFR 的一些案例，他做的非常出色。如果你正在做一些内核跟踪方面的工作，你应该去看一下他的关于 eBPF 和火焰图相关的博客文章。其中的大多数都可以 [从这篇文章中][158] 访问，或者浏览他的博客。

介绍 BPF，也介绍 **Linux 网络的一般概念**：

*   [_Linux 网络详解_][64]  (Thomas Graf, LinuxCon, Toronto, August 2016)

*   [_内核网络攻略_][65]  (Thomas Graf, LinuxCon, Seattle, August 2015)

**硬件 offload**（译者注：offload 是指原本由软件来处理的一些操作交由硬件来完成，以提升吞吐量，降低 CPU 负荷。）：

*   eBPF 与 tc 或者 XDP 一起支持硬件 offload，开始于 Linux 内核版本 4.9，并且由  Netronome 提出的。这里是关于这个特性的介绍：[eBPF/XDP hardware offload to SmartNICs][147] (Jakub Kicinski 和 Nic Viljoen, netdev 1.2, Tokyo, October 2016)

关于 **cBPF**：

*   [_BSD 包过滤器：一个用户级包捕获的新架构_][66] (Steven McCanne 和 Van Jacobson, 1992)：
    它是关于（classic）BPF 的最早的论文。

*   [关于 BPF 的 FreeBSD 手册][67] 是理解 cBPF 程序的可用资源。

*   关于 cBPF,Daniel Borkmann 实现的至少两个演示，[一是，在 2013 年 mmap 中，BPF 和 Netsniff-NG][68]，以及 [在 2014 中关于 tc 和 cls_bpf 的的一个非常完整的演示][69]。

*   在 Cloudflare 的博客上，Marek Majkowski 提出的它的 [BPF 字节码与 **iptables** 的 `xt_bpf` 模块一起的应用][70]。值得一提的是，从 Linux 内核 4.10 开始，eBPF 也是通过这个模块支持的。(虽然，我并不知道关于这件事的任何讨论或者文章）

*   [Libpcap 过滤器语法][71]

### 关于 XDP

*   在 IO Visor 网站上的 [XDP 概述][72]。

*   [_eXpress Data Path (XDP)_][73]  (Tom Herbert, Alexei Starovoitov, March 2016):
    这是第一个关于 XDP 的演示。

*   [_BoF - BPF 能为你做什么？_][74]  (Brenden Blanco, LinuxCon, Toronto, August 2016)。

*   [_eXpress Data Path_][148]  (Brenden Blanco, Linux Meetup at Santa Clara, July 2016)：
    包含一些（有点营销的意思？）**benchmark 结果**！使用一个单核心：
    *   ip 路由丢弃： ~3.6 百万包每秒（Mpps）

    *   使用 BPF，tc（使用 clsact qdisc）丢弃： ~4.2 Mpps

    *   使用 BPF，XDP 丢弃：20 Mpps （CPU 利用率 < 10%）

    *   XDP 重写转发（在端口上它接收到的包）：10 Mpps

    （测试是用 mlx4 驱动执行的）。

*   Jesper Dangaard Brouer 有几个非常好的幻灯片，它可以从本质上去理解 XDP 的内部结构。
    *   [_XDP − eXpress Data Path, Intro and future use-cases_][37]  (September 2016):
         _“Linux 内核与 DPDK 的斗争”_ 。**未来的计划**（在写这篇文章时）它用 XDP 和 DPDK 进行比较。

    *   [_网络性能研讨_][38]  (netdev 1.2, Tokyo, October 2016):
        关于 XDP 内部结构和预期演化的附加提示。

    *   [_XDP – eXpress Data Path, 可用于 DDoS 防护_][39]  (OpenSourceDays, March 2017):
        包含了关于 XDP 的详细情况和使用案例、用于 **benchmarking** 的 **benchmark 结果**、和 **代码片断**，以及使用 eBPF/XDP（基于一个 IP 黑名单模式）的用于 **基本的 DDoS 防护**。

    *   [_内存 vs. 网络，激发和修复内存瓶颈_][40]  (LSF Memory Management Summit, March 2017):
        面对 XDP 开发者提出关于当前 **内存问题** 的许多细节。不要从这一个开始，如果你已经理解了 XDP，并且想去了解它在页面分配方面的真实工作方式，这是一个非常有用的资源。

    *   [_XDP 能为其它人做什么_][41]（netdev 2.1, Montreal, April 2017），with Andy Gospodarek：
        对于普通人使用 eBPF 和 XDP 怎么去开始。这个演示也由 Julia Evans 在 [他的博客][42] 上做了总结。

    （ Jesper 也创建了并且尝试去扩展了有关 eBPF 和 XDP 的一些文档，查看 [相关节][75]。）

*   [_XDP 研讨 — 介绍、体验、和未来发展_][76]（Tom Herbert, netdev 1.2, Tokyo, October 2016) — 在这篇文章中，只有视频可用，我不知道是否有幻灯片。

*   [_在 Linux 上进行高速包过滤_][149]  (Gilberto Bertin, DEF CON 25, Las Vegas, July 2017) — 在 Linux 上的最先进的包过滤的介绍，面向 DDoS 的保护、讨论了关于在内核中进行包处理、内核旁通、XDP 和 eBPF。

### 关于 基于 eBPF 或者 eBPF 相关的其它组件

*   [_在边缘上的 P4_][77]  (John Fastabend, May 2016):
    提出了使用 **P4**，一个包处理的描述语言，使用 BPF 去创建一个高性能的可编程交换机。

*   如果你喜欢音频的介绍，这里有一个相关的 [OvS Orbit 片断(#11)，叫做 _在边缘上的 **P4**_][78]，日期是 2016 年 8 月。OvS Orbit 是对 Ben Pfaff 的访谈，它是 Open vSwitch 的其中一个核心维护者。在这个场景中，John Fastabend 是被访谈者。

*   [_P4, EBPF 和 Linux TC Offload_][79]  (Dinan Gunawardena and Jakub Kicinski, August 2016):
    另一个演示 **P4** 的，使用一些相关的元素在 Netronome 的 **NFP**（网络流处理器）架构上去实现 eBPF 硬件 offload。

*   **Cilium** 是一个由 Cisco 最先发起的技术，它依赖 BPF 和 XDP 去提供 “在容器中基于 eBPF 程序，在运行中生成的强制实施的快速的内核中的网络和安全策略”。[这个项目的代码][150] 在 GitHub 上可以访问到。Thomas Graf 对这个主题做了很多的演示：
    *   [_Cilium: 对容器利用 BPF & XDP 实现网络 & 安全_][43]，也特别展示了一个负载均衡的使用案例（Linux Plumbers conference, Santa Fe, November 2016）

    *   [_Cilium: 对容器利用 BPF & XDP 实现网络 & 安全_][44] （Docker Distributed Systems Summit, October 2016 — [video][45]）

    *   [_Cilium: 使用 BPF 和 XDP 的快速 IPv6 容器网络_][46] （LinuxCon, Toronto, August 2016）

    *   [_Cilium: 为窗口使用 BPF & XDP_][47] （fosdem17, Brussels, Belgium, February 2017）

    在不同的演示中重复了大量的内容；如果有疑问，就选最近的一个。Daniel Borkmann 作为 Google 开源博客的特邀作者，也写了 [Cilium 简介][80]。

*   这里也有一个关于 **Cilium** 的播客节目：一个 [OvS Orbit episode (#4)][81]，它是 Ben Pfaff 访谈 Thomas Graf （2016 年 5 月），和 [另外一个 Ivan Pepelnjak 的播客][82]，仍然是 Thomas Graf 的与 eBPF、P4、XDP 和 Cilium （2016 年 10 月）。

*   **Open vSwitch** (OvS)，它是 **Open Virtual Network**（OVN，一个开源的网络虚拟化解决方案）相关的项目，正在考虑在不同的层次上使用 eBPF，它已经实现了几个概念验证原型：

    *   [使用 eBPF 的 Offloading OVS 流处理器][48] (William (Cheng-Chun) Tu, OvS conference, San Jose, November 2016)

    *   [将 OVN 的灵活性与 IOVisor 的高效率相结合][49] (Fulvio Risso, Matteo Bertrone and Mauricio Vasquez Bernal, OvS conference, San Jose, November 2016)

    据我所知，这些 eBPF 的使用案例看上去仅处于提议阶段（并没有合并到 OvS 的主分支中），但是，看它带来了什么将是非常有趣的事情。

*   XDP 的设计对分布式拒绝访问（DDoS）攻击是非常有用的。越来越多的演示都关注于它。例如，从 Cloudflare 中的人们的讨论（[_XDP in practice: integrating XDP in our DDoS mitigation pipeline_][83]）或者从 Facebook 上（[_Droplet: DDoS countermeasures powered by BPF + XDP_][84]）在 netdev 2.1 会议上，在 Montreal、Canada、在 2017 年 4 月，都存在这样的很多使用案例。

*   [_CETH for XDP_][85] （Yan Chan 和 Yunsong Lu、Linux Meetup、Santa Clara、July 2016）：
    **CETH**，是由 Mellanox 发起的，为实现更快的网络 I/O 而主张的通用以太网驱动程序架构。

*   [**VALE 交换机**][86]，另一个虚拟交换机，它可以与 netmap 框架结合，有 [一个 BPF 扩展模块][87]。

*   **Suricata**，一个开源的入侵检测系统，它的捕获旁通特性 [似乎是依赖于 eBPF 组件][88]：
     [_The adventures of a Suricate in eBPF land_][89]  (Éric Leblond, netdev 1.2, Tokyo, October 2016)
     [_eBPF and XDP seen from the eyes of a meerkat_][90]  (Éric Leblond, Kernel Recipes, Paris, September 2017)

*   [InKeV: 对于 DCN 的内核中分布式网络虚拟化][91] (Z. Ahmed, M. H. Alizai and A. A. Syed, SIGCOMM, August 2016):
    **InKeV** 是一个基于 eBPF 的虚拟网络、目标数据中心网络的数据路径架构。它最初由 PLUMgrid 提出，并且声称相比基于 OvS 的 OpenStack 解决方案可以获得更好的性能。

*   [_**gobpf** - 从 Go 中利用 eBPF_][92] （Michael Schubert, fosdem17, Brussels, Belgium, February 2017）：
    “一个从 Go 中的库，可以去创建、加载和使用 eBPF 程序”

*   [**ply**][93] 是为 Linux 实现的一个小的但是非常灵活的开源动态 **跟踪器**，它的一些特性非常类似于 bcc 工具，是受 awk 和 dtrace 启发，但使用一个更简单的语言。它是由 Tobias Waldekranz 写的。

*   如果你读过我以前的文章，你可能对我在这篇文章中的讨论感兴趣，[使用 eBPF 实现 OpenState 接口][151]，关于包状态处理，在 fosdem17 中。

![](https://qmonnet.github.io/whirl-offload/img/icons/book.svg)

### 文档

一旦你对 BPF 是做什么的有一个大体的理解。你可以抛开一般的演示而深入到文档中了。下面是 BPF 的规范和功能的最全面的文档，按你的需要挑一个开始阅读吧！

### 关于 BPF

*   **BPF 的规范**（包含 classic 和 extended 版本）可以在 Linux 内核的文档中，和特定的文件 [linux/Documentation/networking/filter.txt][94] 中找到。BPF 使用以及它的内部结构也被记录在那里。此外，当加载 BPF 代码失败时，在这里可以找到 **被校验器抛出的错误信息**，这有助于你排除不明确的错误信息。

*   此外，在内核树中，在 eBPF 那里有一个关于 **常见的问 & 答** 的文档，它在文件 [linux/Documentation/bpf/bpf_design_QA.txt][95] 中。

*   … 但是，内核文档是非常难懂的，并且非常不容易阅读。如果你只是去查找一个简单的 eBPF 语言的描述，可以去 IO Visor 的 GitHub 仓库，那儿有 [它的 **概括性描述**][96]。

*   顺便说一下，IO Visor 项目收集了许多 **关于 BPF 的资源**。大部分，分别在 bcc 仓库的 [文档目录][97] 中，和 [bpf-docs 仓库][98] 的整个内容中，它们都在 GitHub 上。注意，这个非常好的 [BPF **参考指南**][99] 包含一个详细的 BPF C 和 bcc Python 的 helper 的描述。

*   想深入到 BPF，那里有一些必要的 **Linux 手册页**。第一个是 [`bpf(2)` man page][100] 关于 `bpf()` **系统调用**，它用于从用户空间去管理 BPF 程序和映射。它也包含一个 BPF 高级特性的描述（程序类型、映射、等等）。第二个是主要去处理希望去附加到 tc 接口的 BPF 程序：它是 [`tc-bpf(8)` man page][101]，它是 **使用 BPF 和 tc** 的一个参考，并且包含一些示例命令和参考代码。

*   Jesper Dangaard Brouer 发起了一个 **更新 eBPF Linux 文档** 的尝试，包含 **不同的映射**。[他有一个草案][102]，欢迎去贡献。一旦完成，这个文档将被合并进 man 页面并且进入到内核文档。

*   Cilium 项目也有一个非常好的 [**BPF 和 XDP 参考指南**][103]，它是由核心的 eBPF 开发者写的，它被证明对于 eBPF 开发者是极其有用的。

*   David Miller 在 [xdp-newbies][152] 邮件列表中发了几封关于 eBPF/XDP 内部结构的富有启发性的电子邮件。我找不到一个单独的地方收集它们的链接，因此，这里是一个列表：

    *   [bpf.h 和你 …][50]

    *   [Contextually speaking…][51]

    *   [BPF 校验器概述][52]

    最后一个可能是目前来说关于校验器的最佳的总结。

*   Ferris Ellis 发布的 [一个关于 **eBPF 的系列博客文章**][104]。作为我写的这个短文，第一篇文章是关于 eBPF 的历史背景和未来期望。接下来的文章将更多的是技术方面，和前景展望。

*   [一个 **每个内核版本的 BPF 特性列表**][153] 在 bcc 仓库中可以找到。如果你想去知道运行一个给定的特性所要求的最小的内核版本，它是非常有用的。我贡献和添加了链接到提交中，它介绍了每个特性，因此，你也可以从那里很容易地去访问提交历史。

### 关于 tc

当为了网络目的使用 BPF 与 tc 进行结合时，Linux 流量控制（**t**raffic **c**ontrol）工具，它可用于去采集关于 tc 的可用功能的信息。这里有几个关于它的资源。

*   找到关于 **Linux 上 QoS** 的简单教程是很困难的。这里有两个链接，它们很长而且很难懂，但是，如果你可以抽时间去阅读它，你将学习到几乎关于 tc 的任何东西（虽然，关于 BPF 它什么也没有)。它们在这里：[_怎么去实现流量控制_  (Martin A. Brown, 2006)][105]，和 [_怎么去实现 Linux 的高级路由 & 流量控制_  (“LARTC”) (Bert Hubert & al., 2002)][106]。

*   在你的系统上的 **tc 手册页面** 并不是最新日期的，因为它们中的几个最近已经增加了。如果你没有找到关于特定的队列规则、分类或者过滤器的文档，它可能在最新的 [tc 组件的手册页面][107] 中。

*   一些额外的材料可以在 iproute2 包自已的文件中找到：这个包中有 [一些文档][108]，包括一些文件，它可以帮你去理解 [**tc 的 action** 的功能][109]。
    **注意：** 这些文件在 2017 年 10 月 已经从 iproute2 中删除，然而，从 Git 历史中却一直可用。

*   非精确资料：这里是 [一个关于 tc 的几个特性的研讨会][110]（包含过滤、BPF、tc offload、…） 由 Jamal Hadi Salim 在 netdev 1.2 会议上组织的（October 2016）。

*   额外信息 — 如果你使用 `tc` 较多，这里有一些好消息：我用这个工具 [写了一个 bash 完整的功能][111]，并且它被包 iproute2 带到内核版本 4.6 和更高版中！

### 关于 XDP

*   对于 XDP 的一些 [进展中的文档（包括规范）][112] 已经由 Jesper Dangaard Brouer 启动，并且意味着将成为一个合作的工作。正在推进（2016 年 9 月）：你期望它去改变，并且或许在一些节点上移动（Jesper [称为贡献][113]，如果你想去改善它）。

*   自来 Cilium 项目的 [BPF 和 XDP 参考指南][114] … 好吧，这个名字已经说明了一切。

### 关于 P4 和 BPF

[P4][159] 是一个用于指定交换机行为的语言。它可以被编译为许多种目标硬件或软件。因此，你可能猜到了，这些目标中的一个就是 BPF … 仅部分支持的：一些 P4 特性并不能被转化到 BPF 中，并且，用类似的方法，BPF 可以做的事情，而使用 P4 却不能表达出现。不过，**P4 与 BPF 使用** 的相关文档，[用于去隐藏在 bcc 仓库中][160]。这个改变在 P4_16 版本中，p4c 引用的编辑器包含 [一个 eBPF 后端][161]。

![](https://qmonnet.github.io/whirl-offload/img/icons/flask.svg)

### 教程

Brendan Gregg 为想去 **使用 bcc 工具** 跟踪和监视内核中的事件的人制作了一个非常好的 **教程**。[第一个教程是关于如何使用 bcc 工具][162]，它总共有十一步，教你去理解怎么去使用已有的工具，而 [**针对 Python 开发者** 的一个目标][163] 是专注于开发新工具，它总共有十七节 “课程”。

Sasha Goldshtein 也有一些 [_**Linux 跟踪研究材料**_][164] 涉及到使用几个 BPF 去进行跟踪。

作者为 Jean-Tiare Le Bigot 的文章为 ping 请求和回复，提供了一个详细的（和有指导意义的）[使用 perf 和 eBPF 去设置一个低级的跟踪器][165] 的示例。

对于网络相关的 eBPF 使用案例也有几个教程。那里有一些有趣的文档，包含一个 _eBPF Offload 入门指南_，由 Netronome 在 [Open NFP][166] 平台上操作的。其它的那些，来自 Jesper 的演讲，[_XDP 能为其它人做什么_][167]，可能是 XDP 入门的最好的方法之一。

![](https://qmonnet.github.io/whirl-offload/img/icons/gears.svg)

### 示例

有示例是非常好的。看看它们是如何工作的。但是 BPF 程序示例是分散在几个项目中的，因此，我列出了我所知道的所有的示例。示例并不是使用相同的 helper（例如，tc 和 bcc 都有一套它们自己的 helper，使它可以很容易地去用 C 语言写 BPF 程序）

### 来自内核的示例

主要的程序类型都包含在内核的示例中：过滤器绑定到套接字或者到 tc 接口、事件跟踪/监视、甚至是 XDP。你可以在 [linux/samples/bpf/][168] 目录中找到这些示例。

也不要忘记去看一下 git 相关的提交历史，它们有一些指定的特性的介绍，它们也包含一些特性的详细的示例。

### 来自包 iproute2 的示例

iproute2 包也提供了几个示例。它们都很明显地偏向网络编程，因此，这个程序是附加到 tc ingress 或者 egress 接口上。这些示例在 [iproute2/examples/bpf/][169] 目录中。

### 来自 bcc 工具集的示例

许多示例都 [与 bcc 一起提供][170]：

*   一些网络编程的示例在关联的目录下面。它们包括套接字过滤器、tc 过滤器、和一个 XDP 程序。

*   `tracing` 目录包含许多 **跟踪编程** 的示例。前面的教程中提到的都在那里。那些程序涉及了事件跟踪的很大的一个范围，并且，它们中的一些是面向生产系统的。注意，某些 Linux 分发版（至少是 Debian、Ubuntu、Fedora、Arch Linux）、这些程序已经被 [打包了][115] 并且可以很 “容易地” 通过比如 `# apt install bcc-tools` 进行安装。但是在写这篇文章的时候（除了 Arch Linux），第一个要求是去安装 IO Visor 的包仓库。

*   那里也有 **使用 Lua** 作为一个不同的 BPF 后端（那是因为 BPF 程序是用 Lua 写的，它是 C 语言的一个子集，它允许为前端和后端使用相同的语言）的一些示例，它在第三个目录中。

### 手册页面

虽然 bcc 一般可以用很容易的方式在内核中去注入和运行一个 BPF 程序，通过 `tc` 工具去将程序附加到 tc 接口也可以被执行。因此，如果你打算将 **BPF 与 tc 一起使用**，你可以在 [`tc-bpf(8)` 手册页面][171] 中找到一些调用示例。

![](https://qmonnet.github.io/whirl-offload/img/icons/srcfile.svg)

### 代码

有时候，BPF 文档或者示例并不足够多，而且你可能没有其它的方式在你喜欢的文本编辑器（它当然应该是 Vim）中去显示代码并去阅读它。或者，你可能深入到代码中想去做一个补丁程序或者为机器增加一些新特性。因此，这里对有关的文件的几个建议，找到你想要的功能取决于你自己！

### 在内核中的 BPF 代码

*   文件 [linux/include/linux/bpf.h][116] 和它的副本 [linux/include/uapi/bpf.h][117] 包含有关 eBPF 的 **定义**，它分别被内核中和用户空间程序的接口使用。

*   相同的方式，文件 [linux/include/linux/filter.h][118] 和 [linux/include/uapi/filter.h][119] 包含的信息被 **运行的 BPF 程序** 使用。

*   BPF 相关的 **主要的代码片断** 在 [linux/kernel/bpf/][120] 目录下面。**被系统以不同的操作许可调用** 比如，程序加载或者映射管理是在文件 `syscall.c` 中实现，虽然 `core.c` 包含在 **解析器** 中。其它的文件有明显的命名：`verifier.c` 包含在 **校验器** 中（不是开玩笑的），`arraymap.c` 的代码用于与阵列类型的 **映射** 去互动，等等。

*  **helpers**，以及几个网络（与 tc、XDP 一起）和用户可用的相关功能是实现在 [linux/net/core/filter.c][121] 中。它也包含代码去移植 cBPF 字节码到 eBPF 中（因为在运行之前，内核中的所有的 cBPF 程序被转换成 eBPF）

*   **JIT 编译器** 在它们各自的架构目录下面，比如，x86 架构的在 [linux/arch/x86/net/bpf_jit_comp.c][122] 中。

*   在 [linux/net/sched/][123] 目录下，你可以找到 **tc 的 BPF 组件** 相关的代码，尤其是在文件 `act_bpf.c` （action）和 `cls_bpf.c`（filter）中。

*   我并没有在 BPF 上深入到 **事件跟踪** 中，因此，我并不真正了解这些程序的钩子。在 [linux/kernel/trace/bpf_trace.c][124] 那里有一些东西。如果你对它感 兴趣，并且想去了解更多，你可以在 Brendan Gregg 的演示或者博客文章上去深入挖掘。

*   我也没有使用过 **seccomp-BPF**。但它的代码在 [linux/kernel/seccomp.c][125]，并且可以在 [linux/tools/testing/selftests/seccomp/seccomp_bpf.c][126] 中找到一些它的使用示例。

### XDP 钩子代码

一旦将 BPF 虚拟机加载进内核，由一个 Netlink 命令将 **XDP** 程序从用户空间钩入到内核网络路径中。接收它的是在 [linux/net/core/dev.c][172] 文件中的被调用的 `dev_change_xdp_fd()` 函数，并且由它设置一个 XDP 钩子。比如，钩子位于在 NICs 支持的驱动中。例如，为一些 Mellanox 硬件使用的 mlx4 驱动的钩子实现在 [drivers/net/ethernet/mellanox/mlx4/][173] 目录下的文件中。文件 en_netdev.c 接收 Netlink 命令并调用 `mlx4_xdp_set()`，它再被在文件 en_rx.c 实现的实例 `mlx4_en_process_rx_cq()` 调用（对于 RX 侧）。

### 在 bcc 中的 BPF 逻辑 

[在 bcc 的 GitHub 仓库][174] 上找到的 **bcc** 工具集的其中一个代码。**Python 代码**，包含在 `BPF` 类中，最初它在文件 [bcc/src/python/bcc/__init__.py][175] 中。但是许多感兴趣的东西 — 我的意见是 — 比如，加载 BPF 程序到内核中，碰巧在 [libbcc 的 **C 库**][176]中。

### 使用 tc 去管理 BPF 的代码

**在 tc** 中与 iproute2 包中一起带来的与 BPF 相关的代码。其中的一些在 [iproute2/tc/][177] 目录中。文件 f_bpf.c 和 m_bpf.c（和 e_bpf.c）是各自用于处理 BPF 的过滤器和动作的（和tc `exec` 命令，或许什么命令都可以）。文件 q_clsact.c 定义了 `clsact`，qdisc 是为 BPF 特别创建的。但是，**大多数的 BPF 用户空间逻辑** 是在 [iproute2/lib/bpf.c][178] 库中实现的，因此，如果你想去使用 BPF 和 tc，这里可能是会将你搞混乱的地方（它是从文件 iproute2/tc/tc_bpf.c 中来的，你也可以在旧版本的包中找到代码相同的地方）。

### BPF 实用工具

内核中也带有 BPF 相关的三个工具的源代码（`bpf_asm.c`, `bpf_dbg.c`, `bpf_jit_disasm.c`)、根据你的版本不同，在 [linux/tools/net/][179] 或者 [linux/tools/bpf/][180] 目录下面：

*   `bpf_asm` 是一个极小的汇编程序。

*   `bpf_dbg` 是一个很小的 cBPF 程序调试器。

*   `bpf_jit_disasm` 对于两种 BPF 都是通用的，并且对于 JIT 调试来说非常有用。

*   `bpftool` 是由 Jakub Kicinski 写的通用工具，并且它可以与 eBPF 程序和来自用户空间的映射进行交互，例如，去展示、转储、pin 程序、或者去展示、创建、pin、更新、删除映射。

阅读在源文件顶部的注释可以得到一个它们使用方法的概述。

### 其它感兴趣的 chunks

如果你对关于 BPF 的不常见的语言的使用感兴趣，bcc 包含 [一个为 BPF 目标的 **P4 编译器**][181]以及 [一个 **Lua 前端**][182]，它可以被使用，它以代替 C 的一个子集，并且（在 Lua 的案例中）可以用于 Python 工具。

### LLVM 后端

在 [这个提交][183] 中，clang / LLVM 用于将 C 编译成 BPF 后端，将它添加到 LLVM 源（也可以在 [the GitHub mirror][184] 上访问）。

### 在用户空间中运行

到目前为止，我知道那里有至少两种 eBPF 用户空间实现。第一个是 [uBPF][185]，它是用 C 写的。它包含一个解析器、一个 x86_64 架构的 JIT 编译器、一个汇编器和一个反汇编器。

uBPF 的代码似乎被重用了，去产生了一个 [通用实现][186]，claims 支持 FreeBSD 内核、FreeBSD 用户空间、Linux 内核、Linux 用户空间和 Mac OSX 用户空间。它被 [VALE 交换机的 BPF 扩展模块][187]使用。

其它用户空间的实现是我做的：[rbpf][188]，基于 uBPF，但是用 Rust 写的。写了解析器和 JIT 编译器 （Linux 下两个都有，Mac OSX 和 Windows 下仅有解析器），以后可能会有更多。

### 提交日志

正如前面所说的，如果你希望得到更多的关于它的信息，不要犹豫，去看一些提交日志，它介绍了一些特定的 BPF 特性。你可以在许多地方搜索日志，比如，在 [git.kernel.org][189]、[在 GitHub 上][190]、或者如果你克隆过它还有你的本地仓库中。如果你不熟悉 git，你可以尝试像这些去做 `git blame <file>` 去看看介绍特定代码行的提交内容，然后，`git show <commit>` 去看详细情况（或者在 `git log` 的结果中按关键字搜索，但是这样做通常比较单调乏味）也可以看在 bcc 仓库中的 [按内核版本区分的 eBPF 特性列表][191]，它链接到相关的提交上。

![](https://qmonnet.github.io/whirl-offload/img/icons/wand.svg)

### 排错

对 eBPF 的狂热是最近的事情，因此，到目前为止我还找不到许多关于怎么去排错的资源。所以这里只有几个，在使用 BPF 进行工作的时候，我对自己遇到的问题进行了记录。

### 编译时的错误

*   确保你有一个最新的 Linux 内核版本（也可以看 [这个文档][127]）。

*   如果你自己编译内核：确保你安装了所有正确的组件，包括内核镜像、头文件和 libc。

*   当使用 `tc-bpf`（用于去编译 C 代码到 BPF 中）的 man 页面提供的 `bcc` shell 函数时：我只是添加包含 clang 调用的头部：

    ```
    __bcc() {
            clang -O2 -I "/usr/src/linux-headers-$(uname -r)/include/" \
                      -I "/usr/src/linux-headers-$(uname -r)/arch/x86/include/" \
                    -emit-llvm -c $1 -o - | \
            llc -march=bpf -filetype=obj -o "`basename $1 .c`.o"
    }

    ```

    (seems fixed as of today).

*   对于使用 `bcc` 的其它问题，不要忘了去看一看这个工具集的 [答疑][128]。

*   如果你从一个并不精确匹配你的内核版本的 iproute2 包中下载了示例，可能会通过在文件中包含的头文件触发一些错误。这些示例片断都假设安装在你的系统中内核的头文件与 iproute2 包是相同版本的。如果不是这种情况，下载正确的 iproute2 版本，或者编辑示例中包含的文件的路径，指向到 iproute2 中包含的头文件上（在运行时一些问题可能或者不可能发生，取决于你使用的特性）。

### 在加载和运行时的错误

*   使用 tc 去加载一个程序，确保你使用了一个与使用中的内核版本等价的 iproute2 中的 tc 二进制文件。

*   使用 bcc 去加载一个程序，确保在你的系统上安装了 bcc（仅下载源代码去运行 Python 脚本是不够的）。

*   使用 tc，如果 BPF 程序不能返回一个预期值，检查调用它的方式：过滤器、或者动作、或者使用 “直接传动” 模式的过滤器。

*   静态使用 tc，注意不使用过滤器，动作不会直接附加到 qdiscs 或者接口。

*   通过内核校验器抛出错误到解析器可能很难。[内核文档][129]或许可以提供帮助，因此，可以 [参考指南][130] 或者，万不得一的情况下，可以去看源代码（祝你好运！）。记住，校验器 _不运行_ 程序，对于这种类型的错误，它也是非常重要的。如果你得到一个关于无效内存访问或者关于未初始化的数据的错误，它并不意味着那些问题真实发生了（或者有时候，它们完全有可能发生）。它意味着你的程序是以校验器预计可能发生错误的方式写的，并且因此而拒绝这个程序。

*   注意 `tc` 工具有一个 `verbose` 模式，它与 BPF 一起工作的很好：在你的命令行尾部尝试追加一个 `verbose`。

*   bcc 也有一个 verbose 选项：`BPF` 类有一个 `debug` 参数，它可以带 `DEBUG_LLVM_IR`、`DEBUG_BPF` 和 `DEBUG_PREPROCESSOR` 三个标志中任何组合（详细情况在 [源文件][131]中）。 为调试代码，它甚至嵌入了 [一些条件去打印输出代码][132]。

*   LLVM v4.0+ 为 eBPF 程序 [嵌入一个反汇编器][133]。因此，如果你用 clang 编译你的程序，在编译时添加 `-g` 标志允许你通过内核校验器去以人类可读的格式去转储你的程序。处理转储文件，使用：

    ```
    $ llvm-objdump -S -no-show-raw-insn bpf_program.o

    ```

*   使用映射工作？你想去看 [bpf-map][134]，一个为 Cilium 项目而用 Go 创建的非常有用的工具，它可以用于去转储内核中 eBPF 映射的内容。那里也有在 Rust 中的 [一个克隆][135]。

*   那里有一个旧的 [在 **StackOverflow** 上的 `bpf` 标签][136]，但是，在这篇文章中它一直没有被使用过（并且那里几乎没有与新的 eBPF 相关的东西）。如果你是一位来自未来的阅读者，你可能想去看看在这方面是否有更多的活动。

![](https://qmonnet.github.io/whirl-offload/img/icons/zoomin.svg)

### 更多！

*   如果你想很容易地去 **测试 XDP**，那是 [一个 Vagrant 设置][137] 可以使用。你也可以 **测试 bcc**[在一个 Docker 容器中][138]。

*   想知道围绕 BPF 的 **开发和活动** 在哪里吗？好吧，内核补丁总是结束于 [netdev 上的邮件列表][139]（相关 Linux 内核的网络栈开发）：以关键字 “BPF” 或者 “XDP” 来搜索。自 2017 年 4 月开始，那里也有 [一个专门用于 XDP 编程的邮件列表][140]（是为了架构或者寻求帮助）。[在 IO Visor 的邮件列表上][141]也有许多的讨论和辨论，因为 BPF 是一个重要的项目。如果你只是想随时了解情况，那里也有一个 [@IOVisor Twitter 帐户][142]。

我经常会回到这篇博客中，来看一看 [关于 BPF][192] 有没有新的文章！

_特别感谢 Daniel Borkmann 指引我找到了许多的 [附加的文档][154]，因此我才完成了这个合集。_

--------------------------------------------------------------------------------

via: https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/

作者：[Quentin Monnet ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://qmonnet.github.io/whirl-offload/about/
[1]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-bpf
[2]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-xdp
[3]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-other-components-related-or-based-on-ebpf
[4]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-bpf-1
[5]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-tc
[6]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-xdp-1
[7]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-p4-and-bpf
[8]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#from-the-kernel
[9]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#from-package-iproute2
[10]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#from-bcc-set-of-tools
[11]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#manual-pages
[12]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#bpf-code-in-the-kernel
[13]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#xdp-·s-code
[14]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#bpf-logic-in-bcc
[15]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#code-to-manage-bpf-with-tc
[16]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#bpf-utilities
[17]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#other-interesting-chunks
[18]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#llvm-backend
[19]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#running-in-userspace
[20]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#commit-logs
[21]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#errors-at-compilation-time
[22]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#errors-at-load-and-run-time
[23]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#generic-presentations
[24]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#documentation
[25]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#tutorials
[26]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#examples
[27]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#the-code
[28]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#troubleshooting
[29]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#and-still-more
[30]:http://netdevconf.org/1.2/session.html?daniel-borkmann
[31]:http://netdevconf.org/1.2/slides/oct5/07_tcws_daniel_borkmann_2016_tcws.pdf
[32]:http://netdevconf.org/1.2/session.html?jamal-tc-workshop
[33]:http://www.netdevconf.org/1.1/proceedings/slides/borkmann-tc-classifier-cls-bpf.pdf
[34]:http://www.netdevconf.org/1.1/proceedings/papers/On-getting-tc-classifier-fully-programmable-with-cls-bpf.pdf
[35]:https://archive.fosdem.org/2016/schedule/event/ebpf/attachments/slides/1159/export/events/attachments/ebpf/slides/1159/ebpf.pdf
[36]:https://fosdem.org/2017/schedule/event/ebpf_xdp/
[37]:http://people.netfilter.org/hawk/presentations/xdp2016/xdp_intro_and_use_cases_sep2016.pdf
[38]:http://netdevconf.org/1.2/session.html?jesper-performance-workshop
[39]:http://people.netfilter.org/hawk/presentations/OpenSourceDays2017/XDP_DDoS_protecting_osd2017.pdf
[40]:http://people.netfilter.org/hawk/presentations/MM-summit2017/MM-summit2017-JesperBrouer.pdf
[41]:http://netdevconf.org/2.1/session.html?gospodarek
[42]:http://jvns.ca/blog/2017/04/07/xdp-bpf-tutorial/
[43]:http://www.slideshare.net/ThomasGraf5/clium-container-networking-with-bpf-xdp
[44]:http://www.slideshare.net/Docker/cilium-bpf-xdp-for-containers-66969823
[45]:https://www.youtube.com/watch?v=TnJF7ht3ZYc&list=PLkA60AVN3hh8oPas3cq2VA9xB7WazcIgs
[46]:http://www.slideshare.net/ThomasGraf5/cilium-fast-ipv6-container-networking-with-bpf-and-xdp
[47]:https://fosdem.org/2017/schedule/event/cilium/
[48]:http://openvswitch.org/support/ovscon2016/7/1120-tu.pdf
[49]:http://openvswitch.org/support/ovscon2016/7/1245-bertrone.pdf
[50]:https://www.spinics.net/lists/xdp-newbies/msg00179.html
[51]:https://www.spinics.net/lists/xdp-newbies/msg00181.html
[52]:https://www.spinics.net/lists/xdp-newbies/msg00185.html
[53]:http://schd.ws/hosted_files/ossna2017/da/BPFandXDP.pdf
[54]:https://speakerdeck.com/tuxology/the-bsd-packet-filter
[55]:http://www.slideshare.net/brendangregg/bpf-tracing-and-more
[56]:http://fr.slideshare.net/brendangregg/linux-bpf-superpowers
[57]:https://www.socallinuxexpo.org/sites/default/files/presentations/Room%20211%20-%20IOVisor%20-%20SCaLE%2014x.pdf
[58]:https://events.linuxfoundation.org/sites/events/files/slides/ebpf_on_the_mainframe_lcon_2015.pdf
[59]:https://events.linuxfoundation.org/sites/events/files/slides/tracing-linux-ezannoni-linuxcon-ja-2015_0.pdf
[60]:https://events.linuxfoundation.org/sites/events/files/slides/bpf_collabsummit_2015feb20.pdf
[61]:https://lwn.net/Articles/603983/
[62]:http://www.slideshare.net/vh21/meet-cutebetweenebpfandtracing
[63]:http://www.slideshare.net/vh21/linux-kernel-tracing
[64]:http://www.slideshare.net/ThomasGraf5/linux-networking-explained
[65]:http://www.slideshare.net/ThomasGraf5/linuxcon-2015-linux-kernel-networking-walkthrough
[66]:http://www.tcpdump.org/papers/bpf-usenix93.pdf
[67]:http://www.gsp.com/cgi-bin/man.cgi?topic=bpf
[68]:http://borkmann.ch/talks/2013_devconf.pdf
[69]:http://borkmann.ch/talks/2014_devconf.pdf
[70]:https://blog.cloudflare.com/introducing-the-bpf-tools/
[71]:http://biot.com/capstats/bpf.html
[72]:https://www.iovisor.org/technology/xdp
[73]:https://github.com/iovisor/bpf-docs/raw/master/Express_Data_Path.pdf
[74]:https://events.linuxfoundation.org/sites/events/files/slides/iovisor-lc-bof-2016.pdf
[75]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#about-xdp-1
[76]:http://netdevconf.org/1.2/session.html?herbert-xdp-workshop
[77]:https://schd.ws/hosted_files/2016p4workshop/1d/Intel%20Fastabend-P4%20on%20the%20Edge.pdf
[78]:https://ovsorbit.benpfaff.org/#e11
[79]:http://open-nfp.org/media/pdfs/Open_NFP_P4_EBPF_Linux_TC_Offload_FINAL.pdf
[80]:https://opensource.googleblog.com/2016/11/cilium-networking-and-security.html
[81]:https://ovsorbit.benpfaff.org/
[82]:http://blog.ipspace.net/2016/10/fast-linux-packet-forwarding-with.html
[83]:http://netdevconf.org/2.1/session.html?bertin
[84]:http://netdevconf.org/2.1/session.html?zhou
[85]:http://www.slideshare.net/IOVisor/ceth-for-xdp-linux-meetup-santa-clara-july-2016
[86]:http://info.iet.unipi.it/~luigi/vale/
[87]:https://github.com/YutaroHayakawa/vale-bpf
[88]:https://www.stamus-networks.com/2016/09/28/suricata-bypass-feature/
[89]:http://netdevconf.org/1.2/slides/oct6/10_suricata_ebpf.pdf
[90]:https://www.slideshare.net/ennael/kernel-recipes-2017-ebpf-and-xdp-eric-leblond
[91]:https://github.com/iovisor/bpf-docs/blob/master/university/sigcomm-ccr-InKev-2016.pdf
[92]:https://fosdem.org/2017/schedule/event/go_bpf/
[93]:https://wkz.github.io/ply/
[94]:https://www.kernel.org/doc/Documentation/networking/filter.txt
[95]:https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/tree/Documentation/bpf/bpf_design_QA.txt?id=2e39748a4231a893f057567e9b880ab34ea47aef
[96]:https://github.com/iovisor/bpf-docs/blob/master/eBPF.md
[97]:https://github.com/iovisor/bcc/tree/master/docs
[98]:https://github.com/iovisor/bpf-docs/
[99]:https://github.com/iovisor/bcc/blob/master/docs/reference_guide.md
[100]:http://man7.org/linux/man-pages/man2/bpf.2.html
[101]:http://man7.org/linux/man-pages/man8/tc-bpf.8.html
[102]:https://prototype-kernel.readthedocs.io/en/latest/bpf/index.html
[103]:http://docs.cilium.io/en/latest/bpf/
[104]:https://ferrisellis.com/tags/ebpf/
[105]:http://linux-ip.net/articles/Traffic-Control-HOWTO/
[106]:http://lartc.org/lartc.html
[107]:https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/man/man8
[108]:https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git/tree/doc?h=v4.13.0
[109]:https://git.kernel.org/pub/scm/linux/kernel/git/shemminger/iproute2.git/tree/doc/actions?h=v4.13.0
[110]:http://netdevconf.org/1.2/session.html?jamal-tc-workshop
[111]:https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/commit/bash-completion/tc?id=27d44f3a8a4708bcc99995a4d9b6fe6f81e3e15b
[112]:https://prototype-kernel.readthedocs.io/en/latest/networking/XDP/index.html
[113]:https://marc.info/?l=linux-netdev&m=147436253625672
[114]:http://docs.cilium.io/en/latest/bpf/
[115]:https://github.com/iovisor/bcc/blob/master/INSTALL.md
[116]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/linux/bpf.h
[117]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/bpf.h
[118]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/linux/filter.h
[119]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/include/uapi/linux/filter.h
[120]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/kernel/bpf
[121]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/net/core/filter.c
[122]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/arch/x86/net/bpf_jit_comp.c
[123]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/net/sched
[124]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/kernel/trace/bpf_trace.c
[125]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/kernel/seccomp.c
[126]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/tools/testing/selftests/seccomp/seccomp_bpf.c
[127]:https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md
[128]:https://github.com/iovisor/bcc/blob/master/FAQ.txt
[129]:https://www.kernel.org/doc/Documentation/networking/filter.txt
[130]:https://github.com/iovisor/bcc/blob/master/docs/reference_guide.md
[131]:https://github.com/iovisor/bcc/blob/master/src/python/bcc/__init__.py
[132]:https://github.com/iovisor/bcc/blob/master/docs/reference_guide.md#output
[133]:https://www.spinics.net/lists/netdev/msg406926.html
[134]:https://github.com/cilium/bpf-map
[135]:https://github.com/badboy/bpf-map
[136]:https://stackoverflow.com/questions/tagged/bpf
[137]:https://github.com/iovisor/xdp-vagrant
[138]:https://github.com/zlim/bcc-docker
[139]:http://lists.openwall.net/netdev/
[140]:http://vger.kernel.org/vger-lists.html#xdp-newbies
[141]:http://lists.iovisor.org/pipermail/iovisor-dev/
[142]:https://twitter.com/IOVisor
[143]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#what-is-bpf
[144]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#dive-into-the-bytecode
[145]:https://qmonnet.github.io/whirl-offload/2016/09/01/dive-into-bpf/#resources
[146]:https://github.com/qmonnet/whirl-offload/commits/gh-pages/_posts/2016-09-01-dive-into-bpf.md
[147]:http://netdevconf.org/1.2/session.html?jakub-kicinski
[148]:http://www.slideshare.net/IOVisor/express-data-path-linux-meetup-santa-clara-july-2016
[149]:https://cdn.shopify.com/s/files/1/0177/9886/files/phv2017-gbertin.pdf
[150]:https://github.com/cilium/cilium
[151]:https://fosdem.org/2017/schedule/event/stateful_ebpf/
[152]:http://vger.kernel.org/vger-lists.html#xdp-newbies
[153]:https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md
[154]:https://github.com/qmonnet/whirl-offload/commit/d694f8081ba00e686e34f86d5ee76abeb4d0e429
[155]:http://openvswitch.org/pipermail/dev/2014-October/047421.html
[156]:https://qmonnet.github.io/whirl-offload/2016/07/15/beba-research-project/
[157]:https://www.iovisor.org/resources/blog
[158]:http://www.brendangregg.com/blog/2016-03-05/linux-bpf-superpowers.html
[159]:http://p4.org/
[160]:https://github.com/iovisor/bcc/tree/master/src/cc/frontends/p4
[161]:https://github.com/p4lang/p4c/blob/master/backends/ebpf/README.md
[162]:https://github.com/iovisor/bcc/blob/master/docs/reference_guide.md
[163]:https://github.com/iovisor/bcc/blob/master/docs/tutorial_bcc_python_developer.md
[164]:https://github.com/goldshtn/linux-tracing-workshop
[165]:https://blog.yadutaf.fr/2017/07/28/tracing-a-packet-journey-using-linux-tracepoints-perf-ebpf/
[166]:https://open-nfp.org/dataplanes-ebpf/technical-papers/
[167]:http://netdevconf.org/2.1/session.html?gospodarek
[168]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/samples/bpf
[169]:https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/examples/bpf
[170]:https://github.com/iovisor/bcc/tree/master/examples
[171]:http://man7.org/linux/man-pages/man8/tc-bpf.8.html
[172]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/net/core/dev.c
[173]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/mellanox/mlx4/
[174]:https://github.com/iovisor/bcc/
[175]:https://github.com/iovisor/bcc/blob/master/src/python/bcc/__init__.py
[176]:https://github.com/iovisor/bcc/blob/master/src/cc/libbpf.c
[177]:https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/tc
[178]:https://git.kernel.org/cgit/linux/kernel/git/shemminger/iproute2.git/tree/lib/bpf.c
[179]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/tools/net
[180]:https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git/tree/tools/bpf
[181]:https://github.com/iovisor/bcc/tree/master/src/cc/frontends/p4/compiler
[182]:https://github.com/iovisor/bcc/tree/master/src/lua
[183]:https://reviews.llvm.org/D6494
[184]:https://github.com/llvm-mirror/llvm/commit/4fe85c75482f9d11c5a1f92a1863ce30afad8d0d
[185]:https://github.com/iovisor/ubpf/
[186]:https://github.com/YutaroHayakawa/generic-ebpf
[187]:https://github.com/YutaroHayakawa/vale-bpf
[188]:https://github.com/qmonnet/rbpf
[189]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
[190]:https://github.com/torvalds/linux
[191]:https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md
[192]:https://qmonnet.github.io/whirl-offload/categories/#BPF


