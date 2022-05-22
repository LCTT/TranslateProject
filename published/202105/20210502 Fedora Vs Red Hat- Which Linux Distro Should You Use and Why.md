[#]: subject: (Fedora Vs Red Hat: Which Linux Distro Should You Use and Why?)
[#]: via: (https://itsfoss.com/fedora-vs-red-hat/)
[#]: author: (Sarvottam Kumar https://itsfoss.com/author/sarvottam/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13372-1.html)

Fedora 和红帽 Linux：你应该使用哪个，为什么？
======

Fedora 和红帽 Linux。这两个 Linux 发行版都属于同一个组织，都使用 RPM 包管理器，都提供桌面版和服务器版。这两个 Linux 发行版对操作系统世界都有较大的影响。

这就是为什么在这两个类似的发行版之间比较容易混淆的原因。在这篇文章中，我将讨论红帽 Linux 和 Fedora 的相似之处和区别。

如果你想在两者之间做出选择，或者只是想了解来自同一组织的两个发行版的概念，这将对你有所帮助。

### Fedora 和红帽 Linux 的区别

![][1]

我们先来谈谈这两个发行版的区别。

#### 社区版与企业版

早在 1995 年，红帽 Linux 就有了它的第一个正式版本，它是作为盒装产品出售的。它也被称为<ruby>红帽商业 Linux<rt>Red Hat Commercial Linux</rt></ruby>。

后来在 2003 年，红帽把红帽 Linux 变成了完全以企业客户为中心的<ruby>红帽企业 Linux<rt>Red Hat Enterprise Linux</rt></ruby>（RHEL）。从那时起，红帽 Linux 就是一个企业版的 Linux 发行版。

它的意思是，你必须订阅并付费才能使用红帽 Linux，因为它不是作为一个免费的操作系统。甚至所有的软件、错误修复和安全支持都只对那些拥有红帽订阅的人开放。

当红帽 Linux 变成 RHEL 时，它也导致了 Fedora 项目的成立，该项目负责 Fedora Linux的开发。

与红帽不同，Fedora 是一个社区版的 Linux 发行版，每个人都可以免费使用，包括错误修复和其他服务。

尽管红帽公司赞助了 Fedora 项目，但 Fedora Linux 主要由一个独立的开源社区维护。

#### 免费与付费

好吧，你会发现大多数的 Linux 发行版都可以免费下载。Fedora Linux 也是这样一个发行版，它的桌面版、服务器版、所有其他版本和 Spin 版都是免费 [可下载][2] 的。

还有一些 Linux 发行版，你必须付费购买。红帽企业 Linux 就是这样一个流行的基于 Linux 的操作系统，它是需要付费的。

除了价格为 99 美元的 RHEL [开发者版本][3]，你必须支付超过 100 美元才能购买 [其他 RHEL 版本][4]，用于服务器、虚拟数据中心和台式机。

然而，如果你碰巧是一个个人开发者，而不是一个组织或团队，你可以加入 [红帽开发者计划][5]。根据该计划，你可以在 12 个月内免费获得红帽企业 Linux 包括其他产品的使用权。

#### 上游还是下游

Fedora 是 RHEL 的上游，RHEL 是 Fedora 的下游。这意味着当 Fedora 的新版本发布时，红帽公司会利用 Fedora 的源代码，在其下一个版本中加入所需的功能。

当然，红帽公司也会在合并到自己的 RHEL 代码库之前测试这些拉来的代码。

换句话说，Fedora Linux 作为红帽公司的一个试验场，首先检查功能，然后将其纳入 RHEL 系统中。

#### 发布周期

为了给操作系统的所有组件提供定期更新，RHEL 和 Fedora 都遵循一个标准的定点发布模式。

Fedora 大约每六个月发布一个新版本（主要在四月和十月），并提供长达 13 个月的维护支持。

红帽 Linux 每年发布一个特定系列的新的定点版本，大约 5 年后发布一个主要版本。红帽 Linux 的每个主要版本都要经过四个生命周期阶段，从 5 年的支持到使用附加订阅的 10 年的延长寿命阶段。

#### 尝鲜 Linux 发行版

当涉及到创新和新技术时，Fedora 比 RHEL 更积极。即使 Fedora 不遵循 [滚动发布模式][6]，它也是以早期提供尝鲜技术而闻名的发行版。

这是因为 Fedora 定期将软件包更新到最新版本，以便在每六个月后提供一个最新的操作系统。

如果你知道，[GNOME 40][7] 是 GNOME 桌面环境的最新版本，上个月才发布。而 Fedora 的最新稳定版 [版本 34][8] 确实包含了它，而 RHEL 的最新稳定版 8.3 仍然带有 GNOME 3.32。

#### 文件系统

在选择操作系统时，你是否把系统中数据的组织和检索放在了很重要的位置？如果是的话，在决定选择 Red Hat 和 Fedora 之前，你应该了解一下 XFS 和 Btrfs 文件系统。

那是在 2014 年，RHEL 7.0 用 XFS 取代 Ext4 作为其默认文件系统。从那时起，红帽在每个版本中都默认有一个 XFS 64 位日志文件系统。

虽然 Fedora 是红帽 Linux 的上游，但 Fedora 继续使用 Ext4，直到去年 [Fedora 33][9] 引入 [Btrfs 作为默认文件系统][10]。

有趣的是，红帽在最初发布的 RHEL 6 中包含了 Btrfs 作为“技术预览”。后来，红帽放弃了使用 Btrfs 的计划，因此在 2019 年从 RHEL 8 和后来发布的主要版本中完全 [删除][11] 了它。

#### 可用的变体

与 Fedora 相比，红帽 Linux 的版本数量非常有限。它主要适用于台式机、服务器、学术界、开发者、虚拟服务器和 IBM Power LE。

而 Fedora 除了桌面、服务器和物联网的官方版本外，还提供不可变的桌面 Silverblue 和专注于容器的 Fedora CoreOS。

不仅如此，Fedora 也有特定目的的定制变体，称为 [Fedora Labs][12]。每个 ISO 都为专业人士、神经科学、设计师、游戏玩家、音乐家、学生和科学家打包了一套软件。

想要 Fedora 中不同的桌面环境吗？你也可以查看官方的 [Fedora Spins][13]，它预先配置了几种桌面环境，如 KDE、Xfce、LXQT、LXDE、Cinnamon 和 i3 平铺窗口管理器。

![Fedora Cinnamon Spin][14]

此外，如果你想在新软件登陆稳定版 Fedora 之前就得到它，Fedora Rawhide 是另一个基于滚动发布模式的版本。

### Fedora 和红帽 Linux 的相似之处

除了不同之处，Fedora 和红帽 Linux 也有几个共同点。

#### 母公司

红帽公司是支持 Fedora 项目和 RHEL 的共同公司，在开发和财务方面都有支持。

即使红帽公司在财务上赞助 Fedora 项目，Fedora 也有自己的理事会，在没有红帽公司干预的情况下监督其发展。

#### 开源产品

在你认为红帽 Linux 要收钱，那么它怎么能成为一个开源产品之前，我建议阅读我们的 [文章][15]，它分析了关于 FOSS 和开源的一切。

作为一个开源软件，并不意味着你可以免费得到它，有时它可能要花钱。红帽公司是一个已经在开源中建立了业务的开源公司。

Fedora 和红帽 Linux 都是开源的操作系统。所有的 Fedora 软件包都可以在 [这里][16] 得到源代码和在 [这里][2] 得到已经打包好的软件。

然而，就红帽 Linux 而言，源代码也 [免费提供][17] 给任何人。但与 Fedora 不同的是，你需要为使用可运行的代码付费，要么你可以自由地自行构建。

你支付给红帽的订阅费实际上是用于系统维护和技术支持。

#### 桌面环境和初始系统

Fedora 和红帽 Linux 的旗舰桌面版采用了 GNOME 图形界面。所以，如果你已经熟悉了 GNOME，从任何一个发行版开始都不会有太大的问题。

![GNOME 桌面][18]

你是少数讨厌 SystemD 初始化系统的人吗？如果是这样，那么 Fedora 和红帽 Linux 都不适合你，因为它们都默认支持并使用 SystemD。

总之，如果你想用 Runit 或 OpenRC 等其他初始化系统代替它，也不是不可能，但我认为这不是一个好主意。

#### 基于 RPM 的发行版

如果你已经精通使用 YUM、RPM 或 DNF 命令行工具来处理 RPM 软件包，赞一个！你可以在这两个基于 RPM 的发行版中选一个。

默认情况下，红帽 Linux 使用 RPM（<ruby>红帽包管理器<rt>Red Hat Package Manager</rt></ruby>）来安装、更新、删除和管理 RPM 软件包。

Fedora 在 2015 年的 Fedora 21 之前使用 YUM（<ruby>黄狗更新器修改版<rt>Yellowdog Updater Modified</rt></ruby>）。从 Fedora 22 开始，它现在使用 DNF（<ruby>时髦版 Yum<rt>Dandified Yum</rt></ruby>）代替 YUM 作为默认的 [软件包管理器][19]。

### Fedora 或红帽 Linux：你应该选择哪一个？

坦率地说，这真的取决于你是谁以及你为什么要使用它。如果你是一个初学者、开发者，或者是一个想用它来提高生产力或学习 Linux 的普通用户，Fedora 可以是一个不错的选择。

它可以帮助你轻松地设置系统，进行实验，节省资金，还可以成为 Fedora 项目的一员。让我提醒你，Linux 的创造者 [Linus Torvalds][20] 在他的主要工作站上使用 Fedora Linux。

然而，这绝对不意味着你也应该使用 Fedora。如果你碰巧是一个企业，考虑到 Fedora 的支持生命周期在一年内就会结束，你可能会重新考虑选择它。

而且，如果你不喜欢每个新版本的快速变化，你可能不喜欢尝鲜的 Fedora 来满足你的服务器和业务需求。

使用企业版红帽，你可以得到高稳定性、安全性和红帽专家工程师为你的大型企业提供的支持品质。

那么，你是愿意每年升级你的服务器并获得免费的社区支持，还是购买订阅以获得超过 5 年的生命周期和专家技术支持？决定权在你。

--------------------------------------------------------------------------------

via: https://itsfoss.com/fedora-vs-red-hat/

作者：[Sarvottam Kumar][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sarvottam/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/fedora-vs-red-hat.jpg?resize=800%2C450&ssl=1
[2]: https://getfedora.org/
[3]: https://www.redhat.com/en/store/red-hat-enterprise-linux-developer-suite
[4]: https://www.redhat.com/en/store/linux-platforms
[5]: https://developers.redhat.com/register/
[6]: https://itsfoss.com/rolling-release/
[7]: https://news.itsfoss.com/gnome-40-release/
[8]: https://news.itsfoss.com/fedora-34-release/
[9]: https://itsfoss.com/fedora-33/
[10]: https://itsfoss.com/btrfs-default-fedora/
[11]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/considerations_in_adopting_rhel_8/file-systems-and-storage_considerations-in-adopting-rhel-8#btrfs-has-been-removed_file-systems-and-storage
[12]: https://labs.fedoraproject.org/
[13]: https://spins.fedoraproject.org/
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/Fedora-Cinnamon-Spin.jpg?resize=800%2C450&ssl=1
[15]: https://itsfoss.com/what-is-foss/
[16]: https://src.fedoraproject.org/
[17]: http://ftp.redhat.com/pub/redhat/linux/enterprise/
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/GNOME-desktop.jpg?resize=800%2C450&ssl=1
[19]: https://itsfoss.com/package-manager/
[20]: https://itsfoss.com/linus-torvalds-facts/
