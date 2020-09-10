[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Recognize more devices on Linux with this USB ID Repository)
[#]: via: (https://opensource.com/article/20/8/usb-id-repository)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Recognize more devices on Linux with this USB ID Repository
======
An open source project contains a public repository of all known IDs
used in USB devices.
![Multiple USB plugs in different colors][1]

There are thousands of USB devices on the market—keyboards, scanners, printers, mouses, and countless others that all work on Linux. Their vendor details are stored in the USB ID Repository.

### lsusb

The Linux `lsusb` command lists information about the USB devices connected to a system, but sometimes the information is incomplete. For example, I recently noticed that the brand of one of my USB devices was not recognized. the device was functional, but listing the details of my connected USB devices provided no identification information. Here is the output from my `lsusb` command:


```
$ lsusb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID 046d:082c Logitech, Inc.
Bus 001 Device 003: ID 0951:16d2 Kingston Technology
Bus 001 Device 002: ID 18f8:1486  
Bus 001 Device 005: ID 051d:0002 American Power Conversion Uninterruptible Power Supply
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

As you can see in the last column, there is one device with no manufacturers description. To determine what the device is, I would have to do a deeper inspection of my USB device tree. Fortunately, the `lsusb` command has more options. One is `-D device`, to elicit per-device details, as the man page explains:

> "Do not scan the /dev/bus/usb directory, instead display only information about the device whose device file is given. The device file should be something like /dev/bus/usb/001/001. This option displays detailed information like the **v** option; you must be root to do this."

I didn't think it was easily apparent how to pass the device path to the lsusb command, but after carefully reading the man page and the initial output I was able to determine how to construct it. USB devices reside in the UDEV filesystem. Their device path begins in the USB device directory `/dev/bus/usb/`. The rest of the path is made up of the device's Bus ID and Device ID. My non-descript device is Bus 001, Device 002, which translates to 001/002, and completes the path `/dev/bus/usb/001/002`. Now I can pass this path to `lsusb`. I'll also pipe to `more` since there is often quite a lot of information there:


```
$ lsusb -D /dev/bus/usb/001/002 |more
Device: ID 18f8:1486  
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               1.10
  bDeviceClass            0 (Defined at Interface level)
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0         8
  idVendor           0x18f8
  idProduct          0x1486
  bcdDevice            1.00
  iManufacturer           0
  iProduct                1
  iSerial                 0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength           59
    bNumInterfaces          2
    bConfigurationValue     1
    iConfiguration          0
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 Human Interface Device
      bInterfaceSubClass      1 Boot Interface Subclass
      bInterfaceProtocol      2 Mouse
      iInterface              0
        HID Device Descriptor:
```

Unfortunately, this didn't provide the detail I was hoping to find. The two fields that appear in the initial output, `idVendor` and `idProduct`, are both empty. There is some help, as scanning down a bit reveals the word **Mouse**. A-HA! So, this device is my mouse.

## The USB ID Repository

This made me wonder how I could populate these fields, not only for myself but also for other Linux users. It turns out there is already an open source project for this: the [USB ID Repository][2]. It is a public repository of all known IDs used in USB devices. It is also used in various programs, including the [USB Utilities][3], to display human-readable device names.

![The USB ID Repository Site][4]

(Alan Formy-Duval, [CC BY-SA 4.0][5])

You can browse the repository for particular devices either from the website or by downloading the database. Users are also welcome to submit new data. This is what I did for my mouse, which was absent.

### Update your USB IDs

The USB ID database is stored in a file called `usb.ids`. This location may vary depending on the Linux distribution.

On Ubuntu 18.04, this file is located in `/var/lib/usbutils`. To update the database, use the command `update-usbids`, which you need to run with root privileges or with `sudo`:


```
`$ sudo update-usbids`
```

If a new file is available, it will be downloaded. The current file will be backed up and replaced by the new one:


```
$ ls -la
total 1148
drwxr-xr-x  2 root root   4096 Jan 15 00:34 .
drwxr-xr-x 85 root root   4096 Nov  7 08:05 ..
-rw-r--r--  1 root root 614379 Jan  9 15:34 usb.ids
-rw-r--r--  1 root root 551472 Jan 15 00:34 usb.ids.old
```

Recent versions of Fedora Linux store the database file in `/usr/share/hwdata`. Also, there is no update script. Instead, the database is maintained in a package named `hwdata`.


```
# dnf info hwdata

Installed Packages
Name         : hwdata
Version      : 0.332
Release      : 1.fc31
Architecture : noarch
Size         : 7.5 M
Source       : hwdata-0.332-1.fc31.src.rpm
Repository   : @System
From repo    : updates
Summary      : Hardware identification and configuration data
URL          : <https://github.com/vcrhonek/hwdata>
License      : GPLv2+
Description  : hwdata contains various hardware identification and configuration data,
             : such as the pci.ids and usb.ids databases.
```

Now my USB device list shows a name next to this previously unnamed device. Compare this to the output above:


```
$ lsusb
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID 046d:082c Logitech, Inc. HD Webcam C615
Bus 001 Device 003: ID 0951:16d2 Kingston Technology
Bus 001 Device 014: ID 18f8:1486 [Maxxter]
Bus 001 Device 005: ID 051d:0002 American Power Conversion Uninterruptible Power Supply
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

You may notice that other device descriptions change as the repository is regularly updated with new devices and details about existing ones.

### Submit new data

There are two ways to submit new data: by using the web interface or by emailing a specially formatted patch file. Before I began, I read through the submission guidelines. First, I had to register an account, and then I needed to use the project's submission system to provide my mouse's ID and name. The process is the same for adding any USB device.

Have you used the USB ID Repository? If so, please share your reaction in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/usb-id-repository

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/usb-hardware.png?itok=ROPtNZ5V (Multiple USB plugs in different colors)
[2]: http://www.linux-usb.org/usb-ids.html
[3]: https://sourceforge.net/projects/linux-usb/files/
[4]: https://opensource.com/sites/default/files/uploads/theusbidrepositorysite.png (The USB ID Repository Site)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
