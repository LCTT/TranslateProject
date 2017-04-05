Linux 中 7 个判断文件系统类型的方法
============================================================

文件通过文件系统在磁盘及分区上命名、存储、检索以及更新，文件系统是在磁盘上组织文件的方式。

文件系统分为两个部分：用户数据和元数据（文件名、创建时间、修改时间、大小以及目录层次结构中的位置等）。

在本指南中，我们将用 7 种方法来识别你的 Linux 文件系统类型，如 Ext2、Ext3、Ext4、BtrFS、GlusterFS 等等。

### 1、 使用 df 命令

`df` 命令报告文件系统磁盘空间利用率，要显示特定的磁盘分区的文件系统类型，像下面那样使用 `-T` 标志：

```
$ df -Th
或者
$ df -Th | grep "^/dev"
```

[
 ![df Command - Find Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/Find-Filesystem-Type-Using-df-Command.png) 
][3]

*df 命令 – 找出文件系统类型*

要更好理解 `df` 命令，阅读下面的文章：

1.  [12 个有用的 df 命令来检查 Linux 中的磁盘空间][1]
2.  [Pydf - 一个替代 df 的命令，用颜色显示磁盘使用率][2]

### 2、 使用 fsck 命令

`fsck` 用来检查以及[修复 Linux 文件系统][4]，它也可以输出[指定磁盘分区的文件系统类型][5]。

`-N` 标志禁用检查文件系统错误，它只是显示会做什么（但是我们只需要文件系统类型）：

```
$ fsck -N /dev/sda3
$ fsck -N /dev/sdb1
```

[
 ![fsck - Print Linux Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/fsck-Print-Linux-Filesystem-Type.png) 
][6]

*fsck – 打印 Linux 文件系统类型*

### 3、 使用 lsblk 命令

`lsblk` 会显示块设备，当使用 `-f` 选项时，它也会打印分区的文件系统类型：

```
$ lsblk -f
```

[
 ![lsblk - Shows Linux Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/lsblk-Shows-Linux-Filesystem-Type.png) 
][7]

*lsblk – 显示 Linux 文件系统类型*

### 4、 使用 mount 命令

`mount` 命令用来[在 Linux 中挂载文件系统][8]，它也可以用来[挂载一个 ISO 镜像][9]，[挂载远程 Linux 文件系统][10]等等。

当不带任何参数运行时，它会打印包含文件系统类型在内的[磁盘分区的信息][11]：

```
$ mount | grep "^/dev"
```

[
 ![Mount - Show Filesystem Type in Linux](http://www.tecmint.com/wp-content/uploads/2017/03/Mount-Show-Filesystem-Type.png) 
][12]

*Mount – 在 Linux 中显示文件系统类型*

### 5、 使用 blkid 命令

`blkid` 命令用来[找出或打印块设备属性][13]，只要将磁盘分区作为参数就行了：

```
$ blkid /dev/sda3
```

[
 ![blkid - Find Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/blkid-Find-Filesystem-Type.png) 
][14]

*blkid – 找出文件系统类型*

### 6、 使用 file 命令

`file` 命令会识别文件类型，使用 `-s` 标志启用读取块设备或字符设备，`-L` 启用符号链接跟随：

```
$ sudo file -sL /dev/sda3
```

[
 ![file - Identifies Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/file-command-identifies-filesystem-type.png) 
][15]

*file – 识别文件系统类型*

### 7、 使用 fstab 文件

`/etc/fstab` 是一个静态文件系统信息（比如挂载点、文件系统类型、挂载选项等等）文件：

```
$ cat /etc/fstab
```

[
 ![Fstab - Shows Linux Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/fstab-shows-filesystem-types.png) 
][16]

*fstab – 显示 Linux 文件系统类型*

就是这样了！在这篇指南中，我们用 7 种方法来识别你的 Linux 文件系统类型。你还知道这里没有提到的其他方法么？在评论中与我们分享。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili是一名 Linux 和 F.O.S.S 的爱好者，未来的 Linux 系统管理员、网站开发人员，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并乐于分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/find-linux-filesystem-type/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/how-to-check-disk-space-in-linux/
[2]:http://www.tecmint.com/pyd-command-to-check-disk-usage/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Find-Filesystem-Type-Using-df-Command.png
[4]:http://www.tecmint.com/defragment-linux-system-partitions-and-directories/
[5]:http://www.tecmint.com/manage-file-types-and-set-system-time-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/fsck-Print-Linux-Filesystem-Type.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/lsblk-Shows-Linux-Filesystem-Type.png
[8]:http://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/
[9]:http://www.tecmint.com/extract-files-from-iso-files-linux/
[10]:http://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/
[11]:http://www.tecmint.com/linux-tools-to-monitor-disk-partition-usage/
[12]:http://www.tecmint.com/wp-content/uploads/2017/03/Mount-Show-Filesystem-Type.png
[13]:http://www.tecmint.com/find-usb-device-name-in-linux/
[14]:http://www.tecmint.com/wp-content/uploads/2017/03/blkid-Find-Filesystem-Type.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/03/file-command-identifies-filesystem-type.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/03/fstab-shows-filesystem-types.png
[17]:http://www.tecmint.com/find-linux-filesystem-type/#
[18]:http://www.tecmint.com/find-linux-filesystem-type/#
[19]:http://www.tecmint.com/find-linux-filesystem-type/#
[20]:http://www.tecmint.com/find-linux-filesystem-type/#
[21]:http://www.tecmint.com/find-linux-filesystem-type/#comments
[22]:http://www.tecmint.com/author/aaronkili/
[23]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[24]:http://www.tecmint.com/free-linux-shell-scripting-books/
