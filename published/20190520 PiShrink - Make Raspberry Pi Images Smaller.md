[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10894-1.html)
[#]: subject: (PiShrink – Make Raspberry Pi Images Smaller)
[#]: via: (https://www.ostechnix.com/pishrink-make-raspberry-pi-images-smaller/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

PiShrink：使树莓派镜像更小
======

![Make Raspberry Pi Images Smaller With PiShrink In Linux][1]

树莓派不需要过多介绍。它是一款小巧、价格实惠，只有信用卡大小的电脑，它可以连接到显示器或电视。我们可以连接一个标准的键盘和鼠标，并将其用作一台成熟的台式计算机来完成日常任务，如互联网浏览、播放视频/玩游戏、文字处理和电子表格制作等。它主要是为学校的计算机科学教学而开发的。如今，树莓派被广泛用于大学、中小型组织和研究所来教授编码。

如果你有一台树莓派，你可能需要了解一个名为 PiShrink 的 bash 脚本，该脚本可使树莓派镜像更小。PiShrink 将自动缩小镜像，然后在启动时将其调整为 SD 卡的最大大小。这能更快地将镜像复制到 SD 卡中，同时缩小的镜像将更好地压缩。这对于将大容量镜像放入 SD 卡非常有用。在这个简短的指南中，我们将学习如何在类 Unix 系统中将树莓派镜像缩小到更小。

### 安装 PiShrink

要在 Linux 机器上安装 PiShrink，请先使用以下命令下载最新版本：

```
$ wget https://raw.githubusercontent.com/Drewsif/PiShrink/master/pishrink.sh
```

接下来，将下载的 PiShrink 变成二进制可执行文件：

```
$ chmod +x pishrink.sh
```

最后，移动到目录：

```
$ sudo mv pishrink.sh /usr/local/bin/
```

### 使树莓派镜像更小

你可能已经知道，Raspbian 是所有树莓派型号的官方操作系统。树莓派基金会为 PC 和 Mac 开发了树莓派桌面版本。你可以创建一个 live CD，并在虚拟机中运行它，甚至也可以将其安装在桌面上。树莓派也有少量非官方​​操作系统镜像。为了测试，我从[官方下载页面][2]下载了官方的 Raspbian 系统。

解压下载的系统镜像：

```
$ unzip 2019-04-08-raspbian-stretch-lite.zip
```

上面的命令将提取当前目录中 `2019-04-08-raspbian-stretch-lite.zip` 文件的内容。

让我们看下提取文件的实际大小：

```
$ du -h 2019-04-08-raspbian-stretch-lite.img
1.7G 2019-04-08-raspbian-stretch-lite.img
```

如你所见，提取的树莓派系统镜像大小为 1.7G。

现在，使用 PiShrink 缩小此文件的大小，如下所示：

```
$ sudo pishrink.sh 2019-04-08-raspbian-stretch-lite.img
```

示例输出：

```
Creating new /etc/rc.local
rootfs: 39795/107072 files (0.1% non-contiguous), 239386/428032 blocks
resize2fs 1.45.0 (6-Mar-2019)
resize2fs 1.45.0 (6-Mar-2019)
Resizing the filesystem on /dev/loop1 to 280763 (4k) blocks.
Begin pass 3 (max = 14)
Scanning inode table XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
Begin pass 4 (max = 3728)
Updating inode references XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
The filesystem on /dev/loop1 is now 280763 (4k) blocks long.

Shrunk 2019-04-08-raspbian-stretch-lite.img from 1.7G to 1.2G
```

正如你在上面的输出中看到的，树莓派镜像的大小已减少到 1.2G。

你还可以使用 `-s` 标志跳过该过程的自动扩展部分。

```
$ sudo pishrink.sh -s 2019-04-08-raspbian-stretch-lite.img newpi.img
```

这将创建一个源镜像文件（即 `2019-04-08-raspbian-stretch-lite.img`）的副本到一个新镜像文件（`newpi.img`）并进行处理。有关更多详细信息，请查看最后给出的官方 GitHub 页面。

就是这些了。希望本文有用。还有更多好东西，敬请期待！


资源：

  * [PiShrink 的 GitHub 仓库][4]
  * [树莓派网站][5]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/pishrink-make-raspberry-pi-images-smaller/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/pishrink-720x340.png
[2]: https://www.raspberrypi.org/downloads/
[3]: http://www.ostechnix.com/wp-content/uploads/2019/05/pishrink-1.png
[4]: https://github.com/Drewsif/PiShrink
[5]: https://www.raspberrypi.org/
