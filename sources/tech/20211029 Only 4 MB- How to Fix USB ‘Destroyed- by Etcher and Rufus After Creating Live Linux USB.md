[#]: subject: "Only 4 MB? How to Fix USB ‘Destroyed’ by Etcher and Rufus After Creating Live Linux USB"
[#]: via: "https://itsfoss.com/format-live-linux-usb/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Only 4 MB? How to Fix USB ‘Destroyed’ by Etcher and Rufus After Creating Live Linux USB
======

Here’s the scenario. You used Etcher or Rufus tools to create a bootable, live Linux USB in Windows or perhaps in Linux.

You used it to install Linux and the purpose of the USB is accomplished. Now you want to format this USB and use it for the regular data transfer or storage.

You plug it in your Windows system and to your surprise, the disk capacity of the USB is just 4 MB.

![][1]

You try to format it and it probably won’t let you do that. Even if you manage to format it, the size of the USB is now shrunk to just 4 MB from the usual 8 GB, 16 GB or 32 GB.

Have you lost your USB? Not really. Your USB is not completely destroyed. You can still format it with a little trick and use it comfortably.

Let me show how to restore the bootable USB to a usable state in both Windows and Linux.

### Formatting the live Linux USB created by Rufus or Etcher [In Windows]

You see only 4 MB of disk space in Windows. Do you know why? Because while creating the live Linux USB, the tool creates a 4 MB of EFI partition in FAT 32 filesystem. The other partition(s) is in Linux’s Ext4 filesystem which is not recognized by Windows.

This is why your Windows system only sees the EFI partition of 4 MB and shows the USB size as 4 MB.

![Windows only see the EFI partition on the USB][2]

All in all, what you need to do is to delete all the partition on the USB disk, create a new NTFS or FAT32 partition from the free space you got from deleting the existing partitions. That’s it.

Let me show the steps in detail.

#### Step 1:

Go to the Windows menu and look for the Disk Management tool.

![Start disk management tool][3]

Start this tool and it will show all the disks present on your computer. This includes the plugged-in USB, of course.

_**This is very important to select the correct disk**_. Identify which one it is from the size of the USB disk or from the ‘Removable’ tag.

![][4]

#### Step 2:

The idea is to delete any existing partition present on the USB disk. The unallocated space cannot be deleted but that’s okay.

Right click on the partition and click **Delete Volume**.

![Delete partitions on the USB disk][5]

When asked for your confirmation, press Yes.

![Confirm deletion of partition][6]

Your aim is to have only a single block of unallocated space. When you see that, right click on it and click on “New Simple Volume” to create a partition.

![Create New Simple Volume \(partition\)][7]

The next steps are simple. Click on Next, select the entire available space, assign a letter to it, select the file system (FAT 32 or NTFS) and format it.

![Click Next][8]

![Use entire available space][9]

![Give it a drive letter][10]

![Use FAT 32 or NTFS, Name the USB if you want][11]

![Revise all the changes][12]

Once that is done, you’ll see that the USB has returned to normal state and you can start copy-pasting data to it.

![USB is back to normal state][13]

You can use your USB as before now.

These steps were for Windows. What if you use Linux?

### Formatting live Linux USB on Linux

I have noticed that live USB created by Etcher and such tools often create refuse to be formatted properly by the right click format option in the file manager.

As an alternative, you can do what you did in Windows: delete existing partitions and create a new partition with the entire free space.

Use the GNOME Disks tool here. It is already installed on Ubuntu and many other Linux distributions.

![Start disk app][14]

_**Again, make sure that you have selected the external USB disk here.**_

You’ll see various partitions on the USB disk. Try and format the disk from the menu above.

![Format disk][15]

**If that does not work, delete the partitions individually** one by one and then make the entire USB as free space.

When you have the entire free space created, click on the + sign to create a partition on it in NTFS or FAT32 filesystem.

![][16]

Create the partition with NTFS (or FAT 32), name it something appropriate and then you can enjoy the USB like it was before.

### Conclusion

Tools like Rufus and Etcher don’t really destroy your USB. This is how they function, by creating a different filesystem on the disk. But then the operating system doesn’t understand it properly.

The good thing is that it can be fixed with only a little effort. I hope you too were able to fix it. If not, share your issue with me and I’ll try to help.

--------------------------------------------------------------------------------

via: https://itsfoss.com/format-live-linux-usb/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/usb-drive-4mb-space-only.webp?resize=800%2C324&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/mystery-behind-4-mb-linux-live-usb.webp?resize=800%2C400&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/start-disk-management-tool-windows.webp?resize=800%2C694&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/identify-usb-disk-in-windows.webp?resize=800%2C509&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/delete-partitions-on-usb-disk.webp?resize=800%2C464&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/confirm-deletion-of-partition.webp?resize=800%2C357&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/Create-New-Partition.webp?resize=800%2C471&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/creating-new-simple-volume-1.png?resize=731%2C590&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/creating-new-simple-volume-2.png?resize=735%2C589&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/creating-new-simple-volume-3.png?resize=732%2C590&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/creating-new-simple-volume-4.png?resize=669%2C527&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/creating-new-simple-volume-5.png?resize=670%2C524&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/live-Linux-USB-formatted-successfully.webp?resize=800%2C571&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/start-disk-app.webp?resize=791%2C256&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/format-usb-in-disks-tool.webp?resize=800%2C434&ssl=1
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/create-partition-on-usb.webp?resize=800%2C418&ssl=1
