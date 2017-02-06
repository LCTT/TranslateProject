故障排除提示:5个最常见的Linux问题
============================================================

### 了解如何解决Linux桌面用户遇到的最常见的问题

 ![5个linux最常见问题解决提示](https://opensource.com/sites/default/files/styles/image-full-size/public/images/law/rh_003601_05_mech_osyearbook2016_containers_cc.png?itok=0ZEfXLEE "Troubleshooting tips for the 5 most common Linux issues") 
 
图片：

Opensource.com

尽管绝大多数用户已经按照预期成功安装和操作Linux， 但不可避免地会有一些用户遇到问题。作为今年任务队列里的最后一篇文章，我认为总结2016年人们遇到的最常见的技术Linux问题会很有趣。我同样把问题发布到LinuxQuestions.org和社交媒体，我分析了LQ发布模式。接下来是成果。

### 1. Wifi驱动程序（特别是Broadcom芯片）

一般来说，wifi驱动程序，特别是Broadcom卡，仍然是Linux面临的最大的问题技术问题之一。在LQ上，2016年有数以百计的帖子关于这个话题，还有其他无数的地方。市场上有数十种Broadcom无线网卡可供使用，对于每一种型号单独发布一篇文章来说明实在有些过分，但是基本的故障排除步骤是相同的：

* 通过使用_lspci_命令确定使用的Broadcom卡，以找出PCI ID，
* 确定使用的驱动是否支持该卡，
* 如果是正确的驱动，确定正确的方法来使网卡工作。

例如，如果有一个14e4：4315 PCI ID并且系统为Ubuntu，则应该知道BCM4312卡可以通过安装_firmware-b43-installer_包驱动。另一个选择是在购买之前，研究好可用的WiFi卡，以确保它的完全支持您的发行版。

### 2. 打印机驱动程序（特别是Canon和Lexmark）

打印机也是常有问题的，这个问题使得佳能和利盟被反复提及。如果您购买的是新打印机，请在购买之前研究兼容性。但是，如果您从其他操作系统迁移，这可能没得选择。如果你正在做研究，[OpenPrinting][1]数据库和您的发行版的官方支持渠道是两个最好的起点。请注意，您应确保设备的所有功能完全兼容，特别是如果它是多功能产品。对佳能打印机的一个常见的抱怨是，驱动程序通常只能在非英语，甚至是模糊的网站上才有。

> 如果您购买的是新打印机，请在购买之前研究兼容性。

### 3. 显卡

显卡是一个细微的话题，因为在Linux上显卡可以非常好的简单直观的开箱即用。出现的问题是：显卡加速器/加速度；最新的显卡和最新技术，如NVIDIA Optimus和ATI动态GPU切换;安装和专有驱动程序的稳定性; 高效电源管理; 并可靠暂停和恢复。如果你不是一个游戏玩家，或者另一个原因不需要高端的图形，并且不是在笔记本电脑上，那么你可能不必担心这个。如果您正在寻找一台新的笔记本电脑，一定要研究兼容性，然后再购买。如果你是一个游戏玩家或需要最高端的图形，你需要知道你的要求是什么，并开始你的研究。幸运的是，这种情况正在改善，Wayland开始解决问题，情况应该在2017年会变得好一些。

### 4. 声卡

再次，对于简单的设置，声卡非常容易配置并可以很可靠在Linux运行。一旦你进入专业配置，例如回声消除，音频路由，统一混合和其他复杂的设置，然而，它可以很快地每况愈下。我的建议是，如果你需要高端的实时声卡，请使用专用的音频相关发行版。

### 5. 安装

有了这个包罗万象的分类，本文几乎保证是高质量的。也就是说，我不知道说Linux有广泛的安装问题是否公平。绝大多数的安装都按预期进行。Linux支持的多种硬件，以及尝试以近乎无限的硬件组合，安装Linux，不可避免地导致了某种情况下的边缘情况。

> 绝大多数的安装都按预期进行。

### 未来看起来明亮

其他提到的问题经常包括蓝牙，暂停/恢复，HiDPI和触摸屏。您可能会看到这里形成一个模式，本文中提到的大多数问题集中在桌面用例。如果你已经意识到了，这其实是有意义的。Linux桌面使用率相对较低，导致结果是，很少的测试和资源用于发现和解决相关问题。随着桌面使用量的增加，可以预期这些区域的改善。

在这方面，我认为最好提及的一个例子，曾经常常作为Linux的问题提出，但是反而最近很罕见：字体。几年前，获得高品质的抗锯齿字体常常是个问题。但是，随着现代发行版本的更新，它已成为常见规则。

你认为2016年最常见的Linux技术问题是什么？ 请在评论中留言告诉我。

--------------------------------------------------------------------------------

作者简介：

![](https://opensource.com/sites/default/files/styles/profile_pictures/public/pictures/jeremy-garcia.jpg?itok=kqOMWJIg)

Jeremy Garcia - Jeremy Garcia is the founder of LinuxQuestions.org  and an ardent but realistic open source advocate. Follow Jeremy on Twitter: @linuxquestions

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/yearbook-linux-troubleshooting-tips

作者：[Jeremy Garcia][a]
译者：[Vic020](http://vicyu.net)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jeremy-garcia
[1]:http://www.openprinting.org/printers
