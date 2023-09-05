[#]: subject: "How to Create Persistent Live USB of Ubuntu"
[#]: via: "https://itsfoss.com/ubuntu-persistent-live-usb/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Create Persistent Live USB of Ubuntu
======

What if I tell you you can carry a complete Ubuntu system in a removable disk drive?

[Installing Ubuntu on an external USB][1] is a complicated process. The simpler option is to make a live USB but with persistent storage that will save all the changes you make to it.

And trust me; the process is similar to [using BalenaEtcher][2] or any flashing tool to make a bootable drive.

But before that, let's have a look at what persistent live USB means.

### What is a persistent live USB?

When you use a live Linux USB, any changes you made in the live session are lost. If you boot from it again, you'll have to connect to WiFi again, your downloaded files and installed apps won't be there. A persistent live USB will save all those changes.

This way, you can keep using that USB drive as an external operating system that saves all the changes you've made like creating a user account, installing packages, and all sorts of things that you generally do with a normal computer.

Of course, the number of files would depend on the size of the disk you use!

But you got the point. Right? Let's see about creating a live Ubuntu USB with persistence.

### How to create a persistent Ubuntu drive

In this tutorial, I will walk you through the process of creating a persistent Ubuntu USB:

  * On Windows using Rufus tool
  * On Linux using mkusb tool



You can follow the appropriate section of the tutorial.

📋

In the tutorials, you'll be creating a persistent USB of Ubuntu. Not all Linux distros support persistence and hence the method may or may not work for creating persistent USB of other distributions.

#### Method 1: Create a persistent Ubuntu drive on Windows

To create a persistent Ubuntu drive on Windows, I will be using Rufus, a free and open-source tool to flash ISO files on USB drives.

[Visit the official download page of Rufus][3] to get the executable file for Windows:

![][4]

Now, open the Rufus and it will ask you to run as an administrator; grant the permissions as you're about to make changes in the external drive and permissions are necessary for that.

Next, follow the given steps to use Rufus to make a persistent USB drive:

  * Select the USB device (if there's only one USB stick, it will be selected by default).
  * Hit the `Select` button to select the ISO file from the file manager.
  * You can either use the slider or specify the size of the persistent drive directly (you can go to the max, no worries).
  * Leave the other options to default (unless you know what you are up to).
  * Hit the `Start` button to start the flashing.



![][5]

It will show you warnings that the data on the selected drive will be removed, so you can easily ignore them.

Once done, let's have a look at how you can directly boot to the UEFI settings in Windows.

##### Boot from the USB drive (the easy way)

This method should work for most users and if not, you can always use the traditional way by rebooting the system and pressing Esc, Delete, F1, F2, F10, F11, or F12 keys.

To follow the easy method, press `Win + X` and start Windows PowerShell as an admin:

![][6]

Once you see the prompt, simply execute the following command:

```

    shutdown.exe /r /fw

```

It will schedule the shutdown and in a moment, you'll be booted into the UEFI firmware setup.

From there, choose the USB as a first preference to boot from and save changes:

![][7]

You will see a normal grub screen:

![][8]

Once you boot, select the option to test Ubuntu and from there you can save changes and they won't be removed even if you reboot the system.

#### Method 2: Create a persistent Ubuntu drive on Ubuntu Linux

🚧

This method will likely only work with Ubuntu and Debian ISO.

For those who don't know, mkusb is a GUI tool that lets you flash ISO on a disk drive but with additional features like creating a persistent drive on Ubuntu.

And for the installation, you have to add mkusb PPA using the following:

```

    sudo add-apt-repository ppa:mkusb/ppa

```

To take effect from the changes, update the repository index:

```

    sudo apt update

```

Finally, install mkusb and other packages:

```

    sudo apt install --install-recommends mkusb mkusb-nox usb-pack-efi

```

That's it!

First, start what mkusb tool from the system menu. It will ask you to enter your superuser password:

![][9]

Once done, it will show you the warning of all the data in the drive will be wiped with the new data.

Simply, press the `OK` button:

![][10]

And it will show you multiple actions that can be performed with the mkusb tool. From which, you have to select the first option "Install (make a boot device)":

![][11]

After that, it will show you multiple options for the installation. From there, you select the third option `'Persistent live' - only Debian and Ubuntu`:

![][12]

In the next step, it will ask you to choose between multiple methods.

And unless you're using something specific like an extremely stripped-down version, go with the first method named `dus-Iso2usb`:

![][13]

Next, it will ask you to select the ISO file from the file manager:

![][14]

It will show you the name of the selected ISO file along with what tools it will be using to create a persistent USB drive:

![][15]

Next, you have to select the drive that needs to be flashed with the previously selected ISO file:

![][16]

Once done, you will be given 3 choices. If you don't know which one to use, then press the `Use defaults` button but for most users, going with the 2nd option `grold` will get the job done (I'm going with the same):

![][17]

After everything is correct, choose `Go` option to start the flashing process:

![][18]

And it will start the flashing process!

![][19]

**Remember, it will take longer compared to the usual flashing that you do using BalenaEtcher!**

Once done, you'll be notified that the process has been completed and you can unplug and re-plug the drive to see changes:

![][20]

##### Boot from persistent USB drive

To boot from the USB drive, you can reboot your system, press the respective key multiple times, and get there but NO!

That's a decade-old method.

There's [a simple way to access BIOS in Linux][21] where all you have to do is execute the following command in your terminal:

```

    systemctl reboot --firmware-setup

```

Here, go to the Boot menu and select the USB drive as a first priority to boot from:

![][22]

Once you boot from the USB, you'll have two options:

  * ISO with persisted mode
  * Booting from live mode



As the name suggests, you go with the first option to boot into the Ubuntu persisted mode:

![][23]

And now, you can make changes like installing your favorite packages, [creating a new user][24], and a lot more!

### Carry multiple ISOs in one drive!

Did you know that you can carry multiple ISOs in a single drive and those ISOs could be any Linux distro or even a Windows ISO file? Ventoy is an awesome tool for that.

![][25]

![][25]

I hope you will find this guide helpful.

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-persistent-live-usb/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/intsall-ubuntu-on-usb/
[2]: https://itsfoss.com/install-etcher-linux/
[3]: https://rufus.ie/en/
[4]: https://itsfoss.com/content/images/2023/09/Download-Rufus-to-create-persistant-Ubuntu-drive-in-Windows.png
[5]: https://itsfoss.com/content/images/2023/09/Use-rufus-to-create-Ubuntu-persistant-drive.png
[6]: https://itsfoss.com/content/images/2023/09/Start-Windows-powershell-as-admin.png
[7]: https://itsfoss.com/content/images/2023/09/Boot-from-UEFI-1.jpg
[8]: https://itsfoss.com/content/images/2023/09/Boot-from-persisted-storage-USB-drive-made-using-Rufus-on-Windows-machine.png
[9]: https://itsfoss.com/content/images/2023/08/Start-mkusb-tool-from-system-menu.png
[10]: https://itsfoss.com/content/images/2023/08/Data-will-be-wiped-warning-.png
[11]: https://itsfoss.com/content/images/2023/08/Select-the-first-option-in-mkusb-tool-to-create-persistent-USB-drive-of-Ubuntu.png
[12]: https://itsfoss.com/content/images/2023/08/Select-the-persistent-option.png
[13]: https://itsfoss.com/content/images/2023/08/Select-the-grub-option.png
[14]: https://itsfoss.com/content/images/2023/08/Select-an-ISO-file-to-create-persistent-USB-from-Ubuntu.png
[15]: https://itsfoss.com/content/images/2023/08/Showing-seelcted-ISO-file.png
[16]: https://itsfoss.com/content/images/2023/08/Choose-drive-to-create-persistent-drive.png
[17]: https://itsfoss.com/content/images/2023/08/Choose-bootloader.png
[18]: https://itsfoss.com/content/images/2023/08/Select-go-ahead-option-in-mkusb-to-create-persistent-USB-drive.png
[19]: https://itsfoss.com/content/images/2023/08/Flashing-process-to-make-persistent-usb-of-Ubuntu.png
[20]: https://itsfoss.com/content/images/2023/08/Persistent-drive-has-been-made.png
[21]: https://itsfoss.com/access-uefi-from-linux/
[22]: https://itsfoss.com/content/images/2023/09/Boot-from-UEFI.jpg
[23]: https://itsfoss.com/content/images/2023/08/Boot-from-persisted-storage-USB-drive.png
[24]: https://learnubuntu.com/add-delete-users/
[25]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
