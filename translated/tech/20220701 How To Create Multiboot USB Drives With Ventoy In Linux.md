[#]: subject: "How To Create Multiboot USB Drives With Ventoy In Linux"
[#]: via: "https://ostechnix.com/how-to-create-multiboot-usb-drives-with-ventoy-in-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "hanszhao80"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Linux 系统中使用 Ventoy 创建多重引导的 U 盘
======
**Ventoy** 是一个免费、开源和跨平台的程序，可以在 Linux、macOS 和微软的 Windows 中创建多重引导的 U 盘。

你不必周而复始地格式化你的 USB 设备，只需创建一次可引导的 U 盘即可，如有需要可在将来添加你想要的 ISO 数量。

你甚至可以创建子文件夹，例如 Linux ISO、Windows ISO，并把各自的 ISO 文件放在相应的文件夹里。Ventoy 会自动为新添加的 ISO 生成菜单条目，并将它们添加到启动菜单中。

一旦你创建完多重引导的 U 盘，使用它启动你的系统，选择你想加载的 ISO，马上就可以使用它。就是如此简单！

### 功能

Ventoy 有很多有用的功能，如：

- 非常容易安装和使用。
- 快速（仅受限于复制 ISO 文件的速度）。
- 你不需要解压缩 ISO 文件。直接从 ISO 文件启动即可。
- 可被安装在 U 盘／本地硬盘／SSD 盘／NVMe 盘／SD 卡中。
- 它支持<ruby>传统<rt>Legacy</rt></ruby> BIOS、IA32 UEFI、x86_64 UEFI、ARM64 UEFI、MIPS64EL UEFI 等（译者注：这些英文缩写都是代表了不同的 CPU 架构。如 IA32 是指英特尔32位体系架构，x86_64 指基于 x86 架构的64位拓展架构，ARM64 则是 ARM 体系结构的64位扩展、MIPS64EL 是指64位小端序的 MIPS 架构）。
- 支持 IA32／x86_64 UEFI 的安全启动。
- 支持主分区使用 FAT32/exFAT/NTFS/UDF/XFS/Ext2/Ext3/Ext4 格式。默认使用 exFAT。
- 支持在物理机中使用 Linux 发行版启动 vhd、vdi、raw 等格式的虚拟磁盘文件。
- 持久化的存储支持。
- MBR 和 GPT 两种分区格式都被支持。默认使用 MBR。
- 你可以用大于 4 GB 的 ISO 文件创建引导盘。
- 几乎所有类型的操作系统都支持。开发者声称超过 900 多个 ISO 文件已通过 Ventoy 的测试。
- 支持 Linux 自动安装。意味着你可以添加你的模板或脚本来进行无人值守的部署。例如，Redhat/CentOS 的 kickstart 脚本，SUSE 的 autoYast xml，Debian 的 preseed 脚本。把脚本或模板放在 U 盘里，让 ventoy 使用它进行无人值守安装。你也可以在任何时候更新这些脚本。不需要创建新的 ISO 文件，只要使用原来的 ISO 即可。
- 支持 Windows 系统的自动安装。
- 在启动期间对 USB 盘写保护。
- 不影响 USB 启动盘的正常使用。这意味着你可以将 U 盘用于文件复制等其他用途。
- 当有新的版本时可供升级时，无须重新创建 USB 启动盘。在版本升级过程中，数据不会被破坏。
- 当一个新的发行版发布时，不需要更新 Ventoy。
- 将 ISO 文件复制/粘贴到 U 盘中，即可添加一个新的操作系统，没有必要从头开始。
- 支持 <ruby>内存盘<rt>Memdisk</rt></ruby> 模式。在某些机器上，ISO可能无法加载。在这种情况下，你可以使用<ruby>内存盘<rt>Memdisk</rt></ruby> 模式。Ventoy 将把整个 ISO 文件加载到内存中，然后启动它。
- 插件框架。
- <ruby>传统<rt>Legacy</rt></ruby> 和 UEFI 的本地启动菜单风格。
- 有命令行界面、本地图形化界面和基于 Web 的图形化界面的版本可用。
- 支持主题和菜单风格的定制。
- 跨平台。它支持 Linux、manOS 和 Windows 等操作系统。
- 免费并开源！

### 在 Linux 中用 Ventoy 创建多重启动的 U 盘

正如我之前提到的，Ventoy 有命令行界面、本地图形化界面和基于 Web 的图形化界面的版本可用。

#### 1. 使用 Ventoy 命令行创建多重启动的 U 盘

首先，你需要找到你的 U 盘名称。可以通过下面的指南，来了解在 Linux 中寻找磁盘驱动器细节的不同方法。

- [如何在 Linux 中 寻找硬盘驱动器细节][1]

我将使用 `fdisk` 命令来查找我的 U 盘的详细信息：

```
$ sudo fdisk -l
```

**样例输出：**

```
[...]
Disk /dev/sdb: 14.54 GiB, 15597568000 bytes, 30464000 sectors
Disk model: Cruzer Blade    
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x4d924612
```

如你所见，我的 U 盘的名称是 `/dev/sdb`。

接下来，从[发布页][2]下载最新的 Ventoy 脚本。截至编写本指南时，最新版本是 `1.0.77`(译者注：截至翻译完成时，最新版本是  `1.0.91`)。

到你下载脚本的位置，解压它。我把它解压在一个名为 `ventoy` 的文件夹中。使用 `cd` 命令切换到 `ventoy` 目录中：

```
$ cd ventoy
```

现在，运行以下命令来创建多重启动的 U 盘：

```
$ sudo sh Ventoy2Disk.sh -I /dev/sdb
```

将 `/dev/sdb` 替换为你的 U 盘名称。

这里，大写的 `I` 参数意味着将无视之前是否安装过 ventoy，**强制安装 ventoy**到 `sdb`。当你使用小写的 **i**，若此时磁盘已经安装了ventoy ，它会安装失败。

要启用安全启动支持，使用 **-s** 参数。默认情况下，这个选项是关掉的。

```
$ sudo sh Ventoy2Disk.sh -I -s /dev/sdb
```

你将被提示确认 USB 启动盘的创建过程。仔细检查 U 盘的名称，并输入 **Y**，按回车键继续：

**样例输出:**

```
**********************************************
      Ventoy: 1.0.77  x86_64
      longpanda admin@ventoy.net
      https://www.ventoy.net
**********************************************

Disk : /dev/sdb
Model: SanDisk Cruzer Blade (scsi)
Size : 14 GB
Style: MBR

Attention:
You will install Ventoy to /dev/sdb.
All the data on the disk /dev/sdb will be lost!!!

Continue? (y/n) y

All the data on the disk /dev/sdb will be lost!!!
Double-check. Continue? (y/n) y

Create partitions on /dev/sdb by parted in MBR style ...
Done
Wait for partitions ...
partition exist OK
create efi fat fs /dev/sdb2 ...
mkfs.fat 4.2 (2021-01-31)
success
Wait for partitions ...
/dev/sdb1 exist OK
/dev/sdb2 exist OK
partition exist OK
Format partition 1 /dev/sdb1 ...
mkexfatfs 1.3.0
Creating... done.
Flushing... done.
File system created successfully.
mkexfatfs success
writing data to disk ...
sync data ...
esp partition processing ...

Install Ventoy to /dev/sdb successfully finished.
```

![在 Linux 操作系统中用 Ventoy 创建多重引导的 U 盘][3]

几秒钟后，多重启动的 U 盘将被创建。

上述命令将创建两个分区。你可以用 `fdisk` 命令来验证它：

```
$ sudo fdisk -l
```

**样例输出：**

```
[...]
Disk /dev/sdb: 14.53 GiB, 15597568000 bytes, 30464000 sectors
Disk model: Cruzer Blade    
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x436cedd0

Device     Boot    Start      End  Sectors  Size Id Type
/dev/sdb1  *        2048 30398463 30396416 14.5G  7 HPFS/NTFS/exFAT
/dev/sdb2       30398464 30463999    65536   32M ef EFI (FAT-12/16/32)
```

现在打开你的文件管理器，把 ISO 文件复制到第一个分区。不用担心你分不清楚哪个是第一个分区，你的文件管理器将只显示第一个分区。

![将 ISO 文件复制到用 Ventoy 创建的 USB 启动盘上][4]

你甚至可以为不同的 ISO 文件类型创建子文件夹。例如，你可以为存储 Linux ISO 文件创建一个子文件夹，为 BSD ISO 文件创建一个子文件夹，为 Windows ISO 文件创建一个子文件夹。

Ventoy 将扫描整个 U 盘，为所有可用的 ISO 文件创建菜单项，并自动将它们添加到 Ventoy 的主启动菜单中。

如果你喜欢用命令行方式复制 ISO 文件，请到你保存 ISO 文件的地方，用 `rsync` 程序从命令行复制所有 ISO 文件，如下所示：

```
$ rsync *.iso /media/$USER/ventoy/ --progress -ah
```

请注意，在某些 Linux 发行版中，U 盘可能被安装在 **/run/media/** 位置。

大功告成！我们刚刚用 Ventoy 创建了多重引导的 U 盘。

用新制作的可引导 U 盘启动你的系统，你会对 Ventoy 的启动菜单感到满意：

![Ventoy 的多重启动菜单][5]

选择你想启动的操作系统，并按下回车键加载它！

下面是用 Ventoy 创建的多重启动 U 盘的简短视频演示：（译者注：此处视频链接丢失，建议将本段删除）

![][6]

![][7]

很酷，不是吗？确实如此！

如果你想在 Oracle Virtualbox 中用 U 盘启动，请参考以下指南：

* [如何在 Linux 中从 U 盘 启动 Virtualbox 的虚拟系统？][8]

#### 2. 使用 Ventoy 图形化界面创建多重启动的 U 盘

最初，Ventoy 在 Linux 平台上没有任何图形化的用户界面。我们在 Linux 中只能使用Ventoy 的命令行模式创建 USB 启动盘。

幸运的是，Ventoy 从 1.0.36 版开始提供基于网络的图形用户界面，从 1.0.52 版开始提供本地化图形用户界面（使用GTK/QT）。

相信我，Ventoy 的图形化用户界面使用起来非常简单！它的界面非常小巧，但它拥有我们所需要的一切，只需点击几下鼠标就能创建一个单一的或多重引导的启动盘。

打开你的终端，进入你下载最新 Ventoy 程序的位置。

```
$ cd Downloads/ventoy-1.0.77/
```

运行适配的 Ventoy 图形化用户界面可执行文件，这取决于发行版的架构。

- VentoyGUI.i386 - 32 位的 X86 架构的操作系统适用
* VentoyGUI.x86_64 - 64 位的 X86 架构的操作系统适用
* VentoyGUI.aarch64 - ARM64 架构的操作系统适用
* VentoyGUI.mips64el - 龙芯 3A MIPS 架构的操作系统适用

我使用的是 Debian 11 X86 64位系统，所以我运行以下命令：

```
$ ./VentoyGUI.x86_64
```

这就是 Ventoy 图形用户界面的样子。

![Ventoy 图形用户界面][9]

Ventoy 会自动为你选择已插入的 U 盘。但是我建议你确认所选择的是否真的是你想格式化的 U 盘。

![使用 Ventoy 图形用户界面创建多重启动的 U 盘][10]

你将被提示确认该过程。点击 OK 继续。

##### Ventoy 选项和语言

从菜单栏中点击<ruby>选项<rt>Option</rt><ruby>按钮。

![Ventoy 选项][11]

从<ruby>选项<rt>Option</rt><ruby>下拉按钮，你可以做以下事情：

- <ruby>安全启动支持<rt>Secure Boot Support</rt></ruby> - 勾选/取消勾选以启用或禁用安全启动。默认情况下，它处于选中状态以示启用。
- <ruby>分区格式<rt>Partition Style</rt></ruby> - 支持 MBR 和 GPT 分区格式。默认是 MBR。
- <ruby>分区配置<rt>Partition Configuration</rt></ruby> - 在这里，你可以选择在磁盘的末端保留一些空闲空间。
- <ruby>清除<rt>Clear</rt></ruby> Ventoy - 从你的磁盘中删除 Ventoy。
- <ruby>显示所有设备<rt>Show All Devices</rt></ruby> - 如果你想显示包括你的本地磁盘在内的所有连接的设备，请选中这个选项。在选择这个选项时要特别小心。你可能会不小心选择你的一个本地磁盘并将其格式化。

<ruby>语言<rt>Language</rt></ruby>按钮允许你选择你喜欢的语言。

##### 更新 Ventoy

每当有新的 Ventoy 版本发布时，没有必要重新创建可引导的 USB 启动盘。你可以安全地将Ventoy 更新到新版本，而不会丢失 U 盘中的任何现有数据。

要将已安装的 Ventoy 版本更新到最新的可用版本，请插入 U 盘并启动 Ventoy 图形化用户界面，如上所示。

在 Ventoy 图形化用户界面中, 点击 <ruby>更新<rt>Update</rt></ruby> 按钮。

![更新 Ventoy][12]

#### 3. 使用 Ventoy 基于 Web 的图形化用户界面创建多重启动的 USB 启动盘

Ventoy 基于 Web 的图形化用户界面与本地图形化用户界面完全相同。有一天，我在我的Fedora Linux 桌面系统上试用了 Ventoy 基于 Web 的用户界面。我很惊讶我是多么喜欢Ventoy 图形用户界面的简洁。

要了解如何使用 Ventoy 图形用户界面创建可引导的 U 盘，请参考以下链接：

* [在 Linux 中用 Ventoy 基于 Web 的用户界面创建可引导的 U 盘][13]

#### 将 ISO 镜像加载到 RAM 中

就像我之前提到的，ISO 镜像在某些机器上可能无法启动，特别是在传统的 BIOS 模式下。这就是 <ruby>内存盘<rt>Memdisk</rt></ruby> 模式的用武之地。

当 <ruby>内存盘<rt>Memdisk</rt></ruby> 模式被启用时，Ventoy 将把整个 ISO 镜像文件加载到内存中启动。

在选择操作系统之前按 F1 键，启用 <ruby>内存盘<rt>Memdisk</rt></ruby>模式（译者注：从 1.0.83 版本开始，进入 Memdisk 模式的快捷键从 F1 改成了 Ctrl+d）。当 <ruby>内存盘<rt>Memdisk</rt></ruby> 模式启用时，你会在右上角看到通知。

![启用 Ventoy 的内存盘模式][14]

现在，ISO 将被加载到内存中：

![在 Ventoy 中加载 ISO 到内存][15]

请再次按`F1`键以切换回正常模式。

### 创建持久化的可引导 U 盘

我们现在知道如何在 Linux 中用 Ventoy 创建多重启动的 U 盘。我们可以使用这个可引导的USB 启动盘来测试 Linux 发行版，而不必真的在硬盘上安装它们。

当你在 Live OS 上时，你可以做各种事情，如安装应用程序、下载文件、播放媒体文件、创建文件和文件夹、按照你的喜好定制等等。

然而，一旦你重新启动系统，所有上述变化都将消失。如果你想让所有的改变在重启系统后仍然保留，你应该创建一个持久化的可引导的 U 盘。

Ventoy 能够制作持久化的 USB 启动盘。请参考下面的链接学习怎么做。

* [在 Linux 中使用 Ventoy 创建持久化的可引导 U 盘][16]

### 总结

信不信由你，Ventoy 是我用过的在 Linux 中创建多重引导（持久或非持久）的 USB 闪存盘工具中最简单、最快速、最巧妙的之一。

它真的做到了开箱即用！试一下吧，你不会失望的!

### 与 Ventoy 有关的安全问题

Ventoy 网站、论坛和该网站上的一些文件被一些杀毒软件标记为恶意软件或木马。请查看该项目在 GitHub 页面中发布的问题：

- [https://github.com/ventoy/Ventoy/issues/22][17]
- [https://github.com/ventoy/Ventoy/issues/83][18]
- [https://github.com/ventoy/Ventoy/issues/31][19]

然而，Manjaro 打包者 **Linux Aarhus** 在代码审查后争论：为什么对这个应用程序的安全性没有合理的怀疑。

他声称 **没有混淆的代码**。所以，我猜测 Ventoy 用起来是**安全的**。

**资源:**

* [Ventoy 官网][20]
* [Ventoy GitHub 仓库][21]

--------------------------------------------------------------------------------

via: https://ostechnix.com/how-to-create-multiboot-usb-drives-with-ventoy-in-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/how-to-find-hard-disk-drive-details-in-linux/
[2]: https://github.com/ventoy/Ventoy/releases
[3]: https://ostechnix.com/wp-content/uploads/2022/07/Create-Multiboot-USB-Drives-With-Ventoy-In-Linux.png
[4]: https://ostechnix.com/wp-content/uploads/2020/05/Copy-ISO-files-to-USB-bootable-drive.png
[5]: https://ostechnix.com/wp-content/uploads/2020/05/Ventoy-multiboot-menu.png
[6]: https://i.ytimg.com/vi/VFr1mAikeJU/maxresdefault.jpg
[7]: https://ostechnix.com/wp-content/plugins/penci-shortcodes/pagespeed/assets/play-btn.png
[8]: https://ostechnix.com/how-to-boot-from-usb-drive-in-virtualbox-in-linux/
[9]: https://ostechnix.com/wp-content/uploads/2022/07/Ventoy-GUI.png
[10]: https://ostechnix.com/wp-content/uploads/2022/07/Create-Multiboot-USB-Drives-Using-Ventoy-GUI.png
[11]: https://ostechnix.com/wp-content/uploads/2022/07/Ventoy-Options.png
[12]: https://ostechnix.com/wp-content/uploads/2022/07/Update-Ventoy.png
[13]: https://ostechnix.com/create-bootable-usb-drive-with-ventoy-webui-in-linux/
[14]: https://ostechnix.com/wp-content/uploads/2020/05/Enable-Memdisk-mode-in-Ventoy.png
[15]: https://ostechnix.com/wp-content/uploads/2020/05/Load-ISO-to-memory-in-Ventoy.png
[16]: https://ostechnix.com/create-persistent-bootable-usb-using-ventoy-in-linux/
[17]: https://github.com/ventoy/Ventoy/issues/22
[18]: https://github.com/ventoy/Ventoy/issues/83
[19]: https://github.com/ventoy/Ventoy/issues/31
[20]: https://www.ventoy.net/en/index.html
[21]: https://github.com/ventoy/Ventoy
