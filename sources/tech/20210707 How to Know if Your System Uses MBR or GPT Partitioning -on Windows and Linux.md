[#]: subject: (How to Know if Your System Uses MBR or GPT Partitioning [on Windows and Linux])
[#]: via: (https://itsfoss.com/check-mbr-or-gpt/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How to Know if Your System Uses MBR or GPT Partitioning [on Windows and Linux]
======

Knowing the correct partitioning scheme of your disk could be crucial when you are installing Linux or any other operating system.

There are two popular partitioning schemes; the older MBR and the newer GPT. Most computers use GPT these days.

While creating the live or bootable USB, some tools (like [Rufus][1]) ask you the type of disk partitioning in use. If you choose GPT with an MBR disk, the bootable USB might not work.

In this tutorial, I’ll show various methods to check the disk partitioning scheme on Windows and Linux systems.

### Check whether your system uses MBR or GPT on Windows systems

While there are several ways to check the disk partitioning scheme in Windows including command line ones, I’ll stick with the GUI methods.

Press the Windows button and search for ‘disk’ and then click on “**Create and format disk partitions**“.

![][2]

In here, **right-click on the disk** for which you want to check the partitioning scheme. In the right-click context menu, **select Properties**.

![Right click on the disk and select properties][3]

In the Properties, go to **Volumes** tab and look for **Partition style**.

![In Volumes tab, look for Partition style][4]

As you can see in the screenshot above, the disk is using GPT partitioning scheme. For some other systems, it could show MBR or MSDOS partitioning scheme.

Now you know how to check disk partitioning scheme in Windows. In the next section, you’ll learn to do the same in Linux.

### Check whether your system uses MBR or GPT on Linux

There are several ways to check whether a disk uses MBR or GPT partitioning scheme in Linux as well. This includes commands and GUI tools.

Let me first show the command line method and then I’ll show a couple of GUI methods.

#### Check disk partitioning scheme in Linux command line

The command line method should work on all Linux distributions.

Open a terminal and use the following command with sudo:

```
sudo parted -l
```

The above command is actually a CLI-based [partitioning manager in Linux][5]. With the option -l, it lists the disks on your system along with the details about those disks. It includes partitioning scheme information.

In the output, look for the line starting with **Partition Table**:

![][6]

In the above screenshot, the disk has GPT partitioning scheme. For **MBR**, it would show **msdos**.

You learned the command line way. But if you are not comfortable with the terminal, you can use graphical tools as well.

#### Checking disk information with GNOME Disks tool

Ubuntu and many other GNOME-based distributions have a built-in graphical tool called Disks that lets you handle the disks in your system.

You can use the same tool for getting the partition type of the disk as well.

![][7]

#### Checking disk information with Gparted graphical tool

If you don’t have the option to use GNOME Disks tool, no worries. There are other tools available.

One such popular tool is Gparted. You should find it in the repositories of most Linux distributions. If not installed already, [install Gparted][8] using your distribution’s software center or [package manager][9].

In Gparted, select the disk and from the menu select **View-&gt;Device** Information. It will start showing the disk information in the bottom-left area and this information includes the partitioning scheme.

![][10]

See, not too complicated, was it? Now you know multiple ways of figuring our whether the disks in your system use GPT or MBR partitioning scheme.

On the same note, I would also like to mention that sometimes disks also have a [hybrid partitioning scheme][11]. This is not common and most of the time it is either MBR or GPT.

Questions? Suggestions? Please leave a comment below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-mbr-or-gpt/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://rufus.ie/en_US/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/03/disc-management-windows.png?resize=800%2C561&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/gpt-check-windows-1.png?resize=800%2C603&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/gpt-check-windows-2-1.png?resize=800%2C600&ssl=1
[5]: https://itsfoss.com/partition-managers-linux/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/check-if-mbr-or-gpt-in-Linux.png?resize=800%2C446&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/07/check-if-mbr-or-gpt-in-Linux-gui.png?resize=800%2C548&ssl=1
[8]: https://itsfoss.com/gparted/
[9]: https://itsfoss.com/package-manager/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/check-disk-partitioning-scheme-linux-gparted.jpg?resize=800%2C555&ssl=1
[11]: https://www.rodsbooks.com/gdisk/hybrid.html
