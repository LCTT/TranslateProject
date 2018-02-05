如何在 Vim 中使用模式行进行文件特定的设置
============================================================

虽然[插件][4]毫无疑问是 Vim 最大的优势，然而，还有其它一些功能，使得它成为当今 Linux 用户中最强大、功能最丰富的文本编辑器/IDE 之一。其中一个功能就是可以根据文件做特定的设置。我们可以使用该编辑器的模式行（Modeline）特性来实现该功能。

在这篇文章中，我将讨论如何使用 Vim 的[模式行（Modeline）][5]特性来简单的理解一些例子。

在开始之前，值得提醒一下，这篇教程中提及的所有例子、命令和指令都已经在 Ubuntu 16.04 中使用 Vim 7.4 版本测试过。

### VIM 模式行

#### 用法

正如上面已经提到的， Vim 的模式行特性让你能够进行特定于文件的更改。比如，假设你想把项目中的一个特定文件中的所有制表符用空格替换，并且确保这个更改不会影响到其它所有文件。这是模式行帮助你完成你想做的事情的一个理想情况。

因此，你可以考虑将下面这一行加入文件的开头或结尾来完成这件事。

```
# vim: set expandtab:
```

（LCTT 译注：模式行就是一行以注释符，如 `#`、`//`、`/*` 开头，间隔一个空格，以 `vim:` 关键字触发的设置命令。可参看：http://vim.wikia.com/wiki/Modeline_magic ）

如果你是在 Linux 系统上尝试上面的练习来测试用例，很有可能它将不会像你所期望的那样工作。如果是这样，也不必担心，因为某些情况下，模式行特性需要先激活才能起作用（出于安全原因，在一些系统比如 Debian、Ubuntu、GGentoo 和 OSX 上默认情况下禁用）。

为了启用该特性，打开 `.vimrc` 文件（位于 `home` 目录），然后加入下面一行内容：

```
set modeline
```

现在，无论何时你在该文件输入一个制表符然后保存时（文件中已输入 `expandtab` 模式行命令的前提下），都会被自动转换为空格。

让我们考虑另一个用例。假设在 Vim 中， 制表符默认设置为 4 个空格，但对于某个特殊的文件，你想把它增加到 8 个。对于这种情况，你需要在文件的开头或末尾加上下面这行内容：

```
// vim: noai:ts=8:
```

现在，输入一个制表符，你会看到，空格的数量为 8 个。

你可能已经注意到我刚才说的，这些模式行命令需要加在靠近文件的顶部或底部。如果你好奇为什么是这样，那么理由是该特性以这种方式设计的。下面这一行（来自 Vim 官方文件）将会解释清楚：

> “模式行不能随意放在文件中的任何位置：它需要放在文件中的前几行或最后几行。`modelines` 变量控制 Vim 检查模式行在文件中的确切位置。请查看 `:help modelines` 。默认情况下，设置为 5 行。”

下面是 `:help modelines` 命令（上面提到的）输出的内容：

> 如果 `modeline` 已启用并且 `modelines` 给出了行数，那么便在相应位置查找 `set` 命令。如果 `modeline` 禁用或 `modelines`  设置的行数为 0 则不查找。

尝试把模式行命令置于超出 5 行的范围（距离文件底部和顶部的距离均超过 5 行），你会发现， 制表符将会恢复为 Vim 默认数目的空格 —　在我的情况里是 4 个空格。

然而，你可以按照自己的意愿改变默认行数，只需在你的 `.vimrc` 文件中加入下面一行命令

```
set modelines=[新值]
```

比如，我把值从 5 增加到了 10 。

```
set modelines=10
```

这意味着，现在我可以把模式行命令置于文件前 10 行或最后 10 行的任意位置。

继续，无论何时，当你在编辑一个文件的时候，你可以输入下面的命令（在 Vim 编辑器的命令模式下输入）来查看当前与命令行相关的设置以及它们最新的设置。

```
:verbose set modeline? modelines?
```

比如，在我的例子中，上面的命令产生了如下所示的输出：

```
 modeline
      Last set from ~/.vimrc
 modelines=10
      Last set from ~/.vimrc
```

关于 Vim 的模式行特性，你还需要知道一些重要的点：

*   默认情况下，当 Vim 以非兼容（`nocompatible`）模式运行时该特性是启用的，但需要注意的是，在一些发行版中，出于安全考虑，系统的 `vimrc` 文件禁用了该选项。
*   默认情况下，当以 root 权限编辑文件时，该特性被禁用（如果你是使用 `sudo` 方式打开该文件，那么该特性依旧能够正常工作）。
*   通过 `set` 来设置模式行，其结束于第一个冒号，而非反斜杠。不使用 `set`，则后面的文本都是选项。比如，`/* vim: noai:ts=4:sw=4 */` 是一个无效的模式行。

（LCTT	译注：关于模式行中的 `set`，上述描述指的是：如果用 `set` 来设置，那么当发现第一个 `:` 时，表明选项结束，后面的 `*/` 之类的为了闭合注释而出现的文本均无关；而如果不用 `set` 来设置，那么以 `vim:` 起头的该行所有内容均视作选项。 ）

#### 安全考虑

令人沮丧的是， Vim 的模式行特性可能会造成安全性问题。事实上，在过去，已经报道过多个和模式行相关的问题，包括 [shell 命令注入][6]，[任意命令执行][7]和[无授权访问][8]等。我知道，这些问题发生在很早的一些时候，现在应该已经修复好了，但是，这提醒了我们，模式行特性有可能会被黑客滥用。

### 结论

模式行可能是 Vim 编辑器的一个高级命令，但是它并不难理解。毫无疑问，它的学习曲线会有一些复杂，但是不需多问也知道，该特性是多么的有用。当然，出于安全考虑，在启用并使用该选项前，你需要对自己的选择进行权衡。

你有使用过模式行特性吗？你的体验是什么样的？记得在下面的评论中分享给我们。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/vim-modeline-settings/

作者：[Ansh][a]
译者：[ucasFL](https://github.com/ucasFL)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/vim-modeline-settings/
[1]:https://www.howtoforge.com/tutorial/vim-modeline-settings/#usage
[2]:https://www.howtoforge.com/tutorial/vim-modeline-settings/#vim-modeline
[3]:https://www.howtoforge.com/tutorial/vim-modeline-settings/#conclusion
[4]:https://linux.cn/article-7901-1.html
[5]:http://vim.wikia.com/wiki/Modeline_magic
[6]:https://tools.cisco.com/security/center/viewAlert.x?alertId=13223
[7]:http://usevim.com/2012/03/28/modelines/
[8]:https://tools.cisco.com/security/center/viewAlert.x?alertId=5169
