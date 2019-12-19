[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (App Highlight: Open Source Disk Partitioning Tool GParted)
[#]: via: (https://itsfoss.com/gparted/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

App Highlight: Open Source Disk Partitioning Tool GParted
======

_**Brief: GParted is an incredibly popular and free partition editor available for Linux distros. Here, we take a look at what it offers in brief.**_

### GParted: A Free &amp; Open-Source GUI-based Partition Manager

![][1]

GParted is undoubtedly one of the [best partition managers for Linux][2] out there. The user interface is very simple and gets the job done.

In some cases, you end up using [GParted][3] to fix or format your USB drive as well. I had a [USB disk which I couldn’t format in Ubuntu][4] using the “Disks” app – this is where GParted came to the rescue.

So, it is a quite useful tool with a lot of good features. Let me highlight them for you.

Warning!

Playing with disk partitioning is a risky task. Don’t do it unless it’s absolutely necessary. Or else, you might just end up wiping the entire disk.

### Features of GParted

You can do a lot of things with GParted, ranging from a simple format task to important partitioning tasks. I’ll highlight the key features with some screenshots to help you know more about it before installing it.

#### Create partition tables

You can create a new partition table for your new disks or erase the content of your existing disk to modify the partition table.

![][5]

You will be able to select msdos, gpt, atari, and a lot more types of partition tables.

#### Create, move, label, delete &amp; modify partitions

You can easily create, label, delete or modify the partitions with a bunch of options available within GParted.

![][6]

Of course, you will have to be careful about what you want to do.

The good thing is that GParted makes sure that you do not directly apply any changes – it queues up your selected operations/tasks and asks for another final confirmation before you hit it.

The tick mark symbol ✓on the top allows you to confirm the changes and then only your changes take into effect.

Here’s another screenshot for the options you have available for the partitions:

![][7]

#### Attempt data rescue

Apart from editing partitions, you can also try to [recover your lost data in Linux][8] using the “**Attempt Data Rescue**” feature as shown in the screenshot below.

![][9]

It is worth noting that you do not have this feature installed by default – you only see the option visible. So, for the data recovery feature to work, you have to install gpart separately using the following command (on Ubuntu/Debian-based distributions):

```
sudo apt install gpart
```

In addition to all the key features, it supports a wide range of storage devices and filesystems. You can learn more about it from the [list of features][10] on their official website.

### Installing GParted on Ubuntu and other Linux distributions

You might have GParted pre-installed. So, make sure to verify that. If you do not have it installed, you can head into the software center to get it installed.

In case you want to use the terminal, simply type in the following command:

```
sudo apt install gparted
```

As I mentioned above, if you want the data recovery option, you should install gpart package in addition to gparted package.

If you’re using any other Linux distribution, you can either find it in the respective software manager or simply check out the [official download instructions][11].

[Download GParted][11]

**Wrapping Up**

GParted is a very useful and important tool when it comes to dealing with disk management and partitions. However, you will have to be careful while using it for the obvious reasons.

Have you tried GParted? Which other partitioning tool you use on Linux? Feel free to share your experiences in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/gparted/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/gparted-screenshot.png?ssl=1
[2]: https://itsfoss.com/partition-managers-linux/
[3]: https://gparted.org/
[4]: https://itsfoss.com/format-usb-drive-sd-card-ubuntu/
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/gparted-create-partition-table.png?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/gparted-modify-partitions.png?ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/gparted-partition-options.png?ssl=1
[8]: https://itsfoss.com/recover-deleted-files-linux/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/gparted-attempt-data-rescue-feature.png?ssl=1
[10]: https://gparted.org/features.php
[11]: https://gparted.org/download.php
