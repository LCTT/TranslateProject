[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10865-1.html)
[#]: subject: (How to use advanced rsync for large Linux backups)
[#]: via: (https://opensource.com/article/19/5/advanced-rsync)
[#]: author: (Alan Formy-Duval  https://opensource.com/users/alanfdoss/users/marcobravo)

如何使用 rsync 的高级用法进行大型备份
=====================================

> 基础的 `rsync` 命令通常足够来管理你的 Linux 备份，但是额外的选项使大型备份集更快、更强大。

![Filing papers and documents][1]

很明显，备份一直是 Linux 世界的热门话题。回到 2017，David Both 为 [Opensource.com][2] 的读者在[使用 rsync 备份 Linux 系统][3]方面提了一些建议，在这年的更早时候，他发起了一项问卷调查询问大家，[在 Linux 中你的 /home 目录的主要备份策略是什么][4]，在今年的另一个问卷调查中，Don Watkins 问到，[你使用哪种开源备份解决方案][5]。

我的回复是 [rsync][6]。我真的非常喜欢 rsync！市场上有大量大而复杂的工具，对于管理磁带机或者存储库设备，这些可能是必要的，但是可能你需要的只是一个简单的开源命令行工具。

### rsync 基础

我为一个大概拥有 35,000 开发者并有着几十 TB 文件的全球性机构管理二进制仓库。我经常一次移动或者归档上百 GB 的数据。使用的是 `rsync`。这种经历使我对这个简单的工具充满信心。（所以，是的，我在家使用它来备份我的 Linux 系统）

基础的 `rsync` 命令很简单。


```
rsync -av 源目录 目的地目录
```

实际上，在各种指南中教的 `rsync` 命令在大多数通用情况下都运行的很好。然而，假设我们需要备份大量的数据。例如包含 2,000 个子目录的目录，每个包含 50GB 到 700GB 的数据。在这个目录运行 `rsync` 可能需要大量时间，尤其是当你使用校验选项时（我倾向使用）。

当我们试图同步大量数据或者通过慢的网络连接时，可能遇到性能问题。让我给你展示一些我使用的方法来确保好的性能和可靠性。

### rsync 高级用法

`rsync` 运行时出现的第一行是：“正在发送增量文件列表。” 如果你在网上搜索这一行，你将看到很多类似的问题：为什么它一直运行，或者为什么它似乎挂起了。

这里是一个基于这个场景的例子。假设我们有一个 `/storage` 的目录，我们想要备份到一个外部 USB 磁盘，我们可以使用下面的命令：

```
rsync -cav /storage /media/WDPassport
```

`-c` 选项告诉 `rsync` 使用文件校验和而不是时间戳来决定改变的文件，这通常消耗的时间更久。为了分解 `/storage` 目录，我通过子目录同步，使用 `find` 命令。这是一个例子：


```
find /storage -type d -exec rsync -cav {} /media/WDPassport \;
```

这看起来可以，但是如果 `/storage` 目录有任何文件，它们将被跳过。因此，我们如何同步 `/storage` 目录中的文件呢？同样有一个细微的差别是这些选项将造成 `rsync` 会同步 `.` 目录，该目录是源目录自身；这意味着它会同步子目录两次，这并不是我们想要的。

长话短说，我的解决方案是一个 “双-递增”脚本。这允许我分解一个目录，例如，当你的家目录有多个大的目录，例如音乐或者家庭照片时，分解 `/home` 目录为单个的用户家目录。

这是我的脚本的一个例子：

```
HOMES="alan"
DRIVE="/media/WDPassport"

for HOME in $HOMES; do
cd /home/$HOME
rsync -cdlptgov --delete . /$DRIVE/$HOME
find . -maxdepth 1 -type d -not -name "." -exec rsync -crlptgov --delete {} /$DRIVE/$HOME \;
done
```

第一个 `rsync` 命令拷贝它在源目录中发现的文件和目录。然而，它将目录留着不处理，因此我们能够通过 `find` 命令迭代它们。这通过传递 `-d` 参数来完成，它告诉 `rsync` 不要递归目录。


```
-d, --dirs 传输目录而不递归
```

然后 `find` 命令传递每个目录来单独运行 `rsync`。之后 `rsync` 拷贝目录的内容。这通过传递 `-r` 参数来完成，它告诉 `rsync` 要递归目录。


```
-r, --recursive 递归进入目录
```

这使得 `rsync` 使用的增量文件保持在一个合理的大小。

大多数 `rsync` 指南为了简便使用 `-a` （或者 `archive`） 参数。这实际是一个复合参数。

```
-a, --archive 归档模式；等价于 -rlptgoD（没有 -H,-A,-X）
```

我传递的其他参数包含在 `a` 中；这些是 `-l`、`-p`、`-t`、`-g`和 `-o`。


```
-l, --links 复制符号链接作为符号链接
-p, --perms 保留权限
-t, --times 保留修改时间
-g, --group 保留组
-o, --owner 保留拥有者（只适用于超级管理员）
```

`--delete` 选项告诉 `rsync` 删除目的地目录中所有在源目录不存在的任意文件。这种方式，运行的结果仅仅是复制。你同样可以排除 `.Trash` 目录或者 MacOS 创建的 `.DS_Store` 文件。


```
-not -name ".Trash*" -not -name ".DS_Store"
```

### 注意

最后一条建议： `rsync` 可以是破坏性的命令。幸运的是，它的睿智的创造者提供了 “空运行” 的能力。如果我们加入 `n` 选项，rsync 会显示预期的输出但不写任何数据。


```
`rsync -cdlptgovn --delete . /$DRIVE/$HOME`
```

这个脚本适用于非常大的存储规模和高延迟或者慢链接的情况。一如既往，我确信仍有提升的空间。如果你有任何建议，请在下方评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/5/advanced-rsync

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
[2]: http://Opensource.com
[3]: https://linux.cn/article-8237-1.html
[4]: https://opensource.com/poll/19/4/backup-strategy-home-directory-linux
[5]: https://opensource.com/article/19/2/linux-backup-solutions
[6]: https://en.wikipedia.org/wiki/Rsync
