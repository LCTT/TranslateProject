translation by strugglingyouth
How to Create New File Systems/Partitions in the Terminal on Linux
================================================================================
![](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-feature-image.png)

Partition editing or making new file systems on Linux usually means one thing: installing the Gnome Parted partition editor (GParted). For most Linux users, this is the only way to go about it. Still, what if you could edit these partitions and file systems right in the terminal? You can! Here’s how!

### Creating a basic Linux partition layout with CFdisk ###

Here’s how to make a basic Linux partition scheme right from the command line. The first thing to do is open your terminal. Once you’re there, you’ll need to identify what hard drive you’re looking to change. This can easily be figured out with one simple command.

    lsblk

![cfdisk-lsblk](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-lsblk.png)


Once you’ve run `lsblk`, you should get a detailed list of each hard drive currently on your system. Look through this generated list, and figure out the denotation to the drive you want to change. In this article I’ll be using `sdb` for the sake of example.

In your terminal enter this command. It will launch a powerful terminal-based partition editing program.

    sudo cfdisk /dev/sdb

![cfdisk-empty-layout](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-empty-layout.png)

**Note**: replace `sdb` with whatever `lsblk` told you your hard drive was.

When this command is entered, you’ll be inside the partition editor and will have total access to the hard drive you wish to modify.

Since hard drive partitions are different, depending on a user’s needs, this part of the guide will go over **how to set up a split Linux home/root system layout**.

To start, a root partition will need to be created. This will require a bit of math as the gigabytes on the hard drive need to be divided up. My test drive is 32 GB.

In CFdisk using the arrow keys on your keyboard, select some free space. Once you’ve found some, use the arrow key to select [ NEW ] and press the Enter key.

![cfdisk-create-root-partition](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-create-root-partition.png)

The program will ask you to input the partition size. Once you’ve specified the size, press the Enter key. This will be known as the root partition (or /dev/sdb1).

Next it’s time to create the home partition (/dev/sdb2). Once again, you’ll need to select some free space in CFdisk. Use the arrow key to select the [ NEW ] option, and press the Enter key. Input the size of your home partition, and press the Enter key to create it.

![cfdisk-create-home-partition](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-create-home-partition.png)

Finally, the swap partition needs to be created. Like the two times before, find some free space, and use the arrow key to select the [ NEW ] option. After that calculate exactly how big your Linux swap partition needs to be.

**Note**: a swap partition is usually about as big as a computer’s physical RAM.

![cfdisk-specify-partition-type-swap](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-specify-partition-type-swap.png)

Now that the swap partition has been created, it’s time to specify its type. Highlight it with the up and down arrow keys. After that use the left and right arrow keys to select [ TYPE ]. Find Linux swap in the menu, and press Enter.

![cfdisk-write-partition-table](https://www.maketecheasier.com/assets/uploads/2015/03/cfdisk-write-partition-table.jpg)

All of the partition creation is out of the way. All that’s left is to write it to the disk. Using the right arrow key, select the [ WRITE ] option, and press the Enter key. This will write your newly created layout directly to the hard drive.

### Creating file systems with mkfs ###

Sometimes you don’t need to make an entire partition layout. Sometimes you just need to make a file system. This can easily be accomplished directly in the terminal with the `mkfs` command.

![cfdisk-mkfs-list-partitions-lsblk](https://www.maketecheasier.com/assets/uploads/2015/10/cfdisk-mkfs-list-partitions-lsblk.png)

To start, figure out what you’re looking to modify. Enter `lsblk` in your terminal to find out. It’ll print out a list, and after that just find the partition or drive you want to make a file system on.

In this example, I’ll point it towards the first partition of the secondary drive `/dev/sdb1`. It’s also possible to just point mkfs to `/dev/sdb` (to make use of the entire drive).

![cfdisk-mkfs-make-file-system-ext4](https://www.maketecheasier.com/assets/uploads/2015/10/cfdisk-mkfs-make-file-system-ext4.png)

To create the new file system on a specific partition, just enter

    sudo mkfs.ext4 /dev/sdb1

into the terminal. It should be noted that `mkfs.ext4` can be changed to whatever file system you want to use.

### Conclusion ###

Though editing file systems and partitions is easier using a graphical tool, the terminal is arguably more efficient. It’s much more faster to just load up a terminal, tap a few buttons and be done. With GParted and tools like it, it’s a whole ordeal. I hope that with the help of this tutorial you, too, understand how efficient editing file systems in the terminal can be.

Do you prefer to use terminal-based programs to edit partitions on Linux? Why or why not? Tell us below!

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/create-file-systems-partitions-terminal-linux/

作者：[Derrik Diener][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/derrikdiener/
