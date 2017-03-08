How to install Arch Linux on VirtualBox
============================================================

### On this page

1.  [Arch Linux Repositories][8]
2.  [Install Arch Linux on Virtual Box][9]
    1.  [Download Arch Linux][1]
    2.  [Initializing Installation with Oracle VM VirtualBox Manager][2]
    3.  [Partition the hard disk][3]
    4.  [Bootstrap Arch Linux][4]
    5.  [Setup hostname and networking][5]
    6.  [Install the Bootloader][6]
    7.  [Boot into the installed ArchLinux operating system][7]

Arch Linux is a Linux-based operating system that is designed for i689 and 86-64 computers. Its unique package manager is responsible for providing updates to the latest software applications using “pacman” with complete tracking. Pacman is the package manager that is used to install, update, and remove the software packages. It is designed entirely for free and open-source software, along with the support from the Linux community.

Arch Linux is also popular for having a comprehensive documentation in form of the community wiki known as ArchWiki. This Linux operating system is based on binary packages that are targeted for i832, 64-bit, and 32-bit systems and optimized for the best performance on the modern hardware systems.

You can install Arch Linux directly to your home computer by following this guide but you can also install it on a virtual machine on your Windows computer by using VirtualBox.

### Arch Linux Repositories

To install Arch Linux on Virtual Box, you must know the basic repositories of this Linux-based operating system. A repository is a storage location from where the software packages are retrieved during the installation process. There are multiple repositories available for Arch Linux, which are accessible via pacman and maintained by package maintainers. Here is a list of some of the basic repositories used to install Arch Linux on Virtual Box:

*   The **core **repository contains all the packages that are needed to setup the base system like booting Arch Linux, and building packages.

*   The **extra **repository contains extra packages that do not fit in the core involving desktop environment.

*   The **community **repositoryhas packages that are adopted by trusted Linux community users, and most of them will transfer to the core or extra repository.

*   The **Multilib **repository contains 32-bit software and libraries for 32-bit application installation on 64-bit system.

*   The **testing **repository contains packages that are destined for core or extra repositories.

*   The **community-testing** repository is for the Linux community.

*   The **multilib testing **repositoryis similar to the testing repository, but for multilib candidates.

*   The **gnome-unstable **repository has the latest GNOME desktop environment.

*   The **kde-unstable **repository contains the latest KDE software before they are been released.

### Install Arch Linux on Virtual Box

### Download Arch Linux

To install Arch Linux on Virtual Box, you must have the latest Arch Linux version that you can download from their [official website][10]. You can pick either the direct download option or torrent download, which is on a secure server. Before the installation, make sure you have 20 MB of free disk space and 1 GB of RAM in your system.

[
 ![Download Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/1212.png) 
][11]

### Initializing Installation with Oracle VM VirtualBox Manager

Open the Oracle VM VirtualBox manager, click on new, and type in the name of the new operating system you want to create; in this case, it is Arch Linux. The system will automatically pick up the type and version of the Arch Linux, based on your system’s configuration. Click on  _next_ .

[
 ![Open VirtualBox](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12121.png) 
][12]

Allocate the desired  RAM size to your new operating system, which is ideally 1024 MB. Click on  _next _ and then click on  _create_ , to create a virtual disk now.

[
 ![Set RAM size](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12122.png) 
][13]

On the nextpage, you will be asked to select the type of hard disk file you want for your new operating system. Select VirtualBox Disk Image usually.

[
 ![Select disk file type](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12123.png) 
][14]

Choose dynamically allocated and click  _next_ .

[
 ![Allocate disk space dynamically](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12124.png) 
][15]

Allocate 20 GB hard disk file location and size.

[
 ![Choose a hard disk size of 20GB](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12125.png) 
][16]

Now you can see that your Arch Linux operating system is created. Now you can click  _start_ .

[
 ![Start the Virtual Machine](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12126.png) 
][17]

Click on 'browser' and select the startup disk, which you downloaded from the Arch Linux official website.

[
 ![Choose Arch Linux Disk image](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12127.png) 
][18]

[
 ![Browse for disk image file](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12128.png) 
][19]

Click on  _start_  and then open the full-screen view.

[
 ![Open the full-screen view](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12129.png) 
][20]

[
 ![Start the Arch Linux VM](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121210.png) 
][21]

### **Booting to Install Arch Linux on Virtual Box**

You will see the first opening page of Arch Linux. Click on “Boot Arch Linux (x86_64), which is for 64-bit or click on “Boot Arch Linux (i686)”, which is for 32-bit.

[
 ![Choose to boot Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121211.png) 
][22]

As soon as you click on the first option, the system will start booting. While it completes the temporary boot, we are basically moving into the live version and are logged in as root user.

[
 ![Booting into Arch Linux live version](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121212.png) 
][23]

Check the Internet connection by typing in the following command.

 _ping google.com_ 

The word ping stands for packet internet gopher. You will soon see the response that means Arch Linux has activated the Internet connection. This is essential to perform certain installation steps.

[
 ![Test internet connectivity with ping](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121213.png) 
][24]

Clear the command by typing

 _clear_ 

Before we start the installation, you should partition your drive. Type  _# fdisk – 1 _ and you will see the current system’s disk partition. Focus on the 20 GB hard drives that you allocated to Arch in the beginning.

[
 ![Partition the harddisk](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121214.png) 
][25]

### Partition the hard disk

We are going to partition this 20 GB space into three partitions. The first one is the primary root partition that will be of 10 GB. The second will be the swap partition, which will be twice the initial RAM allocation that will be 2048 MB. The third will be the logical partition that will be 8 GB allocated.

[
 ![Create 3 disk partitions](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121215.png) 
][26]

Type the command:

 _cfdisk_ 

 You will see gpt, dos, sgi, and sun. Select the  _dos _ option and press  _enter_ .

[
 ![Create a partition of type DOS](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121216.png) 
][27]

Here you will see the main disk space, which is 20 GB. To change this, press <enter> on the free space and type 10G.

[
 ![Choose 10GB partition size](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121217.png) 
][28]

Press  _enter _ and then click on the “primary” partition.

[
 ![](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121218.png) 
][29]

Now select the “bootable” type by pressing enter on bootable.

[
 ![Make partition bootable.](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121219.png) 
][30]

Go to  _write _ and press enter, to write partition to disk.

[
 ![Write partition to disk](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121220.png) 
][31]

Then type  _yes_  to make the changes, successfully.

[
 ![Confirm changes](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121221.png) 
][32]

Now the 10 GB partition is created. Click on  _free space _ and then enter the partition size of 2048 M.

[
 ![Create the 2GB swap partition](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121222.png) 
][33]

Now follow the same steps to create the logical partition. Then press enter on  _quit_  and clear the command by typing

 _clear_ .

[
 ![quit cfdisk](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121223.png) 
][34]

Format the newly partitioned disk by typing:

 _mkfs.ext4 /dev/sda1_ 

Here  _sda1 _ is the partition name. Repeat this for the second drive by typing:

 _mkfs.ext4 /dev/sda3_ 

and for the swap partition,

 _mkswap/dev/sda2_ .

[
 ![Format the swap partition with mkswap](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121224.png) 
][35]

Activate the swap by typing:

 _swapon/ dev/ sda2_ 

and clear the command by typing:

 _clear_ .

[
 ![Enable swap](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121225.png) 
][36]

Mount the primary partition to start the installation part by typing:

 _mount /dev/ sda1 / mnt._ 

[
 ![Mount the partitions](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121226.png) 
][37]

### Bootstrap Arch Linux

Bootstrap the system by typing:

 _pacstrap /mnt base base-devel_ 

You can see that it is synchronizing the data packages.

[
 ![Bootstrap Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121227.png) 
][38]

The installation will start and will take a few minutes.

[
 ![Arch Linux installation has been started](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121228.png) 
][39]

After the base installation create the fstab file by tying:

 _genfstab /mnt>> /mnt/etc/fstab_ 

[
 ![Generating /etc/fstab](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121229.png) 
][40]

Configure locale, time and root password

Change the system root to the Arch Linux installation directory by typing:

 _arch-chroot /mnt /bin /bash_ 

 Now to configure the language settings:

 _nano /etc / local.gen_ 

[
 ![Set language in Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121230.png) 
][41]

Select the following language configuration by deleting the # and pressing  _control + x, _ press  _y_ , and press  _enter_ .

[
 ![select language](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121231.png) 
][42]

Now activate it by typing:

 _locale-gen_ 

and press  _enter_ .

[
 ![Generate the locales in Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/121232.png) 
][43]

Create the  /etc/locale.conf file by typing:

 _nano /etc/locale.conf_ 

then press  _enter_ . Now you can add your language to the system by adding this line to the file:

```
LANG=en_US.UTF-8
```

 Then press  _control + x _ and press  _y_ , and press  _enter_ .

[
 ![Set default language](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/1.png) 
][44]

Synchronize the zone information by typing:

ls user/share/zoneinfo_

and you will find a list of all the zones of the world.

[
 ![Set System language default](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/11.png) 
][45]

To select your zone, type:

 _ln –s /usr/share/zoneinfo/Asia/Kolkata/etc/localtime_ 

or you can select any name from the below list.

[
 ![](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/12.png) 
][46]

Set the time standard using the command.

 _hwclock --systohc –utc_ 

And the hardware clock is synchronized.

[
 ![Set time](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/13.png) 
][47]

Set the root user password by typing:

 _passwd_ 

And press  _enter_ . Then type your password and press enter.

[
 ![Set the root password](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/14.png) 
][48]

### Setup hostname and networking

Enter the host name of the network by typing:

 _nano /etc/hostname_ 

and press  _enter_ . Now type any name and then press  _control + x _ and press  _y_ , and press  _enter_ .

[
 ![Set the hostname](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/15.png) 
][49]

Enable the dhcpcd by typing:

 _systemctl enable dhcpcd_ 

and it will be started at next boot time to fetch an IP address automatically.

[
 ![Enable dhcpd](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/16.png) 
][50]

### Install the Bootloader

The final step, initiate the grub installation. Type:

 _pacman –S grub os-rober_ 

then press  _y _ and the download part will begin.

[
 ![Configure grub](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/17.png) 
][51]

Install the grub boot loader to the hard disk by typing:

 _grub-install /dev/sd_ 

and configure it:

 _grub-mkconfig –o/ boot/ grub/ grub.cfg_ 

[
 ![Install and configure grub boot loader](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/18.png) 
][52]

Finally reboot the system by typing:

 _reboot_ 

and press  _enter._ 

[
 ![Reboot the system](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/19.png) 
][53]

### Boot into the installed ArchLinux operating system

Choose “Boot Existing OS” to boot Arch Linux on Virtual Box.

[
 ![Boot Arch Linux](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/110.png) 
][54]

Login with your root name and password, and you will enter your new Arch Linux operating system.

[
 ![Arch Linux installed successfully](https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/111.png) 
][55]

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/

作者：[Dimitris][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/
[1]:https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/#download-arch-linux
[2]:https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/#initializing-installation-with-oracle-vm-virtualbox-manager
[3]:https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/#partition-the-hard-disk
[4]:https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/#bootstrap-arch-linux
[5]:https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/#setup-hostname-and-networking
[6]:https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/#install-the-bootloader
[7]:https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/#boot-into-the-installed-archlinux-operating-system
[8]:https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/#arch-linux-repositories
[9]:https://www.howtoforge.com/tutorial/install-arch-linux-on-virtualbox/#install-arch-linux-on-virtual-box
[10]:https://www.archlinux.org/
[11]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/1212.png
[12]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12121.png
[13]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12122.png
[14]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12123.png
[15]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12124.png
[16]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12125.png
[17]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12126.png
[18]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12127.png
[19]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12128.png
[20]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12129.png
[21]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121210.png
[22]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121211.png
[23]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121212.png
[24]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121213.png
[25]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121214.png
[26]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121215.png
[27]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121216.png
[28]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121217.png
[29]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121218.png
[30]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121219.png
[31]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121220.png
[32]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121221.png
[33]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121222.png
[34]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121223.png
[35]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121224.png
[36]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121225.png
[37]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121226.png
[38]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121227.png
[39]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121228.png
[40]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121229.png
[41]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121230.png
[42]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121231.png
[43]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/121232.png
[44]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/1.png
[45]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/11.png
[46]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/12.png
[47]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/13.png
[48]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/14.png
[49]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/15.png
[50]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/16.png
[51]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/17.png
[52]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/18.png
[53]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/19.png
[54]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/110.png
[55]:https://www.howtoforge.com/images/install_arch_linux_on_virtual_box/big/111.png
