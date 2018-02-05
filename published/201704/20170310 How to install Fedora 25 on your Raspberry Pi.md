如何在树莓派上安装 Fedora 25
============================================================

> 了解 Fedora 第一个官方支持树莓派的版本

 ![How to install Fedora 25 on your Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/gnome_raspberry_pi_fedora.jpg?itok=Efm6IKxP "How to install Fedora 25 on your Raspberry Pi") 

>图片提供 opensource.com

2016 年 10 月，Fedora 25 Beta 发布了，随之而来的还有对 [树莓派 2 和 3 的初步支持][6]。Fedora 25 的最终“通用”版在一个月后发布，从那时起，我一直在树莓派上尝试不同的 Fedora spins。

这篇文章不仅是一篇<ruby>树莓派<rt>Raspberry Pi</rt></ruby> 3 上的 Fedora 25 的点评，还集合了技巧、截图以及我对 Fedora 第一个官方支持 Pi 的这个版本的一些个人看法。

在我开始之前，需要说一下的是，为写这篇文章所做的所有工作都是在我的运行 Fedora 25 的个人笔记本电脑上完成的。我使用一张 microSD 插到 SD 适配器中，复制和编辑所有的 Fedora 镜像到 32GB 的 microSD 卡中，然后用它在一台三星电视上启动了树莓派 3。 因为 Fedora 25 尚不支持内置 Wi-Fi，所以树莓派 3 使用了以太网线缆进行网络连接。最后，我使用了 Logitech K410 无线键盘和触摸板进行输入。

如果你没有条件使用以太网线连接在你的树莓派上玩 Fedora 25，我曾经用过一个 Edimax Wi-Fi USB 适配器，它也可以在 Fedora 25 上工作，但在本文中，我只使用了以太网连接。

### 在树莓派上安装 Fedora 25 之前

阅读 Fedora 项目 wiki 上的[树莓派支持文档][7]。你可以从 wiki 下载 Fedora 25 安装所需的镜像，那里还列出了所有支持和不支持的内容。

此外，请注意，这是初始支持版本，还有许多新的工作和支持将随着 Fedora 26 的发布而出现，所以请随时报告 bug，并通过 [Bugzilla][8]、Fedora 的 [ARM 邮件列表][9]、或者 Freenode IRC 频道＃fedora-arm，分享你在树莓派上使用 Fedora 25 的体验反馈。

### 安装

我下载并安装了五个不同的 Fedora 25 spin：GNOME（默认工作站）、KDE、Minimal、LXDE 和 Xfce。在多数情况下，它们都有一致和易于遵循的步骤，以确保我的树莓派 3 上启动正常。有的 spin 有已知 bug 的正在解决之中，而有的按照 Fedora wik 遵循标准操作程序即可。

![GNOME on Raspberry Pi](https://opensource.com/sites/default/files/gnome_on_rpi.png "GNOME on Raspberry Pi") 

*树莓派 3 上的 Fedora 25 workstation、 GNOME 版本*

### 安装步骤

1、 在你的笔记本上，从支持文档页面的链接下载一个树莓派的 Fedora 25 镜像。

2、 在笔记本上，使用 `fedora-arm-installer` 或下述命令行将镜像复制到 microSD：

```
xzcat Fedora-Workstation-armhfp-25-1.3-sda.raw.xz | dd bs=4M status=progress of=/dev/mmcblk0
```

注意：`/dev/mmclk0` 是我的 microSD 插到 SD 适配器后，在我的笔记本电脑上挂载的设备名。虽然我在笔记本上使用 Fedora，可以使用 `fedora-arm-installer`，但我还是喜欢命令行。

3、 复制完镜像后，_先不要启动你的系统_。我知道你很想这么做，但你仍然需要进行几个调整。

4、 为了使镜像文件尽可能小以便下载，镜像上的根文件系统是很小的，因此你必须增加根文件系统的大小。如果你不这么做，你仍然可以启动你的派，但如果你一旦运行 `dnf update` 来升级你的系统，它就会填满文件系统，导致糟糕的事情发生，所以趁着 microSD 还在你的笔记本上进行分区：

```
growpart /dev/mmcblk0 4
resize2fs /dev/mmcblk0p4
```

注意：在 Fedora 中，`growpart` 命令由 `cloud-utils-growpart.noarch` 这个 RPM 提供的。

5、文件系统更新后，您需要将 `vc4` 模块列入黑名单。[更多有关此 bug 的信息在此。][10]

我建议在启动树莓派之前这样做，因为不同的 spin 有不同表现方式。例如，（至少对我来说）在没有黑名单 `vc4` 的情况下，GNOME 在我启动后首先出现，但在系统更新后，它不再出现。 KDE spin 则在第一次启动时根本不会出现 KDE。因此我们可能需要在我们的第一次启动之前将 `vc4` 加入黑名单，直到这个错误以后解决了。

黑名单应该出现在两个不同的地方。首先，在你的 microSD 根分区上，在 `etc/modprode.d/` 下创建一个 `vc4.conf`，内容是：`blacklist vc4`。第二，在你的 microSD 启动分区，添加 `rd.driver.blacklist=vc4` 到 `extlinux/extlinux.conf` 文件的末尾。

6、 现在，你可以启动你的树莓派了。

### 启动

你要有耐心，特别是对于 GNOME 和 KDE 发行版来说。在 SSD（固态驱动器）几乎即时启动的时代，你很容易就对派的启动速度感到不耐烦，特别是第一次启动时。在第一次启动 Window Manager 之前，会先弹出一个初始配置页面，可以配置 root 密码、常规用户、时区和网络。配置完毕后，你就应该能够 SSH 到你的树莓派上，方便地调试显示问题了。

### 系统更新

在树莓派上运行 Fedora 25 后，你最终（或立即）会想要更新系统。

首先，进行内核升级时，先熟悉你的 `/boot/extlinux/extlinux.conf` 文件。如果升级内核，下次启动时，除非手动选择正确的内核，否则很可能会启动进入救援（ Rescue ）模式。避免这种情况发生最好的方法是，在你的 `extlinux.conf` 中将定义 Rescue 镜像的那五行移动到文件的底部，这样最新的内核将在下次自动启动。你可以直接在派上或通过在笔记本挂载来编辑 `/boot/extlinux/extlinux.conf`：
```
label Fedora 25 Rescue fdcb76d0032447209f782a184f35eebc (4.9.9-200.fc25.armv7hl)
            kernel /vmlinuz-0-rescue-fdcb76d0032447209f782a184f35eebc
            append ro root=UUID=c19816a7-cbb8-4cbb-8608-7fec6d4994d0 rd.driver.blacklist=vc4
            fdtdir /dtb-4.9.9-200.fc25.armv7hl/
            initrd /initramfs-0-rescue-fdcb76d0032447209f782a184f35eebc.img
```

第二点，如果无论什么原因，如果你的显示器在升级后再次变暗，并且你确定已经将 `vc4` 加入黑名单，请运行 `lsmod | grep vc4`。你可以先启动到多用户模式而不是图形模式，并从命令行中运行 `startx`。 请阅读 `/etc/inittab` 中的内容，了解如何切换 target 的说明。

 ![KDE on Raspberry Pi 3](https://opensource.com/sites/default/files/kde_on_rpi.png "KDE on Raspberry Pi 3") 

*树莓派 3 上的 Fedora 25 workstation、 KDE 版本*

### Fedora Spin

在我尝试过的所有 Fedora Spin 中，唯一有问题的是 XFCE spin，我相信这是由于这个[已知的 bug][11] 导致的。

按照我在这里分享的步骤操作，GNOME、KDE、LXDE 和 minimal 都运行得很好。考虑到 KDE 和 GNOME 会占用更多资源，我会推荐想要在树莓派上使用 Fedora 25 的人使用 LXDE 和 Minimal。如果你是一位系统管理员，想要一台廉价的 SELinux 支持的服务器来满足你的安全考虑，而且只是想要使用树莓派作为你的服务器，开放 22 端口以及 vi 可用，那就用 Minimal 版本。对于开发人员或刚开始学习 Linux 的人来说，LXDE 可能是更好的方式，因为它可以快速方便地访问所有基于 GUI 的工具，如浏览器、IDE 和你可能需要的客户端。

 ![LXES on Raspberry Pi ](https://opensource.com/sites/default/files/lxde_on_rpi.png "LXDE on Raspberry Pi 3")

*树莓派 3 上的 Fedora 25 workstation、LXDE。*

看到越来越多的 Linux 发行版在基于 ARM 的树莓派上可用，那真是太棒了。对于其第一个支持的版本，Fedora 团队为日常 Linux 用户提供了更好的体验。我很期待 Fedora 26 的改进和 bug 修复。

--------------------------------------------------------------------------------

作者简介：

Anderson Silva - Anderson 于 1996 年开始使用 Linux。更精确地说是 Red Hat Linux。 2007 年，他作为 IT 部门的发布工程师时加入红帽，他的职业梦想成为了现实。此后，他在红帽担任过多个不同角色，从发布工程师到系统管理员、高级经理和信息系统工程师。他是一名 RHCE 和 RHCA 以及一名活跃的 Fedora 包维护者。

----------------

via: https://opensource.com/article/17/3/how-install-fedora-on-raspberry-pi

作者：[Anderson Silva][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

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
