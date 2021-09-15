[#]: subject: "How to Use the dd Command to Create a Live USB Drive in Linux Terminal [For Experts and Adventurers]"
[#]: via: "https://itsfoss.com/live-usb-with-dd-command/"
[#]: author: "Hunter Wittenborn https://itsfoss.com/author/hunter/"
[#]: collector: "lujun9972"
[#]: translator: "perfiffer"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13787-1.html"

怎样在 Linux 终端下使用 dd 命令创建一个临场 USB 驱动器
======

![](https://img.linux.net.cn/data/attachment/album/202109/15/104940ucajv4o4zb8934ll.jpg)

有很多的图形化工具可以用来创建<ruby>临场<rt>live</rt></ruby> USB 驱动器。Linux 上的 [Etcher][1] 可能是最受欢迎的。为此，Ubuntu 也开发了自己的启动盘创建工具。

但是，资深 Linux 用户可能更喜欢使用 `dd` 命令在 Linux 终端中创建临场 USB，这会更快速便捷。

`dd` 命令是一个 [命令行][2] 工具，它提供了用来复制和转换文件的强大功能。

一个常见的使用示例是，用户使用 `dd` 命令将 ISO 文件写入到他们的外部存储设备（例如 USB 驱动盘），以用来给他们的电脑或者笔记本安装一个新的 Linux 发行版。

这就是我将在本教程中展示的内容。我将带你认识需要的命令，从终端找到我们的 USB 驱动器，然后对 ISO 文件进行实际刷写。

### 使用 dd 命令从 ISO 镜像创建临场 USB

在我向你展示步骤前，让我带你快速过一下你将要使用到的命令并解释它的作用。

这是一个使用命令刷写 ISO 的例子：

```
dd if="./filename.iso" of="/dev/sdb" status="progress" conv="fsync"
```

让我们来看看 [dd 命令][3] 实际都做了些什么。

#### 理解 dd 命令

![Explanation of the dd command for live USB creation][4]

首先，你输入 `dd`。没错，这就是你要运行的程序的名称。

接下来，你指定 `if="./filename.iso"`。`if` 代表<ruby>输入文件<rt>input file</rt></ruby>，告诉 `dd` 命令你将要向外部存储设备写入哪个文件。

之后，你输入 `of="/dev/sdb"`。和 `if` 一样，`of` 代表的是<ruby>输出文件<rt>output file</rt></ruby>。

要记住的是，输出文件在技术上不必是系统上的文件。你还可以指定诸如外部设备路径之类的内容（如示例所示），它看起来像系统上的普通文件，但实际上指向连接到你机器的设备。

`status` 可以设定为 3 个选项：`none`、`noxfer` 和 `progress`。

- 你设置的 `progress` 选项将使 `dd` 任务显示有关已将多少 ISO 文件传输到存储驱动器的定期统计信息，以及对 `dd` 任务完成前需要多长时间的估计。
- 如果你改为设置 `none` 选项，`dd` 任务在写入 ISO 文件期间只会打印错误消息，并且删除进度条之类的内容。
- `noxfer` 选项隐藏了传输完成后打印的一些信息，例如从开始到完成所用的时间。

最后，你将 `conv` 选项设置为 `fsync`。这会导致 `dd` 任务在整个 ISO 文件写入 USB 驱动器之前不会报告成功写入。

如果你省略这个选项，`dd` 任务会工作的很好（并且实际上可能看起来运行得更快），但你可能会发现你的系统需要很长时间才能告诉你移除 USB 驱动器是安全的，因为它会在后台完成 ISO 的内容写入，从而允许你在此期间做其它事情。

**现在你明白了你必须做什么，让我们看看如何去做。**

> **注意事项**
>
> 命令行是把双刃剑。当你在命令行使用类似于 `dd` 命令时必须十分小心。你必须确保你目标输出文件是正确的设备。一个错误的步骤就可能会格式化你的系统硬盘，你的操作系统也会因此而损坏。

#### 第 0 步: 下载所需的 ISO 镜像

不用说，你需要有一个 ISO 镜像文件才能将其刷写到 USB 上。

我将使用 Ubuntu 20.04 ISO（可在此处[下载][5]）来测试我之前介绍的 `dd` 命令。

#### 第 1 步: 获取 USB 盘符

插入你的 USB 驱动器。

我为 `of` 参数输入的具体路径是 `/dev/sdb`。USB 磁盘通常会标记为 `/dev/sdb`，但这不是硬性规定。

此路径可能因你的系统而异，你可以使用 `lsblk` 命令确认 USB 磁盘的路径。只需从列表中查找一个看起来像你的 USB 磁盘大小的驱动器，就可以了。

![][6]

如果你更熟悉 GUI 程序，还可以使用 GNOME Disks 等工具找到驱动器的路径。

![][7]

现在你已经确认了外部驱动器的路径，让我们开始创建临场 USB。

#### 第 2 步：将 ISO 文件写入 USB 磁盘 

在下载 ISO 文件的目录打开一个终端，然后运行以下命令（如果 `/dev/sdb` 与你的存储设备名称不同，请记住将其替换）：

```
sudo dd if="./ubuntu-20.04.2.0-desktop-amd64.iso" of="/dev/sdb" status="progress" conv="fsync"
```

之后，让 `dd` 去做剩下的事情，它会在完成后打印一条完成消息：

![][8]

就像这样，你已经在 Linux 终端中使用 `dd` 命令刷写了 ISO 文件！

### 总结

现在，你可以通过终端做更多的事情，让你的工作效率大大提高。

对 `dd` 命令有任何没解决的问题，或者无法正常工作？请随时在下面的评论部分中留下你的问题。

--------------------------------------------------------------------------------

via: https://itsfoss.com/live-usb-with-dd-command/

作者：[Hunter Wittenborn][a]
选题：[lujun9972][b]
译者：[perfiffer](https://github.com/perfiffer)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/hunter/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-etcher-linux/
[2]: https://itsfoss.com/gui-cli-tui/
[3]: https://linuxhandbook.com/dd-command/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/dd-command-for-live-usb-creation.png?resize=800%2C450&ssl=1
[5]: https://ubuntu.com/download/desktop/thank-you?version=20.04.2.0&architecture=amd64
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/dd_disks.png?resize=753%2C264&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/dd_gnome_disks.png?resize=800%2C440&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/dd-iso-write.png?resize=800%2C322&ssl=1
