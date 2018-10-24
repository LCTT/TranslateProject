命令行小技巧：读取文件的不同方式
======

![](https://fedoramagazine.org/wp-content/uploads/2018/10/commandlinequicktips-816x345.jpg)

作为图形操作系统，Fedora 的使用是令人愉快的。你可以轻松地点击完成任何任务。但你可能已经看到了，在底层还有一个强大的命令行。想要在 shell 下体验，只需要在 Fedora 系统中打开你的终端应用。这篇文章是向你展示常见的命令行使用方法的系列文章之一。

在这部分，你将学习如何以不同的方式读取文件，如果你在系统中打开一个终端完成一些工作，你就有可能需要读取一两个文件。

### 一应俱全的大餐

对命令行终端的用户来说， `cat` 命令众所周知。 当你 `cat` 一个文件，你很容易的把整个文件内容展示在你的屏幕上。而真正发生在底层的是文件一次读取一行，然后一行一行写入屏幕。

假设你有一个文件，叫做 `myfile`， 这个文件每行只有一个单词。为了简单起见，每行的单词就是这行的行号，就像这样：

```
one
two
three
four
five
```

所以如果你 `cat` 这个文件，你就会看到如下输出：

```
$ cat myfile
one
two
three
four
five
```

并没有太惊喜，不是吗？ 但是有个有趣的转折，只要使用 `tac` 命令，你可以从后往前 `cat` 这个文件。（请注意， Fedora 对这种有争议的幽默不承担任何责任！）

```
$ tac myfile
five
four
three
two
one
```

`cat` 命令允许你以不同的方式装饰输出，比如，你可以输出行号： 

```
$ cat -n myfile
     1 one
     2 two
     3 three
     4 four
     5 five
```

还有其他选项可以显示特殊字符和其他功能。要了解更多, 请运行 `man cat` 命令， 看完之后，按 `q` 即可退出回到 shell。

### 挑选你的食物

通常，文件太长会无法全部显示在屏幕上，您可能希望能够像文档一样查看它。 这种情况下，可以试试 `less` 命令：

```
$ less myfile
```

你可以用方向键，也可以用 `PgUp`/`PgDn` 来查看文件， 按 `q` 就可以退回到 shell。

实际上，还有一个 `more` 命令，其基于老式的 UNIX 系统命令。如果在退回 shell 后仍想看到该文件的内容，则可能需要使用它。而 `less` 命令则让你回到你离开 shell 之前的样子，并且清除屏幕上你看到的所有的文件内容。

### 一点披萨或甜点

有时，你所需的输出只是文件的开头。 比如，有一个非常长的文件，当你使用 `cat` 命令时，会显示这个文件所有内容，前几行的内容很容易滚动过去，导致你看不到。`head` 命令会帮你获取文件的前几行：

```
$ head -n 2 myfile
one
two
```
同样，你会用 `tail` 命令来查看文件的末尾几行：

```
$ tail -n 3 myfile
three
four
five
```

当然，这些只是在这个领域的几个简单的命令。但它们可以让你在阅读文件时容易入手。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/commandline-quick-tips-reading-files-different-ways/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[distant1219](https://github.com/distant1219)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
