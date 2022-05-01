[#]: subject: "Installing Arch Linux Using archinstall Automated Script [Complete Guide]"
[#]: via: "https://www.debugpoint.com/2022/01/archinstall-guide/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14444-1.html"

用 archinstall 自动化脚本安装 Arch Linux
======

![](https://img.linux.net.cn/data/attachment/album/202204/08/084638i8vp81c1zpxpw6i8.jpg)

> 在这篇指南中，我们解释了使用自动化脚本 `archinstall` 安装 Arch Linux 的超级容易的方法。适合初学者到高级用户。

对许多新用户来说，安装 Arch Linux 仍然是一件头疼的事情。它需要命令行，以及包括启动引导过程、内核和 Grub 概念在内的 Linux 系统的内部工作机制等大量的知识。对许多人来说并不知道这些知识。但是新用户仍然想要安装和体验 Arch Linux 。

我个人感觉在计算机年代，操作系统的安装应该是简单的事情。对于最终用户安装系统应该尽可能的简单。毕竟，所有操作系统的存在只有一个目的 —— 帮助最终用户执行某些任务并协助他们。　

### archinstall 自动化脚本是什么？

话说，不久前我们讨论过在裸机上安装 Arch Linux。从那以后，Arch Linux 团队弄出来了一个叫做 [archinstall][1] 自动化和交互脚本。如今用这个脚本安装 Arch Linux 是一件容易的事情，任何人都能够完成。

这就让我们有了使用这个叫做 `archinstall` 的自动化脚本撰写这篇 Arch Linux 安装指南的打算。

让我们开始吧。

### 使用 archinstall 脚本安装 Arch Linux 的指南

我将这个指南分为三个部分。第一部分是下载 Arch Linux 的 .ISO 文件，创建一个磁盘引导分区。第二部分是实际安装，最后是用一个示例桌面来完成配置。

#### 第一部分：下载 .ISO 文件

访问以下链接。下载 Arch Linux 的 .ISO 文件。你能够用一个直接的 HTTP 地址下载或者使用种子/磁力链接下载文件。

> [下载 Arch Linux][2]

一旦下载完成，用 [Etcher][3] 或者其他的工具创建一个可启动的 U 盘。

完成以后，插入 U 盘并且重启计算机。

你开始下一部分之前，确定你连接了互联网。一般来说，如果你是有线网，那就很好。如果你在 Arch 就要通过命令行配置 Wi-Fi，请 [遵从此指南][4]。只要确保你已经连接到互联网就行。

#### 第二部分：使用 archinstall 安装

一旦启动完成，你应该看到以下提示。键入 `archinstall` 然后点击回车。

![First prompt for archinstall][5]

这个命令将会验证网络连接是否连接到 Arch Linux 的镜像站点。一旦完成，就会弹出一系列（像这样的）问题。你需要做的将是阅读和回复。

所以，对这个指南来说，我给出了让你开始的最基础和最容易的一种方法。如果你足够自信，你也可以尝试其他选择。但是我建议遵循以下概述的基本选择，下次你在尝试其他的选择。

够公平吧？OK。

因此，第一个问题是键盘布局类型。通过两个字节国家特定布局代码来显示。你也可以键入它们或者输入它们边上的数字。对于美国-英语来说，我键入 `us` 。

![Keyboard Type – archinstall][6]

下一步是键盘语言，我键入数字 `65` 选择美国。

![Keyboard Language – archinstall][7]

下一个是硬盘驱动器部分。这个脚本自动探测你的目标系统的可用驱动器。举个例子，在以下图片中，它显示 17GB `/dev/vda` 是一个主要的块设备。这就是我要安装系统的地方。不要跳过这个步骤。

在这个指南中，我键入数字 `2` 选中 `/dev/vda` 块设备。请根据你们每人的系统键入相应的数字。

一旦你做完这步，你应该在设置这个设备的边上看到一个双箭头 `>>`。如果你已经选中它，按下回车键进入下一步。

![Choose Block Device -1][9]

![Choose Block Device -2][10]

在下一个选项中，你要非常小心。这个脚本问是否你想清除设备然后进行自动分区。否则你要手动分区硬盘驱动器。为了简单起见，我选择选项 `0`。

![Select partition option – archinstall][11]

在下面一组问题中，如下图所示。更多的是文件系统类型、主机名、root 用户密码，等等。按照屏幕上的操作。便于帮助你，我已经在下表中加入了用于本指南的问题和答案。

问题 | 选项
---|---
选择主要的文件系统 | `ext4`
你想用 zram 作为交换分区吗？| `n`
键入磁盘加密密码 | 保留为空直接按下回车
主机名或计算机名 | 键入你要键入的名字
键入 root 密码 | 键入你要键入的密码
键入程序预配置文件名：0 – 桌面；1 – 最小化；2 – 服务器；3 – xorg | 选择 `3` xorg
安装显卡驱动 | 根据你的系统选择数字。否则缺省不选按下回车键 
安装声卡驱动 | 选择 `pulseaudio`

![Various options in archinstall -1][12]

在选择内核的下个问题里，选择 `linux`。这个脚本将要为你安装你额外添加的软件包，像 firefox、nano ，等等。

用 NetworkManager 选择网络接口，并且为时区选择缺省选项。

![Various options in archinstall -2][13]

就是这样。一旦你已经完成上述步骤，这个脚本将会生成，并且等待你按下回车开始安装过程。

![archinstall starts downloading packages][14]

等待直到这一步骤完成。这将花一些时间下载安装所有软件包，这依赖你的系统和网络连接速度。有时 Arch 镜像是缓慢的，所以等待直到它完成。

#### 第三部分 - 安装桌面环境

当你用以上方法安装完基本系统以后，你可以安装像 GNOME、KDE Plasma、MATE、Xfce 等额外的桌面环境。我们在以下页面中为它们每个都提供了安装指南。你可以访问你选择的桌面环境安装页面，并且直接跳到这些页面底部提取安装桌面环境的命令。

  * [Xfce][15]
  * [GNOME][16]
  * [KDE Plasma][17]
  * [Cinnamon][8]
  * [LXQt][18]

举个例子，如果你想要安装 GNOME 桌面基本套件，你可以简单的运行以下命令来安装。

```
sudo pacman -S --needed gnome gnome-tweaks nautilus-sendto gnome-nettool gnome-usage gnome multi-writer adwaita-icon-theme chrome-gnome-shell xdg-user-dirs-gtk fwupd arc-gtk-theme seahosrse gdm firefox gedit
```

```
systemctl enable gdm
```

```
systemctl enable NetworkManager
```

一旦你完成了以上这些，键入 `reboot` 重启。

恭喜你。你已经使用这个指南通过厉害的 `archinstall` 脚本安装完成了 Arch Linux。

### 结语

我相信，这是由该团队开发的令人印象深刻的脚本之一。并且确实增加了使用 Arch Linux 的用户基数和覆盖范围。

使用这个脚本有什么问题吗？在下方评论让我知道。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/01/archinstall-guide/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://github.com/archlinux/archinstall
[2]: https://archlinux.org/download/
[3]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[4]: https://www.debugpoint.com/2020/11/connect-wifi-terminal-linux/
[5]: https://www.debugpoint.com/wp-content/uploads/2022/01/image.png
[6]: https://www.debugpoint.com/wp-content/uploads/2022/01/Keyboard-Type-archinstall.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/01/Keyboard-Language-archinstall.jpg
[8]: https://www.debugpoint.com/2021/02/cinnamon-arch-linux-install/
[9]: https://www.debugpoint.com/wp-content/uploads/2022/01/Choose-Block-Device-1.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/01/Choose-Block-Device-2.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/01/Select-partition-option-archinstall.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/01/Various-options-in-archinstall-1.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/01/Various-options-in-archinstall-2.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2022/01/archinstall-starts-downloading-packages.jpg
[15]: https://www.debugpoint.com/2020/12/xfce-arch-linux-install-4-16/
[16]: https://www.debugpoint.com/2020/12/gnome-arch-linux-install/
[17]: https://www.debugpoint.com/2021/01/kde-plasma-arch-linux-install/
[18]: https://www.debugpoint.com/2020/12/lxqt-arch-linux-install/
[19]: https://t.me/debugpoint
[20]: https://twitter.com/DebugPoint
[21]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[22]: https://facebook.com/DebugPoint
