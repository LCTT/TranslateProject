5 个给 Linux 新手的最佳包管理器
=====================================================

一个 Linux 新用户应该知道他或她的进步源自于对 Linux 发行版的使用，而 Linux 发行版有好几种，并以不同的方式管理软件包。

在 Linux 中，包管理器非常重要，知道如何使用多种包管理器可以让你像一个高手一样活得很舒适，从在仓库下载软件、安装软件，到更新软件、处理依赖和删除软件是非常重要的，这也是Linux 系统管理的一个重要部分。

![](http://www.tecmint.com/wp-content/uploads/2016/06/Best-Linux-Package-Managers.png)

*最好的Linux包管理器*

成为一个 Linux 高手的一个标志是了解主要的 Linux 发行版如何处理包，在这篇文章中，我们应该看一些你在 Linux 上能找到的最佳的包管理器，

在这里，我们的主要重点是关于一些最佳包管理器的相关信息，但不是如何使用它们，这些留给你亲自发现。但我会提供一些有意义的链接，使用指南或更多。

### 1. DPKG - Debian 包管理系统（Debian Package Management System）

Dpkg 是 Debian Linux 家族的基础包管理系统，它用于安装、删除、存储和提供`.deb`包的信息。

这是一个低层面的工具，并且有多个前端工具可以帮助用户从远程的仓库获取包，或处理复杂的包关系的工具，包括如下：

- 参考：[15 个用于基于 Debian 的发行版的 “dpkg” 命令实例][1]

#### APT (高级打包工具（Advanced Packaging Tool）)

这个是一个 dpkg 包管理系统的前端工具，它是一个非常受欢迎的、自由而强大的，有用的命令行包管理器系统。

Debian 及其衍生版，例如 Ubuntu 和 Linux Mint 的用户应该非常熟悉这个包管理工具。

想要了解它是如何工作的，你可以去看看下面这些 HOW TO 指南：

- 参考：[15 个怎样在 Ubuntu/Debian 上使用新的 APT 工具的例子][2]
- 参考：[25 个用于包管理的有用的 APT-GET 和 APT-CACHE 的基础命令][3]

#### Aptitude 包管理器

这个也是 Debian Linux 家族一个非常出名的命令行前端包管理工具，它工作方式类似 APT ，它们之间有很多可以比较的地方，不过，你应该两个都试试才知道哪个工作的更好。

它最初为 Debian 及其衍生版设计的，但是现在它的功能延伸到 RHEL 家族。你可以参考这个指南了解更多关于 APT 和 Aptitude。

- 参考：[APT 和 Aptitude 是什么？它们知道到底有什么不同？][4]

#### Synaptic 包管理器

Synaptic是一个基于GTK+的APT的可视化包管理器，对于一些不想使用命令行的用户，它非常好用。

### 2. RPM 红帽包管理器（Red Hat Package Manager）

这个是红帽创建的 Linux 基本标准（LSB）打包格式和基础包管理系统。基于这个底层系统，有多个前端包管理工具可供你使用，但我们应该只看那些最好的，那就是：

#### YUM （黄狗更新器，修改版（Yellowdog Updater, Modified））

这个是一个开源、流行的命令行包管理器，它是用户使用 RPM 的界面（之一）。你可以把它和 Debian Linux 系统中的 APT 进行对比，它和 APT 拥有相同的功能。你可以从这个 HOW TO 指南中的例子更加清晰的理解YUM：

- 参考：[20 个用于包管理的 YUM 命令][5]

#### DNF（优美的 Yum（Dandified Yum））

这个也是一个用于基于 RPM 的发行版的包管理器，Fedora 18 引入了它，它是下一代 YUM。

如果你用 Fedora 22 及更新版本，你肯定知道它是默认的包管理器。这里有一些链接，将为你提供更多关于 DNF 的信息和如何使用它。

- 参考：[DNF - 基于 RPM 的发行版的下一代通用包管理软件][6]
- 参考： [27 个管理 Fedora 软件包的 ‘DNF’ 命令例子][7]

### 3. Pacman 包管理器 – Arch Linux

这个是一个流行的、强大而易用的包管理器，它用于 Arch Linux 和其他的一些小众发行版。它提供了一些其他包管理器提供的基本功能，包括安装、自动解决依赖关系、升级、卸载和降级软件。

但是最大的用处是，它为 Arch 用户创建了一个简单易用的包管理方式。你可以阅读 [Pacman 概览][8]，它会解释上面提到的一些功能。

### 4. Zypper 包管理器 – openSUSE

这个是一个使用 libzypp 库制作的用于 OpenSUSE 系统上的命令行包管理器，它的常用功能包括访问仓库、安装包、解决依赖问题和其他功能。

更重要的是，它也可以支持存储库扩展功能，如模式、补丁和产品。新的 OpenSUSE 用户可以参考下面的链接来掌控它。

- 参考：[45 个让你精通 openSUSE 包管理的 Zypper 命令][9]

### 5. Portage 包管理器 – Gentoo

这个是 Gentoo 的包管理器，当下不怎么流行的一个发行版，但是这并不阻止它成为 Linux 下最好的软件包管理器之一。

Portage 项目的主要目标是创建一个简单、无故障的包管理系统，包含向后兼容、自动化等功能。

如果希望理解的更清晰，可以看下： [Portage 项目页][10]。

### 结束语

正如我在开始时提到的，这个指南的主要意图是给 Linux 用户提供一个最佳软件包管理器的列表，但知道如何使用它们可以通过其后提供的重要的链接，并实际去试试它们。

各个发行版的用户需要学习超出他们的发行版之外的一些东西，才能更好理解上述提到的这些不同的包管理器。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-package-managers/

作者：[Ravi Saive][a]
译者：[Bestony](https://github.com/bestony)
校对：[wxy](https://github.com/wxy)

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
