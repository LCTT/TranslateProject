[#]: subject: "Xebian – A Blend of Debian and Goodness of Xfce [Review]"
[#]: via: "https://www.debugpoint.com/2022/05/xebian-review-2022/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14602-1.html"

Xebian：Debian 与 Xfce 的完美结合
======

> 这是一篇对漂亮而时尚的 Xebian Linux 发行版的快速评测。

Xebian 是一个基于 Xfce 桌面环境的 Linux 发行版，基于 Debian 不稳定分支（sid）。这个 Linux 发行版提供了一个带有基本的 Xfce 桌面的 Debian，而无需更改配置和附加软件包。因此，你不用在安装 Debian 和 Xfce 上花费太多时间就可以获得通常的开箱即用体验。

那么，如果你想尝试一下，这是对 Xebian 的快速评测。

![](https://www.debugpoint.com/wp-content/uploads/2022/05/Xebian-Desktop-with-Xfce.jpg)

### Xebian 评测

#### 安装

考虑到林林总总的 ISO（迷你、自由、非自由等等），Debian 安装可能会有点复杂。毕竟，它是一个真正的“通用操作系统”。但是对于 Xebian，就轻松多了，因为它只有一个提供了 Debian sid 和 Xfce 的 64 位 ISO 文件。Xebian 使用 Debian 原生的安装程序，在你的物理系统或虚拟机中安装此发行版都相当简单。

在我的测试过程中，安装很顺利，没有报告任何问题。安装大约需要 4 分钟。

#### 外观和感觉

安装后，当你首次启动系统时，你会看到带有 Xebian 默认壁纸的漂亮登录页面。这个登录屏幕是标准的默认 Xfce 桌面登录页面。

![Xebian Logn Screen][1]

首先，该桌面非常轻量，有着 Xfce 的干净外观。Xebian 就是一个在 Debian 上提供了完整 Xfce 桌面的 Linux 发行版。因此，唯一的区别是看起来不错的默认壁纸，以及默认的 Numix 主题（深色）。那些喜欢更传统外观的人也可以使用 Adwaita 和 Gerybird 主题。

其次，顶部面板右侧有 “<ruby>鼠须菜单<rt>Whisker Menu</rt></ruby>” 和标准的系统托盘，带有音量控制、电池指示、网络/Wi-Fi 和日期/时间。

#### 应用

Xebian 打包了所有 Xfce 原生应用，而没有添加任何额外内容。安装了它，你就应该拥有了一个稳定的工作桌面，并预装了以下应用程序：

* Thunar 文件管理器
* Ristretto 图像查看器
* Mousepad 文本编辑器
* Catfish 文件搜索
* XFCE 终端
* Firefox 浏览器
* Synaptic 包管理器
* GParted 分区程序
* 系统设置

除此之外，如果你需要任何其他应用，你可以使用 “<ruby>新立得<rt>Synaptic</rt></ruby>” 包管理器轻松安装它们。使用内置的 “<ruby>软件及软件源<rt>Software and Sources</rt></ruby>” 应用可以轻松调整软件源。

[Xfce 4.16][2] 是当前的稳定正式版本，并一同提供了其原生应用。而 Xfce 4.18 距离最终版本还很遥远。

该发行版的核心基于 Debian 不稳定分支 “sid”，在撰写本文时它正处于 Debian 12 “bookworm” 的发布路径上。它基于最新的 [Linux 内核 5.17][3] 进行滚动发布。

此外，如果你需要一个常规的图像编辑器、图形软件和办公套件（例如 LibreOffice），那么你可以手动安装它们。它们不是 ISO 文件的一部分。

现在，让我们来看看性能。

#### Xebian 的性能

Xebian 是轻量级的，非常适合旧硬件，这要归功于 Debian。我分两个阶段测试了其性能。

在让系统闲置一段时间后的理想阶段，消耗了大约 710 MB 内存，而 CPU 平均为 2%。大多数空闲状态资源被 Xfce4-desktop 和 Xfce 窗口管理器消耗。

其次，我在重度使用阶段对其进行了测试。我使用文件管理器、文本编辑器、终端和 Firefox 浏览器的一个实例作为工作负载尝试了 Xebian。在此工作负载下，Xebian 平均消耗 1.2GB 内存和 2% 到 3% 的 CPU，具体取决于各自的应用活动。而且，Firefox 明显消耗了大部分内存和 CPU，其次是 Xfce 窗口管理器的内存消耗增加了近 50%。

总的来说，我认为它是稳定的，应该可以在至少 4 GB 内存的中档硬件中正常工作。

### 结束语

基于 Debian 不稳定分支的 [Linux 发行版][4] 很少。如果你正在寻找 Xfce 和 Debian sid 的特定组合，那么 Xebian 是合适的，因为你从 Debian 获得了一个很可靠的滚动版本，并内置了 Xfce。

虽然它说是“不稳定”的，但根据我的经验，如果你每周保持系统更新，Debian “不稳定” 分支会很好地工作。

最后，如果你想尝试此发行版，请访问官方网站并

> **[下载 ISO 文件][5]**

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/xebian-review-2022/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/05/Xebian-Logn-Screen-1024x578.jpg
[2]: https://www.debugpoint.com/2021/02/xfce-4-16-review/
[3]: https://www.debugpoint.com/2022/03/linux-kernel-5-17/
[4]: https://www.debugpoint.com/category/distributions
[5]: https://xebian.org/download/
