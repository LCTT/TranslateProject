Use LVM to Upgrade Fedora
======

![](https://fedoramagazine.org/wp-content/uploads/2018/06/lvm-upgrade-816x345.jpg)

Most users find it simple to upgrade [from one Fedora release to the next][1] with the standard process. However, there are inevitably many special cases that Fedora can also handle. This article shows one way to upgrade using DNF along with Logical Volume Management (LVM) to keep a bootable backup in case of problems. This example upgrades a Fedora 26 system to Fedora 28.

The process shown here is more complex than the standard upgrade process. You should have a strong grasp of how LVM works before you use this process. Without proper skill and care, you could **lose data and/or be forced to reinstall your system!** If you don’t know what you’re doing, it is **highly recommended** you stick to the supported upgrade methods only.

### Preparing the system

Before you start, ensure your existing system is fully updated.
```
$ sudo dnf update
$ sudo systemctl reboot # or GUI equivalent

```

Check that your root filesystem is mounted via LVM.
```
$ df /
Filesystem 1K-blocks Used Available Use% Mounted on
/dev/mapper/vg_sdg-f26 20511312 14879816 4566536 77% /

$ sudo lvs
LV VG Attr LSize Pool Origin Data% Meta% Move Log Cpy%Sync Convert
f22 vg_sdg -wi-ao---- 15.00g
f24_64 vg_sdg -wi-ao---- 20.00g
f26 vg_sdg -wi-ao---- 20.00g
home vg_sdg -wi-ao---- 100.00g
mockcache vg_sdg -wi-ao---- 10.00g
swap vg_sdg -wi-ao---- 4.00g
test vg_sdg -wi-a----- 1.00g
vg_vm vg_sdg -wi-ao---- 20.00g

```

If you used the defaults when you installed Fedora, you may find the root filesystem is mounted on a LV named root. The name of your volume group will likely be different. Look at the total size of the root volume. In the example, the root filesystem is named f26 and is 20G in size.

Next, ensure you have enough free space in LVM.
```
$ sudo vgs
VG #PV #LV #SN Attr VSize VFree
vg_sdg 1 8 0 wz--n- 232.39g 42.39g

```

This system has enough free space to allocate a 20G logical volume for the upgraded Fedora 28 root. If you used the default install, there will be no free space in LVM. Managing LVM in general is beyond the scope of this article, but here are some possibilities:

1\. /home on its own LV, and lots of free space in /home

You can logout of the GUI and switch to a text console, logging in as root. Then you can unmount /home, and use lvreduce -r to resize and reallocate the /home LV. You might also boot from a Live image (so as not to use /home) and use the gparted GUI utility.

2\. Most of the LVM space allocated to a root LV, with lots of free space in the filesystem

You can boot from a Live image and use the gparted GUI utility to reduce the root LV. Consider moving /home to its own filesystem at this point, but that is beyond the scope of this article.

3\. Most of the file systems are full, but you have LVs you no longer need

You can delete the unneeded LVs, freeing space in the volume group for this operation.

### Creating a backup

First, allocate a new LV for the upgraded system. Make sure to use the correct name for your system’s volume group (VG). In this example it’s vg_sdg.
```
$ sudo lvcreate -L20G -n f28 vg_sdg
Logical volume "f28" created.

```

Next, make a snapshot of your current root filesystem. This example creates a snapshot volume named f26_s.
```
$ sync
$ sudo lvcreate -s -L1G -n f26_s vg_sdg/f26
Using default stripesize 64.00 KiB.
Logical volume "f26_s" created.

```

The snapshot can now be copied to the new LV. **Make sure you have the destination correct** when you substitute your own volume names. If you are not careful you could delete data irrevocably. Also, make sure you are copying from the snapshot of your root, **not** your live root.
```
$ sudo dd if=/dev/vg_sdg/f26_s of=/dev/vg_sdg/f28 bs=256k
81920+0 records in
81920+0 records out
21474836480 bytes (21 GB, 20 GiB) copied, 149.179 s, 144 MB/s

```

Give the new filesystem copy a unique UUID. This is not strictly necessary, but UUIDs are supposed to be unique, so this avoids future confusion. Here is how for an ext4 root filesystem:
```
$ sudo e2fsck -f /dev/vg_sdg/f28
$ sudo tune2fs -U random /dev/vg_sdg/f28

```

Then remove the snapshot volume which is no longer needed:
```
$ sudo lvremove vg_sdg/f26_s
Do you really want to remove active logical volume vg_sdg/f26_s? [y/n]: y
Logical volume "f26_s" successfully removed

```

You may wish to make a snapshot of /home at this point if you have it mounted separately. Sometimes, upgraded applications make changes that are incompatible with a much older Fedora version. If needed, edit the /etc/fstab file on the **old** root filesystem to mount the snapshot on /home. Remember that when the snapshot is full, it will disappear! You may also wish to make a normal backup of /home for good measure.

### Configuring to use the new root

First, mount the new LV and backup your existing GRUB settings:
```
$ sudo mkdir /mnt/f28
$ sudo mount /dev/vg_sdg/f28 /mnt/f28
$ sudo mkdir /mnt/f28/f26
$ cd /boot/grub2
$ sudo cp -p grub.cfg grub.cfg.old

```

Edit grub.conf and add this before the first menuentry, unless you already have it:
```
menuentry 'Old boot menu' {
 configfile /grub2/grub.cfg.old
}

```

Edit grub.conf and change the default menuentry to activate and mount the new root filesystem. Change this line:
```
linux16 /vmlinuz-4.16.11-100.fc26.x86_64 root=/dev/mapper/vg_sdg-f26 ro rd.lvm.lv=vg_sdg/f26 rd.lvm.lv=vg_sdg/swap rhgb quiet LANG=en_US.UTF-8

```

So that it reads like this. Remember to use the correct names for your system’s VG and LV entries!
```
linux16 /vmlinuz-4.16.11-100.fc26.x86_64 root=/dev/mapper/vg_sdg-f28 ro rd.lvm.lv=vg_sdg/f28 rd.lvm.lv=vg_sdg/swap rhgb quiet LANG=en_US.UTF-8

```

Edit /mnt/f28/etc/default/grub and change the default root LV activated at boot:
```
GRUB_CMDLINE_LINUX="rd.lvm.lv=vg_sdg/f28 rd.lvm.lv=vg_sdg/swap rhgb quiet"

```

Edit /mnt/f28/etc/fstab to change the mounting of the root filesystem from the old volume:
```
/dev/mapper/vg_sdg-f26 / ext4 defaults 1 1

```

to the new one:
```
/dev/mapper/vg_sdg-f28 / ext4 defaults 1 1

```

Then, add a read-only mount of the old system for reference purposes:
```
/dev/mapper/vg_sdg-f26 /f26 ext4 ro,nodev,noexec 0 0

```

If your root filesystem is mounted by UUID, you will need to change this. Here is how if your root is an ext4 filesystem:
```
$ sudo e2label /dev/vg_sdg/f28 F28

```

Now edit /mnt/f28/etc/fstab to use the label. Change the mount line for the root file system so it reads like this:
```
LABEL=F28 / ext4 defaults 1 1

```

### Rebooting and upgrading

Reboot, and your system will be using the new root filesystem. It is still Fedora 26, but a copy with a new LV name, and ready for dnf system-upgrade! If anything goes wrong, use the Old Boot Menu to boot back into your working system, which this procedure avoids touching.
```
$ sudo systemctl reboot # or GUI equivalent
...
$ df / /f26
Filesystem 1K-blocks Used Available Use% Mounted on
/dev/mapper/vg_sdg-f28 20511312 14903196 4543156 77% /
/dev/mapper/vg_sdg-f26 20511312 14866412 4579940 77% /f26

```

You may wish to verify that using the Old Boot Menu does indeed get you back to having root mounted on the old root filesystem.

Now follow the instructions at [this wiki page][2]. If anything goes wrong with the system upgrade, you have a working system to boot back into.

### Future ideas

The steps to create a new LV and copy a snapshot of root to it could be automated with a generic script. It needs only the name of the new LV, since the size and device of the existing root are easy to determine. For example, one would be able to type this command:
```
$ sudo copyfs / f28

```

Supplying the mount-point to copy makes it clearer what is happening, and copying other mount-points like /home could be useful.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-lvm-upgrade-fedora/

作者：[Stuart D Gathman][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/sdgathman/
[1]:https://fedoramagazine.org/upgrading-fedora-27-fedora-28/
[2]:https://fedoraproject.org/wiki/DNF_system_upgrade
