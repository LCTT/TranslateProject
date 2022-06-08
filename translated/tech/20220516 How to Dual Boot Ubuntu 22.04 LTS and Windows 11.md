[#]: subject: "How to Dual Boot Ubuntu 22.04 LTS and Windows 11"
[#]: via: "https://www.linuxtechi.com/dual-boot-ubuntu-22-04-and-windows-11/"
[#]: author: "James Kiarie https://www.linuxtechi.com/author/james/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何双启动 Ubuntu 22.04 LTS 和 Windows 11
======
嗨，伙计们，在这篇指南中，我们将演示如何在 Windows 11 的旁侧配置 Ubuntu 22.04 LTS (Jammy Jellyfish) 的双启动设置

为使其能工作，你需要在你的计算机上安装 windows 11 。接下来，你将需要在你的硬盘驱动器上创建一个单独的分区，你将在此分区上安装 Ubuntu 22.04 。我们将包含这点知识，因此不要担心。

##### 必要条件 

在设置双启动前，这些是你所需要的。

* 一个 Ubuntu 22.04 的可启动 USB 驱动器，你可以转到 [Ubuntu 22.04 下载页面][1] 来下载 Ubuntu 22.04 的 ISO 镜像文件。在 ISO 镜像文件到位后，抓取一个 16GB USB 驱动器，并使用 Rufus 应用程序来使其可启动。

* 快速稳定的因特网连接

### 步骤 1、在你的硬盘驱动器上创建一个可用的分区 

正如介绍中所提到的，我们首先需要在硬盘驱动器上创建一个单独的分区，我们将在其中安装 Ubuntu 22.04 。

因此，通过按下 **Windows + R** 组合键来打开磁盘管理器实用程序

在对话框中，输入 diskmgmt.msc ，并按下 <ruby>回车键<rt>ENTER</rt></ruby> 按键。

![][2]

 <ruby>磁盘管理<rt>disk management</rt></ruby>控制台将显示当前磁盘分区，如你将在下面所看到的一样。我们将通过压缩 ‘卷 E’ 来创建一个用于安装 Ubuntu 的分区。这在你的安装过程中可能有所不同，但是只需要跟着做，你就会理解其中的大体意思。

![][3]

因此，在你想要压缩的磁盘驱动器卷上右键，并在弹出的菜单中选择 <ruby>压缩卷<rt>Shrink</rt></ruby> 选项。

![][4]

一个弹出对话框将会出现，如下所示。具体指定压缩的控件大小（以 MB 为单位），并单 <ruby>压缩卷<rt>Shrink</rt></ruby> 。

这是指定给 Ubuntu 22.04 安装所用的空间.

![][5]

在缩小磁盘空间后，它将显示为 <ruby>未分配<rt>Unallocated</rt></ruby> 或 <ruby>可用空间<rt>Free Space</rt></ruby>，如图所示。

![][6]

随着可用空间的到来，现在将可启动 USB 媒介盘插入到你的 PC ，并重新启动你的系统。此外，要确保访问 BIOS 设置，并修改启动优先级，来使 USB 驱动器成为第一优先级。保存 BIOS 更改并继续启动。

### 步骤 2、开始安装

在第一屏幕中，你将得到如图所示的 GRUB 菜单。选择第一个选项 <ruby>尝试或安装 Ubuntu<rt>Try or Install Ubuntu</rt></ruby> ，并按下 <ruby>回车键<rt>ENTER</rt></ruby> 按键。

![][7]

Ubuntu 22.04 将开始加载，如下所示。这最多需要一分钟。

![][8]

此后，安装程序向导将弹出，向你提供两个选项： <ruby>尝试 Ubuntu<rt>Try Ubuntu</rt></ruby> 和 <ruby>安装 Ubuntu<rt>Install Ubuntu</rt></ruby>。因为我们的使命是安装 Ubuntu ，所以选择后者。

![][9]

接下来，选择你的首选键盘布局，并单击 <ruby>继续<rt>Continue</rt></ruby> 按钮。

![][10]

在 <ruby>更新和其它软件<rt>Updates and Other Software</rt></ruby> 步骤中，选择 <ruby>正常安装<rt>Normal Installation</rt></ruby>以便安装 Ubuntu的 GUI 版本，通过勾选其它剩余选项来允许下载更新和安装第三方的针对于图像、WIFI 硬件和其它实用程序的软件包

接下来，单击 <ruby>继续<rt>Continue</rt></ruby> 按钮。

![][11]

下一步提供两个安装选项。第一个选项 - <ruby>清除整个磁盘并安装 Ubuntu<rt>Erase disk and install Ubuntu</rt></ruby> – 完全地擦除你的驱动器并安装。但是由于这是一个双启动设置，这个选项对于你现有安装的 Windows 系统来说会是灾难性的。

因此，选择 <ruby>其它选项<rt>Something else</rt></ruby>，单击 <ruby>继续<rt>Continue</rt></ruby> 按钮。

![][12]

分区表将显示所有现有的磁盘分区。到目前为止，我们仅有 NTFS 分区和我们之前压缩出来的可用分区。

针对 Ubuntu 22.04 ，我们将创建下面的分区：

* /boot        –         1 GB
* /home        –        10 GB
* /            –        12 GB
* Swap         –         2 GB
* EFI          –       300 MB

为开始使用这些分区，单击 <ruby>可用空间<rt>Free Space</rt></ruby>分区下面的 [ + ] 符号。

![][13]

如图显示填写 /boot 分区的详细信息，然后单击 <ruby>确定<rt>OK</rt></ruby> 按钮。

![][14]

接下来，具体指定 /home 分区，并单击 <ruby>确定<rt>OK</rt></ruby> 按钮。

![][15]

接下来，定义 / ( root ) 分区，并单击 <ruby>确定<rt>OK</rt></ruby> 按钮。

![][16]

为定义 swap 空间，设置大小，并在 <ruby>使用为<rt>Use as</rt></ruby>：选项中选择 <ruby>交换区域<rt>Swap area</rt></ruby>。

![][17]

最后，如果你正在使用 UEFI 启动模式，那么创建一个 EFI 系统分区。我们将分配 300MB 到 EFI 分区。

![][18]

下图是一份我们的分区表的分区摘要。

![][19]

为继续安装，单击 <ruby>现在安装<rt>Install Now</rt></ruby>。在下图显示的弹出窗口中，单击 <ruby>继续<rt>Continue</rt></ruby>来保存更改到磁盘。

![][20]

接下来，安装程序向导将自动侦测出你的位置，只需要单击 <ruby>继续<rt>Continue</rt></ruby> 按钮。

![][21]

接下来，通过具体指定姓名、计算机的名称和密码来创建一个登录用户。接下来单击 <ruby>继续<rt>Continue</rt></ruby> 按钮。

![][22]

此时，安装程序向导将复制所有的 Ubuntu 文件和软件包到手动创建的硬盘驱动器分区，并安装必要的软件包。

这个过程将需要很长一段时间，因此，要有耐心。在我们的实例中，它需要大约 30 分钟。

![][23]

在安装过程完成后，单击 <ruby>立刻重新启动<rt>Restart Now</rt></ruby> 按钮来重新启动系统。

![][24]

在这时，移除你的可启动 USB 驱动器，并按下 <ruby>回车键<rt>ENTER</rt></ruby> 按键。

![][25]

在系统重新启动时，你将找到 Ubuntu 和 Windows 11 的所有选项。

选择 ‘Ubuntu’ 来启动到你的新 Ubuntu 22.04 安装。为启动到 Windows 11，选择标有 <ruby>Windows 恢复环境<rt>Windows Recovery Environment</rt></ruby> 的条目。

![][26]

就这样。我们演示了如何双启动 Windows 11 和 Ubuntu 22.04.

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/dual-boot-ubuntu-22-04-and-windows-11/

作者：[James Kiarie][a]
选题：[lkxed][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lkxed
[1]: https://releases.ubuntu.com/22.04/
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/05/diskmgmt-msc-command-windows11.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Disk-Management-Console-Windows11.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Shrink-Volume-Windows11.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Shrink-Volume-Size-Windows11.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Free-Space-Disk-Management-Console-Windows11.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Select-Install-Ubuntu-Linux.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Ubuntu-22-04-Loading-Screen.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Choose-Install-Ubuntu-Linux.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Keyboard-Layout-Ubuntu-22-04.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Normal-Installation-Option-During-Ubuntu-22-04-Installation.png
[12]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Something-else-ubuntu-installation.png
[13]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Select-Free-Space-for-Ubuntu-22-04-Installation.png
[14]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Boot-Partition-Ubuntu-22-04-LTS.png
[15]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Home-Partition-For-Ubuntu-22-04.png
[16]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Root-Partition-For-Ubuntu-22-04.png
[17]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Swap-Area-Ubuntu-22-04.png
[18]: https://www.linuxtechi.com/wp-content/uploads/2022/05/EFI-System-Partition-Ubuntu-22-04.png
[19]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Install-Now-Ubuntu-22-04.png
[20]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Write-Changes-Disk-Ubuntu-22-04.png
[21]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Location-for-Ubuntu-22-04-Installation.png
[22]: https://www.linuxtechi.com/wp-content/uploads/2022/05/UserName-Hostname-Ubuntu-22-04-lts-Installation.png
[23]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Installation-Progress-Ubuntu-22-04.png
[24]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Restart-After-Ubuntu-22-04-LTS-Installation.png
[25]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Remove-Installation-Media-after-Ubuntu-22-04-Installation.png
[26]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Dual-Boot-Grub-Bootloader-Screen-Ubuntu-22-04.png
