如何轻松记住 Linux 命令
=================

![](https://www.maketecheasier.com/assets/uploads/2017/10/rc-feat.jpg)

Linux 新手往往对命令行心存畏惧。部分原因是因为需要记忆大量的命令，毕竟掌握命令是高效使用命令行的前提。

不幸的是，学习这些命令并无捷径，然而在你开始学习命令之初，有些工具还是可以帮到你的。

### history

![Linux Bash History 命令](https://www.maketecheasier.com/assets/uploads/2017/10/rc-bash-history.jpg)

首先要介绍的是命令行工具 `history`，它能帮你记住那些你曾经用过的命令。包括应用最广泛的 Bash 在内的大多数 [Linux shell][1]，都会创建一个历史文件来包含那些你输入过的命令。如果你用的是 Bash，这个历史文件就是 `/home/<username>/.bash_history`。

这个历史文件是纯文本格式的，你可以用任意的文本编辑器打开来浏览和搜索。

### apropos

确实存在一个可以帮你找到其他命令的命令。这个命令就是 `apropos`，它能帮你找出合适的命令来完成你的搜索。比如，假设你需要知道哪个命令可以列出目录的内容，你可以运行下面命令:

```shell
apropos "list directory"
```

![Linux Apropos](https://www.maketecheasier.com/assets/uploads/2017/10/rc-apropos.jpg)

这就搜索出结果了，非常直接。给 “directory” 加上复数后再试一下。

```shell
apropos "list directories"
```

这次没用了。`apropos` 所作的其实就是搜索一系列命令的描述。描述不匹配的命令不会纳入结果中。

还有其他的用法。通过 `-a` 标志，你可以以更灵活的方式来增加搜索关键字。试试这条命令:

```shell
apropos "match pattern"
```

![Linux Apropos -a Flag](https://www.maketecheasier.com/assets/uploads/2017/10/rc-apropos-a.jpg)

你会觉得应该会有一些匹配的内容出现，比如 [grep][2] 对吗? 然而，实际上并没有匹配出任何结果。再说一次，apropos 只会根据字面内容进行搜索。

现在让我们试着用 `-a` 标志来把单词分割开来。（LCTT 译注：该选项的意思是“and”，即多个关键字都存在，但是不需要正好是连在一起的字符串。）

```shell
apropos "match" -a "pattern"
```

这一下，你可以看到很多期望的结果了。

`apropos` 是一个很棒的工具，不过你需要留意它的缺陷。

### ZSH

![Linux ZSH Autocomplete](https://www.maketecheasier.com/assets/uploads/2017/10/rc-zsh.jpg)

ZSH 其实并不是用于记忆命令的工具。它其实是一种 shell。你可以用 [ZSH][3] 来替代 Bash 作为你的命令行 shell。ZSH 包含了自动纠错机制，能在你输入命令的时候给你予提示。开启该功能后，它会提示你相近的选择。在 ZSH 中你可以像往常一样使用命令行，同时你还能享受到极度安全的网络以及其他一些非常好用的特性。充分利用 ZSH 的最简单方法就是使用 [Oh-My-ZSH][4]。

### 速记表

最后，也可能是最间的方法就是使用 [速记表][5]。

有很多在线的速记表，比如[这个][6] 可以帮助你快速查询命令。

![linux-commandline-cheatsheet](https://www.maketecheasier.com/assets/uploads/2013/10/linux-commandline-cheatsheet.gif)

为了快速查询，你可以寻找图片格式的速记表，然后将它设置为你的桌面墙纸。

这并不是记忆命令的最好方法，但是这么做可以帮你节省在线搜索遗忘命令的时间。

在学习时依赖这些方法，最终你会发现你会越来越少地使用这些工具。没有人能够记住所有的事情，因此偶尔遗忘掉某些东西或者遇到某些没有见过的东西也很正常。这也是这些工具以及因特网存在的意义。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/remember-linux-commands/

作者：[Nick Congleton][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.maketecheasier.com/author/nickcongleton/
[1]: https://www.maketecheasier.com/alternative-linux-shells/
[2]: https://www.maketecheasier.com/what-is-grep-and-uses/
[3]: https://www.maketecheasier.com/understanding-the-different-shell-in-linux-zsh-shell/
[4]: https://github.com/robbyrussell/oh-my-zsh
[5]: https://www.maketecheasier.com/premium/cheatsheet/linux-command-line/
[6]: https://www.cheatography.com/davechild/cheat-sheets/linux-command-line/ 
