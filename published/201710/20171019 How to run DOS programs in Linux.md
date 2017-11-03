怎么在 Linux 中运行 DOS 程序
============================================================

> QEMU 和 FreeDOS 使得很容易在 Linux 中运行老的 DOS 程序

![How to run DOS programs in Linux](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_development_programming.png?itok=4OM29-82 "How to run DOS programs in Linux")

Image by : opensource.com

传统的 DOS 操作系统支持的许多非常优秀的应用程序： 文字处理，电子表格，游戏和其它的程序。但是一个应用程序太老了，并不意味着它没用了。

如今有很多理由去运行一个旧的 DOS 应用程序。或许是从一个遗留的业务应用程序中提取一个报告，或者是想玩一个经典的 DOS 游戏，或者只是因为你对“传统计算机”很好奇。你不需要去双引导你的系统去运行 DOS 程序。取而代之的是，你可以在 Linux 中在一个 PC 仿真程序和 [FreeDOS][18] 的帮助下去正确地运行它们。

FreeDOS 是一个完整的、免费的、DOS 兼容的操作系统，你可以用它来玩经典的游戏、运行旧式业务软件，或者开发嵌入式系统。任何工作在 MS-DOS 中的程序也可以运行在 FreeDOS 中。

在那些“过去的时光”里，你安装的 DOS 是作为一台计算机上的独占操作系统。 而现今，它可以很容易地安装到 Linux 上运行的一台虚拟机中。 [QEMU][19] （<ruby>快速仿真程序<rt>Quick EMUlator</rt></ruby>的缩写） 是一个开源的虚拟机软件，它可以在 Linux 中以一个“<ruby>访客<rt>guest</rt></ruby>”操作系统来运行 DOS。许多流行的 Linux 系统都默认包含了 QEMU 。

通过以下四步，很容易地在 Linux 下通过使用 QEMU 和 FreeDOS 去运行一个老的 DOS 程序。

### 第 1 步：设置一个虚拟磁盘

你需要一个地方来在 QEMU 中安装 FreeDOS，为此你需要一个虚拟的 C: 驱动器。在 DOS 中，字母`A:` 和 `B:` 是分配给第一和第二个软盘驱动器的，而 `C:` 是第一个硬盘驱动器。其它介质，包括其它硬盘驱动器和 CD-ROM 驱动器，依次分配 `D:`、`E:` 等等。

在 QEMU 中，虚拟磁盘是一个镜像文件。要初始化一个用做虚拟 `C: ` 驱动器的文件，使用 `qemu-img` 命令。要创建一个大约 200 MB 的镜像文件，可以这样输入：

```
qemu-img create dos.img 200M
```

与现代计算机相比， 200MB 看起来非常小，但是早在 1990 年代， 200MB 是非常大的。它足够安装和运行 DOS。

### 第 2 步： QEMU 选项

与 PC 仿真系统 VMware 或 VirtualBox 不同，你需要通过 QEMU 命令去增加每个虚拟机的组件来 “构建” 你的虚拟系统 。虽然，这可能看起来很费力，但它实际并不困难。这些是我们在 QEMU 中用于去引导 FreeDOS 的参数：

| | |
|:-- |:--|
| `qemu-system-i386` | QEMU 可以仿真几种不同的系统，但是要引导到 DOS，我们需要有一个 Intel 兼容的 CPU。 为此，使用 i386 命令启动 QEMU。 |
| `-m 16` | 我喜欢定义一个使用 16MB 内存的虚拟机。它看起来很小，但是 DOS 工作不需要很多的内存。在 DOS 时代，计算机使用 16MB 或者 8MB 内存是非常普遍的。 |
| `-k en-us` | 从技术上说，这个 `-k` 选项是不需要的，因为 QEMU 会设置虚拟键盘去匹配你的真实键盘（在我的例子中， 它是标准的 US 布局的英语键盘）。但是我还是喜欢去指定它。 |
| `-rtc base=localtime` | 每个传统的 PC 设备有一个实时时钟 (RTC) 以便于系统可以保持跟踪时间。我发现它是设置虚拟 RTC 匹配你的本地时间的最简单的方法。 |
| `-soundhw sb16,adlib,pcspk` | 如果你需要声音，尤其是为了玩游戏时，我更喜欢定义 QEMU 支持 SoundBlaster 16 声音硬件和 AdLib 音乐。SoundBlaster 16 和 AdLib 是在 DOS 时代非常常见的声音硬件。一些老的程序也许使用 PC 喇叭发声； QEMU 也可以仿真这个。 |
| `-device cirrus-vga` | 要使用图像，我喜欢去仿真一个简单的 VGA 视频卡。Cirrus VGA 卡是那时比较常见的图形卡,  QEMU 可以仿真它。 |
| `-display gtk` | 对于虚拟显示，我设置 QEMU 去使用 GTK toolkit，它可以将虚拟系统放到它自己的窗口内，并且提供一个简单的菜单去控制虚拟机。 |
| `-boot order=` | 你可以告诉 QEMU 从多个引导源来引导虚拟机。从软盘驱动器引导（在 DOS 机器中一般情况下是 `A:` ）指定 `order=a`。 从第一个硬盘驱动器引导（一般称为 `C:`） 使用 `order=c`。 或者去从一个 CD-ROM 驱动器（在 DOS 中经常分配为 `D:` ） 使用 `order=d`。 你可以使用组合字母去指定一个特定的引导顺序， 比如 `order=dc` 去第一个使用 CD-ROM 驱动器，如果 CD-ROM 驱动器中没有引导介质，然后使用硬盘驱动器。 |

### 第 3 步： 引导和安装 FreeDOS

现在 QEMU 已经设置好运行虚拟机，我们需要一个 DOS 系统来在那台虚拟机中安装和引导。 FreeDOS 做这个很容易。它的最新版本是 FreeDOS 1.2， 发行于 2016 年 12 月。

从 [FreeDOS 网站][20]上下载 FreeDOS 1.2 的发行版。 FreeDOS 1.2 CD-ROM “standard” 安装器 （`FD12CD.iso`） 可以很好地在 QEMU 上运行，因此，我推荐使用这个版本。

安装 FreeDOS 很简单。首先，告诉 QEMU 使用 CD-ROM 镜像并从其引导。 记住，第一个硬盘驱动器是 `C:` 驱动器，因此， CD-ROM 将以 `D:` 驱动器出现。

```
qemu-system-i386 -m 16 -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -display gtk -hda dos.img -cdrom FD12CD.iso -boot order=d
```

正如下面的提示，你将在几分钟内安装完成 FreeDOS 。

![Starting FreeDOS installation](https://opensource.com/sites/default/files/u128651/install1a.png "Starting FreeDOS installation")

![Select your keyboard layout](https://opensource.com/sites/default/files/u128651/install2_0.png "Select your keyboard layout")

![Selecting which packages to install](https://opensource.com/sites/default/files/u128651/install3.png "Selecting which packages to install")

![Rebooting after installation](https://opensource.com/sites/default/files/u128651/install4.png "Rebooting after installation")

在你安装完成之后，关闭窗口退出 QEMU。

### 第 4 步：安装并运行你的 DOS 应用程序

一旦安装完 FreeDOS，你可以在 QEMU 中运行各种 DOS 应用程序。你可以在线上通过各种档案文件或其它[网站][21]找到老的 DOS 程序。

QEMU 提供了一个在 Linux 上访问本地文件的简单方法。比如说，想去用 QEMU 共享 `dosfiles/` 文件夹。 通过使用 `-drive` 选项，简单地告诉 QEMU 去使用这个文件夹作为虚拟的 FAT 驱动器。 QEMU 将像一个硬盘驱动器一样访问这个文件夹。

```
-drive file=fat:rw:dosfiles/
```

现在，你可以使用合适的选项去启动 QEMU，加上一个外部的虚拟 FAT 驱动器：

```
qemu-system-i386 -m 16 -k en-us -rtc base=localtime -soundhw sb16,adlib -device cirrus-vga -display gtk -hda dos.img -drive file=fat:rw:dosfiles/ -boot order=c
```

一旦你引导进入 FreeDOS，你保存在 `D:` 驱动器中的任何文件将被保存到 Linux 上的 `dosfiles/` 文件夹中。可以从 Linux 上很容易地直接去读取该文件；然而，必须注意的是，启动 QEMU 后，不能从 Linux 中去改变 `dosfiles/` 这个文件夹。 当你启动 QEMU 时，QEMU 一次性构建一个虚拟的 FAT 表，如果你在启动 QEMU 之后，在 `dosfiles/` 文件夹中增加或删除文件，仿真程序可能会很困惑。

我使用 QEMU 像这样运行一些我收藏的 DOS 程序， 比如 As-Easy-As 电子表格程序。这是一个在上世纪八九十年代非常流行的电子表格程序，它和现在的 Microsoft Excel 和 LibreOffice Calc 或和以前更昂贵的 Lotus 1-2-3 电子表格程序完成的工作是一样的。 As-Easy-As 和 Lotus 1-2-3 都保存数据为 WKS 文件，最新版本的 Microsoft Excel 不能读取它，但是，根据兼容性， LibreOffice Calc 可以支持它。

![As-Easy-As spreadsheet program](https://opensource.com/sites/default/files/u128651/aseasy-regress1.png "As-Easy-As spreadsheet program")

*As-Easy-As 电子表格程序*

我也喜欢在 QEMU中引导 FreeDOS 去玩一些收藏的 DOS 游戏，比如原版的 Doom。这些老的 DOS 游戏玩起来仍然非常有趣， 并且它们现在在 QEMU 上运行的非常好。

![Doom](https://opensource.com/sites/default/files/u128651/qemu-doom.png "Doom")

*Doom*

![Heretic](https://opensource.com/sites/default/files/u128651/qemu-heretic.png "Heretic")

*Heretic*

![Jill of the Jungle](https://opensource.com/sites/default/files/u128651/qemu-jill.png "Jill of the Jungle")

*Jill of the Jungle*

![Commander Keen](https://opensource.com/sites/default/files/u128651/qemu-keen.png "Commander Keen")

*Commander Keen*

QEMU 和 FreeDOS 使得在 Linux 上运行老的 DOS 程序变得很容易。你一旦设置好了 QEMU 作为虚拟机仿真程序并安装了 FreeDOS，你将可以在 Linux 上运行你收藏的经典的 DOS 程序。

_所有图片要致谢 [FreeDOS.org][16]。_

--------------------------------------------------------------------------------

作者简介：

Jim Hall 是一位开源软件的开发者和支持者，可能最广为人知的是他是 FreeDOS 的创始人和项目协调者。 Jim 也非常活跃于开源软件适用性领域，作为 GNOME Outreachy 适用性测试的导师，同时也作为一名兼职教授，教授一些开源软件适用性的课程，从 2016 到 2017， Jim 在 GNOME 基金会的董事会担任董事，在工作中， Jim 是本地政府部门的 CIO。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/run-dos-applications-linux

作者：[Jim Hall][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

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
