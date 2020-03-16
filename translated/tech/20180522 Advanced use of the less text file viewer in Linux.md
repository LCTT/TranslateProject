你所不知道的用 less 查看文件的高级用法
======

> 使用 less 文件查看器的一些技巧。

![](https://img.linux.net.cn/data/attachment/album/202003/16/152826assmtybsohopo4b7.png)

最近，我正在拜读 Scott Nesbitt 的文章《[在 Linux 命令行中使用 less 来查看文本文件][1]》，并受到了一些启发，所以我想分享一些使用 `less` 命令的技巧。

### LESS 环境变量

如果你定义了环境变量 `LESS`（例如在 `.bashrc` 中），那么 `less` 会将其视为一个选项列表，就像在命令行中传递给它一样。

我这样定义：

```
LESS='-C -M -I -j 10 -# 4'
```

它的意思是：

* `-C` – 通过不从底部滚动来加快全屏打印速度。
* `-M` – 在最后一行（状态行）显示更多信息。你可以使用 `-PM` 来自定义显示的信息，但我通常只用 `-M`。
* `-I` – 忽略搜索中的大小写。
* `-j 10` – 在终端的第 10 行而不是第一行显示搜索结果。这样，每次按 `n` 或（`N`） 跳到下一个（或上一个）匹配项时，就会有 10 条上下文。
* `-# 4` – 当按下向右或向左的箭头时，会向右或向左跳四个字符。默认情况时跳转半个屏幕，我觉得太多了。一般来说，`less` 似乎（至少部分）是按最初开发它时的环境优化的，那时使用慢速调制解调器和低带宽的互联网连接，所以跳过半个屏幕是有意义的。

### PAGER 环境变量

许多程序使用在 `PAGER` 环境变量中的命令来显示信息。因此，你可以在 `.bashrc` 中设置 `PAGER=less`，然后让程序运行 `less`。查看手册页（`man 7 environ`）中是否有其它此类变量。

### -S

`-S` 告诉 `less` 将长行切断而不是将它们换行。除非我在（或我要）查看文件，否则我很少需要这样做。幸运的是，你可以在 `less` 中输入所有命令行选项，就像它们是键盘命令一样。因此，如果我想在文件已经打开的情况下隔断长行，我可以简单地输入 `-S`。（LCTT 译注：注意大写 `S` ，并按回车）

这是我经常使用的一个例子：

```
su - postgres
export PAGER=less  # 因为我不用在所有的机器上编辑 postgres 的 .bashrc
psql
```

有时当我查看一个 `SELECT` 命令的输出非常宽时，我会输入 `-S` 以便将其格式化的漂亮一些。如果当我按下右箭头想查看更多内容时它跳得太远（因为我没有设置 `-#`），则可以输入 `-#8`，那么每次按下右箭头都会向右移动八个字符。

有时在多次输入 `-S` 之后，我会退出 psql 并设置环境变量后再次运行它：

```
export LESS=-S
```

### F

命令 `F` 可以使 `less` 像 `tail -f` 一样工作，等待更多的数据被添加到文件后再显示它们。与 `tail -f` 相比，它的一个优点是，高亮显示搜索匹配仍然有效。因此，你可以输入 `less /var/log/logfile`，搜索某些内容时，它将高亮显示所有出现的内容（除非你使用了 `-g`），然后按下 `F` 键，当更多数据写入到日志时，`less` 将显示它并高亮新的匹配项。

按下 `F` 后，可以按 `Ctrl+C` 来停止其查找新数据（这不会干掉它），这样你可以返回文件查看旧内容，搜索其它内容等，然后再次按 `F` 键来查看更多新数据。

### 搜索

搜索使用系统的正则表达式库，这通常意味着你可以使用扩展正则表达式。特别是，搜索 `one|two|three` 可以找到并高亮所有的 one、two 或 three。

我经常使用的另一种模式是 `.*someting.*`，特别是对于一些很长的日志行（例如，跨越多个终端宽度的行），它会高亮整行。这种模式使查看一行的起始和结束位置变得更加容易。我还会结合其它内容，例如 `.*one thing.*|.*another thing.*`，或者使用 `key: .*|.*marker.*` 来查看 `key` 的内容。例如，一个日志文件中包含一些字典/哈希的转储。它会高亮相关的标记行，这样我就看到上下文了，甚至，如果我知道这个值被引号引起来的话，就可以：

```
key: '[^']*'|.*marker.*
```

`less` 会保留你的搜索项的历史纪录，并将其保存到磁盘中以备将来调用。当你按下 `/` 或 `?` 时，可以使用向上或向下箭头浏览历史记录（以及进行基本的行编辑）。 

在撰写本文时，我无意间看了下 `less` 手册页，发现了一个非常有用的功能：使用 `&!pattern` 跳过无关的行。例如，当我在 `/var/log/messages` 中寻找内容时，经常会一个个迭代使用以下命令：

```
cat /var/log/messages | egrep -v 'systemd: Started Session' | less
cat /var/log/messages | egrep -v 'systemd: Started Session|systemd: Starting Session' | less
cat /var/log/messages | egrep -v 'systemd: Started Session|systemd: Starting Session|User Slice' | less
cat /var/log/messages | egrep -v 'systemd: Started Session|systemd: Starting Session|User Slice|dbus' | less
cat /var/log/messages | egrep -v 'systemd: Started Session|systemd: Starting Session|User Slice|dbus|PackageKit Daemon' | less
```

但是现在我知道如何在 `less` 中做同样的事情。例如，我可以输入 `&!systemd: Started Session`，然后想要隐藏 `systemd: Starting Session`，所以我输入 `&!`，并使用向上箭头从历史记录中获得上一次搜索的结果。然后我接着输入 `|systemd: Starting Session` 并按下回车，继续以相同的方式添加更多条目，直到我过滤掉足够多的条目，看到更有趣的内容。

### =

命令 `=` 显示有关文件和位置的更多信息，甚至比 `-M` 更多。如果文件非常大，计算 `=` 花费的时间太长，可以按下 `Ctrl+C`，它将停止尝试计算。

如果你正在查看的内容来自管道而不是文件，则 `=`（和 `-M`）不会显示未知内容，包括文件中的行数和字节数。要查看这些数据，如果你知道管道命令将很快结束，则可以使用 `G` 跳到最后，然后 `less` 将开始显示这些信息。

如果按下 `G` 并且写入管道的命令花费的时间比预期的长，你可以按下 `Ctrl+C`，该命令将被终止。即使你没有按 `G`，`Ctrl+C` 键也会杀死它。因此，如果你不想终止命令，请不要意外按下 `Ctrl+C`。出于这个原因，如果命令执行了某些操作（不仅是显示信息），通常更安全的做法是将其输出写入文件并在单独的终端中查看文件，而不是使用管道。

### 为什么你需要 less

`less` 是一个非常强大的程序，与该领域中较新的竞争者（例如 `most` 和 `moar`）不同，你可能会在几乎所有的系统上找到它，就像 `vi` 一样。因此，即使你使用 GUI 查看器或编辑器，花一些时间浏览 `less` 手册页也是值得的，至少可以了解一下它的用处。这样，当你需要做一些已有的功能可能提供的工作时，就会知道如何要搜索手册页或互联网来找到所需的内容。

有关更多信息，访问 [less 主页][2]。该网站有一个不错的常见问题解答，其中包含更多提示和技巧。  

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/advanced-use-less-text-file-viewer

作者：[Yedidyah Bar David][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/didib
[1]:http://opensource.com/article/18/4/using-less-view-text-files-command-line
[2]:http://www.greenwoodsoftware.com/less/
