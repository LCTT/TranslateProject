Fedora 28 服务器版的模块化
========

![](https://fedoramagazine.org/wp-content/uploads/2018/05/f28-server-modularity-1024x433.jpg)

### 什么是模块化

所有开源发行版都面临的一个经典难题是“太快/太慢”的问题。用户安装操作系统是为了能够使用其应用程序。像 Fedora 这样的全面的发行版在大量可用软件方面有其优势和劣势。虽然有用户想要的软件包，但可能无法使用其所需的版本。以下是<ruby>模块化<rt>Modularity</rt></ruby>如何帮助解决该问题。

对于某些用户，Fedora 有时升级得太快。其快速发布周期以及尽可能提供最新稳定软件的愿望可能导致与应用程序的兼容性下降。如果因为 Fedora 将 Web 框架升级为不兼容的版本而导致用户无法运行 Web 应用程序，则会非常令人沮丧。对“太快”问题的经典回答是“Fedora 应该有一个 LTS 版本。”然而，这种方法只能解决问题的一半，并使这个难题的另一面变得更糟。

有时候 Fedora 对某些用户而言又升级速度太慢。例如，Fedora 的发布可能与其它想要的软件的发布时间不匹配。一旦 Fedora 版本宣布稳定，打包者必须遵守 [稳定更新政策][1] 并且不能在系统中引入不兼容的更改。

Fedora 的模块化从两个方面解决了这个问题。Fedora 仍将根据其传统政策发布标准版本。但是，它还将提供一组模块给出流行软件的限定替代版本。那些处于“太快”阵营的人仍然可以享受 Fedora 的新内核和其它通用平台增强功能。此外，他们仍然可以访问支持其应用程序的旧框架或工具链。

此外，那些喜欢更新潮一些的用户可以访问比发布时更新的软件。

### 模块化不是什么？

模块化不是 <ruby>[软件集合][2]<rt>Software Collections</rt></ruby> 的直接替代品。这两种技术试图解决许多相同的问题，但有明显的差异。

软件集合可以在系统上并行安装不同版本的软件包。但是，它们的缺点是每份安装包都存在于文件系统上的它们自己的命名空间里面。此外，需要告诉每个依赖它们的应用程序在哪里找到它们。

使用模块化，系统上只存在一个版本的软件包，但用户可以选择哪个版本。优点是该版本位于系统的标准位置。该程序包不需要对依赖它的应用程序进行特殊更改。来自用户研究的反馈表明，大多数用户实际上并不依赖于并行安装。容器化和虚拟化解决了这个问题。

### 为什么不干脆使用容器化？

这是另一个常见问题。为什么用户在可以使用容器时还需要模块？答案是，人们仍然需要维护容器中的软件。 模块为那些用户不需要自己维护、更新和修补的容器提供预打包的内容。这就是 Fedora 如何利用发行版的传统价值并将其转移到新的容器化的世界。

以下是模块化如何为 Node.js 和 Review Board 的用户解决问题的示例。

### Node.js

许多读者可能熟悉 Node.js，这是一个流行的服务器端 JavaScript 运行时环境。Node.js 采用偶数/奇数版本策略。它的社区支持偶数版本（6.x、8.x、10.x 等）约 30 个月。同时，他们也支持奇数版本，基本上是 9 个月的开发者预览版。

由于这个周期的原因，Fedora 在其稳定的仓库中只携带最新的偶数版本的 Node.js。它完全避免了奇数版本，因为它们的生命周期比 Fedora 短，并且通常与 Fedora 发布周期不一致。对于一些希望获得最新和最大增强功能的 Fedora 用户来说，这并不合适。

由于模块化，Fedora 28 不是提供了一个版本，而是提供了三个版本的 Node.js，以满足开发人员和稳定部署的需求。Fedora 28 的传统仓库带有 Node.js 8.x。此版本是发布时最新的长期稳定版本。模块仓库（默认情况下在 Fedora 28 Server 版本上可用）也使得更旧的 Node.js 6.x 版本和更新的 Node.js 9.x 开发版本可用。

另外，Node.js 在 Fedora 28 之后几天发布了 10.x 上游版本。过去，想要部署该版本的用户必须等到 Fedora 29，或者使用来自 Fedora 之外的源代码。但是，再次感谢模块化，Node.js 10.x 已经在 Fedora 28 的 Modular Updates-Testing 仓库中 [可用][3] 了。

### Review Board

Review Board 是一个流行的 Django 应用程序，用于执行代码审查。Fedora 从 Fedora 13 到 Fedora 21 都包括了 Review Board。此时，Fedora 转移到了 Django 1.7。由于 Django 数据库支持的向后兼容性在不断变化，而 Review Board 无法跟上。它在 RHEL / CentOS 7 的 EPEL 仓库中仍然存在，而仅仅是因为这些发行版的版本幸运地被冻结在 Django 1.6上。尽管如此，它在 Fedora 的时代显然已经过去了。

然而，随着模块化的出现，Fedora 能够再次将旧的 Django 作为非默认模块流发布。因此，Review Board 已作为一个模块在 Fedora 上恢复了。Fedora 承载了来自上游的两个受支持的版本：2.5.x 和 3.0.x。

### 组合在一起

Fedora 一直为用户提供非常广泛的软件使用。Fedora 模块化现在为他们所需的软件版本提供了更深入的选择。接下来的几年对于 Fedora 来说将是非常令人兴奋的，因为开发人员和用户可以以新的和令人兴奋的（或旧的和令人兴奋的）方式组合他们的软件。

------

via: https://fedoramagazine.org/working-modules-fedora-28/

作者：[Stephen Gallagher][a]
选题：[wxy](https://github.com/wxy)
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sgallagh/
[1]: https://fedoraproject.org/wiki/Updates_Policy#Stable_Releases
[2]: https://www.softwarecollections.org/
[3]: https://bodhi.fedoraproject.org/updates/FEDORA-MODULAR-2018-2b0846cb86

