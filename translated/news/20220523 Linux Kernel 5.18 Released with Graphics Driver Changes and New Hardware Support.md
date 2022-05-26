[#]: subject: "Linux Kernel 5.18 Released with Graphics Driver Changes and New Hardware Support"
[#]: via: "https://news.itsfoss.com/linux-kernel-5-18-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "PeterPan0106"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux 内核 5.18版本正式发布，新增显卡驱动以及硬件支持
======
Linux 最新的稳定版内核 5.18 版本现已如期发布，本次更细包括针对新硬件的支持以及许多其他的变化。

![Linux kernel 5.18 release][1]

[Linux 5.17 内核][2] 发布时包含了对下一代硬件的支持，同时增强了 Steam Deck的游戏体验。

每一代内核都包含了令人兴奋的技术进步，Linux 内核 5.18也不例外。

### Linux 内核 5.18 有哪些变化呢？

本次我们可以看到，内核针对雷蛇外设硬件、苹果外设硬件和AMD的图形增强了支持，包括一些网络、核心和安全方面的更新。

#### 新的雷蛇驱动

说到游戏装备，Linux的硬件支持亟待更新。

目前存在一些开源驱动程序的解决方案。但是这些方案不具有普适性，适配和支持较少。

正如 [Phoronix][3] 所发现的，一个新的雷蛇 HID驱动程序与 Linux 内核 5.18一同发布，它适配了雷蛇黑寡妇蜘蛛键盘，并修复了宏键此前存在的问题。

#### AMD 显卡特性 FreeSync 模式被默认开启

![][4]

尽管能够支持FreeSync是很好的一件事情并可以改善用户体验，但前序版本的支持仅是临时性解决方案。

现在在 Linux 内核 5.18版本中 ([见更新日志][5]) ，用户无需调整任何设置即可使用 FreeSync，因为这一显示模式已被默认启用。

#### 显卡驱动更新

针对当前和未来的 AMD显卡驱动进行了改进。

更高刷新率的DisplayPort也在这一个版本中支持。

#### 从 C89标准升级到 C11标准 (GNU11)

![][6]

用于Linux内核的C语言被限制在旧的C89标准中，在当前已经稍显老旧并且缺失了许多十分必要的新特性。

考虑到目前的编译器版本要求，C11标准和GCC5.1可以满足兼容性要求。

#### 网络优化

Linux 内核 5.18 增加了对新硬件的支持，包括联发科 MT7916、MT7921U和博通 BCM43454/6。

![][7]

针对移动端的改进包括对英特尔 M.2 WWAN 卡的支持。

Realtek W89 驱动现在支持AP模式、6GHz频段并增加了硬件扫描功能。

在配置IPv6和其他各种协议方面，通过一系列的改进提升了性能。

#### USB 改进

Xen USB驱动程序进行了改进，以抵御恶意主机，USB DWC3驱动程序也支持了更多的硬件类型。

其他改进详见 [更新日志][8]。

#### 增强对苹果键盘以及平板的支持

![][9]

当前版本针对苹果包含第一代在内的键盘的使用体验进行了优化。

包括功能键的映射、键盘背光以及通过USB连接时报告电池水平的能力都得到了改进。

Linux 内核 5.18改进了输入处理，在平板电脑上输入将变得更为容易。

硬件相关的改进详见 [更新日志][10]。

#### ARM 架构芯片的支持 (特斯拉 FSD，树莓派 Zero 2 W)

![][11]

特斯拉的全套自动驾驶SoC现在支持Linux 内核 5.18。三星工程师使其可以向上移植到 Linux 内核。

其他芯片支持包括高通骁龙625/632，以及三星Exynos 850/7885。

你还会发现对采用 Linux 内核 5.18 的树莓派 Zero 2 W受到了支持。旧的硬件/主板的支持则被同步去除。详见 [更新日志][12]。

你可以参考 [官方更新日志][13] 和 Linus Torvald 的官方发布获取更多信息。

### 如何安装 Linux 内核 5.18？

你可以在 [Linux Kernel Archives][14]的网站上找到最新版本的内核。你可以下载 [tarball][15] 以进行测试。你也可以参照 [Linux 内核升级指南][16] 获取帮助

如果想避免自己编译它，你可以稍等几周，等 Linux发行版把它推到仓库。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-5-18-release/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[PeterPan0106](https://github.com/PeterPan0106)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/kernel-5-18-release.png
[2]: https://news.itsfoss.com/linux-kernel-5-17-release/
[3]: https://www.phoronix.com/scan.php?page=news_item&px=Linux-5.18-HID
[4]: https://news.itsfoss.com/wp-content/uploads/2022/05/amd-linux-5-18-1024x576.jpg
[5]: https://lists.freedesktop.org/archives/amd-gfx/2022-February/075262.html
[6]: https://news.itsfoss.com/wp-content/uploads/2022/05/c-linux-5-18-1024x576.jpg
[7]: https://news.itsfoss.com/wp-content/uploads/2022/05/networking-linux-5-18-1024x576.jpg
[8]: https://lore.kernel.org/lkml/Yj7vGtn8fILavjyL@kroah.com/
[9]: https://news.itsfoss.com/wp-content/uploads/2022/05/apple-linux-5-18-1024x576.jpg
[10]: https://lore.kernel.org/lkml/nycvar.YFH.7.76.2203231015060.24795@cbobk.fhfr.pm/
[11]: https://news.itsfoss.com/wp-content/uploads/2022/05/arm-linux-5-18-1024x576.jpg
[12]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=baaa68a9796ef2cadfe5caaf4c730412eda0f31c
[13]: https://lore.kernel.org/lkml/CAHk-=wjiqyoH6qntYvYTjR1F2L-pHtgX9esZMRS13iktCOJ1zA@mail.gmail.com/T/#u
[14]: https://www.kernel.org/
[15]: https://git.kernel.org/torvalds/t/linux-5.16.tar.gz
[16]: https://itsfoss.com/upgrade-linux-kernel-ubuntu/
