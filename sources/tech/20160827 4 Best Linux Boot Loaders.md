4 Best Linux Boot Loaders
====

When you turn on your machine, immediately after POST (Power On Self Test) is completed successfully, the BIOS locates the configured bootable media, and reads some instructions from the master boot record (MBR) or GUID partition table which is the first 512 bytes of the bootable media. The MBR contains two important sets of information, one is the boot loader and two, the partition table.

### What is a Boot Loader?

A boot loader is a small program stored in the MBR or GUID partition table that helps to load an operating system into memory. Without a boot loader, your operating system can not be loaded into memory.

There are several boot loaders we can install together with Linux on our systems and in this article, we shall briefly talk about a handful of the best Linux boot loaders to work with.

### 1. GNU GRUB

GNU GRUB is a popular and probably the most used multiboot Linux boot loader available, based on the original GRUB (GRand Unified Bootlader) which was created by Eirch Stefan Broleyn. It comes with several improvements, new features and bug fixes as enhancements of the original GRUB program.

Importantly, GRUB 2 has now replaced the GRUB. And notably, the name GRUB was renamed to GRUB Legacy and is not actively developed, however, it can be used for booting older systems since bug fixes are still on going.

GRUB has the following prominent features:

- Supports multiboot
- Supports multiple hardware architectures and operating systems such as Linux and Windows
- Offers a Bash-like interactive command line interface for users to run GRUB commands as well interact with configuration files
- Enables access to GRUB editor
- Supports setting of passwords with encryption for security
- Supports booting from a network combined with several other minor features

Visit Homepage: <https://www.gnu.org/software/grub/>

### 2. LILO (Linux Loader)

LILO is a simple yet powerful and stable Linux boot loader. With the growing popularity and use of GRUB, which has come with numerous improvements and powerful features, LILO has become less popular among Linux users.

While it loads, the word “LILO” is displayed on the screen and each letter appears before or after a particular event has occurred. However, the development of LILO was stopped in December 2015, it has a number of features as listed below:

- Does not offer an interactive command line interface
- Supports several error codes
- Offers no support for booting from a network
- All its files are stored in the first 1024 cylinders of a drive
- Faces limitation with BTFS, GPT and RAID plus many more.

Visit Homepage: <http://lilo.alioth.debian.org/>

### 3. BURG – New Boot Loader

Based on GRUB, BURG is a relatively new Linux boot loader. Because it is derived from GRUB, it ships in with some of the primary GRUB features, nonetheless, it also offers remarkable features such as a new object format to support multiple platforms including Linux, Windows, Mac OS, FreeBSD and beyond.

Additionally, it supports a highly configurable text and graphical mode boot menu, stream plus planned future improvements for it to work with various input/output devices.

Visit Homepage: <https://launchpad.net/burg>

### 4. Syslinux

Syslinux is an assortment of light weight boot loaders that enable booting from CD-ROMs, from a network and so on. It supports filesystems such as FAT for MS-DOS, and ext2, ext3, ext4 for Linux. It as well supports uncompressed single-device Btrfs.

Note that Syslinux only accesses files in its own partition, therefore, it does not offer multi-filesystem boot capabilities.

Visit Homepage: <http://www.syslinux.org/wiki/index.php?title=The_Syslinux_Project>

### Conclusion

A boot loader allows you to manage multiple operating systems on your machine and select which one to use at a particular time, without it, your machine can not load the kernel and the rest of the operating system files.

Have we missed any tip-top Linux boot loader here? If so, then let us know by using the comment form below by making suggestions of any commendable boot loaders that can support Linux operating system.


--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/best-linux-boot-loaders/
