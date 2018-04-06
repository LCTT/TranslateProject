给初学者的 type 命令教程
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Type-command-720x340.png)

`type` 命令用于查找 Linux 命令的信息。顾名思义，你可以使用 `type` 命令轻松找出给定的命令是否是别名、shell 内置命令、文件、函数或关键字。另外，你也可以找到命令的实际路径。为什么有人需要找到命令类型？例如，如果你经常在共享的计算机上工作，则某些人可能会故意或意外地为特定的 Linux 命令创建别名来执行不需要的操作，例如 `alias ls = rm -rf /`。因此，在发生更糟糕的事情之前检查它们总是一个好主意。这是 `type` 命令有用的地方。

让我给你看一些例子。

不带任何选项运行 `type` 命令。

```
$ type ls
ls is aliased to `ls --color=auto'
```

正如你在上面的输出中看到的那样，`ls` 命令已被别名为 `ls -color-auto`。但是，它是无害的。但只要想想 `ls` 如果被别名为了其他一些危险的命令。你不想那样，是吗？

你可以使用 `-t` 选项仅找出 Linux 命令的类型。例如：

```
$ type -t ls
alias

$ type -t mkdir
file

$ type -t pwd
builtin

$ type -t if
keyword

$ type -t rvm
function
```

该命令仅显示命令的类型，例如别名。它不显示被别名的内容。如果该命令找不到，你将在终端中看不到任何内容。

`type` 命令的另一个有用的地方是我们可以很容易地找出给定 Linux 命令的绝对路径。为此，请使用 `-p` 选项，如下所示。

```
$ type -p cal
/usr/bin/cal
```

这与 `which ls` 命令类似。如果给定的命令是别名，则不会打印任何内容。

要显示命令的所有信息，请使用  `-a`  选项。

```
$ type -a ls
ls is aliased to `ls --color=auto'
ls is /usr/bin/ls
ls is /bin/ls
```

如你所见，`-a` 标志显示给定命令的类型及其绝对路径。有关更多详细信息，请参阅手册页。

```
$ man type
```

希望这有帮助。会有更多的好东西。请继续访问！

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/the-type-command-tutorial-with-examples-for-beginners/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
