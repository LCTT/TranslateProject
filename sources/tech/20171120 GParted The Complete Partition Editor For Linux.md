GParted The Complete Partition Editor For Linux
======

![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gparted-the-complete-partition-editor-for-linux_orig.jpg)
**Partition editing**is a task which not only requires carefulness but also a stable environment. Today GParted is one of the leading partition editing tools on Linux environment.

**GParted**is not only easy but also remains powerful at the same time. Today I am going to list out the installation as well as basics to use GParted which will be helpful to newbies.

### How to install GParted?

​Downloading and installing gparted is not a much difficult task. Today GParted is available on almost all distros and can be easily installed from their specific software center. Just go to software center and search “GParted” or use command line package manager to install it.

 [![install gparted from software center](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-gparted-from-software-center_orig.jpg)][1] In case you don’t have a software center or GParted isn’t available on software center you can always grab it from its official website.[Download][2]

#### The Basics

​Using GParted isn’t difficult. When I opened it for the first time 3 years ago, sure I was confused for a moment but I was quickly able to use it. Launching GParted requires admin privileges so it requires your password for launching. This is normal.

 [![type password to provide for admin privileges](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/type-password-to-provide-for-admin-privileges_orig.png)][3] 

​Below is the screen that GParted will display when you launch it the first time i.e. all your partitions of the hard disk (It will differ PC to PC).

 [![gparted user interface in linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gparted-user-interface-in-linux_orig.png)][4] 

​The screen presented is not only simple but also effective. You will see that from left to right it displays address of the partition, type of partition, the mount point ( “/” indicates root), Label of partition (In case you name your partitions like I do), total size of partition and capacity used and unused as well as flags (never ever touch a partition with a flag unless you know what you are doing). The key sign in front of file systems indicates that the partition is currently mounted means used by the system. Right-click and select “unmount” to unmount it.

You can see that it displays all sorts of information that you need to know about a particular partition you want to mess with. The bar with filled and unfilled portion indicates your hard disk. Also a simple thing “dev/sda” goes for hard disk while “dev/sdb” goes for your removable drives mostly flash drives (differs).

You can change working on drives by clicking on the box at top right corner saying “dev/sda”. The tweaks you want are available on different options at the menu bar.

 [![edit usb partition in gparted](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edit-usb-partition-in-gparted_orig.png)][5] 

​This is my flash drive which I switched using the top right corner box as I told above. See it now indicates different details. Also as my drive is based on different format the color of bar changed. This is a really helpful feature as it indicates that partition changes if color differs. Editing external drives is also same as editing internal.

#### Tweaking The Partitions

Tweaking partition requires your full attention as this is somewhat risky because if it's done wrong, you will destroy your data. Keeping this point in mind proceed.

Select a partition you want to work on rather it is on hard drive or flash drive is non-relevant. If the partition is mounted, unmount it. After unmounting the editing options will become available.  

 [![gparted menu bar](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gparted-menu-bar_orig.png)][6] 

This options can be accessed by menu bar or right mouse button too. The first option is for creating a new partition, the second one to delete, third one to resize partition, the fourth one to copy, fifth to paste. The last options are important as the second last is to revert changes and the last one is to apply changes.

GParted doesn’t make changes in real time but keeps track of changes done by you. So you can easily revert a change if it is caused by mistake. Lastly, you can apply it and save changes.

​Now let’s come to editing part. 

Let us assume you want to create a new partition by deleting existing one. Select partition of your choice hit the delete key and it will be deleted. Now for creating a new partition select that first option on the menu bar that indicates “new”.

You will get the following options.

 [![create new partition with gparted](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-new-partition-with-gparted_orig.png)][7] 

​Here you can easily resize the partition by either entering values manually or drag the bar. If you want to change alignment do it with align option. You can choose whether to keep partition primary or secondary by option “create as”. Name the partition in Label and choose the appropriate file system. In case you want to access this partition on other OS like windows better use “

[NTFS][8]

” format.

There are times when data partition table is hampered. GParted handles this thing well too. There is the option to create new data partition table under device option. Remember creating data partition will destroy present data.

 [![select table type in gparted](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/select-table-type-in-gparted_orig.jpg)][9] 

​But what to do when you already having a pen drive on which you want to do data rescue? Gparted helps here too. Reach data rescue option under device section from the menu bar. This option requires the installation of additional components that can be accessed from software center.

 [![scan disk partition in gparted](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/scan-disk-partition-in-gparted_orig.jpg)][10] 

​You can also align flags to certain partition by option “flags”. Remember not to mess with flags unless you know what you are doing. There are a lot of other tweaks too to explore and use. Do that but remember mess with something unless you know what you are doing.

#### Applying Tweaks

 [![apply changes to disk in gparted partition editor](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/apply-changes-to-disk-in-gparted-partition-editor_orig.png)][11] 

​After you have done tweaking you need to apply them. This could be done by using apply option I mentioned above. It will give you a warning. Check out if everything is proper before applying and proceed the warning to apply tweaks and your changes are done. Enjoy!.

#### Other Features

​Gparted offers live environment image files to boot and repair partitions in case of something wrong that can be downloaded from the website. GParted also shows tweaks it can do on your system, partition information and many others. Remember options will be differently available as per system. 

 [![file system support in gparted](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/file-system-support-in-gparted_orig.png)][12] 

### Conclusion

​Here we reach the end of my long article.

**GParted**is a really nice, powerful software that has great capabilities. There is also a nice community on _GParted_ that will surely help you in case you come across a bug or doubt in which we [LinuxAndUbuntu][13]are too included. The power of GParted will help you to do almost all partition related task but you should be careful about what you are doing.

Remember to always check out in the last what you are applying and is it right or not. In case you run across a problem don’t hesitate to comment and ask as we are always willing to help you.

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/gparted-the-complete-partition-editor-for-linux

作者：[LinuxAndUbuntu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-gparted-from-software-center_orig.jpg
[2]:http://gparted.org/download.php
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/type-password-to-provide-for-admin-privileges_orig.png
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gparted-user-interface-in-linux_orig.png
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edit-usb-partition-in-gparted_orig.png
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/gparted-menu-bar_orig.png
[7]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-new-partition-with-gparted_orig.png
[8]:http://www.linuxandubuntu.com/home/fdisk-command-to-manage-disk-partitions-in-linux
[9]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/select-table-type-in-gparted_orig.jpg
[10]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/scan-disk-partition-in-gparted_orig.jpg
[11]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/apply-changes-to-disk-in-gparted-partition-editor_orig.png
[12]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/file-system-support-in-gparted_orig.png
[13]:http://www.linuxandubuntu.com/
