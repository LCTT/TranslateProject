8 个你不一定全都了解的 rm 命令示例
======

删除文件和复制/移动文件一样，都是很基础的操作。在 Linux 中，有一个专门的命令 `rm`，可用于完成所有删除相关的操作。在本文中，我们将用些容易理解的例子来讨论这个命令的基本使用。

但在我们开始前，值得指出的是本文所有示例都在 Ubuntu 16.04 LTS 中测试过。

### Linux rm 命令概述

通俗的讲，我们可以认为 `rm` 命令是用于删除文件和目录的。下面是此命令的语法：

```
rm [选项]... [要删除的文件/目录]...
```

下面是命令使用说明：

> GUN 版本 `rm` 命令的手册文档。`rm` 删除每个指定的文件，默认情况下不删除目录。

> 当删除的文件超过三个或者提供了选项 `-r`、`-R` 或 `--recursive`（LCTT 译注：表示递归删除目录中的文件）时，如果给出 `-I`（LCTT 译注：大写的 I）或 `--interactive=once` 选项（LCTT 译注：表示开启交互一次），则 `rm` 命令会提示用户是否继续整个删除操作，如果用户回应不是确认（LCTT 译注：即没有回复 `y`），则整个命令立刻终止。

> 另外，如果被删除文件是不可写的，标准输入是终端，这时如果没有提供 `-f` 或 `--force` 选项，或者提供了 `-i`（LCTT 译注：小写的 i） 或 `--interactive=always` 选项，`rm` 会提示用户是否要删除此文件，如果用户回应不是确认（LCTT 译注：即没有回复 `y`），则跳过此文件。


下面这些问答式例子会让你更好的理解这个命令的使用。

### Q1. 如何用 rm 命令删除文件？

这是非常简单和直观的。你只需要把文件名（如果文件不是在当前目录中，则还需要添加文件路径）传入给 `rm` 命令即可。

（LCTT 译注：可以用空格隔开传入多个文件名称。）

```
rm 文件1 文件2 ... 
```
如：

```
rm testfile.txt
```

[![How to remove files using rm command][1]][2]

### Q2. 如何用 `rm` 命令删除目录?

如果你试图删除一个目录，你需要提供 `-r` 选项。否则 `rm` 会抛出一个错误告诉你正试图删除一个目录。

（LCTT 译注：`-r` 表示递归地删除目录下的所有文件和目录。）

```
rm -r [目录名称]
```

如：

```
rm -r testdir
```

[![How to remove directories using rm command][3]][4]

### Q3. 如何让删除操作前有确认提示?

如果你希望在每个删除操作完成前都有确认提示，可以使用 `-i` 选项。

```
rm -i [文件/目录]
```

比如，你想要删除一个目录“testdir”，但需要每个删除操作都有确认提示，你可以这么做：

```
rm -r -i testdir
```

[![How to make rm prompt before every removal][5]][6]

### Q4. 如何让 rm 忽略不存在的文件或目录?

如果你删除一个不存在的文件或目录时，`rm` 命令会抛出一个错误，如：

[![Linux rm command example][7]][8]

然而，如果你愿意，你可以使用 `-f` 选项（LCTT 译注：即 “force”）让此次操作强制执行，忽略错误提示。

```
rm -f [文件...]
```

[![How to force rm to ignore nonexistent files][9]][10]

### Q5. 如何让 rm 仅在某些场景下确认删除？

选项 `-I`，可保证在删除超过 3 个文件时或递归删除时（LCTT 译注： 如删除目录）仅提示一次确认。

比如，下面的截图展示了 `-I` 选项的作用——当两个文件被删除时没有提示，当超过 3 个文件时会有提示。

[![How to make rm prompt only in some scenarios][11]][12]

### Q6. 当删除根目录是 rm 是如何工作的?

当然，删除根目录（`/`）是 Linux 用户最不想要的操作。这也就是为什么默认 `rm` 命令不支持在根目录上执行递归删除操作。（LCTT 译注：早期的 `rm` 命令并无此预防行为。）

[![How rm works when dealing with root directory][13]][14]

然而，如果你非得完成这个操作，你需要使用 `--no-preserve-root` 选项。当提供此选项，`rm` 就不会特殊处理根目录（`/`）了。

假如你想知道在哪些场景下 Linux 用户会删除他们的根目录，点击[这里][15]。

### Q7. 如何让 rm 仅删除空目录？

假如你需要 `rm` 在删除目录时仅删除空目录，你可以使用 `-d` 选项。

```
rm -d [目录]
```

下面的截图展示 `-d` 选项的用途——仅空目录被删除了。

[![How to make rm only remove empty directories][16]][17]

### Q8. 如何让 rm 显示当前删除操作的详情?

如果你想 rm 显示当前操作完成时的详细情况，使用 `-v` 选项可以做到。

```
rm -v [文件/目录]
```

如：

[![How to force rm to emit details of operation it is performing][18]][19]

### 结论

考虑到 `rm` 命令提供的功能，可以说其是 Linux 中使用频率最高的命令之一了（就像 [cp][20] 和 `mv` 一样）。在本文中，我们涉及到了其提供的几乎所有主要选项。`rm` 命令有些学习曲线，因此在你日常工作中开始使用此命令之前
你将需要花费些时间去练习它的选项。更多的信息，请点击此命令的 [man 手册页][21]。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-rm-command/

作者：[Himanshu Arora][a]
译者：[yizhuoyan](https://github.com/yizhuoyan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/command-tutorial/rm-basic-usage.png
[2]:https://www.howtoforge.com/images/command-tutorial/big/rm-basic-usage.png
[3]:https://www.howtoforge.com/images/command-tutorial/rm-r.png
[4]:https://www.howtoforge.com/images/command-tutorial/big/rm-r.png
[5]:https://www.howtoforge.com/images/command-tutorial/rm-i-option.png
[6]:https://www.howtoforge.com/images/command-tutorial/big/rm-i-option.png
[7]:https://www.howtoforge.com/images/command-tutorial/rm-non-ext-error.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/rm-non-ext-error.png
[9]:https://www.howtoforge.com/images/command-tutorial/rm-f-option.png
[10]:https://www.howtoforge.com/images/command-tutorial/big/rm-f-option.png
[11]:https://www.howtoforge.com/images/command-tutorial/rm-I-option.png
[12]:https://www.howtoforge.com/images/command-tutorial/big/rm-I-option.png
[13]:https://www.howtoforge.com/images/command-tutorial/rm-root-default.png
[14]:https://www.howtoforge.com/images/command-tutorial/big/rm-root-default.png
[15]:https://superuser.com/questions/742334/is-there-a-scenario-where-rm-rf-no-preserve-root-is-needed
[16]:https://www.howtoforge.com/images/command-tutorial/rm-d-option.png
[17]:https://www.howtoforge.com/images/command-tutorial/big/rm-d-option.png
[18]:https://www.howtoforge.com/images/command-tutorial/rm-v-option.png
[19]:https://www.howtoforge.com/images/command-tutorial/big/rm-v-option.png
[20]:https://www.howtoforge.com/linux-cp-command/
[21]:https://linux.die.net/man/1/rm
