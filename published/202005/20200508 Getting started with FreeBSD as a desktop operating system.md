[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12225-1.html)
[#]: subject: (Getting started with FreeBSD as a desktop operating system)
[#]: via: (https://opensource.com/article/20/5/furybsd-linux)
[#]: author: (Joshua Allen Holm https://opensource.com/users/holmja)

使用 FreeBSD 作为桌面操作系统
======

> FuryBSD 的实时桌面环境能让你在实际使用之前先尝试。

![FuryBSD Post-Install XFCE Desktop][10]

[FreeBSD][2] 是一个很棒的操作系统，但是从设计上讲，它并没有自带桌面环境。如果不从 FreeBSD 的 [ports 和软件包集][3]安装其他软件，那么 FreeBSD 仅能体验命令行。下面的截图显示了在安装过程中选择了每个“可选系统组件”后，登录 FreeBSD 12.1 的样子。

![FreeBSD][4]

FreeBSD 可以用各种桌面环境中的任何一种来变成桌面操作系统，但是这需要时间、精力和[遵循大量书面说明][5]。使用使用 desktop-installer 包（为用户提供基于文本的菜单并帮助自动执行大部分过程）仍然非常耗时。这两种方法的最大问题是，用户可能在花了很多时间进行设置之后，可能会发现他们的硬件系统与 FreeBSD 不完全兼容。

[FuryBSD][6] 通过提供实时桌面镜像来解决此问题，用户可以在安装之前对其进行评估。目前，FuryBSD 提供 Xfce 镜像和 KDE 镜像。每个镜像都提供了一个已预安装桌面环境的 FreeBSD。如果用户试用该镜像并发现其硬件工作正常，那么他们可以安装 FuryBSD，并拥有一个由 FreeBSD 驱动的即用桌面操作系统。在本文中，我会使用 Xfce 镜像，但 KDE 镜像的工作原理完全一样。

对于安装过 Linux 发行版、BSD 或任何其他类 Unix 的开源操作系统的人，FuryBSD 的上手过程应该很熟悉。从 FuryBSD 网站下载 ISO，将它复制到闪存盘，然后从闪存盘启动计算机。如果从闪存盘引导失败，请确保“安全引导”已禁用。

![FuryBSD Live XFCE Desktop][7]

从闪存盘启动后，桌面环境将自动加载。除了“家”、“文件系统”和“回收站”图标外，实时桌面还有用于配置 Xorg 的工具、入门指南、FuryBSD 安装程序和系统信息程序的图标。除了这些额外功能以及一些自定义的 Xfce 设置和壁纸外，桌面环境除了基本的 Xfce 应用和 Firefox 之外并没有其他功能。

![FuryBSD Xorg Tool][8]

此时仅加载基本的图形驱动，但足以检查 FuryBSD 是否支持系统的有线和无线网络接口。如果网络接口没有一个能自动工作，那么 `Getting Started.txt` 文件包含有关尝试配置网络接口和其他配置任务的说明。如果至少有一个网络接口有效，那么可以使用 Configure Xorg 应用安装 Intel、NVidia 或 VirtualBox 图形驱动。它将下载并安装驱动，并且需要重新启动 Xorg。如果系统未自动重新登录到实时镜像用户，那么密码为 `furybsd`（你可以使用它来登录）。配置后，图形驱动将转移到已安装的系统中。

![FuryBSD Installer - ZFS Configuration][9]

如果一切都可以在实时环境中正常运行，那么 FuryBSD 安装程序可以将 FuryBSD 配置并安装到计算机上。该安装程序在终端中运行，但提供与大多数其他 BSD 和 Linux 安装程序相同的选项。系统将要求用户设置系统的主机名、配置 ZFS 存储、设置 root 密码，添加至少一个非 root 用户以及配置时间和日期。完成后，系统可以引导到预装有 Xfce （或 KDE）的 FreeBSD 中。FuryBSD 完成了所有困难的工作，甚至还花了很多精力使桌面看起来更漂亮。



如上所述，桌面环境没有大量预装软件，因此几乎肯定要安装额外的软件包。最快的方法是在终端中使用 `pkg` 命令。该命令的行为很像 `dnf` 和 `apt`，因此使用过其中之一的来自 Linux 发行版的用户在查找和安装软件包时应该感到很熟悉。FreeBSD 的软件包集合非常多，因此大多数知名的开源软件包都可用。

如果用户在没有太多 FreeBSD 经验的情况下尝试 FuryBSD，应查阅 [FreeBSD 手册][11]，以了解有关如何以 FreeBSD 的方式操作。有任何 Linux 发行版或其他 BSD 使用经验的用户应该能弄清很多事情，但是手册可以帮助你弄清一些差异。进一步了解 FreeBSD 的一个很好的资源是 Michael W. Lucas 的 《[Absolute FreeBSD，第三版][12]》。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/5/furybsd-linux

作者：[Joshua Allen Holm][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/holmja
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/web_browser_desktop_devlopment_design_system_computer.jpg?itok=pfqRrJgh (web development and design, desktop and browser)
[2]: https://www.freebsd.org
[3]: https://www.freebsd.org/ports/
[4]: https://opensource.com/sites/default/files/uploads/freebsd.png (FreeBSD)
[5]: https://www.freebsdfoundation.org/freebsd/how-to-guides/installing-a-desktop-environment-on-freebsd/
[6]: https://www.furybsd.org
[7]: https://opensource.com/sites/default/files/uploads/furybsd_live_xfce_desktop.png (FuryBSD Live XFCE Desktop)
[8]: https://opensource.com/sites/default/files/uploads/furybsd_xorg_tool.png (FuryBSD Xorg Tool)
[9]: https://opensource.com/sites/default/files/uploads/furybsd_installer_-_zfs_configuration.png (FuryBSD Installer - ZFS Configuration)
[10]: https://opensource.com/sites/default/files/uploads/furybsd_post-install_xfce_desktop.png (FuryBSD Post-Install XFCE Desktop)
[11]: https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/
[12]: https://nostarch.com/absfreebsd3
