NTFS Partition Repair and Recovery In Linux
================================================================================
Once again we find ourselves in the unenviable position of bailing out one of our Windows friends/family/acquaintances/business associates or other assorted persons. Although we don’t have their particular day to day challenges, we do often find that we are the “go to” person when they have issues. Heaven forbid, we may have even had our own issues with our Windows partition/drive (after all, we have to game sometime and despite the efforts of Steam, Linux just isn’t a gamer’s dream yet). Let’s take a look at a couple of scenarios that may come up that we can fix with our handy Linux distribution and some of the NTFS partition recovery tools at our disposal.

**Just Fix It**

Windows systems generally tolerate unscheduled “hard boots” (power outages, turning off the power strip or caused by the fingers of the resident little person) pretty well. In fact, to this day, often the most effective means of fixing a Windows desktop problem is to simply reboot the system. However, on occasion, the Windows partition will indicate that it needs the drive checked for consistency. Not doing so after a few reboots can cause whatever festering file system problem there is to get worse. Windows file system checks are notoriously slow and often have to be done multiple times before they clear the “dirty” flag on the filesystem.

Enter a little utility called ‘ntfsfix’ which can be downloaded for Debian based systems (i.e. Ubuntu) as follows:

    sudo apt-get install ntfsfix

or RPM based systems (i.e. Red Hat or CentOS):

    sudo yum install ntfsfix

The ‘ntfsfix’ utility will QUICKLY fix common errors and NTFS inconsistencies. The most common ones without any parameters. It will also report back items not fixed that we can address by passing in the following:

- -b: clears bad sectors on the disk (can be used when cloning an older disk to a newer one)
- -d: clear the “dirty” flag, the most common reason that Linux may not mount a Windows partition, usually happens when Windows did not successfully shut down before being powered off
- -n: does nothing but display to standard out what it would have done (in other words, what repair needed to be made)

I have had the NTFS Disk Check that starts before Windows take hours to simply get around to resetting the “dirty” flag on a drive during boot whereas ‘ntfsfix’ completes that activity in about three seconds.

**Deeper Dive**

Unfortunately, not everything can be fixed quickly. In fact, there are a very large number of very expensive disk recovery software (often under the category of “disk forensics” since they are employed by investigators when sifting through damaged drives) for fixing drives that power up but won’t boot or provide file system access.

There is a fantastic, and free, utility (and fully bootable rescue CD if it is inside your local computer) for recovering your Windows NTFS partition (and it can do EXT2/3/4, FAT/FAT32/exFAT, HFS and SunFS filesystems too). This utility is called [TestDisk][1] and is available in Debian and CentOS repositories under that name. Red Hat does not make this utility available in their repositories, however, it can easily be installed.

    sudo apt-get install testdisk

or RPM based systems (i.e. Red Hat or CentOS):

    sudo yum install testdisk

I cannot say enough good things about this utility. If the drive powers on and spins up, even if it has physical damage, odds are this little baby will get some of your files off of it. You start it up by issuing a plain old “sudo testdisk /dev/sdX” where ‘X’ is your drive and then you will see something like this:

![](http://blog.linuxacademy.com/wp-content/uploads/2013/08/testdisk2.jpg)

*TestDisk Running in a Terminal*

Use of the tool is as simple as following the menu prompts. This is interactive, it will scan whatever partition you indicate and then present you with the rebuilt directory and file list which you can then mark and restore to another disk/partition. I have successfully recovered files from Windows, OSX and Linux partitions that were either unbootable for one reason or another or had the dreaded “click of doom” that indicates your drive is not long for this world.

In all fairness, you cannot expect 100% recovery rate especially if you drive has damage, but anything is better than nothing and it doesn’t cost as much (read: nothing) as sending it to a recovery specialist. Get this tool now if you have drive problems.

**Final Thoughts**

Drive recovery is a lot easier, and certainly a lot cheaper when you use Linux, either connecting to the drive in question using a USB cradle or booting from a Live CD with the rescue tools installed on CD. Everything we talked about in this article is freely available and under active development (updated). Leave us a comment below and indicate what tools you have had to use to recover from your drive problems.


via: http://blog.linuxacademy.com/linux/ntfs-partition-repair-and-recovery-in-linux/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://www.cgsecurity.org/wiki/TestDisk