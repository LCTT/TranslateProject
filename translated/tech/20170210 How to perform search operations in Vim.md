超酷的 Vim 搜索技巧
================================

尽管目前我们已经[涉及][8] Vim 的多种特性，但此编辑器的特性集如此庞大，不管我们学习多少，似乎仍然远远不足。承接我们的 Vim 教程系列，本文我们将讨论 Vim 提供的多种搜索技术。

不过在此之前，请注意文中涉及到的所有的例子、命令、指令均是在 Ubuntu 14.04，Vim 7.4 下测试的。

### Vim 中的基础搜索操作

当你在 Vim 中打开一个文件并且想要搜索一个特定的单词或模板，第一步你必须要先按下 `Esc` 键从插入模式中退出（如果你正处于插入模式中）。之后输入 `/` 并紧接着输入你要搜索的单词或搜索模式。

例如，如果你想要搜索的单词是 `linux`，下图显示的就是在 Vim 窗口底部的搜索命令：

[![Search for words in vim](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-basic-search.png) ][9]

敲击回车键之后，你会看到 Vim 会将光标停留在从光标在插入模式中的位置开始，找到的包含此单词的第一行。如果你刚刚打开一个文件并且立即开始了搜索操作，搜索将从文件的首行开始。

如果想要移动到下一处包含被搜索单词位置，按 `n` 键。当你遍历完所有被搜索模板所在之处，继续按 `n` 键 Vim 将重复搜索操作，光标将回到第一次搜索结果出现位置。

[ ![Move to next search hit](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-search-end.png) ][10]

在遍历搜索结果时，如果你想要回到上一匹配处，按 `N` (即 `shift` + `n`)。同时，值得注意的是不管在什么时候，你都可以输入 `ggn` 来跳转到第一个匹配处，或者 `GN` 来跳转到最后一处。

当你恰好在文件的底部，而且想要逆向搜索的情况下，使用 `?` 代替 `/` 来开始搜索。下图是一个例子：

[![search backwards](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-search-back.png)][11]

### 自定义你的搜索

#### 1、 高亮搜索结果

尽管通过 `n` 或 `N` 从被搜索单词或模式的匹配处跳转到另一处很简单，但是如果匹配处能够高亮就更加人性化了。例如，请看下附截图：

[![Search Highlighting in VIM](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-highlight-search.png) ][12]

这可以通过设置 `hlsearch` 变量来实现，例如在普通/命令行模式中执行下述命令：

```
:set hlsearch
```

[![set hlsearch](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-set-hlsearch.png) ][13]

#### 2、使搜索不区分大小写

在 Vim 中进行搜索默认是区分大小写的。这就意味着如果我要搜索 `linux`，那么 `Linux` 是不会匹配的。然而，如果这不是你想要的搜索方式，你可以使用如下命令来使搜索变得不区分大小写：

```
:set ignorecase
```
所以当我设置 `ignorecase` 变量后再使用前边提到的命令，搜索 `linux`，那么 `Linux` 所在处也会被高亮。

[![search case-insensitive](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-search-case.png) ][14]

#### 3、智能大小写搜索

Vim 提供了一个功能，只有当要搜索的单词 / 模板包含大写字母时，编辑器才会区分大小写。要想实现这种功能，必须先设置 `ignorecase`，再接着设置 `smartcase` 变量。

```
:set ignorecase
:set smartcase
```

例如，如果一个文件中既包含 `LINUX` 也包含 `linux`，在开启智能大小写搜索功能时，如果使用 `/LINUX` 进行搜索，只有单词 `LINUX` 处会被搜到。反之，如果搜索 `/linux`，那么不论大小写的搜索结果都会被匹配。

#### 4、递进搜索

就如谷歌一样，随着你输入查询字串（字串随你每输入一个字符不断更新）显示不同的搜索结果，Vim 也同样提供了递进搜索。要想使用这种特性，你必须在搜索前执行下述命令：

```
:set incsearch
```

###  一些很酷的在 Vim 中搜索的小技巧

你可能会发现还有一些其他的与搜索相关的小技巧很有用。

开始吧！如果你想要搜索一个文件中的一个单词，但是又不想输入它，你只需要将你的光标移到这个单词下然后按 `*`  （或者 `shift` + `8`）。如果你想要启动一次部分搜索（例如：同时搜索 `in` 和 `terminal`），那你需要将光标移到到单词（在本例中， `in`）下，然后通过在键盘上按 `g*` （按一次 `g` 然后不断按 `*` ）。

注意：如果你想要逆向搜索，按 `#` 或者 `g#` 。

下一个，只要你想要，你可以获得所有被搜索单词或模式匹配处所在的行和行号的一个列表。这可以在你开始搜索后通过按 `[I` 来实现。如下图是一个列表结果如何在 Vim 窗口底部被分组和显示的例子：

[![grouped search results](https://www.howtoforge.com/images/perform-search-operations-in-vim/vim-results-list.png) ][15]

接下来，你可能已经得知，Vim 默认是环形搜索的，意味着在到达文件结尾处（或者被搜索单词的最后一处匹配）时，如果继续按 “搜索下一个” 会将光标再次带回第一处匹配处。如果你希望禁止环形搜索，可以使用如下命令：

```
:set nowrapscan
```

再次开启环形搜索，使用如下命令即可：

```
:set wrapscan
```

最后，假设你想要对文件中已经存在的单词做一点小小的修改，然后对修改后的单词执行搜索操作，一种方法是输入 `/`  与要搜索的单词。但是如果这个单词又长又复杂，那么可能需要一点时间来输入它。

一个简单的办法是将光标移到你想要略微修改的单词下，按 `/` 之后再按 `Ctrl` + `r` 最后按 `Ctrl` + `w`。这个在光标下的单词不仅仅会被拷贝，也会被复制到 `/` 后，允许你对它进行修改并且继续进行搜索操作。

如果想要获得更多小技巧（包括如何使用鼠标来使在 Vim 中的操作变得简单），请前往 [Vim 官方文档][16]。

### 结语

当然，没有人希望你死记硬背这里提到的所有小技巧。你应该做的是，从一个你认为对你最有益的技巧开始不断练习。当它成为一种习惯并且嵌入你的记忆后，重新来这儿找找你应该开始学习的下一个技巧。

你知道其他像这样的技巧吗？并且希望能够和大家一起分享？那就在下边留言吧！

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/

作者：[Himanshu Arora][a]
译者：[xiaow6](https://github.com/xiaow6)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/
[1]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#-search-highlighting
[2]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#-making-searchnbspcaseinsensitive
[3]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#-smartcase-search
[4]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#-incremental-search
[5]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#customize-your-search
[6]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#some-other-cool-vim-search-tipstricks
[7]:https://www.howtoforge.com/tutorial/perform-search-operations-in-vim/#conclusion
[8]:https://www.howtoforge.com/tutorial/vim-editor-modes-explained/
[9]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-basic-search.png
[10]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-search-end.png
[11]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-search-back.png
[12]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-highlight-search.png
[13]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-set-hlsearch.png
[14]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-search-case.png
[15]:https://www.howtoforge.com/images/perform-search-operations-in-vim/big/vim-results-list.png
[16]:http://vim.wikia.com/wiki/Searching