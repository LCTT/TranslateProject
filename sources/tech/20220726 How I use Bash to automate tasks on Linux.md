[#]: subject: "How I use Bash to automate tasks on Linux"
[#]: via: "https://opensource.com/article/22/7/use-bash-automate-tasks-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Linux 上使用 Bash 自动化任务
======
Bash 有一些方便的自动化功能，可以让我在 Linux 上处理文件时更轻松。

![bash logo on green background][1]

图源：Opensource.com

通过 Bash 命令行进行自动化任务是极好的一种方式。不论你使用运行在服务器上的 Linux，进行管理日志文件还是其他文件，或者你在个人电脑上整理文件，使桌面保持整洁，使用 Bash 的自动化功能会使你的工作变得更简单。

### Linux `for` 命令:自动执行文件任务

如果你对一堆文件要同时处理，并且对每个文件进行相同的操作，请使用 `for` 命令。该命令会遍历文件列表，并执行一个或多个命令。`for` 命令如下所示：

```
for variable in list
do
    commands
done
```

我在示例中添加了额外的空格，来分开 `for` 命令中不同的部分。多个命令可能无法在命令行中同时运行，不过你可以使用 `;` 将所有命令放在同一行中，就像这样:

```
for variable in list ; do commands ; done
```

让我们看看它的实际效果。我使用 `for` 命令来重命名一些文件。最近，我有一些截图，想要重命名。这些截图名称为 `filemgr.png` 或 `terminal.png`，我想将 `screenshot` 放在每个名称前。我可以使用 `for` 命令一次性将 30 个文件重命名。这是两个文件的示例：

```
$ ls
filemgr.png  terminal.png
$ for f in *.png ; do mv $f screenshot-$f ; done
$ ls
screenshot-filemgr.png  screenshot-terminal.png
```

`for` 命令使得在一系列文件中执行一种或多种操作变得容易。你可以用一些有意义的变量，比如 `image` 或 `screenshot`，或者你用示例中“缩写的”变量 `f`。当我在使用 `for` 循环写脚本的时候，会选择有意义的变量名。但是当我在命令行中使用 `for`，我通常会选择缩写变量名，比如 `f` 代表文件，`d` 代表目录等。

不论你选择怎样的变量名，请确保在引用变量时添加 `$` 符号。这会将变量扩展为你正在处理的文件的名称。在 Bash 提示符下键入 `help for` 以了解有关 `for` 命令的更多信息。

### Linux `if` 条件执行

当你需要对每个文件执行相同操作时，使用 `for` 循环遍历一些文件很有帮助。但是，如果你需要对某些文件做一些不同的事情怎么办？为此，你需要使用 `if` 语句进行条件执行。`if` 语句如下所示：

```
if test
then
    commands
fi
```

你也可以使用 `if/else` 语句进行判断：

```
if test
then
    commands
else
    commands
fi
```

你可以使用 `if/else-if/else` 语句来实现更复杂的程序。当我一次性需要自动处理很多文件时，我会在脚本中使用：

```
if test
then
    commands
elif test2
then
    commands
elif test3
then
    commands
else
    commands
fi
```

`if` 命令可以让你进行不同的判断，例如判断一个文件是否是一个文件，或者一个文件是否为空文件（零字节）。在命令行中输入 `help test`，可以立即查看使用 `if` 语句能够进行的不同种测试。

例如，假设我想清理一个包含几十个文件的日志目录。日志管理中的一个常见任务是删除所有空日志，并压缩其他日志。解决这个问题的最简单方法是删除空文件。没有一个 `if` 测试可以完全匹配，但是我们有 `-s` 选项来判断是否是一个文件，并且判断该文件不是空的（大小不为零）。这与我们想要的相反，但我们可以使用 `!` 来否定测试，以判断某些内容不是文件或为空。

让我们用一个示例来看看这个过程。我创建了两个测试文件：一个是空的，另一个包含一些数据。我们可以使用 `if` 判断，*如果*文件为空打印消息 “empty”：

```
$ ls
datafile  emptyfile
$ if [ ! -s datafile ] ; then echo "empty" ; fi
$ if [ ! -s emptyfile ] ; then echo "empty" ; fi
empty
```

我们可以将 `if` 和 `for` 命令结合起来，检查日志文件列表中的空文件并删除：

```
$ ls -l
total 20
-rw-rw-r--. 1 jhall jhall 2 Jul  1 01:02 log.1
-rw-rw-r--. 1 jhall jhall 2 Jul  2 01:02 log.2
-rw-rw-r--. 1 jhall jhall 2 Jul  3 01:02 log.3
-rw-rw-r--. 1 jhall jhall 0 Jul  4 01:02 log.4
-rw-rw-r--. 1 jhall jhall 2 Jul  5 01:02 log.5
-rw-rw-r--. 1 jhall jhall 0 Jul  6 01:02 log.6
-rw-rw-r--. 1 jhall jhall 2 Jul  7 01:02 log.7
$ for f in log.* ; do if [ ! -s $f ] ; then rm -v $f ; fi ; done
removed 'log.4'
removed 'log.6'
$ ls -l
total 20
-rw-rw-r--. 1 jhall jhall 2 Jul  1 01:02 log.1
-rw-rw-r--. 1 jhall jhall 2 Jul  2 01:02 log.2
-rw-rw-r--. 1 jhall jhall 2 Jul  3 01:02 log.3
-rw-rw-r--. 1 jhall jhall 2 Jul  5 01:02 log.5
-rw-rw-r--. 1 jhall jhall 2 Jul  7 01:02 log.7
```

使用 `if` 命令可以在需要时执行一些操作，使脚本变得智能。我经常会在脚本中使用 `if`，当我需要判断文件在我的系统上存在或不存在时，或者判断脚本正在检查的条目是文件或目录时。使用 `if` 使得脚本能够根据需要采取不同的操作。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/use-bash-automate-tasks-linux

作者：[Jim Hall][a]
选题：[lkxed][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/bash_command_line.png
