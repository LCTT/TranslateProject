如何记录你在终端中执行的所有操作
======

![](https://www.ostechnix.com/wp-content/uploads/2017/03/Record-Everything-You-Do-In-Terminal-720x340.png)

几天前，我们发布了一个解释如何[保存终端中的命令并按需使用][1]的指南。对于那些不想记忆冗长的 Linux 命令的人来说，这非常有用。今天，在本指南中，我们将看到如何使用 `script` 命令记录你在终端中执行的所有操作。你可能已经在终端中运行了一个命令，或创建了一个目录，或者安装了一个程序。`script` 命令会保存你在终端中执行的任何操作。如果你想知道你几小时或几天前做了什么，那么你可以查看它们。我知道我知道，我们可以使用上/下箭头或 `history` 命令查看以前运行的命令。但是，你无法查看这些命令的输出。而 `script` 命令记录并显示完整的终端会话活动。

`script` 命令会在终端中创建你所做的所有事件的记录。无论你是安装程序，创建目录/文件还是删除文件夹，一切都会被记录下来，包括命令和相应的输出。这个命令对那些想要一份交互式会话拷贝作为作业证明的人有用。无论是学生还是导师，你都可以将所有在终端中执行的操作和所有输出复制一份。

### 在 Linux 中使用 script 命令记录终端中的所有内容

`script` 命令预先安装在大多数现代 Linux 操作系统上。所以，我们不用担心安装。

让我们继续看看如何实时使用它。

运行以下命令启动终端会话记录。

```
$ script -a my_terminal_activities
```

其中，`-a` 标志用于将输出追加到文件（记录）中，并保留以前的内容。上述命令会记录你在终端中执行的所有操作，并将输出追加到名为 `my_terminal_activities` 的文件中，并将其保存在当前工作目录中。

示例输出：

```
Script started, file is my_terminal_activities
```

现在，在终端中运行一些随机的 Linux 命令。

```
$ mkdir ostechnix
$ cd ostechnix/
$ touch hello_world.txt
$ cd ..
$ uname -r
```

运行所有命令后，使用以下命令结束 `script` 命令的会话：

```
$ exit
```

示例输出：

```
exit
Script done, file is my_terminal_activities
```

如你所见，终端活动已存储在名为 `my_terminal_activities` 的文件中，并将其保存在当前工作目录中。

要查看你的终端活动，只需在任何编辑器中打开此文件，或者使用 `cat` 命令直接显示它。

```
$ cat my_terminal_activities
```

示例输出：

```
Script started on Thu 09 Mar 2017 03:33:44 PM IST
[sk@sk]: ~>$ mkdir ostechnix
[sk@sk]: ~>$ cd ostechnix/
[sk@sk]: ~/ostechnix>$ touch hello_world.txt
[sk@sk]: ~/ostechnix>$ cd ..
[sk@sk]: ~>$ uname -r
4.9.11-1-ARCH
[sk@sk]: ~>$ exit
exit

Script done on Thu 09 Mar 2017 03:37:49 PM IST
```

正如你在上面的输出中看到的，`script` 命令记录了我所有的终端活动，包括 `script` 命令的开始和结束时间。真棒，不是吗？使用 `script` 命令的原因不仅仅是记录命令，还有命令的输出。简单地说，脚本命令将记录你在终端上执行的所有操作。

### 结论

就像我说的那样，脚本命令对于想要保留其终端活动记录的学生，教师和 Linux 用户非常有用。尽管有很多 CLI 和 GUI 可用来执行此操作，但 `script` 命令是记录终端会话活动的最简单快捷的方式。

就是这些。希望这有帮助。如果你发现本指南有用，请在你的社交，专业网络上分享，并支持我们。

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/record-everything-terminal/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/save-commands-terminal-use-demand/
