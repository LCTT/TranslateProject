如何在 Linux 中使用 history 命令
======

> 用强大的 history 命令使你的命令行提示符更有效率。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/linux-penguins.png?itok=yKOpaJM_)

随着我在终端中花费越来越多的时间，我感觉就像在不断地寻找新的命令，以使我的日常任务更加高效。GNU 的 `history` 命令是一个真正改变我日常工作的命令。

GNU `history` 命令保存了从该终端会话运行的所有其他命令的列表，然后允许你重放或者重用这些命令，而不用重新输入它们。如果你是一个老玩家，你知道 `history` 的力量，但对于我们这些半吊子或新手系统管理员来说， `history` 是一个立竿见影的生产力增益。

### 历史 101

要查看命令历史，请在 Linux 中打开终端程序，然后输入：

```
$ history
```

这是我得到的响应：

```
1  clear
2  ls -al
3  sudo dnf update -y
4  history
```

`history` 命令显示自开始会话后输入的命令列表。  `history` 有趣的地方是你可以使用以下命令重放任意一个命令：

```
$ !3
```

提示符中的 `!3` 告诉 shell 重新运行历史列表中第 3 个命令。我还可以输入以下命令来使用：

```
linuser@my_linux_box: !sudo dnf
```

`history` 将搜索与你提供的模式相匹配的最后一个命令，并运行它。

### 搜索历史

你还可以输入 `!!` 重新运行命令历史中的最后一条命令。而且，通过与` grep` 配对，你可以搜索与文本模式相匹配的命令，或者通过与 `tail` 一起使用，你可以找到你最后几条执行的命令。例如：

```
$ history | grep dnf
3  sudo dnf update -y
5  history | grep dnf
$ history | tail -n 3
4  history
5  history | grep dnf
6  history | tail -n 3
```

另一种实现这个功能的方法是输入 `Ctrl-R` 来调用你的命令历史记录的递归搜索。输入后，提示变为：

```
(reverse-i-search)`':
```

现在你可以开始输入一个命令，并且会显示匹配的命令，按回车键执行。

### 更改已执行的命令

`history` 还允许你使用不同的语法重新运行命令。例如，如果我想改变我以前的命令 `history | grep dnf` 成 `history | grep ssh`，我可以在提示符下执行以下命令：

```
$ ^dnf^ssh^
```

`history` 将重新运行该命令，但用 `ssh` 替换 `dnf`，并执行它。

### 删除历史

有时你想要删除一些或全部的历史记录。如果要删除特定命令，请输入 `history -d <行号>`。要清空历史记录，请执行 `history -c`。

历史文件存储在一个你可以修改的文件中。bash shell 用户可以在他们的家目录下找到 `.bash_history`。

### 下一步

你可以使用 `history` 做许多其他事情：

  * 将历史缓冲区设置为一定数量
  * 记录历史中每行的日期和时间
  * 防止某些命令被记录在历史记录中

有关 `history` 命令的更多信息和其他有趣的事情，请参考[ GNU Bash 手册][1]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/6/history-command

作者：[Steve Morris][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/smorris12
[1]:https://www.gnu.org/software/bash/manual/
