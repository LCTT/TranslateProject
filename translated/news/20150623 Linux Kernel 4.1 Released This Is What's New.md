Linux 4.1 发布了，下面是有哪些新的
================================================================================
**TuxlogoA brand new version of the Linux Kernel — the heartbeat of the modern world (if we you want us to be poetic about it) — has been released.**
**一个心的Linux内核 - 现代世界的心跳（如果我们想要让它充满诗意）已经发布了**

![](http://www.omgubuntu.co.uk/wp-content/uploads/2011/07/Tux-psd3894.jpg)

Linus Torvalds（还有谁？）在Linux邮件列表（还有哪里）中[宣布了][1]内核发布，同事也是大概两个月后迎来了[第一个4.x系列的发布][2]。

快速之外，像每次发布前那样，Linux 4.1带来了很大的改变。它从硬件兼容性到电源管理到文件系统性能到和你从没听说过的处理器的技术修复。

Linux 4.1 已经进入Ubuntu 15.10， 将在10月发布。

### Linux 4.1 有哪些新的 ###

![Tux got mail](http://www.omgubuntu.co.uk/wp-content/uploads/2015/06/linux-kernel-4-11-350x200.jpg)
Tux邮件

子标题在嘴上，我们不会简单地就宣布公告。

我们从（大量冗长的及不能理解的技术）更改日志去挑选一些对桌面用户而言，不见得夸张但或许有用的亮点。

#### 电源管理 ####

你在Linux 4.1中面向用户的一大特性是对Intel Cherry Trail 和 Bay Trai 芯片的丰富性能以及电源效率的提升。Soc设备，如Intel计算棒。

传闻建议是Linux 4.1给出了新的Intel硬件组合，和更长电池守密。这么高的受益不可能针对任何芯片，它只对特定芯片和系统（和高端的）有用，但仍旧是一个令人兴奋的消息。

**Linux 4.1 亮点包括:**

- ext4获得了文件系统层面的加密（感谢Google）
- 罗技游戏手柄lg4ff驱动提升‘力量反馈’
- 东芝笔记本驱动获得USB睡眠充电和背光提升
- Xbox One控制器支持
- Wacom平板中更好的电源报告驱动
- 不同的杂项。arm和x86设备电源管理提升
- Samsung Exynos 3250 电源管理
- 支持Bamboo屏板
- 联想OneLink Pro Dock获得USB支持
- 支持Realtek 8723A、 8723B、 8761A、 8821 Wi-Fi网卡

### Ubuntu中安装Linux 4.1 ###

虽然这次发布的内核被标记为稳定，但是Ubuntu用户没有迫切需要区安装它。

如果你等不及了并且技术足够熟练，你可以从[Canonical的主流内核归档][3]中下载合适的来安装Linux 4.1（或者冒着风险使用第三方PPA）。

10月发布的Ubuntu 15.10 Wily Werewolf将会基于Ubuntu Kernel 4.1.x（Ubuntu内核是基于Linux内核加上Ubuntu没被上流接受的独有补丁）。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/06/linux-4-1-kernel-new-features

作者：[Joey-Elijah Sneddon][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://lkml.org/lkml/2015/6/22/8
[2]:http://www.omgubuntu.co.uk/2015/04/linux-kernel-4-0-new-features
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D
