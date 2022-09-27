[#]: subject: "Install Linux Mint with Windows 11 Dual Boot [Complete Guide]"
[#]: via: "https://www.debugpoint.com/linux-mint-install-windows/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "gpchn"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15073-1.html"

使用 Windows 11 双引导安装 Linux Mint
======

![](https://img.linux.net.cn/data/attachment/album/202209/26/115222iqlvc0w020m37mc3.jpg)

> 将 Linux Mint 与 Windows 11（或 Windows 10）同时安装并制作双引导系统的完整指南。

如果你是新 Linux 用户，想在不删除 OEM 安装的 Windows 的情况下安装 Linux Mint，请遵循本指南。完成下面描述的步骤后，你应该拥有一个双引导系统，你可以在其中学习和在 Linux 系统中完成工作，而无需引导 Windows。

### 1、开始之前你需要什么？

启动到你的 Windows 系统并从官方网站下载 Linux Mint ISO 文件。 ISO 文件是 Linux Mint 的安装镜像，我们将在本指南中使用它。

在官网（图1），下载 Cinnamon 桌面版的 ISO（适合所有人）。

> **[下载链接][1]**

![图 1：从官网下载 Linux Mint][2]

下载后，将 U 盘插入你的系统。然后使用 Rufus 或 [Etcher][3] 将上面下载的 .ISO 文件写入该 USB 驱动器。

### 2、准备一个分区来安装 Linux Mint

正常情况下，Windows 笔记本电脑通常配备 C 盘和 D 盘。C 盘是安装 Windows 的地方。对于新的笔记本电脑，D 驱动器通常是空的（任何后续驱动器，如 E 等）。现在，你有两个选项可供选择：一是 **缩小 C 盘** 为额外的 Linux 安装腾出空间。第二个是**使用其他驱动器/分区**，例如 D 盘或 E盘。

选择你希望的方法。

如果你选择使用 D 盘或 E 盘用于 Linux 系统，请确保先禁用 BitLocker，然后再禁用现代 OEM 安装的 Windows 笔记本电脑附带的所有其他功能。

* 从开始菜单打开 Windows PowerShell 并键入以下命令（图 2）以禁用 BitLocker。根据你的目标驱动程序更改驱动器号（这里，我使用了驱动器 E）。

```
manage-bde -off E
```

![图 2：禁用 Windows 驱动器中的 BitLocker 以安装 Linux][4]

如果你选择缩小 C 盘（或任何其他驱动器），请从开始菜单打开“<ruby>磁盘管理<rt>Disk Management</rt></ruby>”，它将显示你的整个磁盘布局。

* 右键单击​​并在要缩小的驱动器上选择“<ruby>缩小卷<rt>Shrink Volume</rt></ruby>”（图 3），以便为 Linux Mint 腾出位置。

![图 3：磁盘分区中的压缩卷选项示例][5]

* 在下一个窗口中，在“<ruby>输入要缩小的空间量（以 MB 为单位）<rt>Enter the amount of space to shrink in MB</rt></ruby>”下以 MB 为单位提供你的分区大小（图 4）。显然，它应该小于或等于“<ruby>可用空间大小<rt>Size of available space</rt></ruby>”中提到的值。因此，对于 100 GB 的分区，给出 100*1024=102400 MB。
* 完成后，单击“<ruby>缩小<rt>Shrink</rt></ruby>”。

![图 4：输入 Linux 分区的大小][6]

现在，你应该会看到一个“<ruby>未分配空间<rt>Unallocated Space</rt></ruby>”，如下所示（图 5）。右键单击它并选择“<ruby>新建简单卷<rt>New Simple Volume</rt></ruby>”。

![图 5：创建未分配空间][7]

* 此向导将使用文件系统准备和格式化分区。注意：你可以在 Windows 本身中或在 Linux Mint 安装期间执行此操作。Linux Mint 安装程序也为你提供了创建文件系统表和准备分区的选项，我建议你在这里做。
* 在接下来的一系列屏幕中（图 6、7 和 8），以 MB 为单位给出分区大小，分配驱动器号（例如 D、E、F）和文件系统为 fat32。

![图 6：新建简单卷向导-page1][8]

![图 7：新建简单卷向导-page2][9]

![图 8：新建简单卷向导-page3][10]

* 最后，你应该会看到你的分区已准备好安装 Linux Mint。你应该在 Mint 安装期间按照以下步骤选择此选项。

![图 9：安装 Linux 的最终分区][11]

* 作为预防措施，**记下分区大小**（你刚刚在图 9 中作为示例创建的分区）以便在安装程序中快速识别它。

### 3、在 BIOS 中禁用安全启动

插入 USB 驱动器并重新启动系统。

* 开机时，反复按相应的功能键进入 BIOS。你的笔记本电脑型号的按键可能不同。下面是主要笔记本电脑品牌的参考。

| 笔记本厂商 | 进入 BIOS 的功能键 | 
| :- | :- |
| 宏碁 | `F2` 或 `DEL` | 
| 华硕 | PC 使用 `F2`，主板是 `F2` 或 `DEL` | 
| 戴尔 | `F2` 或 `F12` | 
| 惠普 | `ESC` 或 `F10` | 
| Lenovo | `F2` 或 `Fn + F2` | 
| Lenovo（台式机） | F1` | 
| Lenovo（ThinkPad） | `Enter + F1` | 
| 微星 | `DEL` | 
| 微软 Surface 平板 | 按住音量增加键 | 
| ORIGIN PC | `F2` | 
| 三星 | `F2` | 
| 索尼 | `F1`、`F2` 或 `F3` | 
| 东芝 | `F2` |

* 你应该禁用 BIOS 安全设置并确保将启动设备优先级设置为 U 盘。
* 然后按 `F10` 保存并退出。

### 4、安装 Linux Mint

如果一切顺利，你应该会看到一个安装 Linux Mint 的菜单。选择 “Start Linux Mint……” 选项。

![图 10：Linux Mint GRUB 菜单启动安装][12]

片刻之后，你应该会看到 Linux Mint Live 桌面。在桌面上，你应该会看到一个安装 Linux Mint 的图标以启动安装。

在下一组屏幕中，选择你的语言、键盘布局、选择安装多媒体编解码器并点击继续按钮。

在安装类型窗口中，选择 “<ruby>其他<rt>Something Else</rt></ruby>” 选项。

在下一个窗口（图 11）中，仔细选择以下内容：

![图11：选择 Windows 11 安装 Linux Mint 的目标分区][13]

* 在“<ruby>设备<rt>Device</rt></ruby>”下，选择刚刚创建的分区；你可以通过我之前提到的要记下的分区大小来识别它。
* 然后点击“<ruby>更改<rt>Change</rt></ruby>”，在编辑分区窗口中，选择 Ext4 作为文件系统，选择格式化分区选项和挂载点为 `/`。
* 单击“<ruby>确定<rt>OK</rt></ruby>”，然后为你的系统选择“<ruby>引导加载程序<rt> boot loader</rt></ruby>”；理想情况下，它应该是下拉列表中的第一个条目。
* 仔细检查更改。因为一旦你点击立即安装，你的磁盘将被格式化，并且无法恢复。当你认为一切准备就绪，请单击“<ruby>立即安装<rt>Install Now</rt></ruby>”。

在以下屏幕中，选择你的位置，输入你的姓名并创建用于登录系统的用户 ID 和密码。安装应该开始（图 12）。

![图 12：安装中][14]

安装完成后（图 13），取出 U 盘并重新启动系统。

![图 13：安装完成][15]

如果一切顺利，在成功安装为双引导系统后，你应该会看到带有 Windows 11 和 Linux Mint 的 GRUB。

现在你可以使用 [Linux Mint][16] 并体验快速而出色的 Linux 发行版。

### 总结

在本教程中，我向你展示了如何在装有 OEM 的 Windows 的笔记本电脑或台式机中使用 Linux Mint 创建一个简单的双启动系统。这些步骤包括分区、创建可引导 USB、格式化和安装。

尽管上述说明适用于 Linux Mint 21 Vanessa；但是，它现在应该可以用于所有其他出色的 [Linux 发行版][17]。

如果你遵循本指南，请在下面的评论框中告诉我你的安装情况。

如果你成功了，欢迎来到自由世界！

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/linux-mint-install-windows/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[gpchn](https://github.com/gpchn)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.linuxmint.com/download.php
[2]: https://www.debugpoint.com/wp-content/uploads/2022/09/Download-Linux-Mint-from-the-official-website.jpg
[3]: https://www.debugpoint.com/etcher-bootable-usb-linux/
[4]: https://www.debugpoint.com/wp-content/uploads/2022/09/Disable-BitLocker-in-Windows-Drives-to-install-Linux.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2022/09/Example-of-Shrink-Volume-option-in-Disk-Partition-1024x453.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/09/Enter-the-size-of-your-Linux-Partition.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/09/Unallocated-space-is-created.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/09/New-Simple-Volume-Wizard-page1.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/09/New-Simple-Volume-Wizard-page2.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/09/New-Simple-Volume-Wizard-page3.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/09/Final-partition-for-installing-Linux.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/09/Linux-Mint-GRUB-Menu-to-kick-off-installation.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/09/Choose-the-target-partition-to-install-Linux-Mint-with-Windows-11.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2022/09/Installation-is-in-progress.jpg
[15]: https://www.debugpoint.com/wp-content/uploads/2022/09/Installation-is-complete.jpg
[16]: https://www.debugpoint.com/linux-mint
[17]: https://www.debugpoint.com/category/distributions
[18]: https://www.debugpoint.com/install-java-17-ubuntu-mint/
