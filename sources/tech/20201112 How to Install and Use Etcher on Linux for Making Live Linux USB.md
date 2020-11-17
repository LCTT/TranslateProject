[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Install and Use Etcher on Linux for Making Live Linux USB)
[#]: via: (https://itsfoss.com/install-etcher-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

How to Install and Use Etcher on Linux for Making Live Linux USB
======

_**Etcher is a popular USB flasher app for creating bootable Linux USB drives. Let me show you how to install it and how to use it for making a live Linux disk.**_

### Etcher: An open source tool to flash Linux ISO on SD Cards &amp; USB drives

Etcher is an open-source project by [Balena][1] to help flash SD cards for Raspberry Pi. In fact, we used it in our tutorial on [how to install Raspbian OS on a SD Card][2].

Not just limited to SD Cards, you can also use Etcher to [make a bootable USB drive][3] just like we created a [live USB of Manjaro in Linux][4] with the help of it.

Ever since its first release, Etcher caught the attention for its neat interface and simplicity of use.

![][5]

In this article, I will be focusing on the steps to help you install Etcher on Linux. And then, I’ll also show how to use it. Before I do that, let me give you an overview of the features it offers:

### Features of Etcher

  * Validate drive before flashing
  * Beautiful user interface
  * Auto-detects USB drive/SD card to prevent wiping the HDD on your computer
  * Cross-platform support (Windows, macOS, and Linux)
  * Fast flashing
  * Simple three-step process



On paper, you get everything one would need to flash OS images on an SD card and a USB drive. It is also exciting to know that they plan to add the support simultaneous writing to multiple devices as per their [roadmap][6].

### Installing Etcher on Linux

To get started, you have to grab the AppImage file that it offers (suitable for any Linux distribution) from its official website.

You just need to head on to its [homepage][7] and download the one for your system (32-bit/64-bit):

![][8]

In my case, I got the 64-bit AppImage file for Ubuntu. You can go through our guide on [using AppImage files on Linux][9], but I’ll give you a head start on what you need to do next.

You need to give the file permissions to execute and you can do that by right-clicking on the **AppImage file -&gt; Properties**.

![][10]

Next, click on “**Allow executing as a program**” under the Permissions tab as shown in the image below.

![][11]

Now, just double-click on the AppImage file to launch balenaEtcher!

This should work on any Linux distribution. In either case, you can also head over to its [GitHub releases se][12][c][12][tion][12] to find RPM, DEB, and the source file if you want to build it from source or just install it using the .rpm or .deb files.

You can also refer to our guide on [using deb file in Ubuntu][13] to install applications.

Attention!

It’s been noticed that when you use Etcher to create live USB of Linux distributions, it leaves the USB in an apparent unusable state where it has only a few MB of free state and cannot be formatted directly. On Linux, you can [use the Disks tool to manually delete the partitions and then format it][14].

### Using Etcher on Linux

It is just a three-step process to get started using Etcher. It should be self-explanatory as per the on-screen instructions after you launch it, but just to give you a head start, here’s what you have to do:

**Step 1:** Select the appropriate ISO image file or the URL of the file that you need to flash (as shown in the image below).

![][15]

**Step 2**: Next, you will have to select the target device. It automatically detects and highlights removable devices to help you prevent selecting any internal storage locations.

![][16]

In this case, I have a USB drive connected, and I have it selected as well (as shown in the screenshot below).

![][17]

**Step 3:** Now, all you have to do is — flash the image and wait for it to complete successfully.

![][18]

Here’s how the progress looks:

![][19]

And, it is done!

![][20]

[Download balenaEtcher][7]

### Wrapping Up

Etcher is a useful tool to flash OS images for both SD cards and USB drives. I tend to use it primarily to create live USB drives to test Linux distros and I’m happy with it.

What do you prefer to use to create bootable drives? Have you tried Etcher already? Let me know your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-etcher-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.balena.io/
[2]: https://itsfoss.com/tutorial-how-to-install-raspberry-pi-os-raspbian-wheezy/
[3]: https://itsfoss.com/create-bootable-ubuntu-usb-drive-mac-os/
[4]: https://itsfoss.com/create-live-usb-manjaro-linux/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/etcher-mxlinux-2.png?resize=800%2C518&ssl=1
[6]: https://github.com/balena-io/etcher/milestones
[7]: https://www.balena.io/etcher
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-official-site-download.png?resize=800%2C580&ssl=1
[9]: https://itsfoss.com/use-appimage-linux/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/balena-etcher-permission.jpg?resize=800%2C378&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/balena-etcher-execute.jpg?resize=800%2C445&ssl=1
[12]: https://github.com/balena-io/etcher/releases/tag/v1.5.109
[13]: https://itsfoss.com/install-deb-files-ubuntu/
[14]: https://itsfoss.com/cant-format-usb-disk/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/balena-etcher-select.jpg?resize=800%2C521&ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-select-target.jpg?resize=800%2C509&ssl=1
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-target-device.jpg?resize=800%2C521&ssl=1
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-flash.jpg?resize=800%2C516&ssl=1
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-flashing.jpg?resize=800%2C510&ssl=1
[20]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/etcher-flash-complete.jpg?resize=800%2C507&ssl=1
