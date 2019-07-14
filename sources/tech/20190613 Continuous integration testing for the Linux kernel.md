[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Continuous integration testing for the Linux kernel)
[#]: via: (https://opensource.com/article/19/6/continuous-kernel-integration-linux)
[#]: author: (Major Hayden https://opensource.com/users/mhayden)

Continuous integration testing for the Linux kernel
======
How this team works to prevent bugs from being merged into the Linux
kernel.
![Linux kernel source code \(C\) in Visual Studio Code][1]

With 14,000 changesets per release from over 1,700 different developers, it's clear that the Linux kernel moves quickly, and brings plenty of complexity. Kernel bugs range from small annoyances to larger problems, such as system crashes and data loss.

As the call for continuous integration (CI) grows for more and more projects, the [Continuous Kernel Integration (CKI)][2] team forges ahead with a single mission: prevent bugs from being merged into the kernel.

### Linux testing problems

Many Linux distributions test the Linux kernel when needed. This testing often occurs around release time, or when users find a bug.

Unrelated issues sometimes appear, and maintainers scramble to find which patch in a changeset full of tens of thousands of patches caused the new, unrelated bug. Diagnosing the bug may require specialized hardware, a series of triggers, and specialized knowledge of that portion of the kernel.

#### CI and Linux

Most modern software repositories have some sort of automated CI testing that tests commits before they find their way into the repository. This automated testing allows the maintainers to find software quality issues, along with most bugs, by reviewing the CI report. Simpler projects, such as a Python library, come with tons of tools to make this process easier.

Linux must be configured and compiled prior to any testing. Doing so takes time and compute resources. In addition, that kernel must boot in a virtual machine or on a bare metal machine for testing. Getting access to certain system architectures requires additional expense or very slow emulation. From there, someone must identify a set of tests which trigger the bug or verify the fix.

#### How the CKI team works

The CKI team at Red Hat currently follows changes from several internal kernels, as well as upstream kernels such as the [stable kernel tree][3]. We watch for two critical events in each repository:

  1. When maintainers merge pull requests or patches, and the resulting commits in the repository change.

  2. When developers propose changes for merging via patchwork or the stable patch queue.




As these events occur, automation springs into action and [GitLab CI pipelines][4] begin the testing process. Once the pipeline runs [linting][5] scripts, merges any patches, and compiles the kernel for multiple architectures, the real testing begins. We compile kernels in under six minutes for four architectures and submit feedback to the stable mailing list usually in two hours or less. Over 100,000 kernel tests run each month and over 11,000 GitLab pipelines have completed (since January 2019).

Each kernel is booted on its native architecture, which includes:

● [aarch64][6]: 64-bit [ARM][7], such as the [Cavium (now Marvell) ThunderX][8].

● [ppc64/ppc64le][9]: Big and little endian [IBM POWER][10] systems.

● [s390x][11]: [IBM Zseries][12] mainframes.

● [x86_64][13]: [Intel][14] and [AMD][15] workstations, laptops, and servers.

Multiple tests run on these kernels, including the [Linux Test Project (LTP)][16], which contains a myriad of tests using a common test harness. My CKI team open-sourced over 44 tests with more on the way.

### Get involved

The upstream kernel testing effort grows day-by-day. Many companies provide test output for various kernels, including [Google][17], Intel, [Linaro][18], and [Sony][19]. Each effort is focused on bringing value to the upstream kernel as well as each company’s customer base.

If you or your company want to join the effort, please come to the [Linux Plumbers Conference 2019][20] in Lisbon, Portugal. Join us at the Kernel CI hackfest during the two days after the conference, and drive the future of rapid kernel testing.

For more details, [review the slides][21] from my Texas Linux Fest 2019 talk.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/continuous-kernel-integration-linux

作者：[Major Hayden][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mhayden
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_kernel_clang_vscode.jpg?itok=fozZ4zrr (Linux kernel source code (C) in Visual Studio Code)
[2]: https://cki-project.org/
[3]: https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
[4]: https://docs.gitlab.com/ee/ci/pipelines.html
[5]: https://en.wikipedia.org/wiki/Lint_(software)
[6]: https://en.wikipedia.org/wiki/ARM_architecture
[7]: https://www.arm.com/
[8]: https://www.marvell.com/server-processors/thunderx-arm-processors/
[9]: https://en.wikipedia.org/wiki/Ppc64
[10]: https://www.ibm.com/it-infrastructure/power
[11]: https://en.wikipedia.org/wiki/Linux_on_z_Systems
[12]: https://www.ibm.com/it-infrastructure/z
[13]: https://en.wikipedia.org/wiki/X86-64
[14]: https://www.intel.com/
[15]: https://www.amd.com/
[16]: https://github.com/linux-test-project/ltp
[17]: https://www.google.com/
[18]: https://www.linaro.org/
[19]: https://www.sony.com/
[20]: https://www.linuxplumbersconf.org/
[21]: https://docs.google.com/presentation/d/1T0JaRA0wtDU0aTWTyASwwy_ugtzjUcw_ZDmC5KFzw-A/edit?usp=sharing
