如何在 Vim 中进行文本选择操作和使用标志
============================================================

基于图形界面的文本或源代码编辑器，提供了一些诸如文本选择的功能。我是想说，可能大多数人不觉得这是一个功能。不过像 Vim 这种基于命令行的编辑器就不是这样。当你仅使用键盘操作 Vim 的时候，就需要学习特定的命令来选择你想要的文本。在这个教程中，我们将详细讨论文本选择这一功能以及 Vim 中的标志功能。

在此之前需要说明的是，本教程中所提到的例子、命令和指令都是在 Ubuntu 16.04 的环境下测试的。Vim 的版本是 7.4。

### Vim 的文本选择功能

我们假设你已经具备了 Vim 编辑器的基本知识（如果没有，可以先阅读[这篇文章][2]）。你应该知道，`d` 命令能够剪切/删除一行内容。如果你想要剪切 3 行的话，可以重复命令 3 次。不过，如果需要剪切 15 行呢？重复 `d` 命令 15 次是个实用的解决方法吗？

显然不是。这种情况下的最佳方法是，选中你想要剪切/删除的行，再运行 `d` 命令。举个例子：

假如我想要剪切/删除下面截图中 INTRODUCTION 小节的第一段：

[![Text edited in VIM](https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/vim-select-example.png)][3]

那么我的做法是：将光标放在第一行的开始，（确保退出了 Insert 模式）按下 `V`（即 `Shift+v`）命令。这时 Vim 会开启视图模式，并选中第一行。

[![Select a line with VIM](https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/vim-select-initiated.png)][4]

现在，我可以使用方向键“下”，来选中整个段落。

[![Select multiple lines with Vim](https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/vim-select-working.png)][5]

这就是我们想要的，对吧！现在只需按 `d` 键，就可以剪切/删除选中的段落了。当然，除了剪切/删除，你可以对选中的文本做任何操作。

这给我们带来了另一个重要的问题：当我们不需要删除整行的时候，该怎么做呢？也就是说，我们刚才讨论的解决方法，仅适用于想要对整行做操作的情况。那么如果我们只想删除段落的前三句话呢？

其实也有相应的命令 - 只需用小写 `v` 来代替大写 `V` 即可。在下面的例子中，我使用 `v` 来选中段落的前三句话：

[![Select the first three sentences in Vim](https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/vim-select-partial-lines.png)][6]

有时候，你需要处理的数据由单独的列组成，你的需求可能是选择特定的一列。考虑下面的截图：

[![Columns in Vom](https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/vim-select-columns.png)][7]

假设我们只需选择文本的第二列，即国家的名字。这种情况下，你可以将光标放在这一列的第一个字母上，按 `Ctrl+v` 一次。然后，按方向键“下”，选中每个国家名字的第一个字母：

[![Select the first char of a column](https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/vim-select-column-1.png)][8]

然后按方向键“右”，选中这一列。

[![Select a whole column in Vim](https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/vim-select-column-2.png)][9]

**小窍门**：如果你之前选中了某个文本块，现在想重新选中那个文本块，只需在命令模式下按 `gv` 即可。

### 使用标志

有时候，你在处理一个很大的文件（例如源代码文件或者一个 shell 脚本），可能想要切换到一个特定的位置，然后再回到刚才所在的行。如果这两行的位置不远，或者你并不常做这类操作，那么这不是什么问题。

但是，如果你需要频繁地在当前位置和一些较远的行之间切换，那么最好的方法就是使用标志。你只需标记当前的位置，然后就能够通过标志名，从文件的任意位置回到当前的位置。

在 Vim 中，我们使用 `m` 命令紧跟一个字母来标记一行（字母表示标志名，可用小写的 `a` - `z`）。例如 `ma`。然后你可以使用命令 `'a` （包括左侧的单引号）回到标志为 `a` 的行。

**小窍门**：你可以使用“单引号” `'` 来跳转到标志行的第一个字符，或使用“反引号” ` 来跳转到标志行的特定列。

Vim 的标志功能还有很多其他的用法。例如，你可以先标记一行，然后将光标移到其他行，运行下面的命令：

```
d'[标志名]
```

来删除当前位置和标志行之间的所有内容。

在 Vim 官方文档中，有一个重要的内容：

> 每个文件有一些由小写字母（`a`-`z`）定义的标志。此外，还存在一些由大写字母（`A`-`Z`）定义的全局标志，它们定义了一个特定文件的某个位置。例如，你可能在同时编辑十个文件，每个文件都可以有标志 `a`，但是只有一个文件能够有标志 `A`。

我们已经讨论了使用小写字母作为 Vim 标志的基本用法，以及它们的便捷之处。下面的这段摘录讲解的足够清晰：

> 由于种种局限性，大写字母标志可能乍一看不如小写字母标志好用，但它可以用作一种快速的文件书签。例如，打开 `.vimrc` 文件，按下 `mV`，然后退出。下次再想要编辑 `.vimrc` 文件的时候，按下 `'V` 就能够打开它。

最后，我们使用 `delmarks` 命令来删除标志。例如：

```
:delmarks a
```

这一命令将从文件中删除一个标志。当然，你也可以删除标志所在的行，这样标志将被自动删除。你可以在 [Vim 文档][11] 中找到关于标志的更多信息。

### 总结

当你开始使用 Vim 作为首选编辑器的时候，类似于这篇教程中提到的功能将会是非常有用的工具，能够节省大量的时间。你得承认，这里介绍的文本选择和标志功能几乎不怎么需要学习，所需要的只是一点练习。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/how-to-use-markers-and-perform-text-selection-in-vim/

作者：[Himanshu Arora][a]
译者：[Cathon](https://github.com/Cathon)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/how-to-use-markers-and-perform-text-selection-in-vim/
[1]:https://www.howtoforge.com/tutorials/shell/
[2]:https://linux.cn/article-8143-1.html
[3]:https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/big/vim-select-example.png
[4]:https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/big/vim-select-initiated.png
[5]:https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/big/vim-select-working.png
[6]:https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/big/vim-select-partial-lines.png
[7]:https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/big/vim-select-columns.png
[8]:https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/big/vim-select-column-1.png
[9]:https://www.howtoforge.com/images/how-to-use-markers-and-perform-text-selection-in-vim/big/vim-select-column-2.png
[10]:http://vim.wikia.com/wiki/Vimrc
[11]:http://vim.wikia.com/wiki/Using_marks
