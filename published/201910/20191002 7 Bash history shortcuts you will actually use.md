[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11456-1.html)
[#]: subject: (7 Bash history shortcuts you will actually use)
[#]: via: (https://opensource.com/article/19/10/bash-history-shortcuts)
[#]: author: (Ian Miell https://opensource.com/users/ianmiell)

7 个实用的操作 Bash 历史记录的快捷方式
======

> 这些必不可少的 Bash 快捷键可在命令行上节省时间。

![Command line prompt][1]

大多数介绍 Bash 历史记录的指南都详尽地列出了全部可用的快捷方式。这样做的问题是，你会对每个快捷方式都浅尝辄止，然后在尝试了那么多的快捷方式后就搞得目不暇接。而在开始工作时它们就全被丢在脑后，只记住了刚开始使用 Bash 时学到的 [!! 技巧][2]。这些技巧大多数从未进入记忆当中。

本文概述了我每天实际使用的快捷方式。它基于我的书《[Bash 学习，艰难之旅][3]》中的某些内容（你可以阅读其中的[样章][4]以了解更多信息）。

当人们看到我使用这些快捷方式时，他们经常问我：“你做了什么！？” 学习它们只需付出很少的精力或智力，但是要真正的学习它们，我建议每周用一天学一个，然后下次再继续学习一个。值得花时间让它们落在你的指尖下，因为从长远来看，节省的时间将很重要。

### 1、最后一个参数：`!$`

如果你仅想从本文中学习一种快捷方式，那就是这个。它会将最后一个命令的最后一个参数替换到你的命令行中。

看看这种情况：

```
$ mv /path/to/wrongfile /some/other/place
mv: cannot stat '/path/to/wrongfile': No such file or directory
```

啊哈，我在命令中写了错误的文件名 “wrongfile”，我应该用正确的文件名 “rightfile” 代替。

你可以重新键入上一个命令，并用 “rightfile” 完全替换 “wrongfile”。但是，你也可以键入：

```
$ mv /path/to/rightfile !$
mv /path/to/rightfile /some/other/place
```

这个命令也可以奏效。

在 Bash 中还有其他方法可以通过快捷方式实现相同的目的，但是重用上一个命令的最后一个参数的这种技巧是我最常使用的。

### 2、第 n 个参数：`!:2`

是不是干过像这样的事情：

```
$ tar -cvf afolder afolder.tar
tar: failed to open
```

像许多其他人一样，我也经常搞错 `tar`（和 `ln`）的参数顺序。

![xkcd comic][5]

当你搞混了参数，你可以这样：

```
$ !:0 !:1 !:3 !:2
tar -cvf afolder.tar afolder
```

这样就不会出丑了。

上一个命令的各个参数的索引是从零开始的，并且可以用 `!:` 之后跟上该索引数字代表各个参数。

显然，你也可以使用它来重用上一个命令中的特定参数，而不是所有参数。

### 3、全部参数：`!:1-$`

假设我运行了类似这样的命令：

```
$ grep '(ping|pong)' afile
```

参数是正确的。然而，我想在文件中匹配 “ping” 或 “pong”，但我使用的是 `grep` 而不是 `egrep`。

我开始输入 `egrep`，但是我不想重新输入其他参数。因此，我可以使用 `!:1-$` 快捷方式来调取上一个命令的所有参数，从第二个（记住它们的索引从零开始，因此是 `1`）到最后一个（由 `$` 表示）。

```
$ egrep !:1-$
egrep '(ping|pong)' afile
ping
```

你不用必须用 `1-$` 选择全部参数；你也可以选择一个子集，例如 `1-2` 或 `3-9` （如果上一个命令中有那么多参数的话）。

### 4、倒数第 n 行的最后一个参数：`!-2:$`

当我输错之后马上就知道该如何更正我的命令时，上面的快捷键非常有用，但是我经常在原来的命令之后运行别的命令，这意味着上一个命令不再是我所要引用的命令。

例如，还是用之前的 `mv` 例子，如果我通过 `ls` 检查文件夹的内容来纠正我的错误：

```
$ mv /path/to/wrongfile /some/other/place
mv: cannot stat '/path/to/wrongfile': No such file or directory
$ ls /path/to/
rightfile
```

我就不能再使用 `!$` 快捷方式了。

在这些情况下，我可以在 `!` 之后插入 `-n`：（其中 `n` 是要在历史记录中回溯的命令条数），以从较旧的命令取得最后的参数：

```
$ mv /path/to/rightfile !-2:$
mv /path/to/rightfile /some/other/place
```

同样，一旦你学会了它，你可能会惊讶于你需要使用它的频率。

### 5、进入文件夹：`!$:h`

从表面上看，这个看起来不太有用，但我每天要用它几十次。

想象一下，我运行的命令如下所示：

```
$ tar -cvf system.tar /etc/system
 tar: /etc/system: Cannot stat: No such file or directory
 tar: Error exit delayed from previous errors.
```

我可能要做的第一件事是转到 `/etc` 文件夹，查看其中的内容并找出我做错了什么。

我可以通过以下方法来做到这一点：

```
$ cd !$:h
cd /etc
```

这是说：“获取上一个命令的最后一个参数（`/etc/system`），并删除其最后的文件名部分，仅保留 `/ etc`。”

### 6、当前行：`!#:1`

多年以来，在我最终找到并学会之前，我有时候想知道是否可以在当前行引用一个参数。我多希望我能早早学会这个快捷方式。我经常常使用它制作备份文件：

```
$ cp /path/to/some/file !#:1.bak
cp /path/to/some/file /path/to/some/file.bak
```

但当我学会之后，它很快就被下面的快捷方式替代了……

### 7、搜索并替换：`!!:gs`

这将搜索所引用的命令，并将前两个 `/` 之间的字符替换为后两个 `/` 之间的字符。

假设我想告诉别人我的 `s` 键不起作用，而是输出了 `f`：

```
$ echo my f key doef not work
my f key doef not work
```

然后我意识到这里出现的 `f` 键都是错的。要将所有 `f` 替换为 `s`，我可以输入：

```
$ !!:gs/f /s /
echo my s key does not work
my s key does not work
```

它不只对单个字符起作用。我也可以替换单词或句子：

```
$ !!:gs/does/did/
echo my s key did not work
my s key did not work
```

### 测试一下

为了向你展示如何组合这些快捷方式，你知道这些命令片段将输出什么吗？

```
$ ping !#:0:gs/i/o
$ vi /tmp/!:0.txt
$ ls !$:h
$ cd !-2:$:h
$ touch !$!-3:$ !! !$.txt
$ cat !:1-$
```

### 总结

对于日常的命令行用户，Bash 可以作为快捷方式的优雅来源。虽然有成千上万的技巧要学习，但这些是我经常使用的最喜欢的技巧。

如果你想更深入地了解 Bash 可以教给你的全部知识，请买本我的书，《[Bash 学习，艰难之旅][3]》，或查看我的在线课程《[精通 Bash shell][7]》。

* * *

本文最初发布在 Ian 的博客 [Zwischenzugs.com][8] 上，并经允许重复发布。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/bash-history-shortcuts

作者：[Ian Miell][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ianmiell
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg (Command line prompt)
[2]: https://opensource.com/article/18/5/bash-tricks
[3]: https://leanpub.com/learnbashthehardway
[4]: https://leanpub.com/learnbashthehardway/read_sample
[5]: https://opensource.com/sites/default/files/uploads/tar_2x.png (xkcd comic)
[6]: https://xkcd.com/1168/
[7]: https://www.educative.io/courses/master-the-bash-shell
[8]: https://zwischenzugs.com/2019/08/25/seven-god-like-bash-history-shortcuts-you-will-actually-use/
