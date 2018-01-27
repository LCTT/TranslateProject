检查系统和硬件信息的命令
======

你们好，Linux 爱好者们，在这篇文章中，我将讨论一些作为系统管理员重要的事。众所周知，作为一名优秀的系统管理员意味着要了解有关 IT 基础架构的所有信息，并掌握有关服务器的所有信息，无论是硬件还是操作系统。所以下面的命令将帮助你了解所有的硬件和系统信息。

### 1 查看系统信息

```
$ uname -a
```

![uname command][2]

它会为你提供有关系统的所有信息。它会为你提供系统的内核名、主机名、内核版本、内核发布号、硬件名称。

### 2 查看硬件信息

```
$ lshw
```

![lshw command][4]

使用 `lshw` 将在屏幕上显示所有硬件信息。

### 3 查看块设备（硬盘、闪存驱动器）信息

```
$ lsblk
```

![lsblk command][6]

`lsblk` 命令在屏幕上打印关于块设备的所有信息。使用 `lsblk -a` 	可以显示所有块设备。

### 4 查看 CPU 信息

```
$ lscpu
```

![lscpu command][8]

`lscpu` 在屏幕上显示所有 CPU 信息。

### 5 查看 PCI 信息

```
$ lspci
```

![lspci command][10]

所有的网络适配器卡、USB 卡、图形卡都被称为 PCI。要查看他们的信息使用 `lspci`。

`lspci -v` 将提供有关 PCI 卡的详细信息。

`lspci -t` 会以树形格式显示它们。

### 6 查看 USB 信息

```
$ lsusb
```

![lsusb command][12]

要查看有关连接到机器的所有 USB 控制器和设备的信息，我们使用 `lsusb`。

### 7 查看 SCSI 信息

```
$ lsscsi
```

![lsscsi][14]

要查看 SCSI 信息输入 `lsscsi`。`lsscsi -s` 会显示分区的大小。

### 8 查看文件系统信息

```
$ fdisk -l
```

![fdisk command][16]

使用 `fdisk -l` 将显示有关文件系统的信息。虽然 `fdisk` 的主要功能是修改文件系统，但是也可以创建新分区，删除旧分区（详情在我以后的教程中）。

就是这些了，我的  Linux 爱好者们。建议你在**[这里][17]**和**[这里][18]**的文章中查看关于另外的 Linux 命令。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/commands-system-hardware-info/

作者：[Shusain][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[2]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/uname.jpg?resize=664%2C69
[4]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lshw.jpg?resize=641%2C386
[6]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lsblk.jpg?resize=646%2C162
[8]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lscpu.jpg?resize=643%2C216
[10]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lspci.jpg?resize=644%2C238
[12]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lsusb.jpg?resize=645%2C37
[14]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lsscsi.jpg?resize=639%2C110
[16]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/fdisk.jpg?resize=656%2C335
[17]:http://linuxtechlab.com/linux-commands-beginners-part-1/
[18]:http://linuxtechlab.com/linux-commands-beginners-part-2/
