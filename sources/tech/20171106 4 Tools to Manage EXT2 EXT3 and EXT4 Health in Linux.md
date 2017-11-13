4 Tools to Manage EXT2, EXT3 and EXT4 Health in Linux
============================================================


A filesystem is a data structure that helps to control how data is stored and retrieved on a computer system. A filesystem can also be considered as a physical (or extended) partition on a disk. If not well maintained and regularly monitored, it can become damaged or corrupted in the long run, in so many different ways.

There are several factors that can cause a filesystem to become unhealthy: system crashes, hardware or software malfunctions, buggy drivers and programs, tunning it incorrectly, overloading it with excessive data plus other minor glitches.

Any of these issues can cause the Linux not to mount (or unmount) a filesystem gracefully, thus bringing about system failure.

Read Also: [7 Ways to Determine the File System Type in Linux (Ext2, Ext3 or Ext4)][7]

In addition, running your system with an impaired filesystem may give rise to other runtime errors in operating system components or in user applications, which could escalate to severe data loss. To avoid suffering filesystem corruption or damage, you need to keep an eye on its health.

In this article, we will cover tools to monitor and maintain a ext2, ext3 and ext4 filesystems health. All the tools described here require root user privileges, therefore use the [sudo command][8]to run them.

### How to View EXT2/EXT3/EXT4 Filesystem Information

dumpe2fs is a command line tool used to dump ext2/ext3/ext4 filesystem information, mean it displays super block and blocks group information for the filesystem on device.

Before running dumpe2fs, make sure to run [df -hT][9] command to know the filesystem device names.

```
$ sudo dumpe2fs /dev/sda10
```

##### Sample Output

```
dumpe2fs 1.42.13 (17-May-2015)
Filesystem volume name:   
Last mounted on:          /
Filesystem UUID:          bb29dda3-bdaa-4b39-86cf-4a6dc9634a1b
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent flex_bg sparse_super large_file huge_file uninit_bg dir_nlink extra_isize
Filesystem flags:         signed_directory_hash 
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              21544960
Block count:              86154752
Reserved block count:     4307737
Free blocks:              22387732
Free inodes:              21026406
First block:              0
Block size:               4096
Fragment size:            4096
Reserved GDT blocks:      1003
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         8192
Inode blocks per group:   512
Flex block group size:    16
Filesystem created:       Sun Jul 31 16:19:36 2016
Last mount time:          Mon Nov  6 10:25:28 2017
Last write time:          Mon Nov  6 10:25:19 2017
Mount count:              432
Maximum mount count:      -1
Last checked:             Sun Jul 31 16:19:36 2016
Check interval:           0 ()
Lifetime writes:          2834 GB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:	          256
Required extra isize:     28
Desired extra isize:      28
Journal inode:            8
First orphan inode:       6947324
Default directory hash:   half_md4
Directory Hash Seed:      9da5dafb-bded-494d-ba7f-5c0ff3d9b805
Journal backup:           inode blocks
Journal features:         journal_incompat_revoke
Journal size:             128M
Journal length:           32768
Journal sequence:         0x00580f0c
Journal start:            12055
```

You can pass the `-b` flag to display any blocks reserved as bad in the filesystem (no output implies to badblocks):

```
$ dumpe2fs -b
```

### Checking EXT2/EXT3/EXT4 Filesystems For Errors

e2fsck is used to examine ext2/ext3/ext4 filesystems for errors and fsck checks and can optionally [repair a Linux filesystem][10]; it is basically a front-end for a range of filesystem checkers (fsck.fstype for example fsck.ext3, fsck.sfx etc) offered under Linux.

Remember that Linux runs e2fack/fsck automatically at system boot on partitions that are labeled for checking in /etc/fstab configuration file. This is normally done after a filesystem has not been unmounted cleanly.

Attention: Do not run e2fsck or fsck on mounted filesystems, always unmount a partition first before you can run these tools on it, as shown below.

```
$ sudo unmount /dev/sda10
$ sudo fsck /dev/sda10
```

Alternatively, enable verbose output with the `-V` switch and use the `-t` to specify a filesystem type like this:

```
$ sudo fsck -Vt ext4 /dev/sda10
```

### Tunning EXT2/EXT3/EXT4 Filesystems

We mentioned from the start that one of the causes of filesystem damage is incorrect tunning. You can use the tune2fs utility to change the tunable parameters of ext2/ext3/ext4 filesystems as explained below.

To see the contents of the filesystem superblock, including the current values of the parameters, use the `-l` option as shown.

```
$ sudo tune2fs -l /dev/sda10
```

##### Sample Output

```
tune2fs 1.42.13 (17-May-2015)
Filesystem volume name:   
Last mounted on:          /
Filesystem UUID:          bb29dda3-bdaa-4b39-86cf-4a6dc9634a1b
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index filetype needs_recovery extent flex_bg sparse_super large_file huge_file uninit_bg dir_nlink extra_isize
Filesystem flags:         signed_directory_hash 
Default mount options:    user_xattr acl
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              21544960
Block count:              86154752
Reserved block count:     4307737
Free blocks:              22387732
Free inodes:              21026406
First block:              0
Block size:               4096
Fragment size:            4096
Reserved GDT blocks:      1003
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         8192
Inode blocks per group:   512
Flex block group size:    16
Filesystem created:       Sun Jul 31 16:19:36 2016
Last mount time:          Mon Nov  6 10:25:28 2017
Last write time:          Mon Nov  6 10:25:19 2017
Mount count:              432
Maximum mount count:      -1
Last checked:             Sun Jul 31 16:19:36 2016
Check interval:           0 ()
Lifetime writes:          2834 GB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:	          256
Required extra isize:     28
Desired extra isize:      28
Journal inode:            8
First orphan inode:       6947324
Default directory hash:   half_md4
Directory Hash Seed:      9da5dafb-bded-494d-ba7f-5c0ff3d9b805
Journal backup:           inode blocks
```

Next, using the `-c` flag, you can set the number of mounts after which the filesystem will be checked by e2fsck. This command instructs the system to run e2fsck against `/dev/sda10`after every 4 mounts.

```
$ sudo tune2fs -c 4 /dev/sda10
tune2fs 1.42.13 (17-May-2015)
Setting maximal mount count to 4
```

You can as well define the time between two filesystem checks with the `-i` option. The following command sets an interval of 2 days between filesystem checks.

```
$ sudo tune2fs  -i  2d  /dev/sda10
tune2fs 1.42.13 (17-May-2015)
Setting interval between checks to 172800 seconds
```

Now if you run this command below, the filesystem check interval for `/dev/sda10` is now set.

```
$ sudo tune2fs -l /dev/sda10
```

##### Sample Output

```
Filesystem created:       Sun Jul 31 16:19:36 2016
Last mount time:          Mon Nov  6 10:25:28 2017
Last write time:          Mon Nov  6 13:49:50 2017
Mount count:              432
Maximum mount count:      4
Last checked:             Sun Jul 31 16:19:36 2016
Check interval:           172800 (2 days)
Next check after:         Tue Aug  2 16:19:36 2016
Lifetime writes:          2834 GB
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:	          256
Required extra isize:     28
Desired extra isize:      28
Journal inode:            8
First orphan inode:       6947324
Default directory hash:   half_md4
Directory Hash Seed:      9da5dafb-bded-494d-ba7f-5c0ff3d9b805
Journal backup:           inode blocks
```

To change the default journaling parameters, use the `-J` option. This option also has sub-options: size=journal-size (sets the journal’s size), device=external-journal (specifies the device on which it’s stored) and location=journal-location (defines the location of the journal).

Note that only one of the size or device options can be set for a filesystem:

```
$ sudo tune2fs -J size=4MB /dev/sda10
```

Last but not least, the volume label of a filesystem can be set using the `-L` option as below.

```
$ sudo tune2fs -L "ROOT" /dev/sda10
```

### Debug EXT2/EXT3/EXT4 Filesystems

debugfs is an simple, interactive command line based ext2/ext3/ext4 filesystems debugger. It allows you to modify filesystem parameters interactively. To view sub-commands or requests, type `"?"`.

```
$ sudo debugfs /dev/sda10
```

By default, the filesystem should be opened in read-write mode, use the `-w` flag to open it in read-write mode. To open it in catastrophic mode, use the `-c` option.

##### Sample Output

```
debugfs 1.42.13 (17-May-2015)
debugfs:  ?
Available debugfs requests:
show_debugfs_params, params
Show debugfs parameters
open_filesys, open       Open a filesystem
close_filesys, close     Close the filesystem
freefrag, e2freefrag     Report free space fragmentation
feature, features        Set/print superblock features
dirty_filesys, dirty     Mark the filesystem as dirty
init_filesys             Initialize a filesystem (DESTROYS DATA)
show_super_stats, stats  Show superblock statistics
ncheck                   Do inode->name translation
icheck                   Do block->inode translation
change_root_directory, chroot
....
```

To show free space fragmentation, use the freefrag request, like so.

```
debugfs: freefrag
```

##### Sample Output

```
Device: /dev/sda10
Blocksize: 4096 bytes
Total blocks: 86154752
Free blocks: 22387732 (26.0%)
Min. free extent: 4 KB 
Max. free extent: 2064256 KB
Avg. free extent: 2664 KB
Num. free extent: 33625
HISTOGRAM OF FREE EXTENT SIZES:
Extent Size Range :  Free extents   Free Blocks  Percent
4K...    8K-  :          4883          4883    0.02%
8K...   16K-  :          4029          9357    0.04%
16K...   32K-  :          3172         15824    0.07%
32K...   64K-  :          2523         27916    0.12%
64K...  128K-  :          2041         45142    0.20%
128K...  256K-  :          2088         95442    0.43%
256K...  512K-  :          2462        218526    0.98%
512K... 1024K-  :          3175        571055    2.55%
1M...    2M-  :          4551       1609188    7.19%
2M...    4M-  :          2870       1942177    8.68%
4M...    8M-  :          1065       1448374    6.47%
8M...   16M-  :           364        891633    3.98%
16M...   32M-  :           194        984448    4.40%
32M...   64M-  :            86        873181    3.90%
64M...  128M-  :            77       1733629    7.74%
128M...  256M-  :            11        490445    2.19%
256M...  512M-  :            10        889448    3.97%
512M... 1024M-  :             2        343904    1.54%
1G...    2G-  :            22      10217801   45.64%
debugfs:  
```

You can explore so many other requests such as creating or removing files or directories, changing the current working directory and much more, by simply reading the brief description provided. To quit debugfs, use the `q` request.

That’s all for now! We have a collection of related articles under different categories below, which you will find useful.

#### Filesystem Usage Information:

1.  [12 Useful “df” Commands to Check Disk Space in Linux][1]

2.  [Pydf an Alternative “df” Command to Check Disk Usage in Different Colours][2]

3.  [10 Useful du (Disk Usage) Commands to Find Disk Usage of Files and Directories][3]

#### Check Disk or Partition Health:

1.  [3 Useful GUI and Terminal Based Linux Disk Scanning Tools][4]

2.  [How to Check Bad Sectors or Bad Blocks on Hard Disk in Linux][5]

3.  [How to Repair and Defragment Linux System Partitions and Directories][6]

Maintaining a healthy filesystem always improves the overall performance of your Linux system. If you have any questions or additional thoughts to share use the comment form below.

--------------------------------------------------------------------------------

via: https://www.tecmint.com/manage-ext2-ext3-and-ext4-health-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.tecmint.com/author/aaronkili/
[1]:https://www.tecmint.com/how-to-check-disk-space-in-linux/
[2]:https://www.tecmint.com/pyd-command-to-check-disk-usage/
[3]:https://www.tecmint.com/check-linux-disk-usage-of-files-and-directories/
[4]:https://www.tecmint.com/linux-disk-scanning-tools/
[5]:https://www.tecmint.com/check-linux-hard-disk-bad-sectors-bad-blocks/
[6]:https://www.tecmint.com/defragment-linux-system-partitions-and-directories/
[7]:https://www.tecmint.com/find-linux-filesystem-type/
[8]:https://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[9]:https://www.tecmint.com/how-to-check-disk-space-in-linux/
[10]:https://www.tecmint.com/defragment-linux-system-partitions-and-directories/
[11]:https://www.tecmint.com/author/aaronkili/
[12]:https://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[13]:https://www.tecmint.com/free-linux-shell-scripting-books/
