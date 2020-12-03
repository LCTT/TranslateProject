[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Dual booting Windows and Linux using UEFI)
[#]: via: (https://opensource.com/article/19/5/dual-booting-windows-linux-uefi)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss/users/ckrzen)

使用 UEFI 双启动 Windows 和 Linux
======
在同一台机器上设置 Linux 和 Windows 双重启动的一份速成解释，使用统一可扩展固件接口（UEFI）。
![键盘上的 Linux 的按键字母][1]

我将强调一些重要点，而不是一步一步地指导你来如何配置你的系统以实现双重启动。作为一个示例，我将提到我在几个月之前新买的笔记本计算机。我首先安装 [Ubuntu Linux][2] 到整个硬盘中，这就摧毁了预装的 [Windows 10][3] 安装。几个月后，我决定安装一个不同的 Linux 发行版，也决定在双重启动配置中与 [Fedora Linux][4] 一起重新安装 Windows 10 。我将强调一些极其重要的实际情况。让我们开始吧！

### 固件

双重启动不仅仅是软件问题。或者说它算是软件的问题, 因为它需要更改你的固件，以告诉你的机器如何开始启动程序。这里有一些和固件相关的重要议题要铭记于心。

#### UEFI vs BIOS

在尝试安装前，确保你的固件配置是最佳的。现在出售的大多数计算机有一个名为 [统一可扩展固件接口 （UEFI）][5] 的新固件类型，UEFI 差不多取代了另一个名为 [基本输入输出系统 (BIOS)][6] 的固件类型，（包括很多固件供应商在内的很多人）通常称 BIOS 为传统启动模式。

我不需要 BIOS ，使用我选择了 UEFI 模式。

#### 安全启动

另一个重要的设置是安全启动。这个功能将检测启动路径是否被篡改，并阻止未经批准的操作系统的启动。现在，我禁用这个选项来确保我能够安装 Fedora Linux 。依据 Fedora 项目维基 [功能/安全启动][7] 的介绍可知：Fedora Linux 在安全启动选项启用的时候也可以工作。这对其它的 Linux 发行版来说可能有所不同 — 我打算今后重新研究这项设置。

简而言之，如果你发现在这项设置启用时你不能安装你的 Linux 操作系统，那么禁用安全启动并再次重新尝试安装。

### 分区启动驱动器

如果你选择双重启动并且两个操作相同都在同一个驱动器上，那么你必须将你分成多个分区。即使你使用两个不同的驱动器进行双重启动，出于各种各样的原因，大多数 Linux 安装也最好分成几个基本的分区。这里有一些选项值得考虑。

#### GPT vs MBR

如果你决定手动分区你的启动驱动器，在动手前，我建议使用 [GUID 分区表 (GPT)][8] ，而不是使用旧的 [主启动记录 (MBR)][9] 。这种更改的原因之一是：MBR 有两个特定的限制，而 GPT 却没有：

  * MBR 可以最多拥有 15 个分区，而 GPT 可以最多拥有 128 个分区。
  * MBR 最多仅支持 2 TB ，而 GPT 使用 64 位地址，这使得它最多支持 800 万 TB 的磁盘。



如果你最近购买过硬盘，那么你可能会知道现代的很多硬盘都超过了 2 TB 的限制。

#### EFI 系统分区

I如果你正在进行一次全新的安装或使用一块新的驱动器，那么这里可能没有可以开始的分区。在这种情况下，操作系统安装程序将先创建一个分区，即 [EFI 系统分区 (ESP)][10] 。如果你选择使用一个诸如 [gdisk][11] 之类的工具来手动分区你的驱动器，你将需要使用一些参数来创建这个分区。基于现有的 ESP ，我设置它为约 500 MB 的大小，并分配它为 ef00（ EFI 系统 ）分区类型。UEFI 规范要求格式为 FAT32/msdos ，很可能是因为这种格式被大量的操作系统所支持。

![分区][12]

### 操作系统安装

在你完成先前的两个任务后，你就可以安装你的操作系统了。虽然我在这里关注的是 Windows 10 和 Fedora Linux ，当安装其它组合时的过程也是非常相似。

#### Windows 10

我开始 Windows 10 的安装，并创建了一个 20 GB的 Windows 分区。因为我先前在我的笔记本计算机上安装了 Linux ，所以驱动器已经有了一个 ESP ，我选择保留它。我删除所有的现有 Linux 和 swap 分区来开始 fresh ，然后开始我的 Windows 安装。Windows 安装程序自动创建另一个小分区—16 MB—称为 [Microsoft 保留分区 (MSR)][13] 。在这完成后，在 512 GB 启动分区上仍然有大约 400 GB 的b未分配空间。

接下来，我继续完成了 Windows 10 安装过程。随后我重新启动到 Windows 来确保它是工作的，在操作系统第一次启动时，创建我的用户账号，设置 wi-fi ，并完成其它必须的任务。

#### Fedora Linux

接下来，我将心思转移到安装 Linux 。当安装重新到到磁盘配置的步骤时，我开始了这个过程，我确保不更改 Windows 的 NTFS 和 MSR 分区。我也不更改 EPS ，但是我设置它的挂载点位 **/boot/efi** 。然后我创建常用的 ext4 格式分区， **/** (root) ， **/boot** ，和 **/home** 。我创建的最后一个分区是 Linux 的 **swap** 。

像安装 Windows 一样，我继续完成了 Linux 安装，随后重新启动。令我高兴的是，在启动时 [GRand][14] [统一启动加载程序 (GRUB)][14] 菜单提供选择 Windows 或 Linux 的选项，这意味着我不需要再做任何额外的配置。我选择 Linux 并完成了诸如创建我的用户账号等常规步骤。

### 总结

总体而言，这个过程是不难的，在过去的几年里，从 UEFI 到 BIOS 有一些不同的成功克服困难的更改，加上诸如安全启动等功能的引入。我相信我们现在已经克服了这些障碍，可以可靠地设置多重启动系统。

我不再怀念 [Linux LOader (LILO)][15] ！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/dual-booting-windows-linux-uefi

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss/users/ckrzen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://www.ubuntu.com
[3]: https://www.microsoft.com/en-us/windows
[4]: https://getfedora.org
[5]: https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface
[6]: https://en.wikipedia.org/wiki/BIOS
[7]: https://fedoraproject.org/wiki/Features/SecureBoot
[8]: https://en.wikipedia.org/wiki/GUID_Partition_Table
[9]: https://en.wikipedia.org/wiki/Master_boot_record
[10]: https://en.wikipedia.org/wiki/EFI_system_partition
[11]: https://sourceforge.net/projects/gptfdisk/
[12]: /sites/default/files/u216961/gdisk_screenshot_s.png
[13]: https://en.wikipedia.org/wiki/Microsoft_Reserved_Partition
[14]: https://en.wikipedia.org/wiki/GNU_GRUB
[15]: https://en.wikipedia.org/wiki/LILO_(boot_loader)
