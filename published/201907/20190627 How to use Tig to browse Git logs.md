[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11069-1.html)
[#]: subject: (How to use Tig to browse Git logs)
[#]: via: (https://opensource.com/article/19/6/what-tig)
[#]: author: (Olaf Alders https://opensource.com/users/oalders/users/mbbroberg/users/marcobravo)

如何使用 Tig 浏览 Git 日志
======

> Tig 可不仅仅是 Git 的文本界面。以下是它如何增强你的日常工作流程。

![](https://img.linux.net.cn/data/attachment/album/201907/07/111847v1zx3qk5qqhklyjp.png)

如果你使用 Git 作为你的版本控制系统，你可能已经让自己接受了 Git 是一个复杂的野兽的事实。它是一个很棒的工具，但浏览 Git 仓库可能很麻烦。因此像 [Tig][2] 这样的工具出现了。

来自 [Tig 手册页][3]：

> Tig 是 `git`(1) 的基于 ncurses 的文本界面。它主要用作 Git 仓库浏览器，但也有助于在块级别暂存提交更改，并作为各种 Git 命令的输出分页器。

这基本上意味着 Tig 提供了一个可以在终端中运行的基于文本的用户界面。Tig 可以让你轻松浏览你的 Git 日志，但它可以做的远不止让你从最后的提交跳到前一个提交。

![Tig screenshot][4]

这篇快速入门的 Tig 中的许多例子都是直接从其出色的手册页中拿出来的。我强烈建议你阅读它以了解更多信息。

### 安装 Tig

* Fedora 和 RHEL： `sudo dnf install tig`
* Ubuntu 和 Debian： `sudo apt install tig`
* MacOS： `：brew install tig`

有关更多方式，请参阅官方[安装说明][5]。

### 浏览当前分支中的提交

如果要浏览分支中的最新提交，请输入：

```
tig
```

就是这样。这个三字符命令将启动一个浏览器，你可以在其中浏览当前分支中的提交。你可以将其视为 `git log` 的封装器。

要浏览这些输出，可以使用向上和向下箭头键从一个提交移动到另一个提交。按回车键将会垂直分割窗口，右侧包含所选提交的内容。你可以继续在左侧的提交历史记录中上下浏览，你的更改将显示在右侧。使用 `k` 和 `j` 可以逐行上下浏览，`-` 和空格键可以在右侧上下翻页。使用 `q` 退出右侧窗格。

搜索 `tig` 输出也很简单。使用 `/` （向前）或 `?` （向后）在左右窗格中搜索。

![Searching Tig][6]

这些就足以让你浏览你的提交信息了。这里有很多的键绑定，但单击 `h` 将显示“帮助”菜单，你可以在其中发现其导航和命令选项。你还可以使用 `/` 和 `?` 来搜索“帮助”菜单。使用 `q` 退出帮助。

![Tig Help][7]

### 浏览单个文件的修改

由于 Tig 是 `git log` 的封装器，它可以方便地接受可以传递给 `git log` 的相同参数。例如，要浏览单个文件的提交历史记录，请输入：

```
tig README.md
```

将其与被封装的 Git 命令的输出进行比较，以便更清楚地了解 Tig 如何增强输出。

```
git log README.md
```

要在原始 Git 输出中包含补丁，你可以添加 `-p` 选项：

```
git log -p README.md
```

如果要将提交范围缩小到特定日期范围，请尝试以下操作：

```
tig --after="2017-01-01" --before="2018-05-16" -- README.md
```

再一次，你可以将其与原始的 Git 版本进行比较：


```
git log --after="2017-01-01" --before="2018-05-16" -- README.md
```

### 浏览谁更改了文件

有时你想知道谁对文件进行了更改以及原因。命令：

```
tig blame README.md
```

器本质上是 `git blame` 的封装。正如你所期望的那样，它允许你查看谁是编辑指定行的最后一人，它还允许你查看到引入该行的提交。这有点像 vim 的 `vim-fugitive` 插件提供的 `:Gblame` 命令。

### 浏览你的暂存区

如果你像我一样，你可能会在你的暂存区做了许多修改。你很容易忘记它们。你可以通过以下方式查看暂存处中的最新项目：

```
git stash show -p stash@{0}
```

你可以通过以下方式找到第二个最新项目：

```
git stash show -p stash@{1}
```

以此类推。如果你在需要它们时调用这些命令，那么你会有比我更清晰的记忆。

与上面的 Git 命令一样，Tig 可以通过简单的调用轻松增强你的 Git 输出：

```
tig stash
```

尝试在有暂存的仓库中执行此命令。你将能够浏览*并搜索*你的暂存项，快速浏览你的那些修改。

### 浏览你的引用

Git ref 是指你提交的东西的哈希值。这包括文件和分支。使用 `tig refs` 命令可以浏览所有的 ref 并深入查看特定提交。

```
tig refs
```

完成后，使用 `q` 回到前面的菜单。

### 浏览 git 状态

如果要查看哪些文件已被暂存，哪些文件未被跟踪，请使用 `tig status`，它是 `git status` 的封装。

![Tig status][8]

### 浏览 git grep

你可以使用 `grep` 命令在文本文件中搜索表达式。命令 `tig grep` 允许你浏览 `git grep` 的输出。例如：

```
tig grep -i foo lib/Bar
```

它会让你浏览 `lib/Bar` 目录中以大小写敏感的方式搜索 `foo` 的输出。

### 通过标准输入管道输出给 Tig

如果要将提交 ID 列表传递给 Tig，那么必须使用 `--stdin` 标志，以便 `tig show` 从标准输入读取。否则，`tig show` 会在没有输入的情况下启动（出现空白屏幕）。

```
git rev-list --author=olaf HEAD | tig show --stdin
```

### 添加自定义绑定

你可以使用 [rc][9] 文件自定义 Tig。以下是如何根据自己的喜好添加一些有用的自定义键绑定的示例。

在主目录中创建一个名为 `.tigrc` 的文件。在你喜欢的编辑器中打开 `~/.tigrc` 并添加：

```
# 应用选定的暂存内容
bind stash a !?git stash apply %(stash)

# 丢弃选定的暂存内容
bind stash x !?git stash drop %(stash)
```

如上所述，运行 `tig stash` 以浏览你的暂存。但是，通过这些绑定，你可以按 `a` 将暂存中的项目应用到仓库，并按 `x` 从暂存中删除项目。请记住，你要在浏览暂存*列表*时，才能执行这些命令。如果你正在浏览暂存*项*，请输入 `q` 退出该视图，然后按 `a` 或 `x` 以获得所需效果。

有关更多信息，你可以阅读有关 [Tig 键绑定][10]。

### 总结

我希望这有助于演示 Tig 如何增强你的日常工作流程。Tig 可以做更强大的事情（比如暂存代码行），但这超出了这篇介绍性文章的范围。这里有足够的让你置身于危险的信息，但还有更多值得探索的地方。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/what-tig

作者：[Olaf Alders][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/oalders/users/mbbroberg/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_keyboard_laptop_development_code_woman.png?itok=vbYz6jjb (A person programming)
[2]: https://jonas.github.io/tig/
[3]: http://manpages.ubuntu.com/manpages/bionic/man1/tig.1.html
[4]: https://opensource.com/sites/default/files/uploads/tig.jpg (Tig screenshot)
[5]: https://jonas.github.io/tig/INSTALL.html
[6]: https://opensource.com/sites/default/files/uploads/tig-search.png (Searching Tig)
[7]: https://opensource.com/sites/default/files/uploads/tig-help.png (Tig Help)
[8]: https://opensource.com/sites/default/files/uploads/tig-status.png (Tig status)
[9]: https://en.wikipedia.org/wiki/Run_commands
[10]: https://github.com/jonas/tig/wiki/Bindings
