[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12353-1.html)
[#]: subject: (Using the Lightweight Apt Package Manager Synaptic in Ubuntu and Other Debian-based Linux Distributions)
[#]: via: (https://itsfoss.com/synaptic-package-manager/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 Ubuntu 中使用轻量的 Apt 软件包管理器 Synaptic
======

![](https://img.linux.net.cn/data/attachment/album/202006/26/220622uh75qnmmzgh58lpv.jpg)

这周推荐的开源软件是 Synaptic。学习这个经过时光积淀的软件包管理器能做哪些现代软件管理器做不到的事情。

### Synaptic 软件包管理器是什么？

[Synaptic][1] 是一个轻量级的 [apt 软件包管理器系统][2]的 GUI 前端，使用在 Debian、Ubuntu、Linux Mint 以及其它很多基于 Debian/Ubuntu 发行版中。

总的来说，所有你可以 [在终端中使用 apt-get 命令][3] 来做的事，都可以通过 Synaptic 来实现。

![][4]

曾几何时，Synaptic 几乎是所有基于 Debian Linux 发行版的默认图形化软件包管理器。它被认为是一种用户友好的、易于使用的管理应用程序的方法。

随着像 [GNOME “软件”][5] 和 [KDE “发现”][6] 等现代软件包管理器工具带来更现代和直观的图形用户界面，事情发生了变化。这些软件包管理器有更好的界面，以一种更友好的方式显示软件包信息，带有缩略图、评分和评论。

最后，Synaptic [的使用被局限于在大多数的轻量级 Linux 发行版][7] 中。

#### 为什么你要使用像 Synaptic 软件包管理器这样的 “古老的” 软件?

当然，在多大数的情况下，你没有必要这样做。

但是，Synaptic 仍然比 GNOME “软件” 的功能要很多。记住，它基本上是 `apt` 的 GUI 前端，这意味着它（几乎）可以做任何你能够 [在终端中使用 apt 命令][8] 所做的事。

例如，如果你想 [在 Ubuntu 中阻止特定的软件包更新][9]，你可以在 Synaptic 中做到这一点，但是你却不能 GNOME/Ubuntu 的软件中心中实现。

![][10]

另外，我注意到 Ubuntu 20.04 的软件中心存在一些问题。它加载速度缓慢，它搜索软件包时缓慢，并且它充满了 snap 应用程序（不是每个人都喜欢）。

Synaptic 也是 [Ubuntu 中一个轻量级应用程序][7]，使用可以可以让你感觉你的系统快一点。

#### Synaptic 软件包管理器的功能

下面是对 Synaptic 的概况：

  * 更新软件包缓存
  * 升级整个系统
  * 管理软件包包存储库
  * 通过名称、描述、维护者、版本、依赖项等搜索软件包
  * 通过组、状态（安装与否）、源或更多信息列出软件包
  * 通过名称、状态、大小或版本排序软件包
  * 获取与软件包相关的信息
  * 锁定软件包版本
  * 安装指定版本的软件包

还有很多功能，大家可以自己去探索。

### 如何在 Ubuntu 上安装 Synaptic 软件包管理器 

Synaptic 软件包管理器可在 Ubuntu 的 Universe 存储库中获得。如果 Universe 存储库未启用，你可以在软件中心中找到Synaptic：

![Synaptic 在 Ubuntu 软件中心][11]

你也可以通过命令行来安装 Synaptic 。先确保启用 universe 存储库：

```
sudo add-apt-repository univers
```

然后更新缓存（在 Ubuntu 18.04 及更高版本中不需要）：

```
sudo apt update
```

现在，使用下面的命令来安装 synaptic 软件包管理器：

```
sudo apt install synaptic
```

这就是所有的安装过程。

### 如何使用 Synaptic 软件包管理器

在安装后，你可以在菜单中开始搜索 Synaptic 并启动它：

![][12]

可以看到，这个界面不是最好看的界面之一。注意复选框的颜色。白色意味着软件包未安装，绿色意味软件包已安装。

![][4]

你可以搜索一个应用程序并单击复选框将标记其为安装。它也将（以绿色的形式）高亮将被作为依赖关系项目的软件包。单击应用来安装选择的软件包：

![][13]

你可以使用 Synaptic [查看在  Ubuntu 中安装的所有软件包][14] 。你也可以从这个视图中选择移除软件包。

![][15]

你可以根据源显示各个存储库中可用的软件包。这是查看 [哪个 PPA 提供什么软件包][16]的好方法。你可以通过如上所述的方法来安装或移除软件包。

![][17]

通常，当你更新 Ubuntu 时，所有的软件包都会同时更新。使用 Synaptic，你可以轻松地选择你需要更新/升级到较新版本的软件包。

![][18]

你也可以锁定软件包的版本，以便它们就不会随着系统更新而被更新。

![][10]

你也可以使用 Synaptic 搜索软件包。这类似于 [使用 apt-cache search 命令搜索软件包][19]。

![][20]

如果你认为你做了错误的选择，你可以从“编辑”菜单中单击撤销。

你可以使用 Synaptic 做很多事，我无法涵盖所有可能的用法。我在这里已经涵盖了最常见的一些方法，如果你将要去使用 Synaptic 的话，我留给你去探索。

### Synaptic 并不适合所有的人

如果你不喜欢 Synaptic，你可以在软件中心中移除它，或在终端中使用这个命令：

```
sudo apt remove synaptic
```

Ubuntu 还有另一个被称为 [AppGrid][21] 的轻量级软件包管理器。据我所知，它已经有一段时间没有更新了。

Synaptic 当然并不适合所有的人。它列出了你在常规软件中心中看不到的库和包。如果你移除了一个你不知道的库，那么它可能会引起问题。

我认为 Synaptic 更适合于中高级用户，他们既想更好地控制软件包管理器又不想使用命令行方法。

你有什么要说的吗？你使用过 Synaptic 软件包管理器吗？你是使用软件中心还是你只在终端中探索？请在评论区中分享你的喜好。

--------------------------------------------------------------------------------

via: https://itsfoss.com/synaptic-package-manager/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.comrobsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.nongnu.org/synaptic/
[2]: https://en.wikipedia.org/wiki/APT_(software)
[3]: https://itsfoss.com/apt-get-linux-guide/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/synaptic-interface.png?ssl=1
[5]: https://wiki.gnome.org/Apps/Software
[6]: https://userbase.kde.org/Discover
[7]: https://itsfoss.com/lightweight-alternative-applications-ubuntu/
[8]: https://itsfoss.com/apt-command-guide/
[9]: https://itsfoss.com/prevent-package-update-ubuntu/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/lock-version-synaptic.png?ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/synaptic-ubuntu-software-center.png?ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/synaptic-package-manager-ubuntu.jpg?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/install-packages-in-synaptic.png?ssl=1
[14]: https://itsfoss.com/list-installed-packages-ubuntu/
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/remove-packages-using-synaptic.png?ssl=1
[16]: https://itsfoss.com/ppa-guide/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/see-packages-by-repositories-synaptic.png?ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/upgrade-packages-synaptic.png?ssl=1
[19]: https://itsfoss.com/apt-search-command/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/search-results-synaptic.png?ssl=1
[21]: https://itsfoss.com/app-grid-lighter-alternative-ubuntu-software-center/
