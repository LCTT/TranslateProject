The df Command Tutorial With Examples For Beginners
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/df-command-1-720x340.png)

In this guide, we are going to learn to use **df** command. The df command, stands for **D** isk **F** ree, reports file system disk space usage. It displays the amount of disk space available on the file system in a Linux system. The df command is not to be confused with **du** command. Both serves different purposes. The df command reports **how much disk space we have** (i.e free space) whereas the du command reports **how much disk space is being consumed** by the files and folders. Hope I made myself clear. Let us go ahead and see some practical examples of df command, so you can understand it better.

### The df Command Tutorial With Examples

**1\. View entire file system disk space usage**

Run df command without any arguments to display the entire file system disk space.
```
$ df

```

**Sample output:**
```
Filesystem 1K-blocks Used Available Use% Mounted on
dev 4033216 0 4033216 0% /dev
run 4038880 1120 4037760 1% /run
/dev/sda2 478425016 428790352 25308980 95% /
tmpfs 4038880 34396 4004484 1% /dev/shm
tmpfs 4038880 0 4038880 0% /sys/fs/cgroup
tmpfs 4038880 11636 4027244 1% /tmp
/dev/loop0 84096 84096 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 95054 55724 32162 64% /boot
tmpfs 807776 28 807748 1% /run/user/1000

```

![][2]

As you can see, the result is divided into six columns. Let us see what each column means.

  * **Filesystem** – the filesystem on the system.
  * **1K-blocks** – the size of the filesystem, measured in 1K blocks.
  * **Used** – the amount of space used in 1K blocks.
  * **Available** – the amount of available space in 1K blocks.
  * **Use%** – the percentage that the filesystem is in use.
  * **Mounted on** – the mount point where the filesystem is mounted.



**2\. Display file system disk usage in human readable format**

As you may noticed in the above examples, the usage is showed in 1k blocks. If you want to display them in human readable format, use **-h** flag.
```
$ df -h
Filesystem Size Used Avail Use% Mounted on
dev 3.9G 0 3.9G 0% /dev
run 3.9G 1.1M 3.9G 1% /run
/dev/sda2 457G 409G 25G 95% /
tmpfs 3.9G 27M 3.9G 1% /dev/shm
tmpfs 3.9G 0 3.9G 0% /sys/fs/cgroup
tmpfs 3.9G 12M 3.9G 1% /tmp
/dev/loop0 83M 83M 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 93M 55M 32M 64% /boot
tmpfs 789M 28K 789M 1% /run/user/1000

```

Now look at the **Size** and **Avail** columns, the usage is shown in GB and MB.

**3\. Display disk space usage only in MB**

To view file system disk space usage only in Megabytes, use **-m** flag.
```
$ df -m
Filesystem 1M-blocks Used Available Use% Mounted on
dev 3939 0 3939 0% /dev
run 3945 2 3944 1% /run
/dev/sda2 467212 418742 24716 95% /
tmpfs 3945 26 3920 1% /dev/shm
tmpfs 3945 0 3945 0% /sys/fs/cgroup
tmpfs 3945 12 3933 1% /tmp
/dev/loop0 83 83 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 93 55 32 64% /boot
tmpfs 789 1 789 1% /run/user/1000

```

**4\. List inode information instead of block usage**

We can list inode information instead of block usage by using **-i** flag as shown below.
```
$ df -i
Filesystem Inodes IUsed IFree IUse% Mounted on
dev 1008304 439 1007865 1% /dev
run 1009720 649 1009071 1% /run
/dev/sda2 30392320 844035 29548285 3% /
tmpfs 1009720 86 1009634 1% /dev/shm
tmpfs 1009720 18 1009702 1% /sys/fs/cgroup
tmpfs 1009720 3008 1006712 1% /tmp
/dev/loop0 12829 12829 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 25688 390 25298 2% /boot
tmpfs 1009720 29 1009691 1% /run/user/1000

```

**5\. Display the file system type**

To display the file system type, use **-T** flag.
```
$ df -T
Filesystem Type 1K-blocks Used Available Use% Mounted on
dev devtmpfs 4033216 0 4033216 0% /dev
run tmpfs 4038880 1120 4037760 1% /run
/dev/sda2 ext4 478425016 428790896 25308436 95% /
tmpfs tmpfs 4038880 31300 4007580 1% /dev/shm
tmpfs tmpfs 4038880 0 4038880 0% /sys/fs/cgroup
tmpfs tmpfs 4038880 11984 4026896 1% /tmp
/dev/loop0 squashfs 84096 84096 0 100% /var/lib/snapd/snap/core/4327
/dev/sda1 ext4 95054 55724 32162 64% /boot
tmpfs tmpfs 807776 28 807748 1% /run/user/1000

```

As you see, there is an extra column (second from left) that shows the file system type.

**6\. Display only the specific file system type**

We can limit the listing to a certain file systems. for example **ext4**. To do so, we use **-t** flag.
```
$ df -t ext4
Filesystem 1K-blocks Used Available Use% Mounted on
/dev/sda2 478425016 428790896 25308436 95% /
/dev/sda1 95054 55724 32162 64% /boot

```

See? This command shows only the ext4 file system disk space usage.

**7\. Exclude specific file system type**

Some times, you may want to exclude a specific file system from the result. This can be achieved by using **-x** flag.
```
$ df -x ext4
Filesystem 1K-blocks Used Available Use% Mounted on
dev 4033216 0 4033216 0% /dev
run 4038880 1120 4037760 1% /run
tmpfs 4038880 26116 4012764 1% /dev/shm
tmpfs 4038880 0 4038880 0% /sys/fs/cgroup
tmpfs 4038880 11984 4026896 1% /tmp
/dev/loop0 84096 84096 0 100% /var/lib/snapd/snap/core/4327
tmpfs 807776 28 807748 1% /run/user/1000

```

The above command will display all file systems usage, except **ext4**.

**8\. Display usage for a folder**

To display the disk space available and where it is mounted for a folder, for example **/home/sk/** , use this command:
```
$ df -hT /home/sk/
Filesystem Type Size Used Avail Use% Mounted on
/dev/sda2 ext4 457G 409G 25G 95% /

```

This command shows the file system type, used and available space in human readable form and where it is mounted. If you don’t to display the file system type, just ignore the **-t** flag.

For more details, refer the man pages.
```
$ man df

```

**Recommended read:**

And, that’s all for today! I hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-df-command-tutorial-with-examples-for-beginners/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/04/df-command.png
