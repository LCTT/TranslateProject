translating by chenxinlong   
3 Easy Ways To Create Or Extend Swap Space In Linux
============================================================

Users can create swap space during installation of any Linux operating system and its necessary too. If you forget to create or later if you want increase, you can at any point of time.

Sometimes it is necessary to add more swap space when you upgrade the RAM after installation, say for example, if you upgrade the RAM in your system from 1GB to 2GB then you have to upgrade swap too (From 2GB to 4GB) since it’s uses double amount of physical RAM.

Swap is space on a disk that is reserved to be used as virtual memory when the amount of physical memory (RAM-random access memory) is full. If the system needs more memory resources when the RAM is full, inactive pages in memory are moved to the swap space which can help system to run the applications some more time but it should not be considered a replacement for more RAM.

It’s recommended to create a dedicated swap partition but if you don’t have a free partition then use a swap file, or a combination of swap partitions and swap files. Swap space is generally recommended for user at least 4 GB, also users can create a swap space depends upon their requirement and environment.

I have found most of the VM’s and Cloud servers comes without swap partition, so in such cases we can create, extend or increase swap space using below three methods.

#### How to check current swap size

Lets first check the size of existing swap space partition using **[free][1]** & `swapon` command.

```
$ free -h
              total        used        free      shared  buff/cache   available
Mem:           2.0G        1.3G        139M         45M        483M        426M
Swap:          2.0G        655M        1.4G

$ swapon --show
NAME      TYPE      SIZE   USED PRIO
/dev/sda5 partition   2G 655.2M   -1
```

The above output clearly shows `2GB` is current swap space.

#### Method-1 : Create the swap file using fallocate

fallocate program is a best way to create a file of a preallocated size instantly.

The following command will create 1GB of `/swapfile`.

```
$ sudo fallocate -l 1G /swapfile
```

Check whether its created correct size of file or not.

```
$ ls -lh /swapfile
-rw-r--r-- 1 root root 1.0G Jun  7 09:49 /swapfile
```

Change the file permission to `600` to only accessible by root user.

```
$ sudo chmod 600 /swapfile
```

Convert the file as swap area by running below command.

```
$ sudo mkswap /swapfile
Setting up swapspace version 1, size = 1024 MiB (1073737728 bytes)
no label, UUID=cda50e0e-41f3-49c7-af61-b8cb4a33a464
```

Enable the swap file by running below command.

```
$ sudo swapon /swapfile
```

Add newely created swap file into fstab file, so that swap space partition available even after the reboot.

```
$ vi /etc/fstab

/swapfile  swap  swap  defaults  0 0
```

Check newly created swap file.

```
$ swapon --show
NAME      TYPE       SIZE   USED PRIO
/dev/sda5 partition    2G 657.8M   -1
/swapfile file      1024M     0B   -2
```

Yes i can see the new `1GB swapfile`. Reboot the system to use the new swap file.

#### Method-2 : Create the swap file using dd command

dd command is another utility which help us to create a file of a preallocated size instantly.

The following dd command will create 1GB of `/swapfile1`.

```
$ sudo dd if=/dev/zero of=/swapfile1 bs=1G count=1
1+0 records in
1+0 records out
1073741824 bytes (1.1 GB, 1.0 GiB) copied, 16.6154 s, 64.6 MB/s
```

**Details :**

*   **if=/dev/zero** is a input file, /dev/zero is a special file in Unix-like operating systems that provides as many null characters (ASCII NUL, 0x00) as are read from it.

*   **of=/swapfile1** is an output file

*   **bs=1G :** Read and write up to 1GB bytes at a time

*   **count=1 :** Copy only 1 BLOCKS input blocks.

Check whether its created correct size of file or not.

```
$ ls -lh /swapfile1
-rw-r--r-- 1 root root 1.0G Jun  7 09:58 /swapfile1
```

Change the file permission to `600` to only accessible by root user.

```
$ sudo chmod 600 /swapfile1
```

Convert the file as a swap file by running below command.

```
$ sudo mkswap /swapfile1
Setting up swapspace version 1, size = 1024 MiB (1073737728 bytes)
no label, UUID=96def6d7-b2da-4954-aa72-aa32316ec993
```

Enable the swap file by running below command.

```
$ sudo swapon /swapfile1
```

Add newely created swap file into fstab file, so that swap space partition available even after the reboot.

```
$ vi /etc/fstab

/swapfile1  swap  swap  defaults  0 0
```

Check newly created swap file.

```
$ swapon --show
NAME       TYPE       SIZE USED PRIO
/dev/sda5  partition    2G 1.3G   -1
/swapfile  file      1024M   0B   -2
/swapfile1 file      1024M   0B   -3
```

Yes i can see the new `1GB swapfile1`. Reboot the system to use the new swap file.

#### Method-3 : Create the swap file using Hard drive partition

Hard drive partition is recommended method to create a swap space.

If you have an additional hard disk create the new partition using fdisk command. Let us assume that we have created the partition called /dev/sda4.

Use mkswap command to convert the partition as swap area.

```
$ sudo mkswap /dev/sda4
```

Enable the swap file by running below command.

```
$ sudo swapon /dev/sda4
```

Add newely created swap file into fstab file, so that swap space partition available even after the reboot.

```
$ vi /etc/fstab

/dev/sda4  swap  swap  defaults  0 0
```

Check newly created swap file.

```
$ swapon --show
NAME       TYPE       SIZE USED PRIO
/dev/sda5  partition    2G 1.3G   -1
/swapfile  file      1024M   0B   -2
/swapfile1 file      1024M   0B   -3
/dev/sda4  partition    1G   0B   -4
```

Yes i can see the new `1GB /dev/sda4` swap partition. Reboot the system to use the new swap partition.



--------------------------------------------------------------------------------

via: http://www.2daygeek.com/add-extend-increase-swap-space-memory-file-partition-linux/

作者：[2DAYGEEK ][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/free-command-to-check-memory-usage-statistics-in-linux/
[2]:http://www.2daygeek.com/author/2daygeek/
