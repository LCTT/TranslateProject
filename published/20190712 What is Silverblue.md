[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12153-1.html)
[#]: subject: (What is Silverblue?)
[#]: via: (https://fedoramagazine.org/what-is-silverblue/)
[#]: author: (Tomáš Popela https://fedoramagazine.org/author/tpopela/)

Silverblue 是什么？
======

![][1]

Fedora Silverblue 在 Fedora 世界内外越来越受欢迎。因此，根据社区的反馈，以下是关于这个项目的一些有趣问题的答案。如果你有任何其他与 Silverblue 相关的问题，请在评论区留言，我们会在未来的文章中回答。

### Silverblue 是什么？

Silverblue 是新一代桌面操作系统的代号，之前被称为 Atomic Workstation。该操作系统是通过利用 [rpm-ostree 项目][2]创建的映像来交付的。这种系统的主要优点是速度、安全性、原子更新和不变性。

### “Silverblue” 到底是什么意思？

“Team Silverblue” 或简称 “Silverblue”，没有任何隐藏的含义。该项目以前被称为 Atomic Workstation，大约两个月后更名时选中了这个名字。在这个过程中，审查过 150 多个单词或单词组合。最终选择了 “Silverblue”，因为它有一个可用的域名以及社交网络账号。人们可以把它看成是 Fedora 的蓝色品牌的一个新的品牌形象，可以用在诸如“加油，Silverblue 团队！”或“想加入该团队，改进 Silverblue 吗？”这样的短语中。

### 何谓 ostree？

[OSTree（或 libostree）是一个项目][3]，它结合了一个类似 Git 的提交和下载可引导文件系统树的模型，以及用于部署它们和管理引导加载程序配置的层。OSTree 由 rpm-ostree 使用，这是 Silverblue 使用的一个基于包/镜像的混合系统。它原子化地复制了一个基础操作系统，并允许用户在需要时在基础操作系统之上“层叠”传统的 RPM。

### 为何使用 Silverblue？

因为它可以让你专注于你的工作，而不是你正在运行的操作系统。因为系统的更新是原子式的，所以它更稳健。你唯一需要做的事情就是重新启动到新的镜像中。此外，如果当前启动的镜像有什么问题，你可以很容易地重启/回滚到之前可以工作的镜像，如果有的话。如果没有，你可以使用 `ostree` 命令下载并启动过去生成的任何其他镜像。

另一个好处是可以在不同的分支（或者用旧的语境说就是不同的 Fedora 风味版本）之间轻松切换。你可以轻松地尝试 [Rawhide][4] 或 [updates-testing][5] 分支，然后返回到包含当前稳定版本的分支。另外，如果你想尝试一些新奇的东西，也可以考虑试试 Silverblue。

### 不可变的操作系统有什么好处？

其中一个主要的好处是安全。基础操作系统是以只读的形式挂载的，因此不能被恶意软件修改。唯一可以改变系统的方法是通过 `rpm-ostree` 实用程序。

另一个好处是健壮性。普通用户几乎不可能在不小心或无意中删除了一些系统库后，导致操作系统回到不启动或无法正常工作的状态。试着想想你过去的这些经历，就可以明白 Silverblue 可以如何帮助你。

### 如何在 Silverblue 中管理应用程序和包？

对于图形化用户界面的应用程序，建议使用 [Flatpak][6] —— 如果应用程序是以 Flatpak 的形式提供的话。用户可以选择来自 Fedora 的 Flatpak，和从 Fedora 包及 Fedora 自己的基础架构中构建的  Flatpak，或者是目前有更广泛的交付品的 Flathub。用户可以通过已经支持 Fedora Silverblue 的 GNOME “软件”轻松安装它们。

用户首先发现的一件事就是操作系统中没有预装 `dnf`。主要原因是它不能在 Silverblue 上工作 —— 它的部分功能被 `rpm-ostree` 命令所取代。用户可以通过使用 `rpm-ostree install PACKAGE` 来层叠传统的软件包。但只有在没有其他方法的情况下，才应该使用这种方式。这是因为从存储库中提取新的系统镜像时，每次更改系统镜像时都必须重新构建系统镜像，以容纳层叠的包或从基础操作系统中删除及替换为其他版本的包。

Fedora Silverblue 自带的默认 GUI 应用程序集是基础操作系统的一部分。团队正在努力将它们移植到 Flatpak 上，这样它们就可以通过这种方式分发。其中一个好处是，基础操作系统将变得更小，更容易维护和测试，用户可以更容易修改他们的默认安装环境。如果你想看一下它是怎么做的，或者有什么帮助，可以看看官方的[文档][7]。

### 什么是 Toolbox？

[Toolbox][8] 是一个让普通用户可以轻松使用容器的项目。它通过使用 podman 的无 root 容器环境来实现。Toolbox 可以让你在常规的 Fedora 环境中轻松、快速地创建一个容器，你可以在这个容器上折腾或开发，而与你的操作系统分离。

### Silverblue 有路线图吗？

形式上没有，因为我们正在关注在测试过程中发现的问题和社区的反馈。我们目前正在使用 Fedora 的 [Taiga][9] 来进行规划。

### Silverblue 的发布周期是多少？

它和普通的 Fedora Workstation 是一样的。每 6 个月发布一次新版本，支持期为 13 个月。团队计划每两周（或更长时间）发布一次更新，而不是像现在这样每天发布一次。这样一来，更新可以在发送给其他用户之前，由 QA 和社区志愿者进行更彻底的测试。

### 不可变操作系统的未来前景如何？

从我们的角度来看，桌面的未来会走向到不可变的操作系统。这对用户来说是最安全的，Android、ChromeOS、ChromeOS、最近的 macOS Catalina 全都在底层采用了这种方式。而对于 Linux 桌面来说，一些第三方软件期望写到操作系统的问题还是存在的。HP 打印机驱动程序就是一个很好的例子。

另一个问题是系统中的部分软件如何分发和安装。字体就是一个很好的例子。目前在 Fedora 中，它们是以 RPM 包的形式分发的。如果你想使用它们，你必须层叠它们，然后重新启动到新创建的包含它们的镜像中。

### 标准版 Workstation 的前景如何？

Silverblue 有可能会取代普通的 Workstation 版本。但 Silverblue 要提供与 Workstation 版本相同的功能和用户体验还有很长的路要走。在此期间，这两款桌面产品将同时推出。

### Atomic Workstation 或 Fedora CoreOS 与这些有什么关系？

Atomic Workstation 是在更名为 Fedora Silverblue 之前的项目名称。

Fedora CoreOS 是一个不同但相似的项目。它与 Silverblue 共享一些基本技术，如 `rpm-ostree`、`toolbox` 等。尽管如此，CoreOS 是一个更简约、专注于容器、自动更新的操作系统。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/what-is-silverblue/

作者：[Tomáš Popela][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/tpopela/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/07/what-is-fedora-silverblue-816x345.jpg
[2]: https://rpm-ostree.readthedocs.io/en/latest/
[3]: https://ostree.readthedocs.io/en/latest/
[4]: https://fedoraproject.org/wiki/Releases/Rawhide
[5]: https://fedoraproject.org/wiki/QA:Updates_Testing
[6]: https://flatpak.org/
[7]: https://docs.fedoraproject.org/en-US/flatpak/tutorial/
[8]: https://github.com/debarshiray/toolbox
[9]: https://teams.fedoraproject.org/project/silverblue/
