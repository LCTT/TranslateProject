长期维护嵌入式 Linux 内核变得容易
============================================================

 ![Jan Lübbe ](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/jan-lubbe-elc.png?itok=6G5lADKu "Jan Lübbe ") 

*Pengutronix 内核黑客 Jan Lübbe 总结了嵌入式 Linux 中正在不断增长的安全威胁，并在这次欧洲嵌入式 Linux 会议上概述了一个计划，以保持长期设备的安全和功能完整。* [Linux 基金会][1]

安全漏洞只发生在  Windows 上的好日子正在快速过去。恶意软件黑客和拒绝服务老手们正在越来越多地瞄准过时的嵌入式 Linux 设备，因此在 10 月的[<ruby>欧洲嵌入式 Linux 会议<rt>Embedded Linux Conference Europe</rt></ruby>][3]（ELCE）上的几个演讲的主题就与修复 Linux 安全漏洞相关。

最值得去听的讲演之一是 [Pengutronix][4] 内核黑客 Jan Lübbe 的《长期维护或管理（或免管理）嵌入式系统 10 年以上》。在总结嵌入式 Linux 中不断增长的安全威胁后，Lübbe 制定了一项计划，以确保长期设备的安全和功能完整。 Lübbe 说：“我们需要迁移到更新、更稳定的内核，并进行持续维护以修复关键漏洞。我们需要做上游更新和自动化流程，并建立一个可持续的工作流程。我们没有理由让系统中仍留有过时的软件。”

随着 Linux 设备变得越来越老，传统的生命周期过程已经不再适用。 Lübbe 说：“通常，你会从 SoC 供应商或主线上获取内核、构建系统，并添加到用户空间。你可以定制和添加程序，并做一些测试。但是，在此之后有 15 年的维护阶段，你最好期望平台不会发生变化、不会想要添加新的功能、不需要实施管理调整。”

所有这些变化，越来越多地导致你的系统暴露出新的错误，并需要大量更新以才能与上游软件保持同步。 Lübbe 说：“在内核中发生导致问题的错误并不总是无意的”。对于去年在 Allwinner 内核中发现的[后门][5]，他又补充说：“这些供应商的内核从来不会执行主线内核社区的审查流程”。

Lübbe 继续说：“你不能认为你的供应商一直没问题。也许只有一两个工程师查看过后门代码这块。如果补丁发布在 Linux 内核邮件列表上，就不会有这种事，因为总会有人注意到。硬件供应商不关心安全或维护，也许你会在一两年后得到更新，但是即使这样，他们从一个固定版本开始开发，到他们发布稳定的版本通常需要几年的时间。如果你在这个基础上再开始开发，可能又过了半年，这就更过时了。”

越来越多的嵌入式开发人员在<ruby>长期稳定<rt>Long Term Stable</rt></ruby>（LTS）内核上构建长期产品。但这并不意味着没事了。Lübbe 说：“一个产品发布后，人们经常不再遵循稳定的发行链，也不再应用安全补丁。这样你会得到两个最糟糕的结果：过时的内核和没有安全性。你失去了多人测试的好处。”

Lübbe 指出，使用像 Red Hat 这样的面向服务器的发行版的 Pengutronix 客户经常由于快速的定制、需要系统管理员干预的部署和升级系统而遇到问题。

“更新对一些东西有用，特别是在 x86 上，但每个项目基本上是自己建立基础设施来更新到新版本。”

许多开发人员选择把向后移植作为更新长期产品的解决方案。Lübbe 说：“开始时很容易，但是一旦你不处于项目的维护范围，他们就不会告诉你所使用的版本是否受到一个 bug 的影响，因此很难判断一个修复是否相关。于是你不停打补丁和更新，而 bug 也在不断累积，而这些你必须自己维护，因为其他人不使用这些补丁。使用开源软件的好处就丢失了。”

### 跟随上游项目

Lübbe 认为，最好的解决方案是跟踪由上游项目维护的版本。“我们主要关注基于主线内核的开发，所以我们在产品和主流内核及其他上游项目之间尽可能没有差别。长期系统在主线内核上得到很好的支持。大多数不使用 3D 图形的系统只需要很少的补丁。较新的内核版本还有很多[新的强化功能][6]，这些可以减少漏洞的影响。

跟随主线发展对许多开发人员来说似乎令人畏惧，但是如果从一开始就这样，然后坚持下去，就会相对容易一些，Lübbe 说：“你需要为系统上做的一切制定流程。你总需要知道什么软件正在运行，这在使用良好的构建系统时会更容易。每个软件版本应定义完整的系统，以便你可以更新相关的一切。如果你不知道那里有什么，你就不能解决它。你也需要一个自动测试和自动部署更新。”

为了“减少更新周期”，Lübbe 建议在开始开发时使用最新的 Linux 内核，并且在进入测试时才转到稳定的内核。之后，他建议每年将系统中的所有软件（包括内核、构建系统、用户空间、glibc 和组件（如 OpenSSL））更新为当年上游项目支持的版本。

Lübbe 说：“得到更新并不意味着你需要部署。如果没有看到安全漏洞，你可以把补丁放在一边，需要时它再用就行。”

最后，Lübbe 建议每个月查看发布公告，并且每周检查 CVE 和主线列表上的安全公告。你只需要问自己“该安全公告是否影响到了你”。他补充说：“如果你的内核足够新，就没有太多的工作。你不会希望通过在新闻中看到你的设备才获得有关你的产品的反馈。”

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/ELCE/2017/long-term-embedded-linux-maintenance-made-easier

作者：[ERIC BROWN][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/ericstephenbrown
[1]:https://www.linux.com/licenses/category/linux-foundation
[2]:https://www.linux.com/files/images/jan-lubbe-elcpng
[3]:http://events.linuxfoundation.org/events/archive/2016/embedded-linux-conference-europe
[4]:http://www.pengutronix.de/index_en.html
[5]:http://arstechnica.com/security/2016/05/chinese-arm-vendor-left-developer-backdoor-in-kernel-for-android-pi-devices/
[6]:https://www.linux.com/news/event/ELCE/2017hardening-kernel-protect-against-attackers
