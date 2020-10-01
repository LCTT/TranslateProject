[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Recovering deleted files on Linux with testdisk)
[#]: via: (https://www.networkworld.com/article/3575524/recovering-deleted-files-on-linux-with-testdisk.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Recovering deleted files on Linux with testdisk
======
This post describes testdisk, one of the tools that comes in handy for recovering recently deleted files (along with fixing partitions in other ways).
Thinkstock

When you delete a file on a Linux system, it isn’t necessarily gone forever, especially if you just recently deleted it.

Unless you rubbed it out with a tool such as **shred**, the data will still be sitting on your disk—and one of the best tools for recovering deleted files, **testdisk,** can help you rescue it. While **testdisk** has a wide range of functionality including recovering lost or damaged partitions and making non-booting disks bootable again, it’s also frequently used to restore files that were deleted by mistake.

In this post, we’ll take a look at how you can recover deleted files using **testdisk** and what each step in the process looks like. Since the process requires quite a few steps, you’re likely to feel more comfortable running through them once you’ve done it a few times.

### Installing testdisk

Install **testdisk** with commands like **apt install testdisk** or **yum install testdisk**. Interestingly, it’s not just a Linux tool but is also available for MacOS, Solaris and Windows as well.

Documentation is available at [cgsecurity.org][1].

### Recovering files

First of all, you have to be logged in as **root** or have **sudo** access to use **testdisk**. If you don’t have **sudo** access, you’ll get kicked out early in the process, and your logfile, if you chose to create one, will end up with a message like this in it:

```
TestDisk exited normally.
jdoe is not in the sudoers file.  This incident will be reported.
```

When you recover deleted files with **testdisk**, you’re going to end up with the files being restored within the directory form which you started the tool and the files are going to belong to **root**. For this reason, I like to start in a directory like **/home/recovery**. Once the files are successfully restored and verified, they can be moved back to where they belong and have their ownership restored as well.

Make sure you can write in the directory you select to start in.

```
$ cd /home/recovery
$ testdisk
```

The first page of information presented by **testdisk** describes the tool and displays some options. At least initially, it’s a good idea to create the log file as it provides information that might prove useful. Here’s how:

```
Use arrow keys to select, then press Enter key:
>[ Create ] Create a new log file
 [ Append ] Append information to log file
 [ No Log ] Don’t record anything
```

The **&gt;** on the left and the reversal of the font and background colors that you will see show the option that will be used once you press **enter**. In this example, we opted to create the log file.

You will then be prompted for your password (unless you very recently used **sudo**).

The next step is to select the disk partition in which the deleted file was stored (if not already highlighted). Use the up and down arrow keys as needed to move to it. Then tap the right arrow twice and press **enter** when **Proceed** is highlighted.

```
Select a media (use Arrow keys, then press Enter):
 Disk /dev/sda - 120 GB / 111 GiB - SSD2SC120G1CS1754D117-551
>Disk /dev/sdb - 500 GB / 465 GiB - SAMSUNG HE502HJ
 Disk /dev/loop0 - 13 MB / 13 MiB (RO)
 Disk /dev/loop1 - 101 MB / 96 MiB (RO)
 Disk /dev/loop10 - 148 MB / 141 MiB (RO)
 Disk /dev/loop11 - 36 MB / 35 MiB (RO)
 Disk /dev/loop12 - 52 MB / 49 MiB (RO)
 Disk /dev/loop13 - 78 MB / 75 MiB (RO)
 Disk /dev/loop14 - 173 MB / 165 MiB (RO)
 Disk /dev/loop15 - 169 MB / 161 MiB (RO)
>[Previous]  [  Next  ]  [Proceed ]  [  Quit  ]
```

In this example, the deleted file was in a home directory in **/dev/sdb**.

At this point, the partition type should already be selected by **testdisk**.

```
Disk /dev/sdb - 500 GB / 465 GiB - SAMSUNG HE502HJ

Please select the partition table type, press Enter when done.
 [Intel  ] Intel/PC partition
>[EFI GPT] EFI GPT partition map (Mac i386, some x86_64...)
 [Humax  ] Humax partition table
 [Mac    ] Apple partition map (legacy)
 [None   ] Non partitioned media
 [Sun    ] Sun Solaris partition
 [XBox   ] XBox partition
 [Return ] Return to disk selection
```

In the next step, arrow down to “[ Advanced ] Filesystem Utils”.

```
[ Analyse  ] Analyse current partition structure and search for lost partitions
>[ Advanced ] Filesystem Utils
 [ Geometry ] Change disk geometry
 [ Options  ] Modify options
 [ Quit     ] Return to disk selection
```

Next, view the selected partition.

```
Partition                  Start        End    Size in sectors
> 1 P Linux filesys. data         2048  910155775  910153728 [drive2]
```

Then press the right arrow to select **[ List ]** at the bottom and press enter.

```
[  Type  ]  [Superblock] >[  List  ]  [Image Creation]  [  Quit  ]
```

Notice that it looks as if we’re starting in **/**, but this is actually the base of the file system that we’re working in. In this example, that’s **/home**.

```
Directory /   <== starting point

>drwxr-xr-x     0     0      4096 23-Sep-2020 17:46 .
 drwxr-xr-x     0     0      4096 23-Sep-2020 17:46 ..
 drwx———     0     0     16384 22-Sep-2020 11:30 lost+found
 drwxr-xr-x  1008  1008      4096  9-Jul-2019 14:10 dorothy
 drwxr-xr-x  1001  1001      4096 22-Sep-2020 12:12 nemo
 drwxr-xr-x  1005  1005      4096 19-Jan-2020 11:49 eel
 drwxrwxrwx     0     0      4096 25-Sep-2020 08:08 recovery
...
```

Next, we arrow down to the specific home directory.

```
drwxr-xr-x  1016  1016      4096 17-Feb-2020 16:40 gino
>drwxr-xr-x  1000  1000     20480 25-Sep-2020 08:00 shs
```

Press enter to move into that directory and then arrow down to a subdirectory as needed. Note that you can choose **..** near the top of the list to back up if you picked the wrong one.

If you have trouble finding the file, you can press **/** (like when you start a search in **vi**) to be prompted to enter the file name or some portion of it.

```
Directory /shs     <== current location
                                                   Previous
...
 -rw-rw-r—  1000  1000       426  8-Apr-2019 19:09 2-min-topics
>-rw-rw-r—  1000  1000     24667  8-Feb-2019 08:57 Up_on_the_Roof.pdf
```

Once you’ve located the file that you need to restore, press “**c**” to select it.

NOTE: You will see helpful instructions at the bottom of your screen:

```
Use Left arrow to go back, Right to change directory, h to hide deleted files
    q to quit, : to select the current file, a to select all files
    C to copy the selected files, c to copy the current file <==
```

At this point, you’ll be ready to select where to restore that file within your starting directory (see earlier note about starting in a good place to check out the file before moving it back to its place of origin). In this case, the **/home/recovery** directory has no subdirectories, so this is our recovery spot.

NOTE: You will see helpful instructions at the bottom of the screen.

```
Please select a destination where /shs/Up_on_the_Roof.pdf will be copied.
Keys: Arrow keys to select another directory
      C when the destination is correct
      Q to quit
Directory /home/recovery    <== recovery location
```

Once you see “**Copy done! 1 ok, 0 failed**” in green, you’ll know the file has been restored.

The file in this case was left in **/home/recovery/shs** (starting directory with the selected directory appended).

You should probably verify that the recovered file looks right before moving it back into its original location. Make sure you also restore the original owner and group since the file will be owned by root at this point.

**NOTE:** For many points in the file recovery process, you can use quit (**q** or **[ Quit ]**) to back up a step. You can select quit options all the way back to the first step in the process if you like or **^c** to exit immediately.

#### Recovery training

Recovering files using **testdisk** is relatively painless, but somewhat complicated. It’s probably a good idea to practice recovering files before panic time sets to give yourself a chance to get comfortable with the process.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3575524/recovering-deleted-files-on-linux-with-testdisk.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.cgsecurity.org/testdisk.pdf
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
