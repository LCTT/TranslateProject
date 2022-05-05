[#]: subject: (A new open source operating system for embedded systems)
[#]: via: (https://opensource.com/article/21/7/rt-thread-smart)
[#]: author: (Zhu Tianlong https://opensource.com/users/zhu-tianlong)
[#]: collector: (lujun9972)
[#]: translator: (tendertime)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

一种新的开源嵌入式操作系统
======
RT-Thread Smart 致力于物联网和边缘计算领域的开源。

![An intersection of pipes.][1]

目前[嵌入式操作系统][2]有巨大的需求，最好能够开源。 [RT-Thread][3]项目的研发团队花了三年时间，研究出了该项目的最新成果：RT-Thread Smart。 这是一款微内核的操作系统，主要针对中高端的处理器如具有内存管理单元（MMU）的 RISC-V，为嵌入式领域的所有行业提供了具有竞争力的软件平台。

### 谁需要 RT-Thread Smart?

RT-Thread Smart 是一款专业的、高性能的微内核操作系统，用于实时应用。它为所有市场的嵌入式设备（如安全（互联网协议摄像头）、工业控制、车载设备、消费电子及其他嵌入式科技应用，可谓一切）提供了开源基础。这一点十分重要：不像传统的物联网操作系统，一个微内核的操作系统可以填补传统实时操作系统 RTOS 和相对大型的操作系统如 Linux之间的不足，实现实时性、成本、启动速度等等各方面之间最好的取舍。

### RT-Thread Smart 的架构

RT-Thread Smart 通过 MMU 和系统调用将系统分割为内核模式和用户模式，并为每种模式区分了地址空间（一个 32 位系统可以提供 4 G 的地址空间）。

![RT-Thread Smart 架构][4]

(RT-Thread, [CC BY-SA 4.0)][5]

RT-Thread Smart 内核包括平台的基础功能，并支持定制化。RT-Thread Smart的用户应用环境使用[musl libc][6] 提供[POSIX][7] 接口调用和 C 语言的运行支持。 它也继承了原始的 RT-Thread 生态系统， 使用[SCons][8] 或者其他编译工具如 [Autotools][9]， Makefiles， [CMake][10] 等等来支持开发，以及 RT-Thread 的现成在线软件包（撰写本文时超过342个）。您甚至可以将Linux应用程序（如 wget/cURL、BusyBox、OpenSSL和Simple DirectMedia Layer）移植到您的平台。

压缩的 RT-Thread Smart 内核仅 217 KB，搭配一个 127 KB 的根文件系统和大约 2 MB的存储占用，包括了对文件系统、网络协议栈、多媒体的完整支持。 RT-Thread 需要 3 到 5 秒完成启动，而在不运行其他功能组件时， RT-Thread Smart 需要的启动及准备时间不到 500 ms 。

通过整合用户权限接口组件，RT-Thread Smart 从上电到运行 UI 需要大约 1 秒。换句话说，这是一个非常小而且快的系统。当然，实时不是指启动，而是指系统随着时间推进而表现出的一致性。 对于 RT-Thread ，实时性能需要优先考虑，中断时延小于 1 μs, 满足大部分实时性要求严格的场景需求。

### RT-Thread Smart 和 RT-Thread

你可能想知道 RT-Thread Smart 和 RT-Thread 之间的不同。简单来说， RT-Thread Smart 是一个基于 RT-Thread RTOS的操作系统，但它整合了用户态的处理过程。RT-Smart 的内核部分本质上是 RT-Thread RTOS，它在虚拟地址上运行，加入了进程管理，使用进程间通信机制，虚拟内存/地址空间管理， ELF 加载器等等，以上特性全部在 RT-Thread RTOS 内实现，当 IwP 组件被禁用时， RT-Smart 会回归 RT-Thread RTOS。

以下是对比:

| | RT-Thread | RT-Thread Smart 
 :-----| :----: | :----: 
支持芯片 | Cortex-M/R, RISC-V RV32IMAC (以及类似), Cortex-A MPU | Cortex-A等具有 MMU 的 MPU
编译 | 内核和应用都编译到映像程序. | 内核和应用可以被分开编译和运行
存储 | 使用线性地址空间(即使有 MMU)，使用虚拟地址和物理地址 | 运行在内核占用超过 1GB 的32位操作系统， 用户态进程拥有彼此独立的地址空间，外设驱动程序必须通过虚拟地址访问外设
运行错误 | 当一个应用程序失败时，整个系统就会崩溃 | 当应用程序失败时，它不会影响内核和其他进程的执行
运行模式 | 多进程模型 | 多进程模型 (进程内支持多线程，内核支持内核线程)
用户模型 | 单用户模型 | 单用户模型
API | RT-Thread API, POSIX PSE52 | RT-Thread API (内核态和用户态), 额外有一个 POSIX API
实时性 | 抢占式硬实时系统 | 抢占式硬实时系统
资源使用 | 非常小 | 相对小
调试 | 通常需要模拟器调试 | 根据软件调试，不需要模拟器

RT-Thread RTOS 非常紧凑，它的所有应用和子系统都编译到映像中，多任务运行并分享相同的地址空间。

RT-Thread Smart 是独立的。系统和应用被分别编译和运行。应用拥有完整且互相独立的地址空间。它也继承了 RT-Thread 优秀的实时性，同时也具有 POSIX 环境的特性。


类似地，他们都与 RT-Thread API 兼容。RT-Thread RTOS 的应用可以被平滑移植到 RT-Thread Smart。

### 嵌入式开源

RT-Thread Smart 是一个开源项目，项目地址： [GitHub][11]. 您可以下载代码和文档，尝试提交评论和反馈，将该项目传播给更多开源倡导者。 嵌入式系统属于他们的用户，太多嵌入式开发人员没有认识到什么是可用的。

如果您是开发人员，请破解 RT-Thread Smart。随着 RT-Thread 项目的不断推进，我们希望创建物联网和边缘计算的令人激动的开源世界。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/rt-thread-smart

作者：[Zhu Tianlong][a]
选题：[lujun9972][b]
译者：[tendertime](https://github.com/tendertime)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/zhu-tianlong
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://opensource.com/article/20/6/open-source-rtos
[3]: https://www.rt-thread.io/
[4]: https://opensource.com/sites/default/files/uploads/rt-thread-smart.png (RT-Thread Smart architecture)
[5]: https://creativecommons.org/licenses/by-sa/4.0/legalcode
[6]: https://musl.libc.org/
[7]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[8]: https://scons.org/
[9]: https://opensource.com/article/19/7/introduction-gnu-autotools
[10]: https://opensource.com/article/21/5/cmake
[11]: https://github.com/RT-Thread/rt-thread/tree/rt-smart
