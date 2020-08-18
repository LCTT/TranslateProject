[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12527-1.html)
[#]: subject: (Manjaro vs Arch Linux: What’s the Difference? Which one is Better?)
[#]: via: (https://itsfoss.com/manjaro-vs-arch-linux/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

Manjaro 和 Arch Linux 有何不同，哪个更好？
======

> Manjaro 还是 Arch Linux？如果说 Manjaro 是基于 Arch 的，那么它和 Arch 又有什么不同呢？请在这篇比较文章中阅读 Arch 和 Manjaro 的不同之处吧。

大多数[适合初学者的 Linux 发行版][1]都是基于 Ubuntu 的。随着 Linux 用户经验的增加，一些人开始尝试使用更高级的发行版，主要是在“Arch 领域”。

这个所谓的 “Arch 领域”以两个发行版为主。[Arch Linux][2] 本身和 [Manjaro][3]。还有其他[基于 Arch 的 Linux 发行版][4]，但都没有这两个发行版受欢迎。

如果你在 Arch 和 Manjaro 之间感到困惑，那么这个比较应该能帮助你。

### Manjaro 和 Arch Linux：它们有什么不同或相似之处？

![][5]

我试图在各个方面比较这两种发行版。请记住，我并没有只关注差异，我还指出了它们的相似之处。

#### 两者都是滚动发布的版本，但不是同一种类型

在 Arch 和 Manjaro 中，没有像 Ubuntu 或 Fedora 那样每隔几个月或几年就会有一次“发布”。只要[保持你的 Arch 或 Manjaro 系统的更新][6]，你将永远拥有最新版本的操作系统和软件包。你不需要像以往一样担心升级你的安装版本。

如果你打算在某个时候进行全新安装，请记住，Manjaro 和 Arch 都会定期更新它的安装 ISO。这被称为 ISO 刷新，它确保新安装的系统不必安装过去几个月中所有可用的新系统更新。

但 Arch 和 Manjaro 的滚动发布模式是有区别的。

除了社区维护的 <ruby>Arch 用户软件库<rt>Arch User Repository</rt></ruby>（AUR）之外，Manjaro 也维护着自己的独立软件库，这些软件库也包含了非 Arch 提供的软件包。那些原本由 Arch 官方软件库提供的流行软件包将首先进行彻底的测试（必要时打上补丁），然后 Manjaro 再次发布，这通常比 Arch 晚两周左右，发布到 Manjaro 自己的稳定软件库供公众使用。

![][7]

适应这个测试过程的一个后果是，Manjaro 永远不会像 Arch 一样那么激进尝鲜。但这样一来，就使得 Manjaro 比 Arch 稍微稳定一些，也不容易破坏你的系统。

#### 包管理 - Pacman 和 Pamac

Arch 和 Manjaro 都提供了基于命令行的软件包管理工具 Pacman，它是用 C 语言编写的，使用 `tar` 来打包应用程序。换句话说，你可以[使用相同的 pacman 命令][8]来管理两个发行版的软件包。

除了 Pacman，Manjaro 还开发了一个名为 Pamac 的 GUI 应用程序，用于在 Manjaro 上轻松安装软件。这使得使用 Manjaro 比使用 Arch 更容易。

![Manjaro 的 Pamac GUI 包管理器][9]

请注意，你也可以在 Arch Linux 中从 AUR 安装 Pamac，但该工具是 Manjaro 的组成部分。

#### Manjaro 硬件检测工具（MHWD）

Pamac 并不是 Manjaro 团队开发的唯一帮助用户的 GUI 工具。Manjaro 还有一个专门的工具，用于检测硬件并为其推荐驱动程序。

![Manjaro 硬件配置 GUI 工具][10]

这个硬件检测工具非常有用，可以说是 [Manjaro 受到社区喜爱的主要原因][11]之一。它使得检测、安装、使用或从一个驱动切换到另一个驱动都非常简单，让硬件兼容性成为了过去。

#### 驱动程序支持

Manjaro 为 GPU 驱动提供了极大的支持。我们都知道多年来 Linux 在安装驱动程序（特别是 Nvidia）方面存在问题。

当[安装 Manjaro][12] 时，它给出了从开源（自由）或非开源（非自由）图形驱动安装开始的选项。当你选择“非自由”时，它会自动检测你的显卡，并为其安装最合适的驱动程序，因此 GPU 可以开箱即用。

由于有了上一节中看到的硬件检测工具，甚至在安装 Manjaro 时，安装显卡驱动会更加容易。

如果你有一个带有 Nvidia Optimus 卡（混合 GPU）的系统，它与 Manjaro 配合良好。你会有很多方式来让它工作。

在 Arch Linux 中，你必须为你的机器安装（如果你能找到）合适的驱动程序。

#### 访问 Arch 用户软件库（AUR）

[Arch 用户软件库][13]（AUR）是一个面向基于 Arch 的 Linux 发行版用户的社区驱动的软件库。AUR 的创建是为了组织和分享来自社区的新软件包，并帮助加快流行软件包被纳入[社区软件库][14]。

大量进入官方软件库的新软件包都是从 AUR 开始的。在 AUR 中，用户能够贡献自己的软件包构建（`PKGBUILD` 和相关文件）。

你可以在 Arch 和 Manjaro 中使用 AUR。

#### 桌面环境

好吧！你可以在任何 Linux 发行版上使用几乎所有的桌面环境。Arch 和 Manjaro 也不例外。

然而，一个专门的桌面风格或版本可以让用户更容易地在桌面环境里获得顺畅的体验。

默认的 Arch ISO 并不包含任何桌面环境。例如，你想[在 Arch Linux 上安装 KDE][15]，你必须在[安装 Arch Linux][16] 时或在之后下载安装它。

而 Manjaro 则为 Xfce、KDE 和 GNOME 等桌面环境提供了不同的 ISO。Manjaro 社区还维护着 MATE、Cinnamon、LXDE、LXQt、OpenBox 等桌面环境的 ISO。

#### 安装程序

![Arch 即用启动][17]

Manjaro 是基于 Arch Linux 的，它是兼容 Arch 的，但**它不是 Arch**。它甚至不是只有一个图形安装程序的预配置版本的 Arch。Arch 并不具备通常的舒适的开箱即用，这也是为什么大多数人喜欢更简单的东西。Manjaro 为你提供了简单的入口，但支持你成为经验丰富的用户或资深用户。

#### 文档和支持

Arch 和 Manjaro 都有自己的维基页面和支持论坛来帮助各自的用户。

虽然 Manjaro 有一个不错的[维基][18]文档，但 [Arch 维基][19]则不可同日而语。你可以在 Arch 维基中找到关于 Arch Linux 各方面的详细信息。

#### 目标受众

关键的区别在于 [Arch 针对的是抱着自己动手的态度的用户][20]，他们愿意阅读文档，自己解决问题。

而 Manjaro 则是针对那些没有那么多经验或者不想花时间组装操作系统的 Linux 用户。

### 结论

有些人经常说 Manjaro 是给那些不会安装 Arch 的人用的。但我认为这是不对的。不是每个人都想从头配置 Arch，或者没有太多时间。

Manjaro 绝对是一只野兽，但与 Arch 截然不同。**快速、强大，并总是保持更新**，Manjaro 提供了 Arch 操作系统的所有优点，但特别强调**稳定性、用户友好性和可访问性**，既适合新手，也适合有经验的用户。

Manjaro 并不像 Arch Linux 那样极简主义。在 Arch 中，你从一个空白的画布开始，手动调整每个设置。当默认的 Arch 安装完成后，你在命令行就有了一个正在运行的 Linux 实例。想要一个[图形化桌面环境][21]？那就自己来吧 —— 有很多选择。选择一个，安装，然后配置它。你可以从中学到很多东西，特别是如果你是 Linux 新手的话。你会对系统是如何组合在一起的，以及为什么要以这样的方式安装东西有很好的理解。

我希望你现在对 Arch 和 Manjaro 有了更好的理解。现在，你明白了它们是相似而不同的了吧。

我已经发表了我的看法。不要犹豫，请在评论区分享你的观点。在 Arch 和 Manjaro 之间，你更喜欢哪一个，为什么。

Abhishek Prakash 也此文补充了内容。

--------------------------------------------------------------------------------

via: https://itsfoss.com/manjaro-vs-arch-linux/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-beginners/
[2]: https://www.archlinux.org/
[3]: https://manjaro.org/
[4]: https://itsfoss.com/arch-based-linux-distros/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/arch-vs-manjaro.png?ssl=1
[6]: https://itsfoss.com/update-arch-linux/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/repositories.png?ssl=1
[8]: https://itsfoss.com/pacman-command/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/Pamac.png?resize=800%2C534&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/hardware-detection.png?ssl=1
[11]: https://itsfoss.com/why-use-manjaro-linux/
[12]: https://itsfoss.com/install-manjaro-linux/
[13]: https://linux.cn/article-12107-1.html
[14]: https://wiki.archlinux.org/index.php/Community_repository
[15]: https://linux.cn/article-12258-1.html
[16]: https://itsfoss.com/install-arch-linux/
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/Arch-live-boot.jpg?ssl=1
[18]: https://wiki.manjaro.org/index.php?title=Main_Page
[19]: https://wiki.archlinux.org/
[20]: https://linux.cn/article-12445-1.html
[21]: https://itsfoss.com/best-linux-desktop-environments/
