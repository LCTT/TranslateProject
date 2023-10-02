[#]: subject: "Access USB from Virtual Machine in VirtualBox on Linux"
[#]: via: "https://itsfoss.com/virtualbox-access-usb/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16223-1.html"

在 Linux 上的 VirtualBox 中从虚拟机访问 USB
======

![][0]

> 你完全可以从虚拟机内部访问 USB 存储器。如果你使用的是 Linux 上的 VirtualBox，下面将介绍如何做到这一点。

当你插入 USB 时，你的宿主操作系统可以轻松访问它并使用其中的文件。这并不奇怪。

如果你在 Linux 上使用带有 VirtualBox 的虚拟机，那么可以付出一些努力并从虚拟机访问插入物理机的 USB。

让我逐步引导你了解如何在 VirtualBox VM 中访问 USB 磁盘。

### 如何在 VirtualBox VM 中访问 USB 驱动器

默认情况下，你无法使用 VirtualBox 访问 USB 驱动器，因为你必须安装扩展包管理器，此外，还有一些配置部分。

这就是我将本教程分为三个简单步骤的原因。那么让我们从第一步开始。

#### 步骤 1：安装 VirtualBox 扩展包（在主机上）

这是本教程中最重要的一步，因为你将安装 VirtualBox 的扩展，这将使你能够在虚拟机中使用 USB 驱动器。

> 🚧 你应该安装与你安装的 VirtualBox 版本相同版本的扩展包。

要安装 VirtualBox 扩展包，只需访问 [VirtualBox 官方下载页面][1]，向下滚动一点，你将找到下载扩展包的选项：

![][2]

下载完扩展包后，请执行 3 个简单步骤：

   * 转到 “<ruby>文件<rt>File</rt></ruby>” > “<ruby>工具<rt>Tools</rt></ruby>” > “<ruby>扩展包管理器<rt>Extension Pack Manager</rt></ruby>”
   * 点击 “<ruby>安装<rt>Install</rt></ruby>” 按钮
   * 从文件管理器中选择下载的文件：

![][3]

它将打开一个新的提示来安装扩展包，你所要做的就是点击“安装”按钮并接受条款和条件：

![][4]

我们就完成了扩展包的安装。

#### 步骤 2：将用户添加到 vboxusers 组（在宿主机上）

要在 VirtualBox 中使用 USB 驱动器，你的当前用户需要位于 `vboxusers` 组中。

我知道这听起来有点复杂，但 [将用户添加到组][5] 是一个命令过程，将用户添加到 `vboxusers` 组可以通过以下方式完成：

````
sudo usermod -aG vboxusers $USER
````

**完成这两个步骤后，重启系统以使这些步骤生效。**

#### 步骤 3：将 USB 驱动器添加到虚拟机

> 🚧 在为特定虚拟机添加 USB 之前，请确保其已关闭（未保存），否则你将无法按照给定的说明进行操作。

要为虚拟机添加 USB，你必须遵循以下简单步骤：

   * 选择你想要使用 USB 的虚拟机并点击 “<ruby>设置<rt>Settings</rt></ruby>”
   * 转到 “USB” 选项卡
   * 选中 “<ruby>启用 USB 控制器<rt>Enable USB Controller</rt></ruby>” 框并单击 “+” 按钮选择 “USB”：

![][6]

这就好了！现在你可以启动虚拟机，并且 USB 驱动器应该出现在文件管理器中。就我而言，它是 Ubuntu，所以它看起来像这样：

![][7]

### 更多 USB 和 VM 技巧

如果你在虚拟机中使用 USB 看起来很酷，那么在虚拟机中从 USB 启动就更酷了！这里有一个关于 [如何在 VirtualBox 中从 USB 驱动器启动][8] 的详细指南：

> **[如何在 VirtualBox 中从 USB 驱动器启动][8]**

我希望本指南对你有所帮助。

*（题图：MJ/d9a1b4b5-30ec-4019-979f-b258a1fc075f）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/virtualbox-access-usb/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://www.virtualbox.org/wiki/Downloads
[2]: https://itsfoss.com/content/images/2023/09/download-VirtualBox-extension-pack.png
[3]: https://itsfoss.com/content/images/2023/09/Install-VirtualBox-extension-pack-to-use-USB-in-VM.png
[4]: https://itsfoss.com/content/images/2023/09/Install-VirtualBox-extension-pack.png
[5]: https://learnubuntu.com/add-user-group/
[6]: https://itsfoss.com/content/images/2023/09/Enable-USB-drive-for-VM-in-VirtualBox.png
[7]: https://itsfoss.com/content/images/2023/09/Use-USB-drive-in-VirtualBox-VM-1.png
[8]: https://itsfoss.com/virtualbox-boot-from-usb/
[9]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[0]: https://img.linux.net.cn/data/attachment/album/202309/25/002722v04rbi1g34084gf1.jpg