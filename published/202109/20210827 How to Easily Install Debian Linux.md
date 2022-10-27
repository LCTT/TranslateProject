[#]: subject: "How to Easily Install Debian Linux"
[#]: via: "https://itsfoss.com/install-debian-easily/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "guevaraya"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13789-1.html"

如何轻松安装 Debian Linux 系统
======

![](https://img.linux.net.cn/data/attachment/album/202109/16/123647x9uz7zjjqrq0qwkk.jpg)

安装 Debian 的轻松程度依赖于选择什么镜像。

如果你使用 Debain 官网的默认 ISO 镜像，安装 Debian 就比较费劲。你会卡在这种界面，让你从外部可移动介质上安装网络驱动。

![对于新用户来说，从默认的 ISO 中安装 Debian 是有问题的][1]

当然你可以花时间去排除这个故障，但这让事情变得没有必要的复杂。

不用担心，让我来展示如何轻松地简单安装 Debian。

### 轻松安装 Debian 桌面系统的方法

在你查看这些步骤之前，请确认以下准备工作：

 * 一个至少 4GB 大小的 USB 盘。
 * 一个连接了互联网的系统（可以是要安装 Debian 的同一个机器）。
 * 一个要安装的 Debian 的机器。它将会清理掉系统上所有数据，因此请复制重要数据到其他外部磁盘

你需要为 Debian 准备什么样配置的机器？这取决于你想用什么类型的 [桌面环境][2]。例如，GNOME 桌面系统可以在 4GB 内存上运行，但在 8GB 内存上更流畅一些。如果你只有 4GB 或更少的内存，还是建议尝试 KDE、Cinnamon 或 Xfce 桌面系统。

Debian 支持 [32 位和 64 位的指令架构][3]。你需要根据你的 CPU 指令架构选择对应的 Debian ISO 镜像。

你的系统应该至少要有 25GB 可用的硬盘空间。越多越好。

> **警告！**
>
> 这个方法会移除磁盘上所有其他操作系统及其数据。
> 
> 你可以保存你后面还需要用的个人信息、文档、照片等到外部 USB 盘或云存储中。

在这个教程中，我将展示安装带有 GNOME 桌面环境的 Debian 11 Bullseye 的步骤。即使你选择其他的桌面环境，步骤也应该是一样的。

这个教程是在 GPT 分区的 UEFI 系统上测试的。如果你的系统是 [MBR 而不是 GPT][4]，或是 [传统的 BIOS 而不是 UEFI][5]，那么创建<ruby>临场<rt>Live</rt></ruby> USB  盘的步骤有一点不同。

#### 步骤 1：获取正确的 Debian ISO 镜像

在安装 Debian 过程中，选择正确的 ISO 镜像就已经成功一半了。令人惊讶的是，对于一个新的 Debian 用户来说，要浏览 Debian 的网站并找到最轻松好用的 ISO 真的很困难。

如果你点击 Debian 官网的下载按钮，它会下载一个最小化的网络安装文件，这对普通用户来说是非常复杂的。请 **不要** 使用这个。

反而，你应该用<ruby>临场<rt>Live</rt></ruby> ISO。但这里要注意，有一些单独的含有非自由软件（以包括网络硬件的驱动程序）的版本。

你应该下载这个非自由版的临场 ISO 镜像。不过另一个问题是，你不会在网站的显著位置注意到它，而且有各种架构的 BT 种子或直接下载的 URL。

让我把这些链接放在这里：

- [32 位和 64 位的主仓地址][7]
- [Debian 11 官方下载][8]
- [Debian 11 种子地址][9]

你会看到几个文件，文件名中提到了桌面环境。选择一种你要的桌面环境。直接下载的话，直接点击 .iso 结尾的链接即可。

![下载非自由版的临场 Debian ISO][10]

一旦你有了对应的 ISO 下载包，剩下就是和其他 Linux 发行版一样的标准安装流程了。

#### 步骤 2: 创建一个 Debian 的临场 USB 盘

将 USB 盘插入你的系统。在用之前最好格式化一下，反正它最终也会被格式化的。

你可以根据你的选择使用任何临场 USB 创建工具。如果你使用 Windows，可以使用 Rufus。我们在这里使用 Etcher，因为这个工具在 Windows 和 Linux 都可以用。

从它的官网下载 Etcher。

- [下载 Etcher][11]

我专门写过一篇 [在 Linux 下使用 Etcher 的教程][12]，因此这里我就不深入介绍了。只要运行下载的可执行程序，浏览找到 Debian 的 ISO 镜像，确认选择正确的 USB 盘，然后点击 “Flash” 按钮即可。

![用 Etcher 创建 Debian 的临场 USB 盘][13]

不一会就创建好临场 USB 盘了。创建好之后，就可以开机引导了。

#### 步骤 3：从临场 USB 盘引导启动

重启你要安装 Debian 的机器。当显示制造商标识的时候，按下 `F2`、`F10` 或 `F12` 等键进入开机引导设置界面。你也可以从 Windows [进入到 UEFI 固件设置界面][14]。

有些机器如果启用了<ruby>安全启动<rt>secure boot</rt></ruby>功能，就不允许从临场 USB 盘引导。如果是这种情况，请 [从 BIOS 设置里禁用安全启动][15]

不同的的制造商在界面上会有一些差异。

![][16]

你在 BIOS 里做了修改之后，按下 `F10` 保存并退出。你的系统将会重新启动。

再一次，当看到制造商的标识后按下 `F2`、`F10` 或 `F12` 查看引导配置。你应该可以看到从 USB 引导的选项，然后选中它。

![][17]

一会儿就会看到如下图的显示界面，选择第一个选项。

![Debian 启动界面][18]

#### 步骤 4: 开始安装 Debian

当你进入临场 Debian 会话，如果你使用 GNONE 桌面，它呈现一个欢迎界面，可以在此选择你的键盘和语言。当你看到这些界面时，只需要点击下一步。

![Debian 临场欢迎界面][19]

欢迎界面之后，按下 `Windows` / `Super` 键进入活动区。你应该可以看到 Debian 的安装按钮。
 
![开始安装 Debian][20]

它会打开一个友好的 [Calamares 图形安装器][21]。从这里开始事情就比较简单了，

![Debian 11 Calamares 图形安装器][22]

它会让你选择你的地理位置和时区。

![选择你的地理位置和时区][23]

下一个界面，会让你选择键盘类型。这儿请 **注意**。你的键盘会根据你所选的位置自动选择。例如，我的位置是印度，它会自动默认选择印度键盘和印地语。我需要将其改为印度英语。

![选择键盘类型][24]

下一个界面是关于磁盘分区和要安装 Debian 的地方。在本文中，把 Debian 作为你电脑上唯一的操作系统来安装。

最简单的方法是直接选择 “<ruby>擦除磁盘<rt>Erase Disk</rt></ruby>”。除了必须的 ESP 分区和交换分区外，Debian 会把其他所有东西都放在根挂载点（`/`）上。实际上，下面显示了你所选的安装方式后的磁盘布局。

![磁盘分区][25]

如果你想把事情掌握在自己手中，你也可以选择手动分区，选择分配给 `/`、`/home`、`/boot` 或交换分区的大小。只有在你知道自己在做什么时，才可以这样做。

下一界面，你需要提供用户名和密码。但它不会设置 root 的密码，并将其保持为空。

![设置用户名和密码][26]

这也意味着你可以用新创建的用户使用 `sudo` 。在“复杂的 Debian 安装”中，你也可以设置 root 密码，但这样你就必须手动将普通用户添加到 `sudoer` 列表。看看，这种安装过程是不是对新手来说很容易？ 

在继续实际安装之前，它会呈现你所做的选择的汇总信息。如果没有问题，就可以点击“<ruby>安装<rt>Install</rt></ruby>”按钮。

![安装配置的汇总信息][27]

现在只需要等待安装完成。

![安装 Debian][28]

几分钟后就会完成安装。当安装完成，它会提示重启。

![完成 Debian 安装][29]

重启系统后如果一切顺利，你应该可以看到 Debian 的 GRUB 界面。

![Debian 启动画面][30]

### 疑难解答（如果系统没有启动到 Debian）

我遇到情况是，我的 Dell 系统不能识别任何要引导的操作系统。这很奇怪，我看见 Debian 经创建了一个 ESP 分区。

如果你也是同样的情况，进去 BIOS 配置里。检查<ruby>启动顺序<rt>Boot Sequence</rt></ruby>，如果你看不到任何东西，就点击“<ruby>新增引导选项<rt>Add Boot Option</rt></ruby>”。

![增加新的启动选项][31]

它会提供一个增加 EFI 文件的选项。

![选择 EFI 文件][32]

由于在安装过程中 Debian 创建了 ESP 分区，因此一个包含必要文件的 `EFI` 目录已经创建好了。

![选择 EFI 目录][33]

它会显示一个 `Debian` 目录及其他目录。选择 `Debian` 目录。

![选择 Debian 目录][34]

在 `Debian` 目录，你将看到 `grubx64.efi`、`shimx64.efi` 等文件。请选择 `shimx64.efi`。

![选择 shimx64.efi][35]

你需要给这个文件一个合适的名字。最后的界面应该如下:

![增加 efi 文件的新启动选项][36]

现在你应该有了这个启动选项。因为我命名为 `Debian`，它显示了两个 `Debian` 引导选项（我猜其中一个是从 efi 文件来的）。按下 `F10` 保存退出 BIOS 的配置。

![新增的启动选项][37]

现在启动你的系统，你可以看到带有 Debian 启动选项的 GRUB 界面了。你现在可以体验 Debian 了。

![][30]

### 你能安装 Debian 吗？

我写这篇文章的目的是让事情变得轻松点。并不是说你不能从默认的网络安装程序 ISO 来安装，只是它需要花更多的精力。

这个教程对你安装 Debian 有帮助吗？你如果还是有问题，请在下面留言给我，我会尽力提供帮助。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-debian-easily/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[巴龙](https://github.com/guevaraya)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Debian-firmware.png?resize=800%2C600&ssl=1
[2]: https://itsfoss.com/what-is-desktop-environment/
[3]: https://itsfoss.com/32-bit-64-bit-ubuntu/
[4]: https://itsfoss.com/check-mbr-or-gpt/
[5]: https://itsfoss.com/check-uefi-or-bios/
[6]: https://www.debian.org/
[7]: https://cdimage.debian.org/images/unofficial/non-free/images-including-firmware/11.0.0-live+nonfree/
[8]: https://cdimage.debian.org/images/unofficial/non-free/images-including-firmware/11.0.0-live+nonfree/amd64/iso-hybrid/
[9]: https://cdimage.debian.org/images/unofficial/non-free/images-including-firmware/11.0.0-live+nonfree/amd64/bt-hybrid/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/downloading-Debian-live-non-free-iso.png?resize=800%2C490&ssl=1
[11]: https://www.balena.io/etcher/
[12]: https://itsfoss.com/install-etcher-linux/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/creating-live-debian-usb-with-etcher-800x518.png?resize=800%2C518&ssl=1
[14]: https://itsfoss.com/access-uefi-settings-windows-10/
[15]: https://itsfoss.com/disable-secure-boot-windows/
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2014/05/Disable_Secure_Boot_Windows8.jpg?resize=700%2C525&ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/boot-from-windows-disk-ventoy.jpg?resize=800%2C611&ssl=1
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/debian-live-boot-screen.png?resize=617%2C432&ssl=1
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/debian-live-welcome-screen.png?resize=800%2C450&ssl=1
[20]: https://itsfoss.com/wp-content/uploads/2021/08/start-Debian-installation-800x473.webp
[21]: https://calamares.io/
[22]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-1.png?resize=800%2C441&ssl=1
[23]: https://itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-2-800x441.webp
[24]: https://itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-4-800x441.webp
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-5.png?resize=800%2C441&ssl=1
[26]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-6.png?resize=800%2C441&ssl=1
[27]: https://itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-7-800x500.webp
[28]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-8.png?resize=800%2C500&ssl=1
[29]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/Installing-Debian-9.png?resize=800%2C500&ssl=1
[30]: https://itsfoss.com/wp-content/uploads/2021/08/debian-boot-screen.webp
[31]: https://itsfoss.com/wp-content/uploads/2021/08/add-new-boot-option.webp
[32]: https://itsfoss.com/wp-content/uploads/2021/08/add-efi-file-for-boot-option.webp
[33]: https://itsfoss.com/wp-content/uploads/2021/08/select-efi-file-boot-option.webp
[34]: https://itsfoss.com/wp-content/uploads/2021/08/select-debian-folder-for-uefi.webp
[35]: https://itsfoss.com/wp-content/uploads/2021/08/select-shim-boot.webp
[36]: https://itsfoss.com/wp-content/uploads/2021/08/new-boot-option.webp
[37]: https://itsfoss.com/wp-content/uploads/2021/08/new-boot-option-added.webp
