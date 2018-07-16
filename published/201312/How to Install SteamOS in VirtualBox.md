如何在 VirtualBox 中安装 SteamOS
================================================================================
**下面的教程将指导 Linuxer 在 VirtualBox 中全新安装 SteamOS GNU/Linux。**

如你已经了解的那样，SteamOS Linux 已经在12月13日正式发布了。作为一款基于 Debian GNU/Linux 的操作系统，它默认使用了 GNOME 作为桌面环境，当然这是可选的。

如果硬件上没有问题的话，比如你的电脑拥有强大游戏显卡，且支持UEFI的，那么安装 SteamOS 将是一件非常容易的事情，然而，因为 Valve 并没有发布 SteamOS 的 ISO 镜像，在安装过程中可能并不是那么顺利。

下面的教程由两个重要的部分组成，第一部分将会帮助你用 Valve 官方的 SteamOSInstaller.zip 来创建一个 ISO 镜像；如果你不希望在自己的电脑上真正安装，那么第二部分将会告诉你如何在 VirtualBox 中来体验 SteamOS。

在一开始你需要一个已经正确安装的最新的 VirtualBox。当然，你还需要一款叫做[GNUxorriso][2]的软件用来制作 ISO 镜像。

### 第一步，制作 SteamISO 镜像

[从 Softpedia 下载 SteamOSInstaller.zip][3]，将它保存到你的 home 目录下并解压缩。完毕之后你将会看到 SteamOSInstaller 文件夹。现在，从终端里打开它并执行下面的命令（译注：命令较长，请勿敲错）：

	xorriso -as mkisofs -r -checksum_algorithm_iso md5,sha1 -V 'Steam OS' -o ~/SteamOSInstaller.iso -J -joliet-long -cache-inodes -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot --efi-boot boot/grub/efi.img -append_partition 2 0x01 ~/SteamOSInstaller/boot/grub/efi.img -partition_offset 16 ~/SteamOSInstaller

稍等几秒钟之后，SteamOS.iso 文件将会在你的 home 目录下出现，大约有 1GB。好了，这一步就完成了，下面进入第二步。

### 第二步，在 VirtualBox 中安装 SteamOS

如果你已经正确安装了 VirtualBox 并且了解它的正确用法，那么我们下面需要来建立一个拥有 UEFI 支持的全新虚拟机。在 VirtualBox 的主窗口，点击 New 按钮来开始安装吧。

在 Name 框输入 SteamOS，在操作系统类型种选择 Linux，并在下拉框的版本列表中选择 Debain 64-bit，点击 Next 继续。Memory Size 中设置1024或者2048MB（当然，这取决于你的计算机实际内存大小），我们创建一个 VDI 格式的虚拟硬盘驱动器，将大小固定为15GB。点击 Continue 来继续，并等待创建过程结束。

![Create a new virtual machine](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-3.png)

*创建一个新的虚拟机*

![Set the memory size](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-4.png)

*设置内存大小*

现在我们的虚拟机已经创建完毕了，接下来让我们来为 SteamOS 做一些小小的调整。来到 Settings 选项，点击边栏的 System，然后在 Boot Order 中取消选择 "Floppy"，并检查确认已经选择 "Enable EFI (special OSes only)" 选项。

![Enable EFI and remove Floppy](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-5.png)

*允许 EFI 并移除 Floppy*

接下来，点击边栏中的 Display 按钮，将 Video Memory 设置为128MB，并勾上 "Enable 3D Acceleration" 选项。然后，进入边栏的 Storage 部分，点击 "Controller: IDE" 下面的 "Empty"，并点击 CD/DVD 驱动下拉栏旁边小 CD 图标来添加上一步制作的 SteamOSInstall.iso 镜像文件。当一切完成之后，点击 OK。

![Set Video Memory size and 3D acceleration](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-6.png)

*设置 Video Memory 大小 和 3D 加速*

那么现在，让我们按下主窗口中的 "Start" 按钮来启动虚拟机。你将会立即看到 SteamOS 启动画面。只需要高亮 "Automated install (WILL ERASE DISK)" 后按下 Enter 键即可。接下来可以稍微休息一下，直到我们的安装结束。整个安装过程可能需要一段时间，当然这取决于你的电脑。

![Prepare to install SteamOS](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-7.png)

*准备安装 SteamOS*

只要我们的安装过程结束，你就可以关闭虚拟机，然后从 Storage 中移除 ISO 镜像，然后启动进入全新的 SteamOS。但是，在我们正式进入 SteamOS 的世界之前，还需要安装 VirtualBox Guest Additions。先点击开始 SteamOS 虚拟机，选择 GRUB 启动器中的第二个选项（恢复模式），然后在 SteamOS 的命令行提示后输入下面的命令：

![SteamOS boot loader](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-9.png)

    dpkg --get-selections | grep nvidia
    apt-get purge <name of the packages outputted by the above command>
    rm /usr/share/X11/xorg.conf.d/55-nvidia.conf
    dpkg-reconfigure xserver-xorg

进入到 Devices 中然后点击 Insert Guest Additions CD 镜像。根据提示来下载 Guest Additions 镜像，挂载它并执行下面的命令：

       sh /media/cdrom/VBoxLinuxAdditions.run

等待 Guest Additions 安装完驱动，用下面的命令来重启我们的虚拟机：

       shutdown now -r

![SteamOS command-line shell prompt](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-10.png)

*SteamOS 命令行提示*

接下来我们的虚拟机会重启，让它启动进入 SteamOS。当我们抵达登录提示界面之后，使用 desktop/desktop 或者 steam/steam 作为用户名和密码来登录。

如果您在安装过程中遇到了一些问题，请别犹豫，在下面评论中告诉我们。

![SteamOS with GNOME 3](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-11.png)

*SteamOS 和 GNOME 3*

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Install-SteamOS-in-VirtualBox-409363.shtml

译者：[pandachow](https://github.com/ailurus1991) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://news.softpedia.com/news/Download-SteamOS-1-0-Based-on-Debian-Linux-409214.shtml
[2]:http://linux.softpedia.com/get/Programming/Libraries/GNU-xorriso-36759.shtml
[3]:http://linux.softpedia.com/get/System/Operating-Systems/Linux-Distributions/SteamOS-103040.shtml
