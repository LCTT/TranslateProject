[#]: subject: "Linux Jargon Buster: What is sudo rm -rf? Why is it Dangerous?"
[#]: via: "https://itsfoss.com/sudo-rm-rf/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13813-1.html"

Linux 黑话解释：什么是 sudo rm -rf？为什么如此危险？
======

![][11]

当你刚接触 Linux 时，你会经常遇到这样的建议：永远不要运行 `sudo rm -rf /`。在 Linux 世界里，更是围绕着 `sudo rm -rf` 有很多梗。

![][1]

但似乎对于它也有一些混乱的认识。在 [清理 Ubuntu 以腾出空间][2] 的教程中，我建议运行一些涉及 `sudo` 和 `rm -rf` 的命令。一位读者问我，如果 `sudo rm -rf` 是一个不应该运行的危险的 Linux 命令，我为什么要建议这样做。

因此，我想到了写一篇 Linux 黑话解释，以消除误解。

### sudo rm -rf 在做什么？

让我们按步骤来学习。

`rm` 命令用于 [在 Linux 命令行中删除文件和目录][3]。

```
$ rm agatha
$
```

但是因为有只读的 [文件权限][4]，有些文件不会被立即删除。它们必须用选项 `-f` 强制删除。

```
$ rm books
rm: remove write-protected regular file 'books'? y
$ rm -f christie
$
```

另外，`rm` 命令不能被用来直接删除目录（文件夹）。你必须在 `rm` 命令中使用递归选项 `-r`。

```
$ rm new_dir
rm: cannot remove 'new_dir': Is a directory
```

因此最终，`rm -rf` 命令意味着递归地、强制删除指定的目录。

```
$ rm -r new_dir
rm: remove write-protected regular file 'new_dir/books'? ^C
$ rm -rf new_dir
$
```

下面是上述所有命令的截图。

![解释 rm 命令的例子][5]

如果你在 `rm -rf` 命令前加入 `sudo`，你就是在删除具有 root 权限的文件。这意味着你可以删除由 [root 用户][6] 拥有的系统文件。

### 所以，sudo rm -rf 是一个危险的 Linux 命令？

嗯，任何删除东西的命令都可能是危险的，如果你不确定你正在删除什么。

把 `rm -rf` 命令看作一把刀。刀是一个危险的东西吗？有可能。如果你用刀切蔬菜，那是好事。如果你用刀切手指，那当然是不好的。

`rm -rf` 命令也是如此。它本身并不危险。它只是用来删除文件的。但是，如果你在不知情的情况下用它来删除重要文件，那就有问题了。

现在来看看 `sudo rm -rf /`。

你知道，使用 `sudo`，你是以 root 身份运行一个命令，这允许你对系统进行任何改变。

`/` 是根目录的符号。`/var` 表示根目录下的 `var` 目录。`/var/log/apt` 指的是根目录的 `log` 目录下的 `apt` 目录。

![Linux 目录层次表示法][7]

按照 [Linux 目录层次结构][8]，Linux 文件系统中的一切都从根目录开始。如果你删除了根目录，你基本上就是删除了系统中的所有文件。

这就是为什么建议不要运行 `sudo rm -rf /` 命令，因为你会抹去你的整个 Linux 系统。

请注意，在某些情况下，你可能正在运行像 `sudo rm -rf /var/log/apt` 这样的命令，这可能是没问题的。同样，你必须注意你正在删除的东西，就像你必须注意你正在用刀切割的东西一样。

### 我在玩火：如果我运行 sudo rm -rf /，看看会发生什么呢？

大多数 Linux 发行版都提供了一个故障安全保护，防止意外删除根目录。

```
$ sudo rm -rf /
[sudo] password for abhishek:
rm: it is dangerous to operate recursively on '/'
rm: use --no-preserve-root to override this failsafe
```

我的意思是，人是会打错字的，如果你不小心打了 `/ var/log/apt`，而不是 `/var/log/apt`（`/` 和 `var` 之间的空格意味着你给出了 `/` 和 `var` 目录来删除），你将会删除根目录。（LCTT 译注：我真干过，键盘敲的飞起，结果多敲了一个空格，然后就丢了半个文件系统 —— 那时候 Linux 还没这种故障安全保护。）

![使用 sudo rm -rf 时要注意][9]

别担心。你的 Linux 系统会照顾到这种意外。

现在，如果你一心想用 `sudo rm -rf /` 来破坏你的系统呢？你将必须使用它将要求你使用的 `-no-preserve-root` 选项与之配合。

不，请不要自己这样做。让我做给你看看。

所以，我在一个虚拟机中运行基本的操作系统。我运行 `sudo rm -rf / --no-preserve-root`，你可以在下面的视频中看到灯光熄灭（大约 1 分钟）。

![video](https://vimeo.com/594025609)

### 清楚了么？

Linux 有一个活跃的社区，大多数人都会帮助新用户。 之所以说是大多数，是是因为有一些的邪恶坏人潜伏着捣乱新用户。他们经常会建议对初学者所面临的最简单的问题运行 `rm -rf /`。我认为这些白痴在这种邪恶行为中得到了某种至上主义的满足。我会立即将他们从我管理的论坛和群组中踢出去。

我希望这篇文章能让你更清楚地了解这些情况。你有可能仍然有一些困惑，特别是因为它涉及到根目录、文件权限和其他新用户可能不熟悉的东西。如果是这样的话，请在评论区告诉我你的疑惑，我会尽力去解决。

最后，请记住。<ruby>不要喝酒胡搞<rt>Don’t drink and root</rt></ruby>。在运行你的 Linux 系统时要安全驾驶。

--------------------------------------------------------------------------------

via: https://itsfoss.com/sudo-rm-rf/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2016/04/sudo-rm-rf.gif?resize=400%2C225&ssl=1
[2]: https://itsfoss.com/free-up-space-ubuntu-linux/
[3]: https://linuxhandbook.com/remove-files-directories/
[4]: https://linuxhandbook.com/linux-file-permissions/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/rm-rf-command-example-800x487.png?resize=800%2C487&ssl=1
[6]: https://itsfoss.com/root-user-ubuntu/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/linux-directory-structure.png?resize=800%2C400&ssl=1
[8]: https://linuxhandbook.com/linux-directory-structure/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/sudo-rm-rf-example.png?resize=798%2C346&ssl=1
[10]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/dont-drink-and-root.jpg?resize=800%2C450&ssl=1
