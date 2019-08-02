[#]: collector: (lujun9972)
[#]: translator: (LazyWolfLin)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11176-1.html)
[#]: subject: (Continuous integration testing for the Linux kernel)
[#]: via: (https://opensource.com/article/19/6/continuous-kernel-integration-linux)
[#]: author: (Major Hayden https://opensource.com/users/mhayden)

Linux 内核的持续集成测试
======

> CKI 团队是如何防止 bug 被合并到 Linux 内核中。

![](https://img.linux.net.cn/data/attachment/album/201908/02/112520aidijdddo9wwvbiv.jpg)

Linux 内核的每个发布版本包含了来自 1,700 个开发者产生的 14,000 个变更集，很显然，这使得 Linux 内核快速迭代的同时也产生了巨大的复杂性问题。内核上 Bug 有小麻烦也有大问题，有时是系统崩溃，有时是数据丢失。

随着越来越多的项目对于持续集成（CI）的呼声，[内核持续集成（CKI）][2]小组秉承着一个任务目标：防止 Bug 被合并到内核当中。

### Linux 测试问题

许多 Linux 发行版只在需要的时候对 Linux 内核进行测试。而这种测试往往只在版本发布时或者用户发现错误时进行。

有时候，出现玄学问题时，维护人员需要在包含了数万个补丁的变更中匆忙地寻找哪个补丁导致这个新的玄学 Bug。诊断 Bug 需要专业的硬件设备、一系列的触发器以及内核相关的专业知识。

#### CI 和 Linux

许多现代软件代码库都采用某种自动化 CI 测试机制，能够在提交进入代码存储库之前对其进行测试。这种自动化测试使得维护人员可以通过查看 CI 测试报告来发现软件质量问题以及大多数的错误。一些简单的项目，比如某个 Python 库，附带的大量工具使得整个检查过程更简单。

在任何测试之前都需要配置和编译 Linux。而这么做将耗费大量的时间和计算资源。此外，Linux 内核必需在虚拟机或者裸机上启动才能进行测试。而访问某些硬件架构需要额外的开销或者非常慢的仿真。因此，人们必须确定一组能够触发错误或者验证修复的测试集。

#### CKI 团队如何运作？

Red Hat 公司的 CKI 团队当前正追踪来自数个内部内核分支和上游的[稳定内核分支树][3]等内核分支的更改。我们关注每个代码库的两类关键事件：

  1. 当维护人员合并 PR 或者补丁时，代码库变化后的最终结果。
  2. 当开发人员通过拼凑或者稳定补丁队列发起变更合并时。

当这些事件发生时，自动化工具开始执行，[GitLab CI 管道][4]开始进行测试。一旦管道开始执行 [linting][5] 脚本、合并每一个补丁，并为多种硬件架构编译内核，真正的测试便开始了。我们会在六分钟内完成四种硬件架构的内核编译工作，并且通常会在两个小时或更短的时间内将反馈提交到稳定邮件列表中。（自 2019 年 1 月起）每月执行超过 100,000 次内核测试，并完成了超过 11,000 个 GitLab 管道。 

每个内核都会在本地硬件架构上启动，其中包含：

* [aarch64][6]：64 位 [ARM][7]，例如 [Cavium（当前是 Marvell）ThunderX][8]。
* [ppc64/ppc64le][9]：大端和小端的 [IBM POWER][10] 系统。
* [s390x][11]：[IBM Zseries][12] 大型机
* [x86_64][13]：[Intel][14] 和 [AMD][15] 工作站、笔记本和服务器。

这些内核上运行了包括 [Linux 测试项目（LTP）][16]在内的多个测试，其中包括使用常用测试工具的大量测试。我们 CKI 团队开源了超过 44 个测试并将继续开源更多测试。

### 参与其中

上游的内核测试工作日渐增多。包括 [Google][17]、Intel、[Linaro][18] 和 [Sony][19] 在内的许多公司为各种内核提供了测试输出。每一项工作都专注于为上游内核以及每个公司的客户群带来价值。

如果你或者你的公司想要参与这一工作，请参加在 9 月份在葡萄牙里斯本举办的 [Linux Plumbers Conference 2019][20]。在会议结束后的两天加入我们的 Kernel CI hackfest 活动，并推动快速内核测试的发展。

更多详细信息，[请见][21]我在 Texas Linux Fest 2019 上的演讲。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/continuous-kernel-integration-linux

作者：[Major Hayden][a]
选题：[lujun9972][b]
译者：[LazyWolfLin](https://github.com/LazyWolfLin)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mhayden
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_kernel_clang_vscode.jpg?itok=fozZ4zrr "Linux kernel source code (C) in Visual Studio Code"
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
