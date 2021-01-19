GCC：优化 Linux、互联网和一切
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gcc-paper.jpg?itok=QFNUZWsV)

软件如果不能被电脑运行，那么它就是无用的。而在处理 run-time 性能的问题上，即使是最有才华的开发人员也会受编译器的支配——因为如果没有可靠的编译器工具链，就无法构建任何重要的东西。GNU Compiler Collection（GCC）提供了一个健壮、成熟和高性能的工具，帮助您充分发挥你代码的潜能。经过几十年成千上万人的开发，GCC 成为了世界上最受尊敬的编译器之一。如果您正在构建应用程序而不使用 GCC，那么您可能错过了最佳解决方案。

根据 LLVM.org 的说法，GCC 是“如今事实上的标准开源编译器”[1]，它可以从内核开始的构建完整的系统。GCC 支持超过 60 种硬件平台，包括 ARM、Intel、AMD、IBM POWER、SPARC、HP PA-RISC 和 IBM Z，以及各种操作环境，包括 GNU、Linux、Windows、macOS、FreeBSD、NetBSD、OpenBSD、DragonFly BSD、Solaris、AIX、HP- ux 和 RTEMS。它提供了高度兼容的 C/C++ 编译器，并支持流行的 C 库，如 GNU C Library（glibc）、Newlib、musl 和各种 BSD 操作系统中包含的 C 库，以及 Fortran、Ada 和 GO 语言的前端。GCC 还可以作为一个交叉编译器，为运行编译器的平台以外的其他平台创建可执行代码。GCC 是紧密集成的 GNU 工具链的核心组件，由 GNU 项目产生，包括 glibc、Binutils 和 GNU 调试器（GDB）。

“一直以来我最喜欢的 GNU 工具是 GCC。在开发工具非常昂贵的时候，GCC 是第二个 GNU 工具，它使一个社区能够编写和构建所有其他工具。这个工具一手改变了行业，导致了自由软件运动的诞生，因为一个好的、自由的编译器是一个社区软件的先决条件。”—— Red Hat 开源和标准团队的 Dave Neary。[2]

### 优化 Linux

作为 Linux 内核源代码的默认编译器，GCC 提供了可靠、稳定的性能以及正确构建内核所需的扩展。GCC 是流行的 Linux 发行版的标准组件，比如 ArchLinux、CentOS、Debian、Fedora、openSUSE 和 Ubuntu，在这些发行版中，GCC 通常用来编译支持系统的组件。这包括 Linux 使用的默认库（如 libc、libm、libintl、libssh、libssl、libcrypto、libexpat、libpthread 和 ncurses），这些库依赖于 GCC 来提供可靠性和高性能，并且使应用程序和系统程序可以访问 Linux 内核功能。发行版中包含的许多应用程序包也是用 GCC 构建的，例如 Python、Perl、Ruby、nginx、Apache HTTP 服务器、OpenStack、Docker 和 OpenShift。各个 Linux 发行版使用 GCC 构建的大量代码组成了内核、库和应用程序软件。对于 openSUSE 发行版，几乎 100% 的本机代码是由 GCC 构建的，包括 6135 个源程序包，5705 个共享库和 38927 个可执行文件。这相当于每周编译 24540 个源代码包。[3]

Linux 发行版中包含的 GCC 的基本版本用于创建定义系统应用程序二进制接口（ABI）的内核和库。用户空间开发者可以选择下载 GCC 的最新稳定版本，以获得高级功能、性能优化和可用性改进。Linux 发行版提供安装说明或预构建的工具链，用于部署最新版本的 GCC 以及其他 GNU 工具，这些工具有助于提高开发人员的工作效率和缩短部署时间。

### 优化互联网

GCC 是嵌入式系统中被广泛采用的核心编译器之一，支持为日益增长的物联网设备开发软件。GCC 提供了许多扩展，使其非常适合嵌入式系统软件开发，包括使用编译器内置的细粒度控制、#pragmas、内联汇编和以应用程序为中心的命令行选项。GCC 支持广泛的嵌入式体系结构，包括 ARM、AMCC、AVR、Blackfin、MIPS、RISC-V、Renesas Electronics V850、NXP 和 Freescale Power 处理器，可以生成高效、高质量的代码。GCC 提供的交叉编译功能是开源社区至关重要的功能，预构建的交叉编译工具链[4]是被广泛运用的工具。例如，GNU ARM 嵌入式工具链是集成和已被验证的软件包，具有 ARM 嵌入式 GCC 编译器、库和裸机软件开发所需的其他工具。这些工具链可用于在 Windows、Linux 和 macOS 主机操作系统上对流行的 ARM Cortex-R 和 Cortex-M 处理器进行交叉编译，这些处理器已在数百亿台支持互联网的设备中发布。[5]

GCC 支持云计算，为需要直接管理计算资源的软件提供可靠的开发平台，如数据库和 web 服务引擎以及备份和安全软件。GCC 完全兼容 C++ 11 和 C++ 14，为 C++ 17 和 C++ 2a [6] 提供实验支持，创建具有可靠调试信息的性能目标代码。使用 GCC 的应用程序的一些例子包括：MySQL 数据库管理系统，它依赖于 Linux 的 GCC [7]；Apache HTTP 服务器，它建议使用 GCC [8]；Bacula，一个企业级网络备份工具，它依赖于 GCC。[9]

### 优化一切

为了研究和开发用于高性能计算(HPC)的科学代码，GCC 提供了成熟的 C、C++ 和 Fortran 前端，并支持基于指令的并行编程的 OpenMP 和 OpenACC api。因为 GCC 提供了跨计算环境的可移植性，它使得代码能够更容易地在各种新的和遗留的客户机和服务器平台上进行测试。GCC 为 C, C++ 和 Fortran 编译器提供了 OpenMP 4.0 的完整支持，为 C 和 C++ 编译器提供了 OpenMP 4.5 完整支持。对于 OpenACC, GCC 支持大多数 2.5 规范和性能优化，并且是唯一提供 [OpenACC][1] 支持的非商业、非学术编译器。

代码性能是这个社区的一个重要参数，GCC 提供了一个坚实的性能基础。Colfax Research 于 2017 年 11 月发表的一篇论文评估了 C++ 编译器在 OpenMP 4.x 指令下并行编译代码的速度和代码运行速度。图 1 描绘了不同编译器编译并使用单个线程运行时计算内核的相对性能。使 G++ 的性能标定为 1.0，将其他编译器性能值规范化处理。

![performance][3]

图1 为由不同编译器编译的每个内核的相对性能。(单线程，越高越好)。

[Used with permission][4]

论文总结道：“GNU 编译器在我们的测试中也做得很好。G++ 在六种情况中的三种情况下生成的代码速度是第二快的，并且在编译时间方面是最快的编译器之一。”[10]

### 谁在用 GCC?

在 JetBrains 2018 年的开发者生态状况调查中，在接受调查的 6000 名开发者中，66% 的 C++ 程序员和 73% 的 C 程序员经常使用 GCC。[11] 以下简要介绍 GCC 的优点，正是这些优点使它在开发人员社区中如此受欢迎。

  * 对于需要为各种新的和遗留的计算平台和操作环境编写代码的开发人员，GCC 提供了对最广泛的硬件和操作环境的支持。硬件供应商提供的编译器主要侧重于对其产品的支持，而其他开源编译器在所支持的硬件和操作系统方面则受到很大限制。[12]

  * 有各种各样的基于 GCC 的预构建工具链，这对嵌入式系统开发人员特别有吸引力。这包括 GNU ARM 嵌入式工具链和 Bootlin 网站上提供的 138 个预编译交叉编译器工具链。[13] 虽然其他开源编译器（如 Clang/LLVM）可以取代现有交叉编译工具链中的 GCC，但开发人员需要完全重建这些工具链。[14]

  * GCC 通过成熟的编译器平台向应用程序开发人员提供可靠、稳定的性能。在 AMD EPYC 平台上用 GCC 8/9 与 LLVM Clang 6/7 编译器基准测试的文章提供了 49 个基准测试的结果，这些测试的编译器在三个优化级别上运行。使用 “-O3 -march=native”级别的 GCC 8.2 RC1 在 34% 的时间里排在第一位，而在相同的优化级别 LLVM Clang 6.0 在 20% 的时间里赢得了第二位。[15]
  
  * GCC 为编译调试 [16] 提供了改进的诊断，并为运行调试提供了准确而有用的信息。GCC 与 GDB 紧密集成，GDB 是一个成熟且功能齐全的工具，它提供“不间断”调试，可以在断点处停止单个线程。
  
  * GCC 是一个受良好支持的平台，它有一个活跃的、承诺的社区，支持当前版本和以前的两个版本。对于每年发布一次的计划，这为一个版本提供了两年的支持。

### GCC：仍然在继续优化 Linux，互联网和所有事情

GCC 作为世界级的编译器继续向前发展。GCC 的最新版本是 8.2，于 2018 年 7 月发布，增加了对即将推出的 Intel CPU、更多 ARM CPU 的硬件支持，并提高了 AMD 的 ZEN CPU 的性能。初始 C17 支持已经添加到 C++ 2A 的初始工作中。诊断继续得到改进，包括更好的发射诊断，改进的定位、定位范围，并修复提示，特别是在 C++ 前端。Red Hat 的 David Malcolm 在 2018 年 3 月撰写的博客概述了 GCC 8 中的可用性改进。[17]

新的硬件平台继续依赖 GCC 工具链进行软件开发，例如 RISC-V，这是一种对机器学习、人工智能（AI）和物联网细分市场感兴趣的免费开放 ISA。GCC 仍然是 Linux 系统持续开发的关键组件。Clear Linux Project for Intel Architecture 是一个针对云、客户端和物联网用例构建的新兴发行版，它提供了一个很好的示例，说明如何使用和改进 GCC 编译器技术来提高基于 Linux 的系统的性能和安全性。GCC 还被用于微软 Azure Sphere 的应用程序开发，这是一个基于 Linux 的物联网应用程序操作系统，最初支持基于 ARM 的联发科 MT3620 处理器。在开发下一代程序员方面，GCC 也是树莓派的 Windows 工具链的核心组件，树莓派是一种运行基于 Debian 的 GNU/Linux 的低成本嵌入式板，用于促进学校和发展中国家的基础计算机科学教学。

GCC 于 1987 年 3 月 22 日由 GNU 项目的创始人 richardstallman 首次发布，它被认为是一个重大突破，因为它是第一个作为自由软件发布的可移植的 ANSI C 优化编译器。GCC 由来自世界各地的程序员组成的社区在指导委员会的指导下维护，该指导委员会确保对项目进行广泛的、有代表性的监督。GCC 的社区方法是它的优势之一，它形成了一个由开发人员和用户组成的庞大而多样化的社区，为项目做出贡献并提供支持。根据 Open Hub，“GCC 是世界上最大的开源团队之一，在 Open Hub 上的所有项目团队中排名前 2%。”[18]

关于 GCC 的许可问题，人们进行了大量的讨论，其中大多数是混淆而不是启发。GCC 在 GNU 通用公共许可证版本 3 或更高版本下发布，但运行时库例外。这是一个 copyleft 许可，这意味着衍生作品只能在相同的许可条款下分发。GPLv3 旨在保护 GCC 不被私有化，并要求对 GCC 代码的更改可以自由公开地进行。对于“最终用户”来说，编译器与其他编译器完全相同；使用 GCC 对您自己的代码所做的任何许可选择都没有区别。[19]

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/10/gcc-optimizing-linux-internet-and-everything

作者：[Margaret Lewis][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/margaret-lewis
[b]: https://github.com/lujun9972
[1]: https://www.openacc.org/tools
[2]: /files/images/gccjpg-0
[3]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gcc_0.jpg?itok=HbGnRqWX "performance"
[4]: https://www.linux.com/licenses/category/used-permission
