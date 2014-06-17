-------------translating by tenght~
9 commands to check hard disk partitions and disk space on Linux
================================================================================
In this post we are taking a look at some commands that can be used to check up the partitions on your system. The commands would check what partitions there are on each disk and other details like the total size, used up space and file system etc.

Commands like fdisk, sfdisk and cfdisk are general partitioning tools that can not only display the partition information, but also modify them.

### 1. fdisk ###

Fdisk is the most commonly used command to check the partitions on a disk. The fdisk command can display the partitions and details like file system type. However it does not report the size of each partitions.

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

Each device is reported separately with details about size, seconds, id and individual partitions.

### 2. sfdisk ###

Sfdisk is another utility with a purpose similar to fdisk, but with more features. It can display the size of each partition in MB.

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

Cfdisk is a linux partition editor with an interactive user interface based on ncurses. It can be used to list out the existing partitions as well as create or modify them.

Here is an example of how to use cfdisk to list the partitions.

![linux cfdisk disk partitions](http://www.binarytides.com/blog/wp-content/uploads/2014/06/linux-cfdisk.png)

Cfdisk works with one partition at a time. So if you need to see the details of a particular disk, then pass the device name to cfdisk.

    $ sudo cfdisk /dev/sdb

### 4. parted ###

Parted is yet another command line utility to list out partitions and modify them if needed.
Here is an example that lists out the partition details.

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

Df is not a partitioning utility, but prints out details about only mounted file systems. The list generated by df even includes file systems that are not real disk partitions.

Here is a simple example

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

Only the file systems that start with a /dev are actual devices or partitions.

Use grep to filter out real hard disk partitions/file systems.

    $ df -h | grep ^/dev
    /dev/sda6        97G   43G   49G  48% /
    /dev/sda8       196G  154G   33G  83% /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1
    /dev/sda5        98G   37G   62G  38% /media/4668484A68483B47

To display only real disk partitions along with partition type, use df like this

    $ df -h --output=source,fstype,size,used,avail,pcent,target -x tmpfs -x devtmpfs
    Filesystem     Type     Size  Used Avail Use% Mounted on
    /dev/sda6      ext4      97G   43G   49G  48% /
    /dev/sda8      ext4     196G  154G   33G  83% /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1
    /dev/sda5      fuseblk   98G   37G   62G  38% /media/4668484A68483B47

Note that df shows only the mounted file systems or partitions and not all.

### 6. pydf ###

Improved version of df, written in python. Prints out all the hard disk partitions in a easy to read manner.

    $ pydf
    Filesystem Size Used Avail Use%             Mounted on                                 
    /dev/sda6   96G  43G   48G 44.7 [####.....] /                                          
    /dev/sda8  195G 153G   32G 78.4 [#######..] /media/13f35f59-f023-4d98-b06f-9dfaebefd6c1
    /dev/sda5   98G  36G   61G 37.1 [###......] /media/4668484A68483B47

Again, pydf is limited to showing only the mounted file systems.

### 7. lsblk ###

Lists out all the storage blocks, which includes disk partitions and optical drives. Details include the total size of the partition/block and the mount point if any.
Does not report the used/free disk space on the partitions.

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

If there is no MOUNTPOINT, then it means that the file system is not yet mounted. For cd/dvd this means that there is no disk.

Lsblk is capbale of displaying more information about each device like the label and model. Check out the man page for more information

### 8. blkid ###

Prints the block device (partitions and storage media) attributes like uuid and file system type. Does not report the space on the partitions.

    $ sudo blkid
    /dev/sda1: UUID="5E38BE8B38BE6227" TYPE="ntfs" 
    /dev/sda5: UUID="4668484A68483B47" TYPE="ntfs" 
    /dev/sda6: UUID="6fa5a72a-ba26-4588-a103-74bb6b33a763" TYPE="ext4" 
    /dev/sda7: UUID="94443023-34a1-4428-8f65-2fb02e571dae" TYPE="swap" 
    /dev/sda8: UUID="13f35f59-f023-4d98-b06f-9dfaebefd6c1" TYPE="ext4" 
    /dev/sdb1: UUID="08D1-8024" TYPE="vfat"

### 9. hwinfo ###

The hwinfo is a general purpose hardware information tool and can be used to print out the disk and partition list. The output however does not print details about each partition like the above commands.

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

### Summary ###

The output of parted is concise and complete to get an overview of different partitions, file system on them and the total space. Pydf and df are limited to showing only mounted file systems and the same on them.

Fdisk and Sfdisk show a whole lot of information that can take sometime to interpret whereas, Cfdisk is an interactive partitioning tool that display a single device at a time.

So try them out, and do not forget to comment below.

--------------------------------------------------------------------------------

via: http://www.binarytides.com/linux-command-check-disk-partitions/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
