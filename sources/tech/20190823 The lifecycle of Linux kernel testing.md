[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The lifecycle of Linux kernel testing)
[#]: via: (https://opensource.com/article/19/8/linux-kernel-testing)
[#]: author: (Major Hayden https://opensource.com/users/mhaydenhttps://opensource.com/users/mhaydenhttps://opensource.com/users/marcobravohttps://opensource.com/users/mhayden)

The lifecycle of Linux kernel testing
======
The Continuous Kernel Integration (CKI) project aims to prevent bugs
from entering the Linux kernel.
![arrows cycle symbol for failing faster][1]

In _[Continuous integration testing for the Linux kernel][2]_, I wrote about the [Continuous Kernel Integration][3] (CKI) project and its mission to change how kernel developers and maintainers work. This article is a deep dive into some of the more technical aspects of the project and how all the pieces fit together.

### It all starts with a change

Every exciting feature, improvement, and bug in the kernel starts with a change proposed by a developer. These changes appear on myriad mailing lists for different kernel repositories. Some repositories focus on certain subsystems in the kernel, such as storage or networking, while others focus on broad aspects of the kernel. The CKI project springs into action when developers propose a change, or patchset, to the kernel or when a maintainer makes changes in the repository itself.

The CKI project maintains triggers that monitor these patchsets and take action. Software projects such as [Patchwork][4] make this process much easier by collating multi-patch contributions into a single patch series. This series travels as a unit through the CKI system and allows for publishing a single report on the series.

Other triggers watch the repository for changes. This occurs when kernel maintainers merge patchsets, revert patches, or create new tags. Testing these critical changes ensures that developers always have a solid baseline to use as a foundation for writing new patches.

All of these changes make their way into a GitLab pipeline and pass through multiple stages and multiple systems.

### Prepare the build

Everything starts with getting the source ready for compile time. This requires cloning the repository, applying the patchset proposed by the developer, and generating a kernel config file. These config files have thousands of options that turn features on or off, and config files differ incredibly between different system architectures. For example, a fairly standard x86_64 system may have a ton of options available in its config file, but an s390x system (IBM zSeries mainframes) likely has much fewer options. Some options might make sense on that mainframe but they have no purpose on a consumer laptop.

The kernel moves forward and transforms into a source artifact. The artifact contains the entire repository, with patches applied, and all kernel configuration files required for compiling. Upstream kernels move on as a tarball, while Red Hat kernels become a source RPM for the next step.

### Piles of compiles

Compiling the kernel turns the source code into something that a computer can boot up and use. The config file describes what to build, scripts in the kernel describe how to build it, and tools on the system (like GCC and glibc) do the building. This process takes a while to complete, but the CKI project needs it done quickly for four architectures: aarch64 (64-bit ARM), ppc64le (POWER), s390x (IBM zSeries), and x86_64. It's important that we compile kernels quickly so that we keep our backlog manageable and developers receive prompt feedback.

Adding more CPUs provides plenty of speed improvements, but every system has its limits. The CKI project compiles kernels within containers in an OpenShift deployment; although OpenShift allows for tons of scalability, the deployment still has a finite number of CPUs available. The CKI team allocates 20 virtual CPUs for compiling each kernel. With four architectures involved, this balloons to 80 CPUs!

Another speed increase comes from a tool called [ccache][5]. Kernel development moves quickly, but a large amount of the kernel remains unchanged even between multiple releases. The ccache tool caches the built objects (small pieces of the overall kernel) during the compile on a disk. When another kernel compile comes along later, ccache looks for unchanged pieces of the kernel that it saw before. Ccache pulls the cached object from the disk and reuses it. This allows for faster compiles and lower overall CPU usage. Kernels that took 20 minutes to compile now race to the finish line in less than a few minutes.

### Testing time

The kernel moves onto its last step: testing on real hardware. Each kernel boots up on its native architecture using Beaker, and myriad tests begin poking it to find problems. Some tests look for simple problems, such as issues with containers or error messages on boot-up. Other tests dive deep into various kernel subsystems to find regressions in system calls, memory allocation, and threading.

Large testing frameworks, such as the [Linux Test Project][6] (LTP), contain tons of tests that look for troublesome regressions in the kernel. Some of these regressions could roll back critical security fixes, and there are tests to ensure those improvements remain in the kernel.

One critical step remains when tests finish: reporting. Kernel developers and maintainers need a concise report that tells them exactly what worked, what did not work, and how to get more information. Each CKI report contains details about the source code used, the compile parameters, and the testing output. That information helps developers know where to begin looking to fix an issue. Also, it helps maintainers know when a patchset needs to be held for another look before a bug makes its way into their kernel repository.

### Summary

The CKI project team strives to prevent bugs from entering the Linux kernel by providing timely, automated feedback to kernel developers and maintainers. This work makes their job easier by finding the low-hanging fruit that leads to kernel bugs, security issues, and performance problems.

* * *

_To learn more, you can attend the [CKI Hackfest][7] on September 12-13 following the [Linux Plumbers Conference][8] September 9-11 in Lisbon, Portugal._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-kernel-testing

作者：[Major Hayden][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mhaydenhttps://opensource.com/users/mhaydenhttps://opensource.com/users/marcobravohttps://opensource.com/users/mhayden
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/fail_progress_cycle_momentum_arrow.png?itok=q-ZFa_Eh (arrows cycle symbol for failing faster)
[2]: https://opensource.com/article/19/6/continuous-kernel-integration-linux
[3]: https://cki-project.org/
[4]: https://github.com/getpatchwork/patchwork
[5]: https://ccache.dev/
[6]: https://linux-test-project.github.io
[7]: https://cki-project.org/posts/hackfest-agenda/
[8]: https://www.linuxplumbersconf.org/
