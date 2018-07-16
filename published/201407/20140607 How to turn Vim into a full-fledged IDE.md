如何将Vim打造成一个成熟的IDE
================================================================================

如果你稍微写过一点代码，就能知道“集成开发环境”（IDE）是多么的便利。不管是Java、C还是Python，当IDE会帮你检查语法、后台编译，或者自动导入你需要的库时，写代码就变得容易许多。另外，如果你工作在Linux上，你也会知道Vim在进行文本编辑的时候是多么的方便。所以，你可能会想从Vim中也获取这些IDE特性。

事实上，很少有方法可以帮你做到。有些人可能会想到试着把Vim打造成C语言IDE的，比如[c.vim][1]；也有把Vim集成到Eclipse里的 [Eclim][2] 。但是我想要告诉你的是一个更加通用的，只用插件实现的方案。你肯定不想因为安装了太多的面板和特性而让你的编辑器变得臃肿不堪。只用插件实现的方案可以让你只选择那些你想要集成到Vim的特性。这样做的额外的一个好处是，这个IDE不是专门针对某一种语言的，可以让你写任何类型的代码。下面就来看一下我的 **把IDE特性带进Vim的前10款插件** 吧。

### 先来个福利： Pathogen ###

首先，可能不是所有人都熟悉Vim的插件，并知道该怎么安装这些插件。所以，我推荐的第一个插件就是[Pathogen][3]，因为这个插件会让你更容易安装其他插件。如果你要安装另外的没有在这里列出来的插件，用Pathogen会变得非常简单。它的[官方页面][3]的文档写的非常好，去下载安装一个吧。接下来插件的安装也会变得容易很多。

### 1. SuperTab ###

![](https://c2.staticflickr.com/6/5158/14332189422_34aeb086ed_z.jpg)

我们习惯于IDE的第一个原因就是它的自动补全功能。所以，我喜欢这个非常方便的，给了Tab键“超能力”的 [SuperTab][5] 插件。

### 2. Syntastic ###

![](https://farm4.staticflickr.com/3894/14354095583_ce9b112b97_z.jpg)

如果你需要使用一种以上的语言进行编程，有时候是非常容易混淆不同语言之间的语法的。幸运的是，[syntastic][6] 会帮你检查，然后告诉你是否应该加上圆括号或者方括号，或者告诉你在某个地方，你忘了一个分号。

### 3. Auto Pairs ###

另外一件让程序员们抓狂的事是：我是不是少加了最后一个括号？！每个人都讨厌用手指去数那些隔的非常远的括号。为了处理这个问题，我用 [Auto Pairs][7] 插件，这个插件会自动插入和格式化方括号和圆括号。

### 4. NERD Commenter ###

如果你在找一个可以支持多种程序语言的注释代码的快捷键，你可以试试 [NERD Commenter][8]。即使你不是程序员，我也非常非常推荐这款插件，因为它会让你在注释bash脚本或者其他任何东西的时候都会变得非常高效。

### 5. Snipmate ###

任何一个程序员都知道，好的码农写代码，杰出的码神重用代码。[snipmate][9]可以容易的插入代码片段到你的文件里面，大大的减少了你敲键盘的次数。它默认的包含了很多各种语言的代码片段，你也可以非常容易的添加你自己的。

### 6. NERDTree ###

![](https://farm4.staticflickr.com/3899/14332189462_d66b71cf7c_z.jpg)

管理一个大的项目时，把代码分散到不同的文件里面是非常好的主意。也是一个基本的编码原则。[NERDTree][10] 是一个不错的可以直接在Vim里使用的文件浏览器，它可以让你随时想到所有的文件。

### 7. MiniBufferExplorer ###

![](https://farm4.staticflickr.com/3904/14332189492_209a3ee2dc_z.jpg)

为了打造一个文件浏览器，支持同时打开多个文件，没有什么比一个好的缓冲区管理器更重要了。[MiniBufferExplorer][11] 就可以非常漂亮和高效地完成这个工作。它甚至为你的缓冲区设置了不同的颜色和切换快捷键。

### 8. Tag List ###

![](https://farm4.staticflickr.com/3889/14147244138_c04731826a_z.jpg)

当你同时有多个文件打开时，很容易忘了你都在这些文件里添加了什么。为了防止你忘记，[Tag List][12] 这个代码查看器将会用一种漂亮简洁的格式展示其中的的变量和函数。

### 9. undotree ###

![](https://farm3.staticflickr.com/2913/14354095453_8bb87a3e31_z.jpg)

对于我们之中那些喜欢undo，redo然后又undo某些更改，然后依据这些来查看整个编辑完成过程的人来说， [undotree][13] 是一个不错插件，可以以一棵树的形式看到你的undo和redo历史。这个功能跟代码完全没有关系，所以这是我非常喜欢的一个插件。

### 10. gdbmgr ###

最后，但并非不重要，每个人都在某个时刻需要一个调试器。如果你喜欢gdb，那么[gbdmgr][14]就是为你准备的，因为它集成了那个著名的调试器到Vim中。

总结一下，不管你是不是一个疯狂的coder，能有一些额外的Vim功能在手总是非常方便的。像我在简介里说到的，如果你不需要，你不用安装这里所有的这些插件。或者你想要安装另外的也行，这些其实只是一个基础入门级的插件。

你在用Vim的什么插件？或者你想完善这个前10列表么？请在评论里告诉我们吧。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/turn-vim-full-fledged-ide.html

译者：[love\_daisy\_love](https://github.com/CNprober) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.vim.org/scripts/script.php?script_id=213
[2]:http://eclim.org/
[3]:https://github.com/tpope/vim-pathogen
[4]:https://www.flickr.com/photos/xmodulo/14332189422/
[5]:https://github.com/ervandew/supertab
[6]:https://github.com/scrooloose/syntastic
[7]:https://github.com/jiangmiao/auto-pairs
[8]:https://github.com/scrooloose/nerdcommenter
[9]:https://github.com/garbas/vim-snipmate
[10]:https://github.com/scrooloose/nerdtree
[11]:http://www.vim.org/scripts/script.php?script_id=159
[12]:http://www.vim.org/scripts/script.php?script_id=273
[13]:https://github.com/mbbill/undotree
[14]:http://vim.sourceforge.net/scripts/script.php?script_id=4104