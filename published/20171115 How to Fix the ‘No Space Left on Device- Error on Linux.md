如何解决 Linux 中“磁盘空间不足”的问题
======

![](https://www.maketecheasier.com/assets/uploads/2017/10/no-space-feat.jpg)

明明有很多剩余空间，但 Linux 系统依然提示没有空间剩余。为什么会这样呢？Linux 偶尔会有一些令人沮丧的模糊的错误消息出现，而这就是其中一种。不过这种错误通常都是由某几种因素导致的。

### 通过 du 和 df 检查磁盘空间

在开始行动前，最好先检查一下是否磁盘上是否确实还有空间剩余。虽然桌面环境的工具也很不错，但命令行上的工具更直接，要好的多。

![Linux Filesystem du][1]

首先让我们看看 `du` 命令。用它来检查问题磁盘所在的挂载点目录。本文假设出问题的分区挂载点为根目录。

```
sudo du -sh /
```

![Linux Filesystem df][2]

由于它要遍历磁盘中的所有文件，因此需要花费一点时间。现在再让我们试试 `df`。

```
sudo df -h
```

把根目录和在其中挂载的文件系统加在这条命令的后面。比如，若你的有一个独立的磁盘挂载到 `/home`，那么除了根目录之外，你也需要把它加进来。使用空间的总和应该跟你 `du` 命令得到的结果接近。否则的话，就说明可能有已删除文件的文件被进程占用。

当然，这里主要专注点在于这些命令的结果是否要小于磁盘的大小。如果确实小于磁盘大小，那么很明显有很多地方不对劲。

**相关**：[使用 Agedu 分析硬盘空间使用状况 ][3]
 
### 可能的原因

这里列出了一些产生这种情况的主要原因。若你发现 `du` 和 `df` 的结果之间有差别，那么可以直接检查第一项原因。否则从第二项原因开始检查。

#### 已删除文件被进程所占用

有时，文件可能已经被删掉了，但有进程依然在使用它。在进程运行期间，Linux 不会释放该文件的存储空间。你需要找出这个进程然后重启这个进程。

![Check processes for deleted files][4]

使用下面命令来定位进程。

```
sudo lsof / | grep deleted
```

这应该会列出出问题的进程了，然后重启该进程。

```
sudo systemctl restart service_name
```

#### i 节点不够了

![Linux check filesystem inodes][5]

文件系统中有一些称为 “<ruby>i 节点<rt>inode</rt></ruby>” 的元数据，其用来保存文件的相关信息。很多文件系统中的 i 节点数量是固定的，因此很可能 i 节点已经耗尽了而文件系统本身还没有用完。你可以使用 `df` 来检查。

```
sudo df -i /
```

比较一下已用的 i 节点和总共的 i 节点数量。如果没有可用的 i 节点了，那么很不幸，你也无法扩充 i 节点。删除一些无用的和过期的文件来释放一些 i 节点吧。

#### 环块

最后一个很常见的问题就是坏的文件系统块。除非另有标记，否则操作系统很可能会认为这些块都是可用的，这会导致文件系统损坏或者硬盘坏死。最好是使用带 `-cc` 标志的 `fsck` 搜索并标记出这些块。记住，你不能使用正在使用的文件系统（LCTT 译注：即包含坏块的文件系统）中的 `fsck` 命令。你应该会要用到 live CD。

```
sudo fsck -vcck /dev/sda2
```

很明显，这里需要使用你想检查的磁盘路径取代命令中的磁盘位置。另外，要注意，这恐怕会花上很长一段时间。

**相关**：[使用 fsck 检查并修复你的文件系统 [Linux]][6]

希望这些方案能解决你的问题。这种问题在任何情况下都不是那么容易诊断的。但是，在运气好的情况下，你可以把文件系统清理干净并让你的硬盘再次正常工作。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/fix-linux-no-space-left-on-device-error/

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/nickcongleton/
[1]:https://www.maketecheasier.com/assets/uploads/2017/10/no-space-du.jpg (Linux Filesystem du)
[2]:https://www.maketecheasier.com/assets/uploads/2017/10/no-space-df.jpg (Linux Filesystem df)
[3]:https://www.maketecheasier.com/agedu-analyze-hard-disk-space-usage-in-linux/ (Use Agedu to Analyze Hard Disk Space Usage in Linux)
[4]:https://www.maketecheasier.com/assets/uploads/2017/10/no-space-process.jpg (Check processes for deleted files)
[5]:https://www.maketecheasier.com/assets/uploads/2017/10/no-space-inode.jpg (Linux check filesystem inodes)
[6]:https://www.maketecheasier.com/check-repair-filesystem-fsck-linux/ (Check and Repair Your Filesystem With fsck [Linux])
