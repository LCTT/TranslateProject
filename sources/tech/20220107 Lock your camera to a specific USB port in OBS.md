[#]: subject: "Lock your camera to a specific USB port in OBS"
[#]: via: "https://opensource.com/article/22/1/cameras-usb-ports-obs"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "hanszhao80"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Lock your camera to a specific USB port in OBS
======
To standardize a complex camera setup, you can impose some special rules
on how cameras get assigned to locations in the Linux filesystem.
![Person using a laptop][1]

If you [stream with OBS][2] with multiple cameras on Linux, you might notice that cameras are loaded as they are detected during boot. You probably don't give it much thought, normally, but if you have a permanent streaming setup with complex OBS templates, you need to know which camera in the physical world is going to show up in which screen in the virtual one. In other words, you don't want to assign one device as Camera A today only to have it end up as Camera B tomorrow.

To standardize a complex camera setup, you can impose some special rules on how cameras get assigned to locations in the Linux filesystem.

### The udev subsystem

The system dealing with hardware peripherals on Linux is called udev. It detects and manages all devices you plug into your computer. You're probably not aware of it because it doesn't draw too much attention to itself, although you've certainly interacted with it when you plug in a USB thumb drive to open on your desktop or attached a printer.

### Hardware detection

Assume you have two USB cameras: One on the left of your computer and one on the right. The left camera is shooting a close-up, the right camera is shooting a long shot, and you switch between the two during your stream. In OBS, you add each camera to your **Sources** panel and, intuitively, call one **camLEFT** and the other **camRIGHT**.

Assuming the worst-case scenario, say you have two of the _same_ cameras: They're the same brand and the same model number. This is the worst-case scenario because when two pieces of hardware are identical, there's little chance each one has any kind of unique ID for your computer to differentiate them from one another.

There's a solution to this puzzle, though, and it just requires a little investigation using some simple terminal commands.

#### 1\. Get the vendor and product IDs

First, plugin just one camera into the USB port you want it assigned to. Then issue this command:


```


$ lsusb
Bus 006 Device 002: ID 0951:1666 Kingston Technology DataTraveler G4
Bus 005 Device 003: ID 03f0:3817 Hewlett-Packard LaserJet P2015 series
Bus 003 Device 006: ID 045e:0779 Microsoft Corp. LifeCam HD-3000
Bus 003 Device 002: ID 8087:0025 Intel Corp. 
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 003: ID 046d:c216 Logitech, Inc. Dual Action Gamepad
Bus 001 Device 002: ID 048d:5702 Integrated Technology Express, Inc. 
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
[...]

```

You can usually search specifically for the string "cam" to narrow down the results because most (but not all) cameras report as a camera.


```


$ lsusb | grep -i cam
Bus 003 Device 006: ID 045e:0779 Microsoft Corp. LifeCam HD-3000

```

There's a lot of information here. The ID is listed as `045e:0779`. The first number is the vendor ID, and the second is the product ID. Write those down because you'll need them later.

#### 2\. Get the USB identifier

You've also obtained the device path to the camera: bus 3, device 6. There's a saying in Linux that "everything is a file," and indeed USB devices are described to udev as a file path starting with `/dev/bus/usb/` and ending with the bus (003 in this case) and the device (006 in this case). Look at the bus and device numbers in the `lsusb` output. They tell you that this camera is located on `/dev/bus/usb/003/006`.

You can use the `udevadm` command to obtain the kernel's designator for this USB device:


```


$ sudo udevadm info \
\--attribute-walk \
/dev/bus/usb/003/006 | grep "KERNEL="

   KERNEL=="3-6.2.1"

```

The kernel USB identifier in this example is `3-6.2.1`. Write down the identifier for your system because you'll also need it later.

#### 3\. Repeat for each camera

Attach the other camera (or cameras, if you have more than two) to the USB port you want it assigned to. This is _different_ than the USB port you used for the other camera!

Repeat the process, obtaining the vendor and product ID (if the cameras are the same make and model, these should be the same as the first one) and the kernel USB identifier.


```


$ lsusb | grep -i cam
Bus 001 Device 004: ID 045e:0779 Microsoft Corp. LifeCam HD-3000
$ sudo udevadm info \
\--attribute-walk \
/dev/bus/usb/001/004 | grep "KERNEL="

   KERNEL=="1-6"

```

In this example, I've determined that I have my cameras attached to 1-6 and 3-6.2.1 (the first one is a USB port on my machine, the other one is a hub plugged into the monitor plugged into my machine, which is why one is more complex than the other.)

### Write a udev rule

You have everything you need, so now you can write a rule to tell udev to give each camera a consistent identifier when one is found at a specific USB port.

Create and open a file called `/etc/udev/rules.d/50-camera.conf`, and enter these two rules, using the vendor and product IDs and kernel identifiers appropriate for your own system:


```


SUBSYSTEM=="usb", KERNEL=="1-6", ATTR{idVendor}=="045e", ATTR{idProduct}=="0779", SYMLINK+="video100"

SUBSYSTEM=="usb", KERNEL=="3-6.2.1", ATTR{idVendor}=="045e", ATTR{idProduct}=="0779", SYMLINK+="video101"

```

These rules tell udev that when it finds a device matching a specific vendor and product ID at those specific USB locations, to create a symlink (sometimes also called an "alias") named `video100` and `video101`. The symlinks are mostly arbitrary. I give them high numbers, so they're easy to spot and because the number must not clash with existing devices. If you actually do have more than 101 cameras attached to your computer, use `video200` and `video201` just to be safe (and get in contact! I'd love to learn more about _that_ project).

### Reboot

Reboot your computer. You can leave the cameras attached for now, but it doesn't actually matter. Once udev has a rule loaded, it follows those rules whether a device was attached during boot or is plugged in later.

Many people say that Linux never needs to reboot, but udev loads its rules during boot, and besides, you want to prove that your udev rules are working across reboots.

Once your computer is back up and running, take a look in `/dev/video`, where cameras are registered:


```


$ ls -1 /dev/video*
/dev/video0
/dev/video1
/dev/video100
/dev/video101
/dev/video2
/dev/video3

```

As you can see, there are entries at `video100` and `video101`. Today, these are symlinks to `/dev/video2` and `/dev/video3`, but tomorrow they may be symlinks to `/dev/video1` and `/dev/video2`, or any other combination based on when Linux detected and assigned them a file.

![Two camera angles][3]

(Photo by [Jeff Siepman][4])

You can use the symlinks in OBS, though, so that camLEFT is always camLEFT, and camRIGHT is always camRIGHT.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/cameras-usb-ports-obs

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://opensource.com/life/15/12/real-time-linux-video-editing-with-obs-studio
[3]: https://opensource.com/sites/default/files/uploads/obs-udev.jpg (Two camera angles)
[4]: https://unsplash.com/@jeffsiepman?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
