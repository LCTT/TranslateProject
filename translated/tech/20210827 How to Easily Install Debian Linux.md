[#]: subject: "How to Easily Install Debian Linux"
[#]: via: "https://itsfoss.com/install-debian-easily/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "guevaraya "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何简单安装 Debian Linux 系统
======

安装 Debian 的简易程度依赖于选择什么镜像。

如果你使用 Debain 官网的默认镜像，安装 Debian 就比较费劲。你会遇到这种界面，让你从外部介质先安装网络驱动。

![Installing Debian from default ISO is problematic for new users][1]

当然你也可以花时间去排除这个故障，但这让事情变得无意义的复杂。

不用担心，让我来展示如何轻巧的简单安装 Debian。

### 简单安装 Debian桌面系统

在你查看步骤之前，请确认以下准备工作：
 * 一个至少 4Gb 大小的U盘
 * 一个可以联网的系统（可以和要安装的操作系统一样）
 * 要安装的 Debian 系统将会清理掉系统上所有数据，因此请拷贝重要数据到其他外部磁盘

你需要什么规格的 Debian 系统？取决于你想用什么类型的[桌面环境][2]。例如，GNOME 桌面系统可以在4GB RAM上运行但最好在8GB RAM 流畅一些。如果你是4GB或更小的 RAM，还是建议尝试 KDE，Cinnamon 或 Xfce 桌面系统。

Debian 也都支持 [32位和64位的指令架构][3]。你需要根据你的CPU指令架构选择对应的 Debian 镜像。

你的系统应该至少要有 25 GB的硬盘空间可用。越多越好。

警告！

这个方法会移除磁盘上其他操作系统的已有数据。

你可能需要保存你后面还需要用的个人信息，文档，照片等到外部 U 盘或云盘。

这个教程是我安装附带 GNOME Debian 11 Bullseye 的步骤。这些步骤其实和其他桌面环境都大同小异。

_**这个教程在 UEFI 系统的 GPT分区得到验证。如果你是[MBR替换GPT分区][4]，或[传统的BIOS替换UEFI][5]，创建Live USB的步骤有一点不同。**_


#### 步骤 1：获取正确的 Debian 的 ISO 镜像

在安装 Debian 过程中的一半事情是选择合适的 ISO 镜像。奇怪的是，确实作为一个新 Debian 用户很难从官网容易的找到 ISO镜像。

如果你点击 Debian 官网的下载按钮，它会下载一个为用户提供最佳兼容的最小安装包。请不太要用它。

反而，你需要用 Live ISO。这有一个技巧，有独立非免费的 Live 版本（包含网络驱动）

你需要下载非免费的 live ISO 镜像。这里的其他程序可以不必从官网下载，有各种 torrents 连接或直接下载各种架构的安装包。

这些链接就在这里

[32和64位的主仓地址][7]

[Debian 11 官方下载][8]

[Debian 11 种子地址][9]

你将看到桌面环境的几个文件的名字。选择一种你的对应的桌面环境。直接下载的话，直接点击.iso结尾的链接。

![下载非免费版的 Live Debian 的ISO][10]

一旦你有了对应的 ISO 下载包，剩下就是和其他 Linux 发行版的安装流程一样了

#### 步骤 2: 创建一个 Debian 的 Live USB

将USB插入你的系统。最好在用之前最好格式化一下，它最终也会被格式化的。

你可以根据你的选择使用任何版本的 Live USB 创建工具。如果你使用 Windows，请用 Rufus。我们现在在这用 Etcher，因为这个工具在 Windows 和 Linux 都可以用。

从它的官网下载 Etcher 

[下载 Etcher][11]

我有一个专门的[在linux下使用 Etcher 的教程][12]。而这我就不深入介绍了。仅仅下载可执行程序，浏览 Debian 的 ISO镜像，确认选择正确的 USB 驱动器然后点击 Flash 按钮。

![用 Etcher 创建 Debian 的 Live USB][13]

不一会就创建好 live USB。一旦创建好，就可以开机引导了。

#### 步骤 3:从 live USB 引导启动

重启即将要安装 Debian 的系统。当她显示制造商标识的时候，按下F2/F10 或 F12 键进入开机引导选择界面。你可能也会[进入到 UEFI 固件设置界面][14]。

有些系统已经开启了安全启动功能就不允许从 Live USB 开机引导。如果是这种情况，请[从BIOS设置里禁用安全启动][15]

不同的的制造商在界面上一些差异。

![][16]

一点你在 BIOS 里做了修改，按下 F10 保存并推出。你的系统将会重新启动。

再次看到，当看到制造商的标识后按下 F2/F10 或 F12 查看引导配置。你应该可以看到从 USB 引导的类似选项，然后选中。

![][17]

一会儿就会看到如下图的显示界面，选择第一个选项。

![Debian live 选择界面][18]

#### 步骤 4: 开始 Debian 安装

当你进入 live Debian 会话，如果你用 GNONE 桌面话，它呈现一个欢迎界面并带有选择你的键盘和语言。当你看到这些界面只需要点击下一步。

![Debian live 欢迎界面][19]

选择欢迎界面之后，按下 windows徽标/Super 键进入活动区。你应该可以看到 Debian 的安装按钮。
 
![开始 Debian 安装][20]

它会打开一个友好的[<ruby>卡拉马雷斯<rt>Calamares</rt></ruby>图形安装器][21]。从这里开始事情就比较简单了，

![Debian 11 Calamares graphical installer][22]

它会让你选择你的地理位置和时区。

![Select your location and time zone][23]

下一个界面，会让你选择键盘类型。这儿请 **注意**。你的键盘会根据位置自动选择。例如，我的位置是印度它会自动选择印地语的印度键盘。我不得不将其改为英语印度类型。

![选择键盘类型][24]

下一个界面是关于硬盘分区表和 Debian 安装哪里。这里是在你的系统只安装 Debian。

简单选择便是直接 “Erase Disk”。Debian 将把除过 ESP 分区和交互分区的其他分区都放在根挂载点上。实际上，下面显示了你选择了安装配置后的磁盘分布。

![磁盘分区][25]

如果你想手动选择，你也需要手工划分区，选择 root，home，boot 或 swap 分配多少。只有你知道自己在做什么你才可以去手工配置。

下一界面，你需要提供用户名和密码。但它不会设置root的密码并将其保持为空。

![设置用户名和密码][26]

这也意味着你可以用 sudo 新创建用户。在“复杂 Debian 安装”中，你也可以设置 root 密码但前提是你必须用手动添加普通用户到 sudoer 列表。看看，这个安装过程是不是对新手来说很简单？ 

在实际真正安装之前，它会呈现你已经选择的汇总信息。如果没有问题，就可以点击安装按钮。

![安装配置的汇总信息][27]

现在只需要等待安装完成。

![安装 Debian][28]

几分钟后就会完成安装。当安装完成，它会提示重启。

![完成 Debian 安装][29]

如果一切顺利重启系统，你应该可以看到 Debian 的 grub 界面。

![Debian 启动画面][30]

### 疑难解答小贴士 (如果系统没有启动到 Debian)

我遇到情况是，我的 Dell 系统不能识别并引导任何操作系统。很奇怪，我已经能看到 Debian 已经创建了一个 ESP 分区。

如果你也是同样的情况，去BIOS配置里。检测启动流程，如果你看不到任何东西，就点击新增一个启动选项。

![增加新的启动选项][31]

它会提供一个增加 EFI 文件的选项。

![选择 EFi 文件][32]

只有在安装过程中 Debian 创建了 ESP 分区，就有一个带文件的 EFI 目录被创建出来。

![选择 EFI 目录][33]

它会显示一个 Debian 文件夹包含其他文件夹。选择 Debian 文件夹。

![选择 Debian][34]

在 Debian 文件夹，你将看到 grubx64.efi, shimx64.efi。请选择 shimx64.efi。

![选择 shim.efi][35]

你需要选择一个合适的名字。最后的界面应该如下:

![增加 efi 文件的新启动选项][36]

现在你可能有了下面这个启动选项。我命名为 Debian，它显示了两个 Debian 驱动选择（我猜其中一个是从 efi 文件来的）。按下 F10 保存退出 BIOS 的配置。

![新增的启动选项][37]

现在启动你的系统，你可以看到 grub 界面带有 Debian 的启动选项。你现在可以体验 Debian 了。

![][30]

### Debian 可以安装到哪里？

我这里的目的是让事情变得简单。并不是说你不能从默认的官网下载安装包来安装。只是它需要花更多的精力。

这个教程对你安装有帮助吗？你如果还是有问题，请在下面留言给我，我会尽力提供帮助。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-debian-easily/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[巴龙](https://github.com/guevaraya)
校对：[校对者ID](https://github.com/校对者ID)

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
