[#]: collector: (lujun9972)
[#]: translator: (hello-wn)
[#]: reviewer: ( )
[#]: publisher: (heguangzhi)
[#]: url: ( )
[#]: subject: (How to Create and Use Swap File on Linux)
[#]: via: (https://itsfoss.com/create-swap-file-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Create and Use Swap File on Linux
======

This tutorial discusses the concept of swap file in Linux, why it is used and its advantages over the traditional swap partition. You’ll learn how to create swap file or resize it.

### What is a swap file in Linux?

A swap file allows Linux to simulate the disk space as RAM. When your system starts running out of RAM, it uses the swap space to and swaps some content of the RAM on to the disk space. This frees up the RAM to serve more important processes. When the RAM is free again, it swaps back the data from the disk. I recommend [reading this article to learn more about swap on Linux][1].

Traditionally, swap space is used as a separate partition on the disk. When you install Linux, you create a separate partition just for swap. But this trend has changed in the recent years.

With swap file, you don’t need a separate partition anymore. You create a file under root and tell your system to use it as the swap space.

With dedicated swap partition, resizing the swap space is a nightmare and an impossible task in many cases. But with swap files, you can resize them as you like.

Recent versions of Ubuntu and some other Linux distributions have started [using the swap file by default][2]. Even if you don’t create a swap partition, Ubuntu creates a swap file of around 1 GB on its own.

Let’s see some more on swap files.

![][3]

### Check swap space in Linux

Before you go and start adding swap space, it would be a good idea to check whether you have swap space already available in your system.

You can check it with the [free command in Linux][4]. In my case, my [Dell XPS][5] has 14GB of swap.

```
free -h
              total        used        free      shared  buff/cache   available
Mem:           7.5G        4.1G        267M        971M        3.1G        2.2G
Swap:           14G          0B         14G
```

The free command gives you the size of the swap space but it doesn’t tell you if it’s a real swap partition or a swap file. The swapon command is better in this regard.

```
swapon --show
NAME           TYPE       SIZE USED PRIO
/dev/nvme0n1p4 partition 14.9G   0B   -2
```

As you can see, I have 14.9 GB of swap space and it’s on a separate partition. If it was a swap file, the type would have been file instead of partition.

```
swapon --show
NAME      TYPE SIZE USED PRIO
/swapfile file   2G   0B   -2
```

If you don’ have a swap space on your system, it should show something like this:

```
free -h
              total        used        free      shared  buff/cache   available
Mem:           7.5G        4.1G        267M        971M        3.1G        2.2G
Swap:           0B          0B         0B
```

The swapon command won’t show any output.

### Create swap file on Linux

If your system doesn’t have swap space or if you think the swap space is not adequate enough, you can create swap file on Linux. You can create multiple swap files as well.

[][6]

Suggested read  Fix Missing System Settings In Ubuntu 14.04 [Quick Tip]

Let’s see how to create swap file on Linux. I am using Ubuntu 18.04 in this tutorial but it should work on other Linux distributions as well.

#### Step 1: Make a new swap file

First thing first, create a file with the size of swap space you want. Let’s say that I want to add 1 GB of swap space to my system. Use the fallocate command to create a file of size 1 GB.

```
sudo fallocate -l 1G /swapfile
```

It is recommended to allow only root to read and write to the swap file. You’ll even see warning like “insecure permissions 0644, 0600 suggested” when you try to use this file for swap area.

```
sudo chmod 600 /swapfile
```

Do note that the name of the swap file could be anything. If you need multiple swap spaces, you can give it any appropriate name like swap_file_1, swap_file_2 etc. It’s just a file with a predefined size.

#### Step 2: Mark the new file as swap space

Your need to tell the Linux system that this file will be used as swap space. You can do that with [mkswap][7] tool.

```
sudo mkswap /swapfile
```

You should see an output like this:

```
Setting up swapspace version 1, size = 1024 MiB (1073737728 bytes)
no label, UUID=7e1faacb-ea93-4c49-a53d-fb40f3ce016a
```

#### Step 3: Enable the swap file

Now your system knows that the file swapfile can be used as swap space. But it is not done yet. You need to enable the swap file so that your system can start using this file as swap.

```
sudo swapon /swapfile
```

Now if you check the swap space, you should see that your Linux system recognizes and uses it as the swap area:

```
swapon --show
NAME       TYPE   SIZE USED PRIO
/swapfile  file 1024M   0B   -2
```

#### Step 4: Make the changes permanent

Whatever you have done so far is temporary. Reboot your system and all the changes will disappear.

You can make the changes permanent by adding the newly created swap file to /etc/fstab file.

It’s always a good idea to make a backup before you make any changes to the /etc/fstab file.

```
sudo cp /etc/fstab /etc/fstab.back
```

Now you can add the following line to the end of /etc/fstab file:

```
/swapfile none swap sw 0 0
```

You can do it manually using a [command line text editor][8] or you just use the following command:

```
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

Now you have everything in place. Your swap file will be used even after you reboot your Linux system.

### Adjust swappiness

The swappiness parameters determines how often the swap space should be used. The swappiness value ranges from 0 to 100. Higher value means the swap space will be used more frequently.

The default swappiness in Ubuntu desktop is 60 while in server it is 1. You can check the swappiness with the following command:

```
cat /proc/sys/vm/swappiness
```

Why servers should use a low swappiness? Because swap is slower than RAM and for a better performance, the RAM should be utilized as much as possible. On servers, the performance factor is crucial and hence the swappinness is as low as possible.

[][9]

Suggested read  How to Replace One Linux Distribution With Another From Dual Boot [Keeping Home Partition]

You can change the swappiness on the fly using the following systemd command:

```
sudo sysctl vm.swappiness=25
```

This change it only temporary though. If you want to make it permanent, you can edit the /etc/sysctl.conf file and add the swappiness value in the end of the file:

```
vm.swappiness=25
```

### Resizing swap space on Linux

There are a couple of ways you can resize the swap space on Linux. But before you see that, you should learn a few things around it.

When you ask your system to stop using a swap file for swap area, it transfers all the data (pages to be precise) back to RAM. So you should have enough free RAM before you swap off.

This is why a good practice is to create and enable another temporary swap file. This way, when you swap off the original swap area, your system will use the temporary swap file. Now you can resize the original swap space. You can manually remove the temporary swap file or leave it as it is and it will be automatically deleted on the next boot.

If you have enough free RAM or if you created a temporary swap space, swapoff your original file.

```
sudo swapoff /swapfile
```

Now you can use fallocate command to change the size of the file. Let’s say, you change it to 2 GB in size:

```
sudo fallocate -l 2G /swapfile
```

Now mark the file as swap space again:

```
sudo mkswap /swapfile
```

And turn the swap on again:

```
sudo swapon /swapfile
```

You may also choose to have multiple swap files at the same time.

### Removing swap file in Linux

You may have your reasons for not using swap file on Linux. If you want to remove it, the process is similar to what you just saw in resizing the swap.

First, make sure that you have enough free RAM. Now swap off the file:

```
sudo swapoff /swapfile
```

The next step is to remove the respective entry from the /etc/fstab file.

And in the end, you can remove the file to free up the space:

```
sudo rm /swapfile
```

**Do you swap?**

I think you now have a good understanding of swap file concept in Linux. You can now easily create swap file or resize them as per your need.

If you have anything to add on this topic or if you have any doubts, please leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/create-swap-file-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/heguangzhi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/swap-size/
[2]: https://help.ubuntu.com/community/SwapFaq
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/08/swap-file-linux.png?resize=800%2C450&ssl=1
[4]: https://linuxhandbook.com/free-command/
[5]: https://itsfoss.com/dell-xps-13-ubuntu-review/
[6]: https://itsfoss.com/fix-missing-system-settings-ubuntu-1404-quick-tip/
[7]: http://man7.org/linux/man-pages/man8/mkswap.8.html
[8]: https://itsfoss.com/command-line-text-editors-linux/
[9]: https://itsfoss.com/replace-linux-from-dual-boot/
