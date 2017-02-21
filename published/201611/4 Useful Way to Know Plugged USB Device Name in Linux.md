在 Linux 系统里识别 USB 设备名字的 4 种方法
============================================================

对于初学者来说，在 Linux 系统里你必须掌握的技术之一就是识别出插入系统里的各种设备。这也许是你的系统硬盘、外部的存储设备或者是可移动设备，比如 USB 设备或 SD 闪存卡等。 

现如今，使用 USB 设备来传输文件是十分常见的事，对于那些喜欢使用命令行的新手来说，当你需要格式化 USB 设备时，学会使用不同的方法来识别 USB 设备名是非常重要的。

如果在系统中插入一个设备，尤其是在桌面环境下，比如 USB 设备，它会自动挂载到一个指定目录，一般是在 `/media/username/device-label` 目录下，之后你就可以进入到该目录下访问那些文件了。然而，在服务器上就不是这么回事了，你必须[手动挂载](http://www.tecmint.com/mount-filesystem-in-linux/)这个设备，并且指定一个挂载点。

Linux 系统使用 `/dev` 目录下特定的设备文件来标识插入的设备。你会发现该目录下的某些文件，包括 `/dev/sda` 或者 `/dev/hda` 表示你的第一个主设备，每个分区使用一个数字来表示，比如 `/dev/sda1` 或 `/dev/hda1` 表示主设备的第一个分区等等。

```
$ ls /dev/sda*
```

[ ![List All Linux Device Names](http://www.tecmint.com/wp-content/uploads/2016/10/List-All-Linux-Device-Names.png) 
][3]

*列出 Linux 系统下所有的设备名*

现在让我们来使用下面一些特殊的命令行工具找出设备名：

### 使用 df 命令来找出插入的 USB 设备名

查看插入你系统里的每一个设备及对应的挂载点，你可以使用下图中的 `df` 命令检查 Linux 系统磁盘空间使用情况：

```
$ df -h
```

[![Find USB Device Name Using df Command](http://www.tecmint.com/wp-content/uploads/2016/10/Find-USB-Device-Name.png) 
][5]

*使用 df 命令查找 USB 设备名*

### 使用 lsblk 命令查找 USB 设备名

你也可以使用下面的 `lsblk` 命令（列出块设备）来列出插入你系统里的所有块设备：

```
$ lsblk
```

[
 ![List Linux Block Devices](http://www.tecmint.com/wp-content/uploads/2016/10/List-Linux-Block-Devices.png) 
][7]

*列出 Linux 系统里的块设备*

### 使用 fdisk 工具识别 USB 设备名

[fdisk 是一个功能强大的工具][12]，用于查看你系统中的所有分区表，包括所有的 USB 设备，使用 root 权限执行如下命令：

```
$ sudo fdisk -l
```
[
 ![List Partition Table of Block Devices](http://www.tecmint.com/wp-content/uploads/2016/10/List-Partition-Table.png) 
][9]

*列出块设备的分区表*

### 使用 dmesg 命令来识别出 USB 设备名

`dmesg` 是一个用于打印或者控制内核环形缓冲区（kernel ring buffer）的重要命令。环形缓冲区是一种数据结构，它[存放着内核操作数据的信息][13]。

运行如下命令来查看内核操作信息，它同时也会打印出 USB 设备的信息：

```
$ dmesg
```
[
 ![dmesg - Prints USB Device Name](http://www.tecmint.com/wp-content/uploads/2016/10/dmesg-shows-kernel-information.png) 
][11]

*dmesg – 打印 USB 设备名*

以上就是这篇文章中提及到的所有命令，我们在命令行下使用不同的方法来找出 USB 设备名。你也可以跟大家分享下实现这个目的的其它方法，或者如果你对这篇文章有什么想法也可以在下面跟大家交流下。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/find-usb-device-name-in-linux

作者：[Aaron Kili][a]
译者：[rusking](https://github.com/rusking)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/tag/linux-tricks/
[2]:http://www.tecmint.com/mount-filesystem-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2016/10/List-All-Linux-Device-Names.png
[4]:http://www.tecmint.com/how-to-check-disk-space-in-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2016/10/Find-USB-Device-Name.png
[6]:http://www.tecmint.com/commands-to-collect-system-and-hardware-information-in-linux/
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/List-Linux-Block-Devices.png
[8]:http://www.tecmint.com/fdisk-commands-to-manage-linux-disk-partitions/
[9]:http://www.tecmint.com/wp-content/uploads/2016/10/List-Partition-Table.png
[10]:http://www.tecmint.com/dmesg-commands/
[11]:http://www.tecmint.com/wp-content/uploads/2016/10/dmesg-shows-kernel-information.png
[12]:http://www.tecmint.com/fdisk-commands-to-manage-linux-disk-partitions/
[13]:http://www.tecmint.com/dmesg-commands/
