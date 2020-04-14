[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Installing Kali Linux on VirtualBox: Quickest & Safest Way)
[#]: via: (https://itsfoss.com/install-kali-linux-virtualbox/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

在 VirtualBox 上安装 Kali Linux : 最快速和最安全的方法
======

_**这篇教程向你展示如何以最快的方式在 Windows 和 Linux 中的 Virtual Box 虚拟机上安装 Kali Linux 。**_

[Kali Linux][1] 是 [最适合黑客攻击和安全爱好者的 Linux 发行版][2] 之一。

因为它涉及一个像黑客之类的敏感话题，就像一把双刃剑。我们过去在详细的 Kali Linux 评论中讨论过，所以我不会使用同样的东西来烦你。

尽管你可以通过以替换现有的操作系统的形式安装 Kali Linux 。但是通过一台虚拟机来使用它可能会是更好更安全的选择。

使用 Virtual Box ，你可以在 Windows/Linux 系统中将 Kail Linux 作为常规应用程序使用。它几乎与在系统中运行 VLC 或游戏是一样的。

在一台虚拟机中使用 Kali Linux 是安全的。不管你在 Kali Linux 做什么都不会影响你的 ‘宿主系统’ (例如，你的原始的 Windows 或 Linux 操作系统)。你的实际操作系统将不会受到影响，并且在你的宿主系统中数据也将是安全的。

![][3]

### 如何在 VirtualBox 中安装 Kali Linux 

在这里我将使用 [VirtualBox][4] 。它是一个非常好的开源虚拟化解决方案，几乎适合于任何人（专业使用或个人使用）。它是免费提供的。

在这篇文章中，我们将特别讨论 Kali Linux ，但是你也可以安装其它任何存在的 ISO 文件，或者一个可用的预先构建的虚拟机保存文件。

**注意：** _同样的步骤也适用于运行 VirtualBox 的 Windows/Linux 。_

如上所述，你可以安装 Windows 或 Linux 作为你的宿主系统。但是，在我已安装 Windows 10 的情况下(别仇恨我!)，我将尝试在 VirtualBox 中一步一步地安装 Kali Linux 。

并且，最好的部分是，– 即使你碰巧使用一个 Linux 发行版作为你的主要操作系统，也将使用同样的步骤!

很疑惑，如何做？让我们来看看…

[更多 Linux 视频，订阅我们的 YouTube 频道][5]

### 图解在 VirtualBox 上安装 Kali Linux

_我们将使用专门为 VirtualBox 定制的 Kali Linux 镜像。你也可以下载 Kali Linux 的 ISO 文件，并创建一个新的虚拟机 – 但是为什么当你有一个简单的选择时还这样做呢？_

#### 1\. 下载和安装 VirtualBox

第一件要做的事是从甲骨文的官方网站下载和安装 VirtualBox 。

[下载VirtualBox][6]

在你下载安装器后，只需要双击它来安装 VirtualBox 。在 [Ubuntu][7] / Fedora Linux 安装 VirtualBox 也是一样的。

#### 2\. 下载 Kali Linux 的即时可用的虚拟镜像

在安装成功后，前往 [攻击性安全的下载页面][8] 来下载适用于 VirtualBox 的虚拟机镜像。如果您改变主意使用 [VMware][9] ，那也是可行的。

![][10]

如你所见，文件大小大约 3 GB ，你应该使用一个 torrent 选项，或者使用一个 [下载管理器][11] 来下载它。

[Kali Linux 虚拟镜像][8]

#### 3\. 在 Virtual Box 上安装 Kali Linux

在你安装 VirtualBox 和下载 Kali Linux 镜像后，你只需要导入它到 VirtualBox 中以便使它工作。

这里是如何导入 Kali Linux 的 VirtualBox 镜像：

**步骤 1** : 启动 VirtualBox 。你将注意到一个 **导入** 按钮 – 在它上面鼠标左键单击

![在 导入 按钮上鼠标左键单击][12]

**步骤 2:** 接下来，浏览到你更改下载的文件，并选择它来导入 (如你在下面的图像中所见)。文件名称一个以 'kali linux' 开始并以 . **ova** 拓展名结束。

![导入 Kali Linux 镜像][13]

 在选择后，通过在 **接下来** 上鼠标左键单击以继续。

**步骤 3** : 现在，将向你显示将要导入虚拟机的设置。所以，你可以自定义它们或者不自定义它们 – 这取决于你的选择。如果你使用默认设置也是可以的。

你需要选择一个有足够可用存储空间的路径。在 Windows 上，我从不建议使用 **C:** 盘。

![导入硬盘驱动器为 VDI][14]

在这里，硬盘驱动器如同 VDI 一样通过分配存储器空间集来虚拟挂载硬盘驱动器。

在你完成设置后，单击 **导入** 并等待一段时间。

**步骤 4:** 你现在将看到它的列表。所以，只需点击 **开始** 来启动它。

在最开始的时候，你可能会得到一个 USB 2.0 端口控制器的错误，你可以禁用它来解决问题，或者只需按照屏幕上的指南来安装一个附加软件包修复问题。与此同时，你完成所有工作！

![Kali Linux 运行在 VirtualBox 中][15]

在 Kali Linux 中默认用户名是 root ，默认密码是 toor 。你可以使用用户名和密码来登录到系统中。

请注意，在尝试安装一个新的应用程序或尝试侵入你邻居家的 WiFi 之前，你应该 [更新Kali Linux][16] 。

我希望这篇指南能帮助您在 Virtual Box 上很容易地安装 Kali Linux 。当然，Kali Linux 有很多有用的渗透测试工具 – 祝你好运！

**提示** : Kali Linux 和 Ubuntu 都是基于 Debian 的，如果你在使用 Kali Linux 时遇到一些问题或错误，你可以按照互联网上的 Ubuntu 和 Debian 的教程解决。

### 额外的好处: 免费的 Kali Linux 指南书

如果你刚刚开始使用 Kali Linux, 那么知晓如何使用Kali Linux 将是一个好主意。

Kali Linux 背后的公司 Offensive Security 创建了一本解释 Linux 基础知识，Kali Linux 基础知识，配置和设置的指南书，也有一些关于渗透测试和安全工具的章节。

基本上，它拥有你开始使用 Kali Linux 所需的一切东西。最好的事情是这本书可以免费下载。

[免费下载 Kali Linux 解密][17]

如果你遇到问题或只是想分项在 VirtualBox 使用 Kali Linux 的经验，请在下面的评论中告诉我们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-kali-linux-virtualbox/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.kali.org/
[2]: https://itsfoss.com/linux-hacking-penetration-testing/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/kali-linux-virtual-box.png?resize=800%2C450&ssl=1
[4]: https://www.virtualbox.org/
[5]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[6]: https://www.virtualbox.org/wiki/Downloads
[7]: https://itsfoss.com/install-virtualbox-ubuntu/
[8]: https://www.offensive-security.com/kali-linux-vm-vmware-virtualbox-image-download/
[9]: https://itsfoss.com/install-vmware-player-ubuntu-1310/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/kali-linux-virtual-box-image.jpg?resize=800%2C347&ssl=1
[11]: https://itsfoss.com/4-best-download-managers-for-linux/
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmbox-import-kali-linux.jpg?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmbox-linux-next.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmbox-kali-linux-settings.jpg?ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/kali-linux-on-windows-virtualbox.jpg?resize=800%2C429&ssl=1
[16]: https://linuxhandbook.com/update-kali-linux/
[17]: https://kali.training/downloads/Kali-Linux-Revealed-1st-edition.pdf
