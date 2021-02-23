[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Learning about Partitions and How to Create Them for Fedora)
[#]: via: (https://fedoramagazine.org/learning-about-partitions-and-how-to-create-them-for-fedora/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

Learning about Partitions and How to Create Them for Fedora
======

![][1]

Operating system distributions try to craft a one size fits all partition layout for their file systems. Distributions cannot know the details about how your hardware is configured or how you use your system though. Do you have more than one storage drive? If so, you might be able to get a performance benefit by putting the write-heavy partitions (_var_ and _swap_ for example) on a separate drive from the others that tend to be more read-intensive since most drives cannot read and write at the same time. Or maybe you are running a database and have a small solid-state drive that would improve the database’s performance if its files are stored on the SSD.

The following sections attempt to describe in brief some of the historical reasons for separating some parts of the file system out into separate partitions so that you can make a more informed decision when you install your Linux operating system.

If you know more (or contradictory) historical details about the partitioning decisions that shaped the Linux operating systems used today, contribute what you know below in the comments section!

### Common partitions and why or why not to create them

#### The boot partition

One of the reasons for putting the ***/*_boot_ directory on a separate partition was to ensure that the boot loader and kernel were located within [the first 1024 cylinders of the disk][2]. Most modern computers do not have the 1024 cylinder restriction. So for most people, this concern is no longer relevant. However, modern UEFI-based computers have [a different restriction][3] that makes it necessary to have a separate partition for the boot loader. UEFI-based computers require that the boot loader ([which can be the Linux kernel directly][4]) be on a FAT-formatted file system. The Linux operating system, however, requires a POSIX-compliant file system that can designate access permissions to individual files. Since [FAT file systems do not support access permissions][5], the boot loader must be on a separate file system than the rest of the operating system on modern UEFI-based computers. A single partition cannot be [formatted][6] with more than one type of file system.

#### The var partition

One of the historical reasons for [putting the /var directory on a separate partition][7] was to prevent files that were frequently written to (_/var/log/*_ for example) from filling up the entire drive. Since modern drives tend to be much larger and since other means like [log rotation][8] and [disk quotas][9] are available to manage storage utilization, putting _/var_ on a separate partition may not be necessary. It is much easier to change a disk quota than it is to re-partition a drive.

Another reason for isolating _/var_ was that file system corruption was much more common in the original version of the Linux [Extended File System (EXT)][10]. The file systems that had more write activity were much more likely to be irreversibly corrupted by a power outage than those that did not. By partitioning the disk into separate file systems, one could limit the scope of the damage in the event of file system corruption. This concern is no longer as significant because modern file systems support [journaling][11].

#### The home partition

Having ***/*_home_ on a separate partition makes it possible to re-format the other partitions without overwriting your home directories. However, because modern Linux distributions are much better at doing in-place operating system upgrades, re-formatting shouldn’t be needed as frequently as it might have been in the past.

It can still be useful to have _/home_ on a separate partition if you have a dual-boot setup and want both operating systems to share the same home directories. Or if your operating system is installed on a file system that supports snapshots and rollbacks and you want to be able to rollback your operating system to an older snapshot without reverting the content in your user profiles. Even then, some file systems allow their descendant file systems to be rolled back independently, so it still may not be necessary to have a separate partition for _/home_. On ZFS, for example, one pool/partition can have multiple descendant file systems.

#### The swap partition

The _swap_ partition reserves space for the contents of RAM to be written to permanent storage. There are pros and cons to having a swap partition. A pro of having swap memory is that it theoretically gives you time to gracefully shutdown unneeded applications before [the OOM killer][12] takes matters into its own hands. This might be important if the system is running mission-critical software that you don’t want abruptly terminated. A con might be that your system runs so slow when it starts swapping memory to disk that you’d rather the OOM killer take care of the problem for you.

Another use for swap memory is [hibernation mode][13]. This might be where the rule that the swap partition should be twice the size of your computer’s RAM originated. Ideally, you should be able to put a system into hibernation even if nearly all of its RAM is in use. Beware that Linux’s support for hibernation is not perfect. It is not uncommon that after a Linux system is resumed from hibernation some hardware devices are left in an inoperable state (for example, no video from the video card or no internet from the WiFi card).

In any case, having a swap partition is more a matter of taste. It is not required.

#### The root partition

The _root_ partition (/) is the catch-all for all directories that have not been assigned to a separate partition. There is always at least one root partition. BIOS-based systems that are new enough to not have the 1024 cylinder limit can be configured with only a root partition and no others so that there is never a need to resize a partition or file system if space requirements change.

#### The EFI system partition

The [EFI System Partition (ESP)][14] serves the same purpose on UEFI-based computers as the _boot_ partition did on the older BIOS-based computers. It contains the boot loader and kernel. Because the files on the ESP need to be accessible by the computer’s firmware, the ESP has a few restrictions that the older boot partition did not have. The restrictions are:

  1. The ESP must be formatted with a FAT file system (_vfat_ in Anaconda)
  2. The ESP must have a special [type-code][15] (_EF00_ when using [gdisk][16])



Because the older boot partition did not have file system or type-code restrictions, it is permissible to apply the above properties to the _boot_ partition and use it as your ESP. Note, however, that the GRUB boot loader does not support combining the boot and ESP partitions. If you use GRUB, you will have to create a separate partition and mount it beneath the _/boot_ directory.

The [Boot Loader Specification (BLS)][17] lists several reasons why it is ideal to use the legacy boot partition as your ESP. The reasons include:

  1. The UEFI firmware should be able to load the kernel directly. Having a separate, non-ESP compliant boot partition for the kernel prevents the UEFI firmware from being able to directly load the kernel.
  2. Nesting the ESP mount point three mount levels deep increases the likelihood that an intermediate mount could fail or otherwise be unavailable when needed. That is, requiring _root_ (/), then _boot_ (/boot), then _efi_ (/efi) to be consecutively mounted is unnecessarily complex and prone to error.
  3. Requiring the boot loader to be able to read other partitions/disks which may be formatted with arbitrary file systems is non-trivial. Even when the boot loader does contain such code, the code that works at installation time can become outdated and fail to access the kernel/initrd after a file system update. This is currently true of GRUB’s _ZFS_ file system driver, for example. You must be careful not to update your _ZFS_ file system if you use the GRUB boot loader or else your system may not come back up the next time you reboot.



Besides the concerns listed above, it is a good idea to have your startup environment — up to and including your [initramfs][18] — on a single self-contained file system for recovery purposes. Suppose, for example, that you need to rollback your root file system because it has become corrupted or it has become infected with malware. If your _kernel_ and _initramfs_ are on the _root_ file system, you may be unable to perform the recovery. By having the _boot loader_, _kernel_, and _initramfs_ all on a single file system that is rarely accessed or updated, you can increase your chances of being able to recover the rest of your system.

In summary, there are many ways that you can layout your partitions and the type of hardware (BIOS or UEFI) and the brand of boot loader (GRUB, Syslinux or [systemd-boot][19]) are among the factors that will influence which layouts will work.

### Other considerations

#### MBR vs. GPT

[GUID Partition Table (GPT)][20] is the newer partition format that supports larger disks. GPT was designed to work with the newer UEFI firmware. It is backward-compatible with the older [Master Boot Record (MBR)][21] partition format but not all boot loaders support the [MBR boot method][21]. _GRUB_ and _Syslinux_ support both MBR and UEFI, but _systemd-boot_ only supports the newer [UEFI boot method][22].

By using GPT now, you can increase the likelihood that your storage device, or an image of it, can be transferred over to a newer computer in the future should you wish to do so. If you have an older computer that natively supports only MBR-partitioned drives, you may need to add the _inst.gpt_ parameter to **Anaconda** when starting the installer to get it to use the newer format. How to add the _inst.gpt_ parameter is shown in the below video titled **“Partitioning a BIOS Computer”**.

If you use the _GPT_ partition format on a BIOS-based computer, and you use the _GRUB_ boot loader, you must additionally create a one megabyte _biosboot_ partition at the start of your storage device. The _biosboot_ partition is not needed by any other brand of boot loader. How to create the _biosboot_ partition is demonstrated in the below video titled **“Partitioning a BIOS Computer”**.

#### LVM

One last thing to consider when manually partitioning your Linux system is whether to use standard partitions or logical volumes. Logical volumes are managed by the [Logical Volume Manager (LVM)][23]. You can setup LVM volumes directly on your disk without first creating standard partitions to hold them. However, most computers still require that the boot partition be a standard partition and not an LVM volume. Consequently, having LVM volumes only increases the complexity of the system because the LVM volumes must be created within standard partitions.

The main features of LVM — online storage resizing and clustering — are not really applicable to the typical end user. Most laptops do not have hot-swappable drive bays for adding or reconfiguring storage while the system is running. And not many laptop or desktop users have [clvmd][24] configured so they can access a centralized storage device concurrently from multiple client computers.

LVM is great for servers and clusters. But it adds extra complexity for the typical end user. Go with standard partitions unless you are a server admin who needs the more advanced features.

### Video demonstrations

Now that you know which partitions you need, you can watch the sort video demonstrations below to see how to manually partition a Fedora Linux computer from the Anaconda installer.

These videos demonstrate creating only the minimally required partitions. You can add more if you choose.

Because the _GRUB_ boot loader requires a more complex partition layout on UEFI systems, the below video titled **“Partitioning a UEFI Computer”** additionally demonstrates how to install the _systemd-boot_ boot loader. By using the _systemd-boot_ boot loader, you can reduce the number of needed partitions to just two — _boot_ and _root_. How to use a boot loader other than the default (GRUB) with Fedora’s Anaconda installer is officially documented [here][25].

**Partitioning a UEFI Computer**

**Partitioning a BIOS Computer**

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/learning-about-partitions-and-how-to-create-them-for-fedora/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/01/partitions-fedora-816x346.png
[2]: https://en.wikipedia.org/wiki/Cylinder_1024
[3]: https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface#EFI_system_partition
[4]: https://www.kernel.org/doc/Documentation/efi-stub.txt
[5]: https://en.wikipedia.org/wiki/File_system_permissions#Operating_system_variations
[6]: https://en.wikipedia.org/wiki/Disk_formatting#Formatting
[7]: https://access.redhat.com/discussions/641923
[8]: https://linuxconfig.org/setting-up-logrotate-on-redhat-linux
[9]: https://docs.oracle.com/cd/E19253-01/819-5461/gazud/index.html
[10]: https://en.wikipedia.org/wiki/Extended_file_system
[11]: https://en.wikipedia.org/wiki/Journaling_file_system
[12]: https://lwn.net/Articles/317814/
[13]: https://www.fosslinux.com/184/what-is-difference-between-suspend-and-hibernate-in-linux.htm
[14]: https://en.wikipedia.org/wiki/EFI_system_partition
[15]: https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs
[16]: https://fedoramagazine.org/managing-partitions-with-sgdisk/
[17]: https://systemd.io/BOOT_LOADER_SPECIFICATION/
[18]: https://fedoramagazine.org/initramfs-dracut-and-the-dracut-emergency-shell/
[19]: https://www.freedesktop.org/wiki/Software/systemd/systemd-boot/
[20]: https://en.wikipedia.org/wiki/GUID_Partition_Table
[21]: https://en.wikipedia.org/wiki/Master_boot_record
[22]: https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface#UEFIBOOT
[23]: https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
[24]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/logical_volume_manager_administration/lvm_cluster_overview
[25]: https://docs.fedoraproject.org/en-US/fedora/rawhide/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-storage-partitioning-bootloader
