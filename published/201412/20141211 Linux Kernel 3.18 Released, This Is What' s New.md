Linux 3.18 新内核带来了什么新东西？
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2011/07/Tux-psd3894.jpg)

新的一月意味着新的稳定版Linux内核的发布，前一段时间，Linus Torvalds[宣布Linux 3.18 很快就会发布了][1]。

Torvalds在Linux内核邮件列表中解释到，由于在3.17中还存在几个令一小部分用户烦心的问题，但是‘**绝不可以在一些人积极解决老问题时其他人无所事事。**’

### Linux 3.18中有什么新的？ ###

Linux 3.18内核主要致力于硬件支持、电源效率、bug修复和可靠性。

如往常一样，这些内容跨度很大，容易让人迷惑 。比如：加密层多重缓冲操作 - 到气冲感知， 就像对雷蛇游戏手柄的支持。

下面我们收集了这个版本的重要的改变。这远远不是所有的，只是选取了一些更相关的内容。

- Nouveau (开源的 Nvidia GPU 驱动) 现在支持基础 DisplayPort 音频
- 对雷蛇游戏手柄的支持，用在Xbox 360上
- Xilinx USB2 外设
- 对Microchip AR1021 i2c、PenMount 6000 touch的触摸屏支持
- 音频编码:  Cirrus Logic CS35L32、 Everest ES8328 和 Freescale ES8328 
- 音频支持: 通用飞思卡尔声卡,  Analog Devices SSM4567音频放大器
- 几个文件系统提升, 包括 Btrfs 和 F2FS
- 现在支持了DCTCP拥塞控制算法
- JIT 编译64位 eBPF程序
- “Tinification” 帮助开发人员编译更精简更小的内核

#### 在Ubuntu上安装 Linux 3.18 ####

虽然声称是稳定版并带来了大量的更新，但不要马上急着升级你的系统。除非你擅长处理监控异常，CPU过热、和其他各种系统报出的异常。

如果你坚持更新，你可以在kernel.org网站上找到源码包。

- [下载Linux内核源码包][2]

这里有一个由Canonical维护的最新Linux内核归档。尽管你可能在其他地方看到过，但是，请注意，这不是针对终端用户的。没有任何保证与支持，你自己承担风险。

- [访问Ubuntu内核主线归档][3]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/12/linux-kernel-3-18-released-whats-new

作者：[Joey-Elijah Sneddon][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://lkml.org/lkml/2014/12/7/202
[2]:https://www.kernel.org/pub/linux/kernel/v3.x/
[3]:http://kernel.ubuntu.com/~kernel-ppa/mainline/?C=N;O=D