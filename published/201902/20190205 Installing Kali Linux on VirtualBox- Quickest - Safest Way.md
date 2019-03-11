[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10550-1.html)
[#]: subject: (Installing Kali Linux on VirtualBox: Quickest & Safest Way)
[#]: via: (https://itsfoss.com/install-kali-linux-virtualbox)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

在 VirtualBox 上安装 Kali Linux 的最安全快捷的方式
======

> 本教程将向你展示如何以最快的方式在运行于 Windows 和 Linux 上的 VirtualBox 上安装 Kali Linux。

[Kali Linux][1] 是最好的[黑客][2] 和安全爱好者的 Linux 发行版之一。

由于它涉及像黑客这样的敏感话题，它就像一把双刃剑。我们过去在一篇详细的 [Kali Linux 点评](https://linux.cn/article-10198-1.html)中对此进行了讨论，所以我不会再次赘述。

虽然你可以通过替换现有的操作系统来安装 Kali Linux，但通过虚拟机使用它将是一个更好、更安全的选择。

使用 Virtual Box，你可以将 Kali Linux 当做 Windows / Linux 系统中的常规应用程序一样，几乎就和在系统中运行 VLC 或游戏一样简单。

在虚拟机中使用 Kali Linux 也是安全的。无论你在 Kali Linux 中做什么都不会影响你的“宿主机系统”（即你原来的 Windows 或 Linux 操作系统）。你的实际操作系统将不会受到影响，宿主机系统中的数据将是安全的。

![Kali Linux on Virtual Box][3]

### 如何在 VirtualBox 上安装 Kali Linux

我将在这里使用 [VirtualBox][4]。它是一个很棒的开源虚拟化解决方案，适用于任何人（无论是专业或个人用途）。它可以免费使用。

在本教程中，我们将特指 Kali Linux 的安装，但你几乎可以安装任何其他已有 ISO 文件的操作系统或预先构建好的虚拟机存储文件。

**注意：**这些相同的步骤适用于运行在 Windows / Linux 上的 VirtualBox。

正如我已经提到的，你可以安装 Windows 或 Linux 作为宿主机。但是，在本文中，我安装了 Windows 10（不要讨厌我！），我会尝试在 VirtualBox 中逐步安装 Kali Linux。

而且，最好的是，即使你碰巧使用 Linux 发行版作为主要操作系统，相同的步骤也完全适用！

想知道怎么样做吗？让我们来看看…

### 在 VirtualBox 上安装 Kali Linux 的逐步指导

我们将使用专为 VirtualBox 制作的定制 Kali Linux 镜像。当然，你还可以下载 Kali Linux 的 ISO 文件并创建一个新的虚拟机，但是为什么在你有一个简单的替代方案时还要这样做呢？

#### 1、下载并安装 VirtualBox

你需要做的第一件事是从 Oracle 官方网站下载并安装 VirtualBox。

- [下载 VirtualBox](https://www.virtualbox.org/wiki/Downloads)

下载了安装程序后，只需双击它即可安装 VirtualBox。在 Ubuntu / Fedora Linux 上安装 VirtualBox 也是一样的。

#### 2、下载就绪的 Kali Linux 虚拟镜像

VirtualBox 成功安装后，前往 [Offensive Security 的下载页面][5] 下载用于 VirtualBox 的虚拟机镜像。如果你改变主意想使用 [VMware][6]，也有用于它的。

![Kali Linux Virtual Box Image][7]

如你所见，文件大小远远超过 3 GB，你应该使用 torrent 方式或使用 [下载管理器][8] 下载它。

#### 3、在 VirtualBox 上安装 Kali Linux

一旦安装了 VirtualBox 并下载了 Kali Linux 镜像，你只需将其导入 VirtualBox 即可使其正常工作。

以下是如何导入 Kali Linux 的 VirtualBox 镜像：

**步骤 1**：启动 VirtualBox。你会注意到有一个 “Import” 按钮，点击它。

![virtualbox import][9] 

*点击 “Import” 按钮*

**步骤 2**：接着，浏览找到你刚刚下载的文件并选择它导入（如你在下图所见）。文件名应该以 “kali linux” 开头，并以 “.ova” 扩展名结束。

![virtualbox import file][10]

*导入 Kali Linux 镜像*

选择好之后，点击 “Next” 进行处理。

**步骤 3**：现在，你将看到要导入的这个虚拟机的设置。你可以自定义它们，这是你的自由。如果你想使用默认设置，也没关系。

你需要选择具有足够存储空间的路径。我永远不会在 Windows 上推荐使用 C：驱动器。

![virtualbox kali linux settings][11] 

*以 VDI 方式导入硬盘驱动器*

这里，VDI 方式的硬盘驱动器是指通过分配其存储空间设置来实际挂载该硬盘驱动器。

完成设置后，点击 “Import” 并等待一段时间。

**步骤 4**：你现在将看到这个虚拟机已经列出了。所以，只需点击 “Start” 即可启动它。

你最初可能会因 USB 端口 2.0 控制器支持而出现错误，你可以将其禁用以解决此问题，或者只需按照屏幕上的说明安装其他软件包进行修复即可。现在就完成了！

![kali linux on windows virtual box][12]

*运行于 VirtualBox 中的 Kali Linux*

我希望本指南可以帮助你在 VirtualBox 上轻松安装 Kali Linux。当然，Kali Linux 有很多有用的工具可用于渗透测试 —— 祝你好运！

**提示**：Kali Linux 和 Ubuntu 都是基于 Debian 的。如果你在使用 Kali Linux 时遇到任何问题或错误，可以按照互联网上针对 Ubuntu 或 Debian 的教程进行操作。

### 赠品：免费的 Kali Linux 指南手册

如果你刚刚开始使用 Kali Linux，那么了解如何使用 Kali Linux 是一个好主意。

Kali Linux 背后的公司 Offensive Security 已经创建了一本指南，介绍了 Linux 的基础知识，Kali Linux 的基础知识、配置和设置。它还有一些关于渗透测试和安全工具的章节。

基本上，它拥有你开始使用 Kali Linux 时所需知道的一切。最棒的是这本书可以免费下载。

- [免费下载 Kali Linux 揭秘](https://kali.training/downloads/Kali-Linux-Revealed-1st-edition.pdf)

如果你遇到问题或想分享在 VirtualBox 上运行 Kali Linux 的经验，请在下面的评论中告诉我们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-kali-linux-virtualbox

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.kali.org/
[2]: https://itsfoss.com/linux-hacking-penetration-testing/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/kali-linux-virtual-box.png?resize=800%2C450&ssl=1
[4]: https://www.virtualbox.org/
[5]: https://www.offensive-security.com/kali-linux-vm-vmware-virtualbox-image-download/
[6]: https://itsfoss.com/install-vmware-player-ubuntu-1310/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/kali-linux-virtual-box-image.jpg?resize=800%2C347&ssl=1
[8]: https://itsfoss.com/4-best-download-managers-for-linux/
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmbox-import-kali-linux.jpg?ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmbox-linux-next.jpg?ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/vmbox-kali-linux-settings.jpg?ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/02/kali-linux-on-windows-virtualbox.jpg?resize=800%2C429&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/02/kali-linux-virtual-box.png?fit=800%2C450&ssl=1
