[#]: subject: "Mabox Linux – Beautiful Arch Linux with Openbox [Review]"
[#]: via: "https://www.debugpoint.com/2022/03/mabox-linux-2022/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14416-1.html"

Mabox Linux：带有 Openbox 的美丽的 Arch Linux
======

![](https://img.linux.net.cn/data/attachment/album/202203/31/101104lieqiqhq3sezqtih.jpg)

> Mabox Linux 是一个 Manjaro Linux 重制版，带有一个轻量级的 Openbox 窗口管理器，已经预配置了主题和实用程序。我们将在这篇文章中点评这个发行版。

如果你喜欢窗口管理器，也喜欢基于滚动发布的 Arch Linux，并且正在寻找一个具有这种组合的现成 Linux 发行版，可以试试 Mabox Linux。Mabox Linux 是建立在很棒的 Manjaro Linux 之上的，带有 Openbox 窗口管理器和一些原生实用程序。

由于采用了 Openbox，这个 Linux 发行版在维持超轻量级的资源消耗的同时，也提供了一个漂亮的桌面。改编自 BunsenLabs，并受 Crunchbang 启发的 Mabox Linux 工具也带来了他们的一些应用。

让我们来深入了解一下这个了不起的 Linux 发行版。

### Mabox Linux 点评

#### 安装和现场介质

Mabox .ISO 的优势之一是它在<ruby>现场介质<rt>Live medium</rt></ruby>启动过程中为你提供了自由和专有的驱动程序的两种选择。如果你的系统中有英伟达或其他硬件，这对你有帮助。

<ruby>现场桌面<rt>Live desktop</rt></ruby>让你可以通过 Calamares 安装程序来安装 Mabox。在标准硬件上，安装大约需要 3 到 4 分钟，在我的测试中没有遇到错误。

安装程序也会检测测试设备中的其他操作系统。

#### 具有自定义的外观和感受

Mabox 带来了一个预配置的 Openbox 窗口管理器。这个搭配的版本看起来不错，有深色外观和带面板的菜单。

顶部的面板是用 Tint2 构建的，分成两个部分。左边的面板为你提供了主菜单、文件管理器、网页浏览器的快捷方式。面板上的鼠标左键和右键有不同的菜单。右边的面板包含资源监视器、音量控制、截屏快捷方式和电源菜单。顶部面板不是连续的，在某些主题下，应用程序窗口会停留在顶部。

![Mabox Linux with Nord Theme][1]

在桌面的右边部分，预配置的 Conky 脚本可以给你提供系统信息，包括日期、时间、存储和其他显示。

欢迎窗口为你提供了关于设置、帮助和支持的快速启动快捷方式，并有文档链接。

窗口管理器适合于键盘操作，有时不便于用鼠标操作。但由于 Openbox 和预配置的 Mabox，你可以轻松地使用鼠标，同时通过灵巧的键盘快捷方式提高你的工作效率。

桌面上的右键菜单为你提供了轻松的搜索和启动选项。

![Search and Launch from desktop][2]

如果你不喜欢默认的外观，你可以通过 Openbox 和 Tint2 面板配置工具，只需点击几下就可以自行定制。

![Main Application Menu][3]

Mabox 预设有不同的主题，包括面板和 Concky 脚本。你可以点击并应用这些令人惊叹的 Mabox 主题。如果你不想陷入自己配置面板、颜色和 Conky 的麻烦中，这是一个很好的功能。

一套好的墙纸可以让你随时让它在短时间内看起来更加美妙。

![Mabox Themes][5]

#### 应用

Mabox Linux 将所有必要的应用打包在其安装镜像中。以下是所包含的基本应用的简单列表。

  * Terminator 终端
  * Xpad 快速写字板
  * PCManFM 文件管理器
  * FSearch 桌面文件搜索
  * Flameshot 截图工具
  * Geany 文本编辑器
  * Audacious 音乐播放器
  * Firefox 网页浏览器

Mabox 还包括控制中心，以有效管理你的系统。Mabox 控制中心可以让你添加/删除应用、更新你的系统、启动窗口管理组件的几个配置窗口，诸如此类。

如果你找不到某个设置，你可以在 Mabox 控制中心通过其系统设置的逻辑分组轻松找到它们。

![Mabox Control Center][6]

#### 性能如何？

Mabox Linux 的性能令人印象非常深刻。由于采用了 Openbox 窗口管理器，Mabox 只用了大约 350MB 多点的内存，而 CPU 在空闲状态下徘徊在 2% 到 3%。

默认安装需要大约 5.39GB 的磁盘空间，这对于预装的这些应用和设置程序来说是不可思议的。

在如此优化下，以至于它消耗内存最多的应用是 Xorg，有 90MB。

所以，我想尝试一下重度使用下的性能。而这个性能也是令人惊讶的。我打开了一个文件管理器、带三个标签的 Firefox、一个用于开发的文本编辑器、一个终端窗口和控制中心。在这样的工作负荷下，Mabox 只消耗了大约 920MB 的内存和 6% 到 7% 的 CPU。

![Mabox Linux Heavy Workload Performance][7]

在 [点评几个发行版][8] 的过程中，这是我第一次发现一个发行版在重度工作负荷下不超过 1GB 内存的情况。但在不同的使用情况下，结果可能有所不同。无论如何，这个指标还是令人印象深刻。

### Mabox Linux 可以作为日常使用吗？

如果你对带有窗口管理器的 Arch Linux 比较熟悉和适应，你可以把 Mabox Linux 作为日常使用。有几个打包好的带有窗口管理器的 Arch Linux 发行版，而 Mabox 是其中最好的一个。

![Mabox Linux Windows 95 pre-configured theme][9]

### 总结

我认为 Mabox Linux 团队将所有组件与 Arch Linux 打包在一起，并呈现出一个漂亮的 Linux 发行版，做得非常好。它的外观惊艳，而消耗的系统资源却很少。有了基于 Arch Linux 的滚动发布功能，我认为你可以信赖这个发行版的长期使用。

你可以从它的 [官方网页][10] 下载 Mabox Linux。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/03/mabox-linux-2022/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/03/Mabox-Linux-with-Nord-Theme-1024x581.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2022/03/Search-and-Launch-from-desktop.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2022/03/Main-Application-Menu.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/03/Mabox-Themes.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/03/Mabox-Control-Center.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/03/Mabox-Linux-Heavy-Workload-Performance-1024x508.jpg
[8]: https://www.debugpoint.com/tag/linux-distro-review
[9]: https://www.debugpoint.com/wp-content/uploads/2022/03/Mabox-Linux-Windows-95-preconfigured-theme-1-1024x577.jpg
[10]: https://maboxlinux.org/
[11]: https://t.me/debugpoint
[12]: https://twitter.com/DebugPoint
[13]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[14]: https://facebook.com/DebugPoint