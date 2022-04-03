[#]: subject: "Installing Arch Linux Using archinstall Automated Script [Complete Guide]"
[#]: via: "https://www.debugpoint.com/2022/01/archinstall-guide/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "hwlife"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Installing Arch Linux Using archinstall Automated Script [Complete Guide]
======
IN THIS GUIDE, WE EXPLAIN THE SUPER EASY WAY OF INSTALLING ARCH LINUX
USING AUTOMATED SCRIPT ARCHINSTALL. INTENDED FOR BEGINNER TO ADVANCED
USERS.
Installing Arch Linux is still troublesome for many new users. It requires a fair amount of knowledge of the commands, inner working of a Linux system including boot process, Kernel and Grub concepts. And these are not known to many. But new users still want to install and experience Arch Linux.

I personally feel that operating system installation should be always simple in this age of computing. Things should be abstracted to the end user as much as possible. After all, all operating system exists for only one purpose – to help the end user to perform certain tasks and help them.

### What is the archinstall automated script?

That said, we covered installing Arch Linux as a bare metal system a while back. Since then, the Arch Linux team came up with an automated and interactive script called [archinstall][1]. This script is far easy way to install Arch Linux today, can can be done by anyone.

That leads us to the intent of this Arch Linux installation guide, using this automated script called archinstall.

Let’s dig in.

### Guide to install Arch Linux using archinstall script

I would split this guide in three sections. First download Arch Linux .ISO file, create a disk with boot. Second is the actual installation and finally configuration with an example desktop.

#### Section 1: Download .ISO file

Visit the below link. Download the .ISO file of Arch Linux. You can go for a direct HTTP download or use torrent/magnet files.

[Download Arch Linux][2]

Once downloaded, create a bootable USB stick using [Etcher][3] or some other utility.

Once done, plug-in the USB stick and boot from it.

Before you begin the next section, make sure you are connected to the internet. In general, if you are in a wired network, you should be good. If you need to configure Wi-Fi via command line in Arch – [follow this guide][4]. Just make sure you are connected to internet.

#### Section 2: Install using archinstall

Once boot is complete, you should see a prompt like below. Type `archinstall` and hit enter.

![First prompt for archinstall][5]

The command will check for internet connectivity to the Arch Linux mirrors. And once done, a series of questions (like this) will pop up. All you have to do is read and respond.

So, for this guide, I give the most basic and easy ones to get you started. You can also experiment with other options if you are confident. But I recommend follow the basic options as outlined below, and next time you can experiment.

Fair enough? Okay.

So, the first question is Keyboard Layout type. It is shown by the two byte country specific layout codes. You can either type that or the number beside it. For English-US, I entered us.

![Keyboard Type – archinstall][6]

Next is Keyboard Language, for which I entered 65 for the United States.

![Keyboard Language – archinstall][7]

Next up is the hard drive selection. The script auto-detects the available drives in your target system. For example, in the below image, it shows 17 GB /dev/vda is the main block device. That is where I am going to install the system. Do not skip this step.

[][8]

SEE ALSO:   How to Install Cinnamon Desktop in Arch Linux

For this guide, I have entered 2 which is for /dev/vda. So, enter the number as per your system.

Once you do that, you should see a double arrow &gt;&gt; beside the device to configure. If you are done, hit enter to proceed.

![Choose Block Device -1][9]

![Choose Block Device -2][10]

In the next option, be very careful. The script asks whether you want to erase the device and go for an auto partition. Or you want to manually partition the drive. For the sake of simplicity, I selected option 0.

![Select partition option – archinstall][11]

In the next set of questions, follow as in the image below. It’s more of the file system type, host name, root password, etc. Follow the on-screen instructions. For your help, I have added the questions and their answers used for this guide in the below table.

Question | Option
---|---
Question | Option
Select main file system | ext4
Would you like to use swap on zram? | n
Enter disk encyption password | keep it blank (hit enter)
hostname or the computer name | Enter any name you want
Enter root password | Enter the password you want
Enter a pre-programmed profile name –
0 – desktop
1 – minimal
2 – server
3 – xorg | Choose 3 – xorg
Install graphics driver | Choose as per your system. Or hit enter without any option for default
Install Audio Server | Choose pulseaudio

![Various options in archinstall -1][12]

In the next question of choosing a Kernel, choose linux. And enter the name of any additional packages you would like this script to install for you – such as firefox, nano, etc.

Select the network interface as NetworkManager and choose default options for timezone.

![Various options in archinstall -2][13]

And that’s about it. Once you are done, the script would generate and wait for you to hit enter to start the installation process.

![archinstall starts downloading packages][14]

Wait until this step finishes. It takes some time to download and install all the packages, depends on your system and internet connection speed. Sometimes Arch mirrors are slow, so wait till it finishes.

#### Section 3 – Install a desktop environment

After you install the base system using the above method, you can install any additional desktop environment such as GNOME, KDE Plasma, MATE, Xfce – so on. We have several guides for each of them in the below pages. You can visit your choice of desktop installation page and jump straight to the bottom of these pages for exact command to install a desktop.

  * [Xfce][15]
  * [GNOME][16]
  * [KDE Plasma][17]
  * [Cinnamon][8]
  * [LXQt][18]



For example, if you want to install GNOME Desktop basic components, you can simply run the below command to install.

```

    sudo pacman -S --needed gnome gnome-tweaks nautilus-sendto gnome-nettool gnome-usage gnome multi-writer adwaita-icon-theme chrome-gnome-shell xdg-user-dirs-gtk fwupd arc-gtk-theme seahosrse gdm firefox gedit

```

```

    systemctl enable gdm

```

```

    systemctl enable NetworkManager

```

Once you are done, type reboot.

And congratulations. You have finally installed Arch Linux using the awesome archinstall script using this guide.

### Closing Notes

I believe, this is one of the impressive script that is developed by the team. And it is definitely going to increase the coverage of the Arch Linux with growing user base.

Having trouble using this script? Let me know in the comment section below.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][19], [Twitter][20], [YouTube][21], and [Facebook][22] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/01/archinstall-guide/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://github.com/archlinux/archinstall
[2]: https://archlinux.org/download/
[3]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[4]: https://www.debugpoint.com/2020/11/connect-wifi-terminal-linux/
[5]: https://www.debugpoint.com/wp-content/uploads/2022/01/image.png
[6]: https://www.debugpoint.com/wp-content/uploads/2022/01/Keyboard-Type-archinstall.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/01/Keyboard-Language-archinstall.jpg
[8]: https://www.debugpoint.com/2021/02/cinnamon-arch-linux-install/
[9]: https://www.debugpoint.com/wp-content/uploads/2022/01/Choose-Block-Device-1.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/01/Choose-Block-Device-2.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/01/Select-partition-option-archinstall.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/01/Various-options-in-archinstall-1.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/01/Various-options-in-archinstall-2.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2022/01/archinstall-starts-downloading-packages.jpg
[15]: https://www.debugpoint.com/2020/12/xfce-arch-linux-install-4-16/
[16]: https://www.debugpoint.com/2020/12/gnome-arch-linux-install/
[17]: https://www.debugpoint.com/2021/01/kde-plasma-arch-linux-install/
[18]: https://www.debugpoint.com/2020/12/lxqt-arch-linux-install/
[19]: https://t.me/debugpoint
[20]: https://twitter.com/DebugPoint
[21]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[22]: https://facebook.com/DebugPoint
