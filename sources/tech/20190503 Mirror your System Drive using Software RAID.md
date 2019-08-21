[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Mirror your System Drive using Software RAID)
[#]: via: (https://fedoramagazine.org/mirror-your-system-drive-using-software-raid/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

Mirror your System Drive using Software RAID
======

![][1]

Nothing lasts forever. When it comes to the hardware in your PC, most of it can easily be replaced. There is, however, one special-case hardware component in your PC that is not as easy to replace as the rest — your hard disk drive.

### Drive Mirroring

Your hard drive stores your personal data. Some of your data can be backed up automatically by scheduled backup jobs. But those jobs scan the files to be backed up for changes and trying to scan an entire drive would be very resource intensive. Also, anything that you’ve changed since your last backup will be lost if your drive fails. [Drive mirroring][2] is a better way to maintain a secondary copy of your entire hard drive. With drive mirroring, a secondary copy of _all the data_ on your hard drive is maintained _in real time_.

An added benefit of live mirroring your hard drive to a secondary hard drive is that it can [increase your computer’s performance][3]. Because disk I/O is one of your computer’s main performance [bottlenecks][4], the performance improvement can be quite significant.

Note that a mirror is not a backup. It only protects your data from being lost if one of your physical drives fail. Types of failures that drive mirroring, by itself, does not protect against include:

  * [File System Corruption][5]
  * [Bit Rot][6]
  * Accidental File Deletion
  * Simultaneous Failure of all Mirrored Drives (highly unlikely)



Some of the above can be addressed by other file system features that can be used in conjunction with drive mirroring. File system features that address the above types of failures include:

  * Using a [Journaling][7] or [Log-Structured][8] file system
  * Using [Checksums][9] ([ZFS][10] , for example, does this automatically and transparently)
  * Using [Snapshots][11]
  * Using [BCVs][12]



This guide will demonstrate one method of mirroring your system drive using the Multiple Disk and Device Administration (mdadm) toolset. Just for fun, this guide will show how to do the conversion without using any extra boot media (CDs, USB drives, etc). For more about the concepts and terminology related to the multiple device driver, you can skim the _md_ man page:

```
$ man md
```

### The Procedure

  1. **Use** [**sgdisk**][13] **to (re)partition the _extra_ drive that you have added to your computer** :

```
 $ sudo -i
# MY_DISK_1=/dev/sdb
# sgdisk --zap-all $MY_DISK_1
# test -d /sys/firmware/efi/efivars || sgdisk -n 0:0:+1MiB -t 0:ef02 -c 0:grub_1 $MY_DISK_1
# sgdisk -n 0:0:+1GiB -t 0:ea00 -c 0:boot_1 $MY_DISK_1
# sgdisk -n 0:0:+4GiB -t 0:fd00 -c 0:swap_1 $MY_DISK_1
# sgdisk -n 0:0:0 -t 0:fd00 -c 0:root_1 $MY_DISK_1
```

– If the drive that you will be using for the second half of the mirror in step 12 is smaller than this drive, then you will need to adjust down the size of the last partition so that the total size of all the partitions is not greater than the size of your second drive.
– A few of the commands in this guide are prefixed with a test for the existence of an _efivars_ directory. This is necessary because those commands are slightly different depending on whether your computer is BIOS-based or UEFI-based.

  2. **Use** [**mdadm**][14] **to create RAID devices that use the new partitions to store their data** :

```
 # mdadm --create /dev/md/boot --homehost=any --metadata=1.0 --level=1 --raid-devices=2 /dev/disk/by-partlabel/boot_1 missing
# mdadm --create /dev/md/swap --homehost=any --metadata=1.0 --level=1 --raid-devices=2 /dev/disk/by-partlabel/swap_1 missing
# mdadm --create /dev/md/root --homehost=any --metadata=1.0 --level=1 --raid-devices=2 /dev/disk/by-partlabel/root_1 missing

# cat << END > /etc/mdadm.conf
MAILADDR root
AUTO +all
DEVICE partitions
END

# mdadm --detail --scan >> /etc/mdadm.conf
```

– The _missing_ parameter tells mdadm to create an array with a missing member. You will add the other half of the mirror in step 14.
– You should configure [sendmail][15] so you will be notified if a drive fails.
– You can configure [Evolution][16] to [monitor a local mail spool][17].

  3. **Use** [**dracut**][18] **to update the initramfs** :

```
# dracut -f --add mdraid --add-drivers xfs
```

– Dracut will include the /etc/mdadm.conf file you created in the previous section in your initramfs _unless_ you build your initramfs with the _hostonly_ option set to _no_. If you build your initramfs with the hostonly option set to no, then you should either manually include the /etc/mdadm.conf file, manually specify the UUID’s of the RAID arrays to assemble at boot time with the _rd.md.uuid_ kernel parameter, or specify the _rd.auto_ kernel parameter to have all RAID arrays automatically assembled and started at boot time. This guide will demonstrate the _rd.auto_ option since it is the most generic.

  4. **Format the RAID devices** :

```
 # mkfs -t vfat /dev/md/boot
# mkswap /dev/md/swap
# mkfs -t xfs /dev/md/root
```

– The new [Boot Loader Specification][19] states “if the OS is installed on a disk with GPT disk label, and no ESP partition exists yet, a new suitably sized (let’s say 500MB) ESP should be created and should be used as $BOOT” and “$BOOT must be a VFAT (16 or 32) file system”.

  5. **Reboot and set the _rd.auto_ , _rd.break_ and _single_ kernel parameters** :

```
# reboot
```

– You may need to [set your root password][20] before rebooting so that you can get into _single-user mode_ in step 7.
– See “[Making Temporary Changes to a GRUB 2 Menu][21]” for directions on how to set kernel parameters on compters that use the GRUB 2 boot loader.

  6. **Use** [**the dracut shell**][18] **to copy the root file system** :

```
 # mkdir /newroot
# mount /dev/md/root /newroot
# shopt -s dotglob
# cp -ax /sysroot/* /newroot
# rm -rf /newroot/boot/*
# umount /newroot
# exit
```

– The _dotglob_ flag is set for this bash session so that the [wildcard character][22] will match hidden files.
– Files are removed from the _boot_ directory because they will be copied to a separate partition in the next step.
– This copy operation is being done from the dracut shell to insure that no processes are accessing the files while they are being copied.

  7. **Use _single-user mode_ to copy the non-root file systems** :

```
 # mkdir /newroot
# mount /dev/md/root /newroot
# mount /dev/md/boot /newroot/boot
# shopt -s dotglob
# cp -Lr /boot/* /newroot/boot
# test -d /newroot/boot/efi/EFI && mv /newroot/boot/efi/EFI/* /newroot/boot/efi && rmdir /newroot/boot/efi/EFI
# test -d /sys/firmware/efi/efivars && ln -sfr /newroot/boot/efi/fedora/grub.cfg /newroot/etc/grub2-efi.cfg
# cp -ax /home/* /newroot/home
# exit
```

– It is OK to run these commands in the dracut shell shown in the previous section instead of doing it from single-user mode. I’ve demonstrated using single-user mode to avoid having to explain how to mount the non-root partitions from the dracut shell.
– The parameters being past to the _cp_ command for the _boot_ directory are a little different because the VFAT file system doesn’t support symbolic links or Unix-style file permissions.
– In rare cases, the _rd.auto_ parameter is known to cause LVM to fail to assemble due to a [race condition][23]. If you see errors about your _swap_ or _home_ partition failing to mount when entering single-user mode, simply try again by repeating step 5 but omiting the _rd.break_ paramenter so that you will go directly to single-user mode.

  8. **Update _fstab_ on the new drive** :

```
 # cat << END > /newroot/etc/fstab
/dev/md/root / xfs defaults 0 0
/dev/md/boot /boot vfat defaults 0 0
/dev/md/swap swap swap defaults 0 0
END
```

  9. **Configure the boot loader on the new drive** :

```
 # NEW_GRUB_CMDLINE_LINUX=$(cat /etc/default/grub | sed -n 's/^GRUB_CMDLINE_LINUX="\(.*\)"/\1/ p')
# NEW_GRUB_CMDLINE_LINUX=${NEW_GRUB_CMDLINE_LINUX//rd.lvm.*([^ ])}
# NEW_GRUB_CMDLINE_LINUX=${NEW_GRUB_CMDLINE_LINUX//resume=*([^ ])}
# NEW_GRUB_CMDLINE_LINUX+=" selinux=0 rd.auto"
# sed -i "/^GRUB_CMDLINE_LINUX=/s/=.*/=\"$NEW_GRUB_CMDLINE_LINUX\"/" /newroot/etc/default/grub
```

– You can re-enable selinux after this procedure is complete. But you will have to [relabel your file system][24] first.

  10. **Install the boot loader on the new drive** :

```
 # sed -i '/^GRUB_DISABLE_OS_PROBER=.*/d' /newroot/etc/default/grub
# echo "GRUB_DISABLE_OS_PROBER=true" >> /newroot/etc/default/grub
# MY_DISK_1=$(mdadm --detail /dev/md/boot | grep active | grep -m 1 -o "/dev/sd.")
# for i in dev dev/pts proc sys run; do mount -o bind /$i /newroot/$i; done
# chroot /newroot env MY_DISK_1=$MY_DISK_1 bash --login
# test -d /sys/firmware/efi/efivars || MY_GRUB_DIR=/boot/grub2
# test -d /sys/firmware/efi/efivars && MY_GRUB_DIR=$(find /boot/efi -type d -name 'fedora' -print -quit)
# test -e /usr/sbin/grub2-switch-to-blscfg && grub2-switch-to-blscfg --grub-directory=$MY_GRUB_DIR
# grub2-mkconfig -o $MY_GRUB_DIR/grub.cfg \;
# test -d /sys/firmware/efi/efivars && test /boot/grub2/grubenv -nt $MY_GRUB_DIR/grubenv && cp /boot/grub2/grubenv $MY_GRUB_DIR/grubenv
# test -d /sys/firmware/efi/efivars || grub2-install "$MY_DISK_1"
# logout
# for i in run sys proc dev/pts dev; do umount /newroot/$i; done
# test -d /sys/firmware/efi/efivars && efibootmgr -c -d "$MY_DISK_1" -p 1 -l "$(find /newroot/boot -name shimx64.efi -printf '/%P\n' -quit | sed 's!/!\\!g')" -L "Fedora RAID Disk 1"
```

– The _grub2-switch-to-blscfg_ command is optional. It is only supported on Fedora 29+.
– The _cp_ command above should not be necessary, but there appears to be a bug in the current version of grub which causes it to write to $BOOT/grub2/grubenv instead of $BOOT/efi/fedora/grubenv on UEFI systems.
– You can use the following command to verify the contents of the _grub.cfg_ file right after running the _grub2-mkconfig_ command above:

```
# sed -n '/BEGIN .*10_linux/,/END .*10_linux/ p' $MY_GRUB_DIR/grub.cfg
```

– You should see references to _mdraid_ and _mduuid_ in the output from the above command if the RAID array was detected properly.

  11. **Boot off of the new drive** :

```
# reboot
```

– How to select the new drive is system-dependent. It usually requires pressing one of the **F12** , **F10** , **Esc** or **Del** keys when you hear the [System OK BIOS beep code][25].
– On UEFI systems the boot loader on the new drive should be labeled “Fedora RAID Disk 1”.

  12. **Remove all the volume groups and partitions from your old drive** :

```
 # MY_DISK_2=/dev/sda
# MY_VOLUMES=$(pvs | grep $MY_DISK_2 | awk '{print $2}' | tr "\n" " ")
# test -n "$MY_VOLUMES" && vgremove $MY_VOLUMES
# sgdisk --zap-all $MY_DISK_2
```

– **WARNING** : You want to make certain that everything is working properly on your new drive before you do this. A good way to verify that your old drive is no longer being used is to try booting your computer once without the old drive connected.
– You can add another new drive to your computer instead of erasing your old one if you prefer.

  13. **Create new partitions on your old drive to match the ones on your new drive** :

```
 # test -d /sys/firmware/efi/efivars || sgdisk -n 0:0:+1MiB -t 0:ef02 -c 0:grub_2 $MY_DISK_2
# sgdisk -n 0:0:+1GiB -t 0:ea00 -c 0:boot_2 $MY_DISK_2
# sgdisk -n 0:0:+4GiB -t 0:fd00 -c 0:swap_2 $MY_DISK_2
# sgdisk -n 0:0:0 -t 0:fd00 -c 0:root_2 $MY_DISK_2
```

– It is important that the partitions match in size and type. I prefer to use the _parted_ command to display the partition table because it supports setting the display unit:

```
 # parted /dev/sda unit MiB print
# parted /dev/sdb unit MiB print
```

  14. **Use mdadm to add the new partitions to the RAID devices** :

```
 # mdadm --manage /dev/md/boot --add /dev/disk/by-partlabel/boot_2
# mdadm --manage /dev/md/swap --add /dev/disk/by-partlabel/swap_2
# mdadm --manage /dev/md/root --add /dev/disk/by-partlabel/root_2
```

  15. **Install the boot loader on your old drive** :

```
 # test -d /sys/firmware/efi/efivars || grub2-install "$MY_DISK_2"
# test -d /sys/firmware/efi/efivars && efibootmgr -c -d "$MY_DISK_2" -p 1 -l "$(find /boot -name shimx64.efi -printf "/%P\n" -quit | sed 's!/!\\!g')" -L "Fedora RAID Disk 2"
```

  16. **Use mdadm to test that email notifications are working** :

```
# mdadm --monitor --scan --oneshot --test
```




As soon as your drives have finished synchronizing, you should be able to select either drive when restarting your computer and you will receive the same live-mirrored operating system. If either drive fails, mdmonitor will send an email notification. Recovering from a drive failure is now simply a matter of swapping out the bad drive with a new one and running a few _sgdisk_ and _mdadm_ commands to re-create the mirrors (steps 13 through 15). You will no longer have to worry about losing any data if a drive fails!

### Video Demonstrations

Converting a UEFI PC to RAID1

Converting a BIOS PC to RAID1

  * TIP: Set the the quality to 720p on the above videos for best viewing.



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/mirror-your-system-drive-using-software-raid/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/05/raid_mirroring-816x345.jpg
[2]: https://en.wikipedia.org/wiki/Disk_mirroring
[3]: https://en.wikipedia.org/wiki/Disk_mirroring#Additional_benefits
[4]: https://en.wikipedia.org/wiki/Bottleneck_(software)
[5]: https://en.wikipedia.org/wiki/Data_corruption
[6]: https://en.wikipedia.org/wiki/Data_degradation
[7]: https://en.wikipedia.org/wiki/Journaling_file_system
[8]: https://www.quora.com/What-is-the-difference-between-a-journaling-vs-a-log-structured-file-system
[9]: https://en.wikipedia.org/wiki/File_verification
[10]: https://en.wikipedia.org/wiki/ZFS#Summary_of_key_differentiating_features
[11]: https://en.wikipedia.org/wiki/Snapshot_(computer_storage)#File_systems
[12]: https://en.wikipedia.org/wiki/Business_continuance_volume
[13]: https://fedoramagazine.org/managing-partitions-with-sgdisk/
[14]: https://fedoramagazine.org/managing-raid-arrays-with-mdadm/
[15]: https://fedoraproject.org/wiki/QA:Testcase_Sendmail
[16]: https://en.wikipedia.org/wiki/Evolution_(software)
[17]: https://dotancohen.com/howto/root_email.html
[18]: https://fedoramagazine.org/initramfs-dracut-and-the-dracut-emergency-shell/
[19]: https://systemd.io/BOOT_LOADER_SPECIFICATION#technical-details
[20]: https://docs.fedoraproject.org/en-US/Fedora/26/html/System_Administrators_Guide/sec-Changing_and_Resetting_the_Root_Password.html
[21]: https://docs.fedoraproject.org/en-US/fedora/rawhide/system-administrators-guide/kernel-module-driver-configuration/Working_with_the_GRUB_2_Boot_Loader/#sec-Making_Temporary_Changes_to_a_GRUB_2_Menu
[22]: https://en.wikipedia.org/wiki/Wildcard_character#File_and_directory_patterns
[23]: https://en.wikipedia.org/wiki/Race_condition
[24]: https://wiki.centos.org/HowTos/SELinux#head-867ca18a09f3103705cdb04b7d2581b69cd74c55
[25]: https://en.wikipedia.org/wiki/Power-on_self-test#Original_IBM_POST_beep_codes
