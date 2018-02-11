迁移到 Linux ：入门介绍
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/migrating-to-linux.jpg?itok=sjcGK0SY)

> 这个新文章系列将帮你从其他操作系统迁移到 Linux。

运行 Linux 的计算机系统到遍布在每个角落。Linux 运行着从谷歌搜索到“脸书”等等各种互联网服务。Linux 也在很多设备上运行，包括我们的智能手机、电视，甚至汽车。当然，Linux 也可以运行在您的桌面系统上。如果您是 Linux 新手，或者您想在您的桌面计算机上尝试一些不同的东西，这篇文章将简要地介绍其基础知识，并帮助您从另一个系统迁移到 Linux。

切换到不同的操作系统可能是一个挑战，因为每个操作系统都提供了不同的操作方法。其在一个系统上的<ruby>习惯<rt>second nature</rt></ruby>可能会对另一个系统的使用形成阻挠，因此我们需要到网上或书本上查找怎样操作。

### Windows 与 Linux 的区别 

（LCTT 译注：本节标题 Vive la différence ，来自于法语，意即“差异万岁”——来自于 wiktionary）

要开始使用 Linux，您可能会注意到，Linux 的打包方式不同。在其他操作系统中，许多组件被捆绑在一起，只是该软件包的一部分。然而，在 Linux 中，每个组件都被分别调用。举个例子来说，在 Windows 下，图形界面只是操作系统的一部分。而在 Linux 下，您可以从多个图形环境中进行选择，比如 GNOME、KDE Plasma、Cinnamon 和 MATE 等。

从更高层面上看，一个 Linux 包括以下内容：

1. 内核
2. 驻留在磁盘上的系统程序和文件
3. 图形环境
4. 包管理器
5. 应用程序

### 内核

操作系统的核心称为<ruby>内核<rt>kernel</rt></ruby>。内核是引擎罩下的引擎。它允许多个应用程序同时运行，并协调它们对公共服务和设备的访问，从而使所有设备运行顺畅。

### 系统程序和文件

系统程序以标准的文件和目录的层次结构位于磁盘上。这些系统程序和文件包括后台运行的服务（称为<ruby>守护进程<rt>deamon</rt></ruby>）、用于各种操作的实用程序、配置文件和日志文件。

这些系统程序不是在内核中运行，而是执行基本系统操作的程序——例如，设置日期和时间，以及连接网络以便你可以上网。

这里包含了<ruby>初始化<rt>init</rt></ruby>程序——它是最初运行的程序。该程序负责启动所有后台服务（如 Web 服务器）、启动网络连接和启动图形环境。这个初始化程序将根据需要启动其它系统程序。

其他系统程序为简单的任务提供便利，比如添加用户和组、更改密码和配置磁盘。

### 图形环境

图形环境实际上只是更多的系统程序和文件。图形环境提供了常用的带有菜单的窗口、鼠标指针、对话框、状态和指示器等。

需要注意的是，您不是必须需要使用原本安装的图形环境。如果你愿意，你可以把它换成其它的。每个图形环境都有不同的特性。有些看起来更像 Apple OS X，有些看起来更像 Windows，有些则是独特的而不试图模仿其他的图形界面。

### 包管理器

对于来自不同操作系统的人来说，<ruby>包管理器<rt>package manager</rt></ruby>比较难以掌握，但是现在有一个人们非常熟悉的类似的系统——应用程序商店。软件包系统实际上就是 Linux 的应用程序商店。您可以使用包管理器来选择您想要的应用程序，而不是从一个网站安装这个应用程序，而从另一个网站来安装那个应用程序。然后，包管理器会从预先构建的开源应用程序的中心仓库安装应用程序。

### 应用程序

Linux 附带了许多预安装的应用程序。您可以从包管理器获得更多。许多应用程序相当棒，另外一些还需要改进。有时，同一个应用程序在 Windows 或 Mac OS 或 Linux 上运行的版本会不同。

例如，您可以使用 Firefox 浏览器和 Thunderbird (用于电子邮件)。您可以使用 LibreOffice 作为 Microsoft Office 的替代品，并通过 Valve 的 Steam 程序运行游戏。您甚至可以在 Linux 上使用 WINE 来运行一些 Windows 原生的应用程序。

### 安装 Linux

第一步通常是安装 Linux 发行版。你可能听说过 Red Hat、Ubuntu、Fedora、Arch Linux 和 SUSE，等等。这些都是 Linux 的不同发行版。

如果没有 Linux 发行版，则必须分别安装每个组件。许多组件是由不同人群开发和提供的，因此单独安装每个组件将是一项冗长而乏味的任务。幸运的是，构建发行版的人会为您做这项工作。他们抓取所有的组件，构建它们，确保它们可以在一起工作，然后将它们打包在一个单一的安装套件中。

各种发行版可能会做出不同的选择、使用不同的组件，但它仍然是 Linux。在一个发行版中开发的应用程序通常在其他发行版上运行的也很好。

如果你是一个 Linux 初学者，想尝试 Linux，我推荐[安装 Ubuntu][1]。还有其他的发行版也可以尝试: Linux Mint、Fedora、Debian、Zorin OS、Elementary OS 等等。在以后的文章中，我们将介绍 Linux 系统的其他方面，并提供关于如何开始使用 Linux 的更多信息。


--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2017/10/migrating-linux-introduction

作者：[John Bonesio][a]
译者：[stevenzdg988](https://github.com/stevenzdg988)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/johnbonesio
[1]:https://www.ubuntu.com/download/desktop
[2]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
