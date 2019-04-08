[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Understand And Identify File types in Linux)
[#]: via: (https://www.2daygeek.com/how-to-understand-and-identify-file-types-in-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Understand And Identify File types in Linux
======

We all are knows, that everything is a file in Linux which includes Hard Disk, Graphics Card, etc.

When you are navigating the Linux filesystem most of the files are fall under regular files and directories.

But it has other file types as well for different purpose which fall in five categories.

So, it’s very important to understand the file types in Linux that helps you in many ways.

If you can’t believe this, you just gone through the complete article then you come to know how important is.

If you don’t understand the file types you can’t make any changes on that without fear.

If you made the changes wrongly that damage your system very badly so be careful when you are doing that.

Files are very important in Linux because all the devices and daemon’s were stored as a file in Linux system.

### How Many Types of File is Available in Linux?

As per my knowledge, totally 7 types of files are available in Linux with 3 Major categories. The details are below.

  * Regular File
  * Directory File
  * Special Files (This category having five type of files)
  * Link File
  * Character Device File
  * Socket File
  * Named Pipe File
  * Block File



Refer the below table for better understanding of file types in Linux.
| Symbol | Meaning                                                              |
| –      | Regular File. It starts with underscore “_”.                       |
| d      | Directory File. It starts with English alphabet letter “d”.        |
| l      | Link File. It starts with English alphabet letter “l”.             |
| c      | Character Device File. It starts with English alphabet letter “c”. |
| s      | Socket File. It starts with English alphabet letter “s”.           |
| p      | Named Pipe File. It starts with English alphabet letter “p”.       |
| b      | Block File. It starts with English alphabet letter “b”.            |

### Method-1: Manual Way to Identify File types in Linux

If you are having good knowledge in Linux then you can easily identify the files type with help of above table.

#### How to view the Regular files in Linux?

Use the below command to view the Regular files in Linux. Regular files are available everywhere in Linux filesystem.
The Regular files color is `WHITE`

```
# ls -la | grep ^-
-rw-------. 1 mageshm mageshm 1394 Jan 18 15:59 .bash_history
-rw-r--r--. 1 mageshm mageshm 18 May 11 2012 .bash_logout
-rw-r--r--. 1 mageshm mageshm 176 May 11 2012 .bash_profile
-rw-r--r--. 1 mageshm mageshm 124 May 11 2012 .bashrc
-rw-r--r--. 1 root root 26 Dec 27 17:55 liks
-rw-r--r--. 1 root root 104857600 Jan 31 2006 test100.dat
-rw-r--r--. 1 root root 104874307 Dec 30 2012 test100.zip
-rw-r--r--. 1 root root 11536384 Dec 30 2012 test10.zip
-rw-r--r--. 1 root root 61 Dec 27 19:05 test2-bzip2.txt
-rw-r--r--. 1 root root 61 Dec 31 14:24 test3-bzip2.txt
-rw-r--r--. 1 root root 60 Dec 27 19:01 test-bzip2.txt
```

#### How to view the Directory files in Linux?

Use the below command to view the Directory files in Linux. Directory files are available everywhere in Linux filesystem. The Directory files colour is `BLUE`

```
# ls -la | grep ^d
drwxr-xr-x. 3 mageshm mageshm 4096 Dec 31 14:24 links/
drwxrwxr-x. 2 mageshm mageshm 4096 Nov 16 15:44 perl5/
drwxr-xr-x. 2 mageshm mageshm 4096 Nov 16 15:37 public_ftp/
drwxr-xr-x. 3 mageshm mageshm 4096 Nov 16 15:37 public_html/
```

#### How to view the Link files in Linux?

Use the below command to view the Link files in Linux. Link files are available everywhere in Linux filesystem.
Two type of link files are available, it’s Soft link and Hard link. The Link files color is `LIGHT TURQUOISE`

```
# ls -la | grep ^l
lrwxrwxrwx. 1 root root 31 Dec 7 15:11 s-link-file -> /links/soft-link/test-soft-link
lrwxrwxrwx. 1 root root 38 Dec 7 15:12 s-link-folder -> /links/soft-link/test-soft-link-folder
```

#### How to view the Character Device files in Linux?

Use the below command to view the Character Device files in Linux. Character Device files are available only in specific location.

It’s available under `/dev` directory. The Character Device files color is `YELLOW`

```
# ls -la | grep ^c
crw-------. 1 root root 5, 1 Jan 28 14:05 console
crw-rw----. 1 root root 10, 61 Jan 28 14:05 cpu_dma_latency
crw-rw----. 1 root root 10, 62 Jan 28 14:05 crash
crw-rw----. 1 root root 29, 0 Jan 28 14:05 fb0
crw-rw-rw-. 1 root root 1, 7 Jan 28 14:05 full
crw-rw-rw-. 1 root root 10, 229 Jan 28 14:05 fuse
```

#### How to view the Block files in Linux?

Use the below command to view the Block files in Linux. The Block files are available only in specific location.
It’s available under `/dev` directory. The Block files color is `YELLOW`

```
# ls -la | grep ^b
brw-rw----. 1 root disk 7, 0 Jan 28 14:05 loop0
brw-rw----. 1 root disk 7, 1 Jan 28 14:05 loop1
brw-rw----. 1 root disk 7, 2 Jan 28 14:05 loop2
brw-rw----. 1 root disk 7, 3 Jan 28 14:05 loop3
brw-rw----. 1 root disk 7, 4 Jan 28 14:05 loop4
```

#### How to view the Socket files in Linux?

Use the below command to view the Socket files in Linux. The Socket files are available only in specific location.
The Socket files color is `PINK`

```
# ls -la | grep ^s
srw-rw-rw- 1 root root 0 Jan 5 16:36 system_bus_socket
```

#### How to view the Named Pipe files in Linux?

Use the below command to view the Named Pipe files in Linux. The Named Pipe files are available only in specific location. The Named Pipe files color is `YELLOW`

```
# ls -la | grep ^p
prw-------. 1 root root 0 Jan 28 14:06 replication-notify-fifo|
prw-------. 1 root root 0 Jan 28 14:06 stats-mail|
```

### Method-2: How to Identify File types in Linux Using file Command?

The file command allow us to determine various file types in Linux. There are three sets of tests, performed in this order: filesystem tests, magic tests, and language tests to identify file types.

#### How to view the Regular files in Linux Using file Command?

Simple enter the file command on your terminal and followed by Regular file. The file command will read the given file contents and display exactly what kind of file it is.

That’s why we are seeing different results for each Regular files. See the below various results for Regular files.

```
# file 2daygeek_access.log
2daygeek_access.log: ASCII text, with very long lines

# file powertop.html
powertop.html: HTML document, ASCII text, with very long lines

# file 2g-test
2g-test: JSON data

# file powertop.txt
powertop.txt: HTML document, UTF-8 Unicode text, with very long lines

# file 2g-test-05-01-2019.tar.gz
2g-test-05-01-2019.tar.gz: gzip compressed data, last modified: Sat Jan 5 18:22:20 2019, from Unix, original size 450560
```

#### How to view the Directory files in Linux Using file Command?

Simple enter the file command on your terminal and followed by Directory file. See the results below.

```
# file Pictures/
Pictures/: directory
```

#### How to view the Link files in Linux Using file Command?

Simple enter the file command on your terminal and followed by Link file. See the results below.

```
# file log
log: symbolic link to /run/systemd/journal/dev-log
```

#### How to view the Character Device files in Linux Using file Command?

Simple enter the file command on your terminal and followed by Character Device file. See the results below.

```
# file vcsu
vcsu: character special (7/64)
```

#### How to view the Block files in Linux Using file Command?

Simple enter the file command on your terminal and followed by Block file. See the results below.

```
# file sda1
sda1: block special (8/1)
```

#### How to view the Socket files in Linux Using file Command?

Simple enter the file command on your terminal and followed by Socket file. See the results below.

```
# file system_bus_socket
system_bus_socket: socket
```

#### How to view the Named Pipe files in Linux Using file Command?

Simple enter the file command on your terminal and followed by Named Pipe file. See the results below.

```
# file pipe-test
pipe-test: fifo (named pipe)
```

### Method-3: How to Identify File types in Linux Using stat Command?

The stat command allow us to check file types or file system status. This utility giving more information than file command. It shows lot of information about the given file such as Size, Block Size, IO Block Size, Inode Value, Links, File permission, UID, GID, File Access, Modify and Change time details.

#### How to view the Regular files in Linux Using stat Command?

Simple enter the stat command on your terminal and followed by Regular file.

```
# stat 2daygeek_access.log
 File: 2daygeek_access.log
 Size: 14406929     Blocks: 28144 IO Block: 4096 regular file
Device: 10301h/66305d   Inode: 1727555 Links: 1
Access: (0644/-rw-r--r--) Uid: ( 1000/ daygeek) Gid: ( 1000/ daygeek)
Access: 2019-01-03 14:05:26.430328867 +0530
Modify: 2019-01-03 14:05:26.460328868 +0530
Change: 2019-01-03 14:05:26.460328868 +0530
 Birth: -
```

#### How to view the Directory files in Linux Using stat Command?

Simple enter the stat command on your terminal and followed by Directory file. See the results below.

```
# stat Pictures/
 File: Pictures/
 Size: 4096     Blocks: 8 IO Block: 4096 directory
Device: 10301h/66305d   Inode: 1703982 Links: 3
Access: (0755/drwxr-xr-x) Uid: ( 1000/ daygeek) Gid: ( 1000/ daygeek)
Access: 2018-11-24 03:22:11.090000828 +0530
Modify: 2019-01-05 18:27:01.546958817 +0530
Change: 2019-01-05 18:27:01.546958817 +0530
 Birth: -
```

#### How to view the Link files in Linux Using stat Command?

Simple enter the stat command on your terminal and followed by Link file. See the results below.

```
# stat /dev/log
 File: /dev/log -> /run/systemd/journal/dev-log
 Size: 28   Blocks: 0 IO Block: 4096 symbolic link
Device: 6h/6d   Inode: 278 Links: 1
Access: (0777/lrwxrwxrwx) Uid: ( 0/ root) Gid: ( 0/ root)
Access: 2019-01-05 16:36:31.033333447 +0530
Modify: 2019-01-05 16:36:30.766666768 +0530
Change: 2019-01-05 16:36:30.766666768 +0530
 Birth: -
```

#### How to view the Character Device files in Linux Using stat Command?

Simple enter the stat command on your terminal and followed by Character Device file. See the results below.

```
# stat /dev/vcsu
 File: /dev/vcsu
 Size: 0    Blocks: 0 IO Block: 4096 character special file
Device: 6h/6d   Inode: 16 Links: 1 Device type: 7,40
Access: (0660/crw-rw----) Uid: ( 0/ root) Gid: ( 5/ tty)
Access: 2019-01-05 16:36:31.056666781 +0530
Modify: 2019-01-05 16:36:31.056666781 +0530
Change: 2019-01-05 16:36:31.056666781 +0530
 Birth: -
```

#### How to view the Block files in Linux Using stat Command?

Simple enter the stat command on your terminal and followed by Block file. See the results below.

```
# stat /dev/sda1
 File: /dev/sda1
 Size: 0    Blocks: 0 IO Block: 4096 block special file
Device: 6h/6d   Inode: 250 Links: 1 Device type: 8,1
Access: (0660/brw-rw----) Uid: ( 0/ root) Gid: ( 994/ disk)
Access: 2019-01-05 16:36:31.596666806 +0530
Modify: 2019-01-05 16:36:31.596666806 +0530
Change: 2019-01-05 16:36:31.596666806 +0530
 Birth: -
```

#### How to view the Socket files in Linux Using stat Command?

Simple enter the stat command on your terminal and followed by Socket file. See the results below.

```
# stat /var/run/dbus/system_bus_socket
 File: /var/run/dbus/system_bus_socket
 Size: 0    Blocks: 0 IO Block: 4096 socket
Device: 15h/21d Inode: 576 Links: 1
Access: (0666/srw-rw-rw-) Uid: ( 0/ root) Gid: ( 0/ root)
Access: 2019-01-05 16:36:31.823333482 +0530
Modify: 2019-01-05 16:36:31.810000149 +0530
Change: 2019-01-05 16:36:31.810000149 +0530
 Birth: -
```

#### How to view the Named Pipe files in Linux Using stat Command?

Simple enter the stat command on your terminal and followed by Named Pipe file. See the results below.

```
# stat pipe-test
 File: pipe-test
 Size: 0    Blocks: 0 IO Block: 4096 fifo
Device: 10301h/66305d   Inode: 1705583 Links: 1
Access: (0644/prw-r--r--) Uid: ( 1000/ daygeek) Gid: ( 1000/ daygeek)
Access: 2019-01-06 02:00:03.040394731 +0530
Modify: 2019-01-06 02:00:03.040394731 +0530
Change: 2019-01-06 02:00:03.040394731 +0530
 Birth: -
```
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-understand-and-identify-file-types-in-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
