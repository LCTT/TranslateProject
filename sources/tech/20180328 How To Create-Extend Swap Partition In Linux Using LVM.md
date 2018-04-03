How To Create/Extend Swap Partition In Linux Using LVM
======
We are using LVM for flexible volume management so, why can’t we use LVM for swap space?

This allow users to increase the swap partition whenever we need.

If you upgraded the RAM in your system, it is necessary to add more swap space.

This help you to manage the system that run applications that require a large amount of memory.

Swap can be created in three ways

  * Create a new swap partition
  * Create a new swap file
  * Extend swap on an existing logical volume (LVM)



It’s recommended to create a dedicated swap partition instead of swap file.

**Suggested Read :**
**(#)** [3 Easy Ways To Create Or Extend Swap Space In Linux][1]
**(#)** [Automatically Create/Remove And Mount Swap File In Linux Using Shell Script][2]

What is the recommended swap size in Linux?

### What Is Swap Space

Swap space in Linux is used when the amount of physical memory (RAM) is full. When physical RAM is full, inactive pages in memory are moved to the swap space.

This helps system to run the application continuously but it’s not considered a replacement for more RAM.

Swap space is located on hard drives so, it would not processing the request like physical RAM.

### How To Create A Swap Partition Using LVM

As we already know how to create logical volume do the same for swap as well. Just follow the below procedure.

Create a logical volume which you required. In my case i’m going to create `5GB` of swap partition.
```
$ sudo lvcreate -L 5G -n LogVol_swap1 vg00
 Logical volume "LogVol_swap1" created.

```

Format the new swap space.
```
$ sudo mkswap /dev/vg00/LogVol_swap1
Setting up swapspace version 1, size = 5 GiB (5368705024 bytes)
no label, UUID=d278e9d6-4c37-4cb0-83e5-2745ca708582

```

Add the following entry to the `/etc/fstab` file.
```
# vi /etc/fstab
/dev/mapper/vg00-LogVol_swap1 swap swap defaults 0 0

```

Enable the extended logical volume.
```
$ sudo swapon -va
swapon: /swapfile: already active -- ignored
swapon: /dev/mapper/vg00-LogVol_swap1: found signature [pagesize=4096, signature=swap]
swapon: /dev/mapper/vg00-LogVol_swap1: pagesize=4096, swapsize=5368709120, devsize=5368709120
swapon /dev/mapper/vg00-LogVol_swap1

```

Test that the swap space has been added properly.
```
$ cat /proc/swaps
Filename                Type        Size    Used    Priority
/swapfile file      1459804 526336  -1
/dev/dm-0 partition 5242876 0   -2

$ free -g
 total used free shared buff/cache available
Mem: 1 1 0 0 0 0
Swap: 6 0 6

```

### How To Expand A Swap Partition Using LVM

Just follow the below procedure to extend an LVM swap logical volume.

Disable swapping for the associated logical volume.
```
$ sudo swapoff -v /dev/vg00/LogVol_swap1
swapoff /dev/vg00/LogVol_swap1

```

Resize the logical volume. I’m going to increase the swap volume from `5GB to 11GB`.
```
$ sudo lvresize /dev/vg00/LogVol_swap1 -L +6G
 Size of logical volume vg00/LogVol_swap1 changed from 5.00 GiB (1280 extents) to 11.00 GiB (2816 extents).
 Logical volume vg00/LogVol_swap1 successfully resized.

```

Format the new swap space.
```
$ sudo mkswap /dev/vg00/LogVol_swap1
mkswap: /dev/vg00/LogVol_swap1: warning: wiping old swap signature.
Setting up swapspace version 1, size = 11 GiB (11811155968 bytes)
no label, UUID=2e3b2ee0-ad0b-402c-bd12-5a9431b73623

```

Enable the extended logical volume.
```
$ sudo swapon -va
swapon: /swapfile: already active -- ignored
swapon: /dev/mapper/vg00-LogVol_swap1: found signature [pagesize=4096, signature=swap]
swapon: /dev/mapper/vg00-LogVol_swap1: pagesize=4096, swapsize=11811160064, devsize=11811160064
swapon /dev/mapper/vg00-LogVol_swap1

```

Test that the logical volume has been extended properly.
```
$ free -g
 total used free shared buff/cache available
Mem: 1 1 0 0 0 0
Swap: 12 0 12

$ cat /proc/swaps
Filename                Type        Size    Used    Priority
/swapfile file      1459804 237024  -1
/dev/dm-0 partition 11534332    0   -2

```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-create-extend-swap-partition-in-linux-using-lvm/

作者：[Ramya Nuvvula][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/ramya/
[1]:https://www.2daygeek.com/add-extend-increase-swap-space-memory-file-partition-linux/
[2]:https://www.2daygeek.com/shell-script-create-add-extend-swap-space-linux/
