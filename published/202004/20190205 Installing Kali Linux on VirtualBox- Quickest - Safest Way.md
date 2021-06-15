[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12113-1.html)
[#]: subject: (Installing Kali Linux on VirtualBox: Quickest & Safest Way)
[#]: via: (https://itsfoss.com/install-kali-linux-virtualbox/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

在 VirtualBox 上安装 Kali Linux：最快速和最安全的方法
======

> 这篇教程向你展示如何在 Windows 和 Linux 中以最快的方式在 VirtualBox 上安装 Kali Linux。

[Kali Linux][1] 是 [最适合脆弱性测试和安全爱好者的 Linux 发行版][2] 之一。

因为它涉及一个像黑客之类的敏感话题，就像一把双刃剑。我们过去在详细的 Kali Linux 评论中讨论过，所以我不会再次赘述。

虽然你可以通过替换现有的操作系统的形式安装 Kali Linux，但是通过虚拟机来使用它可能会是更好、更安全的选择。

使用 VirtualBox，你可以在 Windows/Linux 系统中将 Kail Linux 作为常规应用程序使用。这和在系统中运行 VLC 或游戏几乎是一样的。

在虚拟机中使用 Kali Linux 是安全的。不管你在 Kali Linux 做什么都不会影响你的 ‘宿主系统’（即你原来的 Windows 或 Linux 操作系统）。你的实际操作系统将不会受到影响，并且在你的宿主系统中数据也是安全的。

![][3]

### 如何在 VirtualBox 中安装 Kali Linux 

在这里我会使用 [VirtualBox][4]。它是一个非常好的开源虚拟化解决方案，几乎适合于任何人，无论是专业使用或个人使用。它是免费提供的。

在这篇文章中，我们将特别讨论 Kali Linux，但你也可以安装几乎任何其他的操作系统，只要有 ISO 文件或预建的虚拟机保存文件就可以安装。

**注意：**同样的步骤适用于运行 VirtualBox 的 Windows 或 Linux。

如上所述 ，你可以安装 Windows 或 Linux 作为你的宿主系统。但是，在我已安装 Windows 10 的情况下（别仇恨我！），我会尝试着在其上的 VirtualBox 中一步步地安装 Kali Linux 。

并且，最棒的是，即使你碰巧使用一个 Linux 发行版作为你的主要操作系统，也将使用同样的步骤!

想知道如何做？让我们来看看…

- [video](https://youtu.be/TGOiAsSdADs)

### 在 VirtualBox 上安装 Kali Linux 的分步指南

我们将使用一个专门为 VirtualBox 定制的 Kali Linux 镜像。你也可以下载 Kali Linux 的 ISO 文件，并创建一个新的虚拟机，但是当你有一个简单的选择时，为什么还这样做呢？

#### 1、下载并安装 VirtualBox

第一件要做的事是从甲骨文的官方网站下载和安装 VirtualBox。

- [下载 VirtualBox][6]

在你下载了安装器之后，只需要双击它来安装 VirtualBox。在 [Ubuntu][7]/Fedora Linux 安装 VirtualBox 也是一样的方式。

#### 2、下载即用型的 Kali Linux 虚拟镜像

在安装成功后，前往 [Offensive Security 的下载页面][8] 来下载适用于 VirtualBox 的虚拟机镜像。如果你改变主意使用 [VMware][9]，那里也有适用的。

![][10]

如你所见，文件大小大约 3 GB，你应该使用 torrent 方式，或者使用一个[下载管理器][11]来下载它。

- [下载 Kali Linux 虚拟镜像][8]

#### 3、在 Virtual Box 上安装 Kali Linux

当你安装 VirtualBox 并下载 Kali Linux 镜像后，你只需要将其导入到 VirtualBox 中就可以使其正常工作。

这里是如何导入 Kali Linux 的 VirtualBox 镜像：

##### 步骤 1

启动 VirtualBox。你会看到一个<ruby>导入<rt>Import</rt></ruby> 按钮，点击它。

![点击导入按钮][12]

##### 步骤 2

接下来，浏览刚刚下载的文件，选择要导入的文件（如下图所示）。文件名应该以“kali linux”开始，以 .ova 扩展名结束。

![导入 Kali Linux 镜像][13]

选择后，单击<ruby>下一步<er>Next</rt></.ruby>继续进行。

##### 步骤 3

现在，你会看到要导入的虚拟机的设置。所以，你可以自定义它们或者不自定义，这是你的选择。采用默认设置也是可以的。

你需要选择一个有足够可用存储空间的路径。在 Windows 上，我绝不建议使用 C: 盘。

![将硬盘驱动器导入为  VDI][14]

在这里，“将硬盘驱动器导入为  VDI”指的是通过分配存储器空间集来虚拟挂载硬盘驱动器。

在你完成设置后，单击<ruby>导入<rt>Import</rt></ruby>，等待一段时间。

##### 步骤 4

你现在将看到它被列在虚拟机列表中。所以，只需点击<ruby>开始<rt>Start</rt></ruby>来启动它。

你可能会在开始时得到一个 USB 2.0 端口控制器的错误，你可以禁用它来解决问题，或者只需按照屏幕上的指示来安装一个附加软件包修复问题。然后就大功告成了！

![Kali Linux 运行在 VirtualBox 中][15]

以前 Kali Linux 中的默认用户名是 root，默认密码是 toor。但从 2020 年 1 月起，Kali Linux 就不使用 root 账号了。现在，默认账号和密码都是 kali。

你应该可以用它来登录系统了。

请注意，在尝试安装一个新的应用程序或尝试破解 WiFi 密码之前，请先[更新 Kali Linux][16] 。

我希望这篇指南能帮助您在 VirtualBox 上很容易地安装 Kali Linux。当然，Kali Linux 有很多有用的渗透测试工具 – 祝你好运！

**提示** : Kali Linux 和 Ubuntu 都是基于 Debian 的，如果你在使用 Kali Linux 时遇到任何问题或错误，你可以按照互联网上的 Ubuntu 和 Debian 的教程解决。

### 奖励: 免费的 Kali Linux 指南书

如果你刚刚开始使用 Kali Linux, 那么了解如何使用 Kali Linux 就很有必要了。

Kali Linux 背后的公司 Offensive Security 制作了一本指南书，讲解了 Linux 的基础知识、Kali Linux 的基础知识、配置和设置，书中还有一些关于渗透测试和安全工具的章节。

基本上，它包含你上手 Kali Linux 所需要的一切东西。更重要的是，这本书可以免费下载。

- [免费下载《揭秘 Kali Linux》][17]

如果你在 VirtualBox 上使用 Kali Linux 时遇到问题，请在下面的评论中告诉我们，或者直接分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-kali-linux-virtualbox/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

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
