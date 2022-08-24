[#]: subject: "How to List USB Devices Connected to Your Linux System"
[#]: via: "https://itsfoss.com/list-usb-devices-linux/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to List USB Devices Connected to Your Linux System
======
How do you list the USB devices in Linux?

The question can have two meanings.

* How many USB ports are (detected) on your system?
* How many USB devices/disks are mounted (plugged in) to the system?

Mostly, people are interested in knowing what USB devices are connected to the system. This may help troubleshoot the USB devices.

The most reliable way is to use this command:

```
lsusb
```

It shows the webcam, Bluetooth, and Ethernet ports along with the USB ports and mounted USB drives.

![list usb with lsusb command linux][1]

But understanding the output of lsusb is not easy and you may not need to complicate things when you just want to see and access the mounted USB drives.

I will show you various tools and commands you can use to list USB devices connected to your system.

I have connected a 2GB pen-drive, 1TB external HDD, Android smartphone via MTP and USB mouse in the examples unless stated otherwise.

Let me start with the simplest of the options for desktop users.

### Check connected USB devices graphically

Your distribution file manager can be used to view USB storage devices connected to your computer. As you can see in the screenshot of Nautilus (GNOME File Manager) below.

The connected devices are shown in the sidebar (Only USB Storage devices are shown here).

![Nautilus showing connected USB devices][2]

You can also use GUI applications like GNOME Disks or Gparted to view, format, and partition the USB Storage devices connected to your computer. GNOME Disks is preinstalled in most distributions using GNOME Desktop Environment by default.

This app also works as a very good [partition manager][3] too.

![Use GNOME Disks to list mounted USB devices][4]

*Enough of the Graphical tools*. Let us discuss the commands you can use for listing the USB devices.

### Using the mount command to list the mounted USB devices

The mount command is used for mounting partitions in Linux. You can also list USB storage devices using the same command.

Generally, USB storage is mounted in the media directory. Thus, filtering the output of mount command on media will give you the desired result.

```
mount | grep media
```

![][5]

### Using df command

[df command][6] is a standard UNIX command used to know the amount of available disk space. You can also use this command to list USB storage devices connected using the command below.

```
df -Th | grep media
```

![Use df command to list mounted USB drives][7]

### Using lsblk command

The lsblk command is used to list block devices in the terminal. So, here also by filtering the output containing media keyword, you can get the desired result as shown in the screenshot below.

```
lsblk | grep media
```

![Using lsblk to list connected USb devicesUsing blkid to list connected USb devices][8]

If you are more curious, you can use the `blkid` command to know the UUID, Label, Block size etc.

This command gives more output as your internal drives are also listed. So, you have to take references from the above command to identify the device you wish to know about.

```
sudo blkid
```

![Using blkid to list connected USb devices][9]

### Using fdisk

fdisk, the good old command line partition manager, can also list the USB storage devices connected to your computer. The output of this command is also very long. So, usually, the connected devices get listed at the bottom as shown below.

```
sudo fdisk -l
```

![Use fidsk to list usb devices][10]

### Inspecting /proc/mounts

By inspecting the /proc/mounts file, you can list the USB Storage devices. As you can notice, it shows you the mount options being used by filesystem along with the mount point.

```
cat /proc/mounts | grep media
```

![][11]

### Display all the USB devices with lsusb command

And we revisit the famed lsusb command.

Linux kernel developer [Greg Kroah-Hartman][12] developed this handy [usbutils][13] utility. This provides us with two commands i.e. `lsusb` and `usb-devices` to list USB devices in Linux.

The lsusb command lists all the information about the USB bus in the system.

```
lsusb
```

As you can see this command also shows the Mouse and Smartphone I have connected, unlike other commands (which are capable of listing only USB storage devices).

![][14]

The second command `usb-devices` gives more details as compared but fails to list all devices, as shown below.

```
usb-devices
```

![][15]

Greg has also developed a small GTK application called [Usbview][16]. This application shows you the list of all the USB devices connected to your computer.

The application is available in the official repositories of most Linux distributions. You can install `usbview` package using your distribution’s [package manager][17] easily.

Once installed, you can launch it from the application menu. You can select any of the listed devices to get details, as shown in the screenshot below.

![][18]

### Conclusion

Most of the methods listed are limited to USB storage devices. There are only two methods which can list other peripherals also; usbview and usbutils. I guess we have one more reason to be grateful to the Linux Kernel developer Greg for developing these handy tools.

I am aware that there are many more ways to list USB devices connected to your system. Your suggestions are welcome.

--------------------------------------------------------------------------------

via: https://itsfoss.com/list-usb-devices-linux/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/08/list-usb-with-lsusb-command-linux.png
[2]: https://itsfoss.com/wp-content/uploads/2022/08/nautilus-usb.png
[3]: https://itsfoss.com/partition-managers-linux/
[4]: https://itsfoss.com/wp-content/uploads/2022/08/gnome-disks-usb.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/mount-cmd-usb.png
[6]: https://linuxhandbook.com/df-command/
[7]: https://itsfoss.com/wp-content/uploads/2022/08/df-cmd-usb.png
[8]: https://itsfoss.com/wp-content/uploads/2022/08/blkid-cmd-usb.png
[9]: https://itsfoss.com/wp-content/uploads/2022/08/blkid-cmd-usb.png
[10]: https://itsfoss.com/wp-content/uploads/2022/08/fdisk-cmd-usb.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/proc-dir-usb.png
[12]: https://en.wikipedia.org/wiki/Greg_Kroah-Hartman
[13]: https://github.com/gregkh/usbutils
[14]: https://itsfoss.com/wp-content/uploads/2022/08/lsusb-cmd.png
[15]: https://itsfoss.com/wp-content/uploads/2022/08/usb-devices-cmd.png
[16]: https://github.com/gregkh/usbview
[17]: https://itsfoss.com/package-manager/
[18]: https://itsfoss.com/wp-content/uploads/2022/08/usbview.png
