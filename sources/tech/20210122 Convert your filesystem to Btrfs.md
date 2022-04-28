[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Convert your filesystem to Btrfs)
[#]: via: (https://fedoramagazine.org/convert-your-filesystem-to-btrfs/)
[#]: author: (Gergely Gombos https://fedoramagazine.org/author/gombosg/)

Convert your filesystem to Btrfs
======

![][1]

### Introduction

The purpose of this article is to give you an overview about why, and how to migrate your current partitions to a Btrfs filesystem. To read a step-by-step walk through of how this is accomplished – follow along, if you’re curious about doing this yourself.

Starting with Fedora 33, the default filesystem is now Btrfs for new installations. I’m pretty sure that most users have heard about its advantages by now: copy-on-write, built-in checksums, flexible compression options, easy snapshotting and rollback methods. It’s really a modern filesystem that brings new features to desktop storage.

Updating to Fedora 33, I wanted to take advantage of Btrfs, but personally didn’t want to reinstall the whole system for ‘just a filesystem change’. I found [there was] little guidance on how exactly to do it, so decided to share my detailed experience here.

### Watch out!

Doing this, you are playing with fire. Hopefully you are not surprised to read the following:

> During editing partitions and converting file systems, you can have your data corrupted and/or lost. You can end up with an unbootable system and might be facing data recovery. You can inadvertently delete your partitions or otherwise harm your system.

These conversion procedures are meant to be safe even for production systems – but only if you plan ahead, have backups for critical data and rollback plans. As a _sudoer_, you can do anything without limits, without any of the usual safety guards protecting you.

### The safe way: reinstalling Fedora

Reinstalling your operating system is the ‘official’ way of converting to Btrfs, recommended for most users. Therefore, choose this option if you are unsure about anything in this guide. The steps are roughly the following:

  1. Backup your home folder and any data that might be used in your system like _/etc_. [Editors note: VM’s too]
  2. Save your list of installed packages to a file.
  3. Reinstall Fedora by removing your current partitions and choosing the new default partitioning scheme with Btrfs.
  4. Restore the contents of your home folder and reinstall the packages using the package list.



For detailed steps and commands, see this comment by a community user at [ask.fedoraproject.org][2]. If you do this properly, you’ll end up with a system that is functioning in the same way as before, with minimal risk of losing any data.

### Pros and cons of conversion

Let’s clarify this real quick: what kind of advantages and disadvantages does this kind of filesystem conversion have?

##### **The good**

  * Of course, no reinstallation is needed! Every file on your system will remain the exact same as before.
  * It’s technically possible to do it in-place i.e. without a backup.
  * You’ll surely learn a lot about btrfs!
  * It’s a rather quick procedure if everything goes according to plan.



##### The bad

  * You have to know your way around the terminal and shell commands.
  * You can lose data, see above.
  * If anything goes wrong, you are on your own to fix it.



##### The ugly

  * You’ll need about 20% of free disk space for a successful conversion. But for the complete backup &amp; reinstall scenario, you might need even more.
  * You can customize everything about your partitions during the process, but you can also do that from Anaconda if you choose to reinstall.



### **What about LVM?**

LVM layouts have been the default during the last few Fedora installations. If you have an LVM partition layout with multiple partitions e.g. _/_ and _/home_, you would somehow have to merge them in order to enjoy all the benefits of Btrfs.

If you choose so, you can individually convert partitions to Btrfs while keeping the volume group. Nevertheless, one of the advantages of migrating to Btrfs is to get rid of the limits imposed by the LVM partition layout. You can also use the send-receive functionality offered by _btrfs_ to merge the partitions after the conversion.

See also on Fedora Magazine: [Reclaim hard-drive space with LVM][3], [Recover your files from Btrfs snapshots][4] and [Choose between Btrfs and LVM-ext4][5].

### Getting acquainted with Btrfs

It’s advisable to read at least the following to have a basic understanding about what Btrfs is about. If you are unsure, just choose the safe way of reinstalling Fedora.

##### Must reads

  * [Fedora Magazine: Btrfs Coming to Fedora 33][6]
  * [Btrfs sysadmin guide][7], _especially_ about subvolumes &amp; flat subvolume layout.
  * [Btrfs-convert guide][8]



##### Useful resources

  * [_man 8 btrfs_][9] – command-line interface
  * _[man 5 btrfs][10]_ – mount options
  * _[man btrfs-convert][11]_ – the conversion tool we are going to use
  * _[man btrfs-subvolume][12]_ – managing subvolumes



### Conversion steps

##### Create a live image

Since you can’t convert mounted filesystems, we’ll be working from a Fedora live image. Install [Fedora Media Writer][13] and ‘burn’ Fedora 33 to your favorite USB stick.

##### Free up disk space

_btrfs-convert_ will recreate filesystem metadata in your partition’s free disk space, while keeping all existing _ext4_ data at its current location.

Unfortunately, the amount of free space required cannot be known ahead – the conversion will just fail (and do no harm) if you don’t have enough. Here are some useful ideas for freeing up space:

  * Use _baobab_ to identify large files &amp; folders to remove. Don’t manually delete files outside of your home folder if possible.
  * Clean up old system journals: _journalctl –vacuum-size=100M_
  * If you are using Docker, carefully use tools like _docker volume prune, docker image prune -a_
  * Clean up unused virtual machine images inside e.g. GNOME Boxes
  * Clean up unused packages and flatpaks: _dnf autoremove_, _flatpak remove –unused_,
  * Clean up package caches: _pkcon refresh force -c -1_, _dnf clean all_
  * If you’re confident enough to, you can cautiously clean up the _~/.cache_ folder.



##### Convert to Btrfs

Save all your valuable data to a backup, make sure your system is fully updated, then reboot into the live image. Run _gnome-disks_ to find out your device handle e.g. _/dev/sda1_ (it can look different if you are using LVM). Check the filesystem and do the conversion: [Editors note: The following commands are run as root, use caution!]

```
$ sudo su -
# fsck.ext4 -fyv /dev/sdXX
# man btrfs-convert (read it!)
# btrfs-convert /dev/sdXX
```

This can take anywhere from 10 minutes to even hours, depending on the partition size and whether you have a rotational or solid-state hard drive. If you see errors, you’ll likely need more free space. As a last resort, you could try _btrfs-convert_ _-n_.

##### How to roll back?

If the conversion fails for some reason, your partition will remain _ext4_ or whatever it was before. If you wish to roll back after a successful conversion, it’s as simple as

```
# btrfs-convert -r /dev/sdXX
```

**Warning!** You will permanently lose your ability to roll back if you do any of these: defragmentation, balancing or deleting the _ext2_saved_ subvolume.

Due to the copy-on-write nature of Btrfs, you can otherwise safely copy, move and even delete files, create subvolumes, because _ext2_saved_ keeps referencing to the old data.

##### Mount &amp; check

Now the partition is supposed to have _btrfs_ file system. Mount it and look around your files… and subvolumes!

```
# mount /dev/sdXX /mnt
# man btrfs-subvolume (read it!)
# btrfs subvolume list / (-t for a table view)
```

Because you have already read the [relevant manual page][14], you should now know that it’s safe to create subvolume snapshots, and that you have an _ext2-saved_ subvolume as a handy backup of your previous data.

It’s time to read the [Btrfs sysadmin guide][7], so that you won’t confuse subvolumes with regular folders.

##### Create subvolumes

We would like to achieve a ‘flat’ subvolume layout, which is the same as what Anaconda creates by default:

```
toplevel (volume root directory, not to be mounted by default)
  +-- root (subvolume root directory, to be mounted at /)
  +-- home (subvolume root directory, to be mounted at /home)
```

You can skip this step, or decide to aim for a different layout. The advantage of this particular structure is that you can easily create snapshots of _/home_, and have different compression or mount options for each subvolume.

```
# cd /mnt
# btrfs subvolume snapshot ./ ./root2
# btrfs subvolume create home2
# cp -a home/* home2/
```

Here, we have created two subvolumes. _root2_ is a full snapshot of the partition, while _home2_ starts as an empty subvolume and we copy the contents inside. (This _cp_ command doesn’t duplicate data so it is going to be fast.)

  * In _/mnt_ (the top-level subvolume) delete everything except _root2_, _home2_, and _ext2_saved_.
  * Rename _root2_ and _home2_ subvolumes to _root_ and _home_.
  * Inside _root_ subvolume, empty out the _home_ folder, so that we can mount the _home_ subvolume there later.



It’s simple if you get everything right!

##### Modify fstab

In order to mount the new volume after a reboot, _fstab_ has to be modified, by replacing the old _ext4_ mount lines with new ones.

You can use the command _blkid_ to learn your partition’s UUID.

```
UUID=xx / btrfs subvol=root 0 0
UUID=xx /home btrfs subvol=home 0 0
```

(Note that the two UUIDs are the same if they are referring to the same partition.)

These are the defaults for new Fedora 33 installations. In _fstab_ you can also choose to customize compression and add options like _noatime._

See the relevant [wiki page about compression][15] and _[man 5 btrfs][10]_ for all relevant options.

##### Chroot into your system

If you’ve ever done system recovery, I’m pretty sure you know these commands. Here, we get a shell prompt that is essentially _inside_ your system, with network access.

First, we have to remount the _root_ subvolume to _/mnt_, then mount the _/boot_ and _/boot/efi_ partitions (these can be different depending on your filesystem layout):

```
# umount /mnt
# mount -o subvol=root /dev/sdXX /mnt
# mount /dev/sdXX /mnt/boot
# mount /dev/sdXX /mnt/boot/efi
```

Then we can move on to mounting system devices:

```
# mount -t proc /proc /mnt/proc
# mount --rbind /dev /mnt/dev
# mount --make-rslave /mnt/dev
# mount --rbind /sys /mnt/sys
# mount --make-rslave /mnt/sys
# cp /mnt/etc/resolv.conf /mnt/etc/resolv.conf.chroot
# cp -L /etc/resolv.conf /mnt/etc
# chroot /mnt /bin/bash
$ ping www.fedoraproject.org
```

##### Reinstall GRUB &amp; kernel

The easiest way – now that we have network access – is to reinstall GRUB and the kernel because it does all configuration necessary. So, inside the chroot:

```
# mount /boot/efi
# dnf reinstall grub2-efi shim
# grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
# dnf reinstall kernel-core
...or just renegenerating initramfs:
# dracut --kver $(uname -r) --force
```

This applies if you have an UEFI system. Check the docs below if you have a BIOS system. Let’s check if everything went well, before rebooting:

```
# cat /boot/grub2/grubenv
# cat /boot/efi/EFI/fedora/grub.cfg
# lsinitrd /boot/initramfs-$(uname -r).img | grep btrfs
```

You should have proper partition UUIDs or references in _grubenv_ and _grub.cfg_ (grubenv may not have been updated, edit it if needed) and see _insmod btrfs_ in _grub.cfg_ and _btrfs_ module in your initramfs image.

See also: [Reinstalling GRUB 2][16] and [Verifying the Initial RAM Disk Image][17] in the Fedora System Administration Guide.

##### Reboot

Now your system should boot properly. If not, don’t panic, go back to the live image and fix the issue. In the worst case, you can just reinstall Fedora from right there.

##### After first boot

Check that everything is fine with your new Btrfs system. If you are happy, you’ll need to reclaim the space used by the old _ext4_ snapshot, defragment and balance the subvolumes. The latter two might take some time and is quite resource intensive.

You have to mount the top level subvolume for this:

```
# mount /dev/sdXX -o subvol=/ /mnt/someFolder
# btrfs subvolume delete /mnt/someFolder/ext2_saved
```

Then, run these commands when the machine has some idle time:

```
# btrfs filesystem defrag -v -r -f /
# btrfs filesystem defrag -v -r -f /home
# btrfs balance start -m /
```

Finally, there’s a “no copy-on-write” [attribute][18] that is automatically set for virtual machine image folders for new installations. Set it if you are using VMs:

```
#
```

chattr +C /var/lib/libvirt/images

```
$ chattr +C
```

~/.local/share/gnome-boxes/images
```

```

This attribute only takes effect for new files in these folders. Duplicate the images and delete the originals. You can confirm the result with _lsattr_.

### Wrapping up

I really hope that you have found this guide to be useful, and was able to make a careful and educated decision about whether or not to convert to Btrfs on your system. I wish you a successful conversion process!

Feel free to share your experience here in the comments, or if you run into deeper issues, on [ask.fedoraproject.org][19].

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/convert-your-filesystem-to-btrfs/

作者：[Gergely Gombos][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gombosg/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/08/butterfs-816x346.png
[2]: https://ask.fedoraproject.org/t/conversion-of-an-existing-ext4-fedora-32-system-completely-to-btrfs/9446/6?u=gombosghttps://ask.fedoraproject.org/t/conversion-of-an-existing-ext4-fedora-32-system-completely-to-btrfs/9446/6?u=gombosg
[3]: https://fedoramagazine.org/reclaim-hard-drive-space-with-lvm/
[4]: https://fedoramagazine.org/recover-your-files-from-btrfs-snapshots/
[5]: https://fedoramagazine.org/choose-between-btrfs-and-lvm-ext4/
[6]: https://fedoramagazine.org/btrfs-coming-to-fedora-33/
[7]: https://btrfs.wiki.kernel.org/index.php/SysadminGuide
[8]: https://btrfs.wiki.kernel.org/index.php/Conversion_from_Ext3
[9]: https://www.mankier.com/8/btrfs
[10]: https://www.mankier.com/5/btrfs
[11]: https://www.mankier.com/8/btrfs-convert
[12]: https://www.mankier.com/8/btrfs-subvolume
[13]: https://getfedora.org/en/workstation/download/
[14]: https://www.mankier.com/8/btrfs-subvolume#Subvolume_and_Snapshot
[15]: https://btrfs.wiki.kernel.org/index.php/Compression
[16]: https://docs.fedoraproject.org/en-US/fedora/f33/system-administrators-guide/kernel-module-driver-configuration/Working_with_the_GRUB_2_Boot_Loader/#sec-Reinstalling_GRUB_2
[17]: https://docs.fedoraproject.org/en-US/fedora/f33/system-administrators-guide/kernel-module-driver-configuration/Manually_Upgrading_the_Kernel/#sec-Verifying_the_Initial_RAM_Disk_Image
[18]: https://www.mankier.com/1/chattr#Attributes-C
[19]: https://ask.fedoraproject.org/
