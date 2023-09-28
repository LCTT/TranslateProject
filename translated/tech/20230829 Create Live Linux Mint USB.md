[#]: subject: "Create Live Linux Mint USB"
[#]: via: "https://itsfoss.com/linux-mint-live-usb/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "GenshinMinecraft"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何制作一个 Linux Mint Live USB 
======

Linux Mint 是[初学者的最佳 Linux 发行版选择][1]之一。 它基于 Ubuntu ，但有些人认为 [Linux Mint 比 Ubunutu 更好][2]。

如果你想尝试使用 Linux Mint ， 你可以[在 VirtualBox 内安装 Linux Mint][3]。 这是体验 Linux Mint 的方法之一。

另一种方法是创建 Linux Mint 的 Live USB。这样，你就可以从 USB 启动，在实时会话中体验 Linux Mint。它不会干扰你当前的操作系统，无论是 Windows 还是 Linux。

如果你喜欢它并选择安装至硬盘上，可以使用同一个 Live USB。创建 Live USB 是安装 Linux Mint 的第一步。

### 准备工作

如果需要制作一个 Linux Mint Live USB，你需要:

  * 一个** USB 驱动器**(可以是U盘、移动硬盘等)，至少需要 8GB 的空间；
  * 一个可以使用的互联网连接，以便下载 Linux Mint ISO；
  * 一个帮助你制作 Live USB 的写盘工具。



💡

您可以在一个系统上创建 Live USB，然后在其他电脑上使用。

### 第一步：下载 Linux Mint ISO

这一 ISO 文件是包含 Linux Mint 系统的镜像文件，它将会被写入至 USB 驱动器上。

Linux Mint 有多种[桌面环境][4]版本：旗舰 **Cinnamon** 版本、**MATE** 的变体以及**XFCE**.

![][5]

ISO 文件中可以找到[最佳的桌面环境][6]。**Cinnamon** 是最流行的版本，建议选择以获得最佳的 Linux Mint 体验，但你也可以尝试其他版本。

不管你选择的是什么版本，ISO 文件的大小都约为 **2.7GB**。

你可以前往[官方下载页面][7]获取上述的 ISO 文件。你可以选择直接下载或使用 Torrent 种子文件下载。

获得 ISO 文件后，您需要一个专用工具将 ISO 映像写入到 USB 驱动器上。我推荐使用 Etcher。

📋

有些人喜欢对下载的 ISO 文件[进行完整性校验][8]。这是一种确保 ISO 文件在下载过程中不会损坏的方法(可能会因为网络不稳定等因素而损坏)。

### 第二步：安装 Etcher 以制作 Live USB

对于 Windows 用户来说，Rufus 是一款出色的工具。可惜 Linux 用户无法使用。

为了让本教程简洁明了，我将使用 [Etcher][9]。它是 [Rufus 的替代品][10]，可用于 Linux 与 Windows。

这样，你就可以在 Windows 和 Linux 平台上使用相同的步骤创建 Linux Mint Live USB。唯一不同的是安装 Etcher 的步骤。

#### Windows 教程

从[官方网站][11]下载 Etcher。建议你下载完整的安装程序，除非你真的需要便携式文件。

![][12]

你会找到一个 **.exe** 文件。只需要**双击**安装程序，然后同意说明条款并按照窗口内的步骤进行安装即可。

然后，您可以从搜索菜单中搜索并启动该程序。

![][13]

#### Linux 教程

对于 Linux 用户来说，可以从[官网][11]下载 Etcher 的 AppImage 可执行文件。

您可以参考我们的 [AppImage 指南][14]，了解如何将文件作为可执行文件运行。

![][15]

使用 AppImage 文件，您不需要[安装 Etcher][9]，而是在直接运行它。

### 第三步：使用 Etcher 将 Linux Mint ISO 写入到 USB 驱动器

**插入 USB 驱动器**，并运行上一步安装的 Etcher 工具。

现在，考虑到你已经下载了 Linux Mint ISO，点击 "**<ruby>从文件烧录<rt>Flash from file</rt></ruby>**"选项，如下图所示。

![][16]

然后使用资源管理器选择 Linux Mint 的 ISO 文件。

![][17]

选择 ISO 文件后，需要选择要将要刷入的 USB 驱动器。如果只有一个，Etcher 会自动选择。但仍要确保在 Etcher 中选择了正确的 USB 驱动器。

![][18]

现在，您只需点击 "**<ruby>现在烧录<rt>Flash</rt></ruby>**"，等待程序完成。

![][19]

您将收到接受命令行进程的提示，并选择 "**Yes**" 以启动刷入进程。

![][20]

完成后，它将自动验证刷入的 USB 驱动器是否完整，然后您就可以开始了！

### 第四步：从 USB 驱动器启动

你通过上述方法所制作的 Linux Mint Live USB 驱动器应适用于任何具有 UEFI 启动功能的计算机。

当系统启动并显示制造商徽标时，按 F2 或 F10 或 F12 键，即可访问[ UEFI 启动设置][21]

访问启动设置后，将启动顺序更改为先从 USB 驱动器启动。

不同的电脑有不同的 BIOS 设置，因此我无法分享此步骤的明确截图。

💡

在极少数情况下，安全启动可能不允许启动。这时可以禁用安全启动。

### 接下来怎么办？

如果你喜欢 Live 环境下的 Linux Mint，可以使用 Live USB 删除 Windows 来安装 Mint。

或者，你也可以选择 [Linux Mint 和 Windows 双系统共存][23] ，在同一台电脑中同时运行两个操作系统。

💬 _我希望本教程对你创建 Linux Mint Live USB 有帮助。请在评论区告诉我你的问题和建议。_

--------------------------------------------------------------------------------

via: https://itsfoss.com/linux-mint-live-usb/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-beginners/
[2]: https://itsfoss.com/linux-mint-vs-ubuntu/
[3]: https://itsfoss.com/install-linux-mint-in-virtualbox/
[4]: https://itsfoss.com/what-is-desktop-environment/
[5]: https://itsfoss.com/content/images/2023/08/linux-mint-download-page.jpg
[6]: https://itsfoss.com/best-linux-desktop-environments/
[7]: https://www.linuxmint.com/download.php
[8]: https://itsfoss.com/checksum-tools-guide-linux/
[9]: https://itsfoss.com/install-etcher-linux/
[10]: https://itsfoss.com/live-usb-creator-linux/
[11]: https://etcher.balena.io/#download-etcher
[12]: https://itsfoss.com/content/images/2023/08/balena-etcher-windows-download.jpg
[13]: https://itsfoss.com/content/images/2023/08/balena-etcher-launch.jpg
[14]: https://itsfoss.com/use-appimage-linux/
[15]: https://itsfoss.com/content/images/2023/08/balena-etcher-appimage.png
[16]: https://itsfoss.com/content/images/2023/08/etcher-flash-from-file.jpg
[17]: https://itsfoss.com/content/images/2023/08/balena-iso-selection-windows.jpg
[18]: https://itsfoss.com/content/images/2023/08/balena-etcher-device-select.jpg
[19]: https://itsfoss.com/content/images/2023/08/balenaEtcher-flash-windows.png
[20]: https://itsfoss.com/content/images/2023/08/balenaEtcher-flashing.png
[21]: https://itsfoss.com/access-uefi-settings-windows-10/
[22]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[23]: https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
