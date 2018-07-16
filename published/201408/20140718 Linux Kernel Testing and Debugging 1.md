Linux 内核的测试和调试（1）
================================================================================
### Linux 内核测试哲学  ###

不管是开源还是闭源，所有软件的开发流程中，测试是一个重要的、不可或缺的环节，Linux 内核也不例外。开发人员自测、系统测试、回归测试、压力测试，都有各自不同的目的，但是从更高一个层次上看，这些测试的最终目的又是一样的：保证软件能一直运行下去，当有新功能加进去时，要保证新功能可以正常工作。

在软件释出 release 版之前，不用回归测试就能保证稳定性，并且尽量避免在软件发布后被用户发现 bug。调试被用户发现的 bug 是一项非常浪费时间和精力的工作。因此测试是一项非常重要的工作。不像闭源和专有的操作系统，Linux 内核的开发过程是完全开放的。这种处理方式即是它的优点，也是它的缺点。多个开发者持续增加新功能、修 bug、不断集成与测试 —— 当环境有新的硬件或功能时，这种开发方式能够保证内核能持续工作。在开源项目中，开发者与用户共享测试的结果，这也是开源项目与闭源项目之间的一个很重要的差别。

几乎所有 Linux 内核开发者都是活跃的 Linux 用户。内核测试人员不一定非得是内核开发者，相反，用户和开发者如果对新增的代码不是很熟悉，他们的测试效果会比代码开发人员自己测试的效果要好很多。也就是说，开发者的单元自测能验证软件的功能，但并不能保证在其他代码、其他功能、其他软件、硬件环境下面运行时会出现什么问题。开发者无法预料、也没有机会和资源来测试所有环境。因此，用户在 Linux 内核开发过程中起到非常重要的角色。

现在我们已经了解了持续集成测试的重要性，接下来我们会详细介绍测试的知识。但在此之前，我还是向你介绍一下开发的过程，以便让大家了解它是怎么工作的，以及如何把补丁打进内核主线。

全世界共有3000多个内核开发者为 Linux 内核贡献代码，每天都有新代码添加到内核，结果是大概2个月就能产生一个release ，包括几个稳定版和扩展稳定版。新功能的开发与已发布的稳定版集成测试流程在同时进行。

关于开发流程的详细描述，请参考[Greg Kroah-Hartman 的 Linux 内核开发的介绍][1]。

这份教程适合与初学者以及有经验的内核开发者，如果你想加入到内核开发者行列，那么它也适合你。有经验的开发人员可以跳过那些介绍基础测试和调试的章节。

这份教程介绍如何测试和调试 Linux 内核、工具、脚本以及在回归测试和集成测试中使用的调试机制。另外，本文还会介绍如何使用 git 把针对一个 bug 的补丁分离出来，再介绍把你的补丁提交到内核的邮件列表之前需要做些什么。我将会使用 Linux PM 作为测试它调试的对象。尽管本文讨论的是 Linux 内核，但是介绍的方法也适用于任何其他软件开发项目。

### 配置开发与测试的系统 ###

第一步，找一个满足你需求的开发环境，x86-64 是一个比较理想的选择，除非你必须用特别的架构。

第二步，安装 Linux 发行版，我推荐 Ubuntu，所以本教程会介绍基于 Ubuntu 的配置过程。你可以参考[如何使用 Ubuntu][2] 来安装一个 Ubuntu 系统。

在开发和测试环境，最好要保证你的 boot 分区有足够的空间来存放内核文件。你可以为 boot 分区留下 3GB 空间，或把 boot 分区直接放到根目录下，这样 boot 分区可以使用整个磁盘的空间。

安装好操作系统后，确保 root 用户可用，确保你的用户身份可以使用 sudo 命令。你的系统也许已经安装了 build-essential，它是编译内核必备的软件包，如果没安装，运行下面的命令：

    sudo apt-get install build-essential

然后运行下面的命令，保证你的系统能够交叉编译内核。下面的 ncurses-dev 安装包是运行 make menuconfig 命令必须用到的。

    sudo apt-get install binutils-multiarch

    sudo apt-get install ncurses-dev

    sudo apt-get install alien

然后安装一些每个内核开发者都会用到的工具包：

    sudo apt-get install git

    sudo apt-get install cscope

    sudo apt-get install meld

    sudo apt-get install gitk

如果你喜欢把内核通过交叉编译以支持非 x86_64 架构的环境，请参考[在 x86_64 上交叉编译 Linux 内核][3]。

### 稳定的内核 ###

使用 git 克隆一个稳定的内核，然后编译安装。你可以参考[Linux 内核结构][4]来找到最新的稳定版和开发主线。

    git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git

上面的步骤将会创建一个新的目录，名为 linux-stable，并把源码下载到里面。

你也可以直接下载压缩包并解压出源码，无需使用 git：

    tar xvf linux-3.x.y.tar.xz

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/linux-kernel-testing-and-debugging?page=0,0

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://events.linuxfoundation.org/images/stories/pdf/als2012_gregkh.pdf
[2]:http://howtoubuntu.org/
[3]:http://linuxdriverproject.org/mediawiki/index.php/Cross-compiling_Linux_kernel_on_x86_64
[4]:https://www.kernel.org/
