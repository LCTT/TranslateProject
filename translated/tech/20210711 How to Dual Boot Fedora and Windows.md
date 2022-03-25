[#]: subject: (How to Dual Boot Fedora and Windows)
[#]: via: (https://itsfoss.com/dual-boot-fedora-windows/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

如何双启动 Fedora 和 Windows
======

_**摘要:** 这篇详细的教程一步一步地向你展示 **如何双启动 Fedora Linux 和 Windows 10**,附有适当的截图._

双启动 Linux 和 Windows 是一种完全享受这两款操作系统的流行方式。你可以在同一个硬件系统上安装 Linux 和 Windows 两款系统，并在你启动你的硬件系统时选择使用哪款操作系统。

![On the grub screen, you can select the operating system][1]

如果你已经有一个已经安装 Windows 的系统，你将在这篇教程中学习如何在 Windows 的旁侧安装 Fedora 。

### 在 Windows 的旁侧安装 Fedora

![][2]

这篇教程是在一款已经安装 Windows , GPT 分区和 UEFI 启动的硬件系统的基础上执行的。它应该也适用于其它的带有 MBR 分区和传统 BIOS 的硬件系统，但是我不能确认这一点。

注意：如果你的 Windows 系统使用 BitLocker 加密，在你安装 Fedora 前禁用它会是一个好主意。

#### 必要条件

这里是你需要遵循这篇教程的东西:

  * 一个已预装 Windows 的系统
  * 持续的互联网连接速度
  * 一个至少 4 GB 大小的 USB 接口设备 (U盘)
  * 可选: 用于备份你的 Windows 现有数据的外部 USB 磁盘。
  * 可选: Windows 恢复或可启动磁盘 (如果你偶遇一些严重的启动问题，你可以修复它)。



让我们看看步骤。

#### 步骤 1: 制作 Windows 系统的数据备份 [可选]

备份总会是一个好主意。因为你将要处理磁盘分区。在一些罕见的不幸情况下，假设你出错并删除了错误的分区，你将丢失你的数据。

最简单的方法是将文档、视频、音乐、图片和其它的文件夹中的数据复制到一块外部 USB 磁盘中。你可以使用一个外部的 HDD (传输速度较慢，但是价格较便宜) 或 SSD (传输速度较快，但是价格较昂贵) ，并将重要的文件和文件夹复制到其中。


#### 步骤 2: 为 Fedora 的安装准备一些可用的空间

你需要创建一个分区，你将在其中安装 Fedora 。如果你只有一个 C 驱动器，缩小它的分区。如果你有 D、E 或 F 等多个驱动器，确保你可以移动这些驱动器中的数据到一些其它的分区中，删除或缩小其中的一个驱动器。任意超过 40 GB 的驱动器分区都能有足够的空间来安装安装 Fedora 。

在 Windows 的菜单中，搜索‘disk partitions’ 并转到‘Create and format hard disk partitions’。

![][10]

在磁盘管理工具中，右键单件你想要分区的驱动器，并选择 **shrink volume** 。

如果你只有一个像这样的分区，你需要为 linux 制作出一些可用的空间。如果你有一些空间相当大的分区，请使用除 C 驱动器分区外的分区，因为它可能会擦除数据。

![][11]

#### 步骤 3: 在 Windows 中制作一个 Fedora 的 live USB

现在，这个步骤可以通过不同的方法来完成。你可以下载 ISO 并使用 [Etcher][12] 或 Rufus 或一些其它的工具来将 ISO 镜像写入 USB 磁盘。

不过，Fedora 提供了一个用于下载 ISO 镜像和制作 live USB 的专用工具。我将在这篇教程中使用它。Fedora 团队在创建这个工具时付出了很多艰难的努力，因此为什么不使用它呢。

但是，首先, **插入 USB 接口设备**。现在，转到 Fedora 的下载页面：

[下载 Fedora][13]

你将看到针对 Windows 版本的下载 Fedora Media Writer 工具的选项。

![][14]

它将下载一个 exe 文件。在下载完成后，转到你所下载到的文件夹，并双击 FedoraMediaWriter
.exe 文件来安装 Fedora Media Writer 工具。只需要重复点击 next 。

![][15]

在安装完成后，运行 Fedora Media Writer 工具。但是在此之前，**确保你已经插入 USB **。

它将给予你安装各种 Fedora 版本的选项。针对桌面机，选择 Workstation 版本。

![][16]

在接下来的屏幕中，你将会得到一个创建 live USB 的选项。当你点击这个按钮时，它将开始下载 ISO 文件。它也将识别出你所插入的 USB 接口设备。

你需要良好的互联网访问速度来在一段时间内愉快地下载 2GB 大小的 ISO 文件。

![][17]

在下载 ISO 后，它会自动地将其检验，并给予你将 ISO 镜像写入到 USB 磁盘的选项，例如，创建 live USB 。点击 "Write to Disk” 按钮。

![][18]

它将花费几分钟来完成安装过程。它会显示 “Finished” 信息，现在你可以关闭 Fedora Media Writer 工具了。

![][19]

很好!现在你已经准备好了 Fedora live USB 。现在是时候使用它来安装带有图形用户界面的 Fedora 了。

#### 步骤 4: 从 live USB 启动并安装 Fedora

一些系统不允许你在使用 secure boot 的情形下从 live USB 启动。如果你是这种情况的话，请 [禁用 secure boot][20]。

在处于显示硬件系统制造商徽标的屏幕期间，按下 **F2 或 F10 或 F12** 按键。如果你不确定是哪个按键，你可以逐个尝试。但是，你要 **快速地** 按下按键 ，否则它将会启动到操作系统之中。

不同品牌计算机的按键是不同的。一些计算机甚至可能使用 **Esc** 或 **Del** 按键来完成此目的。

![Quickly press F2, F10 or F12 keys at the screen showing your system manufacturer’s logo][21]

在一些罕见的情况下，你可能需要 [在 Windows 中设置访问 UEFI boot][22]。

在 BIOS 设置中，通常，你应该会看到像这样的屏幕。在这里，你可以使用箭头按键来向下移动到 USB 选项，并按下 Enter 按键来从 USB 启动。请注意，在不同的系统中，这一屏幕可能会看起来有所不同。

![][23]

如果一切顺利，你应该会看到像下面的一个屏幕。选择第一个选项 **“Start Fedora Workstation”:**

![][24]

在数秒后，你应该会启动到 live Fedora 会话期间，并会看到来尝试或安装它的选项。选择 “Install to Hard Drive” 。

![][25]

它将会为安装过程来要求选择语言选项。

![][26]

接下来的屏幕是很重要的。如果你已经在 步骤2 中创建了可用的空间，你应该能够点击 “Begin Installation” 。如果你在系统下的磁盘图标上看到一个感叹号，单击它， 并查看你能够在这里使用哪种磁盘配置。

如果你有多个磁盘，你可以为 Fedora 选择使用哪个磁盘。

![][27]

选择磁盘，并点击 Done 。现在，你应该会看到一条警告信息。在我的实例中，我没有在 步骤2 中创建可用的空间，因此它会控诉这里没有足够的可用的空间来安装 Fedora 。

![][28]

我点击 reclaim space ，并缩小在这里的 Windows 分区。

![][29]

在这以后，选项 “Begin Installation” 开启安装过程。

![][30]

现在，它只是一个需要耐心等待的游戏。它将花费数分钟来提取文件并安装它们。

![][31]

当过程完成后，你将看到 “Finish Installation” 按钮，点击它。

![][32]

你将回到 Fedora live 会话期间。单击右上角的下拉菜单并选择 Restart 。

![][33]

现在，当系统启动时，你应该会看到带有启动到 Fedora 和 Windows 选项的 [Grub 可启动程序]。

![][1]

#### 步骤 5: 完成 Fedora 安装

至此你几乎完成了安装。你注意到 Fedora 没有要求你输入用户名和密码了吗？很多发行版（像 Ubuntu ）在安装期间会要求你创建一个 admin 用户。作为另一种极端，Fedora 会在你第一次登录到所安装的系统时给予你这个选项。

当你第一次登录时，它会运行一次设置，并创建用户名和密码来作为这次初始化设置的一部分。

![][35]

![][36]

![][37]

在你完成后，你已经在享受 Fedora Linux 了。

![][38]

就这样，你可以在同一个硬件系统上以双启动的模式来享受 Fedora Linux 和 Windows 。

如果你在学习这篇教程时有一些问题或者你正在面对一些重大难题，请在评论系统中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/dual-boot-fedora-windows/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/dual-boot-grub-screen-fedora-windows.jpg?resize=800%2C350&ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-windows-dual-boot.jpg?resize=800%2C450&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/disc-management-windows.png?resize=800%2C561&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/making-free-space-for-dual-boot.jpg?resize=1226%2C728&ssl=1
[12]: https://itsfoss.com/install-etcher-linux/
[13]: https://getfedora.org/en/workstation/download/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/download-fedora-media-writer-tool.png?resize=800%2C373&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-Fedora-Media-Writer-tool-Windows.png?resize=745%2C581&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-media-writer-1.png?resize=800%2C425&ssl=1
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-media-writer-2.jpg?resize=800%2C422&ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/writing-fedora-iso-to-usb-with-Fedora-Media-Writer-Tool.png?resize=800%2C285&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedoa-live-usb-with-fedora-media-writer.png?resize=800%2C300&ssl=1
[20]: https://itsfoss.com/disable-secure-boot-windows/
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/acer-predator-boot.jpg?resize=800%2C600&ssl=1
[22]: https://itsfoss.com/access-uefi-settings-windows-10/
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/select-boot-from-live-usb.jpg?resize=800%2C330&ssl=1
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-live-screen.jpg?resize=800%2C350&ssl=1
[25]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/Fedora-install-screen.jpg?resize=800%2C450&ssl=1
[26]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-1.png?resize=800%2C450&ssl=1
[27]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-2.png?resize=800%2C450&ssl=1
[28]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-3.png?resize=800%2C450&ssl=1
[29]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-4.png?resize=800%2C450&ssl=1
[30]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-5.png?resize=800%2C450&ssl=1
[31]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-6.png?resize=800%2C450&ssl=1
[32]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/installing-fedora-7.png?resize=800%2C450&ssl=1
[33]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/restart-gnome-fedora.jpg?resize=799%2C439&ssl=1
[34]: https://itsfoss.com/what-is-grub/
[35]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-setup-1.png?resize=800%2C575&ssl=1
[36]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-setup-2.png?resize=800%2C593&ssl=1
[37]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-setup-3.png?resize=800%2C591&ssl=1
[38]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/fedora-setup-completed.jpg?resize=800%2C500&ssl=1
