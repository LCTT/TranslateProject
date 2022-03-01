[#]: subject: "How to Clean Up Snap Package Versions in Linux [Quick Tip]"
[#]: via: "https://itsfoss.com/clean-snap-packages/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14302-1.html"

如何在 Linux 中清理 Snap 包的版本
======

![](https://img.linux.net.cn/data/attachment/album/202202/24/153025zxi8112125hrxrl8.jpg)

Snap 软件包并不是每个人都喜欢的，但它们是 Ubuntu 生态系统中不可或缺的一部分。

它有其优点和缺点。其中一个缺点是，Snap 包通常体积较大，占用大量的磁盘空间。如果你的磁盘空间不够用，特别是在根分区上，这可能是一个问题。

让我分享一个巧妙的技巧，你可以用它来减少 Snap 包使用的磁盘空间。

### 清理旧的 Snap 包版本以释放磁盘空间

与 snap 有关的系统文件都存放在 `/var/lib/snapd` 目录下。根据你所安装的 Snap 包的数量，这个目录的大小可能在几 GB。不要只听我的一面之词。通过 [使用 du 命令检查目录大小][1] 来进行评估。

```
$ sudo du -sh /var/lib/snapd
5.4G    /var/lib/snapd
```

你也可以使用磁盘使用分析器这个 GUI 工具来查看 [Ubuntu 的磁盘使用情况][2]。

![Snap disk usage][3]

这可真够多的，对吧？你可以在这里腾出一些磁盘空间。根据设计，Snap 至少会在你的系统上保留一个你所安装的软件包的旧版本。你可以通过使用 Snap 命令看到这种行为：

```
snap list --all
```

你应该看到同一个软件包被列了两次，而且版本和修订号都不同。

![Snap keeps at least two versions of each package][4]

为了释放磁盘空间，你可以删除额外的软件包版本。你怎么知道要删除哪一个呢？你可以看到，这些较旧的软件包被标记为“禁用”。

不要担心。你不需要手动操作。由于 Alan Pope 在 [Snapcraft][5] 团队工作时写的一个灵巧的 bash 脚本，有一种自动的方法可以做到。

我希望你知道 [如何创建和运行 bash shell 脚本][6]。基本上，创建一个名为 `clean-snap.sh` 的新文件，并在其中添加以下几行。

```
#!/bin/bash
# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
```

保存它并关闭编辑器。要运行这个脚本，把它放在你的主目录中，然后 [在 Ubuntu 中打开终端][7]，运行这个命令：

```
sudo bash clean-snap.sh
```

你可以看到，它开始删除旧版本的软件包。

![Removing old snap package versions][8]

如果你现在检查 Snap 使用的磁盘空间，你会发现现在的目录大小已经减少了。

```
$ sudo du -sh /var/lib/snapd
3.9G    /var/lib/snapd
```

如果这对你有用，你可以偶尔运行这个命令。

#### 这个脚本是如何工作的？

如果你对这个脚本的作用感到好奇，让我来解释一下。

你已经看到了 `snap list -all` 命令的输出。它的输出被传递给 [awk 命令][9]。Awk 是一个强大的脚本工具。

`awk '/disabled/{print $1, $3}'` 部分在每一行中寻找字符串 `disabled`，如果找到它，它将提取第一列和第三列。

这个输出被进一步传递给 `while` 和 `read` 命令的组合。读取命令获取第一列的 Snap 包名和第三列的修订号变量。

然后，这些变量被用来运行 `snap remove` 命令，用 Snap 包名和它的修订号来删除。

只要发现有包含 `disabled` 字符串的行，就会运行 `while` 循环。

如果你对 shell 脚本略知一二，这一切就很容易理解了。如果你不熟悉，我们有一个 [初学者的 bash 教程系列][10] 给你。

### 你拿回了你的空间了吗？

你可能会看到一些论坛建议将 Snap 软件包的保留值设置为 2。

```
sudo snap set system refresh.retain=2
```

我认为现在不需要了。现在 Snap 的默认行为是为任何软件包保存两个版本。

总而言之，如果你的空间不够用，摆脱额外的软件包版本肯定是 [释放 Ubuntu 磁盘空间的方法][11] 之一。

如果这个教程帮助你释放了一些空间，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/clean-snap-packages/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/find-directory-size-du-command/
[2]: https://itsfoss.com/check-free-disk-space-linux/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/snap-disk-usage.png?resize=800%2C323&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/snap-keeps-two-versions-of-each-package.png?resize=800%2C347&ssl=1
[5]: https://snapcraft.io/
[6]: https://itsfoss.com/run-shell-script-linux/
[7]: https://itsfoss.com/open-terminal-ubuntu/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/02/removing-old-snap-package-versions.png?resize=800%2C445&ssl=1
[9]: https://linuxhandbook.com/awk-command-tutorial/
[10]: https://linuxhandbook.com/tag/bash-beginner/
[11]: https://itsfoss.com/free-up-space-ubuntu-linux/
