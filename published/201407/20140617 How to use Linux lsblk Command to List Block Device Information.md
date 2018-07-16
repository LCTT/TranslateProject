使用Linux的lsblk命令列出块设备信息
================================================================================
**lsblk**（列出块设备）命令用于列出所有可用块设备的信息，但是，它**不会列出RAM盘的信息**。块设备有硬盘，闪存盘，CD-ROM等等。

### 如何安装lsblk ###

lsblk命令包含在util-linux-ng包中，现在该包改名为util-linux。这个包带了几个其它工具，如dmesg。要安装lsblk，请在[此处][1]下载util-linux包。

### Fedora中安装lsblk ###

Fedora用户可以通过以下方法来安装该包：

    $ sudo yum install util-linux-ng

该命令有几个选项：

### 默认选项 ###

lsblk命令默认情况下将以树状列出所有块设备。打开终端，并输入以下命令：

    $ lsblk

输出如下：

![lsblk default](http://linoxide.com/wp-content/uploads/2014/03/lsblk-default.jpg)

7个栏目名称如下：

**NAME** : 这是块设备名。

**MAJ:MIN** : 本栏显示主要和次要设备号。

**RM** : 本栏显示设备是否可移动设备。注意，在本例中设备sdb和sr0的RM值等于1，这说明他们是可移动设备。

**SIZE** : 本栏列出设备的容量大小信息。例如298.1G表明该设备大小为298.1GB，而1K表明该设备大小为1KB。

**RO** : 该项表明设备是否为只读。在本案例中，所有设备的RO值为0，表明他们不是只读的。

**TYPE** :本栏显示块设备是否是磁盘或磁盘上的一个分区。在本例中，sda和sdb是磁盘，而sr0是只读存储（rom）。（LCTT译注，此处sr0的RO项没有标记为1，可能存在一些错误？）

**MOUNTPOINT** : 本栏指出设备挂载的挂载点。

### 列出所有设备 ###

默认选项不会列出所有空设备。要查看这些空设备，请使用以下命令：

    $ lsblk -a

该选项将列出所有设备，包括空设备在内。

![lsblk bytes sda](http://linoxide.com/wp-content/uploads/2014/03/lsblk-bytes-sda.png)

### 列出设备权限和属主 ###

lsblk命令也可以用于列出一个特定设备的拥有关系，同时也可以列出组和模式。可以通过以下命令来获取这些信息：

    $ lsblk -m

![lsblk  permissions](http://linoxide.com/wp-content/uploads/2014/03/lsblk-permissions.png)

### 列出指定设备 ###

该命令也可以只获取指定设备的信息。这可以通过在提供给lsblk命令的选项后指定设备名来实现。例如，你可能对了解以字节显示你的磁盘驱动器大小比较感兴趣，那么你可以通过运行以下命令来实现：

    $ lsblk -b /dev/sda

或者，以下命令等同：

    $ lsblk --bytes /dev/sda

### 以列表形式列出不带头的设备 ###

你也可以组合几个选项来获取指定的输出。例如，你也许想要以列表格式列出设备，而不是默认的树状格式。你可能也对移除不同栏目名称的标题感兴趣。可以将两个不同的选项组合，以获得期望的输出，命令如下：

    $ lsblk -nl

或者，你可以使用下面的长选项，它们也能给出相同的输出。

    $ lsblk --noheadings --list

![lsblk no header and list](http://linoxide.com/wp-content/uploads/2014/03/lsblk-no-header-and-list.png)

### 列出SCSI设备 ###

要获取SCSI设备的列表，你只能使用-S选项。该选项是大写字母S，不能和-s选项混淆，该选项是用来以颠倒的顺序打印依赖的。

    $ lsblk -S
    
![](http://linoxide.com/wp-content/uploads/2014/03/lsblk-SCSI-devices.png)

lsblk列出SCSI设备，而-s是逆序选项（LCTT译注：将设备和分区的组织关系逆转过来显示），其将给出如下输出。输入命令：

    $ lsblk -s

或者

    $ lsblk --inverse
   
![](http://linoxide.com/wp-content/uploads/2014/03/lsblk-inverse.png)

你可以使用lsblk来获取关于你的块设备的更多信息，自己把它试着显示出来吧！

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-lsblk-command/

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:ftp://ftp.kernel.org/pub/linux/utils/util-linux/
