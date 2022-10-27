[#]: subject: (How to use FreeDOS as an embedded system)
[#]: via: (https://opensource.com/article/21/6/freedos-embedded-system)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14014-1.html)

如何将 FreeDOS 作为嵌入式系统使用
======

> 现在，很多嵌入式系统都是在 Linux 上运行的。但是，在很久很久以前，嵌入式系统要么在一个定制的专有的平台上运行，要么在 DOS 上运行。

![](https://img.linux.net.cn/data/attachment/album/202111/24/134734s6zuftzjgtt8herp.jpg)

[FreeDOS 网站][2] 宣称，大多数人使用 FreeDOS 来完成三项主要任务：

  1. 玩经典的 DOS 游戏
  2. 运行老式的 DOS 软件
  3. 运行一款嵌入式系统

但是，运行一个“嵌入式”系统的意义是什么呢？

嵌入式系统基本上是一款非常小的系统，专用于运行一个特定的任务。你可以把现在的嵌入式系统当作是 _物联网_（IoT）的一部分，这包括传感器、恒温器和门铃摄像头。现在，很多嵌入式系统都是在 Linux 上运行的。

但是，在很久很久以前，嵌入式系统要么在一个定制的专有的平台上运行，要么在 DOS 系统上运行。在现在，一些基于 DOS 的嵌入式系统仍然在运行，例如，收银机或电话专用交换机（PBX）系统。举个例子来说，在 2017 年，酷爱列车的人发现一个正在运行 FreeDOS 的俄罗斯的电动列车控制系统 （俄语: _САВПЭ_），它使用特殊的软件来控制和监控郊区列车的线路，并发布乘客通告。

在 DOS 上建立一个嵌入式系统需要定义一个最小化的 DOS 环境来运行单个应用程序。幸运的是，设置一个最小化的 FreeDOS 环境是非常容易的。从技术上来说，启动 FreeDOS 并运行 DOS 应用程序仅需要内核和一个 `FDCONFIG.SYS` 配置文件。

### 安装一款最小化的系统

我们可以使用 QEMU 仿真器来模拟一个专用的、最小化的 FreeDOS 系统，并给它分配很少的资源。为了更准确地反映一个嵌入式系统，我将定义一个只有 8 MB 的存储器和仅仅有 2 MB 的硬盘驱动器的虚拟机。

为创建这个微小的虚拟硬盘，我将使用这个 `qemu-img` 命令来定义一个 2M 的文件：

```
$ qemu-img create tiny.img 2M
Formatting 'tiny.img', fmt=raw size=2097152
```

下面的这行命令定义了一个 32 位的 “i386” CPU、8MB 的存储器，使用 2MB 的 `tiny.img` 文件作为硬盘驱动器镜像，使用 FreeDOS 1.3 RC4 LiveCD 作为 CD-ROM 介质。我们也将机器设置为从 CD-ROM 驱动器启动（`-boot order=d`），尽管我们只需要用它来安装系统。在我们完成所有的设置后，我们将从该硬盘启动完成的嵌入式系统：

```
qemu-system-i386 -m 8 -hda tiny.img -cdrom FD13LIVE.iso -boot order=d
```

使用 “<ruby>现场环境模式<rt>Live Environment mode</rt></ruby>” 来启动系统，这将为我们提供一个正在运行的 FreeDOS 系统，我们可以使用它来将一个最小化的 FreeDOS 转移到硬盘上。

![embedded setup][3]

*启动到 LiveCD 环境之中（Jim Hall, [CC-BY SA 4.0][4]）*

我们需要在虚拟硬盘驱动器上为我们的程序创建一个分区。为此，从命令行中运行 `FDISK` 程序。`FDISK` 是 FreeDOS 上的一个标准的 _磁盘分区_ 实用程序。使用 `FDISK` 来创建一个单个硬盘驱动器分区，占用整个（2 MB）硬盘驱动器。

![embedded setup][5]

*FDISK，在创建 2 MB 分区后（Jim Hall, [CC-BY SA 4.0][4]）*

但是，在你重新启动 FreeDOS 之前，FreeDOS 不会看到新的硬盘驱动器分区 — FreeDOS 仅在启动时读取硬盘详细信息。退出 `FDISK` ，并重新启动 FreeDOS 。

在重新启动后，你需要在新的硬盘驱动器上创建一个 DOS 文件系统。因为这里只有一个虚拟硬盘，FreeDOS 将识别其为 `C:` 驱动器。你可以使用 `FORMAT` 命令来在 `C:` 驱动器上创建一个 DOS 文件系统。使用 `/S` 选项将把操作系统文件（内核，外加一个 `COMMAND.COM` shell 的副本）转移到新的驱动器上。

![embedded setup][6]

*格式化新的驱动器来创建一个 DOS 文件系统（Jim Hall, [CC-BY SA 4.0][4]）*
 
你已经创建了硬盘驱动器并将其格式化，现在，你可以安装应用程序，这些应用程序是将会在新安装的嵌入式系统上运行的。

### 安装专用的应用程序

嵌入式系统实际上只是一个运行在一个专用系统上的单一用途的应用程序。这些应用程序通常是为其将要控制的系统而自定义构建的，例如，一台收银机、显示终端、或控制环境。在这个演示中，让我们使用一个来自 FreeDOS 1.3 RC4 安装光盘中的程序。它需要足够小，以适应我们为其创建的 2 MB 微型硬盘驱动器。这可以是任何东西，所以，为了好玩，让我们把它变成一个游戏。

FreeDOS 1.3 RC4 包含一些有趣的游戏。我喜欢的一个游戏是一个名称为 “Simple Senet” 的棋类游戏。它是一个基于 Senet 的古埃及棋类游戏。游戏的细节对这个演示并不重要，我们将安装它，并将其设置为嵌入式系统的专业应用程序。

为安装应用程序，在 FreeDOS 1.3 RC4 LiveCD 上，进入 `\PACKAGES\GAMES` 目录。你将在其中看到一个很长的软件包列表，而我们想要的 `SENET.ZIP` 。

![embedded setup][7]

*来自 FreeDOS 1.3 RC4 的一个游戏软件包列表（Jim Hall, [CC-BY SA 4.0][4]）*

为解压缩 “Simple Senet” 软件包到虚拟硬盘上，使用 `UNZIP` 命令。所有的 FreeDOS 软件包都是 Zip 文件，因此，你可以使用任意与 Zip 兼容的档案实用程序来管理它们。FreeeDOS 1.3 RC4 包含创建 Zip 档案文件的 `ZIP` 和提取 Zip 档案文件的 `UNZIP` 。它们都来自 [Info-Zip 项目][8] 。

```
UNZIP SENET.ZIP -d C:\FDOS
```

通常，使用 `UNZIP` 来提取 Zip 文件到当前目录中。在命令行结尾的 `-d C:\FDOS` 选项将告诉 `UNZIP` 来提取 Zip 文件到 `C:\FDOS` 目录之中。（`-d` 指的是“目的地”）

![embedded setup][9]

*解压缩 Simple Senet 游戏（Jim Hall, [CC-BY SA 4.0][4]）*

为了让嵌入式系统启动时运行 “Simple Senet” 游戏，我们需要告诉 FreeDOS 来使用 Senet 作为系统的 “shell” 。 默认的 FreeDOS 的 shell 是 `COMMAND.COM` 程序，但是，你可以在 `FDCONFIG.SYS` 内核配置文件中使用 `SHELL=` 指令来定义一个不同的 shell 程序。我们可以使用 FreeDOS 的 Edit 来创建新的 `C:\FDCONFIG.SYS` 文件。

![Embedded edit senet][10]

*（Jim Hall, [CC-BY SA 4.0][4]）*

如果你需要定义其它的参数来支持嵌入式系统，你可以将其添加到 `FDCONFIG.SYS` 文件之中。例如，你可能需要使用 `SET` 动作来设置环境变量，或者使用 `FILES=` 或 `BUFFERS=` 语句来调整 FreeDOS 内核。

### 运行嵌入式系统

在全面地完成嵌入式系统的定义之后，现在，我们可以重新启动计算机来运行嵌入式应用程序。运行一个嵌入式系统通常仅需要有限的资源，因此，在这个演示中，我们需要调整 QEMU 命令行来只从硬盘驱动器（`-boot order=c`）中启动，而不再定义一个 CD-ROM 驱动器：

```
qemu-system-i386 -m 8 -hda tiny.img -boot order=c
```

当 FreeDOS 内核启动时，它将读取 `FDCONFIG.SYS` 文件以获取启动参数。然后，它将使用 `SHELL=` 行的定义来运行 shell 。这将自动地运行 “Simple Senet” 游戏。

![embedded setup][11]

*作为一个嵌入式系统运行 Simple Senet（Jim Hall, [CC-BY SA 4.0][4]）*

我们已经使用了 “Simple Senet” 来演示如何在 FreeDOS 上设置一个嵌入式系统。根据你的需要，你可以使用任何你喜欢的独立应用程序。在 `FDCONFIG.SYS` 中使用 `SHELL=` 行将其定义为 DOS 的 shell ，FreeDOS 将在启动时自动地启动该应用程序。

不过，在这里有一个限制。嵌入式系统通常不需要退回到一个命令行提示符之中，因此这些专用应用程序通常不允许用户退出到 DOS 之中。如果你设法退出了嵌入式应用程序，你可能会看到一个 “Bad or missing Command Interpreter” 的提示，你将需要在其中输入一个新的 shell 的完整路径。对于一个以用户为中心的桌面系统来说，这将是一个问题。但是在一个嵌入式系统上，它只专注执行一种工作的，那么，你也永远不需要退出嵌入式应用程序。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/freedos-embedded-system

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_space_graphic_cosmic.png?itok=wu493YbB (Computer laptop in space)
[2]: https://www.freedos.org/
[3]: https://opensource.com/sites/default/files/uploads/embedded-setup02.png (Boot into the LiveCD environment)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/uploads/embedded-setup09.png (FDISK, after creating the 2 megabyte partition)
[6]: https://opensource.com/sites/default/files/uploads/embedded-setup19.png (Format the new drive to create a DOS filesystem)
[7]: https://opensource.com/sites/default/files/uploads/games-dir.png (A list of game packages from FreeDOS 1.3 RC4)
[8]: http://infozip.sourceforge.net/
[9]: https://opensource.com/sites/default/files/uploads/senet-unzip.png (Unzipping the Simple Senet game)
[10]: https://opensource.com/sites/default/files/pictures/embedded-edit-senet.png (Embedded edit senet)
[11]: https://opensource.com/sites/default/files/uploads/senet.png (Running Simple Senet as an embedded system)
