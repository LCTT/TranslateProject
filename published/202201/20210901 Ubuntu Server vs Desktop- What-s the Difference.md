[#]: subject: "Ubuntu Server vs Desktop: What’s the Difference?"
[#]: via: "https://itsfoss.com/ubuntu-server-vs-desktop/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14146-1.html"

Ubuntu 服务器版与桌面版有什么区别？
======

![](https://img.linux.net.cn/data/attachment/album/202201/04/122152zdqkkqqqw6cgcdcq.jpg)

当你点击 [Ubuntu 网站][1] 上的下载按钮时，它会给你几个选项。其中两个分别是 Ubuntu 桌面版和 Ubuntu 服务器版。

这可能会让新用户感到困惑。为什么会有两个（实际上是四个）？应该下载哪一个？Ubuntu 桌面版还是服务器版？它们是一样的吗？有什么区别？

![Ubuntu 网站给了你多种选择][2]

我将解释 Ubuntu 的桌面版和服务器版的区别。我还会解释你应该使用哪个变体。

### Ubuntu 桌面版与 Ubuntu 服务器版

![Ubuntu 桌面版和服务器版][3]

要了解 Ubuntu 桌面版和服务器版的区别，你应该了解桌面操作系统和服务器操作系统的区别。

#### 桌面操作系统

<ruby>桌面电脑<rt>Desktop</rt></ruby>是指个人电脑（PC）。桌面电脑操作系统带有一个图形用户界面，以便用户可以使用鼠标和键盘操作。桌面电脑的主要目的是给你一个系统，可以用来浏览网页、编辑文档、查看/编辑图片和视频、编码和游戏。基本上，就是为个人、终端用户或家庭成员提供了一个通用的计算机。

我在这里使用桌面电脑这个术语，但这并不意味着它不能用于笔记本电脑。桌面电脑是个人电脑的通用术语。

#### 服务器操作系统

另一方面，服务器操作系统是专门为托管网站、应用程序、媒体服务器、数据库等网络服务而打造的。

通常情况下，服务器操作系统不带有图形界面。如果是基于 Linux 的操作系统，你就得通过终端的命令来使用该系统。

这里的好处是，服务器操作系统不需要（浪费）大量的内存和计算能力，因为它们不使用 [图形化桌面环境][4]。除此以外，服务器操作系统的软件包配置也不同。

现在你对服务器和桌面的区别有了一些了解，让我们看看 Ubuntu 服务器版和桌面版的区别。

#### 用户界面

Ubuntu 服务器版和桌面版之间最明显的区别是用户界面。

Ubuntu 桌面版的特点是采用 GNOME 桌面环境的图形化用户界面。这使得它在鼠标点击的帮助下更容易使用。

![图为 Ubuntu GNOME 版的用户界面][5]

Ubuntu 服务器版采用<ruby>无头方式<rt>headless</rt></ruby>运行。你只有在登录后才会看到一个终端界面。你经常会从其他电脑上通过 SSH 来远程管理它。

![通过 SSH 连接到远程 Ubuntu 服务器][6]

#### 安装

[由于有了图形化的安装程序，将 Ubuntu 作为桌面电脑是很容易的][7]。你可以创建一个<ruby>临场 USB<rt>Live USB</rt></ruby>，无需安装即可体验桌面版。如果你喜欢，你可以按照屏幕上的指示在几分钟内安装它。

![通过图形化安装程序安装 Ubuntu 桌面版][8]

将 Ubuntu 作为服务器安装并不像桌面版那样简单。你只能使用终端界面。如果你不熟悉这个流程，即使是最简单的任务，如连接到 Wi-Fi，也可能是一个困难的任务。

![Ubuntu 服务器版的安装][9]

#### 应用程序

在 Ubuntu 桌面版中，默认的应用程序集主要针对普通计算机用户。因此，你会发现网页浏览器、办公套件、媒体播放器、游戏等。

![Ubuntu 中的应用程序][10]

Ubuntu 服务器版的应用程序更多的是为运行网络服务而定制的。而这还不是全部。有些应用程序的配置也是不同的。以 SSH 为例。Ubuntu 服务器预设了 SSH，这样你就可以轻松地从远程系统连接到它。而在 Ubuntu 桌面版上，你必须明确启用 SSH 才行。

#### 硬件要求

由于桌面版具有图形用户界面，你需要至少 4GB 的内存来运行 Ubuntu 桌面版。磁盘空间至少要有 20GB。

这就是 Ubuntu 服务器的有趣之处。它没有图形化的界面。命令行界面不会消耗大量的系统资源。因此，你可以在 512MB 和 5GB 磁盘空间的机器上轻松运行 Ubuntu 服务器。（LCTT 译注：当然，对于服务器环境来说，内存和磁盘空间是多多益善。）

服务器上的内存和磁盘空间受制于你所运行的网络服务。如果一个网络应用需要至少 2GB 的内存，你就应该有这么多的内存。但在最简单的情况下，即使是 512MB 或 1GB 的内存也可以工作。

#### 用途

这是 Ubuntu 桌面版和服务器版之间的主要区别。问问自己，你想把 Ubuntu 用于什么目的？

如果是专门用于部署网络服务，那就选择 Ubuntu 服务器。请记住，你需要有基本的 Linux 命令行知识来使用终端。

如果你想把 Ubuntu 作为像 Windows 一样的普通电脑使用，那就选择 Ubuntu 桌面版。如果你想用它来学习 Linux 命令，或用于学习的 Docker 或者甚至是简单的（但是本地的）LAMP 服务器环境，请继续使用 Ubuntu 桌面。

对于服务器来说，Ubuntu 服务器版要比 Ubuntu 桌面版好。对于常规的计算机使用，Ubuntu 桌面版是更好的选择。

#### 你应该在服务器上使用 Ubuntu 桌面版还是在服务器上安装图形界面？

是这样的，Ubuntu 桌面版和服务器版都是 Linux，你可以用 Ubuntu 桌面版作为服务器来托管网页服务。这没问题。

同样地，[你可以在 Ubuntu 服务器上安装图形界面][11]，并以图形方式使用它。这也是可行的。

![Ubuntu 服务器上的 GUI 登录][12]

但仅仅因为它可行，并不意味着你应该这么做。它违背了为服务器和桌面电脑创建不同版本的全部目的。

你必须付出额外的努力来将服务器版转换为桌面版，反之亦然。为什么要承受这种痛苦呢？

如果你使用 Ubuntu 的目的很明确，那就下载并安装合适的 Ubuntu 版本。

我希望这能使围绕 Ubuntu 桌面版和服务器版的选择现在更清楚一些。如果你有问题或建议，请利用评论区。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-server-vs-desktop/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://ubuntu.com/
[2]: https://itsfoss.com/wp-content/uploads/2021/08/ubuntu-server-desktop-download-800x338.webp
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/ubuntu-desktop-server.png?resize=800%2C450&ssl=1
[4]: https://itsfoss.com/what-is-desktop-environment/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-gnome-desktop.png?resize=792%2C597&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/system-restart-required.png?resize=800%2C469&ssl=1
[7]: https://itsfoss.com/install-ubuntu/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/installing-ubuntu.png?resize=800%2C549&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/ubuntu-server-installation.png?resize=800%2C600&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/gnome-app-arranger.jpg?resize=799%2C450&ssl=1
[11]: https://itsfoss.com/install-gui-ubuntu-server/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/installing-gui-ubuntu-server-gnome-desktop-greet.png?resize=798%2C600&ssl=1
