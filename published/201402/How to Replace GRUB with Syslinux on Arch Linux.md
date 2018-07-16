在Arch上使用Syslinux替代GRUB
================================================================================

这个教程用于教授Arch Linux用户如何在Arch下安装Syslinux——一个轻量级、快速并且现代感十足的系统引导程序，用来替换掉系统自带的GRUB引导程序。

![](http://i1-news.softpedia-static.com/images/news2/How-to-Replace-GRUB-with-Syslinux-on-Arch-Linux-415394-2.jpg)

实际上，Syslinux不是一个简单的开机启动装载程序，它支持多种启动引导方式，本地载入，通过PXE网络载入，以及通过可移动媒体载入。并且，它还同时支持MBR和GPT磁盘，以及RAID设置。

在开始你实际操作之前，你应该知道Syslinux支持如下文件系统：FAT，EXT2，EXT3，EXT4和Btrfs，而且Syslinux能够运行在支持UEFI或BIOS的机器上。到目前为止，Syslinux还不能访问自己所在的分区之外的文件。

在你替换GRUB启动之前，请认真考虑，这只是一个可选的尝试，这个尝试有可能会给你带来一些麻烦。如果说你只是想感受一下新鲜的事物，或是已经厌倦了GRUB的界面，没问题来尝试尝试Syslinux吧。

###在Arch box 中安装Syslinux ###

该说的都说完了，下面我们来开始安装Syslinux，准备替换掉已有的GRUB或者GRUB2启动程序。打开一个终端，输入如下命令来安装Syslinux

	sudo pacman -S syslinux

安装完成后，你应该注意到一条消息，将指导您如何分别在BIOS或UEFI机器上部署Syslinux引导装载程序。BIOS用户比较幸运，因为他们只需要运行syslinux-install_update 脚本就行了，这个脚本是Matthew Gyurgyik编写的，用来在BIOS机器上成功的部署Syslinux。

###在Arch box上部署Syslinux###

如果你拥有的是一个单独的/boot分区，你要保证你是在/boot分区上执行的这个脚本。在终端中输入如下命令：

	sudo syslinux-install_update -i -a -m

这个脚本会安装必需的文件，并且用启动标记标记分区，同时会安装MBR引导代码。

###配置Syslinux###

这是非常非常重要的一步，任何人都不能忽略它，因为如果你的Syslinux没有正确的配置，你的电脑将不能启动。请再次注意。

目前，Syslinux能通过/boot/syslinux/syslinux.cfg文件进行配置。在[the official Arch Linux page of Syslinux][1] 中查看详细的配置指令。当你配置成功后，重启你的系统然后来看看新的启动引导程序效果如何！

如果你有任何的问题，请毫不犹豫的在评论中提出！

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Replace-GRUB-with-Syslinux-on-Arch-Linux-415394.shtml

译者：[dy2009](https://github.com/dy2009) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://wiki.archlinux.org/index.php/syslinux#Configuration
