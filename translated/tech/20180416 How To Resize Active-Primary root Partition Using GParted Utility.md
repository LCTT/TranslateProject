如何使用 GParted 实用工具缩放根分区
======

今天，我们将讨论磁盘分区。这是 Linux 中的一个好话题。这允许用户来重新调整在 Linux 中的活动 root 分区。

在这篇文章中，我们将教你如何使用 GParted 缩放在 Linux 上的活动根分区。

比如说，当我们安装 Ubuntu 操作系统时，并没有恰当地配置，我们的系统仅有 30 GB 磁盘。我们需要安装另一个操作系统，因此我们想在其中制作第二个分区。

虽然不建议重新调整活动分区。然而，我们要执行这个操作，因为没有其它方法来释放系统分区。

> 注意：在执行这个动作前，确保你备份了重要的数据，因为如果一些东西出错（例如，电源故障或你的系统重启)，你可以得以保留你的数据。

### Gparted 是什么

[GParted][1] 是一个自由的分区管理器，它使你能够缩放、复制和移动分区，而不丢失数据。通过使用 GParted 的 Live 可启动镜像，我们可以使用 GParted 应用程序的所有功能。GParted Live 可以使你能够在 GNU/Linux 以及其它的操作系统上使用 GParted，例如，Windows 或 Mac OS X 。

#### 1) 使用 df 命令检查磁盘空间利用率

我只是想使用 `df` 命令向你显示我的分区。`df` 命令输出清楚地表明我仅有一个分区。

```
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        30G  3.4G 26.2G  16% /
none            4.0K     0  4.0K   0% /sys/fs/cgroup
udev            487M  4.0K  487M   1% /dev
tmpfs           100M  844K   99M   1% /run
none            5.0M     0  5.0M   0% /run/lock
none            498M  152K  497M   1% /run/shm
none            100M   52K  100M   1% /run/user
```

#### 2) 使用 fdisk 命令检查磁盘分区

我将使用 `fdisk` 命令验证这一点。

```
$ sudo fdisk -l
[sudo] password for daygeek:

Disk /dev/sda: 33.1 GB, 33129218048 bytes
255 heads, 63 sectors/track, 4027 cylinders, total 64705504 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x000473a3

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048    62609407    31303680   83  Linux
/dev/sda2        62611454    64704511     1046529    5  Extended
/dev/sda5        62611456    64704511     1046528   82  Linux swap / Solaris
```

#### 3) 下载 GParted live ISO 镜像

使用下面的命令来执行下载 GParted live ISO。

```
$ wget https://downloads.sourceforge.net/gparted/gparted-live-0.31.0-1-amd64.iso
```

#### 4) 使用 GParted Live 安装介质启动你的系统

使用 GParted Live 安装介质（如烧录的 CD/DVD 或 USB 或 ISO 镜像）启动你的系统。你将获得类似于下面屏幕的输出。在这里选择 “GParted Live (Default settings)” ，并敲击回车按键。

![][3]

#### 5) 键盘选择

默认情况下，它选择第二个选项，按下回车即可。

![][4]

#### 6) 语言选择

默认情况下，它选择 “33” 美国英语，按下回车即可。

![][5]

#### 7) 模式选择（图形用户界面或命令行)

默认情况下，它选择 “0” 图形用户界面模式，按下回车即可。

![][6]

#### 8) 加载 GParted Live 屏幕

现在，GParted Live 屏幕已经加载，它显示我以前创建的分区列表。

![][7]

#### 9) 如何重新调整根分区大小

选择你想重新调整大小的根分区，在这里仅有一个分区，所以我将编辑这个分区以便于安装另一个操作系统。

![][8]

为做到这一点，按下 “Resize/Move” 按钮来重新调整分区大小。

![][9]

现在，在第一个框中输入你想从这个分区中取出的大小。我将索要 “10GB”，所以，我添加 “10240MB”，并让该对话框的其余部分为默认值，然后点击 “Resize/Move” 按钮。

![][10]

它将再次要求你确认重新调整分区的大小，因为你正在编辑活动的系统分区，然后点击 “Ok”。

![][11]

分区从 30GB 缩小到 20GB 已经成功。也显示 10GB 未分配的磁盘空间。

![][12]

最后点击 “Apply” 按钮来执行下面剩余的操作。

![][13]

`e2fsck` 是一个文件系统检查实用程序，自动修复文件系统中与 HDD 相关的坏扇道、I/O 错误。

![][14]

`resize2fs` 程序将重新调整 ext2、ext3 或 ext4 文件系统的大小。它可以被用于扩大或缩小一个位于设备上的未挂载的文件系统。

![][15]

`e2image` 程序将保存位于设备上的关键的 ext2、ext3 或 ext4 文件系统的元数据到一个指定文件中。

![][16]

所有的操作完成，关闭对话框。

![][17]

现在，我们可以看到未分配的  “10GB” 磁盘分区。

![][18]

重启系统来检查这一结果。

![][19]

#### 10) 检查剩余空间

重新登录系统，并使用 `fdisk` 命令来查看在分区中可用的空间。是的，我可以看到这个分区上未分配的 “10GB” 磁盘空间。

```
$ sudo parted /dev/sda print free
[sudo] password for daygeek: 
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sda: 32.2GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags: 

Number  Start   End     Size    Type     File system  Flags
        32.3kB  10.7GB  10.7GB           Free Space
 1      10.7GB  32.2GB  21.5GB  primary  ext4         boot
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility/

作者：[Magesh Maruthamuthu][a]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://gparted.org/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-1.png
[4]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-2.png
[5]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-3.png
[6]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-4.png
[7]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-5.png
[8]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-6.png
[9]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-7.png
[10]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-8.png
[11]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-9.png
[12]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-10.png
[13]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-11.png
[14]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-12.png
[15]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-13.png
[16]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-14.png
[17]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-15.png
[18]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-16.png
[19]:https://www.2daygeek.com/wp-content/uploads/2014/08/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility-17.png
