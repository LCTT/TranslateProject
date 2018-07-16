Linux 中如何打开一个大文本文件
================================================================================
在“大数据”时代，我们会经常遇到有大文本文件（上 GB 或更大）的情况。假设需要我们手工的搜索和编辑这些大文件，或者为了解决一些特定的问题而需要手工分析多个上 GB 的日志文件。传统的文本编辑软件对处理这样的大文件不太有效，当我们试图打开一个大文件时会经常由于内存不足而郁闷的不行。

如果你是一个精明的系统管理员，你也许会用 cat、tail、grep、sed、awk 等这些命令的组合来打开和编辑一个文本文件。在这篇教程里，我将会谈论关于如何**在 Linux 中打开（并编辑）一个大文本文件**的更友好的方式方法。

### Vim 的 LargeFile 插件 ###

Vim文本编辑器拥有大量的插件（或脚本），它们能扩展 VIM 的功能。其中的一个Vim插件是 [LargeFile 插件][1]。

LargeFile 插件可以使大文件更迅速的被加载和编辑，它是通过关闭 VIM 的一些像事件、回退、语法高亮等功能来实现的。

要在 VIM 上安装 LargeFile 插件，首先要确认是否已经安装 VIM。

在 Debian、 Ubuntu 或 Linux Mint 系统中:

    $ sudo apt-get install vim 

在 Fedora、CentOS 或 RHEL 系统中:

    $ sudo yum install vim-enhanced 

可以从 [Vim website][1] 上下载 LargFile 插件，最新版本号是5，下载的文件将会保存为 Vimball 格式（以 .vba 结尾）。

要在你的 home 目录下安装插件，用 VIM 打开 .vba 文件，如下所示。

    $ gunzip LargeFile.vba.gz
    $ vim LargeFile.vba 

在 VIM 窗体上输入 “:so %”，然后按回车键，就可以在你的 home 目录下安装这个插件了。

![](http://farm3.staticflickr.com/2805/11313669824_335e73ebb8_z.jpg)

完成后，输入 “:q” 退出 VIM。

这个插件将会被安装在 ~/.vim/plugin/LargeFile.vim 下。现在可以像平常一样使用 VIM 了。

当在 VIM 中装载一个“大”文件的时候，这个插件起的作用就是关掉事件、回退、语法高亮等功能。默认情况下大于 100MB 的文件就会被插件认为是“大文件”。要改变也个默认设置，你可以编辑 ~/.vimrc 文件（如果不存在就创建一个）。

如要把大文件的标准最小定为 10MB 的话，可以在 ~/.vimrc 中添加

> let g:LargeFile=10

虽然 LargeFile 可以加速文件装载的速度，但 VIM 自身对编辑相当大的文件支持不太好，因为它会一下子把整个文件都加载进内存。例如，用 VIM 装载 1G　大小的文件，它就会占很多内存和交换空间，如下图所示的顶部输出。

![](http://farm6.staticflickr.com/5519/11313640366_0064c698ac_z.jpg)

所以如果你的文件明显大于你 Linux 系统的物理内存的话，就要考虑其它的选择，如下所述。

### glogg 日志资源管理器 ###

如果你只需要查看一个文本文件，并不对它做编辑，可以考虑下　[glogg][2]。它是一款基于图形用户界面的独立日志分析器。这个　glogg　分析器支持通过正则表达式和通配符来对要打开的文本文件进行过滤和筛选，使用户只看到其真正关注的内容。

在 Debian (Wheezy 版本或更高版本)、Ubuntu 或 Linux Mint 系统中安装 glogg :　

    $ sudo apt-get install glogg 

在 Fedora (17 版本或更高版本)　系统中安装 glogg :

    $ sudo yum install glogg 

用 glogg 打开文本文件 :

    $ glogg test.log 

glogg 能很快的打开一个大文本文件。我花了大约 12 秒就打开了一个 1G 的日志文件。

![](http://farm8.staticflickr.com/7354/11313640286_4ebee2b959_z.jpg)

在 "Text" 区域，你可以输入正则表达式，然后点击 "Search" 按纽，它支持表达式大小写敏感搜索以及自动刷新功能。搜索后，在窗体底部会显示出筛选的结果内容。

![](http://farm3.staticflickr.com/2851/11313594455_d57c700c4b_z.jpg)

从装载文件来跟 VIM 对比， glogg　显得更轻量级，在加载完一个 1G 的日志文件后，它仅仅只使用了 83M 的物理内存。

### JOE 文体编辑器 ###

[JOE][3] 是GPL下发布的一个轻量级的基于终端的文本编辑器。JOE 是一款少有的支持大文件的文本编辑器，可以打开和编辑比物理内存大的文件。

此外，JOE支持各种功能强大的文本编辑功能，如非破坏性编辑，用正则表达式搜索和替换，无限次的撤销/重做，语法高亮等。

在 Debian、Ubuntu 或 Linux Mint 系统中安装 JOE:

    $ sudo apt-get install joe 

在 Fedora、CentOS 或 RHEL 系统中安装 JOE:

    $ sudo yum install joe 

要打开编辑文本文件，请运行:

    $ joe test.log 

![](http://farm4.staticflickr.com/3684/11317402126_406058bf78_z.jpg)

相比上面提到的 glogg 来说，用 JOE 加载一个大文本文件会有点卡，加载一个 1G 的文件要用将近 30 秒的时间，不过考虑到要对文件进行全文编辑，这还能忍受。一旦文件加载完成，就可以在相当快捷的终端模式中编辑此文件。

JOE的内存消耗令人印象深刻。加载并编辑一个1GB的文本文件，只花费47MB的物理内存。

![](http://farm4.staticflickr.com/3728/11317483233_2017b5878b_z.jpg)

如果你还知道在 Linux 中打开/编辑大文本文件的其它方法的话，请跟我们分享！

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/12/open-large-text-file-linux.html

译者：[runningwater](https://github.com/runningwater) 校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.vim.org/scripts/script.php?script_id=1506
[2]:http://glogg.bonnefon.org/
[3]:http://joe-editor.sourceforge.net/
