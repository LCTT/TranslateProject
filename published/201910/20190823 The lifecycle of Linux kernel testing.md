[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11464-1.html)
[#]: subject: (The lifecycle of Linux kernel testing)
[#]: via: (https://opensource.com/article/19/8/linux-kernel-testing)
[#]: author: (Major Hayden https://opensource.com/users/mhaydenhttps://opensource.com/users/mhaydenhttps://opensource.com/users/marcobravohttps://opensource.com/users/mhayden)

Linux 内核测试的生命周期
======

> 内核持续集成（CKI）项目旨在防止错误进入 Linux 内核。

![](https://img.linux.net.cn/data/attachment/album/201910/16/101933nexzccpea9sjxcq9.jpg)

在 [Linux 内核的持续集成测试][2] 一文中，我介绍了 <ruby>[内核持续集成][3]<rt>Continuous Kernel Integration</rt></ruby>（CKI）项目及其使命：改变内核开发人员和维护人员的工作方式。本文深入探讨了该项目的某些技术方面，以及这所有的部分是如何组合在一起的。

### 从一次更改开始

内核中每一项令人兴奋的功能、改进和错误都始于开发人员提出的更改。这些更改出现在各个内核存储库的大量邮件列表中。一些存储库关注内核中的某些子系统，例如存储或网络，而其它存储库关注内核的更多方面。 当开发人员向内核提出更改或补丁集时，或者维护者在存储库本身中进行更改时，CKI 项目就会付诸行动。

CKI 项目维护的触发器用于监视这些补丁集并采取措施。诸如 [Patchwork][4] 之类的软件项目通过将多个补丁贡献整合为单个补丁系列，使此过程变得更加容易。补丁系列作为一个整体历经 CKI 系统，并可以针对该系列发布单个报告。

其他触发器可以监视存储库中的更改。当内核维护人员合并补丁集、还原补丁或创建新标签时，就会触发。测试这些关键的更改可确保开发人员始终具有坚实的基线，可以用作编写新补丁的基础。

所有这些更改都会进入 GitLab CI 管道，并历经多个阶段和多个系统。

### 准备构建

首先要准备好要编译的源代码。这需要克隆存储库、打上开发人员建议的补丁集，并生成内核配置文件。这些配置文件具有成千上万个用于打开或关闭功能的选项，并且配置文件在不同的系统体系结构之间差异非常大。 例如，一个相当标准的 x86\_64 系统在其配置文件中可能有很多可用选项，但是 s390x 系统（IBM  zSeries 大型机）的选项可能要少得多。在该大型机上，某些选项可能有意义，但在消费类笔记本电脑上没有任何作用。

内核进一步转换为源代码工件。该工件包含整个存储库（已打上补丁）以及编译所需的所有内核配置文件。 上游内核会打包成压缩包，而 Red Hat 的内核会生成下一步所用的源代码 RPM 包。

### 成堆的编译

编译内核会将源代码转换为计算机可以启动和使用的代码。配置文件描述了要构建的内容，内核中的脚本描述了如何构建它，系统上的工具（例如 GCC 和 glibc）完成构建。此过程需要一段时间才能完成，但是 CKI 项目需要针对四种体系结构快速完成：aarch64（64 位 ARM）、ppc64le（POWER）、s390x（IBM  zSeries）和 x86\_64。重要的是，我们必须快速编译内核，以便使工作任务不会积压，而开发人员可以及时收到反馈。

添加更多的 CPU 可以大大提高速度，但是每个系统都有其局限性。CKI 项目在 OpenShift 的部署环境中的容器内编译内核；尽管 OpenShift 可以实现高伸缩性，但在部署环境中的可用 CPU 仍然是数量有限的。CKI 团队分配了 20 个虚拟 CPU 来编译每个内核。涉及到四个体系结构，这就涨到了 80 个 CPU！

另一个速度的提高来自 [ccache][5] 工具。内核开发进展迅速，但是即使在多个发布版本之间，内核的大部分仍保持不变。ccache 工具进行编译期间会在磁盘上缓存已构建的对象（整个内核的一小部分）。稍后再进行另一个内核编译时，ccache 会查找以前看到的内核的未更改部分。ccache 会从磁盘中提取缓存的对象并重新使用它。这样可以加快编译速度并降低总体 CPU 使用率。现在，耗时 20 分钟编译的内核在不到几分钟的时间内就完成了。

### 测试时间

内核进入最后一步：在真实硬件上进行测试。每个内核都使用 Beaker 在其原生体系结构上启动，并且开始无数次的测试以发现问题。一些测试会寻找简单的问题，例如容器问题或启动时的错误消息。其他测试则深入到各种内核子系统中，以查找系统调用、内存分配和线程中的回归问题。

大型测试框架，例如 [Linux Test Project][6]（LTP），包含了大量测试，这些测试在内核中寻找麻烦的回归问题。其中一些回归问题可能会回滚关键的安全修复程序，并且进行测试以确保这些改进仍保留在内核中。

测试完成后，关键的一步仍然是：报告。内核开发人员和维护人员需要一份简明的报告，准确地告诉他们哪些有效、哪些无效以及如何获取更多信息。每个 CKI 报告都包含所用源代码、编译参数和测试输出的详细信息。该信息可帮助开发人员知道从哪里开始寻找解决问题的方法。此外，它还可以帮助维护人员在漏洞进入内核存储库之前知道何时需要保留补丁集以进行其他查看。

### 总结

CKI 项目团队通过向内核开发人员和维护人员提供及时、自动的反馈，努力防止错误进入 Linux 内核。这项工作通过发现导致内核错误、安全性问题和性能问题等易于找到的问题，使他们的工作更加轻松。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-kernel-testing

作者：[Major Hayden][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

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
