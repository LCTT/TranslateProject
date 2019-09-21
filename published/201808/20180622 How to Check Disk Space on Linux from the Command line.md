如何使用命令行检查 Linux 上的磁盘空间
========

> Linux 提供了所有必要的工具来帮助你确切地发现你的驱动器上剩余多少空间。Jack 在这里展示了如何做。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace-main.jpg?itok=t9Oxxc9X)

快速提问：你的驱动器剩余多少剩余空间？一点点还是很多？接下来的提问是：你知道如何找出这些剩余空间吗？如果你碰巧使用的是 GUI 桌面（ 例如 GNOME、KDE、Mate、Pantheon 等 ），则任务可能非常简单。但是，当你要在一个没有 GUI 桌面的服务器上查询剩余空间，你该如何去做呢？你是否要为这个任务安装相应的软件工具？答案是绝对不是。在 Linux 中，具备查找驱动器上的剩余磁盘空间的所有工具。事实上，有两个非常容易使用的工具。

在本文中，我将演示这些工具。我将使用 [Elementary OS][1]（LCTT译注：Elementary OS 是基于 Ubuntu 精心打磨美化的桌面 Linux 发行版 ），它还包括一个 GUI 方式，但我们将限制自己仅使用命令行。好消息是这些命令行工具随时可用于每个 Linux 发行版。在我的测试系统中，连接了许多的驱动器（内部的和外部的）。使用的命令与连接驱动器的位置无关，仅仅与驱动器是否已经挂载好并且对操作系统可见有关。

言归正传，让我们来试试这些工具。

### df

`df` 命令是我第一个用于在 Linux 上查询驱动器空间的工具，时间可以追溯到 20 世纪 90 年代。它的使用和报告结果非常简单。直到今天，`df` 还是我执行此任务的首选命令。此命令有几个选项开关，对于基本的报告，你实际上只需要一个选项。该命令是 `df -H` 。`-H` 选项开关用于将 `df` 的报告结果以人类可读的格式进行显示。`df -H` 的输出包括：已经使用了的空间量、可用空间、空间使用的百分比，以及每个磁盘连接到系统的挂载点（图 1）。

![df output][3]

*图 1：Elementary OS 系统上 `df -H` 命令的输出结果*

如果你的驱动器列表非常长并且你只想查看单个驱动器上使用的空间，该怎么办？对于 `df` 这没问题。我们来看一下位于 `/dev/sda1` 的主驱动器已经使用了多少空间。为此，执行如下命令：

```
df -H /dev/sda1
```
输出将限于该驱动器（图 2）。

![disk usage][6]

*图 2：一个单独驱动器空间情况*

你还可以限制 `df` 命令结果报告中显示指定的字段。可用的字段包括：

- `source` — 文件系统的来源（LCTT译注：通常为一个设备，如 `/dev/sda1` ）
- `size` — 块总数
- `used` — 驱动器已使用的空间
- `avail` — 可以使用的剩余空间
- `pcent` — 驱动器已经使用的空间占驱动器总空间的百分比
- `target` —驱动器的挂载点

让我们显示所有驱动器的输出，仅显示 `size` ，`used` ，`avail` 字段。对此的命令是：

```
df -H --output=size,used,avail
```

该命令的输出非常简单（ 图 3 ）。

![output][8]

*图 3：显示我们驱动器的指定输出*

这里唯一需要注意的是我们不知道该输出的来源，因此，我们要把 `source` 加入命令中：

```
df -H --output=source,size,used,avail
```

现在输出的信息更加全面有意义（图 4）。

![source][10]

*图 4：我们现在知道了磁盘使用情况的来源*

### du

我们的下一个命令是 `du` 。 正如您所料，这代表<ruby>磁盘使用情况<rt>disk usage</rt></ruby>。 `du` 命令与 `df` 命令完全不同，因为它报告目录而不是驱动器的空间使用情况。 因此，您需要知道要检查的目录的名称。 假设我的计算机上有一个包含虚拟机文件的目录。 那个目录是 `/media/jack/HALEY/VIRTUALBOX` 。 如果我想知道该特定目录使用了多少空间，我将运行如下命令：

```
du -h /media/jack/HALEY/VIRTUALBOX
```

上面命令的输出将显示目录中每个文件占用的空间（图 5）。

![du command][12]

*图 5 在特定目录上运行 `du` 命令的输出*

到目前为止，这个命令并没有那么有用。如果我们想知道特定目录的总使用量怎么办？幸运的是，`du` 可以处理这项任务。对于同一目录，命令将是：

```
du -sh /media/jack/HALEY/VIRTUALBOX/
```

现在我们知道了上述目录使用存储空间的总和（图 6）。

![space used][14]

*图 6：我的虚拟机文件使用存储空间的总和是 559GB*

您还可以使用此命令查看父项的所有子目录使用了多少空间，如下所示：

```
du -h /media/jack/HALEY
```

此命令的输出见（图 7），是一个用于查看各子目录占用的驱动器空间的好方法。

![directories][16]

*图 7：子目录的存储空间使用情况*

`du` 命令也是一个很好的工具，用于查看使用系统磁盘空间最多的目录列表。执行此任务的方法是将 `du` 命令的输出通过管道传递给另外两个命令：`sort` 和 `head` 。下面的命令用于找出驱动器上占用存储空间最大的前 10 个目录：

```
du -a /media/jack | sort -n -r |head -n 10
```

输出将以从大到小的顺序列出这些目录（图 8）。

![top users][18]

*图 8：使用驱动器空间最多的 10 个目录*

### 没有你想像的那么难

查看 Linux 系统上挂载的驱动器的空间使用情况非常简单。只要你将你的驱动器挂载在 Linux 系统上，使用 `df` 命令或 `du` 命令在报告必要信息方面都会非常出色。使用 `df` 命令，您可以快速查看磁盘上总的空间使用量，使用 `du` 命令，可以查看特定目录的空间使用情况。对于每一个 Linux 系统的管理员来说，这两个命令的结合使用是必须掌握的。

而且，如果你没有注意到，我最近介绍了[查看 Linux 上内存使用情况的方法][19]。总之，这些技巧将大力帮助你成功管理 Linux 服务器。

通过 Linux Foundation 和 edX 免费提供的 “Linux 简介” 课程，了解更多有关 Linux 的信息。

--------

via: https://www.linux.com/learn/intro-to-linux/2018/6how-check-disk-space-linux-command-line

作者：[Jack Wallen][a] 
选题：[lujun9972](https://github.com/lujun9972) 
译者：[SunWave](https://github.com/SunWave) 
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen	
[1]:https://elementary.io/	
[3]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_1.jpg?itok=aJa8AZAM
[6]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_2.jpg?itok=_PAq3kxC
[8]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_3.jpg?itok=51m8I-Vu
[10]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_4.jpg?itok=SuwgueN3
[12]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_5.jpg?itok=XfS4s7Zq
[14]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_6.jpg?itok=r71qICyG
[16]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_7.jpg?itok=PtDe4q5y
[18]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_8.jpg?itok=v9E1SFcC
[19]:https://www.linux.com/learn/5-commands-checking-memory-usage-linux	
[20]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux