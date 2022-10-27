[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14577-1.html)
[#]: subject: (Convert your filesystem to Btrfs)
[#]: via: (https://fedoramagazine.org/convert-your-filesystem-to-btrfs/)
[#]: author: (Gergely Gombos https://fedoramagazine.org/author/gombosg/)

如何将你的文件系统转换为 Btrfs
======

![][1]

### 引言

这篇概述文章将告诉你为何以及如何迁移你的当前分区到 Btrfs 文件系统。如果你对此感兴趣，请阅读这篇分步指南来完成。

从 Fedora 33 开始，新安装的 Fedora 操作系统默认文件系统为 Btrfs。我确信大部分用户现在已经听说了它的优势：写时复制、内置校验、灵活的压缩方式、简易的快照和回滚方式。它确实是一个现代化的文件系统，为桌面存储带来新的功能。

在升级到 Fedora 33 后，我想利用 Btrfs 的优势，但对我个人来说，我不想因为“只是为了改变文件系统”而去重装整个系统。我发现（只有）寥寥无几的具体如何做转换的教程，所以我决定在这里分享我的详细经验。

### 小心！

这样做你是在玩火。希望你阅读以下内容时不要感到惊讶：

> 在编辑分区和转换文件系统时，你的数据可能会被破坏和丢失。最终，你可能会得到一个不能启动的操作系统，并面临数据恢复的风险。你可能会无意删除你的分区，或者以其它方式破坏了你的操作系统。

这些转换过程即使对于生产系统来说也是安全的 —— 前提是你提前做好了计划，对关键数据做好了备份和回滚计划。作为一个 _可以执行超级权限的系统管理员_，你可以在没有限制、没有任何常规安全防护措施的情况下，做任何事情。

### 安全的方式：重装 Fedora

重装操作系统是转换文件系统到 Btrfs 的 “官方” 方式，推荐给大多数用户使用。因此，如果在这个教程中有那么一点不确定，就选择这种方式。步骤大致如下：

  1. 备份你的主文件夹和你系统中可能会用到的任何数据，比如 `/etc`。（编者按：虚拟机也是这样）
  2. 将已安装的安装包以列表形式保存到到文件中。
  3. 重新安装 Fedora，删除你当前的分区，并选择新的 Btrfs 默认分区方案。
  4. 恢复主文件夹的内容，并使用软件包列表文件重装软件包。

对于详细的步骤和命令，请看一位社区用户在 [ask.fedoraproject.org][2] 站点的评论。如果正确完成，你将得到一个和之前一样的操作系统，使丢失数据的风险最小化。

### 转换的利弊

让我们快速澄清一下：这种文件系统转换有什么优势和劣势？

**优势：**

  * 当然，不需要重新安装！你的系统里的所有文件和之前一模一样。
  * 技术上来说，没有备份的情况下，就地进行是可能的。
  * 你会学到许多关于 Btrfs 的知识！
  * 如果所有都按计划进行，会是相当快的一个过程。

**劣势：**

  * 你必须熟悉终端环境和 shell 命令。
  * 你可能会丢失数据，参见上文。
  * 如果出了什么问题，你得自己解决。

**特别之处：**
  
  * 你需要大约 20% 的可用磁盘空间才能成功转换。但对于完整的备份和重装方式，你可能需要的空间更多。
  * 你可以在转换过程中自定义你分区的所有参数，但如果选择重装，你也可以从 Anaconda 自定义。

### LVM 怎么办？

在近期几次 Fedora 安装中，LVM 布局一直是默认的。如果你有一个带有多个分区（例如 `/` 和 `/home`）的 LVM 分区布局，你得以某种方式合并它们，来获得 Btrfs 所有性能。

如果选择这样做，你可以单独转换分区到 Btrfs 文件系统，同时保留卷组。然而，迁移到 Btrfs 文件系统的优势之一是摆脱 LVM 分区布局强加的限制。你也可以利用 Btrfs 文件系统提供的收发功能在转换后来合并分区。

> 另见 《Fedora 杂志》： [利用 LVM 回收硬盘空间][3]、[从 Btrfs 快照中恢复文件][4] 以及 [在 Btrfs 和 LVM-ext4 两者之间做选择][5]。

### 了解 Btrfs

建议阅读以下内容对 Btrfs 文件系统是什么有一个基础的了解。如果你没有把握，只有选择重装 Fedora 这种安全的方式。

必须了解的：

  * [Fedora Magazine：Btrfs 来到 Fedora 33][6]
  * [Btrfs 系统管理指南][7], _尤其是_ 关于子卷和 flat 子卷布局。
  * [btrfs-convert 指南][8]

有用的资源：

  * [man 8 btrfs][9] – 命令行界面
  * [man 5 btrfs][10] – 挂载参数
  * [man btrfs-convert][11] – 要用到的转换工具
  * [man btrfs-subvolume][12] – 管理子卷

### 转换步骤

#### 创建一个实时镜像

由于不能转换已挂载的文件系统，我们将通过 Fedora <ruby>实时镜像<rt>Live Image</rt></ruby>进行。安装 [Fedora 镜像写入工具][13]，然后 “烧录” Fedora 33 到你的 U 盘中来创建实时镜像。

#### 释放磁盘空间

`btrfs-convert` 会在分区的剩余空间重新创建文件系统的元数据，同时保持所有已有的 ext4 文件系统数据还在它当前的位置上。 

不幸的是，所需的剩余空间的大小无法提前知道：如果没有足够的空间，转换将会失败（但不会破坏数据）。这里有一些释放空间有用的方法：

  * 利用 `baobab` 来识别大容量的文件和文件夹，然后移除。如果可能的话，不要手动删除主文件夹以外的文件。
  * 清理旧的系统日志：`journalctl –vacuum-size=100M`。
  * 如果你正使用 Docker，请小心地使用类似 `docker volume prune`、`docker image prune -a` 这样的工具。
  * 清理 GNOME Boxes 之类的虚拟机内不用的镜像。
  * 清理不用的软件包和 Flatpak 包：`dnf autoremove`、`flatpak remove –unused`。
  * 清理软件包缓存：`pkcon refresh force -c -1`、`dnf clean all`。
  * 如果你有把握，你可以谨慎的清理 `~/.cache` 文件夹。

#### 转换到 Btrfs

备份你所有有价值的数据，确保你的系统已完全更新，然后重启到实时镜像。运行 `gnome-disks` 工具找到你所拥有的设备的路径，比如 `/dev/sda1`（如果你在使用 LVM，它可能看起来有所不同）。检查文件系统然后执行转换：（编者按：以下命令使用 root 用户运行，谨慎使用！）

```
$ sudo su -
# fsck.ext4 -fyv /dev/sdXX （请替换为你的具体的设备路径）
# man btrfs-convert （阅读它）
# btrfs-convert /dev/sdXX （请替换为你的具体的设备路径）
```

这将会花十几分钟甚至几个小时，依据分区的大小和是机械硬盘还是固态硬盘。如果你看到错误，你可能需要更多剩余空间。作为最后的手段，你可以尝试 `btrfs-convert -n`。

#### 怎样回滚？

如果因为某些原因转换失败，你的分区将保持在 ext4 文件系统或者它之前的状态。如果你想在成功转换之后回滚，简单如下：

```
# btrfs-convert -r /dev/sdXX
```

> **警告！** 如果你做了以下这些事情之一，你将永久失去回滚的功能：碎片整理、均衡或者删除 `ext2_saved` 子卷。

由于 Btrfs 文件系统的写时复制特性，你可以安全的复制/移动甚至删除文件、创建子卷，因为 `ext2_saved` 会保持引用旧数据。

#### 挂载和检查

现在这个分区应该已经有了 Btrfs 文件系统。挂载它然后查看你的文件……和子卷！

```
# mount /dev/sdXX /mnt （请替换为你的具体的设备路径）
# man btrfs-subvolume （阅读它）
# btrfs subvolume list / （使用 -t 以表格方式查看）
```

因为你已经阅读了 [相关的手册页][14]，你应该知道创建子卷快照是安全的，并且有  `ext2-saved` 子卷作为你之前数据的简易备份。

> 是时候阅读 [Btrfs 系统管理指南][7]了，这样你就不会把常规文件夹和子卷混淆了。

#### 创建子卷

我们希望实现一个“扁平”子卷布局，这和 Anaconda 默认创建的布局相同：

```
toplevel （卷根目录，不能被默认挂载）
  +-- root （子卷根目录，被挂载到 /）
  +-- home （子卷根目录，被挂载到 /home）
```

你可以跳过这个步骤，或者使用一个不同的布局。这种特殊结构的优势是你可以轻松的创建 `/home` 的快照，并且对每个子卷使用不同的压缩和挂载参数。

```
# cd /mnt
# btrfs subvolume snapshot ./ ./root2
# btrfs subvolume create home2
# cp -a home/* home2/
```

这里我们已经创建了两个子卷。`root2` 是一个完整的分区快照，而 `home2` 开始是一个空子卷，然后我们往里复制内容。（这个 `cp` 命令不会重复数据，所以会很快。）

  * 在 `/mnt` 目录（顶层子卷），删除除了 `root2`、`home2` 和 `ext2_saved` 之外的所有内容。
  * 重命名 `root2` 和 `home2` 子卷为 `root` 和 `home`。
  * 在 `root` 子卷里，清空 `home` 目录，以便之后我们能够挂载 `home` 子卷。

如果都做对了，那就很简单了！

#### 修改 fstab 分区表

为了重启之后挂载新卷，必须要修改 `fstab`，用新的行来代替旧的 ext4 文件系统挂载行。

你可以使用 `blkid` 命令来找到你的分区的 UUID。

```
UUID=xx / btrfs subvol=root 0 0 （请替换为你的具体 UUID）
UUID=xx /home btrfs subvol=home 0 0 （请替换为你的具体 UUID）
```

（注意如果指向的是同一个分区，那么这两个 UUID 是相同的。）

这些都是新安装的 Fedora 33 的默认值。在 `fstab` 中，你也可以选择自定义压缩和添加类似 `noatime` 这样的参数。

> 可以查看 [关于压缩参数的维基页面][15] 和 [man 5 btrfs][10] 了解所有相关的参数。

#### chroot 到系统

如果你曾经做过系统恢复，我想你肯定知道这些命令。这里，我们将得到一个 _基本上_ 在你系统里的 shell 提示符，可以访问网络。

首先，我们必须重新挂载 `root` 子卷到 `/mnt` 目录，然后挂载 `/boot` 和 `/boot/efi` 分区（它们可能有所不同，这取决于你的文件系统布局）：

```
# umount /mnt
# mount -o subvol=root /dev/sdXX /mnt （请替换为你的具体的设备路径）
# mount /dev/sdXX /mnt/boot （请替换为你的具体的设备路径）
# mount /dev/sdXX /mnt/boot/efi （请替换为你的具体的设备路径）
```

然后我们继续挂载系统设备：

```
# mount -t proc /proc /mnt/proc
# mount --rbind /dev /mnt/dev
# mount --make-rslave /mnt/dev
# mount --rbind /sys /mnt/sys
# mount --make-rslave /mnt/sys
# cp /mnt/etc/resolv.conf /mnt/etc/resolv.conf.chroot
# cp -L /etc/resolv.conf /mnt/etc
# chroot /mnt /bin/bash
$ ping www.fedoraproject.org
```

#### 重装 GRUB 及内核

最容易的方法就是重装 GRUB 和 内核，因为它完成了所有必要的配置 —— 现在我们可以访问网络了。所以，在 chroot 环境内部：

```
# mount /boot/efi
# dnf reinstall grub2-efi shim
# grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
# dnf reinstall kernel-core
...或者干脆重新生成 initramfs：
# dracut --kver $(uname -r) --force
```

如果你是支持 UEFI 的系统，这里是适用的。如果你是 BIOS 的系统，请查看下面的文档。重启之前，让我们查看是否一切正常：

```
# cat /boot/grub2/grubenv
# cat /boot/efi/EFI/fedora/grub.cfg
# lsinitrd /boot/initramfs-$(uname -r).img | grep btrfs
```

你应该在 `grubenv` 和 `grub.cfg` 有正确的分区 UUID 或指向（`grubenv` 可能没有更新，如有必要可以编辑它），并在 `grub.cfg` 中看到 `insmod btrfs` 配置和在 initramfs 镜像中有 btrfs 模块。

> 参见: Fedora 系统管理指南中的 [重装 GRUB 2][16] 和 [验证初始 RAM 磁盘镜像][17] 。

#### 重启

现在系统能够正常启动。如果不能，别慌，回到实时镜像修复这个问题。最坏的情况下，你可以从那里重装 Fedora 。

#### 首次启动之后

检查你的新 Btrfs 文件系统一切都正常。如果你觉得没问题，你需要回收旧的 ext4 快照使用的空间，进行碎片整理和平衡子卷。后两者可能要花一些时间，并且相当耗费资源。

对此你必须这样挂载顶级子卷：

```
# mount /dev/sdXX -o subvol=/ /mnt/someFolder
# btrfs subvolume delete /mnt/someFolder/ext2_saved
```

然后，当机器有空闲时间时，运行这些命令：

```
# btrfs filesystem defrag -v -r -f /
# btrfs filesystem defrag -v -r -f /home
# btrfs balance start -m /
```

最后，有一个 “非写时复制” [属性][18]，对于新系统，这个属性是为虚拟机镜像文件夹自动设置的。如果你使用虚拟机的话，可以设置它：

```
# chattr +C /var/lib/libvirt/images
```

```
$ chattr +C ~/.local/share/gnome-boxes/images
```

这个属性只会对在这些文件夹里的新文件生效。复制镜像并删除原镜像，你可以通过 `lsattr` 确认结果。

### 总结

我真心希望你发现这个教程是有用的，并且能够对是否在你的系统上转换为 Btrfs 做出谨慎而明智的决定。祝你成功转换！

欢迎在评论中分享你的经验，或者遇到更深层次的问题，请在 [ask.fedoraproject.org][19] 提问。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/convert-your-filesystem-to-btrfs/

作者：[Gergely Gombos][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwllife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gombosg/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/08/butterfs-816x346.png
[2]: https://ask.fedoraproject.org/t/conversion-of-an-existing-ext4-fedora-32-system-completely-to-btrfs/9446/6?u=gombosghttps://ask.fedoraproject.org/t/conversion-of-an-existing-ext4-fedora-32-system-completely-to-btrfs/9446/6?u=gombosg
[3]: https://fedoramagazine.org/reclaim-hard-drive-space-with-lvm/
[4]: https://fedoramagazine.org/recover-your-files-from-btrfs-snapshots/
[5]: https://fedoramagazine.org/choose-between-btrfs-and-lvm-ext4/
[6]: https://fedoramagazine.org/btrfs-coming-to-fedora-33/
[7]: https://btrfs.wiki.kernel.org/index.php/SysadminGuide
[8]: https://btrfs.wiki.kernel.org/index.php/Conversion_from_Ext3
[9]: https://www.mankier.com/8/btrfs
[10]: https://www.mankier.com/5/btrfs
[11]: https://www.mankier.com/8/btrfs-convert
[12]: https://www.mankier.com/8/btrfs-subvolume
[13]: https://getfedora.org/en/workstation/download/
[14]: https://www.mankier.com/8/btrfs-subvolume#Subvolume_and_Snapshot
[15]: https://btrfs.wiki.kernel.org/index.php/Compression
[16]: https://docs.fedoraproject.org/en-US/fedora/f33/system-administrators-guide/kernel-module-driver-configuration/Working_with_the_GRUB_2_Boot_Loader/#sec-Reinstalling_GRUB_2
[17]: https://docs.fedoraproject.org/en-US/fedora/f33/system-administrators-guide/kernel-module-driver-configuration/Manually_Upgrading_the_Kernel/#sec-Verifying_the_Initial_RAM_Disk_Image
[18]: https://www.mankier.com/1/chattr#Attributes-C
[19]: https://ask.fedoraproject.org/
