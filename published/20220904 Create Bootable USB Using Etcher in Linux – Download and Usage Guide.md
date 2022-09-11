[#]: subject: "Create Bootable USB Using Etcher in Linux – Download and Usage Guide"
[#]: via: "https://www.debugpoint.com/etcher-bootable-usb-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15020-1.html"

在 Linux 中使用 Etcher 创建可启动 USB – 下载和使用指南
======

![](https://img.linux.net.cn/data/attachment/album/202209/11/122946lmd8zzppbrzjcc6d.jpg)

> 关于如何在 Ubuntu 和其他 Linux 中使用 Etcher 工具创建可引导 USB 的快速简单教程。

[Etcher][1] 是由 [Balena][2] 创建的实用程序，它可以使用 .iso 文件创建可启动的 USB 和 SD 卡，q其独特的方式让你的生活变得轻松。在本指南中，我将向你展示下载和安装 Etcher 的步骤。

虽然对某些人来说有点过于简单，但对其他人来说可能很难。因此才有了本指南。

Etcher 主要用于刷写（写入） Linux 操作系统的 .iso 镜像，例如 Ubuntu、[Linux Mint][3] .iso 镜像等。但理想情况下，它也应该适用于任何其他 .iso 文件。

还有其他实用程序可用于创建可引导的 USB 驱动器，比如我之前写过 [指南][4] 的 Unetbootin。

但话虽如此，在我看来，Etcher **更快、更干净、更好**。它很少失败。成功率很高。

在我解释这些步骤之前，快速回顾一下它的功能。

### Etcher 的功能

* 创建可启动 USB 驱动器的清晰的 3 步过程
* 自动检测 USB
* 选择文件，选择目标，快速写入
* 克隆驱动器
* 选择本地下载的 .iso 文件或直接从 URL 下载
* 干净而友好的用户界面
* 跨平台：Linux、Windows 和 macOS
* 内置 JS，electron 应用
* 适用于 Linux 的独立 AppImage 可执行文件

### 安装 Etcher

Etcher 适用于所有平台。因此，你可以在所有 Linux 发行版、macOS 和 Windows 中使用以下方法轻松安装它。

首先，进入以下链接。

> **[下载 ETCHER][5]**

#### 适用于所有 Linux 发行版

从上面的链接下载 AppImage 可执行文件。然后通过“右键单击->属性”将权限更改为*可执行*。然后运行文件。

有关特定于发行版的软件包，请参阅下文。

#### Debian、Ubuntu

要在 Debian、Ubuntu、Linux Mint 和相关发行版中安装 Etecher，请从终端执行以下命令：

```
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.listsudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61sudo apt-get updatesudo apt-get install balena-etcher-electron
```

#### Fedora

对于 Fedora，请从终端执行以下命令：

```
sudo wget https://balena.io/etcher/static/etcher-rpm.repo -O /etc/yum.repos.d/etcher-rpm.reposudo dnf install -y balena-etcher-electron
```

#### Arch Linux

对于 Arch Linux，请确保已安装 yay。然后你可以运行以下命令进行安装：

```
yay -S balena-etcher
```

### 使用 Etcher 创建可启动 USB

安装成功后启动应用。第一个窗口显示你需要遵循的 3 个步骤。当然，你需要一个 U 盘和 .iso 文件来写入。

#### 步骤 1：选择文件

插入目标 USB 或 SD 卡。浏览并选择 .iso 文件。或者，你也可以通过 URL 直接从互联网拉取它。

![Step 1 - Select the file][6]

#### 步骤 2：选择目标设备

单击“<ruby>选择目标<rt>Select Target</rt></ruby>”，并仔细选择你的 USB 或 SD 卡。 Etcher 非常友好，可以通知你哪个设备是你的系统设备，这样你就不会最终破坏数据。

通过单击复选框进行选择。并单击“<ruby>选择<rt>Select</rt></ruby>”。

![Step 2 - Select Target device][7]

#### 步骤 3：点击刷写开始创建可启动 USB 或 SD 卡

![Step 3 - Start the process][8]

等到该过程完成。

![Process is complete][9]

就是这样。你可以安全地取出 USB 或 SD 卡以供使用。

### 结束语

虽然创建可引导 USB 的方法有很多，例如你可以使用 Unetbootin、MKUSB，甚至使用 Ubuntu 的默认磁盘程序，但 Etcher 可以更轻松地完成此操作。其 UI 设计只需 3 个步骤，非常适合需要可靠性的新用户和高级用户。

可启动 USB 是一项重要资产，你应该使用出色的程序来准备它。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/etcher-bootable-usb-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.balena.io/etcher/
[2]: https://www.balena.io/
[3]: https://www.debugpoint.com/linux-mint/
[4]: https://www.debugpoint.com/2015/05/how-to-create-a-bootable-usb-drive-in-ubuntu/
[5]: https://github.com/balena-io/etcher/releases
[6]: https://www.debugpoint.com/wp-content/uploads/2021/01/Step1-Select-the-file.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2021/01/Step-2-Select-Target-device.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2021/01/Step-3-Start-the-process.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2021/01/Process-is-complete.jpg
