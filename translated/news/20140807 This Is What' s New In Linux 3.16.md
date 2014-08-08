Linux 3.16的新特性
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2011/07/Tux-psd3894.jpg)

**这个周末，在我们大多数人还在休息的时候，Linus Torvalds却没有闲着，他发布了新的Linux内核版本。**

Linux 3.16已经稳定而且发布了，不管放在什么地方。

在[他的跑步机工作台上][1]敲着键盘（也许不是，但是想到这个形象就太搞笑了没办法）Linux创始人放心地宣布了最新的稳定发布版，[有如下说明][2]：

> “尽管一直以来3.16都有些小问题，现在都已经完美地解决了，也没有理由再发布一个我几个星期前担心的额外候选版本了。”

### Linux 3.16带来了什么新特性？ ###

代号为‘Shuffling Zombie Juror’的Linux 3.16的出场，紧跟着大量的关键改善。范围从复杂的积分式音响系统－例如：‘[统一的组控制结构][3]’－到更贴近用户的，比如新的和改进的驱动。

谢谢[Linux新闻周刊][4]和[Phoronix网][5]的辛勤工作（再加上Linux内核邮件列表），我们整理出一份这个发布版中一些显著改动的列表。

- 针对多个ARM SoCs的多平台ARM内核映像（包括Exynos）
- 对Nvidia Tegra K1以及Kepler GPU的各种支持
- Nokia N900调制解调器驱动加入主线中
- 初步支持Intel Cherryview
- 改进了Sixaxix和DualShock 4手柄支持
- 改进了Sony-HID驱动
- Synaptics触摸板的RMI驱动
- 修复Saitek RAT7游戏鼠标问题
- Dell FreeFall驱动
- 80个针对[Btrfs文件系统][6]的改动和修复
- 更新misc，Cirrus，Realtek和Analog devices的音频驱动
- 支持Tegra HD-audio HDMI

### 安装Linux 3.16 ###

既然已经发布，意味着大家可以尝试一下了。不过，还是悠着点吧。Linux 3.16很可能会在Ubuntu 14.10中作为Linux内核的基础，预计在年末完成。14.10里的内核也将在晚些时候通过更新提供给LTS用户。

如果你没那么大耐心，而且－**更重要的是**－足够牛B，可以在Ubuntu 14.04 LTS系统上安装Linux 3.16，使用Canoical维护的主线内核安装包中列出的和系统对应的安装程序就可以。

- [访问Ubuntu内核安装包网站][7]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/08/linux-kernel-3-16-changes-drivers

作者：[Joey-Elijah Sneddon][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgubuntu.co.uk/2014/07/linus-torvalds-messy-desk-video
[2]:https://lkml.org/lkml/2014/8/3/82
[3]:https://lwn.net/Articles/601840/
[4]:https://lwn.net/
[5]:http://www.phoronix.com/scan.php?page=news_item&px=MTc1NDM
[6]:http://lkml.iu.edu/hypermail/linux/kernel/1406.1/02366.html
[7]:http://kernel.ubuntu.com/
