故障排除提示：5 个最常见的 Linux 问题
============================================================

> 了解如何解决Linux桌面用户遇到的最常见的问题

 ![5个linux最常见问题解决提示](https://opensource.com/sites/default/files/styles/image-full-size/public/images/law/rh_003601_05_mech_osyearbook2016_containers_cc.png?itok=0ZEfXLEE "Troubleshooting tips for the 5 most common Linux issues") 
 
图片：Opensource.com

尽管绝大多数用户如预期地成功安装和操作了 Linux， 但不可避免地仍会有一些用户遇到问题。作为今年任务队列里的最后一篇文章，我认为在即将进入 2016 年时，总结一下人们所遇到的最常见的技术性的 Linux 问题会很有趣。我把这个问题发布到了 LinuxQuestions.org（LQ） 和社交媒体，我分析了 LQ 的帖子情况之后，得到如下成果。

### 1、 Wifi 驱动程序（特别是 Broadcom 芯片）

一般来说，Wifi 驱动程序，特别是 Broadcom 无线网卡，仍然是 Linux 面临的最大的问题技术问题之一。在 LQ 上，2016 年有数以百计的帖子在讨论这个话题，而且还有其他无数的地方也是。市场上有数十种 Broadcom 无线网卡可供使用，但为每一个发行版描述具体的排错细节来已经超出了一篇文章的范畴，但是基本的故障排除步骤是相同的：

* 通过使用 `lspci` 命令确定具体使用的 Broadcom 卡，以找出 PCI ID，
* 确定使用发行版是否支持该卡，
* 如果支持，找到正确的方法来使网卡工作。

例如，如果有一个 `14e4:4315` PCI ID 的卡，并且系统为 Ubuntu，则应该知道 BCM4312 卡可以通过安装 `firmware-b43-installer` 包来驱动。另一个选择是在购买之前，研究好可用的 WiFi 卡，以确保您的发行版完全支持它。

### 2、 打印机驱动程序（特别是佳能和 Lexmark）

打印机也是常有问题的，佳能和 Lexmark 被反复提及遇到这种问题。如果您要购买一台新打印机，请在购买之前研究兼容性。但是，如果您从其他操作系统迁移，这可能没得选择。如果你正在做调研，[OpenPrinting][1] 数据库和您的发行版的官方支持渠道是两个最好的起点。请注意，您应确保设备的所有功能完全兼容，特别是如果它是个多功能产品。对佳能打印机的一个常见的抱怨是，驱动程序通常只能在非英语，甚至是很难找的网站上才有。

> 如果您购买的是新打印机，请在购买之前研究兼容性。

### 3、 显卡

显卡是一个微妙的话题，因为在 Linux 上显卡可以非常好的简单直观的开箱即用。出现的问题是：显卡加速器/3D 加速；最新的显卡和最新显示技术，如 NVIDIA Optimus 和 ATI 动态 GPU 切换；专有驱动程序的安装和稳定性；能效管理；以及可靠的挂起和恢复。如果你不是一个游戏玩家，也没有别的需要高端图形功能的需求，并且不是使用笔记本电脑，那么你可能不必担心这个。如果您正在寻找一台新的笔记本电脑，一定要在购买前研究好兼容性。如果你是一个游戏玩家或需要最高端的图形功能，你需要明确知道你的需求是什么，然后开始你的研究。幸运的是，这种情况正在改善，Wayland 开始解决问题，2017 年情况应该会变得好一些。

### 4、 声卡

再次，对于简单配置，声卡非常容易设置并可以很可靠地在 Linux 上运行。一旦你买的是专业级产品，例如回声消除、音频路由，统一混合和其他复杂的配置，它可能就很快地每况愈下。我的建议是，如果你需要高端的实时音频，请使用专用的音频相关的发行版。

### 5、 安装

有了这个包罗万象的分类，本文几乎保证是高质量的。也就是说，公平的说，我不知道 Linux 有普遍的安装问题。绝大多数的安装都按预期进行。Linux 支持多种硬件，安装 Linux 机器上可能有近乎无限的硬件组合，不可避免会导致了某种情况下的例外情况。最终用户其实也很少安装类似 Mac OS 或 Windows 这样的其它系统，因为它们都是随同新设备预安装的。

> 绝大多数的安装都按预期进行。

### 前景光明

其他提到的问题经常包括蓝牙、挂起/恢复，HiDPI 和触摸屏。您可能会看到这里形成一个模式，本文中提到的大多数问题集中在桌面用户。如果你已经意识到了这点，这其实是有意义的。Linux 桌面使用率相对较低，导致结果是，用于发现和解决相关问题的测试和资源很少。随着桌面使用量的增加，可以预期这些部分会改善。

在这方面，我认为最好提及的一个例子，曾经常常作为 Linux 的问题提出，但是反而最近很罕见：字体。几年前，获得高品质的抗锯齿字体常常是个问题。但是，随着现代发行版本的更新，它已成为常规。

你认为 2016 年最常见的 Linux 技术问题是什么？ 请在评论中留言告诉我。

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/jeremy-garcia.jpg?itok=kqOMWJIg)

Jeremy Garcia - Jeremy Garcia is the founder of LinuxQuestions.org  and an ardent but realistic open source advocate. Follow Jeremy on Twitter: @linuxquestions

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/yearbook-linux-troubleshooting-tips

作者：[Jeremy Garcia][a]
译者：[Vic020](http://vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jeremy-garcia
[1]:http://www.openprinting.org/printers
