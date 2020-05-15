[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12220-1.html)
[#]: subject: (Can’t Install Deb File on Ubuntu 20.04? Here’s What You Need to do!)
[#]: via: (https://itsfoss.com/cant-install-deb-file-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

无法在 Ubuntu 20.04 上安装 Deb 文件？这是你需要做的！
======

> 双击 deb 文件后无法通过 Ubuntu 20.04 的软件中心安装？你不是唯一遇到此问题的人。本教程展示了解决方法。

![](https://img.linux.net.cn/data/attachment/album/202005/15/112149cfdyg556upv6vd66.jpg)

在“[安装 Ubuntu 20.04 之后要做的事][1]”一文中，一些读者提到他们[用 Deb 文件安装软件][2]遇到了麻烦。

我发现这很奇怪，因为使用 deb 文件安装程序是最简单的方法之一。你要做的就是双击下载的文件，它会在软件中心中打开（默认情况下）。单击安装，它要求你输入密码，并在几秒钟/分钟内安装了该软件。

我[从 19.10 升级到 Ubuntu 20.04][3]直到今天都没有遇到这个问题。

我下载了 .deb 文件来安装 [Rocket Chat Messenger][4]，然后双击该文件安装时，文件用存档管理器打开。这不是我所期望的。

![DEB files opened with Archive Manager instead of Software Center][5]

“修复”很简单，我将在本教程中向你展示。

### 在 Ubuntu 20.04 中安装 deb 文件

由于某些原因，在 Ubuntu 20.04 中 deb 文件的默认打开程序被设置为存档管理器。存档管理器是用于[解压 zip][6] 和其他压缩文件。

解决此问题的方法非常简单。[在 Ubuntu 中更改默认应用][7]，将打开 DEB 文件从“存档管理器”改到“软件安装”。让我告诉你步骤。

**步骤 1：**右键单击下载的 .deb 文件，然后选择**属性**：

![][8]

**步骤 2：**进入“**打开方式**”标签，选择“**软件安装**”，然后点击“**设置为默认**”。

![][9]

这样，以后所有的 .deb 文件都将通过“软件安装”即软件中心打开。

双击 .deb 文件确认，看看是否在软件中心中打开。

### 忽视的 bug 还是愚蠢的功能？

为什么会用存档管理器打开 deb 文件让人无法理解。我确实希望这是一个 bug，而不是像[在 Ubuntu 20.04 中不允许在桌面上拖放文件][10]这样的怪异功能。

既然我们在讨论 deb 文件的安装，就让我告诉你一个不错的工具 [gdebi][11]。它是一个轻量级应用，其唯一目的是安装 DEB 文件。有时它也可以处理依赖关系。

你可以了解更多有关[使用 gdebi 并默认设为安装 deb 文件的工具][12]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/cant-install-deb-file-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-12183-1.html
[2]: https://itsfoss.com/install-deb-files-ubuntu/
[3]: https://itsfoss.com/upgrade-ubuntu-version/
[4]: https://rocket.chat/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/error-opening-deb-file.png?ssl=1
[6]: https://itsfoss.com/unzip-linux/
[7]: https://itsfoss.com/change-default-applications-ubuntu/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/open-deb-files.png?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/deb-file-install-fix-ubuntu.png?fit=800%2C454&ssl=1
[10]: https://itsfoss.com/add-files-on-desktop-ubuntu/
[11]: https://launchpad.net/gdebi
[12]: https://itsfoss.com/gdebi-default-ubuntu-software-center/
