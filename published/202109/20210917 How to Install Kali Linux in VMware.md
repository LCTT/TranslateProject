[#]: subject: "How to Install Kali Linux in VMware"
[#]: via: "https://itsfoss.com/install-kali-linux-vmware/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: " "
[#]: url: " "

如何在 VMware 中安装 Kali Linux
======

![](https://img.linux.net.cn/data/attachment/album/202109/21/144206sjhgutyjgtu6m22z.jpg)

Kali Linux 是 [用于学习和练习黑客攻击和渗透测试的 Linux 发行版][1] 的不二之选。

而且，如果你经常捣鼓 Linux 发行版，出于好奇心，你可能已经尝试过它。

> **警告！**
> 
> 本文介绍的内容仅供学习 Kali Linux 的安装，请勿使用 Kali Linux 进行任何非授权的行为。Kali Linux 应该用于在授权的情况下，对授权的目标进行合理的渗透测试，以了解其脆弱性并加以防范。本文作译者和本站均不对非授权和非法的使用及其造成的后果负责。

然而，无论你用它做什么，它都不能替代正规成熟的桌面 Linux 操作系统。因此，（至少对于初学者来说）建议使用虚拟机程序（如 VMware）来安装 Kali Linux。

通过虚拟机，你可以把 Kali Linux 作为你的 Windows 或 Linux 系统中的一个常规应用程序来使用，就像在你的系统中运行 VLC 或 Skype 一样。

有一些免费的虚拟化工具可供使用。你可以 [在 Oracle VirtualBox 上安装 Kali Linux][2] ，也可以使用 VMWare Workstation。

本教程重点介绍 VMWare。

### 在 Windows 和 Linux 的 VMware 上安装 Kali Linux

> **非 FOSS 警报！**
>
> VMWare 不是开源软件。

对于本教程，我假定你使用的是 Windows，是考虑到大多数 VMware 用户喜欢使用 Windows 10/11。

然而，除了在 Windows 上安装 VMWare 的部分，本 **教程对 Linux 也是有效的**。你可以 [轻松地在 Ubuntu 和其他 Linux 发行版上安装 VMWare][3]。

#### 步骤 1：安装 VMWare Workstation Player（在 Windows 上）

如果你的系统上已经安装了 VMware，你可以跳到安装 Kali Linux 的步骤。

前往 [VMWare 的 Workstation Player 官方网页][4]，然后点击 “Download For Free” 按钮。

![][5]

接下来，你可以选择版本（如果你想要特定的版本或遇到最新版本的 bug），然后点击 “Go to Downloads”。

![][6]

然后你就会看到 Windows 和 Linux 版本的下载按钮。你需要点击 “Windows 64-bit” 的按钮，因为这就是我们在这里需要的。

![][7]

顺便提一句，它不支持 32 位系统。

最后，当你得到下载的 .exe 文件时，启动它以开始安装过程。你需要点击 “Next” 来开始安装 VMware。

![][8]

接下来，你需要同意这些政策和条件才能继续。

![][9]

现在，你可以选择安装的路径。理想情况下，保持默认设置。但是，如果你在虚拟机中需要更好的键盘响应/屏幕上的键盘性能，你可能想启用 “<ruby>增强型键盘驱动程序<rt>Enhanced Keyboard Driver</rt></ruby>”。

![][10]

进入下一步，你可以选择禁用每次启动程序时的更新检查（可能很烦人），并禁用向 VMware 发送数据，这是其用户体验改进计划的一部分。

![][11]

如果你想使用桌面和开始菜单的快捷方式进行快速访问，你可以勾选这些设置，或像我一样将其取消。

![][12]

现在，继续以开始安装。

![][13]

这可能需要一些时间，完成后，你会看到另一个窗口，让你完成这个过程，并让你选择输入一个许可证密钥。如果你想获得商业许可，你需要 VMware Workstation 专业版，否则，该 Player 版本对个人使用是免费的。

![][14]

> **注意！**
>
> 请确保你的系统已经启用了虚拟化功能。最近的 VMWare 的 Windows 版本要求你明确启用虚拟化以使用虚拟机。

#### 步骤 2：在 VMware 上安装 Kali Linux

开始时，你需要下载 Kali Linux 的镜像文件。而且，如果你打算在虚拟机上使用它，Kali Linux 会提供一个单独的 ISO 文件。

![][15]

前往其 [官方下载页面][16]，下载可用的预构建的 VMware 镜像。

![][17]

你可以直接下载 .7z 文件或利用 Torrent（一般来说速度更快）。在这两种情况下，你也可以用提供的 SHA256 值检查文件的完整性。

下载完成，你需要将文件解压到你选择的任何路径。

![][18]

打开 VMware Workstation Player，然后点击 “<ruby>打开一个虚拟机<rt>Open a Virtual Machine</rt></ruby>”。现在，寻找你提取的文件夹。然后浏览它，直到你找到一个扩展名为 .vmx 的文件。

比如说，`Kali-Linux-2021.3-vmware-amd64.vmx`。

![][19]

选择 .vmx 文件来打开该虚拟机。它应该直接出现在你的 VMware Player 中。

你可以选择以默认设置启动虚拟机。或者，如果你想调整分配给虚拟机的硬件，可以在启动前随意改变设置。

![][20]

根据你的计算机硬件，你应该分配更多的内存和至少一半的处理器核心，以获得流畅的性能。

在这种情况下，我有 16GB 的内存和一个四核处理器。因此，为这个虚拟机分配近 7GB 的内存和两个内核是安全的。

![][21]

虽然你可以分配更多的资源，但它可能会影响你的宿主机操作系统在工作时的性能。所以，建议在这两者之间保持平衡。

现在，保存设置并点击 “<ruby>播放虚拟机<rt>Play virtual machine</rt></ruby>” 来启动 Kali Linux on VMware。

当它开始加载时，你可能会看到一些提示，告诉你可以通过调整一些虚拟机设置来提高性能。

你不用必须这样做，但如果你注意到性能问题，你可以禁用<ruby>侧通道缓解措施<rt>side-channel mitigations</rt></ruby>（用于增强安全性）来提高虚拟机的性能。

另外，你可能会被提示下载并 [安装 VMware tools for Linux][22]；你需要这样做以获得良好的虚拟机体验。

完成之后，你就会看到 Kali Linux 的登录界面。

![][23]

考虑到你启动了一个预先建立的 VMware 虚拟机，你需要输入默认的登录名和密码来继续。

- 用户名：`kali`
- 密码： `kali`

![][24]

就是这样！你已经完成了在 VMware 上安装 Kali Linux。现在，你所要做的就是开始探索了！

### 接下来呢？

这里有一些你可以利用的提示：

  * 如果剪贴板共享和文件共享不工作，请在访客系统（Kali Linux）上 [安装 VMWare tools][22]。
  * 如果你是新手，请查看这个 [Kali Linux 工具列表][25]。

如果你觉得这个教程有帮助，欢迎分享你的想法。你是否喜欢在不使用 VMware 镜像的情况下安装 Kali Linux？请在下面的评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-kali-linux-vmware/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-hacking-penetration-testing/
[2]: https://itsfoss.com/install-kali-linux-virtualbox/
[3]: https://itsfoss.com/install-vmware-player-ubuntu-1310/
[4]: https://www.vmware.com/products/workstation-player.html
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-player-download.png?resize=732%2C486&ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-player-download-1.png?resize=800%2C292&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-player-download-final.png?resize=800%2C212&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-setup-1.png?resize=692%2C465&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-setup-license.png?resize=629%2C443&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-setup-2.png?resize=638%2C440&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-workstation-tracking.png?resize=618%2C473&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-workstation-shortcuts.png?resize=595%2C445&ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-player-install.png?resize=620%2C474&ssl=1
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-player-installed.png?resize=589%2C441&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-image-kali.png?resize=800%2C488&ssl=1
[16]: https://www.kali.org/get-kali/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-kali-linux-image-download.png?resize=800%2C764&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/extract-vmware-image.png?resize=617%2C359&ssl=1
[19]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-kali-linux-image-folder.png?resize=800%2C498&ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/virtual-machine-settings-kali.png?resize=800%2C652&ssl=1
[21]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/kali-vm-settings.png?resize=800%2C329&ssl=1
[22]: https://itsfoss.com/install-vmware-tools-linux/
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/kali-linux-vm-login.png?resize=800%2C540&ssl=1
[24]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/vmware-kali-linux.png?resize=800%2C537&ssl=1
[25]: https://itsfoss.com/best-kali-linux-tools/
