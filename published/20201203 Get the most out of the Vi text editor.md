[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12947-1.html)
[#]: subject: (Get the most out of the Vi text editor)
[#]: via: (https://opensource.com/article/20/12/vi-text-editor)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

初识 Vi 文本编辑器
======

> Vi 是典型的 Unix 文本编辑器。来了解一下它或它的各种化身：Vim、Neovim、gVim、nvi 或 Elvis，它适用于 Linux、macOS、Windows 或 BSD。

![](https://img.linux.net.cn/data/attachment/album/202012/23/222122wc8resp5zpo2yrcm.jpg)

不管你用的是 Vim、Neovim、gVim、nvi，甚至是 Elvis，其实都是这个典型的 Unix 编辑器 Vi。可能每一个 Linux 和 BSD 发行版中都包含了 Vi，Vi 是一个轻量级的简约型文本编辑器，由于其简单简洁的键盘快捷键和双模式设计，很多用户都喜欢它。

最初的 Vi 编辑器是由 [C shell][2] 的创建者 Bill Joy 编写的应用程序。现代 Vi 的化身已经[增加了许多功能][3]，包括多级撤销、插入模式下更好的导航、行折叠、语法高亮、插件支持等等。Vim 被认为是它的最流行的现代实现，大多数人在提到 Vi 时实际上是指 Vim。

所有这些化身都是为了同一个目标，所以本文将从通用的场景来探讨 Vi。你的计算机上的版本可能略有不同，但你仍然可以从 Vi 编辑文本的方式中获益。

### 安装 Vi

如果你运行的是 Linux、macOS 或 BSD，那么你已经安装了 `vi` 命令。如果你在 Windows 上，你可以[下载 Vim 和 gVim][4]。

![gVim][5]

在 [NetBSD][7]上，nvi 是 Vi 的常见替代品，而 Slackware 则提供了 [Elvis][8]（和 Vim），流行的 [Neovim][9] 复刻旨在帮助用户用 [Lua][10] 扩展 Vim。

### 启动 Vi

在终端中用 `vi` 命令启动 Vi 或 Vim。如果在你的系统中没有找到 `.vimrc` 文件，那么 Vim 就会以 Vi 兼容模式启动（也可以用 `-C` 选项强制启动该模式）。如果你想使用 gVim 以拥有一个图形用户界面（GUI），你可以从桌面的应用程序菜单中启动它。

如果你是一个刚刚学习 Vi 的新用户，使用图形用户界面是一个很好的方法，可以在你可能期望的文本编辑器的行为和 Vi 的设计行为之间提供一个缓冲带。图形用户界面版本有一个菜单栏，一些鼠标集成，一个工具栏和其他功能，这可以帮助你找到你可能认为在典型的文本编辑器中理所当然的基本功能，但还不知道如何在 Vi 中做。

### 如何使用 Vi

学习 Vi 最简单的方法可能是使用 `vimtutor`，这是一个与 Vim 打包在一起的交互式教程。要开始学习该教程，启动 `vimtutor` 并阅读说明，尝试每个练习。正如教程中所说，学好 Vi 不是记住什么键做什么，而是建立肌肉记忆，以在输入时调用常用的动作。

#### Esc 键

学习 Vi 的第一件重要的事就是掌握 `Esc` 键。`Esc` 是激活*命令模式*的工具，很快你就会明白，在 Vi 中，只要你不确定，就按 `Esc`。在命令模式下，你按下的任何键都不会被输入到你正在处理的文本文档中，而是被 Vi 解释为一条命令。例如，要将光标向左移动，你可以按键盘上的 `H` 键。如果你处于*插入*模式，那么按 `H` 键就会输入字母 H，就像你期望的那样。但在*命令*模式下，按 `H` 向左移动，`L` 向右移动，`J` 向下移动，`K` 向上移动。

命令模式和插入模式的分离与其他文本编辑器的工作方式形成了鲜明的对比，由于这种设计，这可能是 Vi 最显著的差异化。不过有趣的是，理论上来说，它与你可能已有的工作方式并没有太大的区别。毕竟，当你把手从键盘上拿开，用鼠标选择文本时，你基本上是将自己置于一种命令模式中。在 Vi 中，你不需要把手从键盘上移开来移动鼠标，也不需要按功能键或 `Ctrl` 键，而是将*编辑器*放入一种特殊的操作模式中，使你的按键重新分配到命令上，而不是文字输入。

#### 扩展 Vi

在 Vim 8.0 版本之前，Vi 在很大程度上“只是”一个文本编辑器。它有插件，但安装插件是一个手动的过程，很多用户从未想过要这么做。幸运的是，Vim 8 及以上版本提供了对插件管理的支持，使得安装和加载插件变得轻而易举。

安装 Vim 的插件可以通过 `vim-plug` 功能来完成。例如，要安装 Vi 文件浏览器 [NERDTree][11]：

```
:PlugInstall NERDTree
```

你也可以更新插件：

```
:PlugUpdate NERDTree
```

关于使用 `vim-plug` 和手动安装插件和主题的更多信息，请阅读我的文章《[如何安装 Vim 插件][12]》。

### 默认 Vi 

Vi 不仅仅流行，它还是一个 [POSIX][13] 标准。它是每个系统管理员都应该知道如何使用的应用程序，即使他们不打算每天使用它。它也是一个快速而简单的编辑器，所以一旦你熟练掌握了它，它可能就是你一直在寻找的编辑器。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/vi-text-editor

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-concentration-focus-windows-office.png?itok=-8E2ihcF (Woman using laptop concentrating)
[2]: https://opensource.com/article/20/8/tcsh
[3]: https://vimhelp.org/vi_diff.txt.html#vi-differences
[4]: https://www.vim.org/download.php
[5]: https://opensource.com/sites/default/files/uploads/gvim.jpg (gVim)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/article/19/3/netbsd-raspberry-pi
[8]: https://github.com/mbert/elvis
[9]: http://neovim.io
[10]: https://opensource.com/article/20/2/lua-cheat-sheet
[11]: https://www.vim.org/scripts/script.php?script_id=1658
[12]: https://opensource.com/article/20/2/how-install-vim-plugins
[13]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
