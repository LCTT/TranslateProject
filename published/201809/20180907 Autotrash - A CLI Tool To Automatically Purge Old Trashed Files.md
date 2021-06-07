Autotrash：一个自动清除旧垃圾的命令行工具
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/autotrash-720x340.png)

**Autotrash** 是一个命令行程序，它用于自动清除旧的已删除文件。它将清除超过指定天数的在回收站中的文件。你不需要清空回收站或执行 `SHIFT+DELETE` 以永久清除文件/文件夹。Autortrash 将处理回收站中的内容，并在特定时间段后自动删除它们。简而言之，Autotrash 永远不会让你的垃圾变得太大。

### 安装 Autotrash

Autotrash 默认存在于基于 Debian 系统的仓库中。要在 Debian、Ubuntu、Linux Mint 上安装 `autotrash`，请运行：

```
$ sudo apt-get install autotrash
```

在 Fedora 上：

```
$ sudo dnf install autotrash
```

对于 Arch linux 及其变体，你可以使用任何 AUR 助手程序， 如 [**Yay**][1] 安装它。

```
$ yay -S autotrash-git
```

### 自动清除旧的垃圾文件

每当你运行 `autotrash` 时，它会扫描你的 `~/.local/share/Trash/info` 目录并读取 `.trashinfo` 以找出它们的删除日期。如果文件已在回收站中超过指定的日期，那么就会删除它们。

让我举几个例子。

要删除回收站中超过 30 天的文件，请运行：

```
$ autotrash -d 30
```

如上例所示，如果回收站中的文件超过 30 天，Autotrash 会自动将其从回收站中删除。你无需手动删除它们。只需将没用的文件放到回收站即可忘记。Autotrash 将处理已删除的文件。

以上命令仅处理当前登录用户的垃圾目录。如果要使 autotrash 处理所有用户的垃圾目录（不仅仅是在你的家目录中），请使用 `-t` 选项，如下所示。

```
$ autotrash -td 30
```

Autotrash 还允许你根据回收站可用容量或磁盘可用空间来删除已删除的文件。

例如，看下下面的例子：

```
$ autotrash --max-free 1024 -d 30
```

根据上面的命令，如果回收站的剩余的空间少于 **1GB**，那么 autotrash 将从回收站中清除超过 **30 天**的已删除文件。如果你的回收站空间不足，这可能很有用。

我们还可以从回收站中按最早的时间清除文件直到回收站至少有 1GB 的空间。

```
$ autotrash --min-free 1024
```

在这种情况下，对旧的已删除文件没有限制。

你可以将这两个选项（`--min-free` 和 `--max-free`）组合在一个命令中，如下所示。

```
$ autotrash --max-free 2048 --min-free 1024 -d 30
```

根据上面的命令，如果可用空间小于 **2GB**，`autotrash` 将读取回收站，接着关注容量。此时，删除超过 30 天的文件，如果少于 **1GB** 的可用空间，则删除更新的文件。

如你所见，所有命令都应由用户手动运行。你可能想知道，我该如何自动执行此任务？这很容易！只需将 `autotrash` 添加为 crontab 任务即可。现在，命令将在计划的时间自动运行，并根据定义的选项清除回收站中的文件。

要在 crontab 中添加这些命令，请运行：

```
$ crontab -e
```

添加任务，例如：

```
@daily /usr/bin/autotrash -d 30
```

现在，autotrash 将每天清除回收站中超过 30 天的文件。

有关计划任务的更多详细信息，请参阅以下链接。

+ [Cron 任务的初学者指南]][2]
+ [如何在 Linux 中轻松安全地管理 Cron 作业]][3]

请注意，如果你无意中删除了任何重要文件，它们将在规定的日期后永久消失，所以请小心。

请参阅手册页以了解有关 Autotrash 的更多信息。

```
$ man autotrash
```

清空回收站或按 `SHIFT+DELETE` 永久删除 Linux 系统中没用的东西没什么大不了的。它只需要几秒钟。但是，如果你需要额外的程序来处理垃圾文件，Autotrash 可能会有所帮助。试一下，看看它是如何工作的。

就是这些了。希望这个有用。还有更多的好东西。

干杯!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/autotrash-a-cli-tool-to-automatically-purge-old-trashed-files/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[2]: https://www.ostechnix.com/a-beginners-guide-to-cron-jobs/
[3]: https://www.ostechnix.com/how-to-easily-and-safely-manage-cron-jobs-in-linux/
