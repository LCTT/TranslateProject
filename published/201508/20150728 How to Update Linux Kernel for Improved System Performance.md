如何更新 Linux 内核来提升系统性能
================================================================================
![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/update-linux-kernel-644x373.jpg?2c3c1f)

目前的 [Linux 内核][1]的开发速度是前所未有的，大概每2到3个月就会有一个主要的版本发布。每个发布都带来几个的新的功能和改进，可以让很多人的处理体验更快、更有效率、或者其它的方面更好。

问题是，你不能在这些内核发布的时候就用它们，你要等到你的发行版带来新内核的发布。我们先前讲到[定期更新内核的好处][2]，所以你不必等到那时。让我们来告诉你该怎么做。

> 免责声明: 我们先前的一些文章已经提到过，升级内核有（很小）的风险可能会破坏你系统。如果发生这种情况，通常可以通过使用旧内核来使系统保持工作，但是有时还是不行。因此我们对系统的任何损坏都不负责，你得自己承担风险！

### 预备工作 ###

要更新你的内核，你首先要确定你使用的是32位还是64位的系统。打开终端并运行：

    uname -a

检查一下输出的是 x86\_64 还是 i686。如果是 x86\_64，你就运行64位的版本，否则就运行32位的版本。千万记住这个，这很重要。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/linux_kernel_arch.jpg?2c3c1f)

接下来，访问[官方的 Linux 内核网站][3]，它会告诉你目前稳定内核的版本。愿意的话，你可以尝试下发布预选版（RC），但是这比稳定版少了很多测试。除非你确定想要需要发布预选版，否则就用稳定内核。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/kernel_latest_version.jpg?2c3c1f)

### Ubuntu 指导 ###

对 Ubuntu 及其衍生版的用户而言升级内核非常简单，这要感谢 Ubuntu 主线内核 PPA。虽然，官方把它叫做 PPA，但是你不能像其他 PPA 一样将它添加到你软件源列表中，并指望它自动升级你的内核。实际上，它只是一个简单的网页，你应该浏览并下载到你想要的内核。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/ubuntu_new_kernels.jpg?2c3c1f)

现在，访问这个[内核 PPA 网页][4]，并滚到底部。列表的最下面会含有最新发布的预选版本（你可以在名字中看到“rc”字样），但是这上面就可以看到最新的稳定版（说的更清楚些，本文写作时最新的稳定版是4.1.2。LCTT 译注：这里虽然 4.1.2 是当时的稳定版，但是由于尚未进入 Ubuntu 发行版中，所以文件夹名称为“-unstable”）。点击文件夹名称，你会看到几个选择。你需要下载 3 个文件并保存到它们自己的文件夹中（如果你喜欢的话可以放在下载文件夹中），以便它们与其它文件相隔离： 

1. 针对架构的含“generic”（通用）的头文件（我这里是64位，即“amd64”）
2. 放在列表中间，在文件名末尾有“all”的头文件
3. 针对架构的含“generic”内核文件（再说一次，我会用“amd64”，但是你如果用32位的，你需要使用“i686”）

你还可以在下面看到含有“lowlatency”（低延时）的文件。但最好忽略它们。这些文件相对不稳定，并且只为那些通用文件不能满足像音频录制这类任务想要低延迟的人准备的。再说一次，首选通用版，除非你有特定的任务需求不能很好地满足。一般的游戏和网络浏览不是使用低延时版的借口。

你把它们放在各自的文件夹下，对么？现在打开终端，使用`cd`命令切换到新创建的文件夹下，如

    cd /home/user/Downloads/Kernel

接着运行：

    sudo dpkg -i *.deb

这个命令会标记文件夹中所有的“.deb”文件为“待安装”，接着执行安装。这是推荐的安装方法，因为不可以很简单地选择一个文件安装，它总会报出依赖问题。这这样一起安装就可以避免这个问题。如果你不清楚`cd`和`sudo`是什么。快速地看一下 [Linux 基本命令][5]这篇文章。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/ubuntu_install_kernel.jpg?2c3c1f)

安装完成后，**重启**你的系统，这时应该就会运行刚安装的内核了！你可以在命令行中使用`uname -a`来检查输出。

### Fedora 指导 ###

如果你使用的是 Fedora 或者它的衍生版，过程跟 Ubuntu 很类似。不同的是文件获取的位置不同，安装的命令也不同。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/fedora_new_kernels.jpg?2c3c1f)

查看 [最新 Fedora 内核构建][6]列表。选取列表中最新的稳定版并翻页到下面选择 i686 或者 x86_64 版。这取决于你的系统架构。这时你需要下载下面这些文件并保存到它们对应的目录下（比如“Kernel”到下载目录下）：

- kernel
- kernel-core
- kernel-headers
- kernel-modules
- kernel-modules-extra
- kernel-tools
- perf 和 python-perf （可选）

如果你的系统是 i686（32位）同时你有 4GB 或者更大的内存，你需要下载所有这些文件的 PAE 版本。PAE 是用于32位系统上的地址扩展技术，它允许你使用超过 3GB 的内存。

现在使用`cd`命令进入文件夹，像这样

    cd /home/user/Downloads/Kernel

接着运行下面的命令来安装所有的文件

    yum --nogpgcheck localinstall *.rpm

最后**重启**你的系统，这样你就可以运行新的内核了！

#### 使用 Rawhide ####

另外一个方案是，Fedora 用户也可以[切换到 Rawhide][7]，它会自动更新所有的包到最新版本，包括内核。然而，Rawhide 经常会破坏系统（尤其是在早期的开发阶段中），它**不应该**在你日常使用的系统中用。

### Arch 指导 ###

[Arch 用户][8]应该总是使用的是最新和最棒的稳定版（或者相当接近的版本）。如果你想要更接近最新发布的稳定版，你可以启用测试库提前2到3周获取到主要的更新。

要这么做，用[你喜欢的编辑器][9]以`sudo`权限打开下面的文件

    /etc/pacman.conf

接着取消注释带有 testing 的三行（删除行前面的#号）。如果你启用了 multilib 仓库，就把 multilib-testing 也做相同的事情。如果想要了解更多参考[这个 Arch 的 wiki 界面][10]。

升级内核并不简单（有意这么做的），但是这会给你带来很多好处。只要你的新内核不会破坏任何东西，你可以享受它带来的性能提升，更好的效率，更多的硬件支持和潜在的新特性。尤其是你正在使用相对较新的硬件时，升级内核可以帮助到你。


**怎么升级内核这篇文章帮助到你了么？你认为你所喜欢的发行版对内核的发布策略应该是怎样的？**。在评论栏让我们知道！

--------------------------------------------------------------------------------

via: http://www.makeuseof.com/tag/update-linux-kernel-improved-system-performance/

作者：[Danny Stieben][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.makeuseof.com/tag/author/danny/
[1]:http://www.makeuseof.com/tag/linux-kernel-explanation-laymans-terms/
[2]:http://www.makeuseof.com/tag/5-reasons-update-kernel-linux/
[3]:http://www.kernel.org/
[4]:http://kernel.ubuntu.com/~kernel-ppa/mainline/
[5]:http://www.makeuseof.com/tag/an-a-z-of-linux-40-essential-commands-you-should-know/
[6]:http://koji.fedoraproject.org/koji/packageinfo?packageID=8
[7]:http://www.makeuseof.com/tag/bleeding-edge-linux-fedora-rawhide/
[8]:http://www.makeuseof.com/tag/arch-linux-letting-you-build-your-linux-system-from-scratch/
[9]:http://www.makeuseof.com/tag/nano-vs-vim-terminal-text-editors-compared/
[10]:https://wiki.archlinux.org/index.php/Pacman#Repositories
