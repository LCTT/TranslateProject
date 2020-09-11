[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11414-1.html)
[#]: subject: (A Raspberry Pi Based Open Source Tablet is in Making and it’s Called CutiePi)
[#]: via: (https://itsfoss.com/cutiepi-open-source-tab/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

CutiePi：正在开发中的基于树莓派的开源平板
======

![](https://img.linux.net.cn/data/attachment/album/201910/02/125301wkbvgz1n7zv7j55e.jpg)

CutiePi 是一款 8 英寸的构建在树莓派上的开源平板。他们在[树莓派论坛][1]上宣布：现在，它只是一台原型机。

在本文中，你将了解有关 CutiePi 的规格、价格和可用性的更多详细信息。

它们使用一款定制的计算模块载版（CM3）来制造平板。[官网][2]提到使用定制 CM3 载板的目的是：

> 定制 CM3/CM3+ 载板是专为便携使用而设计，拥有增强的电源管理和锂聚合物电池电量监控功能。还可与指定的 HDMI 或 MIPI DSI 显示器配合使用。

因此，这使得该平板足够薄而且便携。

### CutiePi 规格

![CutiePi Board][3]

我惊讶地了解到它有 8 英寸的 IPS LCD 显示屏，这对新手而言是个好事。然而，你不会有一个真正高清的屏幕，因为官方宣称它的分辨率是 1280×800。

它还计划配备 4800 mAh 锂电池（原型机的电池为 5000 mAh）。嗯，对于平板来说，这不算坏。

连接性上包括支持 Wi-Fi 和蓝牙 4.0。此外，还有一个 USB Type-A 插口、6 个 GPIO 引脚和 microSD 卡插槽。

![CutiePi Specifications][4]

硬件与 [Raspbian OS][5] 官方兼容，用户界面采用 [Qt][6] 构建，以获得快速直观的用户体验。此外，除了内置应用外，它还将通过 XWayland 支持 Raspbian PIXEL 应用。

### CutiePi 源码

你可以通过分析所用材料的清单来猜测此平板的定价。CutiePi 遵循 100% 的开源硬件设计。因此，如果你觉得好奇，可以查看它的 [GitHub 页面][7]，了解有关硬件设计和内容的详细信息。

### CutiePi 价格、发布日期和可用性

CutiePi 计划在 8 月进行[设计验证测试][8]批量 PCB。他们的目标是在 2019 年底推出最终产品。

官方预计，发售价大约在 $150-$250 左右。这只是一个近似的范围，还应该保有怀疑。

显然，即使产品听上去挺有希望，但价格将是它成功的一个主要因素。

### 总结

CutiePi 并不是第一个使用[像树莓派这样的单板计算机][9]来制作平板的项目。我们有即将推出的 [PineTab][10]，它基于 Pine64 单板电脑。Pine 还有一种笔记本电脑，名为 [Pinebook][11]。

从原型来看，它确实是一个我们可以期望使用的产品。但是，预安装的应用和它将支持的应用可能会扭转局面。此外，考虑到价格估计，这听起来很有希望。

你觉得怎么样？让我们在下面的评论中知道你的想法，或者投个票。

--------------------------------------------------------------------------------

via: https://itsfoss.com/cutiepi-open-source-tab/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/forums/viewtopic.php?t=247380
[2]: https://cutiepi.io/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/cutiepi-board.png?ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/cutiepi-specifications.jpg?ssl=1
[5]: https://itsfoss.com/raspberry-pi-os-desktop/
[6]: https://en.wikipedia.org/wiki/Qt_%28software%29
[7]: https://github.com/cutiepi-io/cutiepi-board
[8]: https://en.wikipedia.org/wiki/Engineering_validation_test#Design_verification_test
[9]: https://itsfoss.com/raspberry-pi-alternatives/
[10]: https://www.pine64.org/pinetab/
[11]: https://itsfoss.com/pinebook-pro/
