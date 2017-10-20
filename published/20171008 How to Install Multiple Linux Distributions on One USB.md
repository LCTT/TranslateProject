如何在一个 U 盘上安装多个 Linux 发行版
============================================================

> 概要：本教程介绍如何在一个 U 盘上安装多个 Linux 发行版。这样，你可以在单个 U 盘上享受多个<ruby>现场版<rt>live</rt></ruby> Linux 发行版了。

我喜欢通过 U 盘尝试不同的 Linux 发行版。它让我可以在真实的硬件上测试操作系统，而不是虚拟化的环境中。此外，我可以将 USB 插入任何系统（比如 Windows 系统），做任何我想要的事情，以及享受相同的 Linux 体验。而且，如果我的系统出现问题，我可以使用 U 盘恢复！

创建单个[可启动的现场版 Linux USB][8] 很简单，你只需下载一个 ISO 文件并将其刻录到 U 盘。但是，如果你想尝试多个 Linux 发行版呢？你可以使用多个 U 盘，也可以覆盖同一个 U 盘以尝试其他 Linux 发行版。但这两种方法都不是很方便。

那么，有没有在单个 U 盘上安装多个 Linux 发行版的方式呢？我们将在本教程中看到如何做到这一点。

### 如何创建有多个 Linux 发行版的可启动 USB

![How to install multiple linux distributions on a single USB](https://itsfoss.com/wp-content/uploads/2017/10/multiple-linux-on-one-usb-800x450.jpg)

我们有一个工具正好可以做到_在单个 U 盘上保留多个 Linux 发行版_。你所需要做的只是选择要安装的发行版。在本教程中，我们将介绍_如何在 U 盘中安装多个 Linux 发行版_用于<ruby>现场会话<rt>live session</rt></ruby>。

要确保你有一个足够大的 U 盘，以便在它上面安装多个 Linux 发行版，一个 8 GB 的 U 盘应该足够用于三四个 Linux 发行版。

#### 步骤 1

[MultiBootUSB][9] 是一个自由、开源的跨平台应用程序，允许你创建具有多个 Linux 发行版的 U 盘。它还支持在任何时候卸载任何发行版，以便你回收驱动器上的空间用于另一个发行版。

下载 .deb 包并双击安装。

[下载 MultiBootUSB][10]

#### 步骤 2

推荐的文件系统是 FAT32，因此在创建多引导 U 盘之前，请确保格式化 U 盘。

#### 步骤 3

下载要安装的 Linux 发行版的 ISO 镜像。

#### 步骤 4

完成这些后，启动 MultiBootUSB。

![MultiBootUSB](https://itsfoss.com/wp-content/uploads/2017/09/1.png)

主屏幕要求你选择 U 盘和你打算放到 U 盘上的 Linux 发行版镜像文件。

MultiBootUSB 支持 Ubuntu、Fedora 和 Debian 发行版的持久化，这意味着对 Linux 发行版的现场版本所做的更改将保存到 USB 上。

你可以通过拖动 MultiBootUSB 选项卡下的滑块来选择持久化大小。持久化为你提供了在运行时将更改保存到 U 盘的选项。

![MultiBootUSB persistence storage](https://itsfoss.com/wp-content/uploads/2017/09/2-1.png)

#### 步骤 5

单击“安装发行版”选项并继续安装。在显示成功的安装消息之前，需要一些时间才能完成。

你现在可以在已安装部分中看到发行版了。对于另外的操作系统，重复该过程。这是我安装 Ubuntu 16.10 和 Fedora 24 后的样子。

![MultiBootSystem with Ubuntu and Fedora](https://itsfoss.com/wp-content/uploads/2017/09/3.png)

#### 步骤 6

下次通过 USB 启动时，我可以选择任何一个发行版。

![Boot Menu](https://itsfoss.com/wp-content/uploads/2017/09/VirtualBox_Ubuntu1610_23_09_2017_14_16_05-1.png)

只要你的 U 盘允许，你可以添加任意数量的发行版。要删除发行版，请从列表中选择它，然后单击卸载发行版。

### 最后的话

MultiBootUSB 真的很便于在 U 盘上安装多个 Linux 发行版。只需点击几下，我就有两个我最喜欢的操作系统的工作盘了，我可以在任何系统上启动它们。

如果你在安装或使用 MultiBootUSB 时遇到任何问题，请在评论中告诉我们。

--------------------------------------------------------------------------------

via: https://itsfoss.com/multiple-linux-one-usb/

作者：[Ambarish Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1]:https://itsfoss.com/author/ambarish/
[2]:https://itsfoss.com/multiple-linux-one-usb/#comments
[3]:https://www.facebook.com/share.php?u=https%3A%2F%2Fitsfoss.com%2Fmultiple-linux-one-usb%2F%3Futm_source%3Dfacebook%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[4]:https://twitter.com/share?original_referer=/&text=How+to+Install+Multiple+Linux+Distributions+on+One+USB&url=https://itsfoss.com/multiple-linux-one-usb/%3Futm_source%3Dtwitter%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare&via=itsfoss2
[5]:https://plus.google.com/share?url=https%3A%2F%2Fitsfoss.com%2Fmultiple-linux-one-usb%2F%3Futm_source%3DgooglePlus%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[6]:https://www.linkedin.com/cws/share?url=https%3A%2F%2Fitsfoss.com%2Fmultiple-linux-one-usb%2F%3Futm_source%3DlinkedIn%26utm_medium%3Dsocial%26utm_campaign%3DSocialWarfare
[7]:https://www.reddit.com/submit?url=https://itsfoss.com/multiple-linux-one-usb/&title=How+to+Install+Multiple+Linux+Distributions+on+One+USB
[8]:https://itsfoss.com/create-live-usb-of-ubuntu-in-windows/
[9]:http://multibootusb.org/
[10]:https://github.com/mbusb/multibootusb/releases/download/v8.8.0/python3-multibootusb_8.8.0-1_all.deb
