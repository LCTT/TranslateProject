在独立的 Root 和 Home 硬盘驱动器上安装 Ubuntu
============================================================

![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-feature-image.jpg "How to Install Ubuntu with Separate Root and Home Hard Drivess")

安装 Linux 系统时，可以有两种不同的方式。第一种方式是在一个超快的固态硬盘上进行安装，这样可以保证迅速开机和高速访问数据。第二种方式是在一个较慢但很强大的普通硬盘驱动器上安装，这样的硬盘转速快并且存储容量大，从而可以存储大量的应用程序和数据。

然而，一些 Linux 用户都知道，固态硬盘很棒，但是又很贵，而普通硬盘容量很大但速度较慢。如果我告诉你，可以同时利用两种硬盘来安装 Linux 系统，会怎么样？一个超快、现代化的固态硬盘驱动 Linux 内核，一个容量很大的普通硬盘来存储其他数据。

在这篇文章中，我将阐述如何通过分离 Root 目录和 Home 目录安装 Ubuntu 系统 — Root 目录存于 SSD（固态硬盘）中，Home 目录存于普通硬盘中。

### 没有多余的硬盘驱动器？尝试一下 SD 卡（内存卡）！

![ubuntu-sd-card](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-sd-card.jpg "ubuntu-sd-card")

在多个驱动器上安装 Linux 系统是很不错的，并且每一个高级用户都应该学会这样做。然而，还有一种情况使得用户应该这样安装 Linux 系统 － 在低存储容量的笔记本电脑上安装系统。可能你有一台很便宜、没有花费太多的笔记本电脑，上面安装了 Linux 系统，电脑上没有多余的硬盘驱动，但有一个 SD 卡插槽。

这篇教程也是针对这种类型的电脑的。跟随这篇教程，可以为笔记本电脑买一个高速的 SD 卡来存储 Home 目录，而不是使用另一个硬盘驱动。本教程也适用于这种使用情况。

### 制作 USB 启动盘

首先去[这个网站][11]下载最新的 Ubuntu Linux 版本。然后下载 [Etcher][12]- USB 镜像制作工具。这是一个使用起来很简单的工具，并且支持所有主流的操作系统。你还需要一个至少有 2GB 大小的 USB 驱动器。

![ubuntu-browse-for-ubuntu-iso](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-browse-for-ubuntu-iso.jpg "ubuntu-browse-for-ubuntu-iso")

安装好 Etcher 以后，直接打开。点击 <ruby>选择镜像<rt>Select Image</rt></ruby> 按钮来制作镜像。这将提示用户浏览、寻找 ISO 镜像，找到前面下载的 Ubuntu ISO 文件并选择。然后，插入 USB 驱动器，Etcher 应该会自动选择它。之后，点击 “Flash!” 按钮，Ubuntu 启动盘的制作过程就开始了。 

为了能够启动 Ubuntu 系统，需要配置 BIOS。这是必需的，这样计算机才能启动新创建的 Ubuntu 启动盘。为了进入 BIOS，在插入 USB 的情况下重启电脑，然后按正确的键（Del、F2 或者任何和你的电脑相应的键）。找到从 USB 启动的选项，然后启用这个选项。

如果你的个人电脑不支持 USB 启动，那么把 Ubuntu 镜像刻入 DVD 中。

### 安装

当用启动盘第一次加载 Ubuntu 时，欢迎界面会出现两个选项。请选择 “安装 Ubuntu” 选项。在下一页中，Ubiquity 安装工具会请求用户选择一些选项。这些选项不是强制性的，可以忽略。然而，建议两个选项都勾选，因为这样可以节省安装系统以后的时间，特别是安装 MP3 解码器和更新系统。（LCTT 译注：当然如果你的网速不够快，还是不要勾选的好。）

![ubuntu-preparing-to-install](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-preparing-to-install.jpg "ubuntu-preparing-to-install")

勾选了<ruby>“准备安装 Ubuntu”<rt>Preparing to install Ubuntu</rt></ruby>页面中的两个选项以后，需要选择安装类型了。有许多种安装类型。然而，这个教程需要选择自定义安装类型。为了进入自定义安装页面，勾选<ruby>“其他”<rt>something else</rt></ruby>选项，然后点击“继续”。

现在将显示 Ubuntu 自定义安装分区工具。它将显示任何/所有能够安装 Ubuntu 系统的磁盘。如果两个硬盘均可用，那么它们都会显示。如果插有 SD 卡，那么它也会显示。

选择用于 Root 文件系统的硬盘驱动器。如果上面已经有分区表，编辑器会显示出来，请使用分区工具把它们全部删除。如果驱动没有格式化也没有分区，那么使用鼠标选择驱动器，然后点击<ruby>“新建分区表”<rt>new partition table</rt></ruby>。对所有驱动器执行这个操作，从而使它们都有分区表。（LCTT 译注：警告，如果驱动器上有你需要的数据，请先备份，否则重新分区后将永远丢失。）

 ![ubuntu-create-mount-point](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-create-mount-point.jpg "ubuntu-create-mount-point")

现在所有分区都有了分区表（并已删除分区），可以开始进行配置了。在第一个驱动器下选择空闲空间，然后点击加号按钮来创建新分区。然后将会出现一个“创建分区窗口”。允许工具使用整个硬盘。然后转到<ruby>“挂载点”<rt>Mount Point</rt></ruby>下拉菜单。选择 `/` （Root）作为挂载点，之后点击 OK 按钮确认设置。

对第二个驱动器做相同的事，这次选择 `/home` 作为挂载点。两个驱动都设置好以后，选择要放入引导装载器的驱动器，然后点击 <ruby>“现在安装”<rt>install now</rt></ruby>，安装进程就开始了。

 ![ubuntu-multi-drive-layout](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2017/02/ubuntu-multi-drive-layout.jpg "ubuntu-multi-drive-layout")

从这以后的安装进程是标准安装。创建用户名、选择时区等。

**注：** 你是以 UEFI 模式进行安装吗？如果是，那么需要给 boot 创建一个 512 MB 大小的 FAT32 分区。在创建其他任何分区前做这件事。确保选择 “/boot” 作为这个分区的挂载点。

如果你需要一个交换分区，那么，在创建用于 `/` 的分区前，在第一个驱动器上进行创建。可以通过点击 ‘+’ 按钮，然后输入所需大小，选择下拉菜单中的<ruby>“交换区域”<rt>swap area</rt></ruby>来创建交换分区。

### 结论

Linux 最好的地方就是可以自己按需配置。有多少其他操作系统可以让你把文件系统分割在不同的硬盘驱动上？并不多，这是肯定的。我希望有了这个指南，你将意识到 Ubuntu 能够提供的真正力量。

安装 Ubuntu 系统时你会用多个驱动器吗？请在下面的评论中让我们知道。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/install-ubuntu-with-different-root-home-hard-drives/

作者：[Derrik Diener][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
[1]:https://www.maketecheasier.com/author/derrikdiener/
[2]:https://www.maketecheasier.com/install-ubuntu-with-different-root-home-hard-drives/#respond
[3]:https://www.maketecheasier.com/category/linux-tips/
[4]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-ubuntu-with-different-root-home-hard-drives%2F
[5]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-ubuntu-with-different-root-home-hard-drives%2F&amp;text=How+to+Install+Ubuntu+with+Separate+Root+and+Home+Hard+Drives
[6]:mailto:?subject=How%20to%20Install%20Ubuntu%20with%20Separate%20Root%20and%20Home%20Hard%20Drives&amp;body=https%3A%2F%2Fwww.maketecheasier.com%2Finstall-ubuntu-with-different-root-home-hard-drives%2F
[7]:https://www.maketecheasier.com/byb-dimmable-eye-care-desk-lamp/
[8]:https://www.maketecheasier.com/download-appx-files-from-windows-store/
[9]:https://support.google.com/adsense/troubleshooter/1631343
[10]:http://www.maketecheasier.com/tag/ssd
[11]:http://ubuntu.com/download
[12]:https://etcher.io/
