在树莓派上运行 DOS 系统
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wings_freedos_game.jpg?itok=7j8x-A-w)
[FreeDOS][1] 对大家来说也许并不陌生。它是一个完整、免费并且对 DOS 兼容良好的操作系统，它可以运行一些比较老旧的 DOS 游戏或者商用软件，也可以开发嵌入式的应用。只要在 MS-DOS 上能够运行的程序，在 FreeDOS 上都可以运行。

作为 FreeDOS 的发起者和项目协调人员，很多用户会把我作为内行人士进行发问。而我最常被问到的问题是：“FreeDOS 可以在树莓派上运行吗？”

这个问题并不令人意外。毕竟 Linux 在树莓派上能够很好地运行，而 FreeDOS 和 Linux 相比是一个更古老、占用资源更少的操作系统，那 FreeDOS 为啥不能树莓派上运行呢？

简单来说。由于 CPU 架构的原因，FreeDOS 并不能在树莓派中独立运行。和其它 DOS 类的系统一样，FreeDOS 需要英特尔 x86 架构 CPU 以及 BIOS 来提供基础的运行时服务。而树莓派运行在 ARM 架构的 CPU 上，与英特尔 CPU 二进制不兼容，也没有 BIOS。因此树莓派在硬件层面就不支持 FreeDOS。

不过通过 PC 模拟器还是能在树莓派上运行 FreeDOS 的，虽然这样也许稍有不足，但也不失为一个能在树莓派上运行 FreeDOS 的方法。

### DOSBox怎么样?

有人可能会问：“为什么不用 DOSBox 呢？” DOSBox 是一个开源的跨平台 x86 模拟器，在 Linux 上也能使用，它能够为应用软件尤其是游戏软件提供了一个类 DOS 的运行环境，所以如果你只是想玩 DOS 游戏的话，DOSBox是一个不错的选择。但在大众眼中，DOSBox 是专为 DOS 游戏而设的，而在运行一些别的 DOS 应用软件方面，DOSBox 只是表现平平。

对多数人来说，这只是个人偏好的问题，我喜欢用 FreeDOS 来运行 DOS 游戏和其它程序，完整的 DOS 系统和 DOSBox 相比能让我体验到更好的灵活性和操控性。我只用 DOSBox 来玩游戏，在其它方面还是选择完整的 FreeDOS。

### 在树莓派上安装 FreeDOS

[QEMU][3]（Quick EMUlator）是一款能在 Linux 系统上运行 DOS 系统的开源的虚拟机软件。很多流行的 Linux 系统都自带 QEMU。QEMU 在我树莓派上的 Raspbian 系统中也同样能够运行，下文就有一些我在树莓派 [Raspbian GNU/Linux 9 (Stretch)][4] 系统中使用 QEMU 的截图。

去年我在写了一篇关于[如何在 Linux 系统中运行 DOS 程序][5]的文章的时候就用到了 QEMU，在树莓派上使用 QEMU 来安装运行 FreeDOS 的步骤基本上和在别的基于 GNOME 的系统上没有什么太大的区别。

在 QEMU 中你需要通过添加各种组件来搭建虚拟机。先指定一个用来安装运行 DOS 的虚拟磁盘镜像，通过`qemu-img` 命令来创建一个虚拟磁盘镜像，对于 FreeDOS 来说不需要太大的空间，所以我只创建了一个 200MB 的虚拟磁盘：
```
qemu-img create freedos.img 200M

```

和 VMware 或者 VirtualBox 这些 PC 模拟器不同，使用 QEMU 需要通过添加各种组件来搭建虚拟机，尽管有点麻烦，但是并不困难。我使用了以下这些参数来在树莓派上使用 QEMU 安装 FreeDOS 系统：
```
qemu-system-i386 -m 16 -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -hda freedos.img -cdrom FD12CD.iso -boot order=d

```

你可以在我其它的[文章][5]中找到这些命令的完整介绍。简单来说，上面这条命令指定了一个英特尔 i386 兼容虚拟机，并且分配了 16MB 内存、一个英文输入键盘、一个基于系统时间的实时时钟、一个声卡、一个音乐卡以及一个 VGA 卡。文件 `freedos.img` 指定为第一个硬盘(`C:`)，`FD12CD.iso` 镜像作为 CD-ROM (`D:`)驱动。QEMU 设定为从`D:`的 CD-ROM 启动。

你只需要按照提示就可以轻松安装好 FreeDOS 1.2 了。但是由于 microSD 卡在面对大量的 I/O 时速度比较慢，所以安装操作系统需要花费很长时间。


### 在树莓派上运行 FreeDOS

你的运行情况取决于使用哪一种 microSD 卡。我用的是 SanDisk Ultra 64GB microSDXC UHS-I U1A1 ，其中 U1 这种型号专用于支持 1080p 的视频录制（例如 GoPro），它的最低串行写速度能够达到 10MB/s。相比之下，V60 型号专用于 4K 视频录制，最低连续写入速度能达到 60MB/s。如果你的树莓派使用的是 V60 的 microSD 卡甚至是 V30（也能达到 30MB/s），你就能明显看到它的 I/O 性能会比我的好。

FreeDOS 安装好之后，你可以直接从`C:`进行启动。只需要按照下面的命令用`-boot order=c`来指定 QEMU 的启动顺序即可：
```
​qemu-system-i386 -m 16 -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -hda freedos.img -cdrom FD12CD.iso -boot order=c​

```

只要树莓派的 QEMU 上安装了 FreeDOS，就不会出现明显的性能问题。例如游戏通常在每一关开始的时候会加载地图、怪物、声音等一系列的数据，尽管这些内容需要加载一段时间，但在正常玩的时候并没有出现性能不足的现象。

FreeDOS 1.2 自带了很多游戏以及其它应用软件，可以使用`FDIMPLES`包管理程序来安装它们。FreeDOS 1.2 里面我最喜欢的是一款叫 WING 的太空射击游戏，让人想起经典的街机游戏 Galaga（WING 就是 Wing Is Not Galaga 的递归缩写词）。

As-Easy-As 是我最喜欢的一个 DOS 应用程序，作为20世纪8、90年代流行的电子表格程序，它和当时的 Lotus 1-2-3 以及现在的 Microsoft Excel、LibreOffice Calc 一样具有强大的威力。As-Easy-As 和 Lotus 1-2-3 都将数据保存为 WKS 文件，现在新版本的 Microsoft Excel 已经无法读取这种文件了，而 LibreOffice Calc 是兼容性而定有可能支持。鉴于 As-Easy-As 的初始版本是一个共享软件，TRIUS 仍然为 As-Easy-As 5.7 免费提供[激活码][6]。

我也非常喜欢 GNU Emacs 编辑器，FreeDOS 也自带了一个叫 Freemacs 的类 Emacs 的文本编辑器。它比 FreeDOS 默认的 FreeDOS Edit 编辑器更强大，也能带来 GNU Emacs 的体验。如果你也需要，可以在 FreeDOS 1.2 中通过`FDIMPLES`包管理程序来安装。

### 是的，你或许真的可以在树莓派上运行 DOS

While you can't run DOS on "bare hardware" on the Raspberry Pi, it's nice to know that you can still run DOS on the Raspberry Pi via an emulator. Thanks to the QEMU PC emulator and FreeDOS, it's possible to play classic DOS games and run other DOS programs on the Raspberry Pi. Expect a slight performance hit when doing any disk I/O, especially if you're doing something intensive on the disk, like writing large amounts of data, but things will run fine after that. Once you've set up QEMU as the virtual machine emulator and installed FreeDOS, you are all set to enjoy your favorite classic DOS programs on the Raspberry Pi.

即使树莓派在硬件上不支持 DOS，但是在模拟器的帮助下，DOS 还是能够在树莓派上运行。得益于 QEMU PC 模拟器，一些经典的 DOS 游戏和 DOS 应用程序能够运行在树莓派上。在执行磁盘 I/O ，尤其是大量密集操作（例如写入大量数据）的时候，性能可能会受到轻微的影响。当你使用 QEMU 并且在虚拟机里安装好 FreeDOS 之后，你就可以尽情享受经典的 DOS 程序了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/can-you-run-dos-raspberry-pi

作者：[Jim Hall][a]
译者：[HankChow](https://github.com/HankChow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:http://www.freedos.org/
[2]:https://opensource.com/article/18/3/raspberry-pi-week-giveaway
[3]:https://www.qemu.org/
[4]:https://www.raspberrypi.org/downloads/
[5]:https://opensource.com/article/17/10/run-dos-applications-linux
[6]:http://www.triusinc.com/forums/viewtopic.php?t=10
