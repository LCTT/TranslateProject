GCC：优化 Linux、互联网和一切
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gcc-paper.jpg?itok=QFNUZWsV)

软件如果不能被电脑运行，那么它就是无用的。而在处理 run-time 性能的问题上，即使是最有才华的开发人员也会受编译器的支配——因为如果没有可靠的编译器工具链，就无法构建任何重要的东西。GNU Compiler Collection（GCC）提供了一个健壮、成熟和高性能的工具，帮助您充分发挥你代码的潜能。经过几十年成千上万人的开发，GCC 成为了世界上最受尊敬的编译器之一。如果您正在构建应用程序而不使用 GCC，那么您可能错过了最佳解决方案。

根据 LLVM.org 的说法，GCC 是“如今事实上的标准开源编译器”[1]，它可以从内核开始的构建完整的系统。GCC 支持超过 60 种硬件平台，包括 ARM、Intel、AMD、IBM POWER、SPARC、HP PA-RISC 和 IBM Z，以及各种操作环境，包括 GNU、Linux、Windows、macOS、FreeBSD、NetBSD、OpenBSD、DragonFly BSD、Solaris、AIX、HP- ux 和 RTEMS。它提供了高度兼容的 C/C++ 编译器，并支持流行的 C 库，如 GNU C Library（glibc）、Newlib、musl 和各种 BSD 操作系统中包含的 C库，以及 Fortran、Ada 和 GO 语言的前端。GCC 还可以作为一个交叉编译器，为运行编译器的平台以外的其他平台创建可执行代码。GCC 是紧密集成的 GNU 工具链的核心组件，由 GNU 项目产生，包括 glibc、Binutils 和 GNU 调试器（GDB）。

“一直以来我最喜欢的 GNU 工具是 GCC。在开发工具非常昂贵的时候，GCC 是第二个 GNU 工具，它使一个社区能够编写和构建所有其他工具。这个工具一手改变了行业，导致了自由软件运动的诞生，因为一个好的、自由的编译器是一个社区软件的先决条件。”——Red Hat开源和标准团队的 Dave Neary。[2]

### 优化 Linux

As the default compiler for the Linux kernel source, GCC delivers trusted, stable performance along with the additional extensions needed to correctly build the kernel. GCC is a standard component of popular Linux distributions, such as Arch Linux, CentOS, Debian, Fedora, openSUSE, and Ubuntu, where it routinely compiles supporting system components. This includes the default libraries used by Linux (such as libc, libm, libintl, libssh, libssl, libcrypto, libexpat, libpthread, and ncurses) which depend on GCC to provide correctness and performance and are used by applications and system utilities to access Linux kernel features. Many of the application packages included with a distribution are also built with GCC, such as Python, Perl, Ruby, nginx, Apache HTTP Server, OpenStack, Docker, and OpenShift. This combination of kernel, libraries, and application software translates into a large volume of code built with GCC for each Linux distribution. For the openSUSE distribution nearly 100% of native code is built by GCC, including 6,135 source packages producing 5,705 shared libraries and 38,927 executables. This amounts to about 24,540 source packages compiled weekly. [3]

The base version of GCC included in Linux distributions is used to create the kernel and libraries that define the system Application Binary Interface (ABI). User space developers have the option of downloading the latest stable version of GCC to gain access to advanced features, performance optimizations, and improvements in usability. Linux distributions offer installation instructions or prebuilt toolchains for deploying the latest version of GCC along with other GNU tools that help to enhance developer productivity and improve deployment time.

### Optimizing the Internet

GCC is one of the most widely adopted core compilers for embedded systems, enabling the development of software for the growing world of IoT devices. GCC offers a number of extensions that make it well suited for embedded systems software development, including fine-grained control using compiler built-ins, #pragmas, inline assembly, and application-focussed command-line options. GCC supports a broad base of embedded architectures, including ARM, AMCC, AVR, Blackfin, MIPS, RISC-V, Renesas Electronics V850, and NXP and Freescale Power-based processors, producing efficient, high quality code. The cross-compilation capability offered by GCC is critical to this community, and prebuilt cross-compilation toolchains [4] are a major requirement. For example, the GNU ARM Embedded toolchains are integrated and validated packages featuring the Arm Embedded GCC compiler, libraries, and other tools necessary for bare-metal software development. These toolchains are available for cross-compilation on Windows, Linux and macOS host operating systems and target the popular ARM Cortex-R and Cortex-M processors, which have shipped in tens of billions of internet capable devices. [5]

GCC empowers Cloud Computing, providing a reliable development platform for software that needs to directly manages computing resources, like database and web serving engines and backup and security software. GCC is fully compliant with C++11 and C++14 and offers experimental support for C++17 and C++2a [6], creating performant object code with a solid debugging information. Some examples of applications that utilize GCC include: MySQL Database Management System, which requires GCC for Linux [7]; the Apache HTTP Server, which recommends using GCC [8]; and Bacula, an enterprise ready network backup tool which require GCC. [9]

### Optimizing Everything

For the research and development of the scientific codes used in High Performance Computing (HPC), GCC offers mature C, C++, and Fortran front ends as well as support for OpenMP and OpenACC APIs for directive-based parallel programming. Because GCC offers portability across computing environments, it enables code to be more easily targeted and tested across a variety of new and legacy client and server platforms. GCC offers full support for OpenMP 4.0 for C, C++ and Fortran compilers and full support for OpenMP 4.5 for C and C++ compilers. For OpenACC, GCC supports most of the 2.5 specification and performance optimizations and is the only non-commercial, nonacademic compiler to provide [OpenACC][1] support.

Code performance is an important parameter to this community and GCC offers a solid performance base. A Nov. 2017 paper published by Colfax Research evaluates C++ compilers for the speed of compiled code parallelized with OpenMP 4.x directives and for the speed of compilation time. Figure 1 plots the relative performance of the computational kernels when compiled by the different compilers and run with a single thread. The performance values are normalized so that the performance of G++ is equal to 1.0.

![performance][3]

Figure 1. Relative performance of each kernel as compiled by the different compilers. (single-threaded, higher is better).

[Used with permission][4]

The paper summarizes “the GNU compiler also does very well in our tests. G++ produces the second fastest code in three out of six cases and is amongst the fastest compiler in terms of compile time.” [10]

### Who Is Using GCC?

In The State of Developer Ecosystem Survey in 2018 by JetBrains, out of 6,000 developers who took the survey GCC is regularly used by 66% of C++ programmers and 73% of C programmers. [11] Here is a quick summary of the benefits of GCC that make it so popular with the developer community.

  * For developers required to write code for a variety of new and legacy computing platforms and operating environments, GCC delivers support for the broadest range of hardware and operating environments. Compilers offered by hardware vendors focus mainly on support for their products and other open source compilers are much more limited in the hardware and operating systems supported. [12]

  * There is a wide variety of GCC-based prebuilt toolchains, which has particular appeal to embedded systems developers. This includes the GNU ARM Embedded toolchains and 138 pre-compiled cross compiler toolchains available on the Bootlin web site. [13] While other open source compilers, such as Clang/LLVM, can replace GCC in existing cross compiling toolchains, these would need to be completely rebuilt by the developer. [14]

  * GCC delivers to application developers trusted, stable performance from a mature compiler platform. The GCC 8/9 vs. LLVM Clang 6/7 Compiler Benchmarks On AMD EPYC article provides results of 49 benchmarks ran across the four tested compilers at three optimization levels. Coming in first 34% of the time was GCC 8.2 RC1 using "-O3 -march=native" level, while at the same optimization level LLVM Clang 6.0 came in second with wins 20% of the time. [15]

  * GCC delivers improved diagnostics for compile time debugging [16] and accurate and useful information for runtime debugging. GCC is tightly integrated with GDB, a mature and feature complete tool which offers ‘non-stop’ debugging that can stop a single thread at a breakpoint.

  * GCC is a well supported platform with an active, committed community that supports the current and two previous releases. With releases schedule yearly this provides two years of support for a version.




### GCC: Continuing to Optimize Linux, the Internet, and Everything

GCC continues to move forward as a world-class compiler. The most current version of GCC is 8.2, which was released in July 2018 and added hardware support for upcoming Intel CPUs, more ARM CPUs and improved performance for AMD’s ZEN CPU. Initial C17 support has been added along with initial work towards C++2A. Diagnostics have continued to be enhanced including better emitted diagnostics, with improved locations, location ranges, and fix-it hints, particularly in the C++ front end. A blog written by David Malcolm of Red Hat in March 2018 provides an overview of usability improvements in GCC 8. [17]

New hardware platforms continue to rely on the GCC toolchain for software development, such as RISC-V, a free and open ISA that is of interest to machine learning, Artificial Intelligence (AI), and IoT market segments. GCC continues to be a critical component in the continuing development of Linux systems. The Clear Linux Project for Intel Architecture, an emerging distribution built for cloud, client, and IoT use cases, provides a good example of how GCC compiler technology is being used and improved to boost the performance and security of a Linux-based system. GCC is also being used for application development for Microsoft's Azure Sphere, a Linux-based operating system for IoT applications that initially supports the ARM based MediaTek MT3620 processor. In terms of developing the next generation of programmers, GCC is also a core component of the Windows toolchain for Raspberry PI, the low-cost embedded board running Debian-based GNU/Linux that is used to promote the teaching of basic computer science in schools and developing countries.

GCC was first released on March 22, 1987 by Richard Stallman, the founder of the GNU Project and was considered a significant breakthrough since it was the first portable ANSI C optimizing compiler released as free software. GCC is maintained by a community of programmers from all over the world under the direction of a steering committee that ensures broad, representative oversight of the project. GCC’s community approach is one of its strengths, resulting in a large and diverse community of developers and users that contribute to and provide support for the project. According to Open Hub, GCC “is one of the largest open-source teams in the world, and is in the top 2% of all project teams on Open Hub.” [18]

There has been a lot of discussion about the licensing of GCC, most of which confuses rather than enlightens. GCC is distributed under the GNU General Public License version 3 or later with the Runtime Library Exception. This is a copyleft license, which means that derivative work can only be distributed under the same license terms. GPLv3 is intended to protect GCC from being made proprietary and requires that changes to GCC code are made available freely and openly. To the ‘end user’ the compiler is just the same as any other; using GCC makes no difference to any licensing choices you might make for your own code. [19]

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/10/gcc-optimizing-linux-internet-and-everything

作者：[Margaret Lewis][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/margaret-lewis
[b]: https://github.com/lujun9972
[1]: https://www.openacc.org/tools
[2]: /files/images/gccjpg-0
[3]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/gcc_0.jpg?itok=HbGnRqWX "performance"
[4]: https://www.linux.com/licenses/category/used-permission
