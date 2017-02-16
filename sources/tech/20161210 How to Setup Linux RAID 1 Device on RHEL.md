How to Setup Linux RAID 1 Device on RHEL
============================================================


### Setting up Linux RAID 1

Configuring LINUX RAID 1 is very essential as its provides redundancy.

RAID partitions allows advanced features such as redundancy and better performance. So lets describe how to implement RAID, let’s look at the different types of RAID:

■ RAID 0 (Striping) disks are grouped together to form one large drive. This offers better performance at the cost of availability. Should any single disk in the RAID fail, the entire set of disks becomes unusable. Two disk minimum.

■ RAID 1 (Mirroring) disks are copied from one to another, allowing for redundancy. Should one disk fail, the other disk takes over, having an exact copy of data from the original disk. The downside here is slow write times. Two disk minimum.

■ RAID 5 (Striping with parity) disks are similar to RAID 0 and are join together to form one large drive. The difference here is that 25% of the disk is used for a parity bit, which allows the disks to be recovered should a single disk fail. Three disk minimum.

Let’s move on to hands on for Linux RAID 1 configuration.

Prerequisites for  Linux RAID 1:

1. mdam should be installed on system, Please confirm using below command.

	```
	[root@rhel1 ~]# rpm -qa|grep -i mdadm
	mdadm-3.2.2-9.el6.x86_64
	[root@rhel1 ~]#
	```

2. System should have 2 HDD attached with the system.

	For This Create two partitions, one on each disk (sdc, sdd), allowing each partition to consume the whole disk

	```
	Disk /dev/sdc: 1073 MB, 1073741824 bytes
	255 heads, 63 sectors/track, 130 cylinders
	Units = cylinders of 16065 * 512 = 8225280 bytes
	Sector size (logical/physical): 512 bytes / 512 bytes
	I/O size (minimum/optimal): 512 bytes / 512 bytes
	Disk identifier: 0x67cc8cfb

	Device Boot Start End Blocks Id System
	/dev/sdc1 1 130 1044193+ 83 Linux

	Disk /dev/sdd: 1073 MB, 1073741824 bytes
	255 heads, 63 sectors/track, 130 cylinders
	Units = cylinders of 16065 * 512 = 8225280 bytes
	Sector size (logical/physical): 512 bytes / 512 bytes
	I/O size (minimum/optimal): 512 bytes / 512 bytes
	Disk identifier: 0x0294382b

	Device Boot Start End Blocks Id System
	/dev/sdd1 1 130 1044193+ 83 Linux
	```

--------------------------------------------------------------------------------


作者简介：

Hi there! I am Manmohan Mirkar. I'm so happy you're here! I began this journey in Linux over 10 years ago and I would have never dreamed that I'd be where I am today. My passion is to help you get Knowledge on Linux.Thank you for being here!

--------------------------------------------------------------------------------

via: http://www.linuxroutes.com/linux-raid-1/

作者：[Manmohan Mirkar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxroutes.com/author/admin/
[1]:http://www.linuxroutes.com/linux-raid-1/#
[2]:http://www.linuxroutes.com/linux-raid-1/#
[3]:http://www.linuxroutes.com/linux-raid-1/#
[4]:http://www.linuxroutes.com/linux-raid-1/#
[5]:http://www.linuxroutes.com/linux-raid-1/#
[6]:http://www.linuxroutes.com/linux-raid-1/#
[7]:http://www.linuxroutes.com/linux-raid-1/#
[8]:http://www.linuxroutes.com/linux-raid-1/#
[9]:http://www.linuxroutes.com/linux-raid-1/#
[10]:http://www.linuxroutes.com/linux-raid-1/#
[11]:http://www.linuxroutes.com/linux-raid-1/#
[12]:http://www.linuxroutes.com/author/admin/
[13]:http://www.linuxroutes.com/linux-raid-1/#respond
