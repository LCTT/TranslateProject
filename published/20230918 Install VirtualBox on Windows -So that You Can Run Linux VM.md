[#]: subject: "Install VirtualBox on Windows [So that You Can Run Linux VM]"
[#]: via: "https://itsfoss.com/install-virtualbox-windows/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16231-1.html"

在 Windows 上安装 VirtualBox
======

![][0]

> 简单易学的指南，帮助你在 Windows 上安装 Oracle VirtualBox，以便在虚拟机中安装 Linux。

VirtualBox 是 [最好的虚拟化软件][1] 之一。

如果你想 [使用 Windows 上的 VirtualBox，在虚拟机中安装 Linux][2]，第一步是安装 VirtualBox 应用本身。

我们已经介绍了 [在 Ubuntu 上安装 VirtualBox][3] 的教程。让我重点介绍 Windows 系统的步骤。

对于最新的 Windows 10 或 11 及更早版本，步骤将相同。在 Windows 上安装 Oracle VirtualBox 的两种简单方法：

   1. 下载 Windows 版安装程序并按照屏幕上的说明进行操作
   2. 使用 winget 工具

### 1、使用 Windows 安装程序

要开始使用，请前往 [VirtualBox 的官方下载页面][4]。单击 “**Windows host**” 选项下载 .exe 安装程序。

![][5]

下载安装程序（.exe）文件后，启动它后将执行以下操作：

![][6]

安装指导允许你选择安装位置。你应该坚持使用 C: 驱动器上的默认设置，以确保安装 VirtualBox 所需的所有内容，使其按预期工作。

![][7]

安装过程包括设置虚拟网络接口。因此，你的网络此时可能会被重置。确保安装时没有连接到任何重要的东西。

![][8]

在对网络功能进行重整的同时，还需要处理一些依赖关系。

需要安装 Python 核心包才能使 Python 绑定正常工作。如果你不想使用 Python 脚本控制虚拟机，则不一定需要安装它。

![][9]

但是，如果你认为将来可能需要它们，则应该将其与它一起安装。

现在，最终的安装过程将根据你上面的偏好开始，并且它将向你提供在关闭安装程序时启动 VirtualBox 的选项。

![][10]

### 2、使用 winget 工具

`winget` 命令行工具使用 Windows 包管理器在 Windows 10 和 11 上搜索、安装、升级、删除和配置应用。

如果你更喜欢使用命令行，那么这就是适合你的方法。

首先，你需要以**管理员**身份启动**命令提示符**。

![][12]

接下来，你需要使用 `winget` 命令来安装 VirtualBox。

这是要输入的命令：

````
winget install Oracle.VirtualBox
````

> 📋 如果你是第一次使用 winget，它会要求你同意这些条款。你需要接受它们才能继续使用它，同时你的一些数据（例如区域）将发送到微软商店。

![][13]

### 下一步是启用虚拟化

你可以注意到，这两种方法都会安装适用于 Windows 的最新 VirtualBox 软件包。因此，你可以开始使用 VirtualBox 来创建和管理虚拟机。

但安装 VirtualBox 只是第一步。你应该通过调整一些设置来 [确保你的 Windows 系统已做好虚拟化准备][14]。以下是更多详细信息。

> **[让你的 Windows 系统为虚拟机做好准备][14]**

💬 你在流程中遇到过任何问题吗？你更喜欢哪种方法？请在下面的评论中告诉我。

*（题图：MJ/ac593dfb-8d50-4e77-a3d7-6b772bcfc870）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-virtualbox-windows/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-15911-1.html
[2]: https://linux.cn/article-15183-1.html
[3]: https://linux.cn/article-11282-1.html
[4]: https://www.virtualbox.org/wiki/Downloads
[5]: https://itsfoss.com/content/images/2023/07/virtualbox-exe-download.jpg
[6]: https://itsfoss.com/content/images/2023/07/vbox-installer-next.jpg
[7]: https://itsfoss.com/content/images/2023/07/vmbox-location.jpg
[8]: https://itsfoss.com/content/images/2023/07/vmbox-network-interface.jpg
[9]: https://itsfoss.com/content/images/2023/07/vmbox-dependencies.jpg
[10]: https://itsfoss.com/content/images/2023/07/vmbox-install-complete.jpg
[12]: https://itsfoss.com/content/images/2023/07/cmd-administrator.jpg
[13]: https://itsfoss.com/content/images/2023/07/winget-vbox-1.jpg
[14]: https://linux.cn/article-16186-1.html
[0]: https://img.linux.net.cn/data/attachment/album/202309/27/150351mos0snvjpqnz4qv1.jpg