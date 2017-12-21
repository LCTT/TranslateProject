如何安装 Arch Linux [详细安装步骤指导]
======
**简要说明：这一教程会教你如何用简单步骤安装Arch Linux.**

[Arch Linux][1] 是一个在喜欢自己定制Linux系统和Linux 爱好者

[Arch Linux][1] is a x86-64 general-purpose Linux distribution which has been popular among the [DIY][2] enthusiasts and hardcore Linux users. The default installation covers only a minimal base system and expects the end user to configure and use it. Based on the KISS - Keep It Simple, Stupid! principle, Arch Linux focus on elegance, code correctness, minimalist system and simplicity.

Arch Linux supports the Rolling release model and has its own package manager - [pacman][3]. With the aim to provide a cutting-edge operating system, Arch never misses out to have an up-to-date repository. The fact that it provides a minimal base system gives you a choice to install it even on low-end hardware and then install only the required packages over it.

Also, its one of the most popular OS for learning Linux from scratch. If you like to experiment with a DIY attitude, you should give Arch Linux a try. It's what many Linux users consider a core Linux experience.

In this article, we will see how to install and set up Arch Linux and then a desktop environment over it.

## How to install Arch Linux

![How to install Arch Linux][4]

![How to install Arch Linux][5]

The method we are going to discuss here **wipes out existing operating system** (s) from your computer and install Arch Linux on it. So if you are going to follow this tutorial, make sure that you have backed up your files or else you'll lose all of it. You have been warned.

But before we see how to install Arch Linux from a USB, please make sure that you have the following requirements:

### Requirements for installing Arch Linux:

  * A x86_64 (i.e. 64 bit) compatible machine
  * Minimum 512 MB of RAM (recommended 2 GB)
  * At least 1 GB of free disk space (recommended 20 GB for basic usage)
  * An active internet connection
  * A USB drive with minimum 2 GB of storage capacity
  * Familiarity with Linux command line



Once you have made sure that you have all the requirements, let's proceed to install Arch Linux.

### Step 1: Download the ISO

You can download the ISO from the [official website][6]. Arch Linux requires a x86_64 (i.e. 64 bit) compatible machine with a minimum of 512 MB RAM and 800 MB disk space for a minimal installation. However, it is recommended to have 2 GB of RAM and at least 20 GB of storage for a GUI to work without hassle.

### Step 2: Create a live USB of Arch Linux

We will have to create a live USB of Arch Linux from the ISO you just downloaded.

If you are on Linux, you can use **dd command** to create a live USB. Replace /path/to/archlinux.iso with the path where you have downloaded ISO file, and /dev/sdx with your drive in the example below. You can get your drive information using [lsblk][7] command.
```
dd bs=4M if=/path/to/archlinux.iso of=/dev/sdx status=progress && sync
```

On Windows, there are several tools to create a live USB. The recommended tool is Rufus. We have already covered a tutorial on [how to create a live USB of Antergos Linux using Rufus][8] in the past. Since Antergos is based on Arch, you can follow the same tutorial.

### Step 3: Boot from the live USB

Once you have created a live USB for Arch Linux, shut down your PC. Plugin your USB and boot your system. While booting keep pressing F2, F10 or F1dependinging upon your system) to go into boot settings. In here, select to boot from USB or removable disk.

Once you select that, you should see an option like this:

![Arch Linux][4]

![Arch Linux][9]  
Select Boot Arch Linux (x86_64). After various checks, Arch Linux will boot to login prompt with root user. 

Select Boot Arch Linux (x86_64). After various checks, Arch Linux will boot to login prompt with root user.

Next steps include partitioning disk, creating the filesystem and mounting it.

### Step 4: Partitioning the disks

The first step includes partitioning your hard disk. A single root partition is the simplest one where we will create a root partition (/), a swapfile and home partition.

I have a 19 GB disk where I want to install Arch Linux. To create a disk, type
```
fdisk /dev/sda
```

Type "n" for a new partition. Type in "p" for a primary partition and select the partition number.

The First sector is automatically selected and you just need to press Enter. For Last sector, type the size you want to allocate for this partition.

Create two more partitions similarly for home and swap, and press 'w' to save the changes and exit.

![root partition][4]

![root partition][10]

### Step 4: Creating filesystem

Since we have created 3 different partitions, the next step is to format the partition and create a filesystem.

We will use mkfs for root and home partition and mkswap for creating swap space. We are formatting our disk with ext4 filesystem.
```
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda3

mkswap /dev/sda2
swapon /dev/sda2
```

Lets mount these filesystems to root and home
```
mount /dev/sda1 /mnt
mkdir /mnt/home
mount /dev/sda3 /mnt/home
```

### Step 5: Installation

Since we have created partitioning and mounted it, let's install the base package. A base package contains all the necessary package to run a system, some of which are the GNU BASH shell, data compression tool, file system utilities, C library, compression tools, Linux kernels and modules, library packages, system utilities, USB devices utilities, vi text editor etc.
```
pacstrap /mnt base base-devel
```

### **Step 6: Configuring the system**

Generate a fstab file to define how disk partitions, block devices or remote file systems are mounted into the filesystem.
```
genfstab -U /mnt >> /mnt/etc/fstab
```

Change root into the new system, this allows changing the root directory for the current running process and the child process.
```
arch-chroot /mnt
```

Some systemd tools which require an active dbus connection can not be used inside a chroot, hence it would be better if we exit from it. To exit chroot, simpy use the below command:
```
exit
```

### Step 7. Setting Timezone

Use below command to set the time zone.
```
ln -sf /usr/share/<zoneinfo>/<Region>/<City> /etc/localtime
```

To get a list of zone, type
```
ls /usr/share/zoneinfo
```

Run hwclock to set the hardware clock.
```
hwclock --systohc --utc
```

### Step 8. Setting up Locale.

File /etc/locale.gen contains all the local settings and system language in a commented format. Open the file using vi editor and un-comment the language you prefer. I had done it for **en_GB.UTF-8**.

Now generate the locale config in /etc directory file using the commands below:
```
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
export LANG=en_GB.UTF-8
```

### Step 9. Installing bootloader, setting up hostname and root password

Create a /etc/hostname file and add a matching entry to host.

127.0.1.1 myhostname.localdomain myhostname

I am adding ItsFossArch as a hostname:
```
echo ItsFossArch > /etc/hostname
```

and then to the /etc/hosts file.

To install a bootloader use below commands :
```
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

To create root password, type
```
passwd
```

and enter your desired password.

Once done, update your system. Chances are that you already have an updated system since you have downloaded the latest ISO file.
```
pacman -Syu
```

Congratulations! You have successfully installed a minimal command line Arch Linux.

In the next step, we will see how to set up a desktop environment or Graphical User Interface for the Arch Linux. I am a big fan of GNOME desktop environment, and we will be working on installing the same.

### Step 10: Install a desktop environment (GNOME in this case)

Before you can install a desktop environment, you will need to configure the network first.

You can see the interface name with below command:
```
ip link
```

![][4]

![][11]

For me, it's **enp0s3.**

Add the following entries in the file
```
vi /etc/systemd/network/enp0s3.network

[Match]
name=en*
[Network]
DHCP=yes
```

Save and exit. Restart your systemd network for the changes to reflect.
```
systemctl restart systemd-networkd
systemctl enable systemd-networkd
```

And then add the below two entries in /etc/resolv.conf file.
```
nameserver 8.8.8.8
nameserver 8.8.4.4
```

Next step is to install X environment.

Type the below command to install the Xorg as display server.
```
pacman -S xorg xorg-server
```

gnome contains the base GNOME desktop. gnome-extra contains GNOME applications, archive manager, disk manager, text editors and more.
```
pacman -S gnome gnome-extra
```

The last step includes enabling the display manager GDM for Arch.
```
systemctl start gdm.service
systemctl enable gdm.service
```

Restart your system and you can see the GNOME login screen.

## Final Words on Arch Linux installation

A similar approach has been demonstrated in this video (watch in full screen to see the commands) by It's FOSS reader Gonzalo Tormo:

You might have realized by now that installing Arch Linux is not as easy as [installing Ubuntu][12]. However, with a little patience, you can surely accomplish it and then tell the world that you use Arch Linux.

Arch Linux installation itself provides a great deal of learning. And once you have installed it, I recommend referring to its comprehensive [wiki][13] where you can find steps to install various other desktop environments and learn more about the OS. You can keep playing with it and see how powerful Arch is.

Let us know in the comments if you face any difficulty while installing Arch Linux.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-arch-linux/

作者：[Ambarish Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://itsfoss.com/author/ambarish/
[1] https://www.archlinux.org/
[2] https://en.wikipedia.org/wiki/Do_it_yourself
[3] https://wiki.archlinux.org/index.php/pacman
[4] data:image/gif;base64,R0lGODdhAQABAPAAAP///wAAACwAAAAAAQABAEACAkQBADs=
[5] https://itsfoss.com/wp-content/uploads/2017/12/install-arch-linux-featured-800x450.png
[6] https://www.archlinux.org/download/
[7] https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/deployment_guide/s1-sysinfo-filesystems
[8] https://itsfoss.com/live-usb-antergos/
[9] https://itsfoss.com/wp-content/uploads/2017/11/1-2.jpg
[10] https://itsfoss.com/wp-content/uploads/2017/11/4-root-partition.png
[11] https://itsfoss.com/wp-content/uploads/2017/12/11.png
[12] https://itsfoss.com/install-ubuntu-1404-dual-boot-mode-windows-8-81-uefi/
[13] https://wiki.archlinux.org/
