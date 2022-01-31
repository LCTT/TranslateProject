[#]: subject: "Intel is Gearing Up to Give a ‘Superpower’ to Linux that Windows Users Don’t Have"
[#]: via: "https://news.itsfoss.com/intel-linux-kernel/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14153-1.html"

英特尔正准备为 Linux 提供 Windows 用户所没有的 “超能力”
======

> 英特尔计划在 Linux 内核 5.17 中引入一个特殊的变化，可以在不重启系统的情况下更新系统固件。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/01/intel-linux.png?w=1200&ssl=1)

去年发现的几个安全漏洞，使得系统管理员很难在不停机的情况下迅速修补系统。

如果能做出一些改进，在不重启系统的情况下更新一些关键组件以提高安全/性能呢？

英特尔旨在通过其新的 PFRUT（<ruby>平台固件运行时更新和遥测<rt>Platform Firmware Runtime Update and Telemetry</rt></ruby>）驱动程序来实现这一目标。

### 英特尔计划在 Linux 内核 5.17 中提供 PFRUT

虽然 Linux 内核 5.16 将在本周晚些时候发布，不过英特尔的目标是将这一新的功能合并到即将发布的 Linux 内核 5.17 稳定版。

但是，它究竟是什么？

有了 PFRUT 驱动，特定组件（或系统固件）可以在系统运行时进行更新，而不需要重新启动。

最初，英特尔倾向于将其称为“无缝更新”解决方案。然而，随着最近被添加到 Linux 电源管理的 linux-next 分支中的 Linux 内核提交，他们可能会继续使用一个厂商中立的名字，即 `pfrut_driver`。

顺便说一句，linux-next 分支代表着这些变化将进入下一个 Linux 内核稳定版（5.17）。

在技术上，这个 [提交][1] 对该变化的解释如下：

> 用户应该提供 EFI 封包，并通过将该封包写入设备的特殊文件以将其传递给驱动程序。驱动程序在特定的 <ruby>ACPI 平台固件运行时更新<rt> ACPI Platform Firmware Runtime Update</rt></ruby>设备（INTC1080）的 ACPI _DSM 方法的帮助下，将封包传输到平台固件，而实际的固件更新是由平台固件中的低级管理模式代码进行的。

就像人们通常期望的那样，这应该可以消除停机时间，可以对解决任何安全和性能改进的固件进行基本更新。而且，系统固件更新可以很容易地直接通过操作系统（这里是 Linux）进行。

正如其中一个 [详细说明其工作原理的 PDF 文件][2] 中强调的那样，驱动程序的遥测部分是为了 “从 MM 中检索日志信息，以进行监控并找出问题的根本原因”。

请注意，这只有在 Linux 系统和英特尔芯片上才能实现。

考虑到当你需要修补系统固件以抵御安全问题时，等待系统上的任务完成不是一种理想状况，这种能力的增加应该是非常方便的。

### 这是为 Linux 桌面或服务器准备的吗？

该改进主要是为服务器专用硬件量身定做的。

英特尔的官方文件指出，这是为具有高服务水平协议（SLA）的系统准备的，这种 SLA 需要尽量减少重启。

然而，这对拥有企业级系统的特定桌面用户群应该也是有用的。

虽然这可能不是桌面 Linux 发行版必不可少的东西，但它可能是改善用户体验的一个令人兴奋的开始。特别是对于热衷于保持系统固件更新而不严重干扰其工作的用户。

这也应该可以引入更多类型的更新的可能性，当涉及到 BIOS 或 UEFI 时，可以由操作系统而不是主板处理。

这不仅限于为你的桌面配置服务器级别的硬件的 Linux 桌面用户。

虽然目前只限于 Linux 系统，但这也应该很快可以用于 Windows 和其他操作系统。

你对英特尔推出的这一变化有何看法？你认为这是对系统固件更新处理方式的一个重大改进吗？

欢迎在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/intel-linux-kernel/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=0db89fa243e5edc5de38c88b369e4c3755c5fb74
[2]: https://uefi.org/sites/default/files/resources/Intel_MM_OS_Interface_Spec_Rev100.pdf
