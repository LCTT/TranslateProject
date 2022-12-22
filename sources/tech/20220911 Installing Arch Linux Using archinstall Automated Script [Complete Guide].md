[#]: subject: "Installing Arch Linux Using archinstall Automated Script [Complete Guide]"
[#]: via: "https://www.debugpoint.com/archinstall-guide/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Installing Arch Linux Using archinstall Automated Script [Complete Guide]
======
In this guide, we explain the super easy way of installing Arch Linux using the automated script archinstall. Intended for beginner to advanced users.

Installing Arch Linux is still troublesome for many new users. It requires a fair amount of knowledge of the commands, and inner workings of a Linux system, including boot process, Kernel and Grub concepts. And these are not known to many. But new users still want to install and experience Arch Linux.

I personally feel that operating system installation should always be simple in this age of computing. Things should be abstracted to the end user as much as possible. After all, all operating systems exist for one purpose – to help the end user perform certain tasks and help them.

### What is the archinstall automated script?

That said, we covered installing Arch Linux as a bare metal system a while back. Since then, the Arch Linux team came up with an automated and interactive script called [archinstall][1]. This script is a far easy way to install Arch Linux today, and can be done by anyone.

That leads us to the intent of this Arch Linux installation guide, using this automated script called archinstall.

Let’s dig in.

### Guide to install Arch Linux using archinstall script

I would split this guide into three sections. First, download Arch Linux .ISO file, and create a disk to boot. Second is the actual installation, and finally, configuration with an example desktop.

#### Section 1: Download .ISO file

Visit the below link. Download the .ISO file of Arch Linux. You can go for a direct HTTP download or use torrent/magnet files.

[Download Arch Linux][2]

Once downloaded, create a bootable USB stick using [Etcher][3] or another utility.

Once done, plug in the USB stick and boot from it.

Before you begin the next section, ensure you are connected to the internet. In general, if you are in a wired network, you should be good. If you need to configure Wi-Fi via the command line in Arch – follow this guide. Just make sure you are connected to the internet.

#### Section 2: Install using archinstall

Once the boot is complete, you should see a prompt like the below. Type `archinstall` and hit enter.

![First prompt for archinstall][4]

The command will check for internet connectivity to the Arch Linux mirrors. And once done, a series of prompts (like this) will pop up. All you have to do is read and respond.

Ideally, you should follow the easy and basic options. Because if you are a new Arch Linux user, then it is recommended to use the basic options outlined below; probably next time, you can be more daring to experiment with other options.

Fair enough? Okay.

##### Section 2.1: Set up keyboard, layout and locale

On this screen, you can see the blue selection. You can navigate it via the keyboard and hit enter to set values. Once set, press escape.

Based on your download, some of the options would already be set up with defaults e.g. Locale=en_US. You can either keep them as it is or go ahead and change.

For my test system, here’s what I got as a first screen.

![First screen of archinstall][5]

So, the first question is about the **Keyboard Layout** type. It is shown by the two-byte country-specific layout codes. You can either keep the default or press enter to change it. For English-US, the keyboard layout would be “us”.

Keep the **mirror** region blank.

**Locale language** to be set as per your language of choice. I am keeping it as default for English US i.e. en_US.

Select locale **encoding** as UTF-8.

##### Section 2.2: Create partition, set mount points

Next up is the hard drive selection. Move the blue selector to Drive and hit enter.

The script auto-detects the available drives in your target system.

For example, the below image shows that 20 GB /dev/vda as the primary block device. That is where I am going to install the system. Select it and hit enter.

![Select target disk][6]

You should see the drive is selected with number 1. Next, select **Disk Layout** and hit enter.

The next screen is important. It is where you create the partition table for installation. You should see two options here. Either you manually create a partition (the first option), Or erase everything and install Arch (the second option).

![Either-you-create-partition-or-wipe-out-everything-from-your-disk][7]

If you are a beginner and installing a virtual machine, you may choose the **first option** (Wipe out…). Remember it will **delete everything** from your disk.

If you are not sure, select the second option (select what to do…).

Here, you have to create a partition, select layout, and then exit. Follow these chronologically.

![Follow these steps to create a partition][8]

Here’s a sample set of screens to create a partition.

![Creating a simple partition][9]

For this guide, I have created the following two partitions – boot and root for installation.

**Boot partition**

* type is fat32
* start at 3MB
* ends at 203MB
* mountpoint = /boot [via menu option: `assign mount point for a partition`]
* boot = True [via menu option: `Mark/unmark a partition as bootable`]
* Wipe = True [via menu option: `Mark/unmark a partition to be formatted`]

Repeat the above steps for the root partition.

**Root partition**

* type is ext4
* start at 206MB
* ends: 100%
* mountpoint = / [via menu option: `assign mount point for a partition`]
* Wipe = True [via menu option: `Mark/unmark a partition to be formatted`]

Final partition table may look like this:

![Final partition for this guide][10]

Select Save and Exit.

##### Section 2.3: Create an account and other stuff

Choose the following options for the next set of items.

| - | - |
| :- | :- |
| Bootloader | grub-install | 
| swap | True | 
| hostname | change it to something you like (I have used debugpoint) | 
| root password | set a root password | 
| user account | create an account with id and password to login to arch system |

In the **profile** option, you will have four options. Select desktop. Then choose your favourite desk environment (e.g. GNOME, KDE, Xfce etc..). Next is to choose the graphics driver. On this screen, if you know about your graphics card, you select NVIDIA or Intel. If you are not sure choose `"All open source (default)"` option.

![Select desktop environment while installing archlinux][11]

Select audio to **pipewire** (default) or pulseaudio.

Then select Kernel = `linux`. There are options such as linux-hardened, linux-zen and linux-lts. If you know what those means, then choose accordingly. If you are not sure choose the default kernel: `linux`.

You can also specify the **additional packages** to install if you know the package names. For this guide I have selected the below as additional packages.

```
firefox dhcpcd vlc net-tools xorg lightdm lightdm-gtk-greeter nano network-manager-applet
```

Choose Network configuration to **Network Manager**. Keep the rest of the items as default and finally hit **save configuration** **> Save all > save to /home**.

##### Section 2.4: Final installation

Hit **install** to start the installation process.

![archinstall started][12]

At this step, archinstall program will start downloading the packages for installation. After installation is complete, it would prompt you whether you want to log in to the chroot and do some maintenance before the final reboot.

![final maintenance using chroot][13]

You should say yes and log in to the chroot. And then make sure you enabled the display manager to get a login screen using the following set of commands:

```
systemctl enable lightdm
```

```
systemctl enable NetworkManager
```

Finally, reboot the system.

```
reboot
```

If you have followed the steps, then you should see a GRUB with an Arch Linux menu and a login screen to login.

#### Section 3 – Install additional desktop environments

After you install the base system/desktop using the above method, you can install any additional desktop environment such as GNOME, KDE Plasma, MATE – so on. We have several guides for each of them on the below pages. You can visit your choice of desktop installation page and jump straight to the bottom of these pages for exact command to install a desktop.

* [Xfce][14]
* [GNOME][15]
* [KDE Plasma][16]
* [Cinnamon][17]
* [LXQt][18]

For example, if you want to install GNOME Desktop with basic components, you can simply run the below command to install.

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

I believe, this is one of the impressive scripts that have been developed by the team. And it is definitely going to increase the coverage of Arch Linux with a growing user base.

Having trouble using this archinstall guide? Let me know in the comment section below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/archinstall-guide/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://github.com/archlinux/archinstall
[2]: https://archlinux.org/download/
[3]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[4]: https://www.debugpoint.com/wp-content/uploads/2022/01/image.png
[5]: https://www.debugpoint.com/wp-content/uploads/2022/01/First-screen-of-archinstall.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2022/01/Select-target-disk.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/09/Either-you-create-partition-or-wipe-out-everything-from-your-disk.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/01/Follow-these-steps-to-create-a-partition.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/01/Creating-a-simple-partition.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/01/Final-partition-for-this-guide.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/01/Select-desktop-environment-while-installing-archlinux.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/01/archinstall-started.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2022/01/final-maintenance-using-chroot.jpg
[14]: https://www.debugpoint.com/2020/12/xfce-arch-linux-install-4-16/
[15]: https://www.debugpoint.com/2020/12/gnome-arch-linux-install/
[16]: https://www.debugpoint.com/2021/01/kde-plasma-arch-linux-install/
[17]: https://www.debugpoint.com/2021/02/cinnamon-arch-linux-install/
[18]: https://www.debugpoint.com/2020/12/lxqt-arch-linux-install/
