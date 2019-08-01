[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 Free Partition Managers for Linux)
[#]: via: (https://itsfoss.com/partition-managers-linux/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

5 Free Partition Managers for Linux
======

_**Here’s our recommended list of partitioning tools for Linux distributions. These tools let you delete, add, tweak or resize the disk partitioning on your Linux system.**_

Usually, you decide the disk partitions while installing the OS. But, what if you need to modify the partitions sometime after the installation. You just can’t go back to the setup screen in any way. So, that is where partition managers (or accurately disk partition managers) come in handy.

In most of the cases, you do not need to separately install the partition manager because it comes pre-installed. Also, it is worth noting that you can either opt for a command-line based partition manager or something with a GUI.

Attention!

Playing with disk partitioning is a risky task. Don’t do it unless it’s absolutely necessary.
If you are using a command line based partitioning tool, you need to learn the commands to get the job done. Or else, you might just end up wiping the entire disk.

### 5 Tools To Manage Disk Partitions in Linux

![][1]

The list below is in no particular order of ranking. Most of these partitioning tools should be available in your Linux distribution’s repository.

#### GParted

![GParted][2]

This could perhaps be the most popular GUI-based partition manager available for Linux distributions. You might have it pre-installed in some distributions. If you don’t, simply search for it in the software center to get it installed.

It directly prompts you to authenticate as the root user when you launch it. So, you don’t have to utilize the terminal here – at all. After authentication, it analyzes the devices and then lets you tweak the disk partitions. You will also find an option to “Attempt Data Rescue” in case of data loss or accidental deletion of files.

[GParted][3]

#### GNOME Disks

![Gnome Disks][4]

A GUI-based partition manager that comes baked in with Ubuntu or any Ubuntu-based distros like Zorin OS.

[][5]

Suggested read  7 Best Linux Tools For Digital Artists

It lets you delete, add, resize and tweak the partition. It even helps you in [formatting the USB in Ubuntu][6] if there is any problem.

You can even attempt to repair a partition with the help of this tool. The options also include editing filesystem, creating a partition image, restoring the image, and benchmarking the partition.

[GNOME Disks][7]

#### KDE Partition Manager

![Kde Partition Manager][8]

KDE Partition Manager should probably come pre-installed on KDE-based Linux distros. But, if it isn’t there – you can search for it on the software center to easily get it installed.

If you didn’t have it pre-installed, you might get the notice that you do not have administrative privileges when you try launching it. Without admin privileges, you cannot do anything. So, in that case, type in the following command to get started:

```
sudo partitionmanager
```

It will scan your devices and then you will be able to create, move, copy, delete, and resize partitions. You can also import/export partition tables along with a lot of other options available to tweak.

[KDE Partition Manager][9]

#### Fdisk [Command Line]

![Fdisk][10]

[Fdisk][11] is a command line utility that comes baked in with every unix-like OS. Fret not, even though it requires you to launch a terminal and enter commands – it isn’t very difficult. However, if you are too confused while using a text-based utility, you should stick to the GUI applications mentioned above. They all do the same thing.

To launch fdisk, you will have to be the root user and specify the device to manage partitions. Here’s an example for the command to start with:

```
sudo fdisk /dev/sdc
```

You can refer to [The Linux Documentation Project’s wiki page][12] for the list of commands and more details on how it works.

#### GNU Parted [Command Line]

![Gnu Parted][13]

Yet another command-line utility that you can find pre-installed on your Linux distro. You just need to enter the following command to get started:

```
sudo parted
```

**Wrapping Up**

[][14]

Suggested read  Best Games On Steam You Can Play On Linux and Windows

I wouldn’t forget to mention [QtParted][15] as one of the alternatives to the list of partition managers. However, it has not been maintained for years now – so I do not recommend using it.

What do you think about the partition managers mentioned here? Did I miss any of your favorites? Let me know and I’ll update this list of partition manager for Linux with your suggestion.

--------------------------------------------------------------------------------

via: https://itsfoss.com/partition-managers-linux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/disk-partitioning-tools-linux.jpg?resize=800%2C450&ssl=1
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/g-parted.png?ssl=1
[3]: https://gparted.org/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/gnome-disks.png?ssl=1
[5]: https://itsfoss.com/best-linux-graphic-design-software/
[6]: https://itsfoss.com/format-usb-drive-sd-card-ubuntu/
[7]: https://wiki.gnome.org/Apps/Disks
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/07/kde-partition-manager.jpg?resize=800%2C404&ssl=1
[9]: https://kde.org/applications/system/org.kde.partitionmanager
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/07/fdisk.jpg?fit=800%2C496&ssl=1
[11]: https://en.wikipedia.org/wiki/Fdisk
[12]: https://www.tldp.org/HOWTO/Partition/fdisk_partitioning.html
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/07/gnu-parted.png?fit=800%2C559&ssl=1
[14]: https://itsfoss.com/best-linux-games-steam/
[15]: http://qtparted.sourceforge.net/
