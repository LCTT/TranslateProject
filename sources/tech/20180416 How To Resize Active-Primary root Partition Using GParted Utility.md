How To Resize Active/Primary root Partition Using GParted Utility
======
Today we are going to discuss about disk partition. It’s one of the best topics in Linux. This allow users to resize the active root partition in Linux.

In this article we will teach you how to resize the active root partition on Linux using Gparted utility.

Just imagine, our system has 30GB disk and we didn’t configure properly while installation the Ubuntu operating system.

We need to install another OS in that so we want to make secondary partition on that.

Its not advisable to resize active partition. However, we are going to perform this as there is no way to free up the system.

Make sure you should take backup of important data before performing this action because if something goes wrong (For example, if power got failure or your system got rebooted), you can retain your data.

### What Is Gparted

[GParted][1] is a free partition manager that enables you to resize, copy, and move partitions without data loss. We can use all of the features of the GParted application is by using the GParted Live bootable image. GParted Live enables you to use GParted on GNU/Linux as well as other operating systems, such as Windows or Mac OS X.

### 1) Check Disk Space Usage Using df Command

I just want to show you about my partition using df command. The df command output clearly showing that i only have one partition.
```
$ df -h
Filesystem Size Used Avail Use% Mounted on
/dev/sda1 30G 3.4G 26.2G 16% /
none 4.0K 0 4.0K 0% /sys/fs/cgroup
udev 487M 4.0K 487M 1% /dev
tmpfs 100M 844K 99M 1% /run
none 5.0M 0 5.0M 0% /run/lock
none 498M 152K 497M 1% /run/shm
none 100M 52K 100M 1% /run/user

```

### 2) Check Disk Partition Using fdisk Command

I’m going to verify this using fdisk command.
```
$ sudo fdisk -l
[sudo] password for daygeek:

Disk /dev/sda: 33.1 GB, 33129218048 bytes
255 heads, 63 sectors/track, 4027 cylinders, total 64705504 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk identifier: 0x000473a3

 Device Boot Start End Blocks Id System
/dev/sda1 * 2048 62609407 31303680 83 Linux
/dev/sda2 62611454 64704511 1046529 5 Extended
/dev/sda5 62611456 64704511 1046528 82 Linux swap / Solaris

```

### 3) Download GParted live ISO Image

Use the below command to download GParted live ISO to perform this action.
```
$ wget https://downloads.sourceforge.net/gparted/gparted-live-0.31.0-1-amd64.iso

```

### 4) Boot Your System With GParted Live Installation Media

Boot your system with GParted live installation media (like Burned CD/DVD or USB or ISO image). You will get the output similar to below screen. Here choose **GParted Live (Default settings)** and hit **Enter**.
![][3]

### 5) Keyboard Selection

By default it chooses the second option, just hit **Enter**.
![][4]

### 6) Language Selection

By default it chooses **33** for US English, just hit **Enter**.
![][5]

### 7) Mode Selection (GUI or Command-Line)

By default it chooses **0** for GUI mode, just hit **Enter**.
![][6]

### 8) Loaded GParted Live Screen

Now, GParted live screen is loaded. It is showing the list of partition which was created by me earlier.
![][7]

### 9) How To Resize The root Partition

Choose the root partition you want to resize, only one partition is available here so i’m going to edit that partition to install another OS.
![][8]

To do so, press **Resize/Move** button to resize the partition.
![][9]

Here, enter the size which you want take out from this partition in first box. I’m going to claim **10GB** so, i added **10240MB** and leave rest of boxes as default, then hit **Resize/Move** button
![][10]

It will ask you once again to confirm to resize the partition because you are editing the live system partition, then hit **Ok**.
![][11]

It has been successfully shrink the partition from 30GB to 20GB. Also shows Unallocated disk space of 10GB.
![][12]

Finally click `Apply` button to perform remaining below operations.
![][13]

  * **`e2fsck`** e2fsck is a file system check utility that automatically repair the file system for bad sectors, I/O errors related to HDD.
  * **`resize2fs`** The resize2fs program will resize ext2, ext3, or ext4 file systems. It can be used to enlarge or shrink an unmounted file system located on device.
  * **`e2image`** The e2image program will save critical ext2, ext3, or ext4 filesystem metadata located on device to a file specified by image-file.



**`e2fsck`** e2fsck is a file system check utility that automatically repair the file system for bad sectors, I/O errors related to HDD.
![][14]

**`resize2fs`** The resize2fs program will resize ext2, ext3, or ext4 file systems. It can be used to enlarge or shrink an unmounted file system located on device.
![][15]

**`e2image`** The e2image program will save critical ext2, ext3, or ext4 filesystem metadata located on device to a file specified by image-file.
![][16]

All the operation got completed and close the dialog box.
![][17]

Now, i could able to see **10GB** of Unallocated disk partition.
![][18]

Reboot the system to check this.
![][19]

### 10) Check Free Space

Login to the system back and use fdisk command to see the available space in the partition. Yes i could see **10GB** of Unallocated disk space on this partition.
```
$ sudo parted /dev/sda print free
[sudo] password for daygeek:
Model: ATA VBOX HARDDISK (scsi)
Disk /dev/sda: 32.2GB
Sector size (logical/physical): 512B/512B
Partition Table: msdos
Disk Flags:

Number Start End Size Type File system Flags
 32.3kB 10.7GB 10.7GB Free Space
 1 10.7GB 32.2GB 21.5GB primary ext4 boot

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-resize-active-primary-root-partition-in-linux-using-gparted-utility/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
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
