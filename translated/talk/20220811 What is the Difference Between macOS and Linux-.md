[#]: subject: "What is the Difference Between macOS and Linux?"
[#]: via: "https://itsfoss.com/mac-linux-difference/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "


macOS 和 Linux 有什么区别？
======

我们经常对比 [Linux 和 Windows][1]，那 macOS 和 Linux 有什么区别呢？

Linux 和 Windows 的差异很明显，但 Linux 和 macOS 却很相似。

二者都可以在命令行中运行 Unix 命令，并且与用户在 Windows 中的体验大相径庭。同时，并不是所有 Windows 上的应用和游戏可以在 macOS 和Linux 上运行。

这就是为什么一些人认为苹果公司的 macOS 是基于 Linux 的系统。尽管有相似之处，但 macOS 并不是 Linux。

这两个类 Unix 的操作系统有很多不同之处，我将在这篇文章中指出二者的异同之处。

就让我们来比较一下苹果和橙色企鹅吧。

### macOS vs. Linux：起源

macOS 有一段迷人的历史。它是由史蒂夫·乔布斯的计算机公司 NeXT 所开发的，那时候乔布斯不在苹果公司工作。从技术上讲，它是基于 [Mach 内核][2] 和 Unix 派生的 BSD。

那时候，**NeXT** 开发了 [NeXTSTEP][3] 操作系统来驱动它设计的设备和电脑。尽管有一些人注意到了该操作系统，但是它未获得成功。之后，苹果公司以恢复史蒂夫在董事会的席位作为交易的一部分，收购了 NeXT 公司，使得 NeXTSTEP OS 成为 macOS 的基础。

这就是为什么 macOS 是 Unix 组件和苹果公司独家技术相结合的操作系统。

**相反**，Linux （内核）是自由并开源的 Unix 的替代品。

Linux 不是一个操作系统，它需要一些组件比如 [桌面环境][4] 才能成为一个操作系统。有许多 [基于 Linux 的操作系统][5]，称之为发行版 (distributions) 。

简单起见，我们将这些操作系统成为 **Linux** 操作系统而不是特定的发行版。

### macOS 内核 vs. Linux 内核

macOS 内核的官方名称为 XNU。 [首字母缩略词][6] 代表 “XNU 不是 Unix”。根据 [苹果公司的 Github 页面][7]，XNU 是“将卡内基梅隆大学开发的 Mach 内核，与来自 FreeBSD 的组件，和用于编写驱动程序的 C++ API 相结合的一个混合内核”。代码的 BSD 子系统部分是 [“在微内核系统中实现用户空间服务”][8]。Mach 部分负责底层工作，例如多任务处理、受保护内存、虚拟内存管理、内核调试支持和控制台 I/O。

虽然 macOS 内核结合了微内核 ([Mach][9]) 和单片内核 ([BSD][10]) 的特性，但 Linux 只是一个单片内核。 [单片内核][11] 负责管理 CPU、内存、进程间通信、设备驱动程序、文件系统和系统服务器调用。

### 二者共同之处

macOS 利用 Unix 组件，而 Linux 是作为 Unix 的替代品而构建的。那么，二者有什么共同点？

二者都可以使用 **Unix 命令、bash/zsh、以及其他 shell**。或许 [默认 shell][12] 会有所不同，但是你可以根据你的喜好进行设置。除此之外，我想不到二者还有什么相似之处。

大概在十年前，我们可以说 Linux/macOS 都提供了更少的应用程序。但时过境迁。多年来，二者的软件生态和游戏支持都在不断发展，我们将在本文后面讨论。

### 代码库：闭源与开源

![open source proprietary illustration][13]

macOS 是一个闭源的操作系统，意味着你无法看到完整的操作系统源码。

当然，可以获得 [部分 macOS （大多为 GNU）库的源码][14]。有用来开发 macOS 和 iOS 操作系统的 [XNU 内核代码][15]。但是 [你不能只用该代码构建 macOS 的克隆版][16]，并安装在任何硬件上。

没有源码的世界不会崩塌，但你会因为苹果公司保护和增强你使用电脑体验的声明和实践，而获得 **更少的透明度**。

一些人认为出于安全的原因而保持闭源。然而，不论开源还是闭源都面临安全威胁。

**二者的不同** 是：相对于员工数量有限的苹果公司来说，由于有很多开发者在开源社区中，所以会很快修复开源软件。

除非你毫无保留的相信苹果，不然 Linux 的开源模式更胜一筹。

### 目的和用途： macOS vs. Linux

macOS 专为台式机和笔记本电脑使用而设计。它非常适合于 **视频编辑、图形设计和音频编辑**。

当谈到 Linux ，你可以做很多事情。你可以将 Linux 用于：

* 客户端
* Toaster （希望你了解 [物联网 IoT][17]）
* 单片机
* 服务器

当然，在各种平台上使用它的体验并不相同，但 Linux 可以针对各种用例运行。

所以，如果你喜欢 Linux，你可以选择在其他平台上继续使用它，以获得舒适的体验。

### macOS vs Linux: 用户体验

当谈到用户体验，这取决于个人喜好。

macOS 提供了 **令人愉悦的用户界面**。微妙的动画和高分辨率的壁纸、图标，这在视觉上很有吸引力。

![macOS Monterey][18]

你可以期待 macOS Monterey 版的跨平台的无缝体验。

使用 Linux，你可以获得同样令人愉悦且易于使用的用户界面。

![Zorin OS 16 Pro][19]

**不幸的是**，用户体验随着不同发行版所安装的桌面环境而不同。

你可以查看 [最好的桌面环境][20] 列表。你甚至还可以选择 [类似 macOS 的 Linux 发行版][21]。

例如，如果你使用 **Pop!_OS, Ubuntu, Zorin OS, 或者 elementary OS** ，你将获得超棒的体验。

![Pop!_OS 22.04 LTS][22]

如果你使用类似于 MX Linux 或者其他的发行版，用户体验无法与 macOS 相提并论。

![MX Linux][23]

总的来说，Linux 的开箱即用体验是不一致的，但如果你知道自己在做什么，它就足够了。

如果你之前使用 Windows，刚开始会对 Linux 的界面感到困惑。

### 可定制性

![customizability][24]

如果你想要一个可以让你对它的各个方面进行修补的操作系统，那 macOS 不适合你。

尽管大多情况下苹果的设计在美学上会令人愉悦，但并不是每个人都喜欢它们。

如果你想个性化、控制和大量定制操作系统的具体细节，Linux 应该是完美的选择。

你可以根据需要选择自定义用户界面，使用广泛的不同元素，并根据你的喜好尽情发挥。请查看我们的 [KDE 定制][25] 指南以探索可能性。

虽然这很好，但在 Linux 系统上自定义内容时可能会适得其反。因此，你需要学习、探索你想要自定义的内容。

### 运行硬件要求：macOS vs Linux

![hardware illustration][26]

硬件使 macOS 受到“重创”。

如果你想获得 macOS 并有良好的体验，那需要购买昂贵的苹果硬件

例如，支持 macOS 的笔记本电脑的基本配置从 **8 GB RAM** 和 **256 GB 存储空间**开始，价格为 **$1200** 或更多。

除非你想经常使用交换空间进行多任务处理，并且已经拥有云存储空间，否则买苹果设备将是一个糟糕的主意。

相比之下，如果你不想花很多钱，但仍希望为你的系统（PC/笔记本电脑）配置一个不错的配置，那么以 800 美元左右的价格购买一台配备 16 GB RAM + 512 GB SSD 的设备来运行 Linux 是很容易的。

**个人说明**：我习惯了 32 G 的 RAM + 500 GB 的 SSD 存储。为了获得这种多任务处理空间（不使用交换），我将不得不向苹果公司支付溢价。

一些熟练的“修补匠”尝试在非苹果公司的硬件上运行 macOS。这样的系统被称为 [Hackintosh][27]，但它肯定远不及在一般计算机上运行 Linux 的舒适度。

### 软件生态

通过苹果公司为 macOS 制作的专有应用程序或工具，可以在 macOS 上获得 **一流的原生体验**。

是的，你可能必须购买这些应用程序。但是，与某些订阅选项不同的是，你可以通过 macOS 一次性购买专业应用程序。

![Final Cut Pro on macOS][28]

对于想要设计、编辑视频、编辑照片并拥有创意的用户，如果你不介意投资它，macOS 的软件套件应该是一个不错的选择。

免费的苹果工具（如 iMovie、Keynote 等）本身就很好。将它们与 Final Cut Pro、Affinity Designer 等高级工具结合使用，你将获得世界级的编辑体验。别忘了，在 macOS 上也可以使用 Adobe 等创意工具。

此外，苹果公司对其平台可用的应用程序有严格的指导方针，以增强第三方应用程序（免费或付费）的原生体验。

这就是为什么许多设计师和编辑更喜欢使用 macOS 而不是任何其他操作系统的原因。

对于 Linux 平台，你可以使用 **很棒的 FOSS 替代品** 来替代一些仅限 macOS 的应用程序。除非你喜欢或有使用 macOS 特定应用程序的经验，否则你应该不会在使用适用于 Linux 的软件方面遇到问题。

![kdenlive editor][29]

原生应用的体验基于你使用的 Linux 发行版。

![Planner (To-do list app for Linux)][30]

它可能不像 macOS 那样完美，但如果你不是专业级的视频、图形编辑，你应该没有任何问题。

### 在 Linux 和 macOS 上游戏

![gaming illustration][31]

苹果公司在使其新的 M1/M2 芯片尽可能强大方面取得了不错的进展，但 macOS 目前对游戏的支持很差。

少数游戏可以正常工作，并且大多数都不受官方支持。说实话，为游戏而投资 Mac 并不是它的目的。

关于 Linux，许多 AAA 游戏和独立游戏运行良好。当然，某些游戏存在一些问题。但是，随着 Valve 推动 Steam Deck 对正版游戏支持，即使是像 **《蜘蛛侠：重制》** 这样的最新版本，都得到了 Steam Deck 的验证。

最终，会帮助 Linux 平台对游戏的支持。

此外，考虑到 PC 显卡市场几乎恢复正常（接近或低于建议零售价），你可以获得不错的 PC 版本或笔记本电脑，而不必担心性能瓶颈。

你会花 **1800 美元以上购买配备 16 GB RAM 和 512 GB SSD 的 Mac**，还是购买配备 32 GB RAM（或更多）和至少 1 TB SSD（或更多）的 PC/笔记本电脑？

那由你来决定。

### 软件包管理

![package manager illustration new][32]

软件包管理器能够让你很快地找到、安装或卸载你的操作系统中的软件。

与现有的任何系统相比，Linux 一直在包管理方面占据优势。

你可以获得 [Flatpak][33]、[Snap][34]、[Synaptic][35] 等开箱即用的选项。

但是，在默认情况下，Mac 用户没有任何可依赖的东西。幸运的是，像 [Homebrew][36] 这样的选项极大的方便了 macOS 用户。

它还支持Linux。因此，你可以在多个设备上使用它来简化操作。

### 系统升级

![software update illustration][37]

苹果公司不会发布其操作系统具体更新的时间。

例如，**macOS Ventura** （在撰写本文时即将进行版本升级）突然放弃了 2017 年之前的所有 Mac 设备。

有趣的是，以前的操作系统版本平均支持大约 **七年**，但随着更新的变化，现在似乎大约是 **五年**。

对于苹果公司设计的芯片，这或许不是一个简单的答案。但是，至少 4 到 5 年的软件支持是安全的。

Linux 为你提供了选择。如果你想要一个没有升级功能，只专注于维护和安全性的稳定操作系统，Linux 发行版的 [LTS 版本][38] 可以免费为你提供 **五年** 的更新。这主要适用于 [Ubuntu][39] 或基于 Ubuntu 的发行版，如 Linux Mint。

此外，有一个 Ubuntu 订阅项目，你可以持续 **十年** 获取安全更新。

而且，它并没有就此结束；你还可以选择 [滚动发行的版本][40]，来获得没有结束的时间的持续的前沿更新。只要你的硬件能够胜任，你应该就能毫无问题地更新操作系统。

### macOS vs. Linux: 你应该选择哪一个？

如果你需要的话，macOS 物有所值。

不建议只需要上网、发送电子邮件，以及执行一些在任何平台上都可以执行的任务的用户购买 macOS。

macOS 仍然是一个不错的选择。

然而，随着 Linux 的改进，它已经成为先前是 Windows/macOS 的用户、计算机专业学生、开发人员、创意专业人士（如我们）以及广泛潜在用户的有用的选择。

选择 Linux 而不是 macOS 的原因有很多，但（我认为）不矛盾。你对 macOS 与 Linux 有何看法？欢迎在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/mac-linux-difference/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/linux-better-than-windows/
[2]: https://en.wikipedia.org/wiki/Mach_(kernel)
[3]: https://en.wikipedia.org/wiki/NeXTSTEP
[4]: https://itsfoss.com/what-is-desktop-environment/
[5]: https://itsfoss.com/what-is-linux/
[6]: https://github.com/apple/darwin-xnu
[7]: https://github.com/apple/darwin-xnu
[8]: http://osxbook.com/book/bonus/ancient/whatismacosx/arch_xnu.html
[9]: https://en.wikipedia.org/wiki/Mach_(kernel
[10]: https://en.wikipedia.org/wiki/FreeBSD
[11]: https://www.howtogeek.com/howto/31632/what-is-the-linux-kernel-and-what-does-it-do/
[12]: https://linuxhandbook.com/change-shell-linux/
[13]: https://itsfoss.com/wp-content/uploads/2022/08/open-source-proprietary-illustration.jpg
[14]: https://opensource.apple.com/releases/
[15]: https://github.com/apple/darwin-xnu
[16]: https://www.techrepublic.com/article/why-apple-open-sourcing-mac-os-x-isnt-terribly-exciting/
[17]: https://www.ibm.com/blogs/internet-of-things/what-is-the-iot/
[18]: https://itsfoss.com/wp-content/uploads/2022/08/macos-monterey-screenshot.jpg
[19]: https://itsfoss.com/wp-content/uploads/2021/12/zorin-os-16-mac.png
[20]: https://itsfoss.com/best-linux-desktop-environments/
[21]: https://itsfoss.com/macos-like-linux-distros/
[22]: https://itsfoss.com/wp-content/uploads/2022/08/pop-os-screenshot-2022.png
[23]: https://itsfoss.com/wp-content/uploads/2022/07/10.-MX-Linux.jpg
[24]: https://itsfoss.com/wp-content/uploads/2022/08/customizability-illustration.jpg
[25]: https://itsfoss.com/kde-customization/
[26]: https://itsfoss.com/wp-content/uploads/2022/08/hardware-illustration-800x450.jpg
[27]: https://www.freecodecamp.org/news/build-a-hackintosh/
[28]: https://itsfoss.com/wp-content/uploads/2022/08/final-cut-pro-mac.jpg
[29]: https://itsfoss.com/wp-content/uploads/2022/08/kdenlive-editor.jpg
[30]: https://itsfoss.com/wp-content/uploads/2021/08/planner-board-view.png
[31]: https://itsfoss.com/wp-content/uploads/2022/08/gaming-illustration.jpg
[32]: https://itsfoss.com/wp-content/uploads/2022/08/package-manager-illustration-new.jpg
[33]: https://itsfoss.com/what-is-flatpak/
[34]: https://itsfoss.com/use-snap-packages-ubuntu-16-04/
[35]: https://itsfoss.com/synaptic-package-manager/
[36]: https://itsfoss.com/homebrew-linux/
[37]: https://itsfoss.com/wp-content/uploads/2022/07/software-update-illustration.jpg
[38]: https://itsfoss.com/long-term-support-lts/
[39]: https://itsfoss.com/getting-started-with-ubuntu/
[40]: https://itsfoss.com/best-rolling-release-distros/
