transalting by bestony

5个对 Linux 新人来说最好的 Linux 包管理器
=====================================================

一个 Linux 新用户应该知道 他/她 进步是源于他们使用已经存在的多个 Linux 发行版，使用不同的方式来管理包。

在 Linux 中，包管理器非常重要，知道如何使用多种包管理器可以为一个高级用户优化生活，从到仓库下载软件、安装软件、更新软件、处理依赖是非常重要的，这也是Linux 系统管理的一个重要部分。

![](http://www.tecmint.com/wp-content/uploads/2016/06/Best-Linux-Package-Managers.png)
>最好的Linux包管理器

为了成为一个 Linux 高级用户，一个标志是了解主要的 Linux 发行版如何处理包，在这篇文章中，我们应该看一些你能找到的Linux的最好的包管理器，

在这里，我们的主要重点是关于一些最好包管理器的相关信息，但不是如何使用它们，这些留给你亲自发现。但我会提供一些有意义的链接，使用指南或更多。

### 1. DPKG – Debian 包管理系统

Dpkg 是 Debian Linux 家族的基础包管理系统，他用于安装、删除、存储和提供`.deb`包的信息

这是一个低级的工具，并且他的前面有多个前端工具来帮助用户从远程的仓库获取包，或处理复杂的包关系的工具，包括：

不要错过: [15 Practical Examples of “dpkg commands” for Debian Based Distros][1]

#### APT (高级打包工具)

这个是一个基于 DPKG 包管理系统非常受欢迎的、免费的、强大的，有用的命令行包管理器系统

Debian 的用户 或他的衍生版 例如 Ubuntu 和 Linux Mint 在包管理工具上非常的相似

想要了解他是如何工作的，你可以去看面这些 HOW TO 指南

不要错过: [15 Examples of How to Use New Advanced Package Tool (APT) in Ubuntu/Debian][2]

不要错过: [25 Useful Basic Commands of APT-GET and APT-CACHE for Package Management][3]

#### Aptitude 包管理器

这个也是 Debian Linux 家族一个非常出名的命令行前端包管理工具,它工作很像 APT ，它们之间有很多比较，但是测试可以让你明白那个工作的更好。

它最初为 Debian 和它的衍生版设计的，但是现在它的功能延伸到 RHEL 家族.你可以参考这个指南了解更多关于 APT 和 Aptitude.

不要错过: [What is APT and Aptitude? and What’s real Difference Between Them?][4]

#### Synaptic 包管理器

Synaptic是一个基于GTK+的APT的可视化包管理器，对于一些不想使用命令行的用户，它非常好用。

### 2. RPM (红帽包管理器)

这个是红帽创建的Linux 基础打包格式和包管理系统。基于底层的系统，你可以使用的多个前端包管理工具，但我们应该只看那些最好的，比如：

#### YUM (Yellowdog Updater, Modified)

这个是一个作为对用户的 RPM 管理接口的开源、流行的命令行包管理器。你可以把它和 Debian Linux 系统中的 APT 进行对比，它和 APT 拥有相同的功能。你可以从这个 How to 指南中的例子更加清晰的理解YUM
不要错过: [20 Linux YUM Commands for Package Management][5]

#### DNF – 优美的 Yum

这个也是一个基于RPM的发行版的包管理器，Fedora 18 引入了它，它是下一代YUM。

如果你用 Fedora 22 或更新，你需要意识到，它是默认的包管理器.这里有一些链接，将为你提供更多关于 DNF 的信息和如何使用它。

不要错过: [DNF – The Next Generation Package Management for RPM Based Distributions][6]

不要错过: [27 ‘DNF’ Commands Examples to Manage Fedora Package Management][7]

### 3. Pacman 包管理器 – Arch Linux

这个是一个流行而且强大的包管理器，它服务于 Arch Linux 和其他的一些小众发行版。它提供了一些其他包管理器提供的基本功能，包括安装、升级、卸载和降级软件。

但是很有效果，它为 Arch 用户 创建了一个简单易用的包管理方式。你可以阅读 [Pacman overview][8]，它会解释上面提到的一些功能。

### 4. Zypper 包管理器 – openSUSE

这个是一个使用 libzypp 库制作的用于 OpenSUSE 系统上的命令行包管理器,它的功能包括访问仓库、安装包、解决依赖问题和其他功能。

更重要的是，它也可以处理存储库扩展，如模式、补丁和产品。新的 OpenSUSE 用户可以参考下面的链接来掌控它。

不要错过: [45 Zypper Commands to Master OpenSUSE Package Management][9]

### 5. Portage 包管理器 – Gentoo

这个是 Gentoo 的包管理器，当下不怎么流行的一个发行版，但是这并不阻止他是 Linux 下最好的软件包管理器之一。

Portage项目的主要目标是创建一个简单、无故障的包含向后兼容、自动化等功能的包管理系统。

如果希望理解的更清晰，可以看下： [Portage project page][10].

### 结束语

正如我在开始时提到的，这个指南的主要意图是给 Linux 用户提供一个最好的包管理器的列表，但知道如何使用它们可以通过下面提供的重要的链接和尝试测试它们。

不同发行版的用户将学习超出他们本身的来理解上述提到的不同的包管理器。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-package-managers/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+tecmint+%28Tecmint%3A+Linux+Howto%27s+Guide%29

作者：[Ravi Saive][a]
译者：[Bestony](https://github.com/bestony)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/admin/
[1]: http://www.tecmint.com/dpkg-command-examples/
[2]: http://www.tecmint.com/apt-advanced-package-command-examples-in-ubuntu/
[3]: http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[4]: http://www.tecmint.com/difference-between-apt-and-aptitude/
[5]: http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[6]: http://www.tecmint.com/dnf-next-generation-package-management-utility-for-linux/
[7]: http://www.tecmint.com/dnf-commands-for-fedora-rpm-package-management/
[8]: https://wiki.archlinux.org/index.php/Pacman
[9]: http://www.tecmint.com/zypper-commands-to-manage-suse-linux-package-management/
[10]: https://wiki.gentoo.org/wiki/Project:Portage
