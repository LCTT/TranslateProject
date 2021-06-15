[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12381-1.html)
[#]: subject: (Make Bash history more useful with these tips)
[#]: via: (https://opensource.com/article/20/6/bash-history-control)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

这些技巧让 Bash 命令历史更加有用
======

> 告诉 Bash 你想要它记住什么，甚至删除不需要的记录重写历史。

![](https://img.linux.net.cn/data/attachment/album/202007/05/091205hkg0egl2gge2gx9z.jpg)

运行 [Bash][2] 的 Linux 终端有内置的历史记录，你可以用来跟踪最近的操作。要查看你的 Bash 会话的历史记录，请使用内置命令 `history`：

```
$ echo "foo"
foo
$ echo "bar"
bar
$ history
  1  echo "foo"
  2  echo "bar"
  3  history
```

与大多数命令不一样，`history` 命令不是文件系统上的可执行文件，而是 Bash 的功能。你可以使用 `type` 命令来验证：

```
$ type history
history is a shell builtin
```

### 历史控制

shell 历史记录的行数上限由 `HISTSIZE` 变量定义。你可以在 `.bashrc` 文件中设置此变量。以下将你的历史记录设置为 3,000 行，之后将最早的行删除以为最新命令腾出空间，该命令位于列表的底部：

```
export HISTSIZE=3000
```

还有其他与历史相关的变量。 `HISTCONTROL` 变量控制哪些历史被记录。你可以在 `.bashrc` 中写入下面的行来强制 Bash 排除以空格开头的命令：

```
export HISTCONTROL=$HISTCONTROL:ignorespace
```

现在，如果你输入以空格开头的命令，那么它将不会记录在历史记录中：

```
$ echo "hello"
$     mysql -u bogus -h badpassword123 mydatabase
$ echo "world"
$ history
  1  echo "hello"
  2  echo "world"
  3  history
```

你也可以避免重复的条目：

```
export HISTCONTROL=$HISTCONTROL:ignoredups
```

现在，如果你一个接着一个输入两个命令，历史记录中只会显示一个：

```
$ ls
$ ls
$ ls
$ history
  1  ls
  2  history
```

如果你喜欢这两个忽略功能，那么可以使用 `ignoreboth`：

```
export HISTCONTROL=$HISTCONTROL:ignoreboth
```

### 从历史记录中删除命令

有时你会犯一个错误，在 shell 中输入了一些敏感内容，或者你​​只是想清理历史记录，以便它更准确地表示让某件事正常工作所采取的步骤。如果要从 Bash 的历史记录中删除命令，请在要删除的项目的行号上使用 `-d` 选项：

```
$ echo "foo"
foo
$ echo "bar"
bar
$ history | tail
  535  echo "foo"
  536  echo "bar"
  537  history | tail
$ history -d 536
$ history | tail
  535  echo "foo"
  536  history | tail
  537  history -d 536
  538  history | tail
```

要停止添加 `history` 条目，只要在 `HISTCONTROL` 环境变量中有 `ignorespace`，就可以在命令前添加空格：

```
$  history | tail
  535  echo "foo"
  536  echo "bar"
$  history -d 536
$  history | tail
  535  echo "foo"
```

你可以使用 `-c` 选项清除所有会话历史记录：

```
$ history -c
$  history
$
```

### history 命令的经验

操纵历史通常没有听起来那么危险，尤其是当你有目标地管理它时。例如，如果你要记录一个复杂的问题，通常最好使用会话历史来记录命令，因为通过将命令插入历史记录，你能运行它们并从而测试过程。很多时候，不执行历史命令会导致忽略小的步骤或写错小细节。

按需使用历史会话，并明智地控制历史记录。享受历史修改吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/bash-history-control

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: https://opensource.com/resources/what-bash
