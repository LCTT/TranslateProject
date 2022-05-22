[#]: subject: (GNOME’s Very Own “GNOME OS” is Not a Linux Distro for Everyone [Review])
[#]: via: (https://itsfoss.com/gnome-os/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13287-1.html)

GNOME OS：一个并不是适合所有人的 Linux 发行版
======

![](https://img.linux.net.cn/data/attachment/album/202104/11/103205t34lcaa3t0a3xjjw.jpg)

每当 GNOME 的一个重要版本到来时，总是很想尽快试用它。但是，要想第一时间进行测试，主要还是得依靠 [Fedora Rawhide][1] 开发分支。

然而，开发分支并不总是让人放心的，所以，用来尝试最新的 GNOME 并不是最方便的解决方案。这里，我所说的测试，并不仅仅是指用户的测试，同时也能够用于开发者对设计变更进行测试。

所以，最近来了个大救星 GNOME OS，让测试的过程变得轻松起来。但是，它到底是什么，怎么安装呢？让我们一起来看看吧。

### 什么是 GNOME OS？

GNOME OS 并不是一个独立完整的 Linux 发行版。事实上，它根本不基于任何东西。它是一个不完整的参考系统，只是为了让 GNOME 桌面工作。它仅仅是一个可启动的虚拟机镜像，在 GNOME 进入任何发行版的仓库之前，为调试和测试功能而量身定做的。

在 GNOME 的博客中，有一篇提到了它：

> GNOME OS 旨在通过提供一个用于开发、设计和用户测试的工作系统，来更好地促进 GNOME 的开发。

如果你好奇的话，你可以看看 GNOME 星球上的一篇 [博客文章][2] 来了解关于 GNOME OS 的更多信息。

### 如果它不是一个成熟的 Linux 发行版，那么它是用来干什么的？

![][3]

值得注意的是，每一次新的提交都可以创建一个新的 GNOME OS 镜像，所以它应该会使测试过程变得高效，并帮助你在开发周期的早期测试并发现问题。

不要忘了，设计者不再需要自己构建软件来测试 GNOME Shell 或任何其他核心模块。这为他们节省了时间和整个 GNOME 开发周期。

当然，不仅限于开发者和技术测试人员，它还可以让记者们拿到最新的和最棒的东西，来报道 GNOME 下一个版本或它是如何成型的。

媒体和 GNOME 团队也得到了一个很好的机会，借助于 GNOME OS，他们可以准备视频、图片两种形式的视觉资料来宣传此次发布。

### 如何安装 GNOME OS？

要轻松安装 GNOME OS，你需要先安装 GNOME Boxes 应用程序。

#### 安装 GNOME Boxes

Boxes 是一款简单的虚拟化软件，它不提供任何高级选项，但可以让你轻松安装操作系统镜像来快速测试。它是专门针对桌面终端用户的，所以使用起来也很方便。

要在任何 Linux 发行版上安装它，你可以利用 [Flathub][5] 的 [Flatpak][4] 包。如果你不知道 Flatpak，你可能需要阅读我们的《[在 Linux 中安装和使用 Flatpak][6]》指南。

你也可以在任何基于 Ubuntu 的发行版上直接在终端上输入以下内容进行安装：

```
sudo apt install gnome-boxes
```

一旦你安装了 Boxes，从这里安装 GNOME OS 就相当容易了。

#### 安装 GNOME OS

安装好 Boxes 后，你需要启动程序。接下来，点击窗口左上角的 “+” 标志，然后点击 “操作系统下载”，如下图所示。

![][7]

这个选项可以让你直接下载镜像文件，然后就可以继续安装它。

你所需要做的就是搜索 “GNOME”，然后你应该会找到可用的每夜构建版。这可以确保你正在尝试最新和最优秀的 GNOME 开发版本。

另外，你也可以前往 [GNOME OS 每夜构建网站][8] 下载系统镜像，然后在 Boxes 应用中选择 “运行系统镜像文件” 选择该 ISO，如上图截图所示，继续安装。

![][9]

考虑到你没有单独下载镜像。当你点击后，应该会开始下载，并且会出现一个进度条。

![][10]

完成后，如果需要，它会要求你自定义配置，让你创建虚拟机，如下图所示。

![][11]

你可以根据你可用的系统资源来定制资源分配，但应该可以使用默认设置。

点击 “创建”，就会直接开始 GNOME OS 的安装。

![][12]

选择“使用现有的版本”，然后继续。接下来，你必须选择磁盘（保持原样），然后同意擦除你所有的文件和应用程序（它不会删除本地计算机上的任何东西）。

![][13]

现在，它将简单地重新格式化并安装它。然后就完成了。它会提示你重启，重启后，你会发现 GNOME OS 已经安装好了。

它会像其他 Linux 发行版一样简单地启动，并要求你设置一些东西，包括用户名和密码。然后，你就可以开始探索了。

如果你想知道它的样子，它基本上就是最新的 GNOME 桌面环境。在 GNOME 40 正式发布之前，我用 GNOME OS 做了一个 GNOME 40 的概述视频。

### 结束语

GNOME OS 绝对是对开发者、设计师和媒体有用的东西。它可以让你轻松地测试最新的 GNOME 开发版本，而无需投入大量的时间。

我可以很快地测试 [GNOME 40][14]，就是因为这个。当然，你要记住，这并不是一个可以在物理设备上安装的完整功能的操作系统。他们有计划让它可以在物理机器上运行，但就目前而言，它只是为虚拟机量身定做的，尤其是使用 GNOME Boxes。

GNOME Boxes 并没有提供任何高级选项，所以设置和使用它变得相当容易。如果体验太慢的话，你可能要调整一下资源，但在我的情况下，总体来说是一个不错的体验。

你试过 GNOME OS 了吗？欢迎在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-os/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://fedoraproject.org/wiki/Releases/Rawhide
[2]: https://blogs.gnome.org/alatiera/2020/10/07/what-is-gnome-os/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/GNOME-OS-distro-review.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/what-is-flatpak/
[5]: https://flathub.org/apps/details/org.gnome.Boxes
[6]: https://itsfoss.com/flatpak-guide/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-os-search.jpg?resize=800%2C729&ssl=1
[8]: https://os.gnome.org/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-os-boxes.jpg?resize=800%2C694&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-os-download.jpg?resize=798%2C360&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-boxes-vm-setup.png?resize=800%2C301&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-nightly-install.jpg?resize=800%2C636&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/gnome-os-installation.jpg?resize=800%2C619&ssl=1
[14]: https://news.itsfoss.com/gnome-40-release/
