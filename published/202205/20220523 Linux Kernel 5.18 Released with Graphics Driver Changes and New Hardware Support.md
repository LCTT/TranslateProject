[#]: subject: "Linux Kernel 5.18 Released with Graphics Driver Changes and New Hardware Support"
[#]: via: "https://news.itsfoss.com/linux-kernel-5-18-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "PeterPan0106"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14640-1.html"

Linux 内核 5.18 版本正式发布，新增显卡驱动以及硬件支持
======

> 最新的 Linux 内核 5.18 版本现已如期发布，本次更新包括针对新硬件的支持以及许多其他核心变化。

![Linux kernel 5.18 release][1]

[Linux 5.17 内核][2] 发布时包含了对下一代硬件的支持，同时增强了 Steam Deck 的游戏体验。

每一代内核都包含了令人兴奋的技术进步，Linux 内核 5.18 也不例外。

### Linux 内核 5.18 有哪些变化呢？

本次我们可以看到，内核针对雷蛇外设硬件、苹果妙控键盘和 AMD 显卡增强了支持，还有一些网络、核心和安全方面的更新。

#### 新的雷蛇驱动

说到游戏装备，Linux 的硬件支持亟待更新。

目前存在一些开源驱动程序的变通解决方案。但是这些方案不具有普适性，适配和支持较少。

正如 [Phoronix][3] 所发现的，Linux 内核 5.18 中一同发布了一个新的雷蛇 HID 驱动程序，它适配了雷蛇黑寡妇蜘蛛键盘，并修复了宏键此前存在的问题。

此外，这个驱动程序应该也有助于解决其他雷蛇硬件的问题。

#### AMD 显卡特性 FreeSync 模式被默认开启

![][4]

虽然对 FreeSync 视频的支持足够好，但这只是改善 FreeSync 显示器用户体验的一个临时解决方案。

现在在 Linux 内核 5.18 版本中这一显示模式已被默认启用，用户无需调整任何设置即可使用 FreeSync（[见更新日志][5]）。

#### 显卡驱动更新

针对当前和未来的 AMD 显卡的驱动进行了改进。此外，支持英特尔 Arch 图形处理器和英特尔 Alder Lake N 的工作也取得了一些进展。

更高刷新率的 DisplayPort 也在这一个版本中得到支持。

#### 从 C89 标准升级到 C11 标准（GNU11）

![][6]

在 Linux 内核中使用的是 C89 C 语言标准，在当前已经稍显老旧并且缺失了许多十分必要的新特性。

考虑到目前的编译器版本 GCC 5.1 的要求，从 Linux 内核 5.18 开始决定用 C11 标准来取代它。

#### 网络优化

Linux 内核 5.18 增加了对新的无线硬件的支持，这包括联发科 MT7916、MT7921U 和博通  BCM43454/6。

![][7]

针对移动设备的改进也包括对英特尔 M.2 WWAN 卡的支持。

Realtek W89 驱动现在支持 AP 模式、6GHz 频段并增加了硬件扫描功能。

在配置 IPv6 和其他各种协议方面，通过一系列的改进提升了性能。

你可以在 Linux 内核 5.18 中网络方面的变更提交中了解所有情况（包括对驱动 API、协议和一些核心功能的改进）。

#### USB 改进

Xen USB 驱动程序进行了改进，以抵御恶意主设备，USB DWC3 驱动程序也支持了更多的硬件类型。

其他改进详见 [更新日志][8]。

#### 增强对苹果键盘以及平板的支持

![][9]

当前版本针对苹果妙控键盘（包含第一代型号）的使用体验进行了优化。

改进了功能键映射、键盘背光事件，以及 2021 款的妙控键盘通过 USB 连接时报告电池水平的能力。

Linux 内核 5.18 改进了输入处理，在平板电脑上输入将变得更为容易。

硬件相关的改进详见 [更新日志][10]。

#### ARM 架构芯片的支持（特斯拉 FSD，树莓派 Zero 2 W）

![][11]

Linux 内核 5.18 现在支持特斯拉的全套自动驾驶 SoC。三星工程师将其贡献到了 Linux 内核上游。

其他芯片支持包括高通骁龙 625/632，以及三星 Exynos 850/7885。

你还会发现 Linux 内核 5.18 支持了树莓派 Zero 2 W，而同时去除了旧的硬件/主板的支持。详见 [更新日志][12]。

你可以参考 [官方更新日志][13] 和 Linus Torvald 的官方公告获取更多信息。

### 如何安装 Linux 内核 5.18？

你可以在 [Linux Kernel Archives][14] 网站上找到最新版本的内核。你可以下载 [Tarball][15] 以进行测试。你也可以参照我们的 [Linux 内核升级指南][16] 获取帮助。

如果不想自己编译它，你可以稍等几周，等 Linux 发行版们把它推到仓库。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/linux-kernel-5-18-release/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[PeterPan0106](https://github.com/PeterPan0106)
校对：[wxy](https://github.com/wxy)

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
