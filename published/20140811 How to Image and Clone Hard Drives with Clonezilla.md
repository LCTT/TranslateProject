使用Clonezilla对硬盘进行镜像和克隆
================================================================================

Clonezilla是一个用于Linux，Free-Net-OpenBSD，Mac OS X，Windows以及Minix的分区和磁盘克隆程序。它支持所有主要的文件系统，包括EXT，NTFS，FAT，XFS，JFS和Btrfs，LVM2，以及VMWare的企业集群文件系统VMFS3和VMFS5。Clonezilla支持32位和64位系统，同时支持旧版BIOS和UEFI BIOS，并且同时支持MBR和GPT分区表。它是一个用于完整备份Windows系统和所有安装于上的应用软件的好工具，而我喜欢用它来为Linux测试系统做备份，以便我可以在其上做疯狂的实验搞坏后，可以快速恢复它们。

Clonezilla也可以使用dd命令来备份不支持的文件系统，该命令可以复制块而非文件，因而不必在意文件系统。简单点说，就是Clonezilla可以复制任何东西。（关于块的快速说明：磁盘扇区是磁盘上最小的可编址存储单元，而块是由单个或者多个扇区组成的逻辑数据结构。）

Clonezilla分为两个版本：Clonezilla Live和Clonezilla Server Edition（SE）。Clonezilla Live对于将单个计算机克隆到本地存储设备或者网络共享来说是一流的。而Clonezilla SE则适合更大的部署，用于一次性快速多点克隆整个网络中的PC。Clonezilla SE是一个神奇的软件，我们将在今后讨论。今天，我们将创建一个Clonezilla Live USB存储棒，克隆某个系统，然后恢复它。

### Clonezilla和Tuxboot ###

当你访问下载页时，你会看到[稳定版和可选稳定发行版][1]。也有测试版本，如果你有兴趣帮助改善Clonezilla，那么我推荐你使用此版本。稳定版基于Debian，不含有非自由软件。可选稳定版基于Ubuntu，包含有一些非自由固件，并支持UEFI安全启动。

在你[下载Clonezilla][2]后，请安装[Tuxboot][3]来复制Clonezilla到USB存储棒。Tuxboot是一个Unetbootin的修改版，它支持Clonezilla；你不能使用Unetbootin，因为它无法配合工作。安装Tuxboot有点让人头痛，然而Ubuntu用户通过个人包归档包（PPA）方便地安装：

    $ sudo apt-add-repository ppa:thomas.tsai/ubuntu-tuxboot
    $ sudo apt-get update
    $ sudo apt-get install tuxboot

如果你没有运行Ubuntu，并且你的发行版不包含打包好的Tuxboot版本，那么请[下载源代码tarball][4]，并遵循README.txt文件中的说明来编译并安装。

<center>![Figure 1: Creating a partition on the USB stick for Clonezilla.](http://www.linux.com/images/stories/41373/fig-1-gparted.jpeg)</center>

<center>*图1： 在USB存储棒上为Clonezilla创建分区*</center>


安装完Tuxboot后，就可以使用它来创建你精巧的可直接启动的Clonezilla USB存储棒了。首先，创建一个最小200MB的FAT 32分区；图1（上图）展示了使用GParted来进行分区。我喜欢使用类似“Clonezilla”这样的标签，这会让我知道它是个什么东西。该例子中展示了将一个2GB的存储棒格式化成一个单个分区。

然后，启动Tuxboot（图2）。选中“预下载的（Pre-downloaded）”然后点击带省略号的按钮来选择Clonezilla文件。它会自动发现你的USB存储棒，而你需要选中分区号来确保它找到的是正确的那个，我的例子中是/dev/sdd1。点击确定，然后当它完成后点击退出。它会问你是否要重启动，不要担心，现在不用重启。现在你有一个精巧的便携式Clonezilla USB存储棒了，你可以随时随地使用它了。

<center>![Figure 2: Fire up Tuxboot.](http://www.linux.com/images/stories/41373/fig-2-tuxboot.jpeg)</center>

<center>*图2： 启动Tuxboot*</center>

### 创建磁盘镜像 ###

在你想要备份的计算机上启动Clonezilla USB存储棒，第一个映入你眼帘的是常规的启动菜单。启动到默认条目。你会被问及使用何种语言和键盘，而当你到达启动Clonezilla菜单时，请选择启动Clonezilla。在下一级菜单中选择设备镜像，然后进入下一屏。

这一屏有点让人摸不着头脑，里头有什么local_dev，ssh_server，samba_server，以及nfs_server之类的选项。这里就是要你选择将备份的镜像拷贝到哪里，目标分区或者驱动器必须和你要拷贝的卷要一样大，甚至更大。如果你选择local_dev，那么你需要一个足够大的本地分区来存储你的镜像。附加的USB硬盘驱动器是一个不错的，快速而又简单的选项。如果你选择任何服务器选项，你需要能连接到服务器，并提供IP地址并登录上去。我将使用一个本地分区，这就是说要选择local_dev。

当你选择local_dev时，Clonezilla会扫描所有连接到本地的存储折本，包括硬盘和USB存储设备。然后，它会列出所有分区。选择你想要存储镜像的分区，然后它会问你使用哪个目录并列出目录。选择你所需要的目录，然后进入下一屏，它会显示所有的挂载以及已使用/可用的空间。按回车进入下一屏，请选择初学者还是专家模式。我选择初学者模式。

在下一屏中，你可以选择存盘，就是选择创建整个硬盘的镜像，还是创建分区镜像，创建分区镜像允许你选择单个分区。我想要选择分区。

下一屏中，它会问你新建镜像的名称。在接受默认名称，或者输入你自己的名称后，进入下一屏。Clonezilla会扫描你所有的分区并创建一个检查列表，你可以从中选择你想要拷贝的。选择完后，在下一屏中会让你选择是否进行文件系统检查并修复。我才没这耐心，所以直接跳过了。

下一屏中，会问你是否想要Clonezilla检查你新创建的镜像，以确保它是可恢复的。选“是”吧，确保万无一失。接下来，它会给你一个命令行提示，如果你想用命令行而非GUI，那么你必须再次按回车。你需要再次确认，并输入y来确认制作拷贝。

在Clonezilla创建新镜像的时候，你可以好好欣赏一下这个友好的红、白、蓝三色的进度屏（图3）。

<center>![Figure 3: Watch the creation of your new image.](http://www.linux.com/images/stories/41373/fig-3-export.jpeg)</center>

<center>*图3： 守候创建新镜像*</center>

全部完成后，按回车然后选择重启，记得拔下你的Clonezilla USB存储棒。正常启动计算机，然后去看看你新创建的Clonezilla镜像吧。你应该看到像下面这样的东西：

    $ ls -l /2014-08-07-11-img/
    total 1241448
    -rw-r--r-- 1 root root       1223 Aug  7 04:22 blkdev.list
    -rw-r--r-- 1 root root        636 Aug  7 04:22 blkid.list
    -rw-r--r-- 1 root root       3658 Aug  7 04:24 clonezilla-img
    -rw-r--r-- 1 root root      12379 Aug  7 04:24 Info-dmi.txt
    -rw-r--r-- 1 root root      22685 Aug  7 04:24 Info-lshw.txt
    -rw-r--r-- 1 root root       3652 Aug  7 04:24 Info-lspci.txt
    -rw-r--r-- 1 root root        171 Aug  7 04:24 Info-packages.txt
    -rw-r--r-- 1 root root         86 Aug  7 04:24 Info-saved-by-cmd.txt
    -rw-r--r-- 1 root root          5 Aug  7 04:24 parts
    -rw------- 1 root root 1270096769 Aug  7 04:24 sda6.ext4-ptcl-img.gz.aa
    -rw-r--r-- 1 root root         37 Aug  7 04:22 sda-chs.sf
    -rw-r--r-- 1 root root    1048064 Aug  7 04:22 sda-hidden-data-after-mbr
    -rw-r--r-- 1 root root        512 Aug  7 04:22 sda-mbr
    -rw-r--r-- 1 root root        750 Aug  7 04:22 sda-pt.parted
    -rw-r--r-- 1 root root        625 Aug  7 04:22 sda-pt.parted.compact
    -rw-r--r-- 1 root root        514 Aug  7 04:22 sda-pt.sf

### 恢复Clonezilla镜像 ###

恢复镜像和创建镜像类似。再次使用Clonezilla启动，经过同样的初始化步骤后，选择dev_image，然后在local_dev屏，选择你要恢复的镜像所在的位置，它要么在本地设备上，要么在网络共享上。然后继续下面的操作，确保你的恢复镜像正确，并选择了正确的位置。

你可以在[Clonezilla Live文档页][5]获得更多Clonezilla的神奇力量。

--------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/783416-how-to-image-and-clone-hard-drives-with-clonezilla

作者：[Carla Schroder][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linux.com/community/forums/person/3734
[1]:http://www.linux.com/learn/tutorials/783416-how-to-image-and-clone-hard-drives-with-clonezilla#57_why_ubuntu_based_clonezilla_live.faq
[2]:http://clonezilla.org/downloads.php
[3]:http://tuxboot.sourceforge.net/
[4]:http://sourceforge.net/projects/tuxboot/files/
[5]:http://clonezilla.org/clonezilla-live-doc.php
