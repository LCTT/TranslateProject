[#]: subject: (Use df to check free disk space on Linux)
[#]: via: (https://opensource.com/article/21/7/check-disk-space-linux-df)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (piaoshi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13646-1.html)

使用 df 命令查看 Linux 上的可用磁盘空间
======

> 利用 df 命令查看 Linux 磁盘还剩多少空间。

![](https://img.linux.net.cn/data/attachment/album/202108/04/110742netskjccb5vzvujk.jpg)

磁盘空间已经不像计算机早期那样珍贵，但无论你有多少磁盘空间，总有耗尽的可能。计算机需要一些磁盘空间才能启动运行，所以为了确保你没有在无意间用尽了所有的硬盘空间，偶尔检查一下是非常必要的。在 Linux 终端，你可以用 `df` 命令来做这件事。

`df` 命令可以显示文件系统中可用的磁盘空间。

要想使输出结果易于阅读，你可以加上 `--human-readable`（或其简写 `-h`）选项：

```
$ df --human-readable
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       1.0T  525G  500G  52% /
```

在这个例子中，计算机的磁盘已经用了 52%，还有 500 GB 可用空间。

由于 Linux 从整体上看待所有挂载设备的文件系统，`df` 命令会展示出连接到计算机上的每个存储设备的详细信息。如果你有很多磁盘，那么输出结果将会反映出来：

```
$ df --human-readable
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       110G   45G   61G  43% /
devtmpfs         12G     0   12G   0% /dev
tmpfs            12G  848K   12G   1% /run
/dev/sda1       1.6T  1.3T  191G  87% /home
/dev/sdb1       917G  184G  687G  22% /penguin
/dev/sdc1        57G   50G  4.5G  92% /sneaker
/dev/sdd1       3.7T  2.4T  1.3T  65% /tux
```

在这个例子中，计算机的 `/home` 目录已经用了 87%，剩下 191 GB 的可用空间。

### 查看总的可用磁盘空间

如果你的文件系统确实很复杂，而你希望看到所有磁盘的总空间，可以使用 `--total` 选项：

```
$ df --human-readable --total
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       110G   45G   61G  43% /
devtmpfs         12G     0   12G   0% /dev
tmpfs            12G  848K   12G   1% /run
/dev/sda1       1.6T  1.3T  191G  87% /home
/dev/sdb1       917G  184G  687G  22% /penguin
/dev/sdc1        57G   50G  4.5G  92% /sneaker
/dev/sdd1       3.7T  2.4T  1.3T  65% /tux
total           6.6T  4.0T  2.5T  62% -
```

输出的最后一行展示了文件系统的总空间、已用总空间、可用总空间。

### 查看磁盘空间使用情况

如果你想大概了解哪些文件占用了磁盘空间，请阅读我们关于 [du 命令][2] 的文章。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/check-disk-space-linux-df

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[piaoshi](https://github.com/piaoshi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/df-splash.png?itok=AGXQm737 (Free disk space)
[2]: https://opensource.com/article/21/7/check-used-disk-space-linux-du
