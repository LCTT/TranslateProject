迁移到 Linux 之安装软件
=====

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/birds-1835510_1920.jpg?itok=8i6mBStG)
你看到的所有有关 Linux 的关注，以及它在互联网，以及 Arduino, Beagle 和 Raspberry Pi boards（树莓派板）等设备上的使用，或许你正在考虑是时候尝试一下 Linux 了。本系列将帮助你成功过渡到 Linux。如果你错过了本系列的早期文章，可以在这里找到它们：

[Part 1 - 介绍][1]

[Part 2 - 磁盘、文件和文件系统][2]

[Part 3 - 图形界面][3]

[Part 4 - 命令行][4]

[Part 5 - 使用 sudo][5]

### 安装软件

要在你的计算机上获得新软件，通常的方法是从供应商处获得软件产品，然后运行一个安装程序。过去，软件产品会像 CD-ROM 或 DVD 一样出现在物理媒介上。而现在我们经常从网上下载软件产品。

使用 Linux，安装软件就像在你的智能手机上安装一样。就像去你的手机应用商店一样，在 Linux 上有个开源软件工具和程序的中央仓库，几乎任何你可能想要的程序都会在你可安装的可用软件包列表中。

没有为每个程序运行的单独安装程序。相反，你可以使用 Linux 发行版附带的软件包管理工具。（请记住，Linux 发行版是你安装的 Linux，例如 Ubuntu, Fedora, Debian 等）每个发行版在 Internet 上都有自己的集中位置（称为仓库），用于存储数千个预先安装的应用程序。

你可能会注意到，在 Linux 上安装软件有几个例外。有时候，你仍然需要去供应商处获取他们的软件，因为该程序不存在于你发行版的中央仓库中。当软件不是开源和/或免费（自由）的时候，通常就是这种情况。

另外请记住，如果你最终想要安装一个不在发行版仓库中的程序，事情就不是那么简单了，即使你正在安装免费（自由）和开源程序。这篇文章没有涉及到这些更复杂的情况，最好遵循在线引导。

有了所有的 Linux 包管理系统和工具，接下来干什么可能仍然令人困惑。本文应该有助于澄清一些事情。

### 包管理

一些用于管理、安装和删除软件的包管理系统在 Linux 发行版中竞争。那个发行版背后的人都选择一个包管理系统来使用。Red Hat, Fedora, CentOS, Scientific Linux, SUSE 等使用 Red Hat 包管理（RPM）。Debian, Ubuntu, Linux Mint 等等都使用 Debian 包管理系统，简称 DPKG。其他包管理系统也存在，但 RPM 和 DPKG 是最常见的。

![](https://www.linux.com/sites/lcom/files/styles/floated_images/public/package-installer.png?itok=V9OU1Q0u)
图 1: Package installers

无论你使用的软件包管理是什么，它们通常都附带一组工具，它们是分层的（图 1）。最底层是一个命令行工具，它可以让你做任何事情以及与安装软件相关的一切。你可以列出已安装的程序，删除程序，安装软件包文件等等。

这个底层工具并不总是最方便使用的，所以通常会有一个命令行工具，它可以在发行版的中央仓库中找到软件包，并使用单个命令下载和安装它以及任何依赖项。最后，通常会有一个图形应用程序，让你使用鼠标选择任何想要的内容，然后单击 “install” 按钮。
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/package-kit.png?itok=YimOq2Je)
图 2: PackageKit

对于基于 Red Hat 的发行版，包括 Fedora, CentOS, Scientific Linux 等。它们的底层工具是 rpm，高级工具叫做 dnf（在旧系统上是 yum）。图形安装程序称为 PackageKit（图 2），它可能在系统管理下显示为 “Add/Remove Software（添加/删除软件）”。 
![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ubuntu-software.png?itok=5QSctLEW)
图 3: Ubuntu Software

对于基于 Debian 的发行版，包括 Debian, Ubuntu, Linux Mint, Elementary OS 等。它们的底层命令行工具是 dpkg，高级工具称为 apt。在 Ubuntu 上管理已安装软件的图形工具是 Ubuntu Software（图 3）。对于 Debian 和 Linux Mint，图形工具称为 Synaptic，它也可以安装在 Ubuntu 上。

你也可以在 Debian 相关发行版上安装基于文本的图形工具 aptitude。它比 Synaptic（新立得）更强大，并且即使你只能访问命令行也能工作。如果你想获得所有花里胡哨的东西，（to 校正者：这句话仔细考虑一下）你可以试试那个，尽管有更多的选择，但使用起来比 Synaptic（新立得）更复杂。其他发行版可能有自己独特的工具。

### 命令行工具

在 Linux 上安装软件的在线说明通常描述在命令行中键入的命令。这些指令通常更容易理解，并且可以在不出错的情况下，将命令复制粘贴到命令行窗口中。这与下面的说明相反：“打开这个菜单，选择这个程序，输入这个搜索模式，点击这个标签，选择这个程序，然后点击这个按钮”，这经常在翻译中丢失。

有时你正在使用的 Linux 没有图形环境，因此熟悉从命令行安装软件包是件好事。表 1 和表 2 列出了基于 RPM 和 DPKG 系统的一下常见操作及其相关命令。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/table_1_0.png?itok=hQ_o5Oh2)

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/table_2.png?itok=yl3UPQDw)

请注意 SUSE，它像 RedHat 和 Fedora 一样使用 RPM，却没有 dnf 或 yum。相反，它使用一个名为 zypper 的程序作为高级命令行工具。其他发行版也可能有不同的工具，例如 Arch Linux 上的 pacman 或 Gentoo 上的 emerge。有很多包工具，所以你可能需要查找哪个适用于你的发行版。

这些技巧应该能让你更好地了解如何在新的 Linux 中安装程序，以及更好地了解 Linux 中各种软件包方法如何相互关联。

通过 Linux 基金会和 edX 的免费 [“Linux 入门”][6]课程了解有关 Linux 的更多信息。


--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/3/migrating-linux-installing-software

作者：[JOHN BONESIO][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/johnbonesio
[1]:https://www.linux.com/blog/learn/intro-to-linux/2017/10/migrating-linux-introduction
[2]:https://www.linux.com/blog/learn/intro-to-linux/2017/11/migrating-linux-disks-files-and-filesystems
[3]:https://www.linux.com/blog/learn/2017/12/migrating-linux-graphical-environments
[4]:https://www.linux.com/blog/learn/2018/1/migrating-linux-command-line
[5]:https://www.linux.com/blog/learn/2018/3/migrating-linux-using-sudo
[6]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
