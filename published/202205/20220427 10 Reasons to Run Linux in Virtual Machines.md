[#]: subject: "10 Reasons to Run Linux in Virtual Machines"
[#]: via: "https://itsfoss.com/why-linux-virtual-machine/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "PeterPan0106"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14541-1.html"

在虚拟机中运行 Linux 的十大优点
======

![](https://img.linux.net.cn/data/attachment/album/202205/04/093523wlzslifl2cp9papp.jpg)

> 你可以在虚拟机环境里运行任何操作系统，不论是测试还是为了某种需要。

对于 Linux 而言，它在虚拟环境下的性能会优于其他操作系统。即便你可能会犹豫是否在物理机（裸金属）上安装 Linux 系统，你仍然可以在虚拟机中安装一个性能几乎和物理机一样好的 Linux 系统。

当然，这并不意味着宿主系统为 Linux 时你就不能在虚拟机实例中安装 Linux 了。

更何况，你在虚拟环境下使用 Linux 系统有许多好处。大致如下。

### 在虚拟环境下运行 Linux 之前的注意事项

在虚拟环境下运行 Linux 或许并不是艰巨的任务，但仍有以下几点你需谨记。

* 虚拟机的性能取决于宿主机的性能，如果你并没有足够的系统资源分配给虚拟机，那么虚拟机的使用体验注定不会很好。
* 某些特性仅在物理机（裸金属）上生效，包括硬件加速以及图形（显卡）驱动等。
* 密集的磁盘 I/O 任务性能会十分受限，例如游戏测试场景。
* 用户的 Linux 虚拟机实例体验会根据你所使用的虚拟化程序而发生变化，这些虚拟化程序包括 VMware、VirtualBox、GNOME Boxes 以及 Hyper-V 。

此外，你应当列出你的需求，并根据这些需求选定适当的虚拟化程序来运行你的 Linux 实例。

### 十条在虚拟环境中运行 Linux 的优点

尽管运行虚拟化 Linux 实例极具吸引力，你仍然应当首先考虑当前使用的宿主系统中已有的选择。例如，如果你不需要图形化桌面，或许利用 Windows 操作系统中的 [WSL 安装 Linux][1] 就可以满足你的需求。

一旦你确定了使用虚拟机，那么这些优点将会如影随形：

#### 1、部署简便

![部署简便][2]

与在传统物理机（裸金属）上安装 Linux 相比，在虚拟机中部署一般会容易许多。

对于基于 Ubuntu 的发行版而言，像 VMware 这样的虚拟化程序会提供一个 **快速安装** 的选项，你仅需输入用户名和密码，其余过程将自动完成而无需其他操作。你无需手动设置分区、引导程序以及更多高级设置。

某些情况下，一些发行版的开发者会同时提供针对特定虚拟机的预构建镜像，只需打开就可使用。这就好像一个便携式虚拟机镜像，随时可以开箱即用。

例如，在 [这里][3] 你将看到如何在虚拟机中安装 Arch Linux 发行版。

对于其他的发行版，你或许仍需要进行一些配置，但一般都会有快速安装的选项令你可以轻松部署。

#### 2、不会影响宿主机

![不会影响宿主机][4]

对于虚拟机，你可以更为随心所欲地使用，因为虚拟机系统和宿主机系统是隔离的。

很多时候，如果你并不熟悉 Linux 系统，你很可能会把配置弄得十分混乱。

所以在虚拟机里，你可以随意尝试而无需担心是否会影响到宿主机系统。换句话说，任何虚拟机的操作都不会影响到宿主机，因为它们是完全隔离的。

故此，虚拟机是你最好的试验场，尤其是对于一些激进或具有破坏性的试验。

#### 3、资源可高效共享

![资源可高效共享][5]

如果你有十分充裕的系统资源，你可以使用虚拟机运行其他任务，从而充分利用起来这部分闲置的系统资源。例如，如果你需要一个十分私密的浏览环境，虚拟机将为你阻挡一切针对宿主机的追踪器。

这可能略显牵强，但这仅仅是一个例子。基于这样的想法你将可以充分利用全部的系统资源。

而对于双启动方案，你需要在单独的磁盘上在 Windows [之后安装 Linux][6]，或者在 Linux [之后安装 Windows][7]，你需要为你的任务锁定相应的资源。

但利用虚拟机，你无需锁定部分资源也可以使用 Linux ，也不必为了特定的任务而临时共享资源，这样会方便许多。

#### 4、多任务体验更好

![多任务体验更好][8]

有了资源共享机制，多任务会前所未有的容易。

在双启动的场景下，你需要来回重启切换才能使用 Linux 或 Windows 。

但如果使用虚拟机，你几乎不再需要 [双启动][9]，两个系统将无缝协作并完成多任务。

当然，你需要确认你拥有足够的系统资源和额外的硬件（例如双显示器）来更高效地使用。而多任务的潜力也因 Linux 虚拟机的存在而愈发强大。

#### 5、软件测试更为便捷

有了虚拟化，你将可以创建大量的 Linux 实例，来模拟特定的使用场景，并对软件进行测试。

例如，你可以在不同的 Linux 虚拟机中同步测试不同的软件版本。这有丰富的使用场景，包括对开发版软件进行测试以及 Linux 发行版的早期测试等等。

#### 6、开发更为便捷

![开发更为便捷][10]

当你在学习编程或者刚加入一个软件项目的开发的时候，你会希望拥有一个没有任何冲突和错误的开发环境。

在 Linux 虚拟机里，你可以从零开始搭建一个不会与已经存在的环境冲突的开发环境。例如，你可以在 Ubuntu 上 [安装并测试 Flutter][11] 。

如果环境出了问题，你可以轻而易举地删掉这个虚拟机，并重新开始来修正错误。

Linux 虚拟机的隔离环境是一个绝佳的开发和测试环境。

#### 7、学习和研究的好帮手

Linux 值得反复探索。除了基础的计算任务，你可以做许多其他的事情。

你可以学习如何修改你的用户界面，[尝试一些常见的桌面环境][12] 、[安装大量常用软件][13] ，与此同时仍能让一切处于掌控之中。

如果出现问题，新建一个 Linux 虚拟机就可以解决。当然，这并不仅限于日常使用需要，还可以启发系统管理员在其中测试他们所学的知识。

#### 8、更容易复制和迁移

虚拟机可以很容易地复制和迁移。只要其它的宿主机系统支持该虚拟化程序，你就可以很容易地迁移它，而没有特别要求。

不论因何原因，几次简单的点击就可以完成复制和迁移的任务。

#### 9、尝试大量的发行版

![尝试大量的发行版][14]

你可以在虚拟环境下尝试数以百计的 Linux 发行版。

你或许会认为这和第七条重复了，但是我相信，测试一个发行版是一个巨大的系统性工程，尤其是当你决定切换发行版做为宿主机或其他用途时。

#### 10、便于调试

不论是严肃的开发活动还是一般的研究，在隔离的虚拟环境中调试和除错相对而言会更简单。

你可以快速尝试大量的调试方法而无需考虑影响。同时，如果你的宿主机是 Linux 系统的话，无需宿主机上的 root 权限便可以访问和修改虚拟机中的配置文件。

### 总而言之

如果你不熟悉正在使用的系统或者依赖不同的操作系统工作，虚拟机将是协助你工作的一大利器。

Linux 虚拟机可以广泛用于开发、学习、试验或任何特定用途。

你在虚拟机中使用过 Linux 吗？都有哪些应用场景呢？欢迎留言评论！

--------------------------------------------------------------------------------

via: https://itsfoss.com/why-linux-virtual-machine/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[PeterPan0106](https://github.com/PeterPan0106)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/install-bash-on-windows/
[2]: https://itsfoss.com/wp-content/uploads/2022/04/easy-setup-linux-vm.jpg
[3]: https://itsfoss.com/install-arch-linux-virtualbox/
[4]: https://itsfoss.com/wp-content/uploads/2022/04/isolated-linux-vm.jpg
[5]: https://itsfoss.com/wp-content/uploads/2022/04/sharing-resources-linux-vm.jpg
[6]: https://itsfoss.com/dual-boot-hdd-ssd/
[7]: https://itsfoss.com/install-windows-after-ubuntu-dual-boot/
[8]: https://itsfoss.com/wp-content/uploads/2022/04/multitasking-linux-vm.jpg
[9]: https://itsfoss.com/dual-boot-fedora-windows/
[10]: https://itsfoss.com/wp-content/uploads/2022/04/development-linux-vm.jpg
[11]: https://itsfoss.com/install-flutter-linux/
[12]: https://itsfoss.com/best-linux-desktop-environments/
[13]: https://itsfoss.com/essential-linux-applications/
[14]: https://itsfoss.com/wp-content/uploads/2022/04/distros-linux-vm.jpg
