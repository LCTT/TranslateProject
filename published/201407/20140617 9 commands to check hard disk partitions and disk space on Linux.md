Linux下掌控磁盘分区的九大神器
================================================================================

在这篇文章中，我们来了解一些用来检查你的系统分区的一些命令，这些命令将检查每个磁盘的分区情况和其它细节，例如总空间容量，已用完的空间和文件系统等。

像fdisk，sfdisk和cfdisk命令这样的常规分区工具，不仅可以显示分区信息，还可以修改。

### 1. fdisk ###

Fdisk是检查磁盘上分区的最常用命令，fdisk命令可以显示分区和细节，如文件系统类型，但是它并不报告每个分区的字节大小。

    $ sudo fdisk -l
    
    Disk /dev/sda: 500.1 GB, 500107862016 bytes
    255 heads, 63 sectors/track, 60801 cylinders, total 976773168 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk identifier: 0x30093008
    
       Device Boot      Start         End      Blocks   Id  System
    /dev/sda1   *          63   146801969    73400953+   7  HPFS/NTFS/exFAT
    /dev/sda2       146802031   976771071   414984520+   f  W95 Ext'd (LBA)
    /dev/sda5       146802033   351614654   102406311    7  HPFS/NTFS/exFAT
    /dev/sda6       351614718   556427339   102406311   83  Linux
    /dev/sda7       556429312   560427007     1998848   82  Linux swap / Solaris
    /dev/sda8       560429056   976771071   208171008   83  Linux
    
    Disk /dev/sdb: 4048 MB, 4048551936 bytes
    54 heads, 9 sectors/track, 16270 cylinders, total 7907328 sectors
    Units = sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disk identifier: 0x0001135d
    
       Device Boot      Start         End      Blocks   Id  System
    /dev/sdb1   *        2048     7907327     3952640    b  W95 FAT32

每个设备都单独显示其详细信息：容量大小，扇区数，设备ID及其包含的每个分区。

### 2. sfdisk ###

Sfdisk是另一种跟fdisk用途相似的实用工具，但具有更多的功能。它能够以MB为单位显示每个分区的大小。

    $ sudo sfdisk -l -uM
    
    Disk /dev/sda: 60801 cylinders, 255 heads, 63 sectors/track
    Warning: extended partition does not start at a cylinder boundary.
    DOS and Linux will interpret the contents differently.
    Units = mebibytes of 1048576 bytes, blocks of 1024 bytes, counting from 0
    
       Device Boot Start   End    MiB    #blocks   Id  System
    /dev/sda1   *     0+ 71680- 71681-  73400953+   7  HPFS/NTFS/exFAT
    /dev/sda2     71680+ 476938  405259- 414984520+   f  W95 Ext'd (LBA)
    /dev/sda3         0      -      0          0    0  Empty
    /dev/sda4         0      -      0          0    0  Empty
    /dev/sda5     71680+ 171686- 100007- 102406311    7  HPFS/NTFS/exFAT
    /dev/sda6     171686+ 271693- 100007- 102406311   83  Linux
    /dev/sda7     271694  273645   1952    1998848   82  Linux swap / Solaris
    /dev/sda8     273647  476938  203292  208171008   83  Linux
    
    Disk /dev/sdb: 1020 cylinders, 125 heads, 62 sectors/track
    Warning: The partition table looks like it was made
      for C/H/S=*/54/9 (instead of 1020/125/62).
    For this listing I'll assume that geometry.
    Units = mebibytes of 1048576 bytes, blocks of 1024 bytes, counting from 0
    
       Device Boot Start   End    MiB    #blocks   Id  System
    /dev/sdb1   *     1   3860   3860    3952640    b  W95 FAT32
                    start: (c,h,s) expected (4,11,6) found (0,32,33)
                    end: (c,h,s) expected (1023,53,9) found (492,53,9)
    /dev/sdb2         0      -      0          0    0  Empty
    /dev/sdb3         0      -      0          0    0  Empty
    /dev/sdb4         0      -      0          0    0  Empty

### 3. cfdisk ###

Cfdisk是一个基于ncurses（提供字符终端处理库，包括面板和菜单）的带有交互式用户界面的Linux分区编辑器，它可以用来列出现有分区以及创建或修改这些分区。

下面是一个如何使用Cfdisk来列出分区的例子。

![linux cfdisk disk partitions](http://www.binarytides.com/blog/wp-content/uploads/2014/06/linux-cfdisk.png)

Cfdisk一次只能列出一个分区，所以如果你需要看某一磁盘的细节，可以把该磁盘的设备名作为Cfdisk的参数。

    $ sudo cfdisk /dev/sdb

### 4. parted ###

Parted是另一个命令行实用程序，可以列出分区；如果需要的话，也可进行修改。

下面是一个例子，列出了详细的分区信息。

    $ sudo parted -l
    Model: ATA ST3500418AS (scsi)
    Disk /dev/sda: 500GB
    Sector size (logical/physical): 512B/512B
    Partition Table: msdos
        
    Number  Start   End     Size    Type      File system     Flags
     1      32.3kB  75.2GB  75.2GB  primary   ntfs            boot
     2      75.2GB  500GB   425GB   extended                  lba
     5      75.2GB  180GB   105GB   logical   ntfs
     6      180GB   285GB   105GB   logical   ext4
     7      285GB   287GB   2047MB  logical   linux-swap(v1)
     8      287GB   500GB   213GB   logical   ext4
       
    
    Model: Sony Storage Media (scsi)
    Disk /dev/sdb: 4049MB
    Sector size (logical/physical): 512B/512B
    Partition Table: msdos
    
    Number  Start   End     Size    Type     File system  Flags
     1      1049kB  4049MB  4048MB  primary  fat32        boot

### 5. df ###

Df是不是一个分区工具，但它打印出挂装文件系统的细节，Df可以列出甚至不是真实的磁盘分区的文件系统。

这里是个简单的例子：

    $ df -h
    Filesystem      Size  Used Avail Use% Mounted on
    /dev/sda6        97G   43G   49G  48% /
    none            4.0K     0  4.0K   0% /sys/fs/cgroup
    udev            3.9G  8.0K  3.9G   1% /dev
    tmpfs           799M  1.7M  797M   1% /run
    none            5.0M     0  5.0M   0% /run/lock
    none            3.9G   12M  3.9G   1% /run/shm
    none            100M   20K  100M   1% /run/user
    /dev/sda8       196G  154G   33G  83% /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1
    /dev/sda5        98G   37G   62G  38% /media/4668484A68483B47

只有以 /dev 开始的文件系统才是实际的设备或分区。

可以使用grep命令来筛选出实际的硬盘分区或文件系统。

    $ df -h | grep ^/dev
    /dev/sda6        97G   43G   49G  48% /
    /dev/sda8       196G  154G   33G  83% /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1
    /dev/sda5        98G   37G   62G  38% /media/4668484A68483B47

要只显示真正的磁盘分区与分区类型，可以这样使用Df：

    $ df -h --output=source,fstype,size,used,avail,pcent,target -x tmpfs -x devtmpfs
    Filesystem     Type     Size  Used Avail Use% Mounted on
    /dev/sda6      ext4      97G   43G   49G  48% /
    /dev/sda8      ext4     196G  154G   33G  83% /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1
    /dev/sda5      fuseblk   98G   37G   62G  38% /media/4668484A68483B47

请注意，Df只显示已挂载的文件系统或分区，并不是所有。

### 6. pydf ###

它是用Python写的Df的改进版本，以易读的方式打印出所有磁盘分区。

    $ pydf
    Filesystem Size Used Avail Use%             Mounted on                                 
    /dev/sda6   96G  43G   48G 44.7 [####.....] /                                          
    /dev/sda8  195G 153G   32G 78.4 [#######..] /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1
    /dev/sda5   98G  36G   61G 37.1 [###......] /media/4668484A68483B47

另外，pydf被限制为仅显示已挂载的文件系统。

### 7. lsblk ###

列出了所有的块存储设备，包括磁盘分区和光盘驱动器。细节包括所有分区/块总大小和挂载点。

它不会报告分区上的已使用和空闲磁盘空间。

    $ lsblk
    NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
    sda      8:0    0 465.8G  0 disk 
    ├─sda1   8:1    0    70G  0 part 
    ├─sda2   8:2    0     1K  0 part 
    ├─sda5   8:5    0  97.7G  0 part /media/4668484A68483B47
    ├─sda6   8:6    0  97.7G  0 part /
    ├─sda7   8:7    0   1.9G  0 part [SWAP]
    └─sda8   8:8    0 198.5G  0 part /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1
    sdb      8:16   1   3.8G  0 disk 
    └─sdb1   8:17   1   3.8G  0 part 
    sr0     11:0    1  1024M  0 rom


如果没有挂载点，这就意味着文件系统未安装，而对于cd/dvd这意味着没有插入光盘。

lsblk能够显示每个设备的更多信息，如标签和型号，更多请查看信息手册。

### 8. blkid ###

显示块设备（分区和存储介质）属性，例如UUID和文件系统类型，不报告分区空间。

    $ sudo blkid
    /dev/sda1: UUID="5E38BE8B38BE6227" TYPE="ntfs" 
    /dev/sda5: UUID="4668484A68483B47" TYPE="ntfs" 
    /dev/sda6: UUID="6fa5a72a-ba26-4588-a103-74bb6b33a763" TYPE="ext4" 
    /dev/sda7: UUID="94443023-34a1-4428-8f65-2fb02e571dae" TYPE="swap" 
    /dev/sda8: UUID="13f35f59-f023-4d98-b06f-9dfaebefd6c1" TYPE="ext4" 
    /dev/sdb1: UUID="08D1-8024" TYPE="vfat"

### 9. hwinfo ###

hwinfo是一个通用的硬件信息的工具，可以用来打印出磁盘和分区表，但是输出不再像上面的命令那样打印每个分区的详细信息。

    $ hwinfo --block --short
    disk:                                                           
      /dev/sda             ST3500418AS
      /dev/sdb             Sony Storage Media
    partition:
      /dev/sda1            Partition
      /dev/sda2            Partition
      /dev/sda5            Partition
      /dev/sda6            Partition
      /dev/sda7            Partition
      /dev/sda8            Partition
      /dev/sdb1            Partition
    cdrom:
      /dev/sr0             SONY DVD RW DRU-190A

### 总结 ###

parted的输出可以得到简洁而完整的不同分区的概述、其上的文件系统以及总空间。pydf和df它们一样，只是被限制为只显示已挂载文件系统。

fdisk和sfdisk显示完整大量的信息，需要花些时间来解释。cfdisk是一个交互式分区工具，每次显示一个单一的设备。

来尝试下这些命令吧，别忘了在下面评论哟！

--------------------------------------------------------------------------------

via: http://www.binarytides.com/linux-command-check-disk-partitions/
 
译者：[tenght](https://github.com/tenght) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
