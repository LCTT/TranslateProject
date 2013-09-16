How To Add or Edit a Linux File System Label
============================================

File system labels are not something you need to have in order to have a functioning Linux operating system, but they can make your computer easier to navigate when you have several disk partitions. In this post I'll show how to add or **edit a Linux file system label** for ext2, ext3, and ext4 disk partitions.

My netbook has 3 OS's installed; Windows XP, Linux Mint, and Xubuntu. Sometimes I want to view files located on one file system from one of the other operating systems. It's convenient to have these [file systems labeled][1], so I know which one to open to find the desired files.

###View Linux File System Labels

It might be handy to first take a look at what file systems already have a label and which ones don't. You can view information about your files systems with the **blkid** command. You may need to run the command as root to see all of the information.

	sudo blkid -c /dev/null

On my netbook, the output looks like this.

	/dev/sda1: LABEL="WINRE" UUID="80AE-9D55" TYPE="vfat" 
	/dev/sda2: LABEL="OS_Install" UUID="E468676968673A06" TYPE="ntfs" 
	/dev/sda3: UUID="012ff341-f854-4c4f-8bbd-bbc810121fe6" TYPE="ext4" 
	/dev/sda5: UUID="ec0fe4d1-e21c-407d-8374-aa4b470519da" TYPE="ext3" 
	/dev/sda6: UUID="ee275431-64b2-4f55-b958-4055147cdf4e" TYPE="swap"
	/dev/sda7: UUID="99feb5c5-25a6-47a3-aa2c-6d466c0094ab" TYPE="ext4"

Now I can also check where certain file systems are mounted on my current system with **lsblk**.

	lsblk

The output from my Linux Mint OS looks like this.

	NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
	sda      8:0    0 149.1G  0 disk 
	|-sda1   8:1    0   3.9G  0 part 
	|-sda2   8:2    0  39.1G  0 part 
	|-sda3   8:3    0   9.3G  0 part /
	|-sda4   8:4    0     1K  0 part 
	|-sda5   8:5    0    86G  0 part /home
	|-sda6   8:6    0   1.4G  0 part [SWAP]
	|-sda7   8:7    0   9.3G  0 part

As you can see from the output from **blkid** and **lsblk**, only my Windows partitions have labels. Looking at my file manager I see a generic title for one of the partitions.

Need to edit linux file system label

Unlabeled partition

###Edit a Linux File System Label with e2label

Looking at the output from **lsblk** I can see that my Linux Mint installation is on /dev/sda3, my home partition is on /dev/sda5, and my Xubuntu installation is on /dev/sda7. I'm going to use [e2label][2] as root to assign labels to these partitions.

	sudo e2label /dev/sda3 Mint
	sudo e2label /dev/sda5 Home
	sudo e2label /dev/sda7 Xubuntu

Now if I look at the output of **blkid**,

sudo blkid -c /dev/null

	/dev/sda1: LABEL="WINRE" UUID="80AE-9D55" TYPE="vfat" 
	/dev/sda2: LABEL="OS_Install" UUID="E468676968673A06" TYPE="ntfs" 
	/dev/sda3: UUID="012ff341-f854-4c4f-8bbd-bbc810121fe6" TYPE="ext4" LABEL="Mint" 
	/dev/sda5: UUID="ec0fe4d1-e21c-407d-8374-aa4b470519da" TYPE="ext3" LABEL="Home" 
	/dev/sda6: UUID="ee275431-64b2-4f55-b958-4055147cdf4e" TYPE="swap" 
	/dev/sda7: UUID="99feb5c5-25a6-47a3-aa2c-6d466c0094ab" TYPE="ext4" LABEL="Xubuntu"

I can see that the labels have been applied. Checking my file manager I also see that my 10.0 GB partition is now shown with the Xubuntu label.

After editing Linux file system label

File system with label

###Tips

You can also view the label of an individual partition with **e2label** like this for partition 5.

	sudo e2label /dev/sda5

To remove the label from partition 5:

	sudo e2label /dev/sda5 ""

This tutorial was written by [Linerd][3] and originally appeared on [Tux Tweaks][4] at http://tuxtweaks.com/2013/08/edit-a-linux-file-system-label/.

via: http://tuxtweaks.com/2013/08/edit-a-linux-file-system-label/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]


[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:https://wiki.archlinux.org/index.php/Persistent_block_device_naming
[2]:http://linux.die.net/man/8/e2label
[3]:http://tuxtweaks.com/author/Linerd/
[4]:http://tuxtweaks.com/

