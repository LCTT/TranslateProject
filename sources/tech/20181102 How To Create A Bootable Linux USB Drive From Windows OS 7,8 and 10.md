How To Create A Bootable Linux USB Drive From Windows OS 7,8 and 10?
======
If you would like to learn about Linux, the first thing you have to do is install the Linux OS on your system.

It can be achieved in two ways either go with virtualization applications like Virtualbox, VMWare, etc, or install Linux on your system.

If you are preferring to move from windows OS to Linux OS or planning to install Linux operating system on your spare machine then you have to create a bootable USB stick for that.

We had wrote many articles for creating [bootable USB drive on Linux][1] such as [BootISO][2], [Etcher][3] and [dd command][4] but we never get an opportunity to write an article about creating Linux bootable USB drive in windows. Somehow, we got a opportunity today to perform this task.

In this article we are going to show you, how to create a bootable Ubuntu USB flash drive from windows 10.

These step will work for other Linux as well but you have to choose the corresponding OS from the drop down instead of Ubuntu.

### Step-1: Download Ubuntu ISO

Visit [Ubuntu releases][5] page and download a latest version. I would like to advise you to download a latest LTS version and not for a normal release.

Make sure you have downloaded the proper ISO by performing checksum using MD5 or SHA256. The output value should be matched with the Ubuntu releases page value.

### Step-2: Download Universal USB Installer

There are many applications are available for this but my preferred application is [Universal USB Installer][6] which is very simple to perform this task. Just visit Universal USB Installer page and download the app.

### Step-3: How To Create a bootable Ubuntu ISO using Universal USB Installer

There is no complication on this application to perform this. First connect your USB drive then hit the downloaded Universal USB Installer. Once it’s launched you can see the interface similar to us.
![][8]

  * **`Step-1:`** Select Ubuntu OS.
  * **`Step-2:`** Navigate to Ubuntu ISO downloaded location.
  * **`Step-3:`** By default it’s select a USB drive however verify this then check the option to format it.



![][9]

When you hit `Create` button, it will pop-up a window with warnings. No need to worry, just hit `Yes` to proceed further on this.
![][10]

USB drive partition is in progress.
![][11]

Wait for sometime to complete this. If you would like to move this process to background, yes, you can by hitting `Background` button.
![][12]

Yes, it’s completed.
![][13]

Now you are ready to perform [Ubuntu OS installation][14]. However, it’s offering a live mode also so, you can play around it if you want to try before performing the installation.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/create-a-bootable-live-usb-drive-from-windows-using-universal-usb-installer/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/category/bootable-usb/
[2]: https://www.2daygeek.com/bootiso-a-simple-bash-script-to-securely-create-a-bootable-usb-device-in-linux-from-iso-file/
[3]: https://www.2daygeek.com/etcher-easy-way-to-create-a-bootable-usb-drive-sd-card-from-an-iso-image-on-linux/
[4]: https://www.2daygeek.com/create-a-bootable-usb-drive-from-an-iso-image-using-dd-command-on-linux/
[5]: http://releases.ubuntu.com/
[6]: https://www.pendrivelinux.com/universal-usb-installer-easy-as-1-2-3/
[7]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[8]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-1.png
[9]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-2.png
[10]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-3.png
[11]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-4.png
[12]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-5.png
[13]: https://www.2daygeek.com/wp-content/uploads/2018/11/create-a-live-linux-os-usb-from-windows-using-universal-usb-installer-6.png
[14]: https://www.2daygeek.com/how-to-install-ubuntu-16-04/
