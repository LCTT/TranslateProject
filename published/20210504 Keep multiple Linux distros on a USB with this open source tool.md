[#]: subject: (Keep multiple Linux distros on a USB with this open source tool)
[#]: via: (https://opensource.com/article/21/5/linux-ventoy)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13361-1.html)

神器：在一个 U 盘上放入多个 Linux 发行版
======

> 用 Ventoy 创建多启动 U 盘，你将永远不会缺少自己喜欢的 Linux 发行版。

![](https://img.linux.net.cn/data/attachment/album/202105/05/131432p5q7hh5cm7a8ffsd.jpg)

给朋友和邻居一个可启动 U 盘，里面包含你最喜欢的 Linux 发行版，是向 Linux 新手介绍我们都喜欢的 Linux 体验的好方法。仍然有许多人从未听说过 Linux，把你喜欢的发行版放在一个可启动的 U 盘上是让他们进入 Linux 世界的好办法。

几年前，我在给一群中学生教授计算机入门课。我们使用旧笔记本电脑，我向学生们介绍了 Fedora、Ubuntu 和 Pop!_OS。下课后，我给每个学生一份他们喜欢的发行版的副本，让他们带回家安装在自己选择的电脑上。他们渴望在家里尝试他们的新技能。

### 把多个发行版放在一个驱动器上

最近，一个朋友向我介绍了 Ventoy，它（根据其 [GitHub 仓库][2]）是 “一个开源工具，可以为 ISO/WIM/IMG/VHD(x)/EFI 文件创建可启动的 USB 驱动器”。与其为每个我想分享的 Linux 发行版创建单独的驱动器，我可以在一个 U 盘上放入我喜欢的 _所有_ Linux 发行版！

![USB 空间][3]

正如你所能想到的那样，U 盘的大小决定了你能在上面容纳多少个发行版。在一个 16GB 的 U 盘上，我放置了 Elementary 5.1、Linux Mint Cinnamon 5.1 和 Linux Mint XFCE 5.1......但仍然有 9.9GB 的空间。

### 获取 Ventoy

Ventoy 是开源的，采用 [GPLv3][5] 许可证，可用于 Windows 和 Linux。有很好的文档介绍了如何在 Windows 上下载和安装 Ventoy。Linux 的安装是通过命令行进行的，所以如果你不熟悉这个过程，可能会有点混乱。然而，其实很容易。

首先，[下载 Ventoy][6]。我把存档文件下载到我的桌面上。

接下来，使用 `tar` 命令解压 `ventoy-x.y.z-linux.tar.gz` 档案（但要用你下载的版本号替换 `x.y.z`）（为了保持简单，我在命令中使用 `*` 字符作为任意通配符）：

```
$ tar -xvf ventoy*z
```

这个命令将所有必要的文件提取到我桌面上一个名为 `ventoy-x.y.z` 的文件夹中。

你也可以使用你的 Linux 发行版的存档管理器来完成同样的任务。下载和提取完成后，你就可以把 Ventoy 安装到你的 U 盘上了。

### 在 U 盘上安装 Ventoy 和 Linux

把你的 U 盘插入你的电脑。改变目录进入 Ventoy 的文件夹，并寻找一个名为 `Ventoy2Disk.sh` 的 shell 脚本。你需要确定你的 U 盘的正确挂载点，以便这个脚本能够正常工作。你可以通过在命令行上发出 `mount` 命令或者使用 [GNOME 磁盘][7] 来找到它，后者提供了一个图形界面。后者显示我的 U 盘被挂载在 `/dev/sda`。在你的电脑上，这个位置可能是 `/dev/sdb` 或 `/dev/sdc` 或类似的位置。

![GNOME 磁盘中的 USB 挂载点][8]

下一步是执行 Ventoy shell 脚本。因为它被设计成不加选择地复制数据到一个驱动器上，我使用了一个假的位置（`/dev/sdX`）来防止你复制/粘贴错误，所以用你想覆盖的实际驱动器的字母替换后面的 `X`。

**让我重申**：这个 shell 脚本的目的是把数据复制到一个驱动器上， _破坏该驱动器上的所有数据。_ 如果该驱动器上有你关心的数据，在尝试这个方法之前，先把它备份! 如果你不确定你的驱动器的位置，在你继续进行之前，请验证它，直到你完全确定为止。

一旦你确定了你的驱动器的位置，就运行这个脚本：

```
$ sudo sh Ventoy2Disk.sh -i /dev/sdX
```

这样就可以格式化它并将 Ventoy 安装到你的 U 盘上。现在你可以复制和粘贴所有适合放在 U 盘上的 Linux 发行版文件。如果你在电脑上用新创建的 U 盘引导，你会看到一个菜单，上面有你复制到 U 盘上的发行版。

![Ventoy 中的 Linux 发行版][9]

### 构建一个便携式的动力源

Ventoy 是你在钥匙串上携带多启动 U 盘的关键（钥匙），这样你就永远不会缺少你所依赖的发行版。你可以拥有一个全功能的桌面、一个轻量级的发行版、一个纯控制台的维护工具，以及其他你想要的东西。

我从来没有在没有 Linux 发行版的情况下离开家，你也不应该。拿上 Ventoy、一个 U 盘，和一串 ISO。你不会后悔的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/linux-ventoy

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/markus-winkler-usb-unsplash.jpg?itok=5ZXDp0V4 (USB drive)
[2]: https://github.com/ventoy/Ventoy
[3]: https://opensource.com/sites/default/files/uploads/ventoy1.png (USB space)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://www.ventoy.net/en/doc_license.html
[6]: https://github.com/ventoy/Ventoy/releases
[7]: https://wiki.gnome.org/Apps/Disks
[8]: https://opensource.com/sites/default/files/uploads/usb-mountpoint.png (USB mount point in GNOME Disks)
[9]: https://opensource.com/sites/default/files/uploads/ventoy_distros.jpg (Linux distros in Ventoy)
