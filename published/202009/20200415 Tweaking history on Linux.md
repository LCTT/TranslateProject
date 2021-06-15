[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12596-1.html)
[#]: subject: (Tweaking history on Linux)
[#]: via: (https://www.networkworld.com/article/3537214/tweaking-history-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

在 Linux 上调整命令历史
======

> 在 Linux 系统上，bash shell 的 history 命令可以方便地回顾和重用命令，但是你要控制它记住多少，忘记多少，有很多事情要做。

![](https://img.linux.net.cn/data/attachment/album/202009/08/232418c2121m2euw3aaw58.jpg)

Linux 系统中的 bash `history` 命令有助于记住你以前运行过的命令，并重复这些命令，而不必重新输入。

如果可以的话，你肯定会很高兴不用翻阅十几页的手册，每过一会再次列出你的文件，而是通过输入 `history` 查看以前运行的命令。在这篇文章中，我们将探讨如何让 `history` 命令记住你希望它记住的内容，并忘记那些可能没有什么“历史价值”的命令。

### 查看你的命令历史

要查看以前运行过的命令，你只需输入 `history`。你可能会看到一长串命令。记忆的命令数量取决于在 `~/.bashrc` 文件中设置的名为 `$HISTSIZE` 的环境变量，但是如果你想保存更多或更少的命令，你可以根据你的需要改变这个设置。

要查看历史记录，请使用 `history` 命令：

```
$ history
209 uname -v
210 date
211 man chage
...
```

要查看将显示的最大命令数量：

```
$ echo $HISTSIZE
500
```

你可以通过运行这样的命令来改变 `$HISTSIZE` 并使之永久化：

```
$ export HISTSIZE=1000
$ echo "HISTSIZE=1000" >> ~/.bashrc
```

在为你保留多少历史记录和当你输入 `history` 时显示多少历史记录之间也有区别。`$HISTSIZE` 变量控制显示多少历史记录，而 `$HISTFILESIZE` 变量控制在你的 `.bash_history` 文件中保留多少命令。

```
$ echo $HISTSIZE
1000
$ echo $HISTFILESIZE
2000
```

你可以通过计算历史文件中的行数来验证第二个变量：

```
$ wc -l .bash_history
2000 .bash_history
```

需要注意的是，在登录会话中输入的命令在注销前不会被添加到你的 `.bash_history` 文件中，尽管它们会立即显示在 `history` 命令输出中。

### 使用历史

有三种方法可以重发你在 `history` 中发现的命令。最简单的方法，特别是当你想重用的命令是最近运行的时候，通常是输入一个 `!` 后面跟上命令中足够多的首字母来唯一地识别它。

```
$ !u
uname -v
#37-Ubuntu SMP Thu Mar 26 20:41:27 UTC 2020
```

另一种简单的重复命令的方法是，只需按上箭头键，直到显示了该命令，然后按回车键。

另外，如果你运行 `history` 命令，并看到你想重新运行的命令被列出，你可以输入一个 `!` 后面跟着命令左边显示的序号。

```
$ !209
uname -v
#37-Ubuntu SMP Thu Mar 26 20:41:27 UTC 2020
```

### 隐藏历史

如果你想在一段时间内停止记录命令，你可以使用这个命令：

```
$ set +o history
```

当你输入 `history` 时，你输入的命令不会显示出来，当你退出会话或退出终端时，它们也不会被添加到你的 `.bash_history` 文件中。

要取消这个设置，使用 `set -o history`。

要使它永久化，你可以把它添加到你的 `.bashrc` 文件中，尽管不使用命令历史记录通常不是一个好主意。

```
$ echo 'set +o history' >> ~/.bashrc
```

要暂时清除历史记录，这样在输入 `history` 时只显示之后输入的命令，可以使用 `history -c`（清除）命令：

```
$ history | tail -3
209 uname -v
210 date
211 man chage
$ history -c
$ history
1  history
```

注意：在输入 `history -c` 后输入的命令不会被添加到 `.bash_history` 文件中。

### 控制历史

许多系统上的 `history` 命令的设置会默认包括一个名为 `$HISTCONTROL` 的变量，以确保即使你连续运行同一命令七次，也只会被记住一次。它还可以确保你在首先输入一个或多个空格后跟着的命令将从你的命令历史记录中忽略。

```
$ grep HISTCONTROL .bashrc
HISTCONTROL=ignoreboth
```

`ignoreboth` 的意思是“忽略重复的命令和以空格开头的命令”。例如，如果你输入这些命令：

```
$ echo try this
$ date
$ date
$ date
$   pwd
$ history
```

你的 `history` 命令应该像这样报告：

```
$ history
$ echo try this
$ date
$ history
```

请注意，连续的 `date` 命令被缩减为一条，以空格缩进的命令被省略。

### 忽略历史

要忽略某些命令，使它们在你输入 `history` 时不会出现，也不会被添加到你的 `.bash_history` 文件中，可以使用 `$HISTIGNORE` 设置。例如：

```
$ export HISTIGNORE=”history:cd:exit:ls:pwd:man”
```

这个设置将导致所有的 `history`、`cd`、`exit`、`ls`、`pwd` 和 `man` 命令从你的 `history` 命令的输出和 `.bash_history` 文件中被忽略。

如果你想把这个设置变成永久性的，你必须把它添加到你的 `.bashrc` 文件中。

```
$ echo 'HISTIGNORE="history:cd:exit:ls:pwd:man"' >> .bashrc
```

这个设置只是意味着当你回看以前运行的命令时，列表不会被你在查看命令历史记录时不想看到的命令所干扰。

### 记住、忽略和忘记过去的命令

命令历史记录很有用，因为它可以帮助你记住最近使用过的命令，并提醒你最近所做的更改。它还可以让你更容易地重新运行命令，特别是那些有一串参数但你不一定想重新创建的命令。定制你的历史设置可以让你对命令历史的使用变得更容易，更有效率。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3537214/tweaking-history-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/iqeG5xA96M4
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
