使用 LVM 升级 Fedora
======

![](https://fedoramagazine.org/wp-content/uploads/2018/06/lvm-upgrade-816x345.jpg)

大多数用户发现使用标准流程升级[从一个 Fedora 版本升级到下一个][1]很简单。但是，Fedora 升级也不可避免地会遇到许多特殊情况。本文介绍了使用 DNF 和逻辑卷管理（LVM）进行升级的一种方法，以便在出现问题时保留可引导备份。这个例子是将 Fedora 26 系统升级到 Fedora 28。

此处展示的过程比标准升级过程更复杂。在使用此过程之前，你应该充分掌握 LVM 的工作原理。如果没有适当的技能和细心，你可能会丢失数据和/或被迫重新安装系统！如果你不知道自己在做什么，那么**强烈建议**你坚持只使用得到支持的升级方法。

### 准备系统

在开始之前，请确保你的现有系统已完全更新。

```
$ sudo dnf update
$ sudo systemctl reboot # 或采用 GUI 方式
```

检查你的根文件系统是否是通过 LVM 挂载的。

```
$ df /
Filesystem              1K-blocks   Used        Available   Use%    Mounted on
/dev/mapper/vg_sdg-f26  20511312    14879816    4566536     77%     /

$ sudo lvs
LV        VG            Attr        LSize Pool Origin Data% Meta% Move Log Cpy%Sync Convert
f22       vg_sdg        -wi-ao----  15.00g
f24_64    vg_sdg        -wi-ao----  20.00g
f26       vg_sdg        -wi-ao----  20.00g
home      vg_sdg        -wi-ao---- 100.00g
mockcache vg_sdg        -wi-ao----  10.00g
swap      vg_sdg        -wi-ao----   4.00g
test      vg_sdg        -wi-a-----   1.00g
vg_vm     vg_sdg        -wi-ao----  20.00g
```

如果你在安装 Fedora 时使用了默认值，你可能会发现根文件系统挂载在名为 `root` 的逻辑卷（LV）上。卷组（VG）的名称可能会有所不同。看看根卷的总大小。在该示例中，根文件系统名为 `f26`，大小为 `20G`。

接下来，确保 LVM 中有足够的可用空间。

```
$ sudo vgs
VG      #PV #LV #SN Attr    VSize   VFree
vg_sdg  1   8   0   wz--n-  232.39g 42.39g
```

该系统有足够的可用空间，可以为升级后的 Fedora 28 的根卷分配 20G 的逻辑卷。如果你使用的是默认安装，则你的 LVM 中将没有可用空间。对 LVM 的一般性管理超出了本文的范围，但这里有一些情形下可能采取的方法：

1、`/home` 在自己的逻辑卷，而且 `/home` 中有大量空闲空间。

你可以从图形界面中注销并切换到文本控制台，以 `root` 用户身份登录。然后你可以卸载 `/home`，并使用 `lvreduce -r` 调整大小并重新分配 `/home` 逻辑卷。你也可以从<ruby>现场镜像<rt>Live image</rt></ruby>启动（以便不使用 `/home`）并使用 gparted GUI 实用程序进行分区调整。

2、大多数 LVM 空间被分配给根卷，该文件系统中有大量可用空间。

你可以从现场镜像启动并使用 gparted GUI 实用程序来减少根卷的大小。此时也可以考虑将 `/home` 移动到另外的文件系统，但这超出了本文的范围。

3、大多数文件系统已满，但你有个已经不再需要逻辑卷。

你可以删除不需要的逻辑卷，释放卷组中的空间以进行此操作。

### 创建备份

首先，为升级后的系统分配新的逻辑卷。确保为系统的卷组（VG）使用正确的名称。在这个例子中它是 `vg_sdg`。

```
$ sudo lvcreate -L20G -n f28 vg_sdg
Logical volume "f28" created.
```

接下来，创建当前根文件系统的快照。此示例创建名为 `f26_s` 的快照卷。

```
$ sync
$ sudo lvcreate -s -L1G -n f26_s vg_sdg/f26
Using default stripesize 64.00 KiB.
Logical volume "f26_s" created.
```

现在可以将快照复制到新逻辑卷。当你替换自己的卷名时，**请确保目标正确**。如果不小心，就会不可撤销地删除了数据。此外，请确保你从根卷的快照复制，**而不是**从你的现在的根卷。

```
$ sudo dd if=/dev/vg_sdg/f26_s of=/dev/vg_sdg/f28 bs=256k
81920+0 records in
81920+0 records out
21474836480 bytes (21 GB, 20 GiB) copied, 149.179 s, 144 MB/s
```

给新文件系统一个唯一的 UUID。这不是绝对必要的，但 UUID 应该是唯一的，因此这避免了未来的混淆。以下是在 ext4 根文件系统上的方法：

```
$ sudo e2fsck -f /dev/vg_sdg/f28
$ sudo tune2fs -U random /dev/vg_sdg/f28
```

然后删除不再需要的快照卷：

```
$ sudo lvremove vg_sdg/f26_s
Do you really want to remove active logical volume vg_sdg/f26_s? [y/n]: y
Logical volume "f26_s" successfully removed
```

如果你单独挂载了 `/home`，你可能希望在此处制作 `/home` 的快照。有时，升级的应用程序会进行与旧版 Fedora 版本不兼容的更改。如果需要，编辑**旧**根文件系统上的 `/etc/fstab` 文件以在 `/home` 上挂载快照。请记住，当快照已满时，它将消失！另外，你可能还希望给 `/home` 做个正常备份。

### 配置以使用新的根

首先，安装新的逻辑卷并备份现有的 GRUB 设置：

```
$ sudo mkdir /mnt/f28
$ sudo mount /dev/vg_sdg/f28 /mnt/f28
$ sudo mkdir /mnt/f28/f26
$ cd /boot/grub2
$ sudo cp -p grub.cfg grub.cfg.old
```

编辑 `grub.conf` 并在第一个菜单项 `menuentry` 之前添加这些，除非你已经有了：

```
menuentry 'Old boot menu' {
  configfile /grub2/grub.cfg.old
}
```

编辑 `grub.conf` 并更改默认菜单项以激活并挂载新的根文件系统。改变这一行：

```
linux16 /vmlinuz-4.16.11-100.fc26.x86_64 root=/dev/mapper/vg_sdg-f26 ro rd.lvm.lv=vg_sdg/f26 rd.lvm.lv=vg_sdg/swap rhgb quiet LANG=en_US.UTF-8
```

如你看到的这样。请记住使用你系统上的正确的卷组和逻辑卷条目名称！

```
linux16 /vmlinuz-4.16.11-100.fc26.x86_64 root=/dev/mapper/vg_sdg-f28 ro rd.lvm.lv=vg_sdg/f28 rd.lvm.lv=vg_sdg/swap rhgb quiet LANG=en_US.UTF-8
```

编辑 `/mnt/f28/etc/default/grub` 并改变在启动时激活的默认的根卷：

```
GRUB_CMDLINE_LINUX="rd.lvm.lv=vg_sdg/f28 rd.lvm.lv=vg_sdg/swap rhgb quiet"
```

编辑 `/mnt/f28/etc/fstab`，将挂载的根文件系统从旧的逻辑卷：

```
/dev/mapper/vg_sdg-f26 / ext4 defaults 1 1
```

改为新的：

```
/dev/mapper/vg_sdg-f28 / ext4 defaults 1 1
```

然后，出于参考的用途，只读挂载旧的根卷：

```
/dev/mapper/vg_sdg-f26 /f26 ext4 ro,nodev,noexec 0 0
```

如果你的根文件系统是通过 UUID 挂载的，你需要改变这个方式。如果你的根文件系统是 ext4 你可以这样做：

```
$ sudo e2label /dev/vg_sdg/f28 F28
```

现在编辑 `/mnt/f28/etc/fstab` 使用该卷标。改变该根文件系统的挂载行，像这样：

```
LABEL=F28 / ext4 defaults 1 1
```

### 重启与升级

重新启动，你的系统将使用新的根文件系统。它仍然是 Fedora 26，但是是带有新的逻辑卷名称的副本，并可以进行 `dnf` 系统升级！如果出现任何问题，请使用旧引导菜单引导回到你的工作系统，此过程可避免触及旧系统。

```
$ sudo systemctl reboot # or GUI equivalent
...
$ df / /f26
Filesystem 1K-blocks Used Available Use% Mounted on
/dev/mapper/vg_sdg-f28 20511312 14903196 4543156 77% /
/dev/mapper/vg_sdg-f26 20511312 14866412 4579940 77% /f26
```

你可能希望验证使用旧的引导菜单确实可以让你回到挂载在旧的根文件系统上的根。

现在按照[此维基页面][2]中的说明进行操作。如果系统升级出现任何问题，你还会有一个可以重启回去的工作系统。

### 进一步的考虑

创建新的逻辑卷并将根卷的快照复制到其中的步骤可以使用通用脚本自动完成。它只需要新的逻辑卷的名称，因为现有根的大小和设备很容易确定。例如，可以输入以下命令：

```
$ sudo copyfs / f28
```

提供挂载点以进行复制可以更清楚地了解发生了什么，并且复制其他挂载点（例如 `/home`）可能很有用。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-lvm-upgrade-fedora/

作者：[Stuart D Gathman][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/sdgathman/
[1]:https://fedoramagazine.org/upgrading-fedora-27-fedora-28/
[2]:https://fedoraproject.org/wiki/DNF_system_upgrade
