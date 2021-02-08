[#]: collector: (lujun9972)
[#]: translator: (amwps290)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11477-1.html)
[#]: subject: "How to Install Linux on Intel NUC"
[#]: via: "https://itsfoss.com/install-linux-on-intel-nuc/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"

在 Intel NUC 上安装 Linux
======

![](https://img.linux.net.cn/data/attachment/album/201910/18/221221pw3hbbi3bbbbprr4.jpg)

在上周，我买了一台 [InteL NUC][1]。虽然它是如此之小，但它与成熟的桌面型电脑差别甚小。实际上，大部分的[基于 Linux 的微型 PC][2] 都是基于 Intel NUC 构建的。

我买了第 8 代 Core i3 处理器的“<ruby>准系统<rt>barebone</rt></ruby>” NUC。准系统意味着该设备没有 RAM、没有硬盘，显然也没有操作系统。我添加了一个 [Crucial 的 8 GB 内存条][3]（大约 33 美元）和一个 [240 GB 的西数的固态硬盘][4]（大约 45 美元）。

现在，我已经有了一台不到 400 美元的电脑。因为我已经有了一个电脑屏幕和键鼠套装，所以我没有把它们计算在内。

![在我的办公桌上放着一个崭新的英特尔 NUC NUC8i3BEH，后面有树莓派 4][5]

我买这个 Intel NUC 的主要原因就是我想在实体机上测试各种各样的 Linux 发行版。我已经有一个 [树莓派 4][6] 设备作为一个入门级的桌面系统，但它是一个 [ARM][7] 设备，因此，只有少数 Linux 发行版可用于树莓派上。（LCTT 译注：新发布的 Ubuntu 19.10 支持树莓派 4B）

*这个文章里的亚马逊链接是（原文的）受益连接。请参阅我们的[受益政策][8]。*

### 在 NUC 上安装 Linux

现在我准备安装 Ubuntu 18.04 长期支持版，因为我现在就有这个系统的安装文件。你也可以按照这个教程安装其他的发行版。在最重要的分区之前，前边的步骤都大致相同。

#### 第一步：创建一个 USB 启动盘

你可以在 Ubuntu 官网下载它的安装文件。使用另一个电脑去[创建一个 USB 启动盘][9]。你可以使用像 [Rufus][10] 和 [Etcher][11] 这样的软件。在 Ubuntu上，你可以使用默认的启动盘创建工具。

#### 第二步：确认启动顺序是正确的

将你的 USB 启动盘插入到你的电脑并开机。一旦你看到 “Intel NUC” 字样出现在你的屏幕上，快速的按下 `F2` 键进入到 BIOS 设置中。

![Intel NUC 的 BIOS 设置][12]

在这里，只是确认一下你的第一启动项是你的 USB 设备。如果不是，切换启动顺序。

如果你修改了一些选项，按 `F10` 键保存退出，否则直接按下 `ESC` 键退出 BIOS 设置。

#### 第三步：正确分区，安装 Linux

现在当机器重启的时候，你就可以看到熟悉的 Grub 界面，可以让你试用或者安装 Ubuntu。现在我们选择安装它。

开始的几个安装步骤非常简单，选择键盘的布局，是否连接网络还有一些其他简单的设置。

![在安装 Ubuntu Linux 时选择键盘布局][14]

你可能会使用常规安装，默认情况下会安装一些有用的应用程序。

![][15]

接下来的是要注意的部分。你有两种选择：

* “<ruby>擦除磁盘并安装 Ubuntu<rt>Erase disk and install Ubuntu</rt></ruby>”：最简单的选项，它将在整个磁盘上安装 Ubuntu。如果你只想在 Intel NUC 上使用一个操作系统，请选择此选项，Ubuntu 将负责剩余的工作。
* “<ruby>其他选项<rt>Something else</rt></ruby>”：这是一个控制所有选择的高级选项。就我而言，我想在同一 SSD 上安装多个 Linux 发行版。因此，我选择了此高级选项。

![][16]

**如果你选择了“<ruby>擦除磁盘并安装 Ubuntu<rt>Erase disk and install Ubuntu</rt></ruby>”，点击“<ruby>继续<rt>Continue</rt></ruby>”，直接跳到第四步，**

如果你选择了高级选项，请按照下面剩下的部分进行操作。

选择固态硬盘，然后点击“<ruby>新建分区表<rt>New Partition Table</rt></ruby>”。

![][17]

它会给你显示一个警告。直接点击“<ruby>继续<rt>Continue</rt></ruby>”。

![][18]

现在你就可以看到你 SSD 磁盘里的空闲空间。我的想法是为 EFI bootloader 创建一个 EFI 系统分区。一个根（`/`）分区，一个主目录（`/home`）分区。这里我并没有创建[交换分区][19]。Ubuntu 会根据自己的需要来创建交换分区。我也可以通过[创建新的交换文件][32]来扩展交换分区。

我将在磁盘上保留近 200 GB 的可用空间，以便可以在此处安装其他 Linux 发行版。你可以将其全部用于主目录分区。保留单独的根分区和主目录分区可以在你需要重新安装系统时帮你保存里面的数据。

选择可用空间，然后单击加号以添加分区。

![][20]

一般来说，100MB 足够 EFI 的使用，但是某些发行版可能需要更多空间，因此我要使用 500MB 的 EFI 分区。

![][21]

接下来，我将使用 20GB 的根分区。如果你只使用一个发行版，则可以随意地将其增加到 40GB。

根目录（`/`）是系统文件存放的地方。你的程序缓存和你安装的程序将会有一些文件放在这个目录下边。我建议你可以阅读一下 [Linux 文件系统层次结构][22]来了解更多相关内容。

填入分区的大小，选择 Ext4 文件系统，选择 `/` 作为挂载点。

![][24]

接下来是创建一个主目录分区，我再说一下，如果你仅仅想使用一个 Linux 发行版。那就把剩余的空间都使用完吧。为主目录分区选择一个合适的大小。

主目录是你个人的文件，比如文档、图片、音乐、下载和一些其他的文件存储的地方。

![][25]

既然你创建好了 EFI 分区、根分区、主目录分区，那你就可以点击“<ruby>现在安装<rt>Install Now</rt></ruby>”按钮安装系统了。

![][26]

它将会提示你新的改变将会被写入到磁盘，点击“<ruby>继续<rt>Continue</rt></ruby>”。

![][27]

#### 第四步：安装 Ubuntu 

事情到了这就非常明了了。现在选择你的分区或者以后选择也可以。

![][28]

接下来，输入你的用户名、主机名以及密码。

![][29]

看 7-8 分钟的幻灯片就可以安装完成了。

![][30]

一旦安装完成，你就可以重新启动了。

![][31]

当你重启的时候，你必须要移除你的 USB 设备，否则你将会再次进入安装系统的界面。

这就是在 Intel NUC 设备上安装 Linux 所需要做的一切。坦白说，你可以在其他任何系统上使用相同的过程。

### Intel NUC 和 Linux 在一起：如何使用它？

我非常喜欢 Intel NUC。它不占用太多的桌面空间，而且有足够的能力去取代传统的桌面型电脑。你可以将它的内存升级到 32GB。你也可以安装两个 SSD 硬盘。总之，它提供了一些配置和升级范围。

如果你想购买一个桌面型的电脑，我非常推荐你购买使用 [Intel NUC][1] 迷你主机。如果你不想自己安装系统，那么你可以购买一个[基于 Linux 的已经安装好的系统迷你主机][2]。

你是否已经有了一个 Intel NUC？有一些什么相关的经验？你有什么相关的意见与我们分享吗？可以在下面评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-linux-on-intel-nuc/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.amazon.com/Intel-NUC-Mainstream-Kit-NUC8i3BEH/dp/B07GX4X4PW?psc=1&SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B07GX4X4PW "Intel NUC"
[2]: https://itsfoss.com/linux-based-mini-pc/
[3]: https://www.amazon.com/Crucial-Single-PC4-19200-SODIMM-260-Pin/dp/B01BIWKP58?psc=1&SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B01BIWKP58 "8GB RAM from Crucial"
[4]: https://www.amazon.com/Western-Digital-240GB-Internal-WDS240G1G0B/dp/B01M9B2VB7?SubscriptionId=AKIAJ3N3QBK3ZHDGU54Q&tag=chmod7mediate-20&linkCode=xm2&camp=2025&creative=165953&creativeASIN=B01M9B2VB7 "240 GB Western Digital SSD"
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/intel-nuc.jpg?resize=800%2C600&ssl=1
[6]: https://itsfoss.com/raspberry-pi-4/
[7]: https://en.wikipedia.org/wiki/ARM_architecture
[8]: https://itsfoss.com/affiliate-policy/
[9]: https://itsfoss.com/create-live-usb-of-ubuntu-in-windows/
[10]: https://rufus.ie/
[11]: https://www.balena.io/etcher/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/boot-screen-nuc.jpg?ssl=1
[13]: https://itsfoss.com/find-which-kernel-version-is-running-in-ubuntu/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-1_tutorial.jpg?ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-2_tutorial.jpg?ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-3_tutorial.jpg?ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-4_tutorial.jpg?ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-5_tutorial.jpg?ssl=1
[19]: https://itsfoss.com/swap-size/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-6_tutorial.jpg?ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-7_tutorial.jpg?ssl=1
[22]: https://linuxhandbook.com/linux-directory-structure/
[23]: https://itsfoss.com/share-folders-local-network-ubuntu-windows/
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-8_tutorial.jpg?ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-9_tutorial.jpg?ssl=1
[26]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-10_tutorial.jpg?ssl=1
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-11_tutorial.jpg?ssl=1
[28]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-12_tutorial.jpg?ssl=1
[29]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-13_tutorial.jpg?ssl=1
[30]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-14_tutorial.jpg?ssl=1
[31]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-15_tutorial.jpg?ssl=1
[32]: https://itsfoss.com/create-swap-file-linux/
