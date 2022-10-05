[#]: subject: "Rufus for Linux? Here Are the Best Live USB Creating Tools"
[#]: via: "https://itsfoss.com/live-usb-creator-linux/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "alfred-hong"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15052-1.html"

U 盘启动盘创建工具 Rufus 在 Linux 上不能使用？这里有 6 个替代品
======

![](https://img.linux.net.cn/data/attachment/album/202209/20/232656q7qc9vc9r6hn6bz9.jpg)

Rufus 一个用来创建启动盘的开源工具。它可以按照你的需求进行调整，用起来很简单。不仅用起来很方便，而且制作启动盘的速度也出奇的快。

遗憾的是，Rufus 不能在 Linux 上使用，它只能在 Windows 上使用。因此大多数在 Windows 上使用过 Rufus 的人，都会在 Linux 上寻找替代软件。

如果你也是这样，不用着急，我们有一些优秀的替代软件，可以满足不同的使用条件。

我们来看看一些关于 Rufus 的替代软件：

### 6 款最佳的 Linux 启动盘创建工具

列出的所有替代软件都是开源的，并且在 Linux 发行版运行很好。

**注意：** *下列软件无任何特定排序*

#### 1、balenaEtcher

![balena etcher 2022][1]

balenaEtcher（或 Etcher）对于多平台（Windows、 MacOS）用户是一个很好的选择，也包括 Linux 用户。

此软件没有任何高级选项。因此十分容易使用。只需要选择 ISO（镜像文件），然后选中目标 U 盘进行写入即可。

它是完全开源的，并在写入完成后检验你的 U 盘。此外，它还自动选择你插入的 U 盘，以避免你不小心选择了硬盘进行格式化。

你可以参考这本 [便捷手册][2] 来在 Linux 上安装它。

> **[balenaEtcher][3]**

#### 2、Fedora Media Writer

![fedora media writer][4]

Fedora Media Writer 是专门用来帮助用户创建 Fedora Linux 启动盘的软件。如果你还没有 ISO 文件，它还能为你下载 ISO。

当其它的 U 盘启动盘创建软件导致你不能格式化你的 U 盘时，它也是一个优秀的 U 盘启动盘修复程序。

不用担心，你也可以选择 Fedora Linux 之外的其他镜像来创建启动盘。

你可以在 Flathub 找到任何 Linux 发行版可用的最新的 [Flatpak][5] 软件包。如果你是新手请参考这篇 [Flatpak 指导][6]

> **[Fedora Media Writer][7]**

#### 3、Startup Disk Creator

![startup disk creator][8]

如果你使用的是 Ubuntu 系统，在系统上已经预装了一个 U 盘启动盘制作软件，即 Startup Disk Creator。

你可以用它选择任何需要的 ISO 文件（最好是 Ubuntu 的任何版本），并选择 USB 设备进行下一步。

当你确认操作后，它就会写入数据来完成制作启动盘。

#### 4、SUSE Studio Imagewriter

![imagewriter suse][9]

SUSE Studio Imagewriter 是一个简单的启动盘制作软件。

我没有在 Ubuntu 软件中心找到它，但是在 Manjaro 的社区仓库和 AUR 中可以找到。如果它可以适配你的 Linux 发行版，你可以试试它。

> **[SUSE Studio Imagewriter][10]**

#### 5、UNetbootin

![unetbootin][11]

UNetbootin 是一个支持 Linux、Windows 和 macOS 的 U 盘启动制作软件。有少量的几个可以调整的选项，比如你可以查看所有可用的驱动器，还可以选择一个发行版来自动下载 ISO 文件。

它与上面的软件不同，它并不是指定用在某些 Linux 发行版。因此，它支持各种各种各样的发行版和系统程序。

> **[UNetbootin][12]**

#### 6、Ventoy

![ventoy screenshot 2022][13]

Ventoy 是一个有趣的 USB 启动盘解决方案，你只需要复制粘贴镜像文件到 U 盘即可。

你仅仅需要在 U 盘上安装 Venoy，它会在其上建立两个分区。其中一个用来存储 ISO 镜像，你只需要将镜像文件粘贴到 U 盘即制作成功。

有趣的是你还可以使用它来 [引导多个系统][14]。

它可在 Windows 和 Linux 上使用。

> **[Ventoy][15]**

### 总结

如果你需要在 U 盘上放多个 Linux 发行版而不是反复格式化它，Ventoy 似乎是上面所有选项中最好的选择。

为了简单起见，特定于发行版的工具是个很好的选择，例如：Ubuntu 的 Startup Disk Creator 和 Fedora 的 Fedora Media Writer。

SUSE Studio Imagewriter 也不错，但可不能不是最方便的。

如果你没有任何特定的偏好，balenaEtcher 应该是最直接的选择，UNetbootin 是它的一个合适的替代软件。

你最偏爱哪个 U 盘启动盘创建软件？在下面的评论区中让我了解你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/live-usb-creator-linux/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[alfred-hong](https://github.com/alfred-hong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/06/balena-etcher-2022-800x537.png
[2]: https://itsfoss.com/install-etcher-linux/
[3]: https://www.balena.io/etcher/
[4]: https://itsfoss.com/wp-content/uploads/2022/06/fedora-media-writer.png
[5]: https://itsfoss.com/what-is-flatpak/
[6]: https://itsfoss.com/flatpak-guide/
[7]: https://flathub.org/apps/details/org.fedoraproject.MediaWriter
[8]: https://itsfoss.com/wp-content/uploads/2022/06/startup-disk-creator.png
[9]: https://itsfoss.com/wp-content/uploads/2022/06/imagewriter-suse.png
[10]: https://software.opensuse.org/package/imagewriter
[11]: https://itsfoss.com/wp-content/uploads/2022/06/unetbootin.png
[12]: https://unetbootin.github.io/
[13]: https://itsfoss.com/wp-content/uploads/2022/06/ventoy-screenshot-2022.png
[14]: https://itsfoss.com/multiple-linux-one-usb/
[15]: https://www.ventoy.net/
