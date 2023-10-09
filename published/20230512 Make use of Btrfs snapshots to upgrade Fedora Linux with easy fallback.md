[#]: subject: "Make use of Btrfs snapshots to upgrade Fedora Linux with easy fallback"
[#]: via: "https://fedoramagazine.org/make-use-of-btrfs-snapshots-to-upgrade-fedora-linux-with-easy-fallback/"
[#]: author: "Stuart D Gathman https://fedoramagazine.org/author/sdgathman/"
[#]: collector: "lujun9972"
[#]: translator: "ChatGPT"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16267-1.html"

使用 Btrfs 快照方便升级 Fedora Linux 且易于回退
======

![][0]

在 2018 年的一篇 [早前的文章][3] 中，我们介绍了在升级 Fedora Linux 前如何利用 LVM 复制根文件系统，以便在可能出现错误的情况下能有一个回退机制。然而如今，Fedora 工作站的默认安装已经是 Btrfs 文件系统了。现在，你可以利用 Btrfs 快照来更简便地创建一个可引导的回退系统。注意，本文不涉及会如何从其它文件系统转换或迁移到 Btrfs 上。

### 确认根文件系统是否为 Btrfs

本示例采用的是 Pinebook aarch64 笔记本电脑。在开始前，务必确认你的根文件系统是否采用 Btrfs。要明确，不是所有的定制版或者镜像文件默认都使用 Btrfs。

```
$ df -T
Filesystem     Type     1K-blocks     Used Available Use% Mounted on
devtmpfs       devtmpfs      4096        0      4096   0% /dev
tmpfs          tmpfs       998992        0    998992   0% /dev/shm
tmpfs          tmpfs       399600     6360    393240   2% /run
/dev/mmcblk2p3 btrfs     56929280 39796116  15058348  73% /
tmpfs          tmpfs       998996       24    998972   1% /tmp
tmpfs          tmpfs      5242880        0   5242880   0% /var/lib/mock
/dev/mmcblk2p3 btrfs     56929280 39796116  15058348  73% /f34
/dev/mmcblk2p3 btrfs     56929280 39796116  15058348  73% /home
/dev/mmcblk2p2 ext4        996780   551888    376080  60% /boot
/dev/mmcblk2p1 vfat        194348    31648    162700  17% /boot/efi
tmpfs          tmpfs       199796      100    199696   1% /run/user/1000
tmpfs          tmpfs       199796       84    199712   1% /run/user/0
```

### 列出当前的 Btrfs 子卷

以上的示例输出显示挂载在 “根”（`/`）的文件系统类型是 Btrfs。你会注意到，有三个挂载点显示了相同的备份设备以及 _已用_ 和 _可用_ 的块数。这是因为它们是从同一 Btrfs 文件系统挂载的不同部分（子卷）。比如，`/f34` 子卷是我去年创建的那个可引导快照。

默认的 Fedora Btrfs 安装会创建一个 Btrfs 文件系统，并在其上分别挂载两个子卷，`root` 和 `home` ，挂载路径分别为 `/` 和 `/home`。让我们一起来看看我还添加了哪些其它的子卷：

```
$ sudo btrfs subvol list /
ID 272 gen 110428 top level 5 path root
ID 273 gen 110426 top level 5 path home
ID 300 gen 109923 top level 5 path f34
ID 301 gen 95852 top level 5 path home.22Jul26
ID 302 gen 95854 top level 5 path f36.22Jul26
```

在这里，我们有一个来自最近一次系统升级的 `f34` 子卷，以及两个只读快照 `home` 和 `f36`。要添加和删除这些快照，最简单的方法就是挂载 Btrfs 的根目录。我会更新系统并创建当前 f36 `root` 子卷的新快照。如果你已经重命名了你的 `root` 子卷，我相信你知道该如何调整以下的示例以适应你的系统。

### 创建 Btrfs 的回退快照

```
$ sudo dnf update --refresh
...更新了很多部分（如果升级了内核还需要重启）
$ sudo mkdir -p /mnt/root
$ sudo mount /dev/mmcblk2p3 /mnt/root
$ cd /mnt/root
$ ls
f34  f36.22Jul26  home  home.22Jul26  root
$ sudo btrfs subvol snapshot root f36
Create a snapshot of 'root' in './f36'
```

因为 Btrfs 快照是以文件系统为基础的，所以并不需要在创建快照之前进行 “同步”，正如我在 LVM 中建议的。要从新的子卷引导为回退，你需要使用你喜欢的编辑器编辑 `/mnt/root/f36/etc/fstab`。如果你是刚入门的话，nano 就是一款十分简单的文本编辑器，功能基本够用。以下是我 `fstab` 文件中的一些行：

```
LABEL=PINE		/    btrfs   subvol=root,compress=zstd:1        1 1
UUID=e31667fb-5b6f-48d9-aa90-f2fd6aa5f005 /boot ext4    defaults        1 2
UUID=75DB-5832          /boot/efi               vfat    umask=0077,shortname=winnt 0 2
LABEL=PINE		/home    btrfs   subvol=home,compress=zstd:1    1 1
LABEL=SWAP swap			swap	discard=once	0 0
```

将 `subvol=root` 更改为 `subvol=f36`。这个改动是作用在快照中的文件，而并非你实际运行中的 `fstab` 文件。你可以通过 `diff /etc/fstab /mnt/root/f36/etc/fstab` 对比它们的区别。在我的情况下，我还使用了 `sudo btrfs subvol delete f34` 来删除我去年的 `f34` 快照。

### 测试 Btrfs 的回退快照

你现在可以进行回退的测试了。你可以使用 [grubby][4] 或在 `/boot/loader/entries` 中编辑一项来将 `subvol=root` 替换为 `subvol=f36`。然而，为了初学者的安全起见，我们更建议你在启动时编辑 GRUB 进行操作。你可以参考 [关于 GRUB 的这篇文章][5] 了解如何进入 GRUB 菜单。在你到达那里后，按下 `e` 键编辑默认的内核启动项。放心 —— 你所做的更改都只存在于内存中，如果你弄错了，重启电脑即可重新开始。就像编辑 `fstab` 文件一样，找到 `subvol=root` 并将其更改为 `subvol=f36`。然后，按 `F10` 或 `Ctrl + X` 来引导你修改过的项目。通过这些更改，你的系统应该能够引导进入你的新快照。你可以查看 `/etc/fstab` 确保你正在引导至正确的子卷，或键入 `mount | grep subvol` 查看此时在 `/` 上挂载的子卷。

### 进行 Fedora Linux 的系统升级

如果你的回退功能没问题，重启并返回你的正常根文件系统（并像上面所述，进行确认）。然后，按照 [维基页面][6] 上的指南进行标准的系统升级。提示：在运行 `dnf system-upgrade reboot` 之前，给 `root` 子卷创建另一个快照，你可以给它命名为 `root.dl`。这样，如果你发现硬盘空间不够，你不必再下载五个 GB 的文件包。因为除了下载的包以外，所有的内容都将与 `root` 和 `f36` 共享，因此它不会占用任何额外的空间。然后说到磁盘块的共享问题……

因为在 `root` 子卷中的 `f36` 文件和 `f36` 子卷中的相同文件都使用的是相同的磁盘位置，所以在处理 Btrfs 报告的可用空间时，`dnf system-upgrade` 会感到困惑。因此在升级过程中从 `root` 子卷中删除它们并不会真正释放任何空间。如果你耗尽了所有空间，并且决定重启电脑，那么图形用户界面（GUI）将无法启动。此时，你需要使用 `Ctrl + Alt + F2` 进入文本控制台并登录，这将是你磨练命令行技能的好机会。如何清空空间或扩展根文件系统在这里先不做讨论（我的文件系统经常在一个 LVM 的卷上，可以被扩展）。通常，为升级保留超过 50% 的空闲空间是比较保险的。

### 恢复环节

如果不幸出现问题，你可以重启电脑，并编辑 GRUB 条目以引导启动回退快照。如果你是新手，一旦需要在磁盘上修改 GRUB 条目（这样你就不需要每次启动时都进行编辑），可能需要一些指导。删除或重命名损坏的 `root` 子卷是非常直接的。你可以为 `f36` 子卷（或 `root.dl` 快照）创建一个快照，然后尝试再一次进行系统升级。以下是在子卷 f36 上启动到回退系统后重新开始的示例：

```

$ mount | grep subvol
$ sudo mount /dev/mmcblk2p3 /mnt/root
$ cd /mnt/root
$ sudo mv root root.failed
$ sudo btrfs subvol snapshot f36 root
Create a snapshot of 'f36' in './root'

Don't forget to edit /mnt/root/root/etc/fstab to change the subvol mounted on "/" to "root".
```

事实证明，新的 f38 版本的 kernel-6.2.11 在我的 Pinebook 上进行系统升级后并未成功启动！（不过请不要担心，ARM 只是 Fedora Linux 的可选 CPU 架构——在主流设备上，你很少会遭遇此类问题。）的确，我成功地按照前文所述，在启动时编辑了 GRUB 条目并恢复到了 f36 的 kernel-6.2.10。现在，我继续使用着 f38，但同时搭载了 f36 的 kernel-6.2.10。

**更新**：kernel-6.2.12 已经发布，且我已确认它在 Pinebook 上运行正常。

### 过期问题

随着你不断更新 f38 系统，它最终可能会希望删除 `/boot` 下的最后一个 f36 内核。通常来说，这并不是问题，因为到那个时候，你已经完全熟悉 f38，而 `f36` 快照只是一个存档。然而，如果你希望你的复刻版本（即 `f36` 的快照）能无限期地启动，那么你应当在 `/boot` 下保存一个能正常工作的 f36 内核。最简单的方法是在 `/etc/dnf/dnf.conf` 文件中设置 `installonly_limit=0` 并手动移除旧的内核，这种方法既简单又安全（尽管可能稍显繁琐）。

这里还有一个更复杂的解决方案（不适合新手）：运行 `find /boot -name "*fc36*"` 指令，列举出所有在 `f36` 子卷快照中的内核及 GRUB 文件（这些文件并未包含在快照之内）。将这些文件备份至安全位置（例如我会挂载 `f36` 子卷，并将文件备份至其下的一个目录）。当 f38 系统启动后，对于每一个 f36 内核版本，都需使用 `dnf` 删除特定版本的内核（例如，使用 `dnf remove kernel-core-5.19.11-200.fc36`）。千万不要删除 f38 的内核！然后将你先前备份的 f36 内核恢复至 `/boot` 下。此时，f38 系统已经无法再识别 f36 的内核，因此也不会将其从 `/boot` 中删除。

然而，使用此方法有一个缺点，那就是你可能会不小心删除正在运行的 f38 内核。如果大家有更佳的解决办法，欢迎在评论区分享。

### 展望未来

对于习惯于修改 GRUB 条目的用户，他们可能会考虑创建一个命名为 `f38` 的快照子卷。将当前的 GRUB 条目进行修改，以便启动到这个子卷，重启后，在这个子卷中进行系统升级。此后，总是根据它所包含的 Fedora Linux 版本来命名根文件系统的子卷。但在本文中，我没有采用这种作法，原因有两点：

  1. 将当前活动的子卷命名为 `root`，这是遵循 Fedora Linux 的默认设置。
  2. 坚持使用 `root` 作为当前子卷，这样在进行正常的系统升级操作之外，并不需要任何永久性的更改。

正如本文所展示的，针对重大系统更改（如系统版本升级）可能引发问题时，只读快照作为本地恢复点，非常有用。这些快照还可以通过 Btrfs 的 `send` 子命令，发送至远程备份。（如果远程备份设备已经包含了先前的备份数据，Btrfs 可以进行增量发送，仅传输发生变更的文件，这样就能节省时间和空间。）如果你打算长期存档这些快照，保持清晰不混淆且能明确恢复顺序的关键，就是要使用一套一致的命名规则。关于如何使用 Btrfs 的 `send` 命令来创建备份的更多信息，你可以参考关于 [Btrfs 快照备份][7] 的文章。

*（题图：MJ/6aed1d19-f1dd-4935-ad6f-61f6a868f150）*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/make-use-of-btrfs-snapshots-to-upgrade-fedora-linux-with-easy-fallback/

作者：[Stuart D Gathman][a]
选题：[lujun9972][b]
译者：[ChatGPT](https://linux.cn/lctt/ChatGPT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sdgathman/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2023/04/forkedtree-816x345.jpg
[2]: https://www.flickr.com/photos/brenejohn/20155029206/
[3]: https://fedoramagazine.org/use-lvm-upgrade-fedora/
[4]: https://fedoramagazine.org/setting-kernel-command-line-arguments-with-fedora-30/
[5]: https://fedoramagazine.org/boot-earlier-kernel/
[6]: https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/
[7]: https://fedoramagazine.org/btrfs-snapshots-backup-incremental/
[0]: https://img.linux.net.cn/data/attachment/album/202310/09/113654ba1kp126nzn6tpjv.jpg