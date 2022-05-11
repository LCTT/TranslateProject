[#]: subject: "Xebian – A Blend of Debian and Goodness of Xfce [Review]"
[#]: via: "https://www.debugpoint.com/2022/05/xebian-review-2022/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Xebian – Debian 与 Xfce 的完美结合（评论）
======
这是对漂亮而时尚的 Xebian Linux 发行版的快速回顾。

Xebian 是一个基于 Xfce 桌面环境的 Linux 发行版，基于 Debian Unstable (sid) 分支。这个 Linux 发行版带来了一个带有 Debian 的基本 Xfce 桌面，无需更改配置和附加软件包。因此，你无需担心安装 Debian 和 Xfce 就可以获得开箱即用的普通体验。

话虽如此，如果你想尝试一下，这里是 Xebian 的快速回顾。

### Xebian 评论

#### 安装

考虑到各种可用的 ISO（迷你、自由、非自由等等），Debian 安装可能会很棘手。毕竟，它是一个真正的“通用操作系统”。但是对于 Xebian，它毫不费力，因为它只有一个 64 位 ISO 文件，它为你提供 Debian sid 和 Xfce。 Xebian 使用 Debian 的本机安装程序，在你的物理系统或虚拟机中安装此发行版相当简单。

在我的测试过程中，安装很顺利，没有报告任何问题。安装大约需要 4 分钟。

#### 外观和感觉

安装后，当你首次启动系统时，你会看到带有 Xebian 默认壁纸的漂亮登录页面。登录屏幕是标准的默认 Xfce 桌面登录页面。

![Xebian Logn Screen][1]

首先，桌面非常轻量，并且带有 Xfce 的干净外观。 Xebian 提供了带有 Debian 的 Xfce 的完整版本。因此，唯一的区别是看起来不错的默认壁纸和默认的 Numix 主题（深色）。 Adwaita 和 Gerybird 主题也适用于那些喜欢更传统外观的人。

其次，顶部面板右侧有 Whisker 菜单和标准系统托盘，带有音量控制、电池指示、网络/Wi-Fi 和日期/时间。

#### 应用

Xebian 打包了所有 Xfce 原生应用，并且不添加任何额外内容。安装它时，你应该已经拥有一个稳定的工作桌面，并预装了以下应用程序。

* Thunar 文件管理器
* Ristretto 图像查看器
* Mousepad 文本编辑器
* Catfish 文件搜索
* XFCE 终端
* Firefox
* Synaptic 包管理器
* GParted 用于分区
* 系统设置

除此之外，如果你需要任何其他应用，你可以使用 Synaptic 包管理器轻松安装它们。使用内置的 “Software and Sources” 应用可以轻松调整软件源。

[Xfce 4.16][2] 是目前与原生应用一起稳定的官方版本。它的核心是基于 Debian Unstable “sid”，在撰写本文时它具有 Debian 12 “bookworm” 发布路径。它基于最新的 [Linux Kernel 5.17][3] 滚动发布。 Xfce 4.18 距离最终版本还很遥远。

此外，如果你需要一个平常的图像编辑器、图形软件和 Office 套件（例如 LibreOffice），那么你需要手动安装它们。它们不是 ISO 文件的一部分。

现在，让我们来看看性能。

#### Xebian 的性能

Xebian 是轻量级的，非常适合旧硬件，这要归功于 Debian。我分两个阶段测试了性能。我让系统闲置一段时间的理想阶段消耗大约 710 MB 内存，而 CPU 平均为 2%。大多数空闲状态资源被 Xfce4-desktop 和 Xfce 窗口管理器消耗。

其次，我在重度使用阶段对其进行了测试。在这个工作负载中，我使用文件管理器、文本编辑器、终端和 Firefox 浏览器的一个实例尝试了 Xebian。

在此工作负载下，Xebian 平均消耗 1.2GB 内存和 2% 到 3% 的 CPU，具体取决于各自的应用活动。

而且，Firefox 明显消耗了大部分内存和 CPU，其次是 Xfce 窗口管理器的内存消耗增加了近 50%。

总的来说，我认为它是稳定的，应该可以在至少 4 GB 内存的中档硬件中正常工作。

### 结束语

基于 Debian Unstable 分支的 [Linux 发行版][4]很少。如果你正在寻找 Xfce 和 Debian sid 的特定组合，那么 Xebian 是完美的，因为你从 Debian 获得了一个超级可靠的滚动版本并内置了 Xfce。

虽然它说“不稳定”，但根据我的经验，如果你每周保持系统更新，Debian “unstable” 会很好地工作。

最后，如果你想尝试此发行版，请访问官方网站并[下载 ISO 文件][5]。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/05/xebian-review-2022/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/05/Xebian-Logn-Screen-1024x578.jpg
[2]: https://www.debugpoint.com/2021/02/xfce-4-16-review/
[3]: https://www.debugpoint.com/2022/03/linux-kernel-5-17/
[4]: https://www.debugpoint.com/category/distributions
[5]: https://xebian.org/download/
