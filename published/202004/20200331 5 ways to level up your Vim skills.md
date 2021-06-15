[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12077-1.html)
[#]: subject: (5 ways to level up your Vim skills)
[#]: via: (https://opensource.com/article/20/3/vim-skills)
[#]: author: (Detlef Johnson https://opensource.com/users/deckart)

提升你的 Vim 技能的 5 个方法
======

> 通过一些有趣的小技巧使你的文本编辑器更上一层楼。

![](https://img.linux.net.cn/data/attachment/album/202004/05/232434x1hnzlnhcnm3nrc7.jpg)

Vim 是最受欢迎的文本编辑器之一，因此绝对值得你花时间去学习如何使用它。就算你只是学习使用这个无处不在的 [Vi(m)][2] 命令行文本编辑器打开文件、输入和编辑一些文本、保存编辑的文件并退出程序，你都会受益匪浅。

你会发现，使用 Vim 非常方便的的场景几乎总是涉及到运行远程 Shell 操作的任务。如果你时不时地使用  ssh，比如

```
$ ssh user@hostname.provider.com
```

并在虚拟专用服务器（VPS）或本地虚拟化容器中工作，那么就可以从这些强大的 Vim 技能中受益匪浅。

### 将 Vim 设置为默认的文本编辑器

几乎所有的现代 Linux（或 BSD）发行版中，都可以在终端仿真器的 shell 命令提示符下使用 Vim。一旦在你的用户 shell 程序中将 Vim 定义为默认编辑器后，那么就可以使用熟悉的 Vim 键绑定来在内置的实用程序（例如 `man`）中导航。我将说明如何使用 Bash 和 Z shell（zsh）来实现此目的，zsh 现在是 macOS 用户的默认 shell（自 Catalina 起）。

#### 在 Bash 中将 Vim 设置为默认

Bash 通过点文件的组合来管理设置。最常见的的做法将你的编辑器添加到主目录中的 `.bashrc` 文件中，但也可以将其添加到 `.bash_profile` 中。（请阅读 [GNU Bash 文档][3]了解两者的不同之处）。

通过在 `~/.bashrc` 中添加以下内容，将 Vim 设置为默认编辑器：

```
# set default editor to Vim
export EDITOR=vim
```

以 `#` 开头的行是可选的注释，这是一个好方法，可以提醒自己该命令的作用。

#### 在 zsh 中将 Vim 设置为默认

zsh 是一种越来越流行的终端仿真器，尤其是在苹果公司的基于 FreeBSD 的 Darwin 系统最近从 Bash 转向 zsh 以来。

zsh 点文件与 Bash 的文件相当，因此你可以在 `~/.zshrc` 或 `~/.zprofile` 之间进行选择。有关何时使用哪一个的详细信息，请参见 [zsh文档][4]。

将其设置为默认：

```
# set default editor to Vim
export EDITOR=vim
```

### 优化 Vim 配置

Vim 像是终端仿真器 shell 一样，也使用点文件来设置个人偏好。如果你发现了这种模式，则可能已经猜到它是 `~/.vimrc`。

你可能要更改的第一个设置是将对传统的 Vi 兼容模式切换为“关闭”。由于 Vim 是 Vi 的超集，因此 Vi 中的所有功能在 Vim 中都是可用的，并且在 Vim 中得到了很大的改进，你可以获得许多高级功能。最新版本（8.2）允许你在分割的窗口中以子进程 shell 的方式打开一个终端。

顺便说一句，明确关闭对传统的 Vi 的兼容性看起来没有什么作用（[事实上，可能并没有什么作用][5]）。当 Vim 遇到 `.vimrc` 文件时，它会暗暗地自动将兼容模式切换到关闭。但有时将其明确关闭仍然很重要。缩写 `nocp` 是 `nocompatible` 的同义词，作用是一样的。[条条大道通罗马][6]，切换首选项有很多方式。

在 `.vimrc` 语法中， 以 `"` 开头的行是注释（就像 `.bashrc` 文件中的 `#` 一样），这些注释可以帮助你记住诸如为何选择了一个隐晦的设置名称之类的内容。

要关闭 Vi 兼容性，请将以下内容添加到 `~/.vimrc` 文件中：

```
" ensure that legacy compatibility mode is off
" documentation: <http://vimdoc.sourceforge.net/htmldoc/options.html\#'compatible>'
set nocp
```

### 理解模式

Vim 的 “模式”概念是非常重要的，尤其是“普通模式”和“插入模式”之间的区别。对模式的混淆是大多数新用户的困扰。模式并不是 Vim 所独有的，甚至也不是 Vi 所引入的。命令模式是如此的古老，以至于它比 70 年代发明的[复制和粘贴][7]功能还要早。

#### 重要的模式

Vim 依赖于不同的模式来定义键盘的敲击行为。需要了解的重要模式有：

* 普通模式：默认模式，主要用于导航和打开文件。
* 插入模式（包括替换）：这种模式下 Vim 允许将文本输入到打开的文件中。
* 可视模式：Vim 的行为类似于基于鼠标的输入方式，如复制、编辑、替换等。
* 命令模式（包括行模式、Ex 命令模式和末行模式）：是在 Vim 中做更多事情的强大方法。

每种模式都有很多值得探索的地方。使用 [Vimtutor][8]（`vimtutor`）可以交互式地学习移动光标、模式和在末行模式下运行 Ex 命令。一些不可缺少的生产力操作符包括：

操作符 | 说明
--- | ---
`:E` | 打开资源管理器，用于定位文件和目录。
`.` | 重复上次的编辑操作。
`;` | 向前重复上一次的动作或移动
`,` | 向后重复上一次的动作或移动。
`/` | 向前搜索文档。
`?` | 向后搜索文档。
`*` | 查找光标所在处的单词的下一个出现的地方。
`#` | 查找光标所在处的单词的上一次出现的地方。
`~` | 切换大小写。
`%` | 在 `()`、`[]` 和 `{}` 的开闭符号之间切换；对编码非常有用。
`z=` | 提出拼写建议。

### 像钢琴一样弹奏 Vim

尽管把 Vim 的操作符“语言”记在记忆中是很重要的，但要想掌握它，难点在于学会像音乐家一样思考，把操作符和动作组合成“和弦”，这样你就可以像弹钢琴一样弹奏 Vim。这就是 Vim 的文本操作能力可以与另一个著名的命令行编辑器 Emacs 相媲美的地方。（虽然其中一个编辑器会让磨损掉你的 `Esc` 键，而另一个编辑器会让你的 `Ctrl` 键磨损掉。）

在描述键“和弦”时，Vim 中的传统做法是用大写字母 C 后面加上一个连字符（`C-`）来指代 `Ctrl` 键。这并不是通用的，但我将从这里开始遵循这一惯例，并在有可能引起混淆的时候加以说明。

如果你在 Vim 中键入长行，你会想把它设置成可以换行。想要根据你的工作方式对 Vim 进行个性化设置，请考虑一下这个设置：默认情况下，你希望 Vim 启动时如何处理文本换行？开还是关？我喜欢将其关闭，并将其留在运行命令文件之外。当我想让文本自动换行时，我只需在命令行模式下用 `:set wrap` 设置即可。

让 Vim 设置为默认情况下自动换行并没有错，这只是一个偏好问题 —— 它可能随着时间的推移而改变。同样你也可以控制粘贴、代码语言缩进语法和 `Tab` 键的设置（制表符还是空格？多少个空格？可也在[这里][9]深入研究这些选项）。所有这些默认行为的选项都是完全可配置和可更改的，并且在你使用命令行模式操作时可以实时更改。

你会在社区论坛、Vim 维基和文章（比如这篇文章）中找到很多关于设置 Vim 默认设置的建议。你应该很熟悉为你的个人计算环境设置首选项，Vim 也不例外。我强烈建议你从对设置进行很小的更改开始，慢慢地进行其它更改，以便你可以轻松地恢复设置。这样一来，你就可以好多年避免使用插件或完全不用插件。

### Vim 8.2 中的分割、标签和终端

有两种方法可以将你正在处理的文件分割成不同的视图：它们可以并排显示，也可以使用应用程序标签页在全屏（窗口）中切换。这些对应用程序窗口的更改是从命令模式启动的，这需要使用冒号（`:`）来调起提示符。

每个分割的窗口可以容纳一个文件进行编辑，你可以通过标签页在更多的文件之间随意切换。分割的屏幕空间有限，所以当你想分割更多的屏幕时，标签页是很方便的。想要如何设置，纯属个人喜好的问题。要水平分割一个窗口，使用 `:sp`，垂直分割时使用 `:vs`。

从 [Vim 8.2][10] 开始，你可以用 `:vert term` 打开一个垂直分割的终端 shell 子进程，以在你的代码旁边的命令行上进行操作。你需要键入 `exit` 来关闭你的终端进程，就像你结束一个 shell 会话一样，但你关闭这个分割的窗口和标签页的方式和关闭任何普通的 Vim 窗口一样，要用 `:q` 来关闭。

要初始化一个标签页，请使用一个特殊的编辑命令：`:tabedit`，它会自动切换到新打开的标签页。如果你给该命令一个文件名作为参数，会打开该文件并进行编辑。如果你忽略了给它一个文件名作为参数，可以在命令行模式下的使用编辑命令 `:e filename.txt`，就像在任何一个普通的 Vim 窗口中一样。可以使用下一个（`:tabn`）和上一个（`:tabp`）命令在标签页间导航。

要使用分割，你需要知道如何使用组合键 `C-w` 和你想要移动的方向的移动键，例如左（`h`）、下（`j`）、左（`k`）、右（`l`）。如果你想学习更多的组合键，请阅读 Vim 手册中的 `:help split` 和 `:help tabpage`。

### 获取帮助

虽然可以在 Vimtutor 中打开参考 Vim 手册，但用 `:help` 打开 Vim 帮助，可以让你自己把时间花在编辑器上，不用完全依赖像这样的文章，就能获得更多的成果。经验是掌握 Vim 的关键。经验有助于提高你的整体计算直觉，因为 Vim 中的很多东西都是从 Unix 宇宙中汲取的。

祝你在探索 Vim 之美的过程中玩得开心，有什么问题可以在评论中分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/vim-skills

作者：[Detlef Johnson][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/deckart
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/keyboaord_enter_writing_documentation.jpg?itok=kKrnXc5h (Computer keyboard typing)
[2]: https://www.vim.org/
[3]: https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
[4]: http://zsh.sourceforge.net/Intro/intro_3.html
[5]: http://vimdoc.sourceforge.net/htmldoc/starting.html#compatible-default
[6]: https://en.wikipedia.org/wiki/There%27s_more_than_one_way_to_do_it
[7]: https://www.npr.org/2020/02/22/808404858/remembering-the-pioneer-behind-your-computers-cut-copy-and-paste-functions
[8]: http://www2.geog.ucl.ac.uk/~plewis/teaching/unix/vimtutor
[9]: https://opensource.com/article/18/9/vi-editor-productivity-powerhouse
[10]: https://www.vim.org/vim-8.2-released.php
