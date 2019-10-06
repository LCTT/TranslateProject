[#]: collector: (lujun9972)
[#]: translator: (LuuMing)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11427-1.html)
[#]: subject: (How to compile a Linux kernel in the 21st century)
[#]: via: (https://opensource.com/article/19/8/linux-kernel-21st-century)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

在 21 世纪该怎样编译 Linux 内核
======

> 也许你并不需要编译 Linux 内核，但你能通过这篇教程快速上手。

![](https://img.linux.net.cn/data/attachment/album/201910/06/113927vrs6rurljyuza8cy.jpg)

在计算机世界里，<ruby>内核<rt>kernel</rt></ruby>是处理硬件与一般系统之间通信的<ruby>低阶软件<rt>low-level software</rt></ruby>。除过一些烧录进计算机主板的初始固件，当你启动计算机时，内核让系统意识到它有一个硬盘驱动器、屏幕、键盘以及网卡。分配给每个部件相等时间（或多或少）使得图像、音频、文件系统和网络可以流畅甚至并行地运行。

然而，对于硬件的需求是源源不断的，随着发布的硬件越多，内核就必须纳入更多代码来保证那些硬件正常工作。得到具体的数字很困难，但是 Linux 内核无疑是硬件兼容性方面的顶级内核之一。Linux 操作着无数的计算机和移动电话、工业用途和爱好者使用的板级嵌入式系统（SoC）、RAID 卡、缝纫机等等。

回到 20 世纪（甚至是 21 世纪初期），对于 Linux 用户来说，在刚买到新的硬件后就需要下载最新的内核代码并编译安装才能使用这是不可理喻的。而现在你也很难见到 Linux 用户为了好玩而编译内核或通过高度专业化定制的硬件的方式赚钱。现在，通常已经不需要再编译 Linux 内核了。

这里列出了一些原因以及快速编译内核的教程。

### 更新当前的内核

无论你买了配备新显卡或 Wifi 芯片集的新品牌电脑还是给家里配备一个新的打印机，你的操作系统（称为 GNU+Linux 或 Linux，它也是该内核的名字）需要一个驱动程序来打开新部件（显卡、芯片集、打印机和其他任何东西）的信道。有时候当你插入某些新的设备时而你的电脑表示发现了它，这具有一定的欺骗性。别被骗到了，有时候那就够了，但更多的情况是你的操作系统仅仅是使用了通用的协议检测到安装了新的设备。

例如，你的计算机也许能够鉴别出新的网络打印机，但有时候那仅仅是因为打印机的网卡被设计成为了获得 DHCP 地址而在网络上标识自己。它并不意味着你的计算机知道如何发送文档给打印机进行打印。事实上，你可以认为计算机甚至不“知道”那台设备是一个打印机。它也许仅仅是显示网络有个设备在一个特定的地址上，并且该设备以一系列字符 “p-r-i-n-t-e-r” 标识自己而已。人类语言的便利性对于计算机毫无意义。计算机需要的是一个驱动程序。

内核开发者、硬件制造商、技术支持和爱好者都知道新的硬件会不断地发布。它们大多数都会贡献驱动程序，直接提交给内核开发团队以包含在 Linux 中。例如，英伟达显卡驱动程序通常都会写入 [Nouveau][2] 内核模块中，并且因为英伟达显卡很常用，它的代码都包含在任一个日常使用的发行版内核中（例如当下载 [Fedora][3] 或 [Ubuntu][4] 得到的内核）。英伟达也有不常用的地方，例如嵌入式系统中 Nouveau 模块通常被移除。对其他设备来说也有类似的模块：打印机得益于 [Foomatic][5] 和 [CUPS][6]，无线网卡有 [b43、ath9k、wl][7] 模块等等。

发行版往往会在它们 Linux 内核的构建中包含尽可能多合理的驱动程序，因为他们想让你在接入新设备时不用安装驱动程序能够立即使用。对于大多数情况来说就是这样的，尤其是现在很多设备厂商都在资助自己售卖硬件的 Linux 驱动程序开发，并且直接将这些驱动程序提交给内核团队以用在通常的发行版上。

有时候，或许你正在运行六个月之前安装的内核，并配备了上周刚刚上市令人兴奋的新设备。在这种情况下，你的内核也许没有那款设备的驱动程序。好消息是经常会出现那款设备的驱动程序已经存在于最近版本的内核中，意味着你只要更新运行的内核就可以了。

通常，这些都是通过安装包管理软件完成的。例如在 RHEL、CentOS 和 Fedora 上：

```
$ sudo dnf update kernel
```

在 Debian 和 Ubuntu 上，首先获取你当前内核的版本：

```
$ uname -r
4.4.186
```

搜索新的版本：

```
$ sudo apt update
$ sudo apt search linux-image
```

安装找到的最新版本。在这个例子中，最新的版本是 5.2.4：

```
$ sudo apt install linux-image-5.2.4
```

内核更新后，你必须 [reboot][8] （除非你使用 kpatch 或 kgraft）。这时，如果你需要的设备驱动程序包含在最新的内核中，你的硬件就会正常工作。

### 安装内核模块

有时候一个发行版没有预计到用户会使用某个设备（或者该设备的驱动程序至少不足以包含在 Linux 内核中）。Linux 对于驱动程序采用模块化方式，因此尽管驱动程序没有编译进内核，但发行版可以推送单独的驱动程序包让内核去加载。尽管有些复杂但是非常有用，尤其是当驱动程序没有包含进内核中而是在引导过程中加载，或是内核中的驱动程序相比模块化的驱动程序过期时。第一个问题可以用 “initrd” 解决（初始化 RAM 磁盘），这一点超出了本文的讨论范围，第二点通过 “kmod” 系统解决。

kmod 系统保证了当内核更新后，所有与之安装的模块化驱动程序也得到更新。如果你手动安装一个驱动程序，你就体验不到 kmod 提供的自动化，因此只要能用 kmod 安装包，就应该选择它。例如，尽管英伟达驱动程序以 Nouveau 模块构建在内核中，但官方的驱动程序仅由英伟达发布。你可以去网站上手动安装英伟达旗下的驱动程序，下载 “.run” 文件，并运行提供的 shell 脚本，但在安装了新的内核之后你必须重复相同的过程，因为没有任何东西告诉包管理软件你手动安装了一个内核驱动程序。英伟达驱动着你的显卡，手动更新英伟达驱动程序通常意味着你需要通过终端来执行更新，因为没有显卡驱动程序将无法显示。

![Nvidia configuration application][9]

然而，如果你通过 kmod 包安装英伟达驱动程序，更新你的内核也会更新你的英伟达驱动程序。在 Fedora 和相关的发行版中：

```
$ sudo dnf install kmod-nvidia
```

在 Debian 和相关发行版上：

```
$ sudo apt update
$ sudo apt install nvidia-kernel-common nvidia-kernel-dkms nvidia-glx nvidia-xconfig nvidia-settings nvidia-vdpau-driver vdpau-va-driver
```

这仅仅是一个例子，但是如果你真的要安装英伟达驱动程序，你也必须屏蔽掉 Nouveau 驱动程序。参考你使用发行版的文档获取最佳的步骤吧。

### 下载并安装驱动程序

不是所有的东西都包含在内核中，也不是所有的东西都可以作为内核模块使用。在某些情况下，你需要下载一个由供应商编写并绑定好的特殊驱动程序，还有一些情况，你有驱动程序，但是没有配置驱动程序的前端界面。

有两个常见的例子是 HP 打印机和 [Wacom][10] 数位板。如果你有一台 HP 打印机，你可能有能够和打印机通信的通用的驱动程序，甚至能够打印出东西。但是通用的驱动程序却不能为特定型号的打印机提供定制化的选项，例如双面打印、校对、纸盒选择等等。[HPLIP][11]（HP Linux 成像和打印系统）提供了选项来进行任务管理、调整打印设置、选择可用的纸盒等等。

HPLIP 通常包含在包管理软件中；只要搜索“hplip”就行了。

![HPLIP in action][12]

同样的，电子艺术家主要使用的数位板 Wacom 的驱动程序通常也包含在内核中，但是例如调整压感和按键功能等设置只能通过默认包含在 GNOME 的图形控制面板访问。但也可以作为 KDE 上额外的程序包“kde-config-tablet”来访问。

这里也有几个类似的个别例子，例如内核中没有驱动程序，但是以 RPM 或 DEB 文件提供了可供下载并且通过包管理软件安装的 kmod 版本的驱动程序。

### 打上补丁并编译你的内核

即使在 21 世纪的未来主义乌托邦里，仍有厂商不够了解开源，没有提供可安装的驱动程序。有时候，一些公司为驱动程序提供开源代码，而需要你下载代码、修补内核、编译并手动安装。

这种发布方式和在 kmod 系统之外安装打包的驱动程序拥有同样的缺点：对内核的更新会破坏驱动程序，因为每次更换新的内核时都必须手动将其重新集成到内核中。

令人高兴的是，这种事情变得少见了，因为 Linux 内核团队在呼吁公司们与他们交流方面做得很好，并且公司们最终接受了开源不会很快消失的事实。但仍有新奇的或高度专业的设备仅提供了内核补丁。

官方上，对于你如何编译内核以使包管理器参与到升级系统如此重要的部分中，发行版有特定的习惯。这里有太多的包管理器，所以无法一一涵盖。举一个例子，当你使用 Fedora 上的工具例如 `rpmdev` 或 `build-essential`，Debian 上的 `devscripts`。

首先，像通常那样，找到你正在运行内核的版本：

```
$ uname -r
```

在大多数情况下，如果你还没有升级过内核那么可以试试升级一下内核。搞定之后，也许你的问题就会在最新发布的内核中解决。如果你尝试后发现不起作用，那么你应该下载正在运行内核的源码。大多数发行版提供了特定的命令来完成这件事，但是手动操作的话，可以在 [kernel.org][13] 上找到它的源代码。

你必须下载内核所需的任何补丁。有时候，这些补丁对应具体的内核版本，因此请谨慎选择。 

通常，或至少在人们习惯于编译内核的那时，都是拿到源代码并对 `/usr/src/linux` 打上补丁。

解压内核源码并打上需要的补丁：

```
$ cd /usr/src/linux
$ bzip2 --decompress linux-5.2.4.tar.bz2
$ cd  linux-5.2.4
$ bzip2 -d ../patch*bz2
```

补丁文件也许包含如何使用的教程，但通常它们都设计成在内核源码树的顶层可用来执行。

```
$ patch -p1 < patch*example.patch
```

当内核代码打上补丁后，你可以继续使用旧的配置来对打了补丁的内核进行配置。

```
$ make oldconfig
```

`make oldconfig` 命令有两个作用：它继承了当前的内核配置，并且允许你配置补丁带来的新的选项。

你或许需要运行 `make menuconfig` 命令，它启动了一个基于 ncurses 的菜单界面，列出了新的内核所有可能的选项。整个菜单可能看不过来，但是它是以旧的内核配置为基础的，你可以遍历菜单并且禁用掉你没有或不需要的硬件模块。另外，如果你知道自己有一些硬件没有包含在当前的配置中，你可以选择构建它，当作模块或者直接嵌入内核中。理论上，这些并不是必要的，因为你可以猜想，当前的内核运行良好只是缺少了补丁，当使用补丁的时候可能已经激活了所有设备所必要的选项。

下一步，编译内核和它的模块：

```
$ make bzImage
$ make modules
```

这会产生一个叫作 `vmlinuz` 的文件，它是你的可引导内核的压缩版本。保存旧的版本并在 `/boot` 文件夹下替换为新的。

```
$ sudo mv /boot/vmlinuz /boot/vmlinuz.nopatch
$ sudo cat arch/x86_64/boot/bzImage > /boot/vmlinuz
$ sudo mv /boot/System.map /boot/System.map.stock
$ sudo cp System.map /boot/System.map
```

到目前为止，你已经打上了补丁并且编译了内核和它的模块，你安装了内核，但你并没有安装任何模块。那就是最后的步骤：

```
$ sudo make modules_install
```

新的内核已经就位，并且它的模块也已经安装。

最后一步是更新你的引导程序，为了让你的计算机在加载 Linux 内核之前知道它的位置。GRUB 引导程序使这一过程变得相当简单：

```
$ sudo grub2-mkconfig
```

### 现实生活中的编译

当然，现在没有人手动执行这些命令。相反的，参考你的发行版，寻找发行版维护人员使用的开发者工具集修改内核的说明。这些工具集可能会创建一个集成所有补丁的可安装软件包，告诉你的包管理器来升级并更新你的引导程序。

### 内核

操作系统和内核都是玄学，但要理解构成它们的组件并不难。下一次你看到某个技术无法应用在 Linux 上时，深呼吸，调查可用的驱动程序，寻找一条捷径。Linux 比以前简单多了——包括内核。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/linux-kernel-21st-century

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[LuMing](https://github.com/LuuMing)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q (and old computer and a new computer, representing migration to new software or hardware)
[2]: https://nouveau.freedesktop.org/wiki/
[3]: http://fedoraproject.org
[4]: http://ubuntu.com
[5]: https://wiki.linuxfoundation.org/openprinting/database/foomatic
[6]: https://www.cups.org/
[7]: https://wireless.wiki.kernel.org/en/users/drivers
[8]: https://opensource.com/article/19/7/reboot-linux
[9]: https://opensource.com/sites/default/files/uploads/nvidia.jpg (Nvidia configuration application)
[10]: https://linuxwacom.github.io
[11]: https://developers.hp.com/hp-linux-imaging-and-printing
[12]: https://opensource.com/sites/default/files/uploads/hplip.jpg (HPLIP in action)
[13]: https://www.kernel.org/
