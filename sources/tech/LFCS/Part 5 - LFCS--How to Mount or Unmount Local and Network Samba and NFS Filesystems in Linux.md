Translating by Xuanwo

Part 5 - LFCS: How to Mount/Unmount Local and Network (Samba & NFS) Filesystems in Linux
================================================================================
The Linux Foundation launched the LFCS certification (Linux Foundation Certified Sysadmin), a brand new program whose purpose is allowing individuals from all corners of the globe to get certified in basic to intermediate system administration tasks for Linux systems, which includes supporting running systems and services, along with overall monitoring and analysis, plus smart decision-making when it comes to raising issues to upper support teams.

![Linux Foundation Certified Sysadmin – Part 5](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-5.png)

Linux Foundation Certified Sysadmin – Part 5

The following video shows an introduction to The Linux Foundation Certification Program.

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

This post is Part 5 of a 10-tutorial series, here in this part, we will explain How to mount/unmount local and network filesystems in linux, that are required for the LFCS certification exam.

### Mounting Filesystems ###

Once a disk has been partitioned, Linux needs some way to access the data on the partitions. Unlike DOS or Windows (where this is done by assigning a drive letter to each partition), Linux uses a unified directory tree where each partition is mounted at a mount point in that tree.

A mount point is a directory that is used as a way to access the filesystem on the partition, and mounting the filesystem is the process of associating a certain filesystem (a partition, for example) with a specific directory in the directory tree.

In other words, the first step in managing a storage device is attaching the device to the file system tree. This task can be accomplished on a one-time basis by using tools such as mount (and then unmounted with umount) or persistently across reboots by editing the /etc/fstab file.

The mount command (without any options or arguments) shows the currently mounted filesystems.

    # mount

![Check Mounted Filesystem in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/check-mounted-filesystems.png)

Check Mounted Filesystem

In addition, mount is used to mount filesystems into the filesystem tree. Its standard syntax is as follows.

    # mount -t type device dir -o options

This command instructs the kernel to mount the filesystem found on device (a partition, for example, that has been formatted with a filesystem type) at the directory dir, using all options. In this form, mount does not look in /etc/fstab for instructions.

If only a directory or device is specified, for example.

    # mount /dir -o options
    or
    # mount device -o options

mount tries to find a mount point and if it can’t find any, then searches for a device (both cases in the /etc/fstab file), and finally attempts to complete the mount operation (which usually succeeds, except for the case when either the directory or the device is already being used, or when the user invoking mount is not root).

You will notice that every line in the output of mount has the following format.

    device on directory type (options)

For example,

    /dev/mapper/debian-home on /home type ext4 (rw,relatime,user_xattr,barrier=1,data=ordered)

Reads:

dev/mapper/debian-home is mounted on /home, which has been formatted as ext4, with the following options: rw,relatime,user_xattr,barrier=1,data=ordered

**Mount Options**

Most frequently used mount options include.

- async: allows asynchronous I/O operations on the file system being mounted.
- auto: marks the file system as enabled to be mounted automatically using mount -a. It is the opposite of noauto.
- defaults: this option is an alias for async,auto,dev,exec,nouser,rw,suid. Note that multiple options must be separated by a comma without any spaces. If by accident you type a space between options, mount will interpret the subsequent text string as another argument.
- loop: Mounts an image (an .iso file, for example) as a loop device. This option can be used to simulate the presence of the disk’s contents in an optical media reader.
- noexec: prevents the execution of executable files on the particular filesystem. It is the opposite of exec.
- nouser: prevents any users (other than root) to mount and unmount the filesystem. It is the opposite of user.
- remount: mounts the filesystem again in case it is already mounted.
- ro: mounts the filesystem as read only.
- rw: mounts the file system with read and write capabilities.
- relatime: makes access time to files be updated only if atime is earlier than mtime.
- user_xattr: allow users to set and remote extended filesystem attributes.

**Mounting a device with ro and noexec options**

    # mount -t ext4 /dev/sdg1 /mnt -o ro,noexec

In this case we can see that attempts to write a file to or to run a binary file located inside our mounting point fail with corresponding error messages.

    # touch /mnt/myfile
    # /mnt/bin/echo “Hi there”

![Mount Device in Read Write Mode](http://www.tecmint.com/wp-content/uploads/2014/10/Mount-Device-Read-Write.png)

Mount Device Read Write

**Mounting a device with default options**

In the following scenario, we will try to write a file to our newly mounted device and run an executable file located within its filesystem tree using the same commands as in the previous example.

    # mount -t ext4 /dev/sdg1 /mnt -o defaults

![Mount Device in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Mount-Device.png)

Mount Device

In this last case, it works perfectly.

### Unmounting Devices ###

Unmounting a device (with the umount command) means finish writing all the remaining “on transit” data so that it can be safely removed. Note that if you try to remove a mounted device without properly unmounting it first, you run the risk of damaging the device itself or cause data loss.

That being said, in order to unmount a device, you must be “standing outside” its block device descriptor or mount point. In other words, your current working directory must be something else other than the mounting point. Otherwise, you will get a message saying that the device is busy.

![Unmount Device in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Unmount-Device.png)

Unmount Device

An easy way to “leave” the mounting point is typing the cd command which, in lack of arguments, will take us to our current user’s home directory, as shown above.

### Mounting Common Networked Filesystems ###

The two most frequently used network file systems are SMB (which stands for “Server Message Block”) and NFS (“Network File System”). Chances are you will use NFS if you need to set up a share for Unix-like clients only, and will opt for Samba if you need to share files with Windows-based clients and perhaps other Unix-like clients as well.

Read Also

- [Setup Samba Server in RHEL/CentOS and Fedora][1]
- [Setting up NFS (Network File System) on RHEL/CentOS/Fedora and Debian/Ubuntu][2]

The following steps assume that Samba and NFS shares have already been set up in the server with IP 192.168.0.10 (please note that setting up a NFS share is one of the competencies required for the LFCE exam, which we will cover after the present series).

#### Mounting a Samba share on Linux ####

Step 1: Install the samba-client samba-common and cifs-utils packages on Red Hat and Debian based distributions.

    # yum update && yum install samba-client samba-common cifs-utils
    # aptitude update && aptitude install samba-client samba-common cifs-utils

Then run the following command to look for available samba shares in the server.

    # smbclient -L 192.168.0.10

And enter the password for the root account in the remote machine.

![Mount Samba Share in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Mount-Samba-Share.png)

Mount Samba Share

In the above image we have highlighted the share that is ready for mounting on our local system. You will need a valid samba username and password on the remote server in order to access it.

Step 2: When mounting a password-protected network share, it is not a good idea to write your credentials in the /etc/fstab file. Instead, you can store them in a hidden file somewhere with permissions set to 600, like so.

    # mkdir /media/samba
    # echo “username=samba_username” > /media/samba/.smbcredentials
    # echo “password=samba_password” >> /media/samba/.smbcredentials
    # chmod 600 /media/samba/.smbcredentials

Step 3: Then add the following line to /etc/fstab file.

    # //192.168.0.10/gacanepa /media/samba cifs credentials=/media/samba/.smbcredentials,defaults 0 0

Step 4: You can now mount your samba share, either manually (mount //192.168.0.10/gacanepa) or by rebooting your machine so as to apply the changes made in /etc/fstab permanently.

![Mount Password Protect Samba Share](http://www.tecmint.com/wp-content/uploads/2014/10/Mount-Password-Protect-Samba-Share.png)

Mount Password Protect Samba Share

#### Mounting a NFS share on Linux ####

Step 1: Install the nfs-common and portmap packages on Red Hat and Debian based distributions.

    # yum update && yum install nfs-utils nfs-utils-lib
    # aptitude update && aptitude install nfs-common

Step 2: Create a mounting point for the NFS share.

    # mkdir /media/nfs

Step 3: Add the following line to /etc/fstab file.

192.168.0.10:/NFS-SHARE /media/nfs nfs defaults 0 0

Step 4: You can now mount your nfs share, either manually (mount 192.168.0.10:/NFS-SHARE) or by rebooting your machine so as to apply the changes made in /etc/fstab permanently.

![Mount NFS Share in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Mount-NFS-Share.png)

Mount NFS Share

### Mounting Filesystems Permanently ###

As shown in the previous two examples, the /etc/fstab file controls how Linux provides access to disk partitions and removable media devices and consists of a series of lines that contain six fields each; the fields are separated by one or more spaces or tabs. A line that begins with a hash mark (#) is a comment and is ignored.

Each line has the following format.

    <file system> <mount point> <type> <options> <dump> <pass>

Where:

- <file system>: The first column specifies the mount device. Most distributions now specify partitions by their labels or UUIDs. This practice can help reduce problems if partition numbers change.
- <mount point>: The second column specifies the mount point.
- <type>: The file system type code is the same as the type code used to mount a filesystem with the mount command. A file system type code of auto lets the kernel auto-detect the filesystem type, which can be a convenient option for removable media devices. Note that this option may not be available for all filesystems out there.
- <options>: One (or more) mount option(s).
- <dump>: You will most likely leave this to 0 (otherwise set it to 1) to disable the dump utility to backup the filesystem upon boot (The dump program was once a common backup tool, but it is much less popular today.)
- <pass>: This column specifies whether the integrity of the filesystem should be checked at boot time with fsck. A 0 means that fsck should not check a filesystem. The higher the number, the lowest the priority. Thus, the root partition will most likely have a value of 1, while all others that should be checked should have a value of 2.

**Mount Examples**

1. To mount a partition with label TECMINT at boot time with rw and noexec attributes, you should add the following line in /etc/fstab file.

    LABEL=TECMINT /mnt ext4 rw,noexec 0 0

2. If you want the contents of a disk in your DVD drive be available at boot time.

    /dev/sr0    /media/cdrom0    iso9660    ro,user,noauto    0    0

Where /dev/sr0 is your DVD drive.

### Summary ###

You can rest assured that mounting and unmounting local and network filesystems from the command line will be part of your day-to-day responsibilities as sysadmin. You will also need to master /etc/fstab. I hope that you have found this article useful to help you with those tasks. Feel free to add your comments (or ask questions) below and to share this article through your network social profiles.
Reference Links

- [About the LFCS][3]
- [Why get a Linux Foundation Certification?][4]
- [Register for the LFCS exam][5]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/mount-filesystem-in-linux/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/setup-samba-server-using-tdbsam-backend-on-rhel-centos-6-3-5-8-and-fedora-17-12/
[2]:http://www.tecmint.com/how-to-setup-nfs-server-in-linux/
[3]:https://training.linuxfoundation.org/certification/LFCS
[4]:https://training.linuxfoundation.org/certification/why-certify-with-us
[5]:https://identity.linuxfoundation.org/user?destination=pid/1