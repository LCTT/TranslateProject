如何从 Windows 7、8 和 10 创建可启动的 Linux USB 盘？
======

如果你想了解 Linux，首先要做的是在你的系统上安装 Linux 系统。

它可以通过两种方式实现，使用 Virtualbox、VMWare 等虚拟化应用，或者在你的系统上安装 Linux。

如果你倾向于从 Windows 系统迁移到 Linux 系统或计划在备用机上安装 Linux 系统，那么你须为此创建可启动的 USB 盘。

我们已经写过许多[在 Linux 上创建可启动 USB 盘][1] 的文章，如 [BootISO][2]、[Etcher][3] 和 [dd 命令][4]，但我们从来没有机会写一篇文章关于在 Windows 中创建 Linux 可启动 USB 盘的文章。不管怎样，我们今天有机会做这件事了。

在本文中，我们将向你展示如何从 Windows 10 创建可启动的 Ubuntu USB 盘。

这些步骤也适用于其他 Linux，但你必须从下拉列表中选择相应的操作系统而不是 Ubuntu。

### 步骤 1：下载 Ubuntu ISO

访问 [Ubuntu 发布][5] 页面并下载最新版本。我想建议你下载最新的 LTS 版而不是普通的发布。

通过 MD5 或 SHA256 验证校验和，确保下载了正确的 ISO。输出值应与 Ubuntu 版本页面值匹配。

### 步骤 2：下载 Universal USB Installer

有许多程序可供使用，但我的首选是 [Universal USB Installer][6]，它使用起来非常简单。只需访问 Universal USB Installer 页面并下载该程序即可。

### 步骤3：创建可启动的 Ubuntu ISO

这个程序在使用上不复杂。首先连接 USB 盘，然后点击下载的 Universal USB Installer。启动后，你可以看到类似于我们的界面。

![][8]

  * 步骤 1：选择 Ubuntu 系统。
  * 步骤 2：选择 Ubuntu ISO 下载位置。
  * 步骤 3：它默认选择的是 USB 盘，但是要验证一下，接着勾选格式化选项。

![][9]

当你点击 “Create” 按钮时，它会弹出一个带有警告的窗口。不用担心，只需点击 “Yes” 继续进行此操作即可。

![][10]

USB 盘分区正在进行中。

![][11]

要等待一会儿才能完成。如你您想将它移至后台，你可以点击 “Background” 按钮。

![][12]

好了，完成了。

![][13]

现在你可以进行[安装 Ubuntu 系统][14]了。但是，它也提供了一个 live 模式，如果你想在安装之前尝试，那么可以使用它。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/create-a-bootable-live-usb-drive-from-windows-using-universal-usb-installer/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/bootable-usb/
[2]: https://www.2daygeek.com/bootiso-a-simple-bash-script-to-securely-create-a-bootable-usb-device-in-linux-from-iso-file/
[3]: https://www.2daygeek.com/etcher-easy-way-to-create-a-bootable-usb-drive-sd-card-from-an-iso-image-on-linux/
[4]: https://www.2daygeek.com/create-a-bootable-usb-drive-from-an-iso-image-using-dd-command-on-linux/
[5]: http://releases.ubuntu.com/
[6]: https://www.pendrivelinux.com/universal-usb-installer-easy-as-1-2-3/
[7]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-1.png
[9]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-2.png
[10]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-3.png
[11]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-4.png
[12]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-5.png
[13]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-6.png
[14]: https://www.2daygeek.com/how-to-install-ubuntu-16-04/
