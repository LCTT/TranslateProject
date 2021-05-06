[#]: subject: (How to Delete Partitions in Linux [Beginner’s Guide])
[#]: via: (https://itsfoss.com/delete-partition-linux/)
[#]: author: (Chris Patrick Carias Stas https://itsfoss.com/author/chris/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13346-1.html)

如何在 Linux 中删除分区
======

![](https://img.linux.net.cn/data/attachment/album/202104/30/095353uhtbhm2fqx44aqfo.jpg)

管理分区是一件严肃的事情，尤其是当你不得不删除它们时。我发现自己经常这样做，特别是在使用 U 盘作为实时磁盘和 Linux 安装程序之后，因为它们创建了几个我以后不需要的分区。

在本教程中，我将告诉你如何使用命令行和 GUI 工具在 Linux 中删除分区。

> 警告!
>
> 删除了分区，就会失去你的数据。无论何时，当你在操作分区时，一定要备份你的数据。一个轻微的打字错误或手滑都可能是昂贵的。不要说我们没有警告你！

### 使用 GParted 删除磁盘分区 （GUI 方法）

作为一个桌面 Linux 用户，你可能会对基于 GUI 的工具感到更舒服，也许更安全。

有 [几个让你在 Linux 上管理分区的工具][3]。根据你的发行版，你的系统上已经安装了一个甚至多个这样的工具。

在本教程中，我将使用 [GParted][4]。它是一个流行的开源工具，使用起来非常简单和直观。

第一步是 [安装 GParted][5]，如果它还没有在你的系统中。你应该能够在你的发行版的软件中心找到它。

![][6]

或者，你也可以使用你的发行版的软件包管理器来安装它。在基于 Debian 和 Ubuntu 的 Linux 发行版中，你可以 [使用 apt install 命令][7]：

```
sudo apt install gparted
```

安装完毕后，让我们打开 **GParted**。由于你正在处理磁盘分区，你需要有 root 权限。它将要求进行认证，打开后，你应该看到一个类似这样的窗口：

![][8]

在右上角，你可以选择磁盘，在下面选择你想删除的分区。

接下来，从分区菜单中选择 “删除” 选项：

![][9]

这个过程是没有完整完成的，直到你重写分区表。这是一项安全措施，它让你在确认之前可以选择审查更改。

要完成它，只需点击位于工具栏中的 “应用所有操作” 按钮，然后在要求确认时点击 “应用”。

![][10]

点击 “应用” 后，你会看到一个进度条和一个结果消息说所有的操作都成功了。你可以关闭该信息和主窗口，并认为你的分区已从磁盘中完全删除。

现在你已经知道了 GUI 的方法，让我们继续使用命令行。

### 使用 fdisk 命令删除分区（CLI 方法）

几乎每个 Linux 发行版都默认带有 [fdisk][11]，我们今天就来使用这个工具。你需要知道的第一件事是，你想删除的分区被分配到哪个设备上了。为此，在终端输入以下内容：

```
sudo fdisk --list
```

这将打印出我们系统中所有的驱动器和分区，以及分配的设备。你 [需要有 root 权限][12]，以便让它发挥作用。

在本例中，我将使用一个包含两个分区的 USB 驱动器，如下图所示：

![][13]

系统中分配的设备是 `/sdb`，它有两个分区：`sdb1` 和 `sdb2`。现在你已经确定了哪个设备包含这些分区，你可以通过使用 `fdisk` 和设备的路径开始操作：

```
sudo fdisk /dev/sdb
```

这将在命令模式下启动 `fdisk`。你可以随时按 `m` 来查看选项列表。

接下来，输入 `p`，然后按回车查看分区信息，并确认你正在使用正确的设备。如果使用了错误的设备，你可以使用 `q` 命令退出 `fdisk` 并重新开始。

现在输入 `d` 来删除一个分区，它将立即询问分区编号，这与 “Device” 列中列出的编号相对应，在这个例子中是 1 和 2（在下面的截图中可以看到），但是可以也会根据当前的分区表而有所不同。

![][14]

让我们通过输入 `2` 并按下回车来删除第二个分区。你应该看到一条信息：**“Partition 2 has been deleted”**，但实际上，它还没有被删除。`fdisk` 还需要一个步骤来重写分区表并应用这些变化。你看，这就是完全网。

你需要输入 `w`，然后按回车来使这些改变成为永久性的。没有再要求确认。

在这之后，你应该看到下面这样的反馈：

![][15]

现在，使用 `sudo fdisk --list /dev/sdb` 查看该设备的当前分区表，你可以看到第二个分区已经完全消失。你已经完成了使用终端和 `fdisk` 命令来删除你的分区。成功了！

#### 总结

这样，这个关于如何使用终端和 GUI 工具在 Linux 中删除分区的教程就结束了。记住，要始终保持安全，在操作分区之前备份你的文件，并仔细检查你是否使用了正确的设备。删除一个分区将删除其中的所有内容，而几乎没有 [恢复][16] 的机会。

--------------------------------------------------------------------------------

via: https://itsfoss.com/delete-partition-linux/

作者：[Chris Patrick Carias Stas][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chris/
[b]: https://github.com/lujun9972
[1]: tmp.Q615QYIwTl#gparted
[2]: tmp.Q615QYIwTl#fdisk
[3]: https://itsfoss.com/partition-managers-linux/
[4]: https://gparted.org/index.php
[5]: https://itsfoss.com/gparted/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/gparted-ubuntu-software-center.png?resize=800%2C348&ssl=1
[7]: https://itsfoss.com/apt-command-guide/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/removing-partitions-linux-004.png?resize=800%2C542&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/removing-partitions-linux-005.png?resize=800%2C540&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/removing-partitions-linux-006.png?resize=800%2C543&ssl=1
[11]: https://man7.org/linux/man-pages/man8/fdisk.8.html
[12]: https://itsfoss.com/root-user-ubuntu/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/removing-partitions-linux-001.png?resize=800%2C255&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/removing-partitions-linux-002.png?resize=800%2C362&ssl=1
[15]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/removing-partitions-linux-003.png?resize=800%2C153&ssl=1
[16]: https://itsfoss.com/recover-deleted-files-linux/
