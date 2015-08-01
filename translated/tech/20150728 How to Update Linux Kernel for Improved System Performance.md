如何更新Linux内核提升系统性能
================================================================================
![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/update-linux-kernel-644x373.jpg?2c3c1f)

[Linux内核][1]内核的开发速度目前是空前，大概每2到3个月就会有一个主要的版本发布。每个发布都带来让很多人的计算更加快、更加有效率、或者更好的功能和提升。

问题是你不能在这些内核发布的时候就用它们-你要等到你的发行版带来新内核的发布。我们先前发布了[定期更新内核的好处][2]，你不必等到那时。我们会向你展示该怎么做。

> 免责声明: 我们先前的一些文章已经提到过，升级内核会带来(很小的)破坏你系统的风险。在这种情况下，通常可以通过旧内核来使系统工作，但是有时还是不行。因此我们对系统的任何损坏都不负责-你自己承担风险！

### 预备工作 ###

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/linux_kernel_arch.jpg?2c3c1f)

要更新你的内核，你首先要确定你使用的是32位还是64位的系统。打开终端并运行：

    uname -a

检查一下输出的是x86_64还是i686。如果是x86_64，你就运行64位的版本，否则就运行32位的版本。记住这个因为这个很重要。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/kernel_latest_version.jpg?2c3c1f)

接下来，访问[官方Linux内核网站][3]，它会告诉你目前稳定内核的版本。如果你喜欢你可以尝试发布预选版，但是这比稳定版少了很多测试。除非你确定想要用发布预选版否则就用稳定内核。

### Ubuntu指导 ###

对Ubuntu及其衍生版的用户而言升级内核非常简单，这要感谢Ubuntu主线内核PPA。虽然，官方称为一个PPA。但是你不能像其他PPA一样用来添加它到你软件源列表中，并指望它自动升级你的内核。而它只是一个简单的网页，你可以下载到你想要的内核。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/ubuntu_new_kernels.jpg?2c3c1f)

现在，访问[内核PPA网页][4]，并滚到底部。列表的最下面会含有最新发布的预选版本（你可以在名字中看到“rc”字样），但是这上面就可以看到最新的稳定版（为了更容易地解释这个，这时最新的稳定版是4.1.2）。点击它，你会看到几个选项。你需要下载3个文件并保存到各自的文件夹中（如果你喜欢的话可以在下载文件夹中），这样就可以将它们相互隔离了: 

- 针对架构的含“generic”的头文件（我这里是64位或者“amd64”）
- 中间的头文件在文件名末尾有“all”
- 针对架构的含“generic”内核文件（再说一次，我会用“amd64”，但是你如果用32位的，你需要使用“i686”）

你会看到还有含有“lowlatency”的文件可以下面。但最好忽略它们。这些文件相对不稳定，并且只为那些通用文件不能满足像录音这类任务想要低延迟的人准备的。再说一次，首选通用版除非你特定的任务需求不能很好地满足。一般的游戏和网络浏览不是使用低延时版的借口。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/ubuntu_install_kernel.jpg?2c3c1f)

你把它们放在各自的文件夹下，对么？现在打开终端，使用

    cd

命令到新创建的文件夹下，像

    cd /home/user/Downloads/Kernel

接着运行：

    sudo dpkg -i *.deb

这个命令会标记所有文件夹的“.deb”文件为“待安装”，接着执行安装。这是推荐的安装放大，因为除非可以很简单地选择一个文件安装，它总会报出依赖问题。这个方法可以避免这个问题。如果你不清楚cd和sudo是什么。快速地看一下[Linux基本命令][5]这篇文章。

安装完成后，**重启**你的系统，这时应该就会运行刚安装的内核了！你可以在命令行中使用uname -a来检查输出。

### Fedora指导 ###

如果你使用的是Fedora或者它的衍生版，过程跟Ubuntu很类似。不同的是文件获取的位置不同，安装的命令也不同。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/07/fedora_new_kernels.jpg?2c3c1f)

查看[Fedora最新内核编译][6]列表。选取列表中最新的稳定版并滚到下面选择i686或者x86_64版。这依赖于你的系统架构。这时你需要下载下面这些文件并保存到它们对应的目录下（比如“Kernel”到下载目录下）：

- kernel
- kernel-core
- kernel-headers
- kernel-modules
- kernel-modules-extra
- kernel-tools
- perf and python-perf (optional)

如果你的系统是i686（32位）同时你有4GB或者更大的内存，你需要下载所有这些文件的PAE版本。PAE是用于32位的地址扩展技术上，它允许你使用3GB的内存。

现在使用

    cd

命令进入文件夹，像这样

    cd /home/user/Downloads/Kernel

and then run the following command to install all the files:
接着运行下面的命令来安装所有的文件

    yum --nogpgcheck localinstall *.rpm

最后**重启**你的系统，这样你就可以运行新的内核了！

### 使用 Rawhide ###

另外一个方案是，Fedora用户也可以[切换到Rawhide][7]，它会自动更新所有的包到最新版本，包括内核。然而，Rawhide经常会破坏系统（尤其是在早期的开发版中），它**不应该**在你日常使用的系统中用。

### Arch指导 ###

[Arch][8]应该总是使用的是最新和最棒的稳定版（或者相当接近的版本）。如果你想要更接近最新发布的稳定版，你可以启用测试库提前2到3周获取到主要的更新。

要这么做，用[你喜欢的编辑器][9]以sudo权限打开下面的文件

    /etc/pacman.conf

接着取消注释带有testing的三行（删除行前面的井号）。如果你想要启用multilib仓库，就把multilib-testing也做相同的事情。如果想要了解更多参考[这个Arch的wiki界面][10]。

升级内核并不简单（有意这么做），但是这会给你带来很多好处。只要你的新内核不会破坏任何东西，你可以享受它带来的性能提升，更好的效率，支持更多的硬件和潜在的新特性。尤其是你正在使用相对更新的硬件，升级内核可以帮助到它。


**怎么升级内核这篇文章帮助到你了么？你认为你所喜欢的发行版对内核的发布策略应该是怎样的？**。在评论栏让我们知道！

--------------------------------------------------------------------------------

via: http://www.makeuseof.com/tag/update-linux-kernel-improved-system-performance/

作者：[Danny Stieben][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

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
