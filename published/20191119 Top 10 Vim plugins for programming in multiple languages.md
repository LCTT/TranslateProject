[#]: collector: "lujun9972"
[#]: translator: "hello-wn"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-11644-1.html"
[#]: subject: "Top 10 Vim plugins for programming in multiple languages"
[#]: via: "https://opensource.com/article/19/11/vim-plugins"
[#]: author: "Maxim Burgerhout https://opensource.com/users/wzzrd"

多语言编程必备的十大 Vim 插件
======

> 使用这 10 个 Vim 插件，可以让你在写代码或运维时，感觉更棒。

![](https://img.linux.net.cn/data/attachment/album/201912/05/062256bnauidfsf7155d1n.jpeg)

我使用 [Vim][2] 文本编辑器大约 20 年了。有一段时间，我一直在定制我的 Vim 配置，但在只有在最近两年我才会使用插件。

最近，当我重新安装系统时（就像我经常做的那样），我觉得这是一次好的机会，我想找出多种编程语言环境下的最佳 Vim 插件，以及如何将这些插件和每种语言结合起来。

有时，我会为特定的语言和配置使用特定的插件（例如，我只在 Ansible 配置中安装 Rocannon），在此不细讲了。不过下面介绍的 10 个 Vim 插件都是我的最爱，无论使用哪种编程语言，我几乎都会使用它们。

### 1、Volt

我的首选并不是一个插件，但是它可以替换类似于 [Vundle][3] 的插件，所以在此介绍。

[Volt][4] 是一个不依存于 Vim 的 Vim 插件管理器。你可以用它安装插件，并创建名为“profile”的插件组合。你可以使用一个简单的命令 `volt profile set myprofile` 启用新的配置。这样我可以做到这样的事情，如为 Python 配置单独启用 [indentpython][5] 插件。Volt 还提供了一种针对每个插件配置的简单方法，这些配置会在“profile”之间共享，因此只需要安装一次插件，就可以在多个“profile”之间使用。

Volt 还是相对较新且不够完美（比如，不管你想要使用多少个“profile”，每个插件只能有一个配置文件），但除此之外，我发现它非常方便、快速和简单。

![Volt plugin][6]

### 2、Vim-Rainbow

除了 Python，几乎所有的主流编程语言都使用括号（小括号、方括号和大括号）。通常，它们会嵌套使用多对括号，因此很难搞清楚某个括号的开闭区间。我发现自己经常要数小括号，尤其是在复杂的 Bash 脚本中，以确保无误。

这时候就需要 [vim-rainbow][7] 插件！它为每对括号设置不同的颜色，因此很容易识别出哪些括号是一对括号。它非常有用而且五彩斑斓。

![vim-rainbow plugin][8]

### 3、lightline

Vim 有很多这种插件，例如 [Powerline][9]，它会在底部栏显示你正在处理的文件、光标所在的文件位置以及文件类型等信息。这些插件各有利弊，在简单比较后，我选择了 [lightline][10]。它相对较小，便于安装和扩展，并且不依赖于其他工具或插件。

![Lightline plugin][11]

### 4、NERDTree

[NERDTree][12] 是一个很经典的插件。在大型项目中，你可能很难找到想要编辑的内容所在文件的确切名称和路径。使用快捷键（我使用的是 `F7`，因为我在 `.vimrc` 中配置了这个快捷键），搜索窗会以垂直分屏的方式打开，就可以轻松找到所需文件并打开它。对于大型项目，这是必备插件。对于那些经常忘记文件名的人也很有用，比如我。

![NERDTree vim plugin][13]

### 5、NERD Commenter

程序员们在写代码时，有时会遇到一些难以调试的问题，导致他们想要注释或不执行某段代码。这时候就需要 [NERD Commenter][14] 出场了。选择代码段，按 `Leader 键 + cc`，代码就会被注释掉。（标准的 Vim Leader 键 是 `/` 字符。）按 `Leader 键 + cn`，取消注释。对于大多数文件类型，NERD Commenter 会自动使用正确的注释符。例如，如果你正在编辑 [BIND 区域文件][15]，并将文件类型设置为 BIND 区域文件，Vim 会正确地使用 `;`（分号）字符进行注释。

![NERD Commenter][16]

### 6、Solarized

我喜欢我的 Vim 主题配色。我也喜欢终端的主题色。我一直在 Vim 上使用 [Solarized][17] 配色，并且将我的终端、文件夹配色和 Vim 设为一致。

但是，有时我会根据周边环境、屏幕亮度以及是否需要分享投屏，来切换明暗模式。

显然，你可以选择自己喜欢的任何配色方案，但我喜欢 `Solarized`，因为它有明暗模式功能，它可以简单快捷地切换两种模式。我的第二个选择是 [Monokai][18]。Volt 插件管理器让我可以轻松地在两者之间切换，因此我在 Python 编程时，使用 Monokai；Bash 编程时，使用 Solarized。

我没有给 Solarized 找相应的图片，因为本文中的所有其他图片都使用了 Solarized 中的浅色或深色效果，可以确认一下这些图片。

### 7、fzf

当寻找一个文件时，有时你想要一个文件浏览器，有时你只想在键盘上敲打出与文件名模糊匹配的内容，对吗？

[fzf][19]（全称 “模糊查找器”）插件提供了这一功能。打出 `:FZF` 并输入文件名内容。不断缩短的列表将显示出与你输入的文件名内容相匹配的一些文件。我经常使用它，最近使用它的频率估计比使用 NERDTree 还多。缺点是这个插件依赖于 `fzf binary`，因此也必须安装这个依赖包。它适用于 Fedora、Debian 和 Arch，据我所知并不在 EPEL 中。

![fzf Vim plugin][20]

### 8、ack

有时，你需要搜索包含特定行或特定单词的文件。我真的很喜欢使用 [ack][21] 插件，最好与 `ag` 结合使用，它俩的组合又被称为 “[silver searcher][22]”。这一组合的速度非常快，覆盖了 `grep` 或 `vimgrep` 的绝大多数使用场景。缺点是你需要安装 `ack` 或 `ag` 才能正常运行。好消息是 Fedora 和 EPEL7 都可以使用 `ag` 和 `ack`。

![ack vim plugin][23]

### 9、gitgutter

大多数 IT 人员都使用 [Git][24] 和 Git 仓库中的文件进行工作。[gitgutter][25] 插件在行号附近添加了一列，通过符号显示该行的状态为：已更改（`~`）、已添加（`+`）或者已删除（`-`）。这有利于跟踪你所做的更改，并且可以使你专注于手头的任务，例如编写补丁来修复一个关键错误。

![gitgutter vim plugin][26]

### 10、Tag List

如果你在一个很大的文件中编写代码，会很容易忘记当前所在的位置，你可能需要上下滚动来查找某个功能。使用 [Tag List][27] 插件，只需要输入 `:Tlist`，就能垂直分屏显示出包含变量、类型、类和函数的代码，你可以轻松跳转到这些变量、类型、类和函数。这个功能对于多语言同样适用，例如 Java、Python 以及任何能够使用 `ctags` 功能的文件类型。

![Tag List vim plugin][28]

以上介绍的 10 个 Vim 插件使我作为系统管理员和兼职程序员的生活变得更轻松。你正在使用哪些 Vim 插件？请在评论中分享你最爱的插件。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/11/vim-plugins

作者：[Maxim Burgerhout][a]
选题：[lujun9972][b]
译者：[hello-wn][c]
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/wzzrd
[b]: https://github.com/lujun9972
[c]: https://github.com/hello-wn
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openstack_python_vim_1.jpg?itok=lHQK5zpm "OpenStack source code (Python) in VIM"
[2]: https://www.vim.org/
[3]: https://github.com/VundleVim/Vundle.vim
[4]: https://github.com/vim-volt/volt
[5]: https://github.com/vim-scripts/indentpython.vim
[6]: https://opensource.com/sites/default/files/uploads/vim-volt.gif "Volt plugin"
[7]: http://github.com/frazrepo/vim-rainbow
[8]: https://opensource.com/sites/default/files/uploads/vim-rainbox.png "vim-rainbow plugin"
[9]: https://github.com/powerline/powerline
[10]: http://github.com/itchyny/lightline.vim
[11]: https://opensource.com/sites/default/files/uploads/lightline.png "Lightline plugin"
[12]: http://github.com/scrooloose/nerdtree
[13]: https://opensource.com/sites/default/files/uploads/nerdtree.gif "NERDTree vim plugin"
[14]: http://github.com/scrooloose/nerdcommenter
[15]: https://en.wikipedia.org/wiki/Zone_file#File_format
[16]: https://opensource.com/sites/default/files/uploads/nerdcommenter.gif "NERD Commenter"
[17]: https://github.com/altercation/vim-colors-solarized
[18]: https://github.com/sickill/vim-monokai
[19]: https://github.com/junegunn/fzf.vim
[20]: https://opensource.com/sites/default/files/uploads/fzf.gif "fzf Vim plugin"
[21]: https://github.com/mileszs/ack.vim
[22]: https://github.com/ggreer/the_silver_searcher
[23]: https://opensource.com/sites/default/files/uploads/ack.gif "ack vim plugin"
[24]: https://opensource.com/resources/what-is-git
[25]: https://github.com/airblade/vim-gitgutter
[26]: https://opensource.com/sites/default/files/uploads/gitgutter.png "gitgutter vim plugin"
[27]: https://github.com/vim-scripts/taglist.vim
[28]: https://opensource.com/sites/default/files/uploads/taglist.gif "Tag List vim plugin) ) ) "
