Linux 4.1 带来了什么新东西？
================================================================================
**一个新的Linux内核已经发布了 - 全世界为之心跳（我们想把它说的诗意一些）**

Linus Torvalds（除了他不会有谁了）在Linux邮件列表（当然不会在别的地方）中[宣布][1]，在大概两个月后迎来了[第一个4.x系列的Linux内核的发布][2]。

像每次发布前那样，Linux 4.1带来了很多的改变。它们包括了硬件兼容性、电源管理、文件系统性能、以及你从没听说过的处理器的技术修复。

Linux 4.1 已经进入将在10月发布的 Ubuntu 15.10 。

### Linux 4.1 有哪些新东西 ###

![Tux got mail](http://www.omgubuntu.co.uk/wp-content/uploads/2015/06/linux-kernel-4-11-350x200.jpg)

*Tux 收到了邮件*

这个标题只是说说而已，我们不是简单地将发布公告贴到这里。

我们会从（大量、冗长以及那些不明觉厉的的技术的）更改日志去挑选一些对桌面用户而言，不见得夸张但或许有用的亮点。

#### 电源管理 ####

你可以在Linux 4.1中找到的面向用户的一大特性是对 Intel 的 Cherry Trail 和 Bay Trai 芯片、Soc及Intel计算棒等设备的性能及能效的提升。

传闻建议是Linux 4.1给出了新的Intel硬件组合，和更长电池寿命。这么多的进步自然不可能针对所有芯片，它只对特定芯片和系统（和高端的）有用，但仍旧是一个令人兴奋的消息。

**Linux 4.1 亮点包括:**

- ext4 有了文件系统层面的加密（感谢Google）
- 罗技游戏手柄lg4ff驱动改进了‘力反馈’
- 东芝笔记本驱动进行了USB睡眠充电和背光改进
- Xbox One控制器支持Rumble
- Wacom平板驱动改进了电源报告
- 各种针对arm和x86设备电源管理改进
- Samsung Exynos 3250 电源管理改进
- 支持Bamboo平板
- 联想OneLink Pro Dock获得USB支持
- 支持Realtek 8723A、 8723B、 8761A、 8821 Wi-Fi网卡

### Ubuntu中安装Linux 4.1 ###

虽然这次发布的内核被标记为稳定，但是Ubuntu用户并不需要迫切地安装它。

但如果你等不及了并且技术足够熟练，你可以从[Canonical的主干内核归档][3]中下载合适的软件包来安装Linux 4.1（或者冒着风险使用第三方PPA）。

10月发布的Ubuntu 15.10 Wily Werewolf将会基于Ubuntu Kernel 4.1.x（Ubuntu内核是基于Linux内核加上Ubuntu没被上流接受的独有补丁）。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/06/linux-4-1-kernel-new-features

作者：[Joey-Elijah Sneddon][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://lkml.org/lkml/2015/6/22/8
[2]:http://www.omgubuntu.co.uk/2015/04/linux-kernel-4-0-new-features
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D
