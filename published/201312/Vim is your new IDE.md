终端至上！将Vim打造成全新的集成开发环境！
================================================================================
**让GUI都玩儿蛋去！鼠标是你的敌人！只有键盘才是你唯一的朋友！**

如果把Vim和Tmux结合在一起会发生什么？你将拥有完美的编程环境！下面是我多年来珍藏的一些不传之秘，有了这些，你立刻就能轻松打造出属于你的Vim开发环境。

###Tmux相关###

- [Tmux速成班][1]，这个不错，可以让你快速掌握如何开始使用Tmux。
- 这是我的[tmux.conf配置文件][2]，它有一个定制状态栏，可以大大改进颜色主题、优化可读性，里面还有一个必不可少的操作：重设快捷将，因为`Ctrl+b`Vim要用，因此它帮你改为了`Ctrl+a`。
- 其实，[构建优化IDE][3]就像写一个bash脚本一样简单。链接内的例子展示了如何编写一个`.sh`脚本来运行你自己的编程环境。

###Vim插件###

- [Vundle][4]，Vim的插件管理器，用它可以跟踪`.vimrc`文件中的所有插件，还可以进行脚本的一键安装、更新或删除。额，我会告诉你用它还可以直接在Vim里**搜索**插件吗？总之，这个插件扩展绝对是居家旅行、杀人越货之Vim必备佳品。
- [Syntastic][5] 可以检测语法是否正确，写代码的时候要想避免低级错误，这个工具必不可少，它的确能**大大提高**你的代码编写速度。
- [Supertab][6]，这款插件可以帮助你使用`<Tab>`实现自动补全。它会搜索当前文档中的所有字符串，然后给出所有的匹配项建议。对写代码带来的好处不只是提升速度，还可以避免很多拼写错误。如果有兴趣，在本文最后一部分**用户推荐**，有此插件的替代品。
- [Ack][7]，99%的用户会选择用它代替grep。它完美集成在Vim里，用户可以直接用它搜索项目文件，搜索结果则显示在一个独立的窗口里。在本文最后一部分**用户推荐**，也有此插件的替代品。
- [CtrlP][8] 能够极快的模糊搜索全路径文件、缓冲区、“最近使用”（MRU）和标签等等，纯粹用`VimL`写成，专为Vim搜索。
- [NERDTree][9] 可以帮你浏览整个文件系统、打开文件或目录。它以树形结构显示整个文件系统，支持键盘操作和简单的文件系统操作。
- [Sparkup][10]可以帮助你更快的编写HTML代码。支持**类CSS语法**和**完整的HTML扩展**代码。在本文最后一部分**用户推荐**，也有此插件的替代品。

###小贴士###

- [Vimux][11]可以帮你在Vim中与Tmux进行交互。例如在不需要离开Vim的情况下进行测试、编写脚本、建立任务等。
- [《自动安装Vundle》][12]这篇文章介绍了在`.vimrc`配置文件中只需添加几行`VimL`脚本，这样每次你在一个新环境中运行Vim的时候，它就能自动安装Vundle及所有关联包。在你拷贝Vim配置文件到一个新环境或新的服务器时，这是非常有用的。
- [一名开发者的成功故事][13]介绍了他是如何告别他曾经最信任的**MacBook Pro**，并改用iPad + Linode在云上开始开发工作。

###用户推荐###

- [YouCompleteMe][14]，由Reddit用户hnasarat推荐。它安装起来稍微麻烦一些，但是支持非常强大的语法补全，包括C、Ruby、Python、PHP等许多语言。
- [Ag][15]，由*gckjk*推荐，大多数Reddit用户都知道它，这是升级版的`ack`，速度快了3到5倍。它能读取 `.gitignore`和 `.hgignore`，或者`.agignore`，从而忽略一些被版本控制软件所忽略的匹配文件（译注：不加入版本库的文件，我想你大多数时候没有搜索它的意图）。
- [Emmet][16]，由另一个资深reddit用户*damnated*推荐。这是一款`Sparkup`的替代品，可以非常方便快速地用标签标记字符串。链接里有示例演示视频。
- [Unite][17]由网友 basetta推荐，它可以作为前面多个插件的集大成者。你可以用它搜索文件（就像`CtrlP`），搜索文档内容（就像`ack`或`ag`），还可以在下拉历史或缓冲区间进行自由移动和切换。所有这些功能都集成在了这一个插件里，非常方便！

--------------------------------------------------------------------------------

via: http://devcharm.com/pages/18-vim-is-your-new-ide

译者：[Mr小眼儿](http://blog.csdn.net/tinyeyeser) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://robots.thoughtbot.com/a-tmux-crash-course
[2]:https://github.com/vrde/dotfiles/blob/master/.tmux.conf
[3]:https://gist.github.com/vrde/7398199
[4]:https://github.com/gmarik/vundle
[5]:https://github.com/scrooloose/syntastic
[6]:https://github.com/ervandew/supertab
[7]:https://github.com/mileszs/ack.vim
[8]:http://kien.github.io/ctrlp.vim/
[9]:https://github.com/scrooloose/nerdtree
[10]:https://github.com/rstacruz/sparkup
[11]:https://github.com/benmills/vimux
[12]:http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
[13]:http://www.linuxjournal.com/content/swap-your-laptop-ipad-linode
[14]:https://github.com/Valloric/YouCompleteMe
[15]:https://github.com/ggreer/the_silver_searcher
[16]:http://mattn.github.io/emmet-vim/
[17]:https://github.com/Shougo/unite.vim
