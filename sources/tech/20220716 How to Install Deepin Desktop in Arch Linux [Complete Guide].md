[#]: subject: "How to Install Deepin Desktop in Arch Linux [Complete Guide]"
[#]: via: "https://www.debugpoint.com/deepin-arch-linux-install-20/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Deepin Desktop in Arch Linux [Complete Guide]
======
In this guide, we explain the steps required to install the beautiful Deepin Desktop in Arch Linux.

The first part of the guide explains the steps for installing the base Arch system. The second part is installing the complete Deepin desktop on top of Arch Linux.

### What is the Deepin Desktop?

[Deepin][1] is a feature-rich and beautiful desktop environment based on Debian stable branch. Deepin desktop is a homegrown desktop environment by Deepin. It is powered by its own `dde-kwin` Window manager. Deepin desktop comes with nice looking dock and many native Deepin applications pre-loaded.

This eye candy desktop environment is [available in the Arch repository][2]; this is how you can install Deepin Desktop Environment in Arch Linux.

This guide installs Deepin 20.1 Desktop Environment. However, the steps should be similar for other versions as well.

### Install Deepin Desktop in Arch Linux

#### Part 1: Install Arch Linux

If you have already Arch Linux installed, you can skip this step and directly go to the install Deepin Desktop section .

For a quick Arch Linux base installation, follow the below steps. You can also visit [this guide][3] for a complete tutorial on installing Arch Linux as Dual Boot or on a virtual machine.

##### Download Arch Linux

Download Arch Linux .iso from the below link. There are magnet and torrent links available. Once you download it, write the ISO to a USB drive. And then boot from the drive.

[Download Arch Linux][4]

If you are planning to install it as a virtual machine image via [GNOME Boxes][5], [virt-manager][6] – then you do not need to write it to a USB drive.

##### Boot and Configure Partitions

After you boot from the Arch Linux iso, you have to run a series of commands to install the base system.

First, run the below command to find out the device identifier.

```
fdisk -l
```

![fdisk -l before][7]

Then with the device identifier, run the below command to start partitioning your disk. Make sure to change `/dev/sda` as per your system.

```
cfdisk /dev/sda
```

Select `label type = dos` the next prompt.

Select the free space and choose the option NEW from the bottom. In this example, I will create three partitions as per below.

```
/dev/sda1 - 1G - for /boot/dev/sda2 - 5G - for root/dev/sda3 - 1G - for swap
```

![cfdisk][8]

In the next screen, provide the partition size for the boot partition (for this example, I gave 1 GB). Select it as the primary partition.

Repeat the same step for the main root partition of size 5GB.

![Swap partition type change][9]

Create a swap partition using the same steps with size 1G (you may change it as per your need). After you create the swap partition, make sure to choose Type at the bottom and mark it as a swap with the option “Linux Swap/Solaris”.

![final partition list in cfdisk][10]

Once done, write the changes to the disk using the Write option at the bottom. Make sure you take a backup before you write, as this is a permanent change in your system.

Run the below command to check before you proceed. You can see in this example, that three partitions are listed.

```
fdisk -l
```

![final partition list in fdisk][11]

Run the following commands in sequence to format and create an ext4 file system in the newly created partition above. Make sure you change the /dev/sda1 and /dev/sda2 as per your need.

```
mkfs.ext4 /dev/sda1mkfs.ext4 /dev/sda2mkswap /dev/sda3swapon /dev/sda3
```

After completion, mount the system and create the necessary directories.

```
mount /dev/sda2 /mntmkdir /mnt/boot /mnt/var /mnt/homemount /dev/sda1 /mnt/boot
```

Again, make sure you change /dev/sda1, /dev/sda2 and /dev/sda3 as per your system.

![prepare file system][12]

##### Install the base system

I hope you are already connected to the internet. If not, try using a USB dongle or wired internet connection which the Arch installer automatically configures and detect. If you do not have a wired connection available, follow this guide to configure a wireless or wifi network using the Arch Linux installer.

Run the below commands in sequence to install the base system in the mounted partition. The download size is approx 400 MB.

```
pacman -Syypacstrap /mnt base base-devel linux linux-firmware nano dhcpcd net-tools grub
```

![Install base system][13]

Once complete, generate a file system table without which you can’t boot the system.

```
genfstab -U /mnt >> /mnt/etc/fstab
```

##### Configure the base system

Follow the below commands in sequence to configure the base system. This involves setting up your locale and language, adding a login user, and setting up the internet.

```
arch-chroot /mntnano /etc/locale.gen
```

Uncomment the locale of your choice by removing # at the beginning. For this guide, I have chosen en_US.UTF-8 UTF-8. Press CTRL+O, Enter, and CTRL+X to exit from nano.

![change locale][14]

Generate the locale using:

```
locale-gen
```

Set up the language using the below command.

```
echo LANG=en_US.UTF-8 > /etc/locale.confexport LANG=en_US.UTF-8
```

Set up the local time zone.

```
ln -s /usr/share/zoneinfo/America/New_York /etc/localtime
```

Again, you can choose them as per your need. You can list the local time zones via the below commands.

```
ls /usr/share/zoneinfo
ls /usr/share/zoneinfo/America
```

Set up the hardware clock, create a hostname and enable the DHCP for the internet using the below commands in sequence. You can change `"arindam-pc"` to any hostname as per your desire.

```
hwclock --systohc --utc
echo debugpoint-pc > /etc/hostname
systemctl enable dhcpcd
```

The next step is to set up the root user password, create an admin user, and add the user to the sudoers file.

Follow the below commands in sequence. Make sure to change the user name `debugpoint` to something else as per your need.

```
passwd rootuseradd -m -g users -G wheel -s /bin/bash debugpointpasswd debugpoint
```

![create user][15]

Open the sudoers file and add the below lines.

```
nano /etc/sudoers
```

Add the below lines. As you already created the root user, the entry should be there.

```
root ALL=(ALL) ALLdebugpoint ALL=(ALL) ALL
```

![update sudoers file][16]

Install grub, set up the initial ramdisk environment, and unmount the system using the below commands.

```
grub-install /dev/sdagrub-mkconfig -o /boot/grub/grub.cfgmkinitcpio -p linuxexit
```

![configure grub][17]

Then reboot your system.

```
umount /mnt/bootumount /mntreboot
```

You have now successfully installed the Arch Linux base system. It’s time to install the complete Deepin desktop.

#### Part 2: Install Deepin Desktop in Arch Linux

After reboot, choose Arch Linux from grub. In the Arch Linux prompt, start running the following commands in sequence. These commands install the Xorg server, lightdm display manager and Deepin desktop components.

For all the commands, use default as package versions, i.e. press enter when asked.

* Install Xorg and display manager. Approx install size is 80 MB.

```
sudo pacman -S --needed xorg lightdm
```

* Install additional components and applications (approx 550 MB)

```
sudo pacman -S --needed deepin deepin-extra
```

After the installation, enable the Deepin greeter by modifying the lightdm configuration file. Follow the below commands.

```
nano /etc/lightdm/lightdm.conf
```

And add the below line. Save the file (CTRL+O, CTRL+X).

```
greeter-session=lightdm-deepin-greeter
```

![add deepin-greeter in lightdm login - install Deepin desktop in Arch Linux][18]

Now it’s time to enable the display manager and network manager as service. So that next time you log on, they can run automatically by systemd.

```
systemctl enable lightdm
systemctl enable NetworkManager
```

![Enable lightdm and network][19]

Reboot the system using the reboot command.

```
reboot
```

If all goes well, you should see the Deepin desktop login prompt. Login using the credentials you just created in the above steps. You should be greeted with the latest Deepin desktop environment.

![Deepin 20.1 Login screen in Arch Linux][20]

![Deepin Desktop 20.1 in Arch Linux][21]

### Wrapping Up

I hope this guide helped you to install the Deepin desktop in Arch Linux. Although it is not my daily driver, I feel Deepin’s desktop is somewhat slow in nature. Probably because of too much colour rendering and animation and not properly optimized by `dde-desktop` despite it being built on Qt.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/deepin-arch-linux-install-20/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/2020/09/deepin-20-review/
[2]: https://archlinux.org/groups/x86_64/deepin/
[3]: https://www.debugpoint.com/2020/11/install-arch-linux/
[4]: https://www.archlinux.org/download/
[5]: https://www.debugpoint.com/2020/05/install-use-gnome-boxes/
[6]: https://www.debugpoint.com/2020/11/virt-manager/
[7]: https://www.debugpoint.com/wp-content/uploads/2020/12/fdisk-l-before.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2020/12/cfdisk-1024x159.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2020/12/Swap-parition-type-change.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2020/12/final-partition-list-in-cfdisk-1024x178.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2020/12/final-partition-list-in-fdisk.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2020/12/prepare-file-system.jpg
[13]: https://www.debugpoint.com/wp-content/uploads/2020/12/Install-base-system-1024x205.jpg
[14]: https://www.debugpoint.com/wp-content/uploads/2020/12/change-locale.jpg
[15]: https://www.debugpoint.com/wp-content/uploads/2020/12/create-user.jpg
[16]: https://www.debugpoint.com/wp-content/uploads/2020/12/update-sudoers-file.jpg
[17]: https://www.debugpoint.com/wp-content/uploads/2020/12/configure-grub-1024x639.jpg
[18]: https://www.debugpoint.com/wp-content/uploads/2021/01/add-deepin-greeter-in-lightdm-login.jpg
[19]: https://www.debugpoint.com/wp-content/uploads/2020/12/Enable-lightdm-and-network-Install-Xfce-Desktop-in-Arch-Linux.jpg
[20]: https://www.debugpoint.com/wp-content/uploads/2021/01/Deepin-20.1-Login-screen-in-Arch-Linux-1024x771.jpg
[21]: https://www.debugpoint.com/wp-content/uploads/2021/01/Deepin-Desktop-20.1-in-Arch-Linux-1024x770.jpg
