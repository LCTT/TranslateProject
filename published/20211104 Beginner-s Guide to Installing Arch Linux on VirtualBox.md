[#]: subject: "Beginner’s Guide to Installing Arch Linux on VirtualBox"
[#]: via: "https://itsfoss.com/install-arch-linux-virtualbox/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "hanszhao80"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14834-1.html"

在 VirtualBox 安装 Arch Linux 的新手操作指南
======

![](https://img.linux.net.cn/data/attachment/album/202207/16/100738bceesesazv6rsxl4.jpg)

[Arch Linux 在桌面 Linux 世界中非常流行][1]。受欢迎的原因之一是 [安装 Arch Linux][2] 本身就是一项复杂的任务。

我没有夸大其词。安装 [Ubuntu 或 Debian][3] 比 Arch Linux 容易得多，因为官方没给后者提供图形界面的安装程序。

这时虚拟机就派上用场了。

你可以先在 VirtualBox 中尝试安装 Arch Linux，看看它是否是你想在实际硬件上运行的系统。通过这种方式，你可以在不弄乱当前操作系统的情况下体验 Arch Linux。

在本文，我将一步一步指导你完成一个实用的 Arch Linux 虚拟机的安装过程。

### 在 VirtualBox 上安装 Arch Linux

毫无疑问，你需要先 [在 Linux 上安装 VirtualBox][4]（或在 Windows 上）。在 Windows 上，只需访问 Oracle 的网站并下载 VirtualBox。

> **[下载 VirtualBox][5]**

如果你使用的是 Windows 10 或更高版本，请确保你的系统已启用虚拟化。

完成后，你需要到 [Arch Linux 官方网站][6] 下载 ISO 文件。你应该找到 [使用 torrent 下载][7] 或直接下载文件的选项。

![][8]

你可以保留 ISO 文件以备不时之需，安装成功后也可以将其删除以 [释放系统上的空间][9]。

现在，让我们开始在 VirtualBox 上安装 Arch Linux 吧。

#### 第一部分 创建虚拟机

**第一步**：首先，你需要在 VirtualBox 中设置一下。启动 VirtualBox 并单击 “<ruby>新建<rt>New</rt></ruby>” 来创建一个虚拟机。

![][10]

注意，你可以使用 “<ruby>向导模式<rt>guided mode</rt></ruby>” 继续创建虚拟机，但使用 “<ruby>专家模式<rt>expert mode</rt></ruby>” 可以一目了然地获得更多选项。

![][11]

因此，我推荐使用专家模式来创建虚拟机。

不用担心，专家模式同样简单，只是多了一些额外的可选项，无需担心其他任何事情。

**第二步**：输入你的虚拟机名称。当你在 “<ruby>名称<rt>Name</rt></ruby>” 字段中输入 “Arch Linux” 时，它会分别自动检测 “<ruby>类型<rt>Type</rt></ruby>” 和 “<ruby>版本<rt>Version</rt></ruby>”。

![][12]

你应该增加内存大小以舒适地使用虚拟机。如果只是用于小型测试，你可以继续使用默认设置。

我在这个例子中分配了 **4 GB 左右的内存**。

另外，请确保在 “<ruby>硬盘<rt>Hard disk</rt></ruby>”选项下选择 “<ruby>现在创建虚拟硬盘<rt>create a virtual hard disk</rt></ruby>”。它应该是默认选项。

现在，继续设置虚拟硬盘大小。

**第三步**：你可以选择虚拟硬盘的存放位置，并根据你的需求调整大小。最小分配大小（8 GB）对于安装系统应该不是问题，但安全起见，你可能得分配至少 10 到 15 GB。

![][13]

接下来，你需要将硬盘硬盘文件类型选择为 “VDI（VirtualBox Disk Image）” ，将存储选择为 “<ruby>动态分配<rt>Dynamically assigned</rt></ruby>”，如上图所示。

VDI 是虚拟硬盘最常见的硬盘类型。

当你为硬盘存储选择 “<ruby>动态分配<rt>Dynamically allocated</rt></ruby>” 选项时，这意味着存储空间将根据使用情况进行使用。换言之，当创建虚拟机后，并不会立即将这 15 GB 的空间从你的磁盘中锁定。

现在，你所要做的就是点击 “<ruby>创建<rt>Create</rt></ruby>” 来添加虚拟机。

#### 第二部分 添加 ISO 文件以开始安装 Arch Linux

![][14]

当虚拟机在左侧列表中出现后，你可以查看其配置并在 “<ruby>存储<rt>Storage</rt></ruby>” 选项下选择 ISO 文件作为磁盘驱动。

你也可以单独前往虚拟机设置以探索更多内容并选择 ISO 文件。

![][15]

为此，你需要导航至虚拟机设置的 “<ruby>存储<rt>Storage</rt></ruby>” 标签页。

![][16]

在这里，你必须单击 “<ruby>控制器<rt>Controller</rt></ruby>” 下的 “<ruby>没有盘片<rt>Empty</rt></ruby>”，然后继续选择 Arch Linux ISO 文件作为磁盘文件（如上图所示）。

![][17]

完成选择后，点击 “OK” 以保存设置的变更。

将 ISO 设置为要引导的磁盘时，虚拟机设置应如下所示：

![][18]

现在，点击 “<ruby>启动<rt>Start</rt></ruby>” 启动虚拟机并开始安装。

#### 第三部分 使用引导式安装程序安装 Arch Linux

使用  [介绍一个引导式安装程序][19] 的方法使安装 Arch Linux 变得更容易，也就是说，它为你提供了设置成熟的 Arch Linux 系统所需的所有选项。

因此，在引导式安装程序的帮助下，你不必单独安装桌面环境和其他基本软件包。你所要做的就是按照屏幕上的说明选择适合你的选项。

在本文中，我们将重点介绍引导式安装程序。如果你想自己做，你应该遵循我们的 [Arch 安装指南][2]。

继续安装流程，当你启动虚拟机时，将看到以下屏幕：

![][20]

第一个选项是理想的处理方式。如果你有特定的要求，可以选择其他选项来启动 Arch Linux。

现在，你应该正在查看一个终端窗口。以下是如何开始：

**第一步**：输入 `archinstall` 以使用引导式安装程序启动安装。

![][21]

**第二步**：根据你的要求选择键盘布局，美式布局应该是最常见的选择。简单地输入一个数字即可进行选择，如下图所示（例如，26）：

![][22]

**第三步**：接下来，你需要选择一个区域来下载包。

![][23]

选择首选地区而不是 “<ruby>全球<rt>Worldwide</rt></ruby>”。这至关重要，因为如果你选择 **全球** 作为你的地区，它会下载许多不必要的包。

**第四步**：选择区域后，它会要求你选择驱动器进行安装。在这个例子中，我们已经创建了一个大约 15 GB 的虚拟驱动器，显示为 `/dev/sda`。

类似的，根据大小检查你创建的驱动器，然后选择该磁盘继续。在这里，我输入 `1` 作为输入；你的可能会有所不同。

![][24]

**第五步**：接下来，你将被询问以下内容：

  - 选择文件系统类型
  - 加密密码（可选的）
  - 主机名
  - 创建 root 密码（可选的）
  - 创建超级用户
  - 选择一个预编程的配置文件

![][25]

在我的测试中，我选择了 btrfs 作为文件系统，没有设置任何磁盘加密密码。

主机名可随心所欲的设置，但我建议保持简短。

你可以选择创建一个 root 密码，即使不这么做也应该没什么问题。不过，你需要创建一个具有 sudo 权限的超级用户。

我使用 `admin`/`pass` 作为用户名和密码。不过，如果你不想让其他人访问你计算机上的虚拟机，则不应使用易于猜测的密码。

然后，你将看到一个选择配置文件的选项。在这种情况下，我们需要一个成熟的 Arch Linux 桌面。因此，我们通过输入 `0` 来选择 “<ruby>桌面<rt>desktop</rt></ruby>”。

**第六步**：接下来，你将被要求选择桌面环境。我决定使用 KDE。你可以选择任何你喜欢的。

![][26]

**第七步**：最后，你将被要求选择显卡驱动程序。由于我们是在 VirtualBox 上安装的 Arch Linux，你可以选择选项 4：VMware/VirtualBox，如下图所示：

![][27]

你可能还会被要求输入“是（`y`）或否（`n`）”选择 pipewire 而不是 PulseAudio 作为音频服务。选任何一个都应该都可以。

**第八步**：接下来是重要的一步。在这里，如果你需要内核的 LTS 版本，你可以选择使用 “linux-lts”，或者继续使用默认值。

![][28]

安装程序会提示你输入想安装的软件包。在这里，我们没有任何特殊要求，因此我们将其留空并按回车键跳过。

**第九步**：你将被要求选择所需的网络适配器以启用互联网访问。你必须选择以下选项：

“<ruby>使用网络管理器来控制和管理你的互联网连接<rt>Use network manager to control and manage your internet connection</rt></ruby>”

![][29]

**第十步**：下一步需要定义时区。选择适用于你的时区，或继续使用默认选项。

**第十一步**：完成后，它将显示你选择的大部分选项以供确认。按回车键继续。

![][30]

**第十二步**：安装完成需要花费几分钟时间，这取决于你的互联网连接速度。

安装完成后，它会要求你 “chroot 进入新创建的安装以进行安装后配置”，但我们不需要。因此输入 `N` 以完成安装。

**第十三步**：最后，你应该会再次看到终端窗口。输入：

```
shutdown now
```

这将安全地退出安装并关闭虚拟机。

一切就绪！在启动安装了 Arch 的虚拟机之前，你还需要做一件事 —— **移除选择作为光驱的 ISO 磁盘**。与添加启动 ISO 的方式类似，你可以前往虚拟机设置并将其删除，如下所示：

![][31]

到此为止你已在 VirtualBox 上安装了 Arch Linux。

你所要做的就是启动虚拟机，在我的例子中它是这样的：

![virtualbox arch][32]

尽管浏览这些选项需要一些时间，但 Arch Linux 上新的引导式安装程序可以节省大量时间使必填项配置正确。

![][33]

同样的步骤也适用于在你的计算机上安装 Arch Linux。你需要用 Arch Linux ISO 文件 [使用 Etcher 制作单独的可启动 USB 盘][34]。

### 总结

[Arch Linux 成为一种流行的选择][1] 有多种原因。但是，如果这是你第一次安装，或者你想对其进行测试，那么虚拟机是在不打乱主机的情况下体验它的最佳方式。

我希望这可以帮助你在 VirtualBox 上安装 Arch Linux。在下面的评论中让我知道你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-arch-linux-virtualbox/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-arch-linux/
[2]: https://itsfoss.com/install-arch-linux/
[3]: https://itsfoss.com/debian-vs-ubuntu/
[4]: https://itsfoss.com/install-virtualbox-ubuntu/
[5]: https://www.virtualbox.org/wiki/Downloads
[6]: https://archlinux.org/download/
[7]: https://itsfoss.com/best-torrent-ubuntu/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/archlinux-downloads.png?resize=800%2C419&ssl=1
[9]: https://itsfoss.com/free-up-space-ubuntu-linux/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-new.png?resize=800%2C562&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-expert-mode.png?resize=707%2C438&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-create.png?resize=800%2C536&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-disk.png?resize=800%2C528&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/choose-disk-virtualbox-arch.png?resize=800%2C440&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-settings-option.png?resize=800%2C551&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-choose-iso.png?resize=800%2C314&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-arch-iso-select.png?resize=800%2C348&ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-set-start.png?resize=800%2C548&ssl=1
[19]: https://news.itsfoss.com/arch-linux-easy-install/
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-archlinux-boot.png?resize=800%2C593&ssl=1
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/vb-archinstall-guided.png?resize=800%2C400&ssl=1
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/vb-archinstall-kb-layout.png?resize=800%2C694&ssl=1
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-region.png?resize=800%2C664&ssl=1
[24]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-selectdisk.png?resize=800%2C199&ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-desktop-configure.png?resize=800%2C497&ssl=1
[26]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-virtualbox-desktop-environment.png?resize=800%2C415&ssl=1
[27]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-environment.png?resize=419%2C173&ssl=1
[28]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-linux-kernel.png?resize=800%2C692&ssl=1
[29]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-arch-network-manager.png?resize=800%2C151&ssl=1
[30]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/archinstall-confirmation.png?resize=800%2C697&ssl=1
[31]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/iso-remove-archinstall.png?resize=800%2C286&ssl=1
[32]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/virtualbox-arch.png?resize=800%2C635&ssl=1
[33]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/kde-arch-virtualbox.png?resize=800%2C453&ssl=1
[34]: https://itsfoss.com/install-etcher-linux/
