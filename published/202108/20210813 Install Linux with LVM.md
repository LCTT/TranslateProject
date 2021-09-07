[#]: subject: "Install Linux with LVM"
[#]: via: "https://opensource.com/article/21/8/install-linux-mint-lvm"
[#]: author: "Kenneth Aaron https://opensource.com/users/flyingrhino"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13704-1.html"

在 LVM 上安装 Linux Mint
======

> 一个关于让 Linux Mint 20.2 与逻辑卷管理器（LVM）一起工作的教程。

![](https://img.linux.net.cn/data/attachment/album/202108/21/104418yg111cba52caalc5.jpg)

几周前，[Linux Mint][2] 的人员发布了他们的开源操作系统的 20.2 版本。Live ISO 中内置的安装程序非常好，只需要点击几下就可以安装操作系统。如果你想定制你的分区，你甚至有一个内置的分区软件。

安装程序重点关注在简单的安装上：定义你的分区并安装到这些分区。对于那些想要更灵活的设置的人来说，<ruby>[逻辑卷管理器][3]<rt>logical volume manager</rt></ruby>（LVM）是个不错的选择，你可以通过设置卷组（VG）并在其中定义你的逻辑卷（LV）。

LVM 是一个硬盘管理系统，允许你在多个物理驱动器上创建存储空间。换句话说，你可以把几个小驱动器“拴”在一起，这样你的操作系统就会把它们当作一个驱动器。除此之外，它还有实时调整大小、文件系统快照和更多的优点。这篇文章并不是关于 LVM 的教程（网上已经有很多 [这方面不错的信息][4]了）。相反，我的目标是贴合这篇文章的主题，只关注让 Linux Mint 20.2 与 LVM 一起工作。

作为一个桌面操作系统，其安装程序致力于简单化，在 LVM 上安装 Linux Mint 20.2 会略微复杂一些，但不会太复杂。如果你在安装程序中选择了 LVM，你会得到一个由 Linux Mint 开发者定义的设置，而且你在安装时无法控制各个卷。

然而，有一个解决方案：在临场 ISO 中，该方案只需要在终端中使用几个命令来设置 LVM，然后你可以继续使用常规安装程序来完成工作。

我安装了 Linux Mint 20.2 和 [XFCE 桌面][5]，但其他 Linux Mint 桌面的过程也类似。

### 分区驱动器

在 Linux Mint 临场 ISO 中，你可以通过终端和 GUI 工具访问 Linux 命令行工具。如果你需要做任何分区工作，你可以使用命令行 `fdisk` 或 `parted` 命令，或者 GUI 应用 `gparted`。我想让这些操作简单到任何人都能遵循，所以我会在可能的情况下使用 GUI 工具，在必要时使用命令行工具。

首先，为安装创建几个分区。

使用 `gparted`（从菜单中启动），完成以下工作：

首先，创建一个 512MB 的分区，类型为 FAT32（这是用来确保系统可启动）。512MB 对大多数人来说是富余的，你可以用 256MB 甚至更少，但在今天的大容量磁盘中，即使分配 512MB 也不是什么大问题。

![Creating a boot partition][6]

接下来，在磁盘的其余部分创建一个 `lvm2 pv` 类型（LVM 2 物理卷）的分区（这是你的 LVM 的位置）。

![Partition layout][7]

现在打开一个终端窗口，并将你的权限提升到 root：

```
$ sudo -s
# whoami
root
```

接下来，你必须找到你之前创建的 LVM 成员（那个大分区）。使用下列命令之一：`lsblk -f` 或 `pvs` 或 `pvscan`。

```
# pvs
PV      VG Fmt  [...]
/dev/sda2    lvm2 [...]
```

在我的例子中，该分区位于 `/dev/sda2`，但你应该用你的输出中得到的内容来替换它。

现在你知道了你的分区有哪些设备，你可以在那里创建一个 LVM 卷组（VG）：

```
# vgcreate vg /dev/sda2
```

你可以使用 `vgs` 或 `vgscan` 看到你创建的卷组的细节。

创建你想在安装时使用的逻辑卷（LV）。为了简单，我分别创建了 `root` 根分区（`/`）和 `swap` 交换分区，但是你可以根据需要创建更多的分区（例如，为 `/home` 创建一个单独的分区）。

```
# lvcreate -L 80G -n root vg
# lvcreate -L 16G -n swap vg
```

我的例子中的分区大小是任意的，是基于我可用的空间。使用对你的硬盘有意义的分区大小。

你可以用 `lvs` 或 `lvdisplay` 查看逻辑卷。

终端操作到这就结束了。

### 安装 Linux

现在从桌面上的图标启动安装程序：

  * 进入 “Installation type”，选择 “Something else”。
  * 编辑 512Mb 的分区并将其改为 `EFI`。
  * 编辑根逻辑卷，将其改为 `ext4`（或一个你选择的文件系统）。选择将其挂载为根目录（`/`），并选择将其格式化。
  * 编辑 `swap` 分区并将其设置为交换分区。
  * 继续正常的安装过程。Linux Mint 安装程序会将文件放在正确的位置并为你创建挂载点。

完成了。在你的 Linux Mint 安装中享受 LVM 的强大。

如果你需要调整分区大小或在系统上做任何高级工作，你会感谢选择 LVM。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/install-linux-mint-lvm

作者：[Kenneth Aaron][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/flyingrhino
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux_keyboard_desktop.png?itok=I2nGw78_ (Linux keys on the keyboard for a desktop computer)
[2]: https://linuxmint.com/
[3]: https://en.wikipedia.org/wiki/Logical_Volume_Manager_(Linux)
[4]: https://opensource.com/business/16/9/linux-users-guide-lvm
[5]: https://opensource.com/article/19/12/xfce-linux-desktop
[6]: https://opensource.com/sites/default/files/boot-part.png (Creating a boot partition)
[7]: https://opensource.com/sites/default/files/part-layout.png (Partition layout)
