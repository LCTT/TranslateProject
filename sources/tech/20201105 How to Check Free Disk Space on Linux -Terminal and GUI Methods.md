[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Check Free Disk Space on Linux [Terminal and GUI Methods])
[#]: via: (https://itsfoss.com/check-free-disk-space-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Check Free Disk Space on Linux [Terminal and GUI Methods]
======

_**How much disk space I have utilized?**_

The simplest way to find the free disk space on Linux is to [use df command][1]. The df command stands for disk-free and quite obviously, it shows you the free and available disk space on Linux systems.

```
df -h
```

With `-h` option, it shows the disk space in human-readable format (MB and GB).

Here’s the output of the df command for my Dell XPS system that has only Linux installed with encrypted disk:

![Checking free disk space with df command in Linux][2]

If the above output is confusing for you, don’t worry. I’ll explain a few things around checking available disk space in Linux. _**I’ll also show the GUI method for desktop Linux users.**_

### Method 1: Checking free disk space in Linux with df command (and understanding its output)

When you use the df command to check disk space, it will show a bunch of ‘file systems’ with their size, used space and free space. Your actual disks should normally be listed as one of the following:

  * /dev/sda
  * /dev/sdb
  * /dev/nvme0n1p



This is not a hard and fast rule but it gives you an indication to easily recognize the actual disk from the crowd.

Your Linux system might have several partitions on your disk for boot, EFI, root, swap, home etc. In such cases, these partitions are reflected with a number at the end of the ‘disk name’, like /dev/sda1, /dev/nvme0n1p2 etc.

You could identify which partition is used for what purpose from its mount point. Root is mounted on /, EFI in /boot/EFI etc.

In my case, I have used 41% of the 232 GB of disk space under root. If you have 2-3 big partitions (like root, home etc), you’ll have to make a calculation here.

![Understanding df command output][3]

  * **tmpfs**: The [tmpfs][4] (temporary filesystem) used for keeping files in virtual memory. You can ignore this virtual filesystem comfortably.
  * **udev**: The [udev filesystem][5] is used for storing information related to devices (like USB, network card, CD ROM etc) plugged to your system. You may ignore it as well.
  * **/dev/loop**: These are loop devices. You’ll see plenty of them while checking disk space in Ubuntu because of snap applications. Loops are virtual devices that allow normal files to be accessed as block devices. With the loop devices, snap applications are sandboxed in their own virtual disk. Since they are under root, you don’t need to count their used disk space separately.



#### Missing disk space? Check if you have mounted all disks and partitions

Keep in mind that the df command only shows disk space for mounted filesystems. If you are using more than one Linux distribution (or operating systems) on the same disk or you have multiple disks on your system, you need to mount them first in order to see the free space available on those partitions and disks.

For example, my [Intel NUC][6] has two SSDs and 4 or 5 Linux distributions installed on them. It shows additional disks only when I mount them explicitly.

![][7]

You can use the lsblk command to see all the disks and partitions on your system.

![][8]

Once you have the disk partition name, you can mount it in this fashion:

```
sudo mount /dev/sdb2 /mnt
```

I hope this gives you a pretty good idea about checking hard drive space on Linux. Let’s see how to do it graphically.

### Method 2: Check free disk usage graphically

Checking free disk space graphically is much easier in Ubuntu with the Disk Usage Analyzer tool.

![Disk Usage Analyzer Tool][9]

You’ll see all the actual disks and partitions here. You may have to mount some partitions by clicking on them. It displays the disk usage for all the mounted partitions.

![Disk usage check][10]

#### Checking free disk space with GNOME Disks utility

Otherwise, the GNOME Disks utility is also pretty handy tool.

![GNOME Disks Tool][11]

Start the tool and select the disk. Select a partition to see the free disk space. If a partition is not mounted, mount it first by clicking the ‘play’ icon.

![Free Disk Space Check in Ubuntu Desktop][12]

I think all major desktop environments have some sort of graphical tool to check the disk usage on Linux. You can search for it in the menu of your desktop Linux system.

**Conclusion**

There can be more ways and tools to check the disk space of course. I showed you the most common command line and GUI methods for this purpose.

I also explained a few things that might trouble you in understanding the disk usage. Hope you like it.

If you have questions or suggestions, please let me know in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-free-disk-space-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/df-command/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/free-disk-space-linux-df-command-output.png?resize=786%2C475&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/df-command-output.png?resize=800%2C600&ssl=1
[4]: https://www.kernel.org/doc/html/latest/filesystems/tmpfs.html
[5]: https://wiki.debian.org/udev
[6]: https://itsfoss.com/install-linux-on-intel-nuc/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/df-command-ubuntu-1.png?resize=786%2C443&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/lsblk-command-to-see-disks-linux.png?resize=786%2C538&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/disk-usage-analyzer-tool-linux.jpg?resize=800%2C250&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/free-disk-space-ubuntu-desktop.png?resize=800%2C648&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/disks-tool-linux.jpg?resize=800%2C250&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/free-disk-space-check-ubuntu-desktop.png?resize=800%2C600&ssl=1
