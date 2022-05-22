[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12674-1.html)
[#]: subject: (Recovering deleted files on Linux with testdisk)
[#]: via: (https://www.networkworld.com/article/3575524/recovering-deleted-files-on-linux-with-testdisk.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

用 testdisk 恢复 Linux 上已删除的文件
======

> 这篇文章介绍了 testdisk，这是恢复最近删除的文件（以及用其他方式修复分区）的工具之一，非常方便。

![](https://images.idgesg.net/images/article/2018/01/survival_life-preserver_risk_swimming_rescue-100747102-large.jpg)

当你在 Linux 系统上删除一个文件时，它不一定会永远消失，特别是当你最近才刚刚删除了它的时候。

除非你用 `shred` 等工具把它擦掉，否则数据仍然会放在你的磁盘上 —— 而恢复已删除文件的最佳工具之一 `testdisk` 可以帮助你拯救它。虽然 `testdisk` 具有广泛的功能，包括恢复丢失或损坏的分区和使不能启动磁盘可以重新启动，但它也经常被用来恢复被误删的文件。

在本篇文章中，我们就来看看如何使用 `testdisk` 恢复已删除的文件，以及该过程中的每一步是怎样的。由于这个过程需要不少的步骤，所以当你做了几次之后，你可能会觉得操作起来会更加得心应手。

### 安装 testdisk

可以使用 `apt install testdisk` 或 `yum install testdisk` 等命令安装 `testdisk`。有趣的是，它不仅是一个 Linux 工具，而且还适用于 MacOS、Solaris 和 Windows。

文档可在 [cgsecurity.org][1] 中找到。

### 恢复文件

首先，你必须以 `root` 身份登录，或者有 `sudo` 权限才能使用 `testdisk`。如果你没有 `sudo` 访问权限，你会在这个过程一开始就被踢出，而如果你选择创建了一个日志文件的话，最终会有这样的消息：

```
TestDisk exited normally.
jdoe is not in the sudoers file.  This incident will be reported.
```

当你用 `testdisk` 恢复被删除的文件时，你最终会将恢复的文件放在你启动该工具的目录下，而这些文件会属于 `root`。出于这个原因，我喜欢在 `/home/recovery` 这样的目录下启动。一旦文件被成功地还原和验证，就可以将它们移回它们的所属位置，并将它们的所有权也恢复。

在你可以写入的选定目录下开始：

```
$ cd /home/recovery
$ testdisk
```

`testdisk` 提供的第一页信息描述了该工具并显示了一些选项。至少在刚开始，创建个日志文件是个好主意，因为它提供的信息可能会被证明是有用的。下面是如何做的：

```
Use arrow keys to select, then press Enter key:
>[ Create ] Create a new log file
 [ Append ] Append information to log file
 [ No Log ] Don’t record anything
```

左边的 `>` 以及你看到的反转的字体和背景颜色指出了你按下回车键后将使用的选项。在这个例子中，我们选择了创建日志文件。

然后会提示你输入密码（除非你最近使用过 `sudo`）。

下一步是选择被删除文件所存储的磁盘分区（如果没有高亮显示的话）。根据需要使用上下箭头移动到它。然后点两次右箭头，当 “Proceed” 高亮显示时按回车键。

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

在这个例子中，被删除的文件在 `/dev/sdb` 的主目录下。

此时，`testdisk` 应该已经选择了合适的分区类型。

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

在下一步中，按向下箭头指向 “[ Advanced ] Filesystem Utils”。

```
[ Analyse  ] Analyse current partition structure and search for lost partitions
>[ Advanced ] Filesystem Utils
 [ Geometry ] Change disk geometry
 [ Options  ] Modify options
 [ Quit     ] Return to disk selection
```

接下来，查看选定的分区。

```
Partition                  Start        End    Size in sectors
> 1 P Linux filesys. data         2048  910155775  910153728 [drive2]
```

然后按右箭头选择底部的 “[ List ]”，按回车键。

```
[  Type  ]  [Superblock] >[  List  ]  [Image Creation]  [  Quit  ]
```

请注意，它看起来就像我们从根目录 `/` 开始，但实际上这是我们正在工作的文件系统的基点。在这个例子中，就是 `/home`。

```
Directory /   <== 开始点

>drwxr-xr-x     0     0      4096 23-Sep-2020 17:46 .
 drwxr-xr-x     0     0      4096 23-Sep-2020 17:46 ..
 drwx———     0     0     16384 22-Sep-2020 11:30 lost+found
 drwxr-xr-x  1008  1008      4096  9-Jul-2019 14:10 dorothy
 drwxr-xr-x  1001  1001      4096 22-Sep-2020 12:12 nemo
 drwxr-xr-x  1005  1005      4096 19-Jan-2020 11:49 eel
 drwxrwxrwx     0     0      4096 25-Sep-2020 08:08 recovery
...
```

接下来，我们按箭头指向具体的主目录。

```
drwxr-xr-x  1016  1016      4096 17-Feb-2020 16:40 gino
>drwxr-xr-x  1000  1000     20480 25-Sep-2020 08:00 shs
```

按回车键移动到该目录，然后根据需要向下箭头移动到子目录。注意，如果选错了，可以选择列表顶部附近的 `..` 返回。

如果找不到文件，可以按 `/`（就像在 `vi` 中开始搜索时一样），提示你输入文件名或其中的一部分。

```
Directory /shs     <== current location
                                                   Previous
...
 -rw-rw-r—  1000  1000       426  8-Apr-2019 19:09 2-min-topics
>-rw-rw-r—  1000  1000     24667  8-Feb-2019 08:57 Up_on_the_Roof.pdf
```

一旦你找到需要恢复的文件，按 `c` 选择它。

注意：你会在屏幕底部看到有用的说明：

```
Use Left arrow to go back, Right to change directory, h to hide deleted files
    q to quit, : to select the current file, a to select all files
    C to copy the selected files, c to copy the current file <==
```

这时，你就可以在起始目录内选择恢复该文件的位置了（参见前面的说明，在将文件移回原点之前，先在一个合适的地方进行检查）。在这种情况下，`/home/recovery` 目录没有子目录，所以这就是我们的恢复点。

注意：你会在屏幕底部看到有用的说明：

```
Please select a destination where /shs/Up_on_the_Roof.pdf will be copied.
Keys: Arrow keys to select another directory
      C when the destination is correct
      Q to quit
Directory /home/recovery    <== 恢复位置
```

一旦你看到 “Copy done! 1 ok, 0 failed” 的绿色字样，你就会知道文件已经恢复了。

在这种情况下，文件被留在 `/home/recovery/shs` 下（起始目录，附加所选目录）。

在将文件移回原来的位置之前，你可能应该先验证恢复的文件看起来是否正确。确保你也恢复了原来的所有者和组，因为此时文件由 root 拥有。

**注意：** 对于文件恢复过程中的很多步骤，你可以使用退出（按 `q` 或“[ Quit ]”）来返回上一步。如果你愿意，可以选择退出选项一直回到该过程中的第一步，也可以选择按下 `^c` 立即退出。

#### 恢复训练

使用 `testdisk` 恢复文件相对来说没有痛苦，但有些复杂。在恐慌时间到来之前，最好先练习一下恢复文件，让自己有机会熟悉这个过程。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3575524/recovering-deleted-files-on-linux-with-testdisk.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.cgsecurity.org/testdisk.pdf
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
