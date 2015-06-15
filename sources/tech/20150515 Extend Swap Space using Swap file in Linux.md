Extend Swap Space using Swap file in Linux
================================================================================
There are some scenarios where our Linux box is running out of swap space so in that case we can extend the swap space using swap partition but due to unavailability of free partitions on the disk, we are unable to extend it.

So in such cases we can extend or increase swap space using a swap file

### Below are the Steps to extend Swap Space using Swap File in Linux ###

Lets first check the size of existing swap space / partition using the command like ‘**free -m‘** and ‘**swapon -s**‘

![](http://www.linuxtechi.com/wp-content/uploads/2015/06/free-output-with-swap.jpg)
free-output-with-swap

In my case size of swap partition is 2 GB. So we will be extending swap space by 1 GB.

#### Step:1 Create a swap file of size 1 GB using below dd Command ####

    [root@linuxtechi ~]# dd if=/dev/zero of=/swap_file bs=1G count=1
    1+0 records in
    1+0 records out
    1073741824 bytes (1.1 GB) copied, 414.898 s, 2.6 MB/s
    [root@linuxtechi ~]#

Replace the value of ‘**bs**‘ and ‘**count**‘ according your requirement.

#### Step:2 Secure the swap file with permissions 644. ####

    [root@linuxtechi ~]# chmod 600 /swap_file

#### Step:3 Enable the Swap Area on the file (swap_file) ####

Use mkswap command to enable swap area

    [root@linuxtechi ~]# mkswap /swap_file
    Setting up swapspace version 1, size = 1048572 KiB
    no label, UUID=f7b3ae59-c09a-4dc2-ba4d-c02abb7db33b
    [root@linuxtechi ~]#

#### Step:4 Add the swap file entry in the fstab file ####

Add the below entry in the fstab file so that swap file become persistent across every reboot.

    /swap_file  swap  swap  defaults  0 0

![swap-file-fstab-entry](http://www.linuxtechi.com/wp-content/uploads/2015/06/swap-file-fstab-entry.jpg)

#### Step:5 Enable the swap file using ‘mkswap on’ command. ####

    [root@linuxtechi ~]# swapon /swap_file
    [root@linuxtechi ~]#

#### Step:6 Now verify the swap space ####

![swap-space-after-extension](http://www.linuxtechi.com/wp-content/uploads/2015/06/swap-space-after-extension.jpg)

**Note**: To disable the swap file for any troubleshooting point of view, use swapoff command as shown below and to re-enable swap file then use swapon command as shown in step5.

    [root@linuxtechi ~]# swapoff /swap_file
    [root@linuxtechi ~]#

Please share your valuable inputs and comments of this article.

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/extend-swap-space-using-swap-file-in-linux/

作者：[Pradeep Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/