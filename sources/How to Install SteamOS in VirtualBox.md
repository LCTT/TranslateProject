How to Install SteamOS in VirtualBox
================================================================================
**The following tutorial will teach all Linux users how to install Valve's brand new SteamOS GNU/Linux operating system in a virtual machine, using the powerful and popular VirtualBox software.**

As you already know, the [SteamOS Linux has been officially released on December 13][1] and is based on Debian GNU/Linux operating system, using GNOME as its (optional) desktop environment.

SteamOS is very easy to install if you have the right hardware components, which involves a UEFI-capable computer with a powerful video card for playing games. However, as Valve did not publish an ISO image of SteamOS, many have encountered difficulties in installing the system.

The following tutorial is comprised of two important sections, one that helps you create an ISO image from the SteamOSInstaller.zip file provided by Valve, and a second one where you learn how to install SteamOS in VirtualBox if you don't want to install it on a real computer.

To get started, you need to have a working installation of the latest VirtualBox software. Also, you need to install a software called [GNU xorriso][2], which you'll use to generate the ISO image from the SteamOSInstaller folder.

### Step 1 – Generate SteamOS ISO image ###

[Download the SteamOSInstaller.zip from Softpedia][3], save it on your home folder, and extract the files. A folder named “SteamOSInstaller” will be output. Now, open a terminal in the home folder and execute the following command:

xorriso -as mkisofs -r -checksum_algorithm_iso md5,sha1 -V 'Steam OS' -o ~/SteamOSInstaller.iso -J -joliet-long -cache-inodes -no-emul-boot -boot-load-size 4 -boot-info-table -eltorito-alt-boot --efi-boot boot/grub/efi.img -append_partition 2 0x01 ~/SteamOSInstaller/boot/grub/efi.img -partition_offset 16 ~/SteamOSInstaller

The SteamOS.iso file will be generated in a few seconds on your home folder and will have approximately 1GB in size. That's all, you can now proceed to the next step.

### Step 2 – Install SteamOS in VirtualBox ###

Considering the fact that you already have a working VirtualBox installation and that you already know how to use the software, you must create a new virtual machine with UEFI support. On VirtualBox's main window, press the New button to start the process of creating a new virtual machine.

In the name field type SteamOS, choose Linux as the operating system type, select Debian 64-bit from the Linux version drop-down box, and click Next to continue. Set 1024 or 2048 for the memory size (this depends on how much physical RAM your computer has), create a virtual hard drive of VDI file type and fixed size with 15GB. Click the Continue button and wait for the hard drive creation process to finish.

![Create a new virtual machine](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-3.png)
*Create a new virtual machine*

![Set the memory size](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-4.png)
*Set the memory size*

Now that the virtual machine has been created, let’s make a few adjustments for the SteamOS operating system. Go to Settings, click the System section in the sidebar, and uncheck the “Floppy” entry from the Boot Order box, and make sure you check the “Enable EFI (special OSes only)” option.

![Enable EFI and remove Floppy](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-5.png)
*Enable EFI and remove Floppy*

Next, click the Display section in the sidebar, set the Video Memory to 128MB, and check the “Enable 3D Acceleration” option. Then, go to the Storage section in the sidebar, click the “Empty” line under “Controller: IDE” and add the SteamOSInstaller.iso image generated in the first step by clicking on the small CD icon next to the CD/DVD Drive drop-down box. Click OK when done.

![Set Video Memory size and 3D acceleration](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-6.png)
*Set Video Memory size and 3D acceleration*

And now, let’s start the virtual machine by pressing the big “Start” button on the main window. You will immediately see the SteamOS boot screen. Just press Enter with the “Automated install (WILL ERASE DISK!) option highlighted, sit back, and relax until the system is installed, which will take some time, depending on your computer’s specs.

![Prepare to install SteamOS](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-7.png)
*Prepare to install SteamOS*

Once the installation process is finished, you can close the virtual machine, remove the ISO image from the Storage section, and boot into your new SteamOS. But, before you start exploring SteamOS, you will need to install the VirtualBox Guest Additions. To do that, start the SteamOS virtual machine, select the second entry on the GRUB boot loader screen (Recovery), and type the following commands when you hit the SteamOS command-line prompt:

![SteamOS boot loader](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-9.png)

    dpkg --get-selections | grep nvidia
    apt-get purge <name of the packages outputted by the above command>
    rm /usr/share/X11/xorg.conf.d/55-nvidia.conf
    dpkg-reconfigure xserver-xorg

Go to Devices and click on Insert Guest Additions CD image. Download the Guest Additions image when prompted, mount it and run the following command:

    sh /media/cdrom/VBoxLinuxAdditions.run

Wait for the Guest Additions to install its drivers and reboot the virtual machine with the following command:

    shutdown now -r

![SteamOS command-line shell prompt](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-10.png)
*SteamOS command-line shell prompt*

The virtual machine will reboot, let it boot into the SteamOS and, when you arrive at the login prompt, use desktop/desktop or steam/steam as the username and password to login. Do not hesitate to comment below if you encounter problems during the installation.

![SteamOS with GNOME 3](http://i1-news.softpedia-static.com/images/news2/How-to-Install-SteamOS-in-VirtualBox-409363-11.png)
*SteamOS with GNOME 3*

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Install-SteamOS-in-VirtualBox-409363.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://news.softpedia.com/news/Download-SteamOS-1-0-Based-on-Debian-Linux-409214.shtml
[2]:http://linux.softpedia.com/get/Programming/Libraries/GNU-xorriso-36759.shtml
[3]:http://linux.softpedia.com/get/System/Operating-Systems/Linux-Distributions/SteamOS-103040.shtml