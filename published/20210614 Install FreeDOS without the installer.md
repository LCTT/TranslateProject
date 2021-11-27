[#]: subject: (Install FreeDOS without the installer)
[#]: via: (https://opensource.com/article/21/6/install-freedos-without-installer)
[#]: author: (Jim Hall https://opensource.com/users/jim-hall)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14022-1.html)

不使用安装程序安装 FreeDOS
======

> 这里是如何在不使用安装程序的情况下来手动设置你的 FreeDOS 系统。

![](https://img.linux.net.cn/data/attachment/album/202111/25/235643wvmciyy2f8y3mi73.jpg)

大多数的人应该能够使用安装程序来非常容易地安装 FreeDOS 1.3 RC4 。FreeDOS 安装程序会先询问几个问题，然后处理剩余的工作，包括为 FreeDOS 制作安装空间和使系统可启动。

但是，如果安装程序不适合你怎么办？或者，你更喜欢 _手动_ 设置你的 FreeDOS 系统，而不喜欢使用安装程序怎么办？使用 FreeDOS ，你也可以做到这些！让我们在不使用安装程序的情况下逐步走完安装 FreeDOS 的步骤。我将使用 QEMU 虚拟机的一个空白的硬盘驱动器镜像来完成所有的步骤。我使用这个 Linux 命令来创建了一个 100 MB 的硬盘驱动器镜像：

```
$ qemu-img create freedos.img 100M
```

我下载了 FreeDOS 1.3 RC4 的 LiveCD ，并将其命名为 `FD13LIVE.iso` ，它提供了一个 “身临其境” 的环境，我可以在其中运行 FreeDOS ，包括所有的标准工具。大多数用户也使用 LiveCD 自带的常规安装程序来安装 FreeDOS 。但是，在这里我将仅使用 LiveCD ，并从其命令行中使用某些类型的命令来安装 FreeDOS 。

我使用这个相当长的 QEMU 命令来启动虚拟机，并选择 “Use FreeDOS 1.3 in Live Environment mode” 启动菜单项：

```
$ qemu-system-x86_64 -name FreeDOS -machine pc-i440fx-4.2,accel=kvm,usb=off,dump-guest-core=off -enable-kvm -cpu host -m 8 -overcommit mem-lock=off -no-user-config -nodefaults -rtc base=utc,driftfix=slew -no-hpet -boot menu=on,strict=on -sandbox on,obsolete=deny,elevateprivileges=deny,spawn=deny,resourcecontrol=deny -msg timestamp=on -hda freedos.img -cdrom FD13LIVE.iso -device sb16 -device adlib -soundhw pcspk -vga cirrus -display sdl -usbdevice mouse
```

![manual install][2]

*选择 "Use FreeDOS 1.3 in Live Environment mode" 来启动 LiveCD（Jim Hall, [CC-BY SA 4.0][3]）*

这个 QEMU 命令行包含大量的选项，乍看可能会让你迷糊。因为你完全使用命令行选项配置 QEMU ，所以在这里有很多东西需要审查。但是，我将简单地重点说明几个重要的选项：

  * `-m 8`：设置系统存储器（RAM）为 8 MB
  * `-boot menu=on,strict=on`：使用一个启动菜单，这样，我可以选择从 CD-ROM 镜像或硬盘驱动器镜像启动
  * `-hda freedos.img`：使用 `freedos.img` 作为硬盘驱动器镜像
  * `-cdrom FD13LIVE.iso`：使用 `FD13LIVE.iso` 作为 CD-ROM 镜像
  * `-device sb16 -device adlib -soundhw pcspk`：定义计算机带有一个 SoundBlaster16 声卡、AdLib 数字音乐卡、PC 扬声器模拟器（如果你想玩 DOS 游戏的话，这些模拟器很有用）
  * `-usbdevice mouse`：将用户的鼠标识别为一个 USB 鼠标（在 QEMU 窗口中单击以使用鼠标）

### 对硬盘驱动器进行分区

你可以从 LiveCD 使用 FreeDOS 1.3 RC4 ，但是，如果你想安装 FreeDOS 到你的计算机中，你需要先在硬盘驱动器上制作安装空间。这需要使用 FDISK 程序来创建一个 _分区_ 。

从 DOS 命令行中，输入 `FDISK` 来运行 _分区_ 设置程序。FDISK 是一个全屏交互式程序，你只需要输入数字来选择菜单项。从 FDISK 的主菜单中，输入 `1` 来在驱动器上创建一个 DOS 分区，然后在接下来的屏幕上输入 `1` 来创建一个 “主” DOS 分区。

![using fdisk][4]

*选择 `1` 来创建一个分区（Jim Hall, [CC-BY SA 4.0][3]）*

![using fdisk][5]

*在接下来的菜单上选择 `1` 来制作一个主分区（Jim Hall, [CC-BY SA 4.0][3]）*

`FDISK` 会询问你是否想要使用全部的硬盘空间大小来创建分区。除非你需要在这个硬盘驱动器上和另外一个操作系统（例如 Linux）共享硬盘空间，否则，对于这个提示，你应该回答 `Y` 。

在 `FDISK` 创建新的分区后，在 DOS 能够识别新的分区信息前，你将需要重新启动 DOS 。像所有的 DOS 操作系统一样，FreeDOS 仅在其启动时识别硬盘驱动器信息。因此，如果你创建或删除任何的磁盘分区的话，你都将需要重新启动 FreeDOS ，只有这样做，FreeDOS 才能识别到更改的分区信息。`FDISK` 会提醒你重新启动，因此，你是不会忘记的。

![using fdisk][6]

*你需要重新启动以识别新的分区（Jim Hall, [CC-BY SA 4.0][3]）*

你可以通过停止或重新启动 QEMU 虚拟机来重新启动 FreeDOS，但是我更喜欢在 FreeDOS 命令行中使用 FreeDOS 的高级电源管理（`FDADPM`）工具来重新启动 FreeDOS 。为了重新启动，输入命令 `FDADPM /WARMBOOT` ，FreeDOS 将自动重新启动。

### 对硬盘驱动器进行格式化

在 FreeDOS 重新启动后，你可以继续设置硬盘驱动器。创建磁盘分区是这个过程的“第一步”；现在你需要在分区上创建一个 DOS _文件系统_ ，以便 FreeDOS 可以使用它。

DOS 系统使用字母 `A` 到 `Z` 来识别“驱动器”。FreeDOS 将识别第一个硬盘驱动器的第一个分区为 `C` 驱动器，依此论推。你经常使用字母和一个冒号（`:`）来表示驱动器，因此我们在上面创建的新分区实际上是 `C:` 驱动器。

你可以在新的分区上使用 `FORMAT` 命令来创建一个 DOS 文件系统。这个命令带有一些选项，但是，我们将仅使用 `/S` 选项来告诉 `FORMAT` 来使新的文件系统可启动： `S` 意味着安装 FreeDOS “系统” 文件。输入 `FORMAT /S C:` 来在 `C:` 驱动器上制作一个新的 DOS 文件系统。

![formatting the disk][7]

*格式化分区来创建 DOS 文件系统（Jim Hall, [CC-BY SA 4.0][3]）*

使用 `/S` 选项，`FORMAT` 将运行 `SYS` 程序来传输系统文件。你将看到这是从 `FORMAT` 输出的一部分:

![formatting the disk][8]

*`FORMAT /S` 将使用 SYS 来使磁盘可启动（Jim Hall, [CC-BY SA 4.0][3]）*

### 安装软件

在使用 `FDISK` 创建了一个新的分区，并使用 `FORMAT` 创建了一个新的文件系统后, 新的 `C:` 驱动器基本上是空的。此时，`C:` 驱动器仅包含一份内核和 `COMMAND.COM` 命令行 shell 的副本。为使新的磁盘可以执行一些有用的操作，我们需要在其上安装软件。这是手动安装过程的最后步骤。

FreeDOS 1.3 RC4 LiveCD 包含所有的你可能希望在新的系统上所要安装的软件。每个 FreeDOS 程序都是一个单独的 “软件包” ，它实际上只是一个 Zip 档案文件。建立标准 DOS 环境的软件包存储在 LiveCD 上 `PACKAGES` 目录下的 `BASE` 目录之中。

你可以一次一个的将其中的每一个软件包都 “解压缩” 到硬盘驱动器来完成安装。在 `Base` 组中有 62 个单独的软件包，如果每次安装一个软件包，这可能会花费非常多的时间。不过，你可以运行一个只有一行的 `FOR` “循环” 命令来 `UNZIP` 每个程序。接下来 FreeDOS 可以为你 “解压缩” 所有的软件包。

`FOR` 循环的基本用法中提及的一个单个字母变量（让我们使用 `%F`），稍后，FreeDOS 将使用该字母变量来 “填充” 文件名称。`FOR` 还需要括号中的一个文件列表，这个命令会对每个文件都运行一次。用来解压一系列的 Zip 文件的语法看起来像这样：

```
FOR %F IN (*.ZIP) DO UNZIP %F
```

这将提取所有的 Zip 文件到当前目录之中。为提取或 `UNZIP` 文件到一个不同的位置，在 `UNZIP` 命令行结尾处使用 `-d` (“目的地”) 选项。对于大多数的 FreeDOS 系统来说，你应该安装软件包到 `C:\FDOS` 目录中：

![installing the software][9]

*解压缩所有的基本软件包来完成安装 FreeDOS（Jim Hall, [CC-BY SA 4.0][3]）*

FreeDOS 会处理剩余的工作，安装所有的 62 个软件包到你的系统之中。这可能会花费几分钟的时间，因为 DOS 在处理很多单个的文件时会很慢，这个命令需要提取 62 个 Zip 文件。如果我们使用单个的 `BASE.ZIP` 档案文件的话，安装过程可能会运行地更快，但是使用软件包的话，在你选择想要安装或不安装软件包时会提供更多的灵活性。

![installing the software][10]

*在安装所有的基本软件包后（Jim Hall, [CC-BY SA 4.0][3]）*

在我们安装完所有的东西后，使用 `FDADPM /WARMBOOT` 来重新启动你的系统。手动安装意味着你的新 FreeDOS 系统没有常见的 `FDCONFIG.SYS` 配置文件，因此，当 FreeDOS 在启动时，它将假设一些典型的默认值。因为没有 `AUTOXEC.BAT` 文件，FreeDOS 也会提示你时间和日期。

![rebooting FreeDOS][11]

*在手动安装后，重新启动 FreeDOS（Jim Hall, [CC-BY SA 4.0][3]）*

大多数的用户应该能够使用比较用户友好的过程来在一台新的计算机上安装 FreeDOS 。但是如果你想自己使用“古老的”方法来安装它，那么你可以手动运行安装步骤。这会提供一些额外的灵活性和控制权，因为是你自己安装的一切。现在你知道如何安装它了。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/install-freedos-without-installer

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/freedos-fish-laptop-color.png?itok=vfv_Lpph (FreeDOS fish logo and command prompt on computer)
[2]: https://opensource.com/sites/default/files/uploads/manual-install3.png (Select "Use FreeDOS 1.3 in Live Environment mode" to boot the LiveCD)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/sites/default/files/uploads/manual-install6.png (Select "1" to create a partition)
[5]: https://opensource.com/sites/default/files/uploads/manual-install7.png (Select "1" on the next menu to make a primary partition)
[6]: https://opensource.com/sites/default/files/uploads/manual-install10.png (You need to reboot to recognize the new partition)
[7]: https://opensource.com/sites/default/files/uploads/manual-install13.png (Format the partition to create the DOS filesystem)
[8]: https://opensource.com/sites/default/files/uploads/manual-install14.png (FORMAT /S will use SYS to make the disk bootable)
[9]: https://opensource.com/sites/default/files/uploads/manual-install18.png (Unzip all of the Base packages to finish installing FreeDOS)
[10]: https://opensource.com/sites/default/files/uploads/manual-install24.png (After installing all the Base packages)
[11]: https://opensource.com/sites/default/files/uploads/manual-install28.png (Rebooting FreeDOS after a manual install)
