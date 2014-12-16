(translating by  runningwater)
How To Create A Bootable Ubuntu USB Drive For Mac In OS X
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Create_bootable_Ubuntu_USB_Mac_OS_X.jpg)

I bought a Macbook Air yesterday after Dell lost my laptop from their service centre last month. And among the first few things I did was to dual boot Mac OS X with Ubuntu Linux. I’ll cover up Linux installation on Macbook in later articles as first we need to learn **how to create a bootable Ubuntu USB drive for Mac in OS X**.

While it is fairly easy to create a bootable USB in Ubuntu or in Windows, it is not the same story in Mac OS X. This is why the official Ubuntu guide suggest to use a disk rather than USB for live Ubuntu in Mac. Considering my Macbook Air neither has a CD drive nor do I possess a DVD, I preferred to create a live USB in Mac OS X.

### Create a Bootable Ubuntu USB Drive in Mac OS X ###

As I said earlier, creating a bootable USB in Mac OS X is a tricky procedure, be it for Ubuntu or any other bootable OS. But don’t worry, following all the steps carefully will have you going. Let’s see what you need to for a bootable USB:

#### Step 1: Format the USB drive ####

Apple is known for defining its own standards and no surprises that Mac OS X has its own file system type known as Mac OS Extended or [HFS Plus][1]. So the first thing you would need to do is to format your USB drive in Mac OS Extended format.

To format the USB drive, plug in the USB key. Go to **Disk Utility** program from Launchpad (A rocket symboled icon in the bottom plank).

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Disk_Utility_Mac.jpg)

- In Disk Utility, from the left hand pane, select the USB drive to format.
- Click the **Partition** tab in the right side pane.
- From the drop-down menu, select **1 Partition**.
- Name this drive anything you desire.
- Next, change the **Format to Mac OS Extended (Journaled)**

The screenshot below should help you.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Format_Usb_Mac_4.jpg)

There is one last thing to do before we go with formatting the USB. Click the Options button in the right side pane and make sure that the partition scheme is **GUID Partition Table**.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Format_Usb_Mac_2.jpg)

When all is set to go, just hit the **Apply** button. It will give you a warning message about formatting the USB drive. Of course hit the Partition button to format the USB drive.

#### Step 2: Download Ubuntu ####

Of course, you need to download ISO image of Ubuntu desktop. Jump to [Ubuntu website to download your favorite Ubuntu desktop OS][2]. Since you are using a Macbook Air, I suggest you to download the 64 Bit version of whichever version you want. Ubuntu 14.04 is the latest LTS version, and this is what I would recommend to you.

#### Step 3: Convert ISO to IMG ####

The file you downloaded is in ISO format but we need it to be in IMG format. This can be easily done using [hdiutil][3] command tool. Open a terminal, either from Launchpad or from the Spotlight, and then use the following command to convert the ISO to IMG format:

    hdiutil convert -format UDRW -o ~/Path-to-IMG-file ~/Path-to-ISO-file

Normally the downloaded file should be in ~/Downloads directory. So for me, the command is like this:

    hdiutil convert -format UDRW -o ~/Downloads/ubuntu-14.10-desktop-amd64 ~/Downloads/ubuntu-14.10-desktop-amd64.iso

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/ISO_to_IMG_Convert_Mac_OS_X.jpeg)

You might notice that I did not put a IMG extension to the newly converted file. It is fine as the extension is symbolic and it is the file type that matters not the file name extension. Also, the converted file may have an additional .dmg extension added to it by Mac OS X. Don’t worry, it’s normal.

#### Step 4: Get the device number for USB drive ####

The next thing is to get the device number for the USB drive. Run the following command in terminal:

    diskutil list

It will list all the ‘disks’ currently available in the system. You should be able to identify the USB disk by its size. To avoid confusion, I would suggest that you should have just one USB drive plugged in. In my case, the device number is 2 (for a USB of size 8 GB): /dev/disk2

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Create_bootable_USB_Mac_OSX.jpeg)

When you got the disk number, run the following command:

    diskutil unmountDisk /dev/diskN

Where N is the device number for the USB you got previously. So, in my case, the above command becomes:

    diskutil unmountDisk /dev/disk2

The result should be: **Unmount of all volumes on disk2 was successful**.

#### Step 5: Creating the bootable USB drive of Ubuntu in Mac OS X ####

And finally we come to the final step of creating the bootable USB drive. We shall be using [dd command][4] which is a very powerful and must be used with caution. Therefore, do remember the correct device number of your USB drive or else you might end up corrupting Mac OS X. Use the following command in terminal:

    sudo dd if=/Path-to-IMG-DMG-file of=/dev/rdiskN bs=1m

Here, we are using dd (copy and convert) to copy and convert input file (if) IMG to diskN.  I hope you remember where you put the converted IMG file, in step 3. For me the command was like this:

    sudo dd if=~/Downloads/ubuntu-14.10-desktop-amd64.dmg of=/dev/rdisk2 bs=1m

As we are running the above command with super user privileges (sudo), it will require you to enter the password. Similar to Linux, you won’t see any asterisks or something to indicate that you have entered some keyboard input, but that’s the way Unix terminal behaves.

Even after you enter the password, **you won’t see any immediate output and that’s norma**l. It will take a few minutes for the process to complete.

#### Step 6: Complete the bootable USB drive process ####

Once the dd command finishes its process, you may see a dialogue box saying: **The disk you inserted was not readable by this computer**.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Bootable_USB_3.png)

Don’t panic. Everything is just fine. Just **don’t click either of Initialize, Ignore or Eject just now**. Go back to the terminal. You’ll see some information about the last completed process. For me it was:

> 1109+1 records in
> 1109+1 records out
> 1162936320 bytes transferred in 77.611025 secs (14984164 bytes/sec)

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Create_bootable_USB_Mac_OSX_1.jpeg)

Now, in the terminal use the following command to eject our USB disk:

    diskutil eject /dev/diskN

N is of course the device number we have used previously which is 2 in my case:

    diskutil eject /dev/disk2

Once ejected, click on **Ignore** in the dialogue box that appeared previously. Now your bootable USB disk is ready. Remove it from the system.

#### Step 7: Checking your newly created bootable USB disk ####

Once you have completed the mammoth task of creating a live USB of USB in Mac OS X, it is time to test your efforts.

- Plugin the bootable USB and reboot the system.
- At start up when the Apple tune starts up, press and hold option (or alt) key.
- This should present you with the available disks to boot in to. I presume you know what to do next.

For me it showed tow EFI boot:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Ubuntu_boot_USB_Mac_OSX_1.jpeg)

I selected the first one and it took me straight to Grub screen:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/11/Ubuntu_boot_USB_Mac_OSX.jpeg)

I hope this guide helped you to create a bootable USB disk of Ubuntu for Mac in OS X. We’ll see how to dual boot Ubuntu with OS X in next article. Stay tuned.

--------------------------------------------------------------------------------

via: http://itsfoss.com/create-bootable-ubuntu-usb-drive-mac-os/

作者：[Abhishek][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://en.wikipedia.org/wiki/HFS_Plus
[2]:http://www.ubuntu.com/download/desktop
[3]:https://developer.apple.com/library/mac/documentation/Darwin/Reference/ManPages/man1/hdiutil.1.html
[4]:http://en.wikipedia.org/wiki/Dd_%28Unix%29