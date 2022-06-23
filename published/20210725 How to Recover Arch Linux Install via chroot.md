[#]: subject: "How to Recover Arch Linux Install via chroot"
[#]: via: "https://www.debugpoint.com/2021/07/recover-arch-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14708-1.html"

如何通过 chroot 恢复 Arch Linux 系统
======

![](https://img.linux.net.cn/data/attachment/album/202206/14/111204hm20rzjmmf5ib9nr.jpg)

> 这个快速指南解释了恢复 Arch Linux 安装的一些方便步骤。

作为一个滚动发布的版本，[Arch Linux][1] 中有时会出现一些问题。不是因为你自己的行为，而是数以百计的其他原因，如新内核与你的硬件或软件的兼容性。但是，Arch Linux 仍然很棒，它提供了最新的软件包和应用。

但有时，它也会给你带来麻烦，你最终只能看到一个闪烁的光标，其他什么都没有。

所以，在这种情况下，与其重新格式化或重新安装，不如在放弃希望之前尝试恢复安装和数据。本指南概述了这个方向的一些步骤。

### 恢复 Arch Linux 安装

第一步是用 Arch Linux 创建一个可启动的<ruby>现场<rt>Live</rt></ruby> USB。从 [这个链接][3] 下载 .ISO 并创建一个可启动的 USB。你可以查看这个 [如何使用 Etcher 创建可启动的 USB][2] 的指南。记住这一步需要另一个稳定的工作系统，因为你目前的系统不能使用。

你需要知道你的 Arch Linux 安装在哪个分区上。这是一个非常重要的步骤。如果你不知道，你可以用 GParted 来查找。或者在你的 GRUB 菜单中查看，或者你可以运行下面的命令来了解。这将列出你所有的磁盘分区及其大小、标签：

```
sudo lsblk -o name,mountpoint,label,size,uuid
```

完成后，插入 USB 盘并从它启动。你应该在现场介质中看到 Arch Linux 的提示符。

现在，用下面的方法挂载 Arch Linux 分区。记得把 `/dev/sda3` 改成你对应的分区。

```
mount /dev/sda3 /mnt
arch-chroot /mnt
```

`arch-chroot` 命令将在终端挂载你的 Arch Linux 分区，所以用你的 Arch 凭证登录。现在，在这个阶段，根据你的需要，你有以下选择。

* 你可以通过 `/home` 文件夹来备份你的数据。如果，故障排除方式无效的话。你可以把文件复制到外部 USB 或其他分区。
* 核查日志文件，特别是 pacman 日志。因为，不稳定的系统可能是由升级某些软件包引起的，如图形驱动或任何其他驱动。根据日志，如果你需要的话，可以降级任何特定的软件包。

你可以使用下面的命令来查看 pacman 日志文件的最后 200 行，以找出任何失败的项目或依赖性删除。

```
tail -n 200 /var/log/pacman.log | less
```

上面的命令给出了你的 `pacman.log` 文件末尾的 200 行来验证。现在，仔细检查哪些软件包在你成功启动后被更新了。

并记下软件包的名称和版本。你可以尝试逐一降级软件包，或者如果你认为某个特定的软件包产生了问题。使用 `pacman -U` 开关来降级。

```
pacman -U <package name>
```

如果有的话，你可以在降级后运行以下命令来启动你的 Arch 系统。

```
exec /sbin/init
```

检查你的显示管理器的状态，是否有任何错误。有时，显示管理器会产生一个问题，无法与 X 服务器通信。例如，如果你正在使用 Lightdm，那么你可以通过以下方式检查它的状态。

```
systemctl status lightdm
```

或者，可以通过下面的命令启动它，并检查出现了错误。

```
lightdm --test-mode --debug
```

下面是一个 Lightdm 失败的例子，它导致了一个不稳定的 Arch 系统。

![lightdm - test mode][4]

或者通过使用 `startx` 启动 X 服务器来检查。

```
startx
```

根据我的经验，如果你在上述命令中看到错误，尝试安装另一个显示管理器并启用它，如 sddm。它可能会消除这个错误。

根据你的系统状态，尝试上述步骤，并进行故障排除。对于特定于显示管理器 lightdm 的错误，我们有一个 [指南][5]，你可以看看。

如果你使用的是 sddm，那么请查看 [这些故障排除步骤][6]。

### 总结

每个安装环境都是不同的。上述步骤可能对你不起作用。但它值得一试，根据经验，它是有效的。如果它起作用，那么，对你来说是好事。无论哪种方式，请在下面的评论区中告诉我结果如何。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/recover-arch-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/tag/arch-linux
[2]: https://www.debugpoint.com/2021/01/etcher-bootable-usb-linux/
[3]: https://archlinux.org/download/
[4]: https://www.debugpoint.com/wp-content/uploads/2021/03/lightdm-test-mode.jpg
[5]: https://www.debugpoint.com/2021/03/failed-to-start-lightdm/
[6]: https://wiki.archlinux.org/title/SDDM#Troubleshooting
