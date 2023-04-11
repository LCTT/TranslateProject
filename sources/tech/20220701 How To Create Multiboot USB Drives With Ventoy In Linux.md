[#]: subject: "How To Create Multiboot USB Drives With Ventoy In Linux"
[#]: via: "https://ostechnix.com/how-to-create-multiboot-usb-drives-with-ventoy-in-linux/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "hanszhao80"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Create Multiboot USB Drives With Ventoy In Linux
======
**Ventoy** is a free, open source and cross-platform program to create multiboot USB drives in Linux, macOS and Microsoft Windows.

You don't need to format your USB devices over and over. Just create a bootable USB drive once and add as many as ISOs you want in future.

You can even create sub-folders, for example Linux ISO, Windows ISO, and put the respective ISO files in the appropriate folders. Ventoy will automatically create the menu entries for the newly added ISOs and add them to the boot menu.

Once you created the multiboot USB, boot your system with the USB drive, select the ISO you want to load and start using it in no time. It is that simple!

### Features

Ventoy ships with a lots of useful features as listed below.

* Very easy to install and use.
* Fast (limited only by the speed of copying iso file).
* You don't need to extract the ISOs. Just boot from the ISO file directly.
* Can be installed in USB/Local Disk/SSD/NVMe/SD Card.
* It supports Legacy BIOS, IA32 UEFI, x86_64 UEFI, ARM64 UEFI, MIPS64EL UEFI etc.
* Supports IA32/x86_64 UEFI Secure Boot.
* Supports FAT32/exFAT/NTFS/UDF/XFS/Ext2/Ext3/Ext4 for main partition. Default is exFAT.
* Support for booting vdisk files such as vhd, vdi, raw... with a Linux distro in a physical machine.
* Persistence storage support.
* Both MBR and GPT partition style are supported. The default is MBR.
* You can create bootable drives with ISO files larger than 4GB.
* Almost all type of OSes are supported. The developer claims more than 900+ ISO files have been tested with Ventoy.
* Linux auto installation supported. Meaning - you can add your template or script for unattended deployment. For instance, kickstart script for Redhat/CentOS, autoYast xml for SUSE, preseed script for Debian. Put a script or template in the USB drive and tell ventoy to use it for unattended installation. You can also update these scripts at any time. No need to create a new ISO file, just use the original ISO.
* Windows auto installation supported.
* Read-only to USB drive during boot.
* The normal usage of USB drives is unaffected. Meaning - you can use the USB drives for other purposes (E.g. File copy)
* Upgrade Ventoy when a new version is available without recreating the bootable USB drive again. Data nondestructive during version upgrade.
* No need to update Ventoy when a new distro is released.
* To add a new OS, just copy/paste the ISO into the USB drive. No need to start all over again.
* Supports Memdisk mode. On some machines the ISOs may not load. In such cases, you can use Memdisk mode. In this mode, Ventoy will load the whole ISO file into memory and then boot it.
* Plugin Framework.
* Native boot menu style for Legacy & UEFI.
* Available as CLI, native GUI and Web-based GUI.
* Supports theme and menu style customization.
* Cross-platform. It supports Linux, manOS and Windows.
* Free and Open source!

### Create Multiboot USB Drives With Ventoy In Linux

As I mentioned already, Ventoy is available as CLI, native GUI and Web-GUI versions.

#### 1. Create Multiboot USB Drive Using Ventoy CLI

First, you need to find your USB drive name. Refer the following guide to learn different ways to find disk drive details in Linux.

* [How To Find Hard Disk Drive Details In Linux][1]

I am going to use `fdisk` command to find my USB drive details:

```
$ sudo fdisk -l
```

**Sample output:**

```
[...]
Disk /dev/sdb: 14.54 GiB, 15597568000 bytes, 30464000 sectors
Disk model: Cruzer Blade    
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x4d924612
```

As you can see, my USB drive name is /dev/sdb.

Next, download the latest Ventoy script from the [releases page][2]. As of writing this guide the latest version was 1.0.77.

Go to the location where you downloaded the script and extract it. I have extracted it in a folder named `"ventoy"`. Cd into the `ventoy` directory:

```
$ cd ventoy
```

Now, run the following command to create multiboot USB drive:

```
$ sudo sh Ventoy2Disk.sh -I /dev/sdb
```

Replace `"/dev/sdb"` with your USB drive name.

Here, the uppercase `"I"` will **force install ventoy** to `sdb` (no matter installed or not). If you use lowercase **i**, it install ventoy to `sdb` and fail if disk is already installed with ventoy.

To enable secure boot support, use **-s** flag. By default, this option is disabled.

```
$ sudo sh Ventoy2Disk.sh -I -s /dev/sdb
```

You will be prompted to confirm the USB bootable creation process. Double check the USB drive name and type **Y** and press `ENTER` to continue:

**Sample Output:**

```
**********************************************
      Ventoy: 1.0.77  x86_64
      longpanda admin@ventoy.net
      https://www.ventoy.net
**********************************************

Disk : /dev/sdb
Model: SanDisk Cruzer Blade (scsi)
Size : 14 GB
Style: MBR

Attention:
You will install Ventoy to /dev/sdb.
All the data on the disk /dev/sdb will be lost!!!

Continue? (y/n) y

All the data on the disk /dev/sdb will be lost!!!
Double-check. Continue? (y/n) y

Create partitions on /dev/sdb by parted in MBR style ...
Done
Wait for partitions ...
partition exist OK
create efi fat fs /dev/sdb2 ...
mkfs.fat 4.2 (2021-01-31)
success
Wait for partitions ...
/dev/sdb1 exist OK
/dev/sdb2 exist OK
partition exist OK
Format partition 1 /dev/sdb1 ...
mkexfatfs 1.3.0
Creating... done.
Flushing... done.
File system created successfully.
mkexfatfs success
writing data to disk ...
sync data ...
esp partition processing ...

Install Ventoy to /dev/sdb successfully finished.
```

![Create Multiboot USB Drives With Ventoy In Linux OS][3]

After a few seconds, the multiboot USB drive will be created.

The above command will create two partitions. You can verify it with `fdisk` command:

```
$ sudo fdisk -l
```

**Sample Output:**

```
[...]
Disk /dev/sdb: 14.53 GiB, 15597568000 bytes, 30464000 sectors
Disk model: Cruzer Blade    
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x436cedd0

Device     Boot    Start      End  Sectors  Size Id Type
/dev/sdb1  *        2048 30398463 30396416 14.5G  7 HPFS/NTFS/exFAT
/dev/sdb2       30398464 30463999    65536   32M ef EFI (FAT-12/16/32)
```

Now open your file manager and copy the ISO files in the first partition. Don't worry if you can't find which one is the first partition. Your file manager will display the first partition only.

![Copy ISO files to USB bootable drive created with Ventoy][4]

You can even create sub-folders for different ISO file types. For instance, you can create a sub-folder for storing Linux ISO files, a sub-folder for BSD ISO files, and a sub-folder windows ISO files.

Ventoy will scan the entire USB drive and create menu entries for all available ISO files and automatically add them to the Ventoy main boot menu.

If you prefer command line way to copy ISO files, go to the location where you saved ISO files and copy all ISO files from command line with `rsync` program like below:

```
$ rsync *.iso /media/$USER/ventoy/ --progress -ah
```

Please note that in some Linux distros, the USB might be mounted under **"/run/media/"** location.

Done! We have just created multiboot USB drive with Ventoy.

Boot your system with the newly crated bootable USB drive and you will be pleased with the Ventoy boot menu:

![Ventoy multiboot menu][5]

Choose the OS that you want to boot and hit ENTER to load it!

Here is the short visual demo of multiboot USB flash drive created with Ventoy:

![][6]

![][7]

Cool, isn't it? Indeed!

If you want to boot the USB in Oracle Virtualbox, refer the following guide:

* [How To Boot From USB Drive In Virtualbox In Linux][8]

#### 2. Create Multiboot USB Drive Using Ventoy GUI

Initially, Ventoy doesn't have any graphical user interface for Linux platforms. We can create bootable USB drives using Ventoy in Linux from commandline mode only.

Fortunately, Ventoy now ships with a web-based graphical user interface since version 1.0.36 and native GUI (GTK/QT) since 1.0.52.

Believe me, the usage of Ventoy GUI is incredibly easy! The interface is very minimal but it has everything we need to create a single or multiboot bootable drives in a couple mouse clicks.

Open your Terminal and go to the location where you downloaded the latest Ventoy program.

```
$ cd Downloads/ventoy-1.0.77/
```

Run the appropriate Ventoy GUI executable file depending upon the distribution's architecture.

* VentoyGUI.i386 - For X86 32 bit OS
* VentoyGUI.x86_64 - For X86 64 bit OS
* VentoyGUI.aarch64 - For ARM64 OS
* VentoyGUI.mips64el - For Loongson 3A MIPS OS

I am on Debian 11 X86 64 bit system, so I run the following command:

```
$ ./VentoyGUI.x86_64
```

This is how Ventoy GUI looks like.

![Ventoy GUI][9]

Ventoy automatically selects the connected USB drive for you. However, I recommend you to verify if the chosen drive is actually the USB drive that you want to format.

![Create Multiboot USB Drives Using Ventoy GUI][10]

You will be prompted to confirm the process. Click OK to continue.

##### Ventoy Options And Language

Click the Options button from the menu bar.

![Ventoy Options][11]

From the Options drop down button, you can do the following:

* Secure Boot Support - Check/uncheck to enable or disable Secure boot. By default, it is enabled (checked).
* Partition Style - MBR and GPT partition styles are supported. The default is MBR.
* Partition Configuration - Here, you can choose to preserve some free space at the end of the disk.
* Clear Ventoy - Remove Ventoy from your disk.
* Show all disks - Check this option if you want to show all connected devices including your local disks. Be extra careful while selecting this option. You may accidentally choose one of your local disk and format it.

The language button allows you choose your preferred language.

##### Update Ventoy

It is not necessary to re-create the bootable USB whenever a new Ventoy version is released. You can safely update ventoy to the new version without losing any existing data from the USB drive.

To update the installed Ventoy version to latest available version, plug in the USB drive and launch Ventoy GUI as shown above.

From the Ventoy GUI, click Update button.

![Update Ventoy][12]

#### 3. Create Multiboot USB Drive Using Ventoy Web GUI

Ventoy Web GUI is exactly same as native GUI. The other day I tried the Ventoy WebUI in my Fedora Linux desktop. I am surprised how much I like the simplicity of the Ventoy graphical user interface.

To learn how to create bootable USB using Ventoy graphical user interface, refer the following link:

* [Create Bootable USB Drive With Ventoy WebUI In Linux][13]

#### Load ISO Images To RAM

Like I already mentioned, the ISO images may not boot in some machines, especially in Legacy BIOS mode. Here is where `"Memdisk"` mode comes in help.

When `Memdisk` mode is enabled, Ventoy will load the whole ISO image file into memory and boot it from there.

To enable `Memdisk` mode, press F1 key before selecting the OS. You will see the notification on the top right corner when the Memdisk mode is enabled.

![Enable Memdisk mode in Ventoy][14]

Now the ISO will be loaded to memory:

![Load ISO to memory in Ventoy][15]

To switch back to normal mode, press `F1` key again.

### Creating Persistent Bootable USB

We know now how to create multiboot USB drives with Ventoy in Linux. Using this bootable USB, we can test the Linux distributions without actually having to install them on the hard drive.

When you are on the Live OS, you can do all sort of things, such as installing applications, downloading files, playing media, creating files and folders, customizing it as per your liking and a lot more.

However once you reboot the system, all of the said changes will be gone. If you want to make all changes remain intact even after rebooted the system, you should create a persistent bootable USB drive.

Ventoy can able to make persistent USB bootable drive. To know how to do it, refer the link given below.

* [Create Persistent Bootable USB Using Ventoy In Linux][16]

### Conclusion

Believe or not, Ventoy is one of the easiest, quickest and ingenious tool ever I have used to create multiboot (persistent and non-persistent) USB flash drives in Linux.

It just works out of the box! Give it a try. You won't be disappointed!

### Security concerns related to Ventoy

The Ventoy website, forum and some files hosted in that site have been flagged as Malware/Trojan by some Antivirus software. Check the issues posted in the project's GitHub page:

* [https://github.com/ventoy/Ventoy/issues/22][17]
* [https://github.com/ventoy/Ventoy/issues/83][18]
* [https://github.com/ventoy/Ventoy/issues/31][19]

However, Manjaro packager **"Linux Aarhus"** has argued after code review why there is no reasonable doubt on the security aspects of this application.

He claims **"there is no obfuscated code"**. So, I guess Ventoy is **safe** to use.

**Resources:**

* [Ventoy Website][20]
* [Ventoy GitHub Repository][21]

--------------------------------------------------------------------------------

via: https://ostechnix.com/how-to-create-multiboot-usb-drives-with-ventoy-in-linux/

作者：[sk][a]
选题：[lkxed][b]
译者：[hanszhao80](https://github.com/hanszhao80)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/how-to-find-hard-disk-drive-details-in-linux/
[2]: https://github.com/ventoy/Ventoy/releases
[3]: https://ostechnix.com/wp-content/uploads/2022/07/Create-Multiboot-USB-Drives-With-Ventoy-In-Linux.png
[4]: https://ostechnix.com/wp-content/uploads/2020/05/Copy-ISO-files-to-USB-bootable-drive.png
[5]: https://ostechnix.com/wp-content/uploads/2020/05/Ventoy-multiboot-menu.png
[6]: https://i.ytimg.com/vi/VFr1mAikeJU/maxresdefault.jpg
[7]: https://ostechnix.com/wp-content/plugins/penci-shortcodes/pagespeed/assets/play-btn.png
[8]: https://ostechnix.com/how-to-boot-from-usb-drive-in-virtualbox-in-linux/
[9]: https://ostechnix.com/wp-content/uploads/2022/07/Ventoy-GUI.png
[10]: https://ostechnix.com/wp-content/uploads/2022/07/Create-Multiboot-USB-Drives-Using-Ventoy-GUI.png
[11]: https://ostechnix.com/wp-content/uploads/2022/07/Ventoy-Options.png
[12]: https://ostechnix.com/wp-content/uploads/2022/07/Update-Ventoy.png
[13]: https://ostechnix.com/create-bootable-usb-drive-with-ventoy-webui-in-linux/
[14]: https://ostechnix.com/wp-content/uploads/2020/05/Enable-Memdisk-mode-in-Ventoy.png
[15]: https://ostechnix.com/wp-content/uploads/2020/05/Load-ISO-to-memory-in-Ventoy.png
[16]: https://ostechnix.com/create-persistent-bootable-usb-using-ventoy-in-linux/
[17]: https://github.com/ventoy/Ventoy/issues/22
[18]: https://github.com/ventoy/Ventoy/issues/83
[19]: https://github.com/ventoy/Ventoy/issues/31
[20]: https://www.ventoy.net/en/index.html
[21]: https://github.com/ventoy/Ventoy
