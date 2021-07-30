[#]: subject: (Check used disk space on Linux with du)
[#]: via: (https://opensource.com/article/21/7/check-disk-space-linux-du)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

用 du 检查 Linux 上已使用的磁盘空间
======
用 Linux 的 du 命令了解你正在使用多少磁盘空间。
![Check disk usage][1]

无论你有多少存储空间，它总是有可能被填满。在大多数个人设备上，驱动器被照片、视频和音乐填满，但在服务器上，由于用户账户和日志文件中的数据，空间减少是很正常的。无论你是负责管理一个多用户系统，还是只负责自己的笔记本电脑，你都可以用 `du` 命令检查磁盘的使用情况。

默认情况下，`du` 提供了你当前目录中使用的磁盘空间，以及每个子目录的大小。


```
$ du
12 ./.backups
60 .
```

在这个例子中，我的当前目录总共占用了 60KB，其中 12KB 被子目录 `.backups` 占用。

如果你觉得这很混乱，并希望分别看到所有的大小，你可以使用 `--separate-dirs`（或简写 `S`）选项：


```
$ du --separate-dirs
12 ./.backups
48 .
```

这是相同的信息（48 加 12 是 60），但每个目录被独立处理。

要想看到更多的细节，可以使用 --all（简写 -a）选项，它显示每个目录中的每个文件：


```
$ du --separate-dirs --all        
4    ./example.adoc
28   ./graphic.png
4    ./.backups/example.adoc~
12   ./.backups
4    ./index.html
4    ./index.adoc
48   .
```

### 查看文件的修改时间

当查看文件以找出占用空间的内容时，查看文件最后一次被修改的时间是很有用的。一年内没有使用的文件很可能是归档的候选文件，特别是当你的空间快用完时。

用 du 查看文件的修改时间，使用 `--time` 选项：


```
$ du --separate-dirs --all --time
28   2021-07-21 11:12    ./graphic.png
4    2021-07-03 10:43    ./example.adoc
4    2021-07-13 13:03    ./index.html
4    2021-07-23 14:18    ./index.adoc
48   2021-07-23 14:19    .
```

### 为文件大小设置一个阈值

当为了磁盘空间而查看文件时，你可能只关心较大的文件。你可以用 `--threshold`（简写 `-t`）选项为你想看的文件大小设置一个阈值。例如，只查看大于 1GB 的文件：


```
$ \du --separate-dirs --all --time --threshold=1G ~/Footage/
1839008 2021-07-14 13:55    /home/tux/Footage/snowfall.mp4
1577980 2020-04-11 13:10    /home/tux/Footage/waterfall.mp4
8588936 2021-07-14 13:55    /home/tux/Footage/
```

当文件特别大时，它们可能难以阅读。使用 `--human-readable`（简写 `-h`）选项可以使文件大小更容易阅读：


```
$ \du --separate-dirs --all --time \
\--threshold=1G --human-readable ~/Footage/
1.8G 2021-07-14 13:55    /home/tux/Footage/snowfall.mp4
1.6G 2020-04-11 13:10    /home/tux/Footage/waterfall.mp4
8.5G 2021-07-14 13:55    /home/tux/Footage/
```

### 查看可用磁盘空间

如果只是想获得一个驱动器上还剩下多少磁盘空间的摘要，请阅读我们关于 [df 命令][2]的文章。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/check-disk-space-linux-du

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/du-splash.png?itok=nRLlI-5A (Check disk usage)
[2]: https://opensource.com/article/21/7/use-df-check-free-disk-space-linux
