translating---geekpi

Commands to check System & Hardware Information
======
Hello linux-fanatics, in this post i will be discussing some important that will make your life as System Administrator. As we all know being a good System Administrator means knowing everything about your IT Infrastructure & having all the information about your servers, whether its hardware or OS. So following commands will help you out in extracting out all the hardware & system information.

#### 1- Viewing system information

$ uname -a

![uname command][2]

It will provide you all the information about your system. It will provide you with Kernel name of system, Hostname, Kernel version, Kernel Release, Hardware name.

#### 2- Viewing Hardware information

$ lshw

![lshw command][4]

Using lshw will show you all the Hardware information on your screen.

#### 3- Viewing Block Devices(Hard disks, Flash drives) information

$ lsblk

![lsblk command][6]

lsblk command prints all the information regarding block devices on screen. Use lsblk -a to show all the block devices.

#### 4- Viewing CPU information

$ lscpu

![lscpu command][8]

lscpu shows all the CPU information on screen.

#### 5- Viewing PCI information

$ lspci

![lspci command][10]

All the network adapter cards, USB cards, Graphics cards are termed as PCIs. To view their information use lspci .

lspci -v will give detailed information regarding PCI cards.

lspci -t will show them in tree format.

#### 6- Viewing USB information

$ lsusb

![lsusb command][12]

To view information regarding all USB controllers & devices connected to them, we use lsusb

#### 7- Viewing SCSI information

$ lssci

![lssci][14]

To view SCSI information type lsscsi. lsscsi -s will also show the size of partition.

#### 8- Viewing file system information

$ fdisk -l

![fdisk command][16]

Using fdisk -l will show information regarding the file system. Although main function of fdisk utility is to modify a file system, you can create new partitions, delete old ones ( more on that in my future tutorial).

That's it for now my fellow Linux-fanatics . You are advised to check out my other posts regarding Linux commands **[HERE][17] & ** another one **[HERE][18]
**

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/commands-system-hardware-info/

作者：[Shusain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[2]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/uname.jpg?resize=664%2C69
[4]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lshw.jpg?resize=641%2C386
[6]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lsblk.jpg?resize=646%2C162
[8]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lscpu.jpg?resize=643%2C216
[10]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lspci.jpg?resize=644%2C238
[12]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lsusb.jpg?resize=645%2C37
[14]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/lsscsi.jpg?resize=639%2C110
[16]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/02/fdisk.jpg?resize=656%2C335
[17]:http://linuxtechlab.com/linux-commands-beginners-part-1/
[18]:http://linuxtechlab.com/linux-commands-beginners-part-2/
