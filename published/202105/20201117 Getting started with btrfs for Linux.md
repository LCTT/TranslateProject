[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13440-1.html)
[#]: subject: (Getting started with btrfs for Linux)
[#]: via: (https://opensource.com/article/20/11/btrfs-linux)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Btrfs 文件系统入门
======

> B-tree 文件系统（Btrfs）融合了文件系统和卷管理器。它为 Linux 操作系统提供了高级文件系统应当拥有的诸多不错的功能特性。

![](https://img.linux.net.cn/data/attachment/album/202105/30/070203wkxsufbx1zlccyl9.jpg)

好几年前 Btrfs 就已经可以在 Linux 中使用了，所以你可能已经熟悉它了。如果没有，你可能对它尚有疑虑，尤其是如果你使用的是 Fedora 工作站 （Btrfs 现在是它的默认文件系统）。本文旨在帮助你熟悉它及其高级功能，例如 [写时复制][2] 和 [校验和][3]。

Btrfs 是 “B-Tree Filesystem” 的缩写，实际上是文件系统和卷管理器的结合体。它通常被视为对 ZFS 的回应，ZFS 早在 2005 年就被引入 Sun 微系统的 Solaris 操作系统中，现在基本上被一个名为 OpenZFS 的开源实现所取代。Ubuntu 和 FreeBSD 常常使用 OpenZFS。其他具有类似特性的示例有红帽的 Stratis 和 Linux <ruby>逻辑卷管理器<rt>Logical Volume Manager</rt></ruby>（LVM）。

### 安装

为了尝试 Btrfs，我下载了 Fedora 33 工作站 [ISO 文件][4] 并将其安装到一个新的虚拟机（VM）中。安装过程与以前的版本没有变化。我没有自定义任何设置，包括驱动器分区和格式化，以保持本教程的准确“开箱即用”设置。当虚拟机启动并运行后，我安装并运行了 GNOME 分区编辑器（[GParted][5]），以获得一个良好的、工厂级的驱动器布局视图。

![GParted's view of Btrfs on Fedora 33 Workstation using GParted][6]

从安装这一点来说，与你以前所习惯的情况没什么不同；事实上，你可以正常使用该系统，甚至可能没有注意到文件系统是 Btrfs。然而，拥有这个新的默认文件系统使你能够利用几个很酷的特性。

### 检查 Btrfs 文件系统

我暂时没有找到特定于 Btrfs 的图形工具，尽管它的一些功能已经被合并到现有的磁盘管理工具中。

在命令行中，你可以更仔细地查看 Btrfs 格式：

```
# btrfs filesystem show
Label: 'fedora_localhost-live'  uuid: f2bb02f9-5c41-4c91-8eae-827a801ee58a
        Total devices 1 FS bytes used 6.36GiB
        devid    1 size 10.41GiB used 8.02GiB path /dev/vda3
```

### 修改 Btrfs 标签

我首先注意到的是安装程序设置的文件系统标签：`fedora_localhost-live`。这是不准确的，因为它现在是一个已安装的系统，不再是 [livecd][8]。所以我使用 `btrfs filesystem label` 命令对其进行了更改。

修改 Btrfs 标签非常的简单：

```
# btrfs filesystem label /
fedora_localhost-live
# btrfs filesystem label / fedora33workstation
# btrfs filesystem label /
fedora33workstation
```

### 管理 Btrfs 子卷

子卷看起来像是可以由 Btrfs 管理的标准目录。我的新 Fedora 33 工作站上有几个子卷：

```
# btrfs subvolume list /
ID 256 gen 2458 top level 5 path home
ID 258 gen 2461 top level 5 path root
ID 265 gen 1593 top level 258 path var/lib/machines
```

使用 `btrfs subvolume Create` 命令创建新的子卷，或使用 `btrfs subvolume delete` 删除子卷：

```
# btrfs subvolume create /opt/foo
Create subvolume '/opt/foo'
# btrfs subvolume list /
ID 256 gen 2884 top level 5 path home
ID 258 gen 2888 top level 5 path root
ID 265 gen 1593 top level 258 path var/lib/machines
ID 276 gen 2888 top level 258 path opt/foo
# btrfs subvolume delete /opt/foo
Delete subvolume (no-commit): '/opt/foo'
```

子卷允许设置配额、拍摄快照以及复制到其他位置和其他主机等操作。那么系统管理员如何利用这些功能？用户主目录又是如何操作的呢？

#### 添加用户

就像从前一样，添加一个新的用户帐户会创建一个主目录供该帐户使用：

```
# useradd student1
# getent passwd student1
student1:x:1006:1006::/home/student1:/bin/bash
# ls -l /home
drwx------. 1 student1 student1  80 Oct 29 00:21 student1
```

传统上，用户的主目录是 `/home` 的子目录。所有权和操作权是为所有者量身定制的，但是特殊功能来没有管理它们。而企业服务器环境是另外一种情况。通常，目录是为特定的应用程序及其用户保留的。你可以利用 Btrfs 来管理和应用对这些目录的约束。

为了将 Btrfs 子卷作为用户主页，在 `useradd` 命令中有一个新选项：`--Btrfs-subvolume-home`。尽管手册页尚未更新（截至本文撰写之时），但你可以通过运行 `useradd --help` 来查看该选项。通过在添加新用户时传递此选项，将创建一个新的 Btrfs 子卷。它的功能与创建常规目录时的 `-d` 选项类似：

```
# useradd --btrfs-subvolume-home student2
Create subvolume '/home/student2'
```

使用 `getent passwd student2` 验证用户，它将显示为正常。但是，运行 `btrfs subvolume` 命令列出子卷，你将看到一些有趣的内容：新用户的主目录！

```
# btrfs subvolume list /
ID 256 gen 2458 top level 5 path home
ID 258 gen 2461 top level 5 path root
ID 265 gen 1593 top level 258 path var/lib/machines
ID 272 gen 2459 top level 256 path home/student2
```

探索企业服务器环境的第二个场景。假设你需要在 `/opt` 中安装一个 [WildFly][9] 服务器并部署一个 Java web 应用程序。通常，你的第一步是创建一个 `wildfly` 用户。使用新的 `--btrfs-subvolume-home` 选项和 `-b` 选项来指定 `/opt` 作为基本目录：

```
# useradd -b /opt --btrfs-subvolume-home wildfly
Create subvolume '/opt/wildfly'
```

于是，`wildfly` 用户可以使用了，并且主目录设置在了 `/opt/wildfly`。

#### 删除用户

删除用户时，有时需要同时删除该用户的文件和主目录。`userdel` 命令有 `-r` 选项，它可以同时删除 Btrfs 子卷：

```
# userdel -r student2
Delete subvolume (commit): '/home/student2'
```

#### 设置磁盘使用配额

在我的一节计算机科学课上，一个学生运行了一个失控的 C 程序，然后写进了磁盘，将我们院的 Unix 系统上整个 `/home` 目录都填满了！在管理员终止失控进程并清除一些空间之前，服务器将无法使用。上述情况也是如此；那个 Wildfly 企业应用程序将为其用户提供越来越多的日志文件和内容存储。如何防止服务器因磁盘已满而死机？设置磁盘使用限制是个好主意。幸运的是，Btrfs 通过设置配额的方式支持这一点。

配置配额需要几个步骤。第一步是在 Btrfs 文件系统上启用配额：

```
# btrfs quota enable /
```

确保你知道每个子卷的配额组（qgroup）ID 号，该编号由 `btrfs subvolume list` 命令显示。每个子卷都需要基于 ID 号码来关联配额组。这可以通过 `btrfs qgroup create` 单独完成，但是，btrfs 维基提供了以下命令来加快为文件系统上的子卷创建配额组：

```
> btrfs subvolume list \<path> | cut -d' ' -f2 | xargs -I{} -n1 btrfs qgroup destroy 0/{} \<path>
```

在新安装的 Fedora 33 工作站系统中，你在根文件系统路径上操作，`/`。用根路径替换 `\<path>`：

```
# btrfs subvolume list / | cut -d' ' -f2 | xargs -I{} -n1 btrfs qgroup create 0/{} /
```

然后运行 `btrfs quota rescan`，查看新的配额组：

```
# btrfs quota rescan /
quota rescan started
# btrfs qgroup show /
qgroupid         rfer         excl
--------         ----         ----
0/5          16.00KiB     16.00KiB
0/256       272.04MiB    272.04MiB
0/258         6.08GiB      6.08GiB
0/265        16.00KiB     16.00KiB
0/271        16.00KiB     16.00KiB
0/273        16.00KiB     16.00KiB
```

于是现在，你可以将配额分配给其中一个配额组，然后将配额应用于其关联的子卷。因此，如果要将 `student3` 的主目录使用限制为 1 GB，请使用 `btrfs qgroup limit` 命令：

```
# btrfs qgroup limit 1G /home/student3
```

查看特定子卷的配额：

```
# btrfs qgroup show -reF /home/student3
qgroupid         rfer         excl     max_rfer     max_excl
--------         ----         ----     --------     --------
0/271        16.00KiB     16.00KiB      1.00GiB         none
```

稍有不同的选项参数将显示所有配额组和设置的所有配额：

```
# btrfs qgroup show -re /
qgroupid         rfer         excl     max_rfer     max_excl
--------         ----         ----     --------     --------
0/5          16.00KiB     16.00KiB         none         none
0/256       272.04MiB    272.04MiB         none         none
0/258         6.08GiB      6.08GiB         none         none
0/265        16.00KiB     16.00KiB         none         none
0/271        16.00KiB     16.00KiB      1.00GiB         none
0/273        16.00KiB     16.00KiB         none         none
```

### 其他特性

这些例子提供了 Btrfs 特性的一些思考。运行 `btrfs --help` 查看命令的完整列表。还有许多其他值得注意的功能；例如，快照和发送/接收是两个值得学习的功能。

### 总结讨论

Btrfs 为向 Linux 提供高级文件系统特性集贡献了很多特性。这不是第一次；我知道 ZFS 在大约 15 年前引入了这种类型的文件系统，但是 Btrfs 是完全开源的，不受专利的限制。

如果你想探索这个文件系统，我建议从虚拟机或备用系统开始。

我想能够出现一些图形化的管理工具，为那些喜欢用图形工具的系统管理员提供便利。幸运的是，Btrfs 具有强大的开发活动，Fedora 33 项目决定将其设置为工作站上的默认值就证明了这一点。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/btrfs-linux

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_organize_letter.png?itok=GTtiiabr (Filing cabinet for organization)
[2]: https://en.wikipedia.org/wiki/Copy-on-write
[3]: https://en.wikipedia.org/wiki/Checksum
[4]: https://getfedora.org/en/workstation/download/
[5]: https://gparted.org/
[6]: https://opensource.com/sites/default/files/uploads/gparted_btrfs.png (GParted's view of Btrfs on Fedora 33 Workstation using GParted)
[7]: https://creativecommons.org/licenses/by-sa/4.0/
[8]: https://en.wikipedia.org/wiki/Live_CD
[9]: https://www.wildfly.org/
