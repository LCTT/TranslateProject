[#]: subject: (OS Chroot 101: covering btrfs subvolumes)
[#]: via: (https://fedoramagazine.org/os-chroot-101-covering-btrfs-subvolumes/)
[#]: author: (yannick duclap https://fedoramagazine.org/author/cybermeme/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

OS Chroot 101: covering btrfs subvolumes
======

![][1]

OS chroot command allows you to mount and run another Gnu/Linux from within your current Gnu/Linux. It does this by mounting nested partition(s) within your system and it gives you a shell which allows access to this chrooted OS. This will allow you to manage or debug another Gnu/Linux from your running Fedora Linux

### Intro

##### Disclaimer

When I say _chroot_, I mean the command, and _chrootDir_ a folder. _OSext_ is the external OS to work with. All the following commands are executed as superuser. For extra readability I removed the sudo at the beginning, just don’t forget to be superadmin when performing the tasks. […] means I cut some terminal output.

First I’m going to review how to do a chroot on a classic filesystem (ext4, xfs, fat, etc) and then we’ll see how to do it on our brand new standard Btrfs and its subvolumes.

The process is similar to that used to [change the root password][2], or that we may use to repair a corrupted fstab (it happens, trust me). We can also use the chroot command to mount a Gnu/Linux in our Fedora Linux in order to perform operations (updates, file recovery, debugging, etc).

#### A few explanations

The [chroot][3] command lets you “change” temporarily the root location. This lets you partition a service or a user in the directory tree.

When you use _chroot_ to run a mounted Gnu/Linux OS, in order for it to be fully functional, you have to mount the special system folders in their “original places in the directory tree” in the chrootDir. This allows the chrooted OS to talk to the kernel.

These special system folders are:

  * _/dev_ for the devices;
  * _/proc_ which contains the information about the system (kernel and process);
  * _/sys_ which contains the information about the hardware.



For example, _/dev_ has to be mounted in _chrootDir/dev_.

As I always learn better by practicing, let’s do some hands on.

### Filesystems without btrfs subvolumes

#### The classic method

In the following example, the partition we are going to mount is the OSext root (_/_). This is located in _/dev/vda2_ and we will mount it in the chrootDir (_/mnt_) directory. _/mnt_ is not a necessity, you can also mount the partition somewhere else.

```
# mount /dev/vda2 /mnt
# mount --bind /dev /mnt/dev
# mount -t proc /proc /mnt/proc
# mount -t sysfs /sys /mnt/sys
# mount -t tmpfs tmpfs /mnt/run
# mkdir -p /mnt/run/systemd/resolve/
# echo 'nameserver 1.1.1.1' > /mnt/run/systemd/resolve/stub-resolv.conf
# chroot /mnt
```

The _–bind_ option makes the contents accessible in both locations, _-t_ defines the filesystem type. See the [manpage][4] for more information.

We will mount _/run_ as _tmpfs_ (in the memory) because we are using systemd-resolved (this is the default now in Fedora). Then we will create the folder and the file _stub-resolv.conf,_ which is associated by a symbolic link to /_etc/resolv.conf_. This file contains the resolver IP. In this example, the resolver is 1.1.1.1, but you can use any resolver IP you like.

To exit the chroot, the shell command is _exit_. After that, we unmount all the folders we just mounted:

```
exit
# umount /mnt/dev
# umount /mnt/proc
# umount /mnt/sys
# umount /mnt/run
# umount /mnt
```

#### The case of lvm

In the case of lvm, the partitions are not available directly and must be mapped first.

```
# fdisk -l /dev/vda2
Disk /dev/vda2: 19 GiB, 20400046080 bytes, 39843840 sectors
[...]
I/O size (minimum/optimal): 512 bytes / 512 bytes

# mount /dev/vda2 /mnt/
mount: /mnt: unknown filesystem type 'LVM2_member'.
```

As you can see, we are not able to mount _/dev/vda2_ directly. We will now use the lvm tools to locate our partitions.

```
# pvscan
PV /dev/vda2   VG cl              lvm2 [<19.00 GiB / 0    free]
Total: 1 [<19.00 GiB] / in use: 1 [<19.00 GiB] / in no VG: 0 [0]

# vgscan
Found volume group "cl" using metadata type lvm2

# lvscan
ACTIVE            '/dev/cl/root' [10.00 GiB] inherit
ACTIVE            '/dev/cl/swap' [2.00 GiB] inherit
ACTIVE            '/dev/cl/home' [1.00 GiB] inherit
ACTIVE            '/dev/cl/var' [<6.00 GiB] inherit
```

So here we can see where the logical volumes are mapped _/dev/cl_ and we can mount these partitions like we did before, using the same method:

```
# mount /dev/cl/root /mnt/
# mount /dev/cl/home /mnt/home/
# mount /dev/cl/var /mnt/var/
# mount --bind /dev /mnt/dev
# mount -t proc /proc /mnt/proc
# mount -t sysfs /sys /mnt/sys
# mount -t tmpfs tmpfs /mnt/run
# mkdir -p /mnt/run/systemd/resolve/
# echo 'nameserver 1.1.1.1' > /mnt/run/systemd/resolve/stub-resolv.conf
# chroot /mnt
```

### Btrfs filesystem with subvolumes

#### Overview of a btrfs partition with subvolumes

Let’s have a look at the filesystem.

Fdisk tells us that there are only two partitions on the physical media.

```
# fdisk -l
Disk /dev/vda: 20 GiB, 21474836480 bytes, 41943040 sectors
 […]
 Device Boot Start End Sectors Size Id Type
 /dev/vda1 * 2048 2099199 2097152 1G 83 Linux
 /dev/vda2 2099200 41943039 39843840 19G 83 Linux
```

Here are the contents of the target system’s fstab (OSext):

```
UUID=3de441bd-59fc-4a12-8343-8392faab5ac7 /     btrfs subvol=root,compress=zstd:1 0 0
UUID=71dc4f0f-9562-40d6-830b-bea065d4f246 /boot ext4 defaults 1 2
UUID=3de441bd-59fc-4a12-8343-8392faab5ac7 /home btrfs subvol=home,compress=zstd:1 0 0
```

Looking at the _UUID_s in the _fstab_, we can see that there are two different ones.

One is an ext4, used here for _/boot_ and the other is a btrfs containing two mount points (the subvolumes), _/_ and _/home_.

#### Overview of a btrfs filesystem with subvolumes

Let’s have a look at what is in the btrfs partition (_/dev/vda2_ here) by mounting it directly:

```
# mount /dev/vda2 /mnt/
# ls /mnt/
home root

# ls /mnt/root/
bin dev home lib64 media opt root sbin sys usr
boot etc lib lost+found mnt proc run srv tmp var

# ls /mnt/home/
user

# umount /mnt
```

Here we can see that in the mounted partition there are two folders (the subvolumes), that contain lots of different directories (the target file hierarchy).

To get this information about the subvolumes, there is a much more elegant way.

```
# mount /dev/vda2 /mnt/

# btrfs subvolume list /mnt
ID 256 gen 178 top level 5 path home
ID 258 gen 200 top level 5 path root
ID 262 gen 160 top level 258 path root/var/lib/machines

# umount /mnt
```

#### Practical chroot with btrfs subvolumes

Now that we’ve had a look at the contents of our partition, we will mount the system on chrootDir (_/mnt_ in the example). We will do this by adding the mount type as btrfs and the option for subvolume _subvol=SubVolumeName_. We will also add the special system folders and other partitions in the same way.

```
# mount /dev/vda2 /mnt/ -t btrfs -o subvol=root

# ls /mnt/
bin dev home lib64 media opt root sbin sys usr
boot etc lib lost+found mnt proc run srv tmp var

# ls /mnt/home/
<it's still empty>

# mount /dev/vda2 /mnt/home -t btrfs -o subvol=home

# ls /mnt/home/
user

# mount /dev/vda1 /boot
# mount --bind /dev /mnt/dev
# mount -t proc /proc /mnt/proc
# mount -t sysfs /sys /mnt/sys
# mount -t tmpfs tmpfs /mnt/run
# mkdir -p /mnt/run/systemd/resolve/
# echo 'nameserver 1.1.1.1' > /mnt/run/systemd/resolve/stub-resolv.conf
# chroot /mnt
```

When the job is done, we use the shell command _exit_ and unmount all previously mounted directories as well as the chrootDir itself (_/mnt_).

```
exit
# umount /mnt/boot
# umount /mnt/sys
# umount /mnt/proc
# umount /mnt/sys
# umount /mnt/run
# umount /mnt
```

### Conclusion

As you can see on the screenshot below, I performed a dnf update on a Fedora Linux 34 Workstation from a live [Fedora 33 security lab CD][5], that way, if a friend needs you to debug his/her/their Gnu/Linux, he/she/they just have to bring the hard drive to you and not the whole desktop/server machine.

![][6]

Be careful if you use a different shell between your host OS and OSext (the chrooted OS), for example ksh &lt;-&gt; bash.
In this case you’ll have to make sure that both systems have the same shell installed.

I hope this will be useful to anyone needing to debug, or if you just need to update your other Fedora Linux in your dual boot and don’t want to have to restart 😉

This article just referred to a part of btrfs, for more information you can have a look at the the [wiki][7] which will give you all the information you need.

Have fun chrooting.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/os-chroot-101-covering-btrfs-subvolumes/

作者：[yannick duclap][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/cybermeme/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/07/chroot-btrfs-816x345.jpg
[2]: https://fedoramagazine.org/reset-root-password-fedora/
[3]: https://man7.org/linux/man-pages/man2/chroot.2.html
[4]: https://man7.org/linux/man-pages/man8/mount.8.html
[5]: https://labs.fedoraproject.org/security/download/index.html
[6]: https://fedoramagazine.org/wp-content/uploads/2021/07/fedoraSecurity.png
[7]: https://fedoraproject.org/wiki/Btrfs
