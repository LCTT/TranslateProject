Bootiso Lets You Safely Create Bootable USB Drive
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/USB-drive-720x340.png)
Howdy newbies! Some of you may often use **dd command** to do various things, like creating a USB drive or cloning disk partitions. Please be mindful that dd command is one of the dangerous and destructive command. If you’re Linux beginner, mostly avoid using dd command to do stuffs. If you don’t know what you are doing, you may wipe your hard drive in minutes. The dd command literally just takes bytes from **if** and writes them to **of**. It doesn’t care what it’s overwriting, it doesn’t care if there’s a partition table in the way, or a boot sector, or a home folder, or anything important. It will simply do what it is told to do. Instead, use some user-friendly apps like [**Etcher**][1]. So you will know which device you’re going to format before actually start creating bootable USB devices.

Today, I stumbled upon yet another utility named **“Bootiso”** , which is also used to safely create bootable USB drive. It is actually a BASH script, and is brilliant! It has some extra features that helps us to safely create bootable USB devices. If you want to be sure you’re targeting a USB device (and not internal drive), or if you want autodetection of a USB device, you can use bootiso. Here is the significant advantages of using this script:

  * If there is only one USB drive, Bootiso will automatically select it.
  * If there are more than one USB drives present, it lets you to choose one of them from the list.
  * Just in case you mistakenly choose one of Internal hard drive, it will exit without doing anything.
  * It checks the selected ISO has the correct mime-type. If it has wrong mime-type, it will exit.
  * It asserts that the selected item is not a partition and exit if it doesn’t.
  * It will prompt the user confirmation before erasing and partitioning the USB drive.
  * Lists available USB drives.
  * Installs syslinux bootloader (optional).
  * Free and Open Source.



### Safely Create Bootable USB Drive Using Bootiso

Installing Bootiso is very easy. Download the latest version using command:
```
$ curl -L https://rawgit.com/jsamr/bootiso/latest/bootiso -O

```

Move the downloaded file to your **$PATH** , for example /usr/local/bin/.
```
$ sudo cp bootiso /usr/local/bin/

```

Finally, make it executable:
```
$ sudo chmod +x /usr/local/bin/bootiso

```

Done! Now, it is time to create bootable USB drives. First, let us see how many USB drives are present using command:
```
$ bootiso -l

```

Sample output:
```
Listing USB drives available in your system:
NAME HOTPLUG SIZE STATE TYPE
sdb 1 7.5G running disk

```

As you can see, I have only one USB drive. Let us go ahead and create the USB bootable from an ISO file using command:
```
$ bootiso bionic-desktop-amd64.iso

```

This command will prompt you to enter the sudo password. Type the password and hit ENTER key to install the missing dependencies (if there are any) and then create USB bootable device.

Sample output:
```
[...]
Listing USB drives available in your system:
NAME HOTPLUG SIZE STATE TYPE
sdb 1 7.5G running disk
Autoselecting `sdb' (only USB device candidate)
The selected device `/dev/sdb' is connected through USB.
Created ISO mount point at `/tmp/iso.c5m'
`bootiso' is about to wipe out the content of device `/dev/sdb'.
Are you sure you want to proceed? (y/n)>y
Erasing contents of /dev/sdb...
Creating FAT32 partition on `/dev/sdb1'...
Created USB device mount point at `/tmp/usb.QgV'
Copying files from ISO to USB device with `rsync'
Synchronizing writes on device `/dev/sdb'
`bootiso' took 303 seconds to write ISO to USB device with `rsync' method.
ISO succesfully unmounted.
USB device succesfully unmounted.
USB device succesfully ejected.
You can safely remove it !

```

If the your ISO file has the wrong mime-type, you will see the following error message:
```
Provided file `bionic-desktop-amd64.iso' doesn't seem to be an iso file (wrong mime type: `application/octet-stream').
Exiting bootiso...

```

You can, however, skip the mime-type check using **–no-mime-check** option like below.
```
$ bootiso --no-mime-check bionic-desktop-amd64.iso

```

Like I already mentioned, Bootiso will automatically choose the USB drive if there is only one USB drive present in your system. So, we don’t need to mention the usb disk path. If you have more than one devices connected, you can explicitly specify the USB device using **-d** flag like below.
```
$ bootiso -d /dev/sdb bionic-desktop-amd64.iso

```

Replace “/dev/sdb” with your own path.

If you don’t specify **-d** flag when using more than one USB devices, Bootiso will prompt you to select from available USB drives.

Bootiso will ask the user confirmation before erasing and partitioning the USB devices. To auto-confirm this, use **-y** or **–assume-yes** flag.
```
$ bootiso -y bionic-desktop-amd64.iso

```

You can also enable autoselecting USB devices in conjunction with **-y** option as shown below.
```
$ bootiso -y -a bionic-desktop-amd64.iso

```

Or,
```
$ bootiso --assume-yes --autoselect bionic-desktop-amd64.iso

```

Please remember it will work only if you have only one connected USB drive.

By default, Bootiso will create a **FAT 32** partition and then mount and copy the ISO contents using **“rsync”** program to your USB drive. You can also use “dd” instead of “rsync” if you want.
```
$ bootiso --dd -d /dev/sdb bionic-desktop-amd64.iso

```

If you want to increase the odds your USB will be bootable, use **“-b”** or **“–bootloader”** like below.
```
$ bootiso -b bionic-desktop-amd64.iso

```

The above command will install a bootloader with **syslinux** (safe mode). Please note that it doesn’t work if you use “–dd” option.

After creating the bootable device, Bootiso will automatically eject the USB drive. If you don’t want it to automatically eject it, use **-J** or **–no-eject** flag.
```
$ bootiso -J bionic-desktop-amd64.iso

```

Now, the USb device will remain connected. You can unmount it at anytime using “umount” command.

To display help section, run:
```
$ bootiso -h

```

And, that’s all for now. Hope this script helps. More good stuffs to come. Stay tuned!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/bootiso-lets-you-safely-create-bootable-usb-drive/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/etcher-beauitiful-app-create-bootable-sd-cards-usb-drives/
