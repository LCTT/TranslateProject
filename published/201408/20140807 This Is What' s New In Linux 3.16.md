Linux 3.16 内核中有什么新东西？
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2011/07/Tux-psd3894.jpg)

**就在我们在梦乡中沉醉的的时间里，莱纳斯·托沃兹却一直处在忙碌之中。**

是的，大家应该已经知道了，不久之前，Linux 3.16现在已经释出了稳定版本。

在他购买的一张跑步机办公桌上（或许不是，但是他的性格中的幽默实在是难以让人招架）Linux的创始人终于[公布][2]了最新的稳定版本:

> “虽然3.16有一阵看起来有点玄乎，但是后来一切进展顺利，没有理由去做一些额外的候选发布版，就像几个星期前我担心的那样。” 

### Linux 3.16有什么新特性？ ###

代号为“Shuffling Zombie Juror”的Linux 3.16 的发布伴随着一系列的关键性改进。它们包括了复杂的和完整的 - 例如，“[unified control group hierarchy][3]（注：统一控制组层次结构）” ， 给更多的用户访问权限，如新的和改进的驱动程序。

多亏了[Linux Weekly News][4] 和 [Phoronix][5] 的辛勤工作（还有google在linux内核邮件列表上的出色贡献），我们整理了一些在这个版本中出现的的显着的变化和特性。 

- 在多个ARM SoC的多平台的ARM内核映像（包括Exynos） 
- 对Nvidia的Tegra K1和开普勒GPU的各种支持 
- 诺基亚N900的调制解调器驱动程序包含在主线  
- 加入对英特尔Cherryview支持
- 改善对SIXAXIS和DUALSHOCK 4控制器的支持
- Sony-HID驱动程序的改进
- Synaptics触摸板的RMI驱动程序
- Saitek RAT7游戏鼠标的修复
- 戴尔 FreeFall driver
- 对[Btrfs 文件系统][6]的80的改变和修正，
- 新的音频驱动程序杂项。Cirrus，瑞昱 和 Analog 设备。 
- Tegra的高清音频HDMI 支持

### 安装Linux 3.16 ###

新的内核发布了，你想要吗？好吧，先别急。 Linux的3.16很有可能在Ubuntu Linux14.10将作为默认内核而在今年晚些时候发布。而14.10版的内核也将不久后通过小版本更新提供给LTS的用户们。 

如果你是一个急性子，**最重要的**是具备足够娴熟的技能，你可以使用在Canonical维护的主线内核档案中列出的相应的安装器 , 在为你的Ubuntu 14.04 LTS上安装Linux 3.16内核。

- [访问Ubuntu的内核存档网站][7]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/08/linux-kernel-3-16-changes-drivers

作者：[Joey-Elijah Sneddon][a]
译者：[owen-carter](https://github.com/owen-carter)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgubuntu.co.uk/2014/07/linus-torvalds-messy-desk-video
[2]:https://lkml.org/lkml/2014/8/3/82
[3]:https://lwn.net/Articles/601840/
[4]:https://lwn.net/
[5]:http://www.phoronix.com/scan.php?page=news_item&px=MTc1NDM
[6]:http://lkml.iu.edu/hypermail/linux/kernel/1406.1/02366.html
[7]:http://kernel.ubuntu.com/