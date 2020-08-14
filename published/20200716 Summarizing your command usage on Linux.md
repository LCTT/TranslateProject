[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12517-1.html)
[#]: subject: (Summarizing your command usage on Linux)
[#]: via: (https://www.networkworld.com/article/3567050/summarizing-your-command-usage-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

汇总你在 Linux 上的命令使用情况
======

> 使用合适的命令，你可以快速了解 Linux 系统上使用的命令以及执行的频率。

![](https://img.linux.net.cn/data/attachment/album/202008/14/221303ln67fl62nsfb7nys.jpg)

汇总 Linux 系统上使用的命令只需一串相对简单的命令以及几条管道将它们绑定在一起。当你的历史记录缓冲区保留了最近的 1,000 或 2,000 条命令时，总结你的命令活动可能会变得很乏味。这篇文章提供了一种方便的方法来汇总命令的使用情况，并高亮显示最常用的命令。

首先，请记住，典型的命令历史记录可能看起来像这样。请注意，命令是显示在命令序列号之后，并紧跟其参数。

```
91  sudo apt-get install ccrypt
     ^
     +-- command
```

请注意，`history` 命令遵循 `HISTSIZE` 的设置，这会决定保留多少条命令。可能是 500、1,000 或更多。如果你不喜欢它的设置，那么可以在 `.bashrc` 或其他启动文件中添加或更改 `HISTSIZE` 设置。

```
$ echo $HISTSIZE
1000
$ history | wc -l
1000
$ grep HISTSIZE ~/.bashrc
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
```

记下大量命令的主要好处之一是，它可以让你轻松地重新运行过去使用的命令，而不必重新输入或记住它们。它还能让你轻松地查看你在一个任务中已经做了多少工作。单独使用 `history` 命令时，你会看到类似下面这样，最早的在最前面：

```
$ history
    7  vi tasks
    8  alias
    9  echo $HISTTIMEFORMAT
   10  history
   11  date
   …
```

查看最新使用命令需要查看记录的命令的尾部：

```
$ history | tail -4
 1007  echo $HISTSIZE
 1008  history | wc -l
 1009  history
 1010  history | tail -4
```

另外，你可以使用 `tail` 命令查看 `.bash_history` 文件的尾部，但是 `history` 命令显示的数字可以让你输入如 `!1010` 这样的数字重新运行命令，这点通常更有用。

要提供已使用命令的汇总（例如 `vi` 和 `echo`），你可以首先使用 `awk` 将命令与 `history` 中保存的其他信息分隔开来：

```
$ history | awk '{print $2}'
vi
alias
echo
history
date
…
```

如果你将历史记录中的命令列表传递给 `sort` 命令以按字母顺序对命令进行分组，那么会得到以下内容：

```
$ history | awk '{print $2}' | sort
7z
7z
alias
apropos
cd
cd
…
```

接下来，将 `sort` 命令的输出传递给 `uniq -c` ，这将计算每个命令使用了多少次：

```
$ history | awk '{print $2}' | sort | uniq -c
      2 7z
      1 alias
      2 apropos
     38 cd
     21 chmod
…
```

最后，添加第二个 `sort` 命令按倒序对命令组计数进行排序，这将先列出最常用的命令：

```
$ history | awk '{print $2}' | sort | uniq -c | sort -nr
    178 ls
     95 vi
     63 cd
     53 sudo
     41 more
…
```

这样可以让你了解使用最多的命令，但不会包括任何你可能故意从历史记录文件中删除的命令，例如：

```
HISTIGNORE="pwd:clear:man:history"
```

### 当修改了历史记录格式时

对于默认的历史记录格式，`history` 命令输出中的第一个字段将是每个命令的序号，第二个字段是使用的命令。因此，上面所有 `awk` 命令都设置成显示 `$2`。

```
$ alias cmds='history | awk '\''{print $2}'\'' | sort | uniq -c | sort -nr'
```

如果你像下面那样将日期和时间添加了到 `history` 命令中，那么你还必须修改所设置的别名：

```
$ echo $HISTTIMEFORMAT
%d/%m/%y %T
```

这个日期/时间信息有时会很有帮助，但是这意味着你必须在选择 `history` 命令的第 4 个字段而不是第 2 个字段来汇总命令，因为你的历史记录条目将如下所示：

```
91  05/07/20 16:37:39 sudo apt-get install ccrypt
                       ^
                       +-- command
```

因此，在将 `$2` 变为 `$4` 之后，用于检查 `history` 命令的别名将改为这样：

```
$ alias cmds='history | awk '\''{print $4}'\'' | sort | uniq -c | sort -nr'
```

可将别名保存在 `.bashrc` 或其他启动文件中，请确保在 `$` 符号前面插入反斜杠，以便 bash 不会尝试解释 `$4`。

```
alias cmds='history | awk '\''{print \$2}'\'' | uniq -c | sort -nr'
alias cmds='history | awk '\''{print \$4}'\'' | uniq -c | sort -nr'
```

请注意，日期和时间信息与命令本身保存在历史记录文件的不同行中。因此，添加此信息后，bash 历史记录文件的行数将增加一倍，尽管在 `history` 命令输出时不会：

```
$ wc -l .bash_history
2000 .bash_history
$ history | wc -l
1000
```

### 总结

你可以随时决定要保留多少命令历史记录，哪些命令不值得记录，以使你的命令摘要最有用。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3567050/summarizing-your-command-usage-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
