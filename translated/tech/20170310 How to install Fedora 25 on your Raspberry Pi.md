如何在树莓派上安装 Fedora 25
============================================================

### 看看这个分布的教程。

 ![How to install Fedora 25 on your Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/gnome_raspberry_pi_fedora.jpg?itok=Efm6IKxP "How to install Fedora 25 on your Raspberry Pi") 
>图片提供 opensource.com

2016 年 10 月，Fedora 25 Beta 发布了，随之而来的还有对[ Raspberry Pi 2 和 3 的初步支持][6]。Fedora 25 的最终“通用”版将在一个月后发布，从那时起，我一直在树莓派上尝试不同的 Fedora 版本。

这篇文章不仅是一篇 Raspberry Pi 3 上的 Fedora 25 的评论，还集合了提示、截图、以及我对官方初步对 Pi 支持的 Fedora 的一些个人想法。

更多关于树莓派的

*   [我们最新的树莓派信息][1]
*   [什么是树莓派？][2]
*   [树莓派入门][3]
*   [给我们发送你的树莓派项目和教程][4]

在我开始之前，需要说一下的是，我为写这篇文章所做的所有工作都是在我的个人笔记本电脑上运行 Fedora 25 。我使用一张 microSD 插到 SD 适配器中复制和编辑所有的 Fedora 镜像到 32GB 的 microSD 卡中，我在连接到一台三星电视后启动了 Raspberry Pi 3。 因为 Fedora 25 还尚不支持内置Wi-Fi，所以 Raspberry Pi 3 还使用以太网线缆进行网络连接。最后，我使用了 Logitech K410 无线键盘和触摸板进行输入。

如果你没有机会使用以太网线连接你的树莓派上玩 Fedora 25，我有一个 Edimax Wi-Fi USB 适配器，它可以在 Fedora 25 上工作，但在本文中，我只使用了以太网连接。

### 在你开始在树莓派上安装 Fedora 25 之前

阅读 Fedora 项目 wiki上 的[树莓派支持文档][7]。你可以从 wiki 下载 Fedora 25 安装所需的镜像，并且列出了所有支持和不支持的内容。

此外，请注意，这是初始支持版本，并且还有许多新的工作和支持将随着 Fedora 26 的发布而出现，所以请随时报告 bug，并通过[Bugzilla][8]，这个 Fedora的[ ARM 邮件列表][9]，或者在 或 Freenode IRC 频道＃fedora-arm 上分享你在树莓派上使用 Fedora 25 的体验反馈。

### 安装

我下载并安装了五个不同的 Fedora 25 版本：GNOME（工作站默认）、KDE、Minimal、LXDE 和 Xfce。在多数情况下，它们都有一致和易于遵循的步骤，以确保我的 Raspberry Pi 3 上启动正常。有些已知 bug 是人们正在解决的，有些通过Fedora wik 遵循标准操作程序。

 ![GNOME on Raspberry Pi](https://opensource.com/sites/default/files/gnome_on_rpi.png "GNOME on Raspberry Pi") 

Raspberry Pi 3 上的 Fedora 25 workstation、 GNOME 版本

### 安装步骤

1\. 在你的笔记本上，从支持文档页面的链接下载树莓派的 Fedora 25 镜像。

2\. 在笔记本上，使用 **fedora-arm-installer**或命令行将镜像复制到 microSD：

**xzcat Fedora-Workstation-armhfp-25-1.3-sda.raw.xz | dd bs=4M status=progress of=/dev/mmcblk0**

注意：**/dev/mmclk0**是我的 microSD 插到 SD 适配器后安装在我的笔记本电脑上的设备，即使我在笔记本上使用 Fedora，我可以使用 **fedora-arm-installer**，但是我喜欢命令行。

3\. 复制完镜像后，_先不要启动你的系统_。我知道你很想这么做，但你仍然需要进行几个调整。

4\. 为了使镜像文件尽可能小以便下载，镜像上的根文件系统是很小的，因此你必须增加根文件系统的大小。如果你不这么做，你仍然可以启动你的派，但如果你一旦运行 **dnf** 来升级你的系统，它就会填满文件系统，还会有糟糕的事情会发生，所以乘着 microSD 还在你的笔记本上进行分区：

**growpart /dev/mmcblk0 4
resize2fs /dev/mmcblk0p4**

注意：在 Fedora 中，** growpart** 命令由 **cloud-utils-growpart.noarch** 这个 RPM 提供。

5\.文件系统更新后，您需要将 **vc4** 模块列入黑名单。[有关此 bug 的详细信息。][10]

我建议在启动树莓派之前这样做，因为不同的版本将以不同的方式表现。例如，（至少对我来说）在没有黑名单 **vc4** 的情况下，GNOME 会在我启动后首先出现，但在系统更新后，它将不再出现。 KDE 的版本在第一次启动时根本不会出现。因此我们可能需要在我们的第一次启动之前将 **vc4** 加入黑名单，直到错误解决。

黑名单应该出现在两个不同的地方。首先，在你的 microSD根 分区上，在 **etc/modprode.d/** 下创建一个 **vc4.conf**，内容是：**blacklist vc4**。第二，在你的 microSD 启动分区添加 **rd.driver.blacklist=vc4** 到 **extlinux/extlinux.conf** 的末尾。

6\. 现在，你可以启动你的树莓派了。

### 启动

你要有耐心，特别是对于 GNOME 和 KDE 发行版来说。在 SSD（固态驱动器）和几乎即时启动的时代，特别是第一次启动时，你很容易就对派的启动速度感到不耐烦。在第一次启动 Window Manager 之前，它将弹出一个初始配置页面，它允许你配置 root 密码、常规用户、时区和网络。一旦你得到配置，你应该能够 SSH 到你的树莓派上，这样你就可以方便调试显示问题了。

### 系统更新

一旦你在树莓派上运行了 Fedora 25，你就会最终（或立即）想要系统更新。

首先，当进行内核升级时，先熟悉你的 **/boot/extlinux/extlinux.conf** 文件。如果升级内核，下次启动时，除非手动选择正确的内核，否则很可能会启动进入 Rescue 模式。避免这种情况发生最好方法是，在你的 **extlinux.conf**中将定义 Rescue 镜像的那五行移动到文件的底部，这样最新的内核将在下次自动启动。你可以直接在派上或通过在笔记本挂载来编辑 **/boot/extlinux/extlinux.conf** directly：

**label Fedora 25 Rescue fdcb76d0032447209f782a184f35eebc (4.9.9-200.fc25.armv7hl)
            kernel /vmlinuz-0-rescue-fdcb76d0032447209f782a184f35eebc
            append ro root=UUID=c19816a7-cbb8-4cbb-8608-7fec6d4994d0 rd.driver.blacklist=vc4
            fdtdir /dtb-4.9.9-200.fc25.armv7hl/
            initrd /initramfs-0-rescue-fdcb76d0032447209f782a184f35eebc.img**

第二点，如果无论什么原因，如果你的显示器在升级后再次变暗，并且你确定已经将 **vc4** 加入黑名单，请运行 **lsmod | grep vc4**。你可以先启动到多用户模式而不是图形模式，并从命令行中运行 **startx**。 请阅读 **/etc/inittab** 中的内容，了解如何切换目标的说明。

 ![KDE on Raspberry Pi 3](https://opensource.com/sites/default/files/kde_on_rpi.png "KDE on Raspberry Pi 3") 

Raspberry Pi 3 上的 Fedora 25 workstation、 KDE 版本

### Fedora 版本 

所有的 Fedora 版本我都试过，唯一一个有问题是 XFCE，我相信这是由于这个[已知的 bug][11]。

当我按照我在这里分享的步骤来时，GNOME、KDE、LXDE 和 minimal 都运行得很好。考虑到 KDE 和 GNOME 会占用更多资源，我会推荐想要在树莓派上使用 Fedora 25 的人 使用 LXDE 和 Minimal。如果你是一个想要一台廉价的支持 SELinux 的服务器来覆盖你的安全考虑的系统管理员，你想要使用树莓派作为你的服务器，并需要支持 22 端口和 vi，那就用 Minimal 版本。对于开发人员或开始学习 Linux 的人来说，LXDE 可能是更好的方式，因为它可以快速方便地访问所有基于 GUI 的工具，如浏览器、IDE 和你可能需要的客户端。

 ！[LXES on Raspberry Pi 3]（https://opensource.com/sites/default/files/lxde_on_rpi.png“LXDE on Raspberry Pi 3”）

Raspberry Pi 3 上的 Fedora 25 workstation、LXDE。

看到越来越多的 Linux 发行版在基于 ARM 的树莓派上可用，那真是太棒了。对于其第一个支持的版本，Fedora 团队为日常 Linux 用户提供了更好的体验。我一定会期待 Fedora 26 的改进和 bug 修复。

--------------------------------------------------------------------------------

作者简介：

Anderson Silva - Anderson 于 1996 年开始使用 Linux。更精确地说是 Red Hat Linux。 2007 年，当他作为 IT 部门的发布工程师时加入红帽时，他的主要梦想成为了现实。此后，他在红帽担任过多个不同角色，从发布工程师到系统管理员、高级经理和信息系统工程师。他是一名 RHCE 和 RHCA 以及一名活跃的 Fedora 包维护者。

----------------

via: https://opensource.com/article/17/3/how-install-fedora-on-raspberry-pi

作者：[Anderson Silva][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ansilva
[1]:https://opensource.com/tags/raspberry-pi?src=raspberry_pi_resource_menu
[2]:https://opensource.com/resources/what-raspberry-pi?src=raspberry_pi_resource_menu
[3]:https://opensource.com/article/16/12/getting-started-raspberry-pi?src=raspberry_pi_resource_menu
[4]:https://opensource.com/article/17/2/raspberry-pi-submit-your-article?src=raspberry_pi_resource_menu
[5]:https://opensource.com/article/17/3/how-install-fedora-on-raspberry-pi?rate=gIIRltTrnOlwo4h81uDvdAjAE3V2rnwoqH0s_Dx44mE
[6]:https://fedoramagazine.org/raspberry-pi-support-fedora-25-beta/
[7]:https://fedoraproject.org/wiki/Raspberry_Pi
[8]:https://bugzilla.redhat.com/show_bug.cgi?id=245418
[9]:https://lists.fedoraproject.org/admin/lists/arm%40lists.fedoraproject.org/
[10]:https://bugzilla.redhat.com/show_bug.cgi?id=1387733
[11]:https://bugzilla.redhat.com/show_bug.cgi?id=1389163
[12]:https://opensource.com/user/26502/feed
[13]:https://opensource.com/article/17/3/how-install-fedora-on-raspberry-pi#comments
[14]:https://opensource.com/users/ansilva
