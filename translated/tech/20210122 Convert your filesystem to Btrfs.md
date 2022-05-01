[#]: collector: (lujun9972)
[#]: translator: (hwlife)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Convert your filesystem to Btrfs)
[#]: via: (https://fedoramagazine.org/convert-your-filesystem-to-btrfs/)
[#]: author: (Gergely Gombos https://fedoramagazine.org/author/gombosg/)

将你的文件系统转换为 Btrfs
======

![][1]

### 引言

这篇文章是关于为什么，怎样来迁移你的当前分区到 Btrfs 文件系统的一个概述。如果你对自己做这件事感到好奇，请通过一步步阅读跟着这个操作这是怎样来完成的。

启动 Fedora 33，新安装的操作系统默认文件系统为 Btrfs。我非常确定许多用户已经听说过它的优势：写时复制，内置校验，灵活的压缩参数，简易的快照和回滚方式。它真的时一个现代化的文件系统，为桌面存储带来新的功能。

更新到 Fedora 33，我想充分利用 Btrfs 的优势，但是对我个人来说不想因为 ‘只是文件系统变化’ 去重装整个系统。我发现关于怎样具体的去做 [没有] 多少教程，所以我决定在这里分享我的详细经验。

### 小心 !

这样做你是在玩火。希望你阅读一下内容不要感到惊讶：


> 在编辑分区和转换文件系统时，你的数据可能会被破坏和丢失。最终，你可能会得到一个不能启动的操作系统并面临数据恢复的风险。你可能会无意删除你的分区或者伤害到你的操作系统。

这些转换过程即使对于生产系统来说也是安全的 - 前提是你提前做好计划，已经对关键数据做好备份和回滚计划。作为一个_系统管理员_，在没有任何常规安全警告保护你的情况下，你可以无限制的做任何事情。


### 安全的方式： 重装 Fedora

重装操作系统是转换文件系统到 Btrfs 的 ‘官方’ 操作，简易大多数用户使用。因此，如果在这个教程中对于一些点不那么确定，就选择这种方式。步骤大致如下：


  1. 备份你的 home 文件夹和你系统中可能会用到的任何数据，比如 _/etc_。[编者按：虚拟机也是这样]
  2. 已安装的安装包已列表形式保存到到文件中。
  3. 通过移除当前分区并选择有 Btrfs 文件系统的新默认分区来重新安装系统。
  4. 恢复 home 文件夹的内容并使用软件包列表文件重装软件包。


对于详细的步骤和命令，查看一个社区用户在  [ask.fedoraproject.org][2] 站点的评论。如果你做的好，你将得到一个和之前一样的操作系统，是丢失数据的风险最小化。

### 转换的利弊

让我们快速搞清楚：这个文件系统转换有什么优势和劣势？

##### **优势**

  * 当然，不必要重新安装！系统里的所有文件和之前一模一样。
  * 技术上来说，没有备份的情况下，就地进行是可能的。
  * 你会学到许多关于 Btrfs 的知识！
  * 如果所有都按计划进行，会是相当快的一个过程。



##### 劣势

  * 你必须熟悉终端环境和 shell 命令。
  * 你可能会丢失数据，参见以上。
  * 如果出了什么问题，你得自己解决。



##### 危险

  
  * 你将需要大约磁盘容量 20% 的剩余空间来成功转换。但是因为完全备份和重装环境，可能需要的空间更多。
  * 你可以在转换过程中自定义你分区的所有参数，但如果选择重装，你也可以从 Anaconda 自定义。



### **<ruby>LVM<rt>逻辑卷管理<rt></ruby> 怎么办?**

在近期几次 Fedora 安装中，LVM 布局是默认出现的。如果你有多个分区的 LVM 分区布局，例如 _/_ 和 _/home_，你可以以某种方式合并他们来获得 Btrfs 所有性能。

如果选择这样做，你可以单独转换分区到 Btrfs 文件系统，同时保留卷组。然而，迁移到 Btrfs 文件系统的优势之一是摆脱 LVM 分区布局强加的限制。你也可以利用  _btrfs_ 文件系统提供的收发功能在转换后来合并分区。

另见 Fedora 杂志： [利用LVM回收硬盘空间][3], [从 Btrfs 快照中恢复文件][4] 以及 [在 Btrfs 和 LVM-ext4 两者之间做选择][5].

### 了解 Btrfs

建议阅读以下内容对 Btrfs 文件系统是什么有一个基础的了解。如果你不确信，只有选择重装 Fedora 这种安全的方式。


##### 必须了解的

  * [Fedora 杂志：Btrfs 来到 Fedora 33][6]
  * [Btrfs 系统管理 指南][7], _尤其是_ 关于子卷和 flat 子卷布局。
  * [Btrfs-转换 指南][8]



##### 有用的资源

  * [_man 8 btrfs_][9] – 命令行界面
  * _[man 5 btrfs][10]_ – 挂载参数
  * _[man btrfs-convert][11]_ – 要用到的转换工具
  * _[man btrfs-subvolume][12]_ – 管理子卷



### 转换步骤

##### 创建一个 live 镜像

由于不能转换挂载了的文件系统，我们将在 Fedora live 镜像进行。安装 [Fedora 镜像写入工具][13] 然后 ‘烧录’ Fedora 33 到你的 U 盘中。

##### 释放磁盘空间

_btrfs-转换_ 将会在分区的剩余空间重建文件系统的元数据，同时保持所有存在的 _ext4_ 文件系统数据还在它当前的位置上。 

不幸的是，剩余空间的大小无法提前知道 - 如果没有足够的空间，转换将会失败 (不会伤害数据) 。这里有一些释放空间有用的方法：


  * 利用 _baobab_ 来识别大容量文件和文件夹然后移除。如果可能的话，不要手动删除 home 文件夹意外的文件。
  * 清理旧的系统日志： _journalctl –vacuum-size=100M_
  * 如果你正使用 Docker，小心的使用类似 _docker volume prune, docker image prune -a_ 这样的工具。
  * 清理内部闲置的虚拟机镜像，比如 GNOME Boxes 。
  * 清理闲置的软件包和 flatpaks 包： _dnf autoremove_, _flatpak remove –unused_
  * 清理软件包缓存： _pkcon refresh force -c -1_, _dnf clean all_
  * 如果你足够自信，你可以谨慎的清理 _~/.cache_ 文件夹。



##### 转换到 Btrfs

备份你所有有价值的数据，确保你的系统是完全更新了的，然后重启到 live 镜像。运行 _gnome-disks_ 工具找到你所拥有的设备，比如 _/dev/sda1_ (如果你在使用 LVM ，它可能看起来有所不同)。检查文件系统然后执行转换： [编者按：以下命令使用 root 用户运行，谨慎使用！]

```
$ sudo su -
# fsck.ext4 -fyv /dev/sdXX
# man btrfs-convert (read it!)
# btrfs-convert /dev/sdXX
```

这将会花十几分钟甚至几个小时，依据分区的大小和你是机械硬盘还是固态硬盘。如果你看到错误，你可能需要更多剩余空间。作为最后的手段，你可以尝试 _btrfs-convert_ _-n_ 。

##### 怎样回滚？

如果因为某些原因转换失败，你的分区会保留  _ext4_ 文件系统或者它之前的内容。成功转换之后如果你想回滚，就这么简单

```
# btrfs-convert -r /dev/sdXX
```

**警告!** 如果你做了这些中的一个，你将永久失去回滚的功能：碎片整理，均衡或者删除 _ext2_保留的_ 子卷。

由于 Btrfs 文件系统写时复制的天然属性，你可以安全的复制，移动甚至删除文件，创建子卷，因为 _保留的_ext2_ 能保留旧数据。

##### 挂载和检查

现在这个分区已经有了  _btrfs_ 文件系统。挂载它然后查看你的文件...和子卷！

```
# mount /dev/sdXX /mnt
# man btrfs-subvolume (read it!)
# btrfs subvolume list / (-t for a table view)
```

因为你已经阅读了 [相关的手册页][14]，你应该知道创建子卷快照是安全的，并且有 _保留的_ext2_ 子卷作为你之前数据的简易备份。

是时候阅读 [Btrfs 系统管理指南][7]了，这样你就不会吧常规文件和子卷混淆了。

##### 创建子卷

我们将完成一个 ‘flat’ 子卷布局，和 Anaconda 默认创建的是相同的：

```
toplevel (volume root directory, not to be mounted by default)
  +-- root (subvolume root directory, to be mounted at /)
  +-- home (subvolume root directory, to be mounted at /home)
```

你可以跳过这个步骤，或者决定使用一个不同的布局。这个特定结构的优势是你可以轻松的创建 _/home_ 快照，并且对每个子卷使用不同的压缩和挂载参数。

```
# cd /mnt
# btrfs subvolume snapshot ./ ./root2
# btrfs subvolume create home2
# cp -a home/* home2/
```


这里我们已经创建了两个子卷。 _root2_ 是分区的完整快照，而 _home2_ 开始作为一个空子卷然后我们往里复制内容。(这个 _cp_ 命令不会查重数据，所以会很快。)

  * 在 _/mnt_ 目录(顶层子卷)，除了_root2_, _home2_ 和 _保留的_ext2_ ，删除所有文件。
  * 重命名 _root2_ 和 _home2_ 子卷为 _root_ 和 _home_。
  * 在 _root_ 子卷里, 空出 _home_ 目录, 以至于之后我们能够挂载 _home_ 子卷。



都做对了，那就很简单了!

##### 修改 fstab 分区表

为了重启之后挂载新卷， _fstab_ 必须要修改，用新的来代替旧的  _ext4_  文件系统挂载行。

你可以使用 _blkid_ 命令来了解你的分区的 UUID。

```
UUID=xx / btrfs subvol=root 0 0
UUID=xx /home btrfs subvol=home 0 0
```

(注意如果引用的是相同的两个分区，那么这两个 UUID 是相同的。)

对于新的 Fedora 33 安装来说这些都是缺省的。在_fstab_ 你也可以选择自定义压缩和添加类似 _noatime_ 这样的参数。

查看 [关于压缩的维基页面][15] 和 _[man 5 btrfs][10]_ 了解所有相关的参数。

##### 从镜像 Chroot 到系统

如果你曾经做过系统恢复，我确信你知道这些命令。这里，我们将得到一个 shell 提示符，在你的带有网络访问的系统 _里面_ ，这是必要的。

首先，我们必须重新挂载 _root_ 子卷到 _/mnt_ 目录，然后挂载 _/boot_ 和 _/boot/efi_ 分区 (依赖于你的文件系统布局，它们可能有所不同)：

```
# umount /mnt
# mount -o subvol=root /dev/sdXX /mnt
# mount /dev/sdXX /mnt/boot
# mount /dev/sdXX /mnt/boot/efi
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

##### 重装 GRUB &amp; 内核

最容易的方法就是重装 GRUB 和 内核，因为它完成了所有必要的配置 - 现在我们可以网络访问了 。所以，在 chroot 内部：

```
# mount /boot/efi
# dnf reinstall grub2-efi shim
# grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg
# dnf reinstall kernel-core
...or just renegenerating initramfs:
# dracut --kver $(uname -r) --force
```

如果你是支持 UEFI 功能的系统，这里是适用的。如果你是 BIOS 功能的系统，查看一下文档。重启之前，让我们查看是否一切就绪：

```
# cat /boot/grub2/grubenv
# cat /boot/efi/EFI/fedora/grub.cfg
# lsinitrd /boot/initramfs-$(uname -r).img | grep btrfs
```

你应该有合适的分区 UUIDs 或者在 _grubenv_ 和 _grub.cfg_ 查阅 (grubenv 可能没有更新, 如有必要可以编辑它) 并且在 initramfs 镜像中的 _grub.cfg_ 和 _btrfs_ 模块里查看 _insmod btrfs_ 。

另见: [重装 GRUB 2][16] 和 在 Fedora 系统管理指南针中 [验证初始化 RAM 磁盘映像][17] 。

##### 重启

现在系统能够正常启动。如果不能，别慌，回到 live 镜像修理问题。最次了，你可以从那里重装 Fedora 。
Now your system should boot properly. If not, don’t panic, go back to the live image and fix the issue. In the worst case, you can just reinstall Fedora from right there.

##### 首次启动之后

检查你的新 Btrfs 文件系统一切都好。如果你乐意，你需要回收旧的 _ext4_ 快照用过的空间，碎片和平衡子卷。后两者可能要花一些时间，并且资源会很紧张。

你必须这样挂载顶级子卷：

```
# mount /dev/sdXX -o subvol=/ /mnt/someFolder
# btrfs subvolume delete /mnt/someFolder/ext2_saved
```

然后，当机器有空闲时间时，运行这些：

```
# btrfs filesystem defrag -v -r -f /
# btrfs filesystem defrag -v -r -f /home
# btrfs balance start -m /
```

最后, 新安装的系统会将 “写时复制” [属性][18] 为虚拟机镜像文件夹自动设置。如果你使用虚拟机的话，可以设置它：

```
#  chattr +C /var/lib/libvirt/images
```



```
$  chattr +C ~/.local/share/gnome-boxes/images
```


这些属性只会对在这些文件夹里的新文件生效。有重复镜像删除旧的镜像。你可以通过 _lsattr_ 确认结果。


### 结尾

我真心希望你发现这个教程是有用的，并且能够并就是否在您的系统上转换为Btrfs做出谨慎而明智的决定。祝你成功转换！

在评论中分享你的经验，或者遇到更加深刻的问题，请访问  [ask.fedoraproject.org][19] 。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/convert-your-filesystem-to-btrfs/

作者：[Gergely Gombos][a]
选题：[lujun9972][b]
译者：[hwlife](https://github.com/hwllife)
校对：[校对者ID](https://github.com/校对者ID)

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
