[#]: subject: (Try Linux on any operating system with VirtualBox)
[#]: via: (https://opensource.com/article/21/6/try-linux-virtualbox)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (chai001125)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15183-1.html)

使用 VirtualBox 安装 Linux 虚拟机
======

> VirtualBox 能帮助任何人（即使是命令行新手）安装一个新的虚拟机。

![](https://img.linux.net.cn/data/attachment/album/202210/27/104215te6xpq2e2vvxprjs.jpg)

VirtualBox 能让任何人都可以轻松安装 Linux 虚拟机。你不需要有使用命令行的经验，就可以自己安装一个简单的 Linux 虚拟机。在虚拟机方面，我精通很多东西，但这篇文章将向新手展示如何安装一个 Linux 虚拟机。此外，这篇文章还概述了如何使用开源虚拟机管理程序 [VirtualBox][2] ，来运行以及安装一个测试目的的 Linux 系统。

### 一些术语

在开始之前，你需要了解在本安装教程中的两个操作系统（OS）之间的区别：

  * <ruby>主机系统<rt>host system</rt></ruby>：这指的是你安装 VirtualBox 的操作系统（即本机的操作系统）。
  * <ruby>客体系统<rt>guest system</rt></ruby>：这指的是你想要在主机系统之上运行的虚拟化系统。

在输入/输出、网络、文件访问、剪贴板、音频和视频方面，主机系统和客体系统都必须能够交互。

在本教程中，我将使用 Windows 10 作为 _主机系统_，[Fedora 33][3] 作为 _客体系统_。

### 安装前的准备

当我们谈论虚拟化时，实际上，我们指的是 [硬件辅助虚拟化][4]。硬件辅助虚拟化需要兼容的 CPU。过去十年来，几乎每个普通的 x86 CPU 都有这一功能。AMD 公司称这样的 x86 CPU 是具有 **AMD 虚拟化技术（AMD-V）** 的处理器，英特尔公司则称其是具有 **Intel 虚拟化技术（VT-x）** 的处理器。虚拟化功能增加了一些额外的 CPU 指令，你可以在 BIOS 中启用或禁用这些指令。

在安装虚拟机之前：

  * 确保在 BIOS 中启用了虚拟化技术（AMD-V 或 VT-x）。
  * 下载并安装好 [VirtualBox][5]。

### 准备虚拟机

下载你要用的 Linux 发行版的镜像文件。下载 32 位还是 64 位的操作系统镜像都没有关系，因为在 32 位的主机系统上也可以启动 64 位的操作系统镜像（当然内存的使用会受限），反之亦然。

> **注意事项：** 如果可以的话，请下载附带有 [逻辑卷管理器][6]（LVM）的 Linux 发行版。LVM 会将文件系统与物理硬盘驱动器解耦。如果你的空间不足时，这能够让你增加客体系统的硬盘驱动器的大小。

现在，打开 VirtualBox，然后单击黄色的“<ruby>新建<rt>New</rt></ruby>”按钮：

![VirtualBox New VM][7]

接下来，配置客体操作系统允许使用多少内存：

![Set VM memory size][9]

我的建议是：**不要吝啬分配给客体操作系统使用的内存！** 当客体操作系统的内存不足时，客体系统将开始从随机存取存储器（RAM）向硬盘驱动器进行内存分页，这样会极大地恶化系统的性能和响应能力。如果底层的主机系统开始分页，你很可能不会注意到。对于具有图形化桌面环境的 Linux 工作站系统，我建议至少分配 4GB 内存。

接下来，创建虚拟磁盘：

![Create virtual hard disk][10]

虚拟磁盘的格式选择默认的选项 “VDI（VirtualBox 磁盘镜像）” 就可以了：

![Selecting hard disk file type][11]

在以下的窗口中，我建议选择“<ruby>动态分配<rt>dynamically allocated</rt></ruby>”，因为这允许你在之后增加虚拟磁盘的大小。如果你选择了“<ruby>固定大小<rt>fixed size</rt></ruby>”，磁盘的速度可能会更快，但你将无法修改虚拟磁盘的大小了：

![Dynamically allocating hard disk][12]

建议你使用附带有逻辑卷管理器（LVM）的 Linux 发行版，这样你就可以先创建一个较小的硬盘。如果之后你的客体系统的空间快用完了，你可以按需增加磁盘的大小。

> **注意**：我选择的客体系统为 Fedora，在 Fedora 的官网说明：[Fedora 至少需要分配 20GB 的空闲磁盘空间][13]。我强烈建议你遵守该规范。在这里，我选择了 8GB，以便稍后演示如何用命令行增加磁盘空间。如果你是 Linux 新手，或者对命令行没有经验，请依旧选择 20GB。

![Setting hard disk size][14]

创建好硬盘驱动器后，从 VirtualBox 主窗口的列表中选择新创建的虚拟机，然后单击“<ruby>设置<rt>Settings</rt></ruby>”。在设置菜单中，点击“<ruby>系统<rt>System</rt></ruby>”，然后选择“<ruby>处理器<rt>Processor</rt></ruby>”标签。默认情况下，VirtualBox 只向客体系统分配一个 CPU 内核。在现代多核 CPU 计算机上，分配至少两个内核是没有任何问题的，这能显著地加快客体系统的速度：

![Assigning cores to guest system][15]

#### 设置网络适配器

接下来，要处理的是网络设置。默认情况下， VirtualBox 会创建一个 NAT 连接，这对于大多数情况来说，是没有问题、不用做其他更改的：

![Network settings][16]

你也可以创建多个网络适配器。以下是网络适配器最常见的类型：

  * NAT：NAT 适配器能自动执行 [网络地址转换][17]。从外部看，主机和客体系统使用着相同的 IP 地址。你无法通过网络从主机系统内访问客体系统。（尽管，你也可以通过定义 [端口转发][18]，来访问某些服务。）当你的主机系统可以访问互联网时，则你的客体系统也可以访问互联网。NAT 不再需要进一步的配置。
    * _如果你只需要让客体系统接入互联网就可以的话，请选择 “NAT”。_
  * <ruby>桥接适配器<rt>Bridged adapter</rt></ruby>：在此配置中，客体系统和主机系统可以共享相同的物理以太网设备。这两个系统都将拥有独立的 IP 地址。从外部看，网络中会有两个独立的系统，它们共享相同的物理以太网适配器。这种设置更灵活，但需要更多的配置。
    * _如果你想要共享客体系统的网络服务的话，请选择 “桥接适配器”。_
  * <ruby>仅限主机的适配器<rt>Host-only adapter</rt></ruby>：在此配置中，客体系统只能与主机，或在同一主机上运行的其他客体系统相互通信。主机系统也可以连接到客体系统。但客体系统不能接入互联网或物理网络。
    * _如果你想要获得高安全性，请选择 “仅限主机的适配器”。_

#### 分配操作系统镜像

在设置菜单中，点击“<ruby>存储<rt>Storage</rt></ruby>”，然后选择虚拟光盘驱动器。单击右侧的 “光盘”图标，然后点击“<ruby>选择一个磁盘文件……<rt>Choose a disk file…</rt></ruby>”，然后分配你想要安装的、已下载的 Linux 发行版镜像：

![Assigning OS image][19]

### 安装 Linux

现在，就已经配置好了虚拟机。右上角关闭“<ruby>设置<rt>Settings</rt></ruby>”菜单，返回主窗口。点击“绿色箭头”（即“开始”按钮）。虚拟机将从虚拟光盘驱动器启动，你将发现你已经进入到 Linux 发行版的安装程序中：

![VirtualBox Fedora installer][20]

#### 设置分区

安装程序将在安装过程中要求你提供分区信息。选择“<ruby>自定义<rt>Custom</rt></ruby>”：

![Selecting Custom partition configuration][21]

> **注意：** 我假设，你创建这一虚拟机的目的是为了测试。此外，你也无需关心客体系统的休眠，因为此功能会由 VirtualBox 来隐式地提供。因此，你可以省略交换分区，以节省主机系统的磁盘空间。请记住，如果你需要的话，你可以稍后自己添加交换分区。在 《[Linux 系统交换空间的介绍][22]》 这篇文章中，作者 David Both 进一步解释了如何添加交换分区，并选择交换分区正确的大小。

Fedora 33 及之后更高的版本提供了一个 [zram 分区][23]，zram 分区可以用于存放分页和交换、并经过压缩过后的硬盘数据。zram 分区可以按需地调整大小，并且它比硬盘交换分区快得多。

为了简单，我们只添加以下两个<ruby>挂载点<rt>Mount Point</rt></ruby>：

![Adding mount points][24]

保存更改，接下来我们继续安装。

### 安装 VirtualBox 增强功能

完成安装后，从硬盘驱动器启动，并登录到虚拟机。现在，你可以安装 <ruby>VirtualBox 增强功能<rt>VirtualBox Guest Additions</rt></ruby>，其中包括特殊的设备驱动程序和系统应用程序，它们能提供以下功能：

  * 共享剪贴板
  * 共享文件夹
  * 更好的性能
  * 可自由扩展的窗口大小

点击顶部菜单栏的“<ruby>设备<rt>Devices</rt></ruby>”，然后选择“<ruby>插入增强功能的 CD 镜像……<rt>Insert Guest Additions CD image...</rt></ruby>”，来安装 VirtualBox 增强功能：

![Selecting Guest Additions CD image][25]

在大多数 Linux 发行版上，带有增强功能的 CD 镜像会自动挂载，并且能够在文件管理器中找到。Fedora 会问你是否要运行安装脚本。单击“<ruby>运行<rt>Run</rt></ruby>”，并授予该安装进程 root 权限：

![Enabling Guest Additions autorun][26]

安装完成后，需要重新启动系统。

### LVM：扩大磁盘空间

我在之前给 Fedora 虚拟机分配了 8GB 硬盘空间，是一个愚蠢的决定，因为 Fedora 很快就会告警空间不足：

![Fedora hard disk running out of space][27]

正如我提到的，Fedora 官网建议安装时分配 20GB 的磁盘空间。因为 8GB 是 Fedora 33 安装启动就需要的最少空间。没有安装其他软件（除了 VirtualBox 增强功能）的一个新安装的系统就几乎占用了整个 8GB 的可用空间。这时候，不要打开 GNOME 软件中心或任何其他可能从互联网下载文件的东西。

幸运的是，我选择了附带有 LVM 的 Fedora，这样我就可以用命令行轻松地修复这个问题。

要增加虚拟机中文件系统的空间，你必须先增加主机系统上分配的虚拟硬盘驱动器。

关闭虚拟机。如果你的主机系统运行的是 Windows，请打开终端，并进入到 `C:\Program Files\Oracle\VirtualBox` 目录下。使用以下命令，将磁盘大小扩大到 12,000MB：

```
VBoxManage.exe modifyhd "C:\Users\StephanA\VirtualBox VMs\Fedora_33\Fedora_33.vdi" --resize 12000
```

然后启动虚拟机，并打开“<ruby>磁盘<rt>Disks</rt></ruby>”工具。你可以看到你刚刚新创建且未分配的可用空间。选择“<ruby>可用空间<rt>Free Space</rt></ruby>”，然后单击 “+” 按钮：

![Free space before adding][28]

现在，创建一个新的分区。选择你要使用的可用空间的大小：

![Creating a new partition and setting size][29]

如果你不想在新分区上创建文件系统或任何其他内容，请选择“<ruby>其他<rt>Other</rt></ruby>”：

![Selecting "other" for partition volume type][30]

选择“<ruby>无文件系统<rt>No Filesystem</rt></ruby>”：

![Setting "No filesystem" on new partition][31]

现在，磁盘空间应该如下图所示：

![VirtualBox after adding new partition][32]

虚拟机有了一个新的分区设备：`/dev/sda3`。通过输入 `vgscan` ，来检查你的 LVM 卷组，找到 `fedora_localhost_live` 这一 LVM 卷组 ：

![Checking LVM volume group by typing vgscan:][33]

现在，已经万事俱备了。在新分区 `/dev/sda3` 中扩展卷组 `fedora_localhost_live`：

```
vgextend fedora_localhost-live /dev/sda3
```

![vgextend command output][34]

由于卷组比逻辑卷大，你可以增加逻辑卷的大小。命令 `vgdisplay` 显示了共有 951 个可用的物理扩展（PE）：

![vgdisplay command output][35]

将逻辑卷增加 951 个物理扩展：

```
lvextend -l+951 /dev/mapper/fedora_localhost--live-root
```

![lvextend command output][36]

在增加了逻辑卷后，最后一件事就是调整文件系统的大小：

```
resize2fs /dev/mapper/fedora_localhost--live-root
```

![resize2fs command output][37]

这样磁盘空间就增加完成了！检查“<ruby>磁盘使用分析器<rt>Disk Usage Analyzer</rt></ruby>”，你就可以看到扩展空间已经可用于文件系统了。

### 总结

使用虚拟机，你可以检查在一个特定的操作系统或一个特定版本的操作系统、软件是如何操作的。除此之外，你还可以尝试任何想测试的 Linux 发行版，而不必担心系统损坏。对于资深用户来说，VirtualBox 在测试、网络和模拟方面提供了广泛的可能性。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/try-linux-virtualbox

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[chai001125](https://github.com/chai001125)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: https://www.virtualbox.org/
[3]: https://getfedora.org/
[4]: https://en.wikipedia.org/wiki/Hardware-assisted_virtualization
[5]: https://www.virtualbox.org/wiki/Downloads
[6]: https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
[7]: https://opensource.com/sites/default/files/uploads/virtualbox_new_vm.png (VirtualBox New VM)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/uploads/virtualbox_memory_size_1.png (Set VM memory size)
[10]: https://opensource.com/sites/default/files/uploads/virtualbox_create_hd_1.png (Create virtual hard disk)
[11]: https://opensource.com/sites/default/files/uploads/virtualbox_create_hd_2.png (Selecting hard disk file type)
[12]: https://opensource.com/sites/default/files/uploads/virtualbox_create_hd_3.png (Dynamically allocating hard disk)
[13]: https://getfedora.org/en/workstation/download/
[14]: https://opensource.com/sites/default/files/uploads/virtualbox_create_hd_4.png (Setting hard disk size)
[15]: https://opensource.com/sites/default/files/uploads/virtualbox_cpu_settings.png (Assigning cores to guest system)
[16]: https://opensource.com/sites/default/files/uploads/virtualbox_network_settings2.png (Network settings)
[17]: https://en.wikipedia.org/wiki/Network_address_translation
[18]: https://www.virtualbox.org/manual/ch06.html#natforward
[19]: https://opensource.com/sites/default/files/uploads/virtualbox_choose_image3.png (Assigning OS image)
[20]: https://opensource.com/sites/default/files/uploads/virtualbox_running.png (VirtualBox Fedora installer)
[21]: https://opensource.com/sites/default/files/uploads/virtualbox_partitioning_1.png (Selecting Custom partition configuration)
[22]: https://opensource.com/article/18/9/swap-space-linux-systems
[23]: https://fedoraproject.org/wiki/Changes/SwapOnZRAM
[24]: https://opensource.com/sites/default/files/uploads/virtualbox_partitioning_2.png (Adding mount points)
[25]: https://opensource.com/sites/default/files/uploads/virtualbox_guest_additions_2.png (Selecting Guest Additions CD image)
[26]: https://opensource.com/sites/default/files/uploads/virtualbox_guest_additions_autorun.png (Enabling Guest Additions autorun)
[27]: https://opensource.com/sites/default/files/uploads/virtualbox_disk_usage_1.png (Fedora hard disk running out of space)
[28]: https://opensource.com/sites/default/files/uploads/virtualbox_disks_before.png (Free space before adding)
[29]: https://opensource.com/sites/default/files/uploads/virtualbox_new_partition_1.png (Creating a new partition and setting size)
[30]: https://opensource.com/sites/default/files/uploads/virtualbox_new_partition_2.png (Selecting "other" for partition volume type)
[31]: https://opensource.com/sites/default/files/uploads/virtualbox_no_partition_3.png (Setting "No filesystem" on new partition)
[32]: https://opensource.com/sites/default/files/uploads/virtualbox_disk_after.png (VirtualBox after adding new partition)
[33]: https://opensource.com/sites/default/files/uploads/virtualbox_vgscan.png (Checking LVM volume group by typing vgscan:)
[34]: https://opensource.com/sites/default/files/uploads/virtualbox_vgextend_2.png (vgextend command output)
[35]: https://opensource.com/sites/default/files/uploads/virtualbox_vgdisplay.png (vgdisplay command output)
[36]: https://opensource.com/sites/default/files/uploads/virtualbox_lvextend.png (lvextend command output)
[37]: https://opensource.com/sites/default/files/uploads/virtualbox_resizefs.png (resize2fs command output)
