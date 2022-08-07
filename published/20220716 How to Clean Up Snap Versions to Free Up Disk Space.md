[#]: subject: "How to Clean Up Snap Versions to Free Up Disk Space"
[#]: via: "https://www.debugpoint.com/clean-up-snap/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14904-1.html"

如何清理 Snap 保留的旧软件包以释放磁盘空间
======

![](https://img.linux.net.cn/data/attachment/album/202208/07/105824nyac4m66a6886x6q.jpg)

> 这个带有脚本的快速指南有助于清理旧的 Snap 软件包，并释放 Ubuntu 系统中的一些磁盘空间。

我的 Ubuntu 测试系统中出现磁盘空间不足。因此，我通过 GNOME 的磁盘使用分析器进行调查，以找出哪个软件包正在消耗宝贵的 SSD 空间。除了通常的缓存和主目录，令我惊讶的是，我发现 Snap 和 Flatpak 消耗了大量的存储空间。

![Snap size – before cleanup][1]

我始终坚持一个规则：除非必要，否则不要使用 Snap 或 Flatpak。这主要是因为它们的安装大小和一些其他问题。我更喜欢原生 deb 和 rpm 包。多年来，我在这个测试系统中安装和移除了一些 Snap 包。

问题出现在卸载后。Snap 在系统中保留了一些残留文件，而一般用户不知道。

所以我打开了 Snap 文件夹 `/var/lib/snapd/snaps`，发现 Snap 会保留以前安装/卸载的软件包的旧版本。

例如，在下图中，你可以看到 GNOME 3.28、3.34 和 Wine 这些都被删除了。但它们还在那里。这是因为 Snap 设计上在正确卸载后保留已卸载软件包的版本。

![Files under snaps directory][2]

或者，你可以在终端中使用：

```
snap list --all
```

![snap list all][3]

对于保留的版本数量，默认值为 3。这意味着 Snap 会保留每个软件包的 3 个旧版本，包括当前安装版本。如果你对磁盘空间没有限制，这是可以的。

但是对于服务器和其他场景，这很容易遇到成本问题，消耗你的磁盘空间。

不过，你可以使用以下命令轻松修改计数。该值可以在 2 到 20 之间。

```
sudo snap set system refresh.retain=2
```

### 清理 Snap 版本

在 SuperUser 的一篇文章中，Canonical 的前工程经理 Popey [提供了一个简单的脚本][4] 可以清理旧的 Snap 版本并保留最新版本。

这是我们将用来清理 Snap 的脚本。

```
#!/bin/bash
 #Removes old revisions of snaps
 #CLOSE ALL SNAPS BEFORE RUNNING THIS
 set -eu
 LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
     while read snapname revision; do
         snap remove "$snapname" --revision="$revision"
     done
```

将上述脚本以 .sh 格式保存在目录中（例如 `clean_snap.sh`），赋予其可执行权限并运行。

```
chmod +x clean_snap.sh
```

当我运行脚本时，它减少了很多磁盘空间。该脚本还将显示要删除的包的名称。

![Executing the script][5]

![Snaps size after cleanup][6]

### 结束语

关于 Snap 的设计效率如何，人们总是争论不休。许多人说，它的设计是糟糕的，是臃肿的，且消耗系统资源。该论点的某些部分是正确的，我不会否认。如果正确实施和增强，沙盒应用的整个概念就很棒。我相信，与 Snap 相比，Flatpak 做得更好。

也就是说，我希望这可以帮助你清理一些磁盘空间。尽管它只在 Ubuntu 中进行了测试，但它应该适用于所有支持 Snap 的 Linux 发行版。

此外，请查看我们关于 [如何清理 Ubuntu][7] 的指南以及其他步骤。

最后，如果你正在寻找清理 **Flatpak** 应用，请参阅 [这个指南][8]。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/clean-up-snap/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2021/03/Snap-size-before-cleanup.jpg
[2]: https://www.debugpoint.com/wp-content/uploads/2021/03/Files-under-snaps-directory.jpg
[3]: https://www.debugpoint.com/wp-content/uploads/2021/03/snap-list-all.jpg
[4]: https://superuser.com/a/1330590
[5]: https://www.debugpoint.com/wp-content/uploads/2021/03/Executing-the-script.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2021/03/Snaps-size-after-cleanup.jpg
[7]: https://www.debugpoint.com/2018/07/4-simple-steps-clean-ubuntu-system-linux/
[8]: https://www.debugpoint.com/clean-up-flatpak/
