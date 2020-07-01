[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12344-1.html)
[#]: subject: (How to use Bash history commands)
[#]: via: (https://opensource.com/article/20/6/bash-history-commands)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

如何使用 Bash history 命令
======

> Bash 的 history 命令在它提供的功能数量上超过了所有其他 Linux Shell 历史接口。

![](https://img.linux.net.cn/data/attachment/album/202006/24/101620c0uj0dgg0buo9nib.jpg)

Bash 有丰富的历史。也就是说，它是一个古老的的 shell，还有一个更古老的 Shell （Bourne shell）的前辈，但是它还有一个很棒的 `history` 命令，它提供的功能数量超过了所有其他 shell 的历史接口。 [Bash][2] 版本的 `history` 可进行反向搜索、快速调用、重写历史记录等。

`history` 命令与许多其他命令不同。你可能习惯于将命令作为可执行文件放在常见的系统级位置，例如 `/usr/bin`、`/usr/local/bin` 或者 `~/bin`。 内置的 `history` 命令不在你的 `PATH` 中并且没有物理位置：


```
$ which history

which: no history in [PATH]
```

相反，`history` 是 shell 本身的内置函数：

```
$ type history
history is a shell builtin
$ help history
history: history [-c] [-d offset] [n] or
history -anrw [filename] or
history -ps arg [arg...]

Display or manipulate the history list.
[...]
```

出于这个原因，每个 shell 中的历史功能都是独特的，因此你在 Bash 中使用的功能可能无法在 Tcsh 或 Fish 或 Dash 中使用，而在这些 shell 中使用的功能可能也无法在 Bash 中使用。在某些情况下，了解 Bash 可以做什么可能会激发其他 shell 的用户创建有趣的改造来复制 Bash 行为，并且可能会解锁你从未知道的 Bash 功能。

### 查看你的 Bash 历史

`history` 命令最基本、最频繁的用法是查看 shell 会话的历史记录：


```
$ echo "hello"
hello
$ echo "world"
world
$ history
  1  echo "hello"
  2  echo "world"
  3  history
```

### 事件指示器

<ruby>事件指示器<rt>Event designator</rt></ruby>按事件搜索你的历史记录。在这里，“事件”是指记录在历史中的命令，以换行符划定。换句话说，一行一个事件，以索引号来标记。

事件指示器大多以感叹号开头，有时也称为 “bang”（`!`）。

要从你的历史记录中重新运行命令，请使用感叹号，之后紧跟（之间没有空格）所需命令的索引号。例如，假设第 1 行包含命令 `echo "hello"`，你想要想再次运行它：


```
$ !1
echo "hello"
hello
```

你可以使用相对定位，提供基于你历史中当前位置向后的负数行号。例如，返回到历史中倒数第三个条目：

```
$ echo "foo"
foo
$ echo "bar"
bar
$ echo "baz"
baz
$ !-3
echo "foo"
foo
```

如果只想回去一行，那么可以使用速记 `!!` 代替 `!-1`。这节省了按键时间！

```
$ echo "foo"
$ !!
echo "foo"
foo
```

### 字符串搜索

你也可以对条目搜索特定的字符串，反过来搜索要运行命令。要搜索以指定字符串*开始*的命令，请使用感叹号，之后紧跟（没有空格）要搜索的字符串：

```
$ echo "foo"
$ true
$ false
$ !echo
echo "foo"
foo
```

你还可以在任意位置（不仅是开头）搜索包含该字符串的命令。为此，请像之前一样使用 `!` 加上要搜索的字符串，但在字符串的两端都用问号（`?`）围绕起来。如果你知道该字符串后紧跟一个换行符，那么可以省略最后的问号（就是在按*回车*之前输入的最后字符）：

```
$ echo "foo"
$ true
$ false
$ !?foo?
echo "foo"
foo
```

### 字符串替换

类似于在行首搜索字符串，你可以搜索字符串并用新字符串替换它，以更改命令：

```
$ echo "hello"
hello
$ echo "world"
world
$ ^hello^foo
echo "foo"
foo
```

### 让 history 有用

在 Bash 中，`history` 命令的功能远远超过此处介绍的内容，但这是一个很好的开始, 可以让你习惯使用你的历史记录, 而不是仅仅把它当作一个参考。经常使用 `history` 命令，并试试无需输入命令即可执行的操作。你可能会感到惊讶！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/bash-history-commands

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://opensource.com/resources/what-bash
