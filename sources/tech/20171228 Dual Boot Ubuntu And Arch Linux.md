Dual Boot Ubuntu And Arch Linux
======
![](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/dual-boot-ubuntu-and-arch-linux_orig.jpg)

**Dual booting Ubuntu and Arch Linux** is not as easy as it sounds, however, I’ll make the process as easy as possible with much clarity. First, we will need to install Ubuntu then Arch Linux since it's much easier configuring the Ubuntu grub to be able to **dual boot Ubuntu and Arch Linux**

### Dual Boot Ubuntu And Arch Linux

Some of the things you will need:

1.  Ubuntu flavor of your choice, in this case, I’ll use ubuntu 17.10 iso

2.  2 USB sticks

3.  Windows PC or Linux based PC

4.  Arch Linux iso

5.  Rufus(for windows) or etcher(for Linux distro)

### ​Install Ubuntu 16.10

​First, [create a bootable flash drive][1] using Rufus for both Ubuntu and Arch Linux. Alternatively, you could use etcher to create bootable flash drives for both Ubuntu and Arch Linux.

 [![bootable ubuntu usb etcher image writer](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/bootable-ubuntu-usb-etcher-image-writer_orig.jpg)][2] 

Select the ISO image file for Ubuntu then select the flash drive of your choice after which click flash to create the bootable flash drive. Wait till it completes and Voila! Your bootable flash drive is ready for use.

 [![make ubuntu usb bootable in linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/make-ubuntu-usb-bootable-in-linux_orig.jpg)][3] 

​Turn on your machine and boot using the bootable flash drive with the Ubuntu installation media. Ensure that you boot into UEFI or BIOS compatibility mode depending on the type of PC you are using. I prefer using UEFI for a newer PC builds.

 [![live ubuntu boot](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/live-ubuntu-boot_orig.jpg)][4] 

​Upon Successful boot, you will see the following screen asking you to try Ubuntu or install Ubuntu. Choose install Ubuntu.

 [![install usb from live usb](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-usb-from-live-usb_orig.jpg)][5] 

​Then check install third-party software for graphics and Wifi hardware, MP3 and other media. Optionally if you have an internet connection choose download updates while installing Ubuntu since it will save time setting up the installation as well as ensure you get the latest updates of your installation.

 [![custom partition hd install ubuntu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/custom-partition-hd-install-ubuntu_orig.jpg)][6] 

​Then choose ‘Something else’ so that we can partition the hard disk and set aside space for swap, Ubuntu, and Archlinux.

 [![create swap partition ubuntu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-swap-partition-ubuntu_orig.jpg)][7] 

​Create a swap area partition. Preferably half the size of the ram. In my case, I have 1GB of ram thus 512mb of swap area space.

 [![install ubuntu root partition](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-ubuntu-root-partition_orig.jpg)][8] 

​Then create a partition with mount point ‘/’. Then click the install now button.

 [![select ubuntu timezone](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/select-ubuntu-timezone_orig.jpg)][9] 

Choose your location then choose language and keyboard settings.

 [![select ubuntu keyboard layout](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-ubuntu-select-location-keyboard-layout_orig.jpg)][10] 

​Then create the user credentials that will create a new user.

 [![create username, system name ubuntu install](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-username-system-name-ubuntu-install_orig.jpg)][11] 

​The installation will now start by clicking next.

 [![ubuntu installation finishing](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ubuntu-installation-finishing_orig.jpg)][12] 

​When the installation is done click on restart PC.

 [![ubuntu installation finished restart system](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ubuntu-installation-finished_orig.jpg)][13] 

​Remove the installation media and press enter when done.

 [![remove installation media after ubuntu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/remove-installation-media-after-ubuntu_orig.jpg)][14] 

​Upon confirmation of successful installation, restart and boot into the Arch Linux installation media.

### ​Install Arch Linux

​Upon booting into the

**Arch Linux installation media**

you should see an initial screen as follows. Choose Boot Arch Linux(x86_64). Note Arch Linux is a more of

[DYF][15]

(do it yourself) kind of Operating system.  

 [![arch linux installation boot menu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-installation-boot-menu_orig.jpg)][16] 

After choosing, it will open a tty1 terminal that you will use to install the operating system.

 [![arch linux tty1 linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-tty1-linux_orig.png)][17] Note: You will need an internet connection to download some packages in order to install Arch Linux successfully. So we need to check if the internet is working fine. Enter the following into the terminal to check internet connectivity.

ping linuxandubuntu.com -c 4

 [![arch linux ping check internet connection](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-ping-check-internet-connection_orig.png)][18] 

​If the internet is working fine you should get an echo back showing the number of packets sent and received. In this case, we sent 4 echos and got 4 back meaning the connection is good.

If you want to setup Wifi in Arch Linux, read this post

[here][19]

on setting up Wifi in Arch Linux.

​Next, we need to select the partition that’s free that we had earlier set aside while installing Ubuntu.

fdisk -l

​The above should show you the available disks that are there. You should see the Ubuntu partitions as well as the free space. We will use cfdisk to partition.

cfdisk

 [![install arch partition disk with cfdisk](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-partition-disk-with-cfdisk_orig.png)][20] 

You will see the partitions. Select the free space that is below the other allocated partitions.

​You will need to select new and then enter the partition size for the partition.

 [![partition free space swap arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/partition-free-space-swap-arch-linux_orig.png)][21] Use for example 9.3G - G representing gigabytes. [![install arch linux partition](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-linux-partition_orig.png)][22] 

Make the partition primary as below.

 [![make arch linux root as primary partition](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/make-arch-linux-root-as-primary-partition_orig.png)][23] Then choose the write partition entry. [![select partition to install arch](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/select-partition-to-install-arch_orig.png)][24] 

​Type ‘yes’ to confirm the writing of the partition.

 [![install arch linux confirm create partition](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-linux-confirm-create-partition_orig.png)][25] 

Then choose the quit option.

 [![quit cfdisk arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/quit-cfdisk-arch-linux_orig.png)][26] Then type:

fdisk -l

​To confirm the changes

 [![confirm partition changes](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/confirm-partition-changes_orig.png)][27] 

​Then partition the disk using:

mkfs.ext4 /dev/sda3

​Make sure the partition you choose is the last one that we created so that we don’t mess with the Ubuntu partition.

 [![complete arch linux installation partition](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/complete-arch-linux-installation-partition_orig.png)][28] 

​Then mount it to using the following command -

mount /dev/sda3 /mnt

 [![mount base partition in arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/mount-base-partition-in-arch-linux.png?1514472693)][29] 

​Make a home directory using:

mkdir .mnt/home

 [![mount home partition arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/mount-home-partition-arch-linux.png?1514472866)][30] 

​Mount the home folder to the partition using

mount /dev/sda3 /mnt/home

 [![make mount home directory](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/make-mount-home-directory.png?1514472960)][31] 

​Now install the base system of Archlinux using the command:

pacstrap /mnt base

Make sure you have an internet connection.

​

It should take a while to download and set it up depending on the internet speed you have.

 [![install arch linux base](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/install-arch-linux-base.png?1514473056)][32] 

After the step is complete, the Archlinux base installation is completed.

After installing the Arch Linux base, create a fstab file using the command:

genfstab -U /mnt >> /mnt/etc/fstab

 [![create fstab in arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/create-fstab-file-in-arch-linux.png?1514473226)][33] 

​After that you need to verify the fstab file entries using:

cat /mnt/etc/fstab

 [![cat fstab file data terminal](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/cat-fstab-file-data-terminal.png?1514473304)][34] 

### ​Configuring Arch Linux: the basic configuration

You will need to configure the following upon installation:

1.  The system language and the system locales

2.  The system timezones

3.  Root user password

4.  Set a hostname

Firstly, you will need to switch to the newly installed base by changing root into the system using the command:

arch-chroot /mnt

#### The system Language and the system locale

You will then have to configure the system language. You will have to uncomment en_UTF-8 UTF-8 and the localization you need in /etc/local.gen

Type:

nano /etc/local.gen

Then uncomment the en_UTF-8 UTF-8

Then type:

locale-gen

To generate the localization settings as follows:

 [![generate localization arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/generate-localization-arch-linux.png?1514473406)][35] You will need to set the LANG variable in locale.conf  accordingly, for example:

nano /etc/locale.conf

​Then change to:

LANG=en_US.UTF-8

If you set the keyboard layout, make the changes persistent in vconsole.conf:

nano /etc/vconsole.conf

​Then change to:

KEYMAP=us-eng

#### 2\. The system timezones

​You will need to set the time zone using

ln -sf /usr/share/zoneinfo/Region/City /etc/localtime

To see the available time zones, you can use the following command in the terminal:

Note region is shown in blue below in the screenshot:

ls /usr/share/zoneinfo

 [![setup zonefile in arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/setup-zonefile-in-arch-linux.png?1514473483)][36]  [![setup country zonefile](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/setup-country-zonefile_orig.png)][37] Run hwclock command as follows to generate /etc/adjtime(assumes the hardware clock is set to UTC.):

# hwclock --systohc

#### 3\. Root password

​To set a new password for the Arch Linux installation set root password using:

Passwd

​Supply a new password and confirm the password to set the root password.

 [![setup arch linux root password](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/setup-arch-linux-root-password.png?1514473649)][38] 

#### 4\. Set a hostname and configure network

​You will need to create the hostname file:

nano /etc/hostname

 [![set arch linux hostname](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/set-arch-linux-hostname.png?1514473741)][39] 

Change the name to your username:

 [![set arch linux username](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/set-arch-linux-username.png?1514473822)][40] Then add a matching entry to hosts:

nano /etc/hosts

127.0.0.1 localhost.localdomain localhost

::1 localhost.localdomain localhost

127.0.1.1 LinuxandUbuntu.localdomain LinuxandUbuntu

​

You will need to make the network connections persistent thus use:

systemctl enable dhcpd

#### Grub configuration

Then reboot the machine and enter into Ubuntu to configure the grub.

You will type:

reboot

 [![reboot system after arch linux installation](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/reboot-system-after-arch-linux-installation.png?1514474180)][41] 

The Arch Linux installation still doesn’t appear therefore we need to install it using update-grub in ubuntu.

 [![ubuntu grub menu](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/published/ubuntu-grub-menu.png?1514474302)][42] Open a terminal in Ubuntu and type:

sudo update-grub

It should update the grub to include Arch Linux.

### Conclusion

Congratulations you have successfully set up Ubuntu and Arch Linux to dual boot. The Ubuntu installation is easy but the Arch Linux installation is a challenge for new Linux users. I tried making this tutorial as simple as it can be. But if you have any question on the article, let me know in the comment section below. Also share this article with your friends and help them learn Linux.

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/dual-boot-ubuntu-and-arch-linux

作者：[LinuxAndUbuntu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com
[1]:http://www.linuxandubuntu.com/home/etcher-burn-images-to-sd-card-make-bootable-usb
[2]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/bootable-ubuntu-usb-etcher-image-writer_orig.jpg
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/make-ubuntu-usb-bootable-in-linux_orig.jpg
[4]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/live-ubuntu-boot_orig.jpg
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-usb-from-live-usb_orig.jpg
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/custom-partition-hd-install-ubuntu_orig.jpg
[7]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-swap-partition-ubuntu_orig.jpg
[8]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-ubuntu-root-partition_orig.jpg
[9]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/select-ubuntu-timezone_orig.jpg
[10]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-ubuntu-select-location-keyboard-layout_orig.jpg
[11]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/create-username-system-name-ubuntu-install_orig.jpg
[12]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ubuntu-installation-finishing_orig.jpg
[13]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ubuntu-installation-finished_orig.jpg
[14]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/remove-installation-media-after-ubuntu_orig.jpg
[15]:http://www.linuxandubuntu.com/home/arch-linux-take-your-linux-knowledge-to-next-level-review
[16]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-installation-boot-menu_orig.jpg
[17]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-tty1-linux_orig.png
[18]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-linux-ping-check-internet-connection_orig.png
[19]:http://www.linuxandubuntu.com/home/how-to-setup-a-wifi-in-arch-linux-using-terminal
[20]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-partition-disk-with-cfdisk_orig.png
[21]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/partition-free-space-swap-arch-linux_orig.png
[22]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-linux-partition_orig.png
[23]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/make-arch-linux-root-as-primary-partition_orig.png
[24]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/select-partition-to-install-arch_orig.png
[25]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/install-arch-linux-confirm-create-partition_orig.png
[26]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/quit-cfdisk-arch-linux_orig.png
[27]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/confirm-partition-changes_orig.png
[28]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/complete-arch-linux-installation-partition_orig.png
[29]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/mount-base-partition-in-arch-linux.png
[30]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/mount-home-partition-arch-linux.png
[31]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/make-mount-home-directory.png
[32]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/install-arch-linux-base.png
[33]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/create-fstab-file-in-arch-linux.png
[34]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/cat-fstab-file-data-terminal.png
[35]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/generate-localization-arch-linux.png
[36]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/setup-zonefile-in-arch-linux.png
[37]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/setup-country-zonefile_orig.png
[38]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/setup-arch-linux-root-password.png
[39]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/set-arch-linux-hostname.png
[40]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/set-arch-linux-username.png
[41]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/reboot-system-after-arch-linux-installation.png
[42]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edited/ubuntu-grub-menu.png
