怎么在 Linux 中运行 DOS 程序
============================================================

### QEMU 和 FreeDOS 可以让它很容易地在 Linux 中运行老的 DOS 程序

 [![photo of Jim Hall](https://opensource.com/sites/default/files/styles/byline_thumbnail/public/pictures/jimhall1.jpg?itok=ALPmHWAH "Jim Hall")][22]  19 Oct 2017 [Jim Hall][23] [Feed][17] 20[up][15] [13 comments][24]
![How to run DOS programs in Linux](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 "How to run DOS programs in Linux")
Image by : opensource.com

传统的 DOS 操作系统支持的许多非常优秀的应用程序： 文字处理，电子表格，游戏，和其它的程序。正因为一个应用程序太老了，意味着它不再使用了。

今天这里有很多理由去运行一个旧的 DOS 应用程序。或许是从一个遗留的业务应用程序中提取一个报告。或者是玩一个经典的 DOS 游戏。或者因为你对“传统计算机的动作”很好奇。你不需要去双引导你的系统去运行 DOS 程序。而是，你可以在 Linux 中在一个 PC 仿真程序和 [FreeDOS][18]的帮助下去正确地运行它们。

FreeDOS 是一个完整的、免费的、DOS 兼容的操作系统，你可以用它来玩经典的游戏、运行传统业务软件,或者开发嵌入式系统。工作在 MS-DOS 中的任何程序也可以运行在 FreeDOS 中。

以前，你安装的 DOS 作为一台计算机上的独占的操作系统。 现在， 它可以很容易地安装到 Linux 上运行一台虚拟机中。 [QEMU][19] （快速仿真程序的缩写） 是一个开源的虚拟机软件， 它可以在 Linux 中运行一个“guest”操作系统来运行 DOS。许多流行的 Linux 系统都缺少包含 QEMU 。

通过以下四步，很容易地在 Linux 下通过使用 QEMU 和 FreeDOS 去运行一个老的 DOS 程序。

### 第1步：设置一个虚拟磁盘

你需要一个在 QEMU 中安装 FreeDOS 的位置, 以及你需要一个虚拟的 C:驱动器。在 DOS 中, 字母—**A:** 和 **B:** 是分配给第一和第二个软盘驱动器的，而 **C:** 是第一个硬盘驱动器。其它介质，包括其它硬盘驱动器和 CD-ROM 驱动器，是依次分配 **D:**，**E:**， 等等。

在 QEMU 中，虚拟磁盘是一个镜像文件。去初始化一个用于 **C: **驱动器的文件，使用 **qemu-img** 命令。去创建一个大约 200 MB 的镜像文件，可以这样输入：

```
qemu-img create dos.img 200M
```

与现代计算机相比， 200 MB 看起来非常小，但是早在1990年代， 200 MB 是非常大的。它足够安装和运行 DOS。

### 第2步： QEMU 选项

与 PC 仿真系统 VMware 或 VirtualBox 不同，你需要通过 QEMU 命令去增加每个虚拟机的组件来 “build” 你的虚拟系统 。虽然，这可能看起来很费力，但它实际并不困难。这些是我们在 QEMU 中用于去引导 FreeDOS 的参数：

| | |
|:-- |:--|
| **qemu-system-i386** | QEMU 可以仿真几种不同的系统，但是去引导到 DOS，我们需要有一个 Intel 兼容的 CPU。 以便于使用 i386 命令启动 QEMU。 |
| **-m 16** | 我喜欢定义一个使用 16 MB 内存的虚拟机。它看起来很小，但是 DOS 工作不需要很多的内存。在一个巨型的 DOS 中，计算机使用 16　MB 或者 8 MB 是非常普遍的。 |
| **-k en-us** | 一般情况下, 这个 **-k** 选项是不需要的，因为 QEMU 会设置虚拟键盘去匹配你的真实键盘（在我的例子中， 它是标准的US布局的英语键盘）。但是我还是喜欢去指定它。 |
| **-rtc base=localtime** | 每个传统的 PC 设备有一个实时时钟 (RTC) 以便于系统可以保持跟踪时间。我找到一个简单的方法去设置虚拟 RTC 去匹配你的本地时间。 |
| **-soundhw sb16,adlib,pcspk** | 如果你需要声音， 尤其是为了游戏，我更喜欢去使用 SoundBlaster16 声音硬件和 AdLib 音乐支持去定义 QEMU 。SoundBlaster16 和 AdLib 是在 DOS 时代非常普通的声音硬件。一些老的程序可以为声音使用 PC 喇叭； QEMU 也可以仿真这个。 |
| **-device cirrus-vga** | 去使用图像，我喜欢去仿真一个简单的 VGA 视频卡。Cirrus VGA 卡是那时比较普遍的图形卡, 而且 QEMU 可以仿真它。 |
| **-display gtk** | 对于虚拟显示，我设置 QEMU 去使用 GTK toolkit，它可以放虚拟系统到它自己的窗口内并且提供一个简单的菜单去控制虚拟机。 |
| **-boot order=** | 你可以告诉 QEMU 从多种源引导虚拟机。从软盘驱动器引导 (在 DOS 机器中一般情况下是 **A:** ) 指定 **order=a**。 从每一个硬盘驱动器引导(一般称为 **C:**) 使用 **order=c**。 或者去从一个 CD-ROM 驱动器 (在 DOS 中经常分配 **D:** ) 使用 **order=d**。 你可以使用组合字母去指定一个特定的引导顺序， 比如 **order=dc** 去第一个使用 CD-ROM 驱动器，如果 CD-ROM 驱动器中没有引导介质，然后使用硬盘驱动器。 |

### 第3步： 引导和安装 FreeDOS

现在 QEMU 已经设置为运行一个虚拟机，我们需要一个 DOS 版本去在那台虚拟机中安装和引导。 FreeDOS 做这个很容易。它的最新版本是 FreeDOS 1.2， 发行于 2016年12月。

 从 [FreeDOS website][20]上下载 FreeDOS 1.2 的发行版。 FreeDOS 1.2 CD-ROM “standard” 安装器 (**FD12CD.iso**) 可以很好地在 QEMU 上运行，因此，我推荐使用这个版本。

安装 FreeDOS 很简单。首先，告诉 QEMU 去使用的 CD-ROM image 和从哪里引导它。 记住，第一个硬盘驱动器是 **C:** 驱动器，因此， CD-ROM 将以 **D:** 驱动器出现。

```
qemu-system-i386 -m 16 -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -display gtk -hda dos.img -cdrom FD12CD.iso -boot order=d
```

正如下面的提示，你将在几分钟内安装完成 FreeDOS 。

### [install1a.png][6]

![Starting FreeDOS installation](https://opensource.com/sites/default/files/u128651/install1a.png "Starting FreeDOS installation")

### [install2_0.png][7]

![Select your keyboard layout](https://opensource.com/sites/default/files/u128651/install2_0.png "Select your keyboard layout")

### [install3.png][8]

![Selecting which packages to install](https://opensource.com/sites/default/files/u128651/install3.png "Selecting which packages to install")

### [install4.png][9]

![Rebooting after installation](https://opensource.com/sites/default/files/u128651/install4.png "Rebooting after installation")

在你安装完成之后，关闭窗口退出 QEMU。

### Step 4: Install and run your DOS application

一旦安装完 FreeDOS，你可以在 QEMU 中运行不同的 DOS 应用程序。你可以在线上通过各种档案文件或其它[网站][21]找到老的 DOS 程序。

QEMU 提供了一个在 Linux 上访问本地文件的简单方法。比如说，想去用 QEMU 共享 **dosfiles/** 文件夹。 通过使用 **-drive** 选项，简单地告诉 QEMU 去使用这个文件夹作为 FAT 驱动器。 QEMU 将通过一个硬盘驱动器去访问这个文件夹。

```
-drive file=fat:rw:dosfiles/
```

现在，你可以使用你的合法的选项去启动 QEMU，加上一个外部的虚拟 FAT 驱动器：

```
qemu-system-i386 -m 16 -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -display gtk -hda dos.img -drive file=fat:rw:dosfiles/ -boot order=c
```

一旦你使用 FreeDOS 引导，你保存在 **D:** 驱动器中的任何文件将被保存到 Linux 上的 **dosfiles/** 文件夹中。这可以从 Linux 上很容易地直接去读取这个文件；然而,必须注意的是，启动 QEMU 后，不能从 Linux 中去改变 **dosfiles/** 这个文件夹。 当你启动 QEMU 时，QEMU 一次性构建一个虚拟的 FAT 表，如果你在启动 QEMU 之后，在 **dosfiles/** 文件夹中增加或删除文件，仿真程序可能会变得混乱。

我使用 QEMU 喜欢去运行一些我收藏的 DOS 程序， 像 As-Easy-As 电子表格程序。这是一个在 1980 年代和 1990年代非常流行的电子表格程序，它和现在的 Microsoft Excel 和 LibreOffice Calc 或和以前更昂贵的 Lotus 1-2-3 电子表格程序完成的工作是一样的。 As-Easy-As 和 Lotus 1-2-3 都保存数据为 WKS 文件，它的最新版本 Microsoft Excel 不能读取，但是，根据兼容性， LibreOffice Calc 可以支持.

### [aseasy-regress1.png][10]

![As-Easy-As spreadsheet program](https://opensource.com/sites/default/files/u128651/aseasy-regress1.png "As-Easy-As spreadsheet program")

As-Easy-As 电子表格程序

我也喜欢在 QEMU中引导 FreeDOS 去玩一些收藏的 DOS 游戏，低昂 original Doom。玩这些老的 DOS 游戏仍然是非常有趣的， 并且它们现在在 QEMU 上运行的非常好。

### [qemu-doom.png][11]

![Doom](https://opensource.com/sites/default/files/u128651/qemu-doom.png "Doom")

Doom

### [qemu-heretic.png][12]

![Heretic](https://opensource.com/sites/default/files/u128651/qemu-heretic.png "Heretic")

Heretic

### [qemu-jill.png][13]

![Jill of the Jungle](https://opensource.com/sites/default/files/u128651/qemu-jill.png "Jill of the Jungle")

Jill of the Jungle

### [qemu-keen.png][14]

![Commander Keen](https://opensource.com/sites/default/files/u128651/qemu-keen.png "Commander Keen")

Commander Keen

QEMU 和 FreeDOS 可以很容易地在 Linux 上运行老的 DOS 程序。你一旦设置了 QEMU 作为虚拟机仿真程序并安装了 FreeDOS，你将可以在 Linux 上运行你收藏的经典的 DOS 程序。

 _All images courtesy of [FreeDOS.org][16]._

--------------------------------------------------------------------------------

作者简介：

Jim Hall - Jim Hall 是一位开源软件的开发者和支持者，可能最知名的是 FreeDOS 的创始人和项目协调者。 Jim 也非常活跃于开源软件适用性领域，作为 GNOME Outreachy 适用性测试的导师，同时也作为一名兼职教授，教授一些开源软件适用性的课程，从 2016 到 2017， Jim 在 GNOME基金会的董事会担任董事，在工作中， Jim 是 CIO ...

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/run-dos-applications-linux

作者：[ Jim Hall ][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jim-hall
[1]:https://opensource.com/resources/what-is-linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[2]:https://opensource.com/resources/what-are-linux-containers?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[5]:https://opensource.com/tags/linux?intcmp=70160000000h1jYAAQ&utm_source=intcallout&utm_campaign=linuxcontent
[6]:https://opensource.com/file/374821
[7]:https://opensource.com/file/374771
[8]:https://opensource.com/file/374776
[9]:https://opensource.com/file/374781
[10]:https://opensource.com/file/374761
[11]:https://opensource.com/file/374786
[12]:https://opensource.com/file/374791
[13]:https://opensource.com/file/374796
[14]:https://opensource.com/file/374801
[15]:https://opensource.com/article/17/10/run-dos-applications-linux?rate=STdDX4LLLyyllTxAOD-CdfSwrZQ9D3FNqJTpMGE7v_8
[16]:http://www.freedos.org/
[17]:https://opensource.com/user/126046/feed
[18]:http://www.freedos.org/
[19]:https://www.qemu.org/
[20]:http://www.freedos.org/
[21]:http://www.freedos.org/links/
[22]:https://opensource.com/users/jim-hall
[23]:https://opensource.com/users/jim-hall
[24]:https://opensource.com/article/17/10/run-dos-applications-linux#comments
