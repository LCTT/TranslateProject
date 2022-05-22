[#]: subject: "Debian vs Ubuntu: What’s the Difference? Which One Should You Use?"
[#]: via: "https://itsfoss.com/debian-vs-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13746-1.html"

Debian 和 Ubuntu：有什么不同？应该选择哪一个？
======

![](https://img.linux.net.cn/data/attachment/album/202109/02/230706mpahrwpwjjm2jkpu.jpg)

在 Debian 和 Ubuntu 系统中，你都可以 [使用 apt-get 命令][1] 来管理应用。你也可以在这两个发行版中安装 DEB 安装包。很多时候，你会在这两个发行版中发现同样的包安装命令。

它们两者是如此的相似，那么，它们两者之间有什么区别呢？

Debian 和 Ubuntu 属于同一系列的发行版。Debian 是由 Ian Murdock 在 1993 年创建的最初的发行版。Ubuntu 是 Mark Shuttleworth 在 2004 年基于 Debian 创建的发行版。

### Ubuntu 基于 Debian：这意味着什么？

Linux 发行版虽然有数百个，但其中只有少数是从零开始的独立发行版。 [Debian][2]、Arch、Red Hat 是其中几个不派生于其它发行版的使用最广的发行版。

Ubuntu 源自 Debian。这意味着 Ubuntu 使用与 Debian 相同的 APT 包管理系统，并共享来自 Debian 库中的大量包和库。它建立在 Debian 基础架构上。

![Ubuntu uses Debian as base][3]

这就是大多数“衍生”发行版所做的。它们使用相同的包管理器，并与基础发行版共享包。但它们也做了一些改变，添加了一些自己的包。这就是 Ubuntu 和 Debian 的不同之处，尽管它是从 Debian 衍生而来的。

### Ubuntu 和 Debian 的不同之处

因此，Ubuntu 构建在 Debian 架构和基础设施上，也与 Debian 一样是用 .DEB 格式的软件包。

这意味着使用 Ubuntu 和使用 Debian 是一样的吗？并不完全如此。有很多因素可以用来区分两个不同的发行版。

让我逐一讨论这些因素来比较 Ubuntu 和 Debian。请记住，有些比较适用于桌面版本，而有些比较适用于服务器版本。

![][4]

#### 1、发布周期

Ubuntu 有两种发布版本：LTS（长期支持）和常规版本。[Ubuntu LTS 版本][5] 每两年发布一次，并且会提供五年的支持。你可以选择升级到下一个可用的 LTS 版本。LTS 版本被认为更稳定。

还有一个非 LTS 版本，每六个月发布一次。这些版本仅仅提供九个月的支持，但是它们会有一些新的软件版本和功能。在当前的版本到达维护年限时，你应当升级到下一个 Ubuntu 版本。

所以基本上，你可以根据这些版本在稳定性和新特性之间进行选择。

另一方面，Debian 有三个不同的版本：稳定版、测试版和非稳定版。非稳定版是为了实际测试，应该避免使用。

测试版不是那么不稳定。它是用来为下一个稳定版做准备。有一些 Debian 用户更倾向于使用测试版来获取新的特性。

然后是稳定版。这是 Debian 的主要版本。Debian 稳定版可能没有最新的软件和功能，但在稳定性方面毋庸置疑。

每两年 Debian 会发布一个稳定版，并且会提供三年的支持。此后，你应当升级到下一个可用的稳定版。

#### 2、软件更新

![][6]

Debian 更关注稳定性，这意味着它并不总是使用最新版本的软件。例如，最新的 Debian 11 用的 GNOME 版本为 3.38，并不是最新版的 GNOME 3.40。 

对于 GIMP、LibreOffice 等其它软件也是如此。这是你必须对 Debian 做出的妥协。这就是“Debian stable = Debian stale”笑话在 Linux 社区流行的原因。

Ubuntu LTS 版本也关注稳定性。但是它们通常拥有较新版本的常见软件。

你应该注意，对于某些软件，从开发者的仓库安装也是一种选择。例如，如果你想要安装最新版的 Docker，你可以在 Debian 和 Ubuntu 中添加 Docker 仓库。

总体来说，相比较于 Ubuntu ，Debian 稳定版的软件版本会更旧。 

#### 3、软件可用性

Debian 和 Ubuntu 都拥有一个巨大的软件仓库。然而，[Ubuntu 还有 PPA][7]（<ruby>个人软件包存档<rt>Personal Package Archive</rt></ruby>）。通过 PPA，安装更新版本的软件或者获取最新版本的软件都将会变的更容易。

![][8]

你可以在 Debian 中尝试使用 PPA，但是体验并不好。大多数时候你都会遇到问题。

#### 4、支持的平台

Ubuntu 可以在 64 位的 x86 和 ARM 平台上使用。它不再提供 32 位的镜像。

另一方面，Debian 支持 32 位和 64 位架构。除此之外，Debian 还支持 64 位 ARM（arm64）、ARM EABI（armel）、ARMv7（EABI hard-float ABI，armhf）、小端 MIPS（mipsel）、64 位小端 MIPS（mips64el）、64 位小端 PowerPC（ppc64el） 和 IBM System z（s390x）。

所以它也被称为 “<ruby>通用操作系统<rt>universal operating system</rt></ruby>”。

#### 5、安装

[安装 Ubuntu][9] 比安装 Debian 容易得多。我并不是在开玩笑。即使对于有经验的 Linux 用户，Debian 也可能令人困惑。

当你下载 Debian 的时候，它默认提供的是最小化镜像。此镜像没有非自由（非开源）的固件。如果你继续安装它，你就可能会发现你的网络适配器和其它硬件将无法识别。

有一个单独的包含固件的非自由镜像，但它是隐藏的，如果你不知道，你可能会大吃一惊。

![Getting non-free firmware is a pain in Debian][10]

Ubuntu 在默认提供的镜像中包含专有驱动程序和固件时要宽容的多。

此外，Debian 安装程序看起来很旧，而 Ubuntu 安装程序看起来就比较现代化。Ubuntu 安装程序还可以识别磁盘上其它已安装的操作系统，并为你提供将 Ubuntu 与现有操作系统一起安装的选项（双引导）。但我在测试时并没有注意到 Debian 有此选项。

![Installing Ubuntu is smoother][11]

#### 6、开箱即用的硬件支持

就像之前提到的，Debian 主要关注 [FOSS][12]（自由和开源软件）。这意味着 Debian 提供的内核不包括专有驱动程序和固件。

这并不是说你无法使其工作，而是你必须添加/启动额外的存储库并手动安装。这可能令人沮丧，特别是对于初学者来说。

Ubuntu 并不完美，但在提供开箱即用的驱动程序和固件方面，它比 Debian 好得多。这意味着更少的麻烦和更完整的开箱即用体验。

#### 7、桌面环境选择

Ubuntu 默认使用定制的 GNOME 桌面环境。你可以在其上安装 [其它桌面环境][13]，或者选择 [各种不同桌面风格的 Ubuntu][14]，如 Kubuntu（使用 KDE 桌面）、Xubuntu（使用 Xfce 桌面）等。

Debian 也默认安装了 GNOME 桌面。但是它会让你在安装的过程中选择你要安装的桌面环境。

![][15]

你还可以从其网站获取 [特定桌面环境的 ISO 镜像][16]。

#### 8、游戏性

由于 Stream 及其 Proton 项目，Linux 上的游戏总体上有所改善。尽管如此，游戏在很大程度上取决于硬件。

在硬件兼容性上，Ubuntu 比 Debian 在支持专有驱动程序方面要好。

并不是说在 Debian 中不能做到这一点，而是需要一些时间和精力来实现。

#### 9、性能

性能部分没有明显的“赢家”，无论是在服务器版本还是在桌面版本。 Debian 和 Ubuntu 作为桌面和服务器操作系统都很受欢迎。

性能取决于你系统的硬件和你所使用的软件组件。你可以在你的操作系统中调整和控制你的系统。

#### 10、社区和支持

Debian 是一个真正的社区项目。此项目的一切都由其社区成员管理。

Ubuntu 由 [Canonical][17] 提供支持。然而，它并不是一个真正意义上的企业项目。它确实有一个社区，但任何事情的最终决定权都掌握在 Canonical 手中。

就支持而言，Ubuntu 和 Debian 都有专门的论坛，用户可以在其中寻求帮助和提出建议。

Canonical 还为其企业客户提供收费的专业支持。Debian 则没有这样的功能。

### 结论

Debian 和 Ubuntu 都是桌面或服务器操作系统的可靠选择。 APT 包管理器和 DEB 包对两者都是通用的，因此提供了一些相似的体验。

然而，Debian 仍然需要一定程度的专业知识，特别是在桌面方面。如果你是 Linux 新手，坚持使用 Ubuntu 将是你更好的选择。在我看来，你应该积累一些经验，熟悉了一般的 Linux，然后再尝试使用 Debian。

并不是说你不能从一开始就使用 Debian，但对于 Linux 初学者来说，这并不是一种很好的体验。

欢迎你对这场 Debian 与 Ubuntu 辩论发表意见。

--------------------------------------------------------------------------------

via: https://itsfoss.com/debian-vs-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/apt-get-linux-guide/
[2]: https://www.debian.org/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Debian-ubuntu-upstream.png?resize=800%2C400&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/debian-vs-ubuntu.png?resize=800%2C450&ssl=1
[5]: https://itsfoss.com/long-term-support-lts/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/apt-cache-policy.png?resize=795%2C456&ssl=1
[7]: https://itsfoss.com/ppa-guide/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/03/ffmpeg_add_ppa.jpg?resize=800%2C222&ssl=1
[9]: https://itsfoss.com/install-ubuntu/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Debian-firmware.png?resize=800%2C600&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/03/choose-something-else-installing-ubuntu.png?resize=800%2C491&ssl=1
[12]: https://itsfoss.com/what-is-foss/
[13]: https://itsfoss.com/best-linux-desktop-environments/
[14]: https://itsfoss.com/which-ubuntu-install/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/debian-install-desktop-environment.png?resize=640%2C479&ssl=1
[16]: https://cdimage.debian.org/debian-cd/current-live/amd64/iso-hybrid/
[17]: https://canonical.com/
