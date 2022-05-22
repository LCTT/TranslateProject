[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12713-1.html)
[#]: subject: (Linux Jargon Buster: What is a Package Manager in Linux? How Does it Work?)
[#]: via: (https://itsfoss.com/package-manager/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Linux 黑话解释：什么是包管理器？它是如何工作的？
======

![](https://img.linux.net.cn/data/attachment/album/202010/13/094827peunhns3nn3qceno.jpg)

[Linux 发行版之间有什么不同][1]的要点之一是包管理。在这篇 Linux 黑话解释中，你将了解 Linux 中的打包和包管理器。你将了解什么是包，什么是包管理器，它们是如何工作的，以及有什么包管理器。

### 什么是包管理器？

简单来说，“<ruby>包管理器<rt>package manager</rt></ruby>”（或“软件包管理器”）是一种工具，它允许用户在操作系统上安装、删除、升级、配置和管理软件包。软件包管理器可以是像“软件中心”这样的图形化应用，也可以是像 [apt-get][2] 或 [pacman][3] 这样的命令行工具。

你会发现我经常在教程和文章中使用“包”这个词。要了解包管理器，你必须了解什么是包。 

### 什么是包？

一个“<ruby>包<rt>package</rt></ruby>”（或“软件包”）通常指的是一个应用程序，它可以是一个 GUI 应用程序、命令行工具或（其他软件程序需要的）软件库。包本质上是一个存档文件，包含二进制可执行文件、配置文件，有时还包含依赖关系的信息。

在旧时代，[软件曾经是从它的源代码安装的][4]。你会参考一个文件（通常命名为 `README`），看看它需要什么软件组件、二进制文件的位置。它通常包括一个配置脚本或 `Makefile`。你必须自己编译该软件或自己处理所有的依赖关系（有些软件需要安装其他软件）。

为了摆脱这种复杂性，Linux 发行版创建了自己的打包格式，为终端用户提供随时可用的二进制文件（预编译软件），以便安装软件，同时提供一些[元数据][5]（版本号、描述）和依赖关系。

这就像烤蛋糕与买蛋糕一样。
 
![][6]

大约在上世纪 90 年代中期，Debian 创建了 DEB 打包格式（`.deb`），Red Hat Linux 创建了 RPM（Red Hat Package Manager 的缩写）打包系统（`.rpm`）。编译源代码的方式仍然存在，但现在是可选的。

要与打包系统交互或使用打包系统，你需要一个包管理器。

### 包管理器是如何工作的？

请记住，包管理器是一个通用的概念，它并不是 Linux 独有的。你会经常发现各种软件或编程语言的包管理器。有[只是针对 Python 包的 PIP 包管理器][7]。甚至 [Atom 编辑器也有自己的包管理器][8]。

由于本文的重点是 Linux，所以我会从 Linux 的角度出发。不过，这里的大部分解释也可以应用于一般的包管理器。

我创建了这个图（基于 SUSE Wiki），这样你就可以很容易理解包管理器是如何工作的。

![][9]

几乎所有的 Linux 发行版都有“<ruby>软件仓库<rt>software repository</rt></ruby>”，它基本上是软件包的集合。是的，可以有不止一个软件库。软件库包含不同种类的软件包。

软件仓库也有元数据文件，其中包含了软件包的信息，如软件包的名称、版本号、软件包的描述和软件仓库名称等。这就是你在 Ubuntu/Debian 中使用 [apt show 命令][10]所看到的。

你的系统上的包管理器首先会与元数据进行交互。包管理器在你的系统上创建了一个元数据的本地缓存。当你运行包管理器的更新选项（例如 `apt update`）时，它会通过引用仓库中的元数据来更新本地元数据缓存。

当你运行软件包管理器的安装命令（例如 `apt install package_name`）时，软件包管理器会引用这个缓存。如果它在缓存中找到了包的信息，它就会使用互联网连接到相应的仓库，并在你的系统上安装之前先下载包。

一个包可能有依赖关系。意思是说，它可能需要安装其他软件包。软件包管理器通常会处理这些依赖关系，并将其与你正在安装的软件包一起自动安装。

![Linux 中包管理器会处理依赖关系][11]

同样，当你使用包管理器删除一个包时，它要么自动删除，要么通知你系统有未使用的包可以清理。

除了安装、删除这些显而易见的任务外，你还可以使用包管理器对包进行配置，并根据自己的需要进行管理。例如，你可以在常规的系统更新中[防止升级某个包的版本][12]。你的包管理器可能还能做很多事情。

### 不同种类的包管理器

包管理器因打包系统而异，但同一打包系统却可能有多个包管理器。

例如，RPM 有 [Yum][13] 和 [DNF][14] 包管理器。对于 DEB，你有 `apt-get`、[aptitude][15] 等基于命令行的包管理器。

![Synaptic 包管理器][16]

软件包管理器不一定是基于命令行的，也有图形化的软件包管理工具，比如 [Synaptic][17]。你的发行版的“软件中心”也是一个软件包管理器，即使它在底层运行的是 `apt-get` 或 DNF。

### 结论

我不想进一步详细介绍这个话题，虽然我可以继续说下去，但这将偏离本主题的目标 —— 即让你对 Linux 中的包管理器有一个基本的了解。

我暂时忽略了新的通用打包格式，比如 Snap 和 Flatpak。

我希望你对 Linux 中的包管理系统有更好的理解。如果你还有困惑，或者你对这个主题有一些问题，请发表评论。我会尽量回答你的问题，如果需要的话，我会在本文中更新新的内容。

--------------------------------------------------------------------------------

via: https://itsfoss.com/package-manager/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/what-is-linux/
[2]: https://itsfoss.com/apt-vs-apt-get-difference/
[3]: https://itsfoss.com/pacman-command/
[4]: https://itsfoss.com/install-software-from-source-code/
[5]: https://www.computerhope.com/jargon/m/metadata.htm
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/source-code-comilation-vs-packaging.png?resize=800%2C450&ssl=1
[7]: https://itsfoss.com/install-pip-ubuntu/
[8]: https://itsfoss.com/install-packages-in-atom/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/linux-package-manager-explanation.png?resize=800%2C450&ssl=1
[10]: https://itsfoss.com/apt-search-command/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/package-manager-handling-dependencies-in-linux.png?resize=800%2C450&ssl=1
[12]: https://itsfoss.com/prevent-package-update-ubuntu/
[13]: https://fedoraproject.org/wiki/Yum
[14]: https://fedoraproject.org/wiki/DNF
[15]: https://wiki.debian.org/Aptitude
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/see-packages-by-repositories-synaptic.png?resize=799%2C548&ssl=1
[17]: https://itsfoss.com/synaptic-package-manager/
