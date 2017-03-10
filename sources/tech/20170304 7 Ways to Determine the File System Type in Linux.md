translating---geekpi

7 Ways to Determine the File System Type in Linux (Ext2, Ext3 or Ext4)
============================================================


A file system is the way in which files are named, stored, retrieved as well as updated on a storage disk or partition; the way files are organized on the disk.

A file system is divided in two segments called: User Data and Metadata (file name, time it was created, modified time, it’s size and location in the directory hierarchy etc).

In this guide, we will explain seven ways to identify your Linux file system type such as Ext2, Ext3, Ext4, BtrFS, GlusterFS plus many more.

### 1\. Using df Command

df command reports file system disk space usage, to include the file system type on a particular disk partition, use the `-T` flag as below:

```
$ df -Th
OR
$ df -Th | grep "^/dev"
```
[
 ![df Command - Find Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/Find-Filesystem-Type-Using-df-Command.png) 
][3]

df Command – Find Filesystem Type

For a comprehensive guide for df command usage go through our articles:

1.  [12 Useful “df” Commands to Check Disk Space in Linux][1]
2.  [Pydf – An Alternative ‘df’ Command That Shows Disk Usage in Colours][2]

### 2\. Using fsck Command

fsck is used to check and optionally [repair Linux file systems][4], it can also print the [file system type on specified disk partitions][5].

The flag `-N` disables checking of file system for errors, it just shows what would be done (but all we need is the file system type):

```
$ fsck -N /dev/sda3
$ fsck -N /dev/sdb1
```
[
 ![fsck - Print Linux Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/fsck-Print-Linux-Filesystem-Type.png) 
][6]

fsck – Print Linux Filesystem Type

### 3\. Using lsblk Command

lsblk displays block devices, when used with the `-f` option, it prints file system type on partitions as well:

```
$ lsblk -f
```
[
 ![lsblk - Shows Linux Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/lsblk-Shows-Linux-Filesystem-Type.png) 
][7]

lsblk – Shows Linux Filesystem Type

### 4\. Using mount Command

mount command is used to [mount a file system in Linux][8], it can also be used to [mount an ISO image][9], [mount remote Linux filesystem][10] and so much more.

When run without any arguments, it prints [info about disk partitions][11] including the file system type as below:

```
$ mount | grep "^/dev"
```
[
 ![Mount - Show Filesystem Type in Linux](http://www.tecmint.com/wp-content/uploads/2017/03/Mount-Show-Filesystem-Type.png) 
][12]

Mount – Show Filesystem Type in Linux

### 5\. Using blkid Command

blkid command is used to [find or print block device properties][13], simply specify the disk partition as an argument like so:

```
$ blkid /dev/sda3
```
[
 ![blkid - Find Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/blkid-Find-Filesystem-Type.png) 
][14]

blkid – Find Filesystem Type

### 6\. Using file Command

file command identifies file type, the `-s` flag enables reading of block or character files and `-L` enables following of symlinks:

```
$ sudo file -sL /dev/sda3
```
[
 ![file - Identifies Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/file-command-identifies-filesystem-type.png) 
][15]

file – Identifies Filesystem Type

### 7\. Using fstab File

The /etc/fstab is a static file system info (such as mount point, file system type, mount options etc) file:

```
$ cat /etc/fstab
```
[
 ![Fstab - Shows Linux Filesystem Type](http://www.tecmint.com/wp-content/uploads/2017/03/fstab-shows-filesystem-types.png) 
][16]

Fstab – Shows Linux Filesystem Type

That’s it! In this guide, we explained seven ways to identify your Linux file system type. Do you know of any method not mentioned here? Share it with us in the comments.

--------------------------------------------------------------------------------

作者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/find-linux-filesystem-type/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/how-to-check-disk-space-in-linux/
[2]:http://www.tecmint.com/pyd-command-to-check-disk-usage/
[3]:http://www.tecmint.com/wp-content/uploads/2017/03/Find-Filesystem-Type-Using-df-Command.png
[4]:http://www.tecmint.com/defragment-linux-system-partitions-and-directories/
[5]:http://www.tecmint.com/manage-file-types-and-set-system-time-in-linux/
[6]:http://www.tecmint.com/wp-content/uploads/2017/03/fsck-Print-Linux-Filesystem-Type.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/03/lsblk-Shows-Linux-Filesystem-Type.png
[8]:http://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/
[9]:http://www.tecmint.com/extract-files-from-iso-files-linux/
[10]:http://www.tecmint.com/sshfs-mount-remote-linux-filesystem-directory-using-ssh/
[11]:http://www.tecmint.com/linux-tools-to-monitor-disk-partition-usage/
[12]:http://www.tecmint.com/wp-content/uploads/2017/03/Mount-Show-Filesystem-Type.png
[13]:http://www.tecmint.com/find-usb-device-name-in-linux/
[14]:http://www.tecmint.com/wp-content/uploads/2017/03/blkid-Find-Filesystem-Type.png
[15]:http://www.tecmint.com/wp-content/uploads/2017/03/file-command-identifies-filesystem-type.png
[16]:http://www.tecmint.com/wp-content/uploads/2017/03/fstab-shows-filesystem-types.png
[17]:http://www.tecmint.com/find-linux-filesystem-type/#
[18]:http://www.tecmint.com/find-linux-filesystem-type/#
[19]:http://www.tecmint.com/find-linux-filesystem-type/#
[20]:http://www.tecmint.com/find-linux-filesystem-type/#
[21]:http://www.tecmint.com/find-linux-filesystem-type/#comments
[22]:http://www.tecmint.com/author/aaronkili/
[23]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[24]:http://www.tecmint.com/free-linux-shell-scripting-books/
