Ubuntu Linux 的不同安装类型：服务器 vs 桌面
============================================================

> 内核是任何 Linux 机器的核心

之前我已经讲了获取与安装 Ubuntu Linux，这次我将讲桌面和服务器的安装。两类安装都满足某些需求。不同的安装包是从 Ubuntu 分开下载的。你可以从 [Ubuntu.com/downloads][1] 选择你需要的。

无论安装类型如何，都有一些相似之处。

![](http://www.radiomagonline.com/Portals/0/radio-managing-tech-Ubuntu_1.jpg)

*可以从桌面系统图形用户界面或从服务器系统命令行添加安装包。*

两者都使用相同的内核和包管理器系统。软件包管理器系统是预编译为可在几乎任何 Ubuntu 系统运行的程序的仓库。程序分组成包，然后以安装包进行安装。安装包可以从桌面系统图形用户界面或从服务器系统命令行添加。

程序安装使用一个名为 `apt-get` 的程序。这是一个包管理器系统或程序管理器系统。最终用户只需输入命令行 `apt-get install (package-name)`，Ubuntu 就会自动获取软件包并进行安装。

软件包通常安装可以通过手册页访问的文档的命令（这本身就是一个主题）。它们可以通过输入 `man (command)` 来访问。这将打开一个描述该命令详细用法的页面。终端用户还可以 Google 任何的 Linux 命令或安装包，并找到大量关于它的信息。

例如，在安装网络连接存储套件后，可以通过命令行、GUI 或使用名为 Webmin 的程序进行管理。Webmin 安装了一个基于 Web 的管理界面，用于配置大多数 Linux 软件包，它受到了仅安装服务器版本的人群的欢迎，因为它安装为网页，不需要 GUI。它还允许远程管理服务器。

大多数（如果不是全部）基于 Linux 的软件包都有专门帮助你如何运行该软件包的视频和网页。只需在 YouTube 上搜索 “Linux Ubuntu NAS”，你就会找到一个指导你如何设置和配置此服务的视频。还有专门指导 Webmin 的设置和操作的视频。

内核是任何 Linux 安装的核心。由于内核是模块化的，它是非常小的（顾名思义）。我在一个 32MB 的小型闪存上运行 Linux 服务器。我没有打错 - 32MB 的空间！Linux 系统使用的大部分空间都是由安装的软件包使用的。


**服务器**

服务器安装 ISO 镜像是 Ubuntu 提供的最小的下载。它是针对服务器操作优化的操作系统的精简版本。此版本没有 GUI。默认情况下，它完全从命令行运行。

移除 GUI 和其他组件可简化系统并最大限度地提高性能。最初没有安装的必要软件包可以稍后通过命令行程序包管理器添加。由于没有 GUI，因此必须从命令行完成所有配置、故障排除和包管理。许多管理员将使用服务器安装来获取一个干净或最小的系统，然后只添加他们需要的某些包。这包括添加桌面 GUI 系统并制作精简桌面系统。

广播电台可以使用 Linux 服务器作为 Apache Web 服务器或数据库服务器。这些是真实需要消耗处理能力的程序，这就是为什么它们通常使用服务器形式安装以及没有 GUI 的原因。SNORT 和 Cacti 是可以在你的 Linux 服务器上运行的其他程序（这两个应用程序都在上一篇文章中介绍，可以在这里找到：[_http://tinyurl.com/yd8dyegu_][2]）。


**桌面**

桌面安装 ISO 镜像相当大，并且有多个在服务器安装 ISO 镜像上没有的软件包。此安装用于工作站或日常桌面使用。此安装类型允许自定义安装包（程序），或者可以选择默认的桌面配置。

![](http://www.radiomagonline.com/Portals/0/radio-managing-tech-Ubuntu_2.jpg)

*桌面安装 ISO 镜像相当大，并且有多个在服务器安装 ISO 镜像上没有的软件包。此安装包专为工作站或日常桌面使用设计。*

软件包通过 apt-get 包管理器系统安装，就像服务器安装一样。两者之间的区别在于，在桌面安装中，apt-get 包管理器具有不错的 GUI 前端。这允许通过点击鼠标轻松地从系统安装或删除软件包！桌面安装将设置一个 GUI 以及许多与桌面操作系统相关的软件包。

![](http://www.radiomagonline.com/Portals/0/radio-managing-tech-Ubuntu_3.jpg)

*通过 apt-get 包管理器系统安装软件包，就像服务器安装一样。两者之间的区别在于，在桌面安装中，apt-get 包管理器具有不错的 GUI 前端。**

这个系统安装后随时可用，可以很好的替代你的 Windows 或 Mac 台式机。它有很多包，包括 Office 套件和 Web 浏览器。

Linux 是一个成熟而强大的操作系统。无论哪种安装类型，它都可以配置为适合几乎所有需要。从功能强大的数据库服务器到用于网页浏览和写信给奶奶的基本台式机操作系统，天空有极限，而可用的安装包几乎是不竭的。如果你遇到一个需要计算机化解决方案的问题，Linux 可能会提供免费或低成本的软件来解决该问题。

通过提供两个安装版本，Ubuntu 做得很好，这让人们开始朝着正确的方向前进。

*Cottingham 是前无线电总工程师，现在从事流媒体工作。*


--------------------------------------------------------------------------------

via: http://www.radiomagonline.com/deep-dig/0005/linux-installation-types-server-vs-desktop/39123

作者：[Chris Cottingham][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.radiomagonline.com/author/chris-cottingham
[1]:https://www.ubuntu.com/download
[2]:http://tinyurl.com/yd8dyegu
[3]:http://www.radiomagonline.com/author/chris-cottingham
