什么是逻辑分区管理 LVM ，如何在Ubuntu中使用？
================================================================================

> 逻辑分区管理（LVM）是每一个主流Linux发行版都含有的磁盘管理选项。无论是你需要设置存储池，还是只想动态创建分区，那么LVM就是你正在寻找的。

### 什么是 LVM? ###

逻辑分区管理是一个存在于磁盘/分区和操作系统之间的一个抽象层。在传统的磁盘管理中，你的操作系统寻找有哪些磁盘可用（/dev/sda、/dev/sdb等等），并且这些磁盘有哪些可用的分区（如/dev/sda1、/dev/sda2等等）。

在LVM下，磁盘和分区可以抽象成一个含有多个磁盘和分区的设备。你的操作系统将不会知道这些区别，因为LVM只会给操作系统展示你设置的卷组（磁盘）和逻辑卷（分区）

因为卷组和逻辑卷并不物理地对应到影片，因此可以很容易地动态调整和创建新的磁盘和分区。除此之外，LVM带来了你的文件系统所不具备的功能。比如，ext3不支持实时快照，但是如果你正在使用LVM你可以不卸载磁盘的情况下做一个逻辑卷的快照。

### 你什么时候该使用LVM？ ###

在使用LVM之前首先得考虑的一件事是你要用你的磁盘和分区来做什么。注意，一些发行版如Fedora已经默认安装了LVM。

如果你使用的是一台只有一块磁盘的Ubuntu笔记本电脑，并且你不需要像实时快照这样的扩展功能，那么你或许不需要LVM。如果你想要轻松地扩展或者想要将多块磁盘组成一个存储池，那么LVM或许正是你所寻找的。

### 在Ubuntu中设置LVM ###

使用LVM首先要了解的一件事是，没有一个简单的方法可以将已有的传统分区转换成逻辑卷。可以将数据移到一个使用LVM的新分区下，但是这并不会在本篇中提到；在这里，我们将全新安装一台Ubuntu 10.10来设置LVM。（LCTT 译注：本文针对的是较老的版本，新的版本已经不需如此麻烦了）

要使用LVM安装Ubuntu你需要使用另外的安装CD。从下面的链接中下载并烧录到CD中或者[使用unetbootin创建一个USB盘][1]。

![](http://cdn3.howtogeek.com/wp-content/uploads/2010/12/download-web.png)

从安装盘启动你的电脑，并在磁盘选择界面选择整个磁盘并设置LVM。

*注意：这会格式化你的整个磁盘，因此如果正在尝试双启动或者其他的安装选择，选择手动。*

![](http://cdn3.howtogeek.com/wp-content/uploads/2010/12/setup-1.png)

选择你想用的主磁盘，最典型的是使用你最大的磁盘，接着进入下一步。

![](http://cdn3.howtogeek.com/wp-content/uploads/2010/12/setup-2.png)

你马上会将改变写入磁盘所以确保此时你选择的是正确的磁盘接着才写入设置。

![](http://cdn3.howtogeek.com/wp-content/uploads/2010/12/setup-3.png)

选择第一个逻辑卷的大小并继续。

![](http://cdn3.howtogeek.com/wp-content/uploads/2011/01/setup-4.png)

确认你的磁盘分区并继续安装。

![](http://cdn3.howtogeek.com/wp-content/uploads/2011/01/setup-5.png)

最后一步将GRUB的bootloader写到磁盘中。重点注意的是GRUB不能作为一个LVM分区因为计算机BIOS不能直接从逻辑卷中读取数据。Ubuntu将自动创建一个255MB的ext2分区用于bootloder。

![](http://cdn3.howtogeek.com/wp-content/uploads/2011/01/setup-6.png)

安装完成之后。重启电脑并如往常一样进入Ubuntu。使用这种方式安装之后应该就感受不到LVM和传统磁盘管理之间的区别了。

![](http://cdn3.howtogeek.com/wp-content/uploads/2011/01/disk-manager.png)

要使用LVM的全部功能，静待我们的下篇关于管理LVM的文章。

--------------------------------------------------------------------------------

via: http://www.howtogeek.com/howto/36568/what-is-logical-volume-management-and-how-do-you-enable-it-in-ubuntu/

作者：[How-To Geek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://plus.google.com/+howtogeek?prsrc=5
[1]:http://www.howtogeek.com/howto/13379/create-a-bootable-ubuntu-9.10-usb-flash-drive/
