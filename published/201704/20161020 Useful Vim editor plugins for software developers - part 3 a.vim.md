开发者的实用 Vim 插件（三）
============================================================

目前为止，在一系列介绍 vim 插件文章中，我们介绍了使用 Pathogen 插件管理包安装基本的 vim 插件，也提及了另外三个插件：[Tagbar、delimitMate](https://linux.cn/article-7901-1.html) 和 [Syntastic](https://linux.cn/article-7909-1.html)。现在，在最后一部分，我们将介绍另一个十分有用的插件 a.vim。

请注意所有本篇教程所提及的例子、命令和指导，它们已经在 Ubuntu 16.04 测试完毕，vim 使用版本为 vim7.4 （LCTT 译注：Ubuntu 16.04 的默认版本）

### A.vim

如果你一直用像 C、C++ 这样的语言进行开发工作，你一定有这样的感触：我特么已经数不清我在头文件和源代码之间切换过多少次了。我想说的是，确实，这个操作十分基本，十分频繁。

尽管使用基于 GUI（图形界面）的 IDE（集成开发环境）非常容易通过鼠标的双击切换文件，但是如果你是资深 vim 粉，习惯用命令工作就有点尴尬了。但是不要害怕，我有秘籍－－插件 a.vim。它可以让你解决尴尬，专治各种文件切换。

在我们介绍这个神器用法之前，我必须强调一点：这个插件的安装过程和我们其他篇介绍的不太一样，步骤如下：

* 首先，你需要下载两个文件（a.vim 和 alternate.txt），你可以在[这里][1]找到它们。
* 接下来，创建如下目录：`~/.vim/bundle/avim`、`~/.vim/bundle/avim/doc`、 `~/.vim/bundle/avim/plugin` 和 `~/.vim/bundle/autoload`。
* 创建好目录之后，将 `a.vim` 放到 `~/.vim/bundle/avim/plugin` 和 `~/.vim/bundle/autoload`，以及将 `alternate.txt`  放到 `~/.vim/bundle/avim/doc`。

就是这样，如果上述步骤被你成功完成，你的系统就会安装好这个插件。

使用这个插件十分简单，你仅仅需要运行这个命令 `:A` 如果目前的文件是源文件（比如 `test.c`），这个神器就会帮你打开 `test.c` 对应的头文件（`test.h`），反之亦然。

当然咯，不是每个文件对应的头文件都存在。这种情况下，如果那你运行 `:A` 命令，神器就会为你新建一个文件。比如，如果 `test.h` 不存在，那么运行此命令就会帮你创建一个 `test.h`，然后打开它。

如果你不想要神器开启此功能，你可以在你的家目录的隐藏文件 `.vimrc` 中写入 `g:alternateNonDefaultAlternate` 变量，并且赋给它一个非零值即可。

还有一种情况也很普遍，你需要打开的文件并非是当前源代码的头文件。比如你目前在 `test.c` 你想打开 `men.h` 这个头文件，那么你可以输入这个命令 `:IH <filename>` ，毋需赘言，你肯定要在后面输入你要打开的的文件名称 `<filename>`。

目前为止，我们讨论的功能都仅限于你当前文件和要操作的文件都在同一个目录去实现。但是，你也知道，我们还有特殊情况，我是说，许多项目中头文件与对应的源文件并不一定在同一目录下。

为了搞定这个问题，你要使用这个 `g:alternateSearchPath` 这个变量。官方文档是这么[解释](https://github.com/csliu/a.vim/blob/master/doc/alternate.txt)的：

> 这个插件可以让用户配置它的搜索源文件和头文件的搜索路径。这个搜索路径可以通过设置 `g:alternateSearchPath` 这个变量的值指定。默认的设定如下：

> ```
> g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc' 
> ```

> 使用这个代码表示神器将搜索 `../source`、`../src`、`../include` 和 `../inc` 下所有与目标文件相关的文件。 `g:alternateSearchPath` 变量的值由前缀和路径组成，每个单元用逗号隔开。 `sfr` 前缀是指后面的路径是相对于目前文件的，`wdr` 前缀是指目录是相对于目前的工作目录， `abs` 是指路径是绝对路径。如果不指定前缀，那么默认为 `sfr`。

如果我们前文所提及的特性就能让你觉得很炫酷，那我不得不告诉你，这才哪跟哪。还有一个十分有用的功能是分割 Vim 屏幕，这样你就可以同时看到头文件和相应的源文件。

哦，还有，你还可以选择垂直或者水平分割。全凭你心意。使用 `:AS` 命令可以水平分割，使用 `:AV` 可以垂直分割。

[
 ![Vim.a vertical split screen](https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers-3/vim-ver-split.png) 
][5]

[
 ![vim.a horizontal split screen](https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers-3/vim-hor-split.png) 
][6]

使用 `:A` 命令在已经打开的文件中切换。

这个插件还可以让你在同一个 Vim 窗口中不同选项卡中打开多个相应的文件，你键入这个命令 `:AT`。

[
 ![tabs in Vim with a.vim.](https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers-3/vim-tab1.png) 
][7]

当然，你可以用这些命令 `:AV`、`:AS` 和 `:AT`，也可以使用这些命令 `:IHV`、`:IHS` 和 `:IHT`。

### 最后

还有许多和编程相关的 Vim 的插件，我们在这个三篇系列主要讨论的是，如果你为你的软件开发工作安装了合适的插件，你就会明白为什么 vim 被叫做编辑器之神。

当然，我们在这只关注编程方面，对于那些把 Vim 当做日常文档编辑器的人来说，你也应该了解一些 Vim 的插件，让你的编辑更好，更高效．我们就改日再谈这个问题吧。

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-3/

作者：[Ansh][a]
译者：[Taylor1024](https://github.com/Taylor1024)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-3/
[1]:http://www.vim.org/scripts/script.php?script_id=31
[2]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers/
[3]:https://www.howtoforge.com/tutorial/vim-editor-plugins-for-software-developers-2-syntastic/
[4]:https://github.com/csliu/a.vim/blob/master/doc/alternate.txt
[5]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers-3/big/vim-ver-split.png
[6]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers-3/big/vim-hor-split.png
[7]:https://www.howtoforge.com/images/vim-editor-plugins-for-software-developers-3/big/vim-tab1.png
