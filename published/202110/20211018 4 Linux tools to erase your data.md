[#]: subject: "4 Linux tools to erase your data"
[#]: via: "https://opensource.com/article/21/10/linux-tools-erase-data"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13913-1.html"

4 个用来擦除数据的 Linux 工具
======

> 用这些开源工具从你的硬盘驱动器中擦除数据。

![](https://img.linux.net.cn/data/attachment/album/202110/23/113918sdojp6sj0odgis16.jpg)

保持数据安全的最好方法之一是只向加密的硬盘驱动器写入数据。在一个标准的硬盘上，只要把硬盘挂载就可以查看数据，就像 U 盘一样，甚至可以用 [Scalpel][2] 和 [Testdisk][3] 等工具显示和恢复已删除的数据。但是在一个加密的驱动器上，如果没有解密密钥（通常是你在挂载驱动器时输入的密码），数据是无法被读取的。

加密可以在你安装操作系统时建立，有些操作系统甚至可以在安装后的任何时候激活加密功能。

但是，当你卖掉一台电脑或更换一个一开始就没有被加密的驱动器时，你该怎么办呢？

与从一开始就加密你的数据相比，最好的办法是在你用完硬盘后删除数据。

### 负责任的看管者

我经常被要求帮助客户升级一台旧电脑。无一例外，他们更愿意帮助我回收它们，使它们能被别人使用。我很乐意翻新这些旧电脑，用较新的固态驱动器来改装它们，极大地提高性能。

然而，把一个旧驱动器扔进垃圾桶并不是一个好主意。它需要被擦除，然后被妥善处理。我没有把硬盘留在原来的电脑里，而是把它们取出来，放在一个硬盘盒里，然后把它们连接到我的 Linux 电脑上。有几个 Linux 工具可以很容易地完成这个任务。其中一个是 **Gnu Shred**。

### GNU Shred

```
$ sudo shred -vfz /dev/sdX
```

Shred 有许多选项：

  * `-n` - 覆盖的次数。默认是三次。
  * `-u` - 覆盖并删除。
  * `-s` - 要粉碎的字节数。
  * `-v` - 显示扩展信息。
  * `-f` - 必要时强制改变权限以允许写入。
  * `-z` - 最后用 0 覆盖来隐藏粉碎。

使用 `shred --help` 获取更多信息

### ShredOS

ShredOS 是一个<ruby>即用<rt>Live</rt></ruby> Linux 发行版，它的唯一目的是清除驱动器的全部内容。它是在一个名为 DBAN 的类似发行版停止维护后开发的。它使用 `nwipe` 应用，它是 DBAN 的 `dwipe` 的一个分叉。你可以通过下载 32 位或 64 位镜像，并在 Linux 和 macOS 上使用 `dd` 命令将其写入驱动器来制作一个可启动的 USB 驱动器：

```
$ sudo dd if=shredos.img of=/dev/sdX bs=4M status=progress
```

另外，你可以在 Linux、macOS 和 Windows 上使用 [Etcher][4] 工具烧录。

### dd 命令

清除驱动器的一个常见方法是使用 Linux 的 `dd` 命令。几乎所有的 Linux 安装都安装了 `dd` 工具。确保该驱动器没有被挂载。

```
$ sudo umount /dev/sdXY -l
```

如果你想在整个目标磁盘上写零，执行以下命令。这可能需要一个整个通宵。

```
$ sudo dd if=/dev/urandom of=/dev/sdX bs=10M
```

**警告**：请确保你知道你在系统中的位置，并以正确的驱动器为目标，这样你就不会意外地删除自己的数据。

### Nvme-cli

如果你的计算机包含一个较新的 NVMe 驱动器，你可以安装 [nvme-cli][5] 程序，并使用 `sanitize` 选项来清除你的驱动器。

`nvme sanitize help` 命令提供了选项列表：

  * `--no-dealloc`、`-d` - 净化后不解除分配。
  * `--oipbp`、`-i` - 每次覆写后反转模式。
  * `--owpass=`、`-n` - 覆写次数。
  * `--ause`、`-u` - 允许无限制净化退出。
  * `--sanact=`、`-a` - 净化动作。
  * `--ovrpat=`、`-p` - 覆写模式。

下面是我使用的命令：

```
$ sudo nvme sanitize /dev/nvme0nX
```

这里的警告与格式化过程相同：首先备份重要的数据，因为这个命令会擦除这些数据！

### 信息管理

你保存在计算机上的信息是很重要的。它属于你，也属于其他任何人。当你卖掉一台电脑或处理一个硬盘时，确保你已经用这些很棒的工具之一清除了你的数据。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-tools-erase-data

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT (Tools in a cloud)
[2]: https://www.redhat.com/sysadmin/find-lost-files-scalpel
[3]: https://www.redhat.com/sysadmin/recover-partition-files-testdisk
[4]: https://opensource.com/article/18/7/getting-started-etcherio
[5]: https://opensource.com/article/21/9/nvme-cli
