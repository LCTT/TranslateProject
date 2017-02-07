Vim 初学者入门指南
============================================================
![](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2012/03/vim-beginner-guide-featured.jpg "Vim 初学者入门指南") 


这篇文章是 [VIM 用户指南][12] 系列文章中的一篇：

*   Vim 初学者入门指南
*   [Vim 快捷键速查表][3]
*   [5 个针对有经验用户的 Vim 技巧][4]
*   [3 个针对高级用户的 Vim 编辑器有用技巧][5]

对一个程序员来说，选择一个文本编辑器是一件非常重要的事。因为不同编辑器之间有着不少的差异：图形界面或者非图形界面、不同的快捷键、不同的编程语言支持、不同的插件以及自定义设置等等。我建议不是去搜索最棒的编辑器，而是去选择最适合你的习惯且最适应你的任务的那一个。假如你打算在一个团体中工作，那么最好和你的共事者选择一样的编辑器。这样的话，一旦你在使用中遇到问题，你就可以去向他们寻求帮助。

这正是我在几年之前开始使用 Vim 的原因。通常来说，Vim 会被置于传说中的 Emacs 的对立面。我承认我对 Emacs 知之甚少，但是对于它俩，你需要知道的是它们都可以被深度定制，并且在初学时也都非常令人困惑。这个教程并不会介绍有关 Vim 的所有内容，而是将介绍一些基础以使你在最初就能正确使用它，随后还会展示一些小技巧，借此（希望能）让你有能力自己去探索学习。

Vim 一词来源于 “VI iMproved”。Vi 是一个被广泛安装于 Unix 系统的非图形界面文本编辑器，并且它也被默认安装在了 Linux 系统中。Vim 是这个原始编辑器的增强版，但是不同于 Vi，并不是每个发行版都默认安装了它。

### 安装

在 Ubuntu 中可以使用如下命令来安装 Vim：

```
sudo apt-get install vim
```

如果你已经对某些插件有了兴趣，使用以下命令：

```
sudo apt-cache search vim
```

这命令将给你输出一个很长的和 Vim 有关的包列表。在这之中，有针对不同编程语言的工具，有插件管理器，等等。

在这系列教程中，我将会在  Ubuntu 上使用最新版的 Vim（7.3.154，LCTT 译注：现在最新版为 8.0）。当然你也可以使用其它任何版本。

### 热身

在终端输入 `vim` 命令，你将会看到一个非常棒的欢迎界面。

 ![vim-welcome](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2012/02/vim-welcome.jpg "vim-welcome") 
 
（LCTT 译注：看到了欢迎界面中那行“Help poor children in Uganda!” 了吗？）

如果你之前从未使用过 Vi 或者 Vim，那么你很可能甚至不知道该怎么退出它... 是的，这是事实。**任何你常用的快捷键在 Vim 中都将失去原有的效果**。（LCTT 译注：网上有个流传的笑话——“如何制造乱码”，“让新手退出 vi”）

首先，要使用任何命令式的功能，像保存（save）或者退出（exit），你都先得输入一个冒号（`:`）。保存是 `:w` 而退出是 `:q`。如果你想不保存文件就退出，那么就要使用强制退出命令 `:q!`。Vim 中非常棒的一点是你不需要分开输入各个命令，换言之，如果你想保存然后退出，你就可以直接使用 `:wq`。

现在，我们退出 Vim 再打开一个文本文件。为此，你只需把想要编辑的文件名加在命令后面即可：

```
vim [文本文件名]
```

 ![vim-file](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2012/02/vim-file.jpg "vim-file") 

一般而言，当你打开一个文本文件，你将会处在查看模式。这使得 Vim 与众不同并且最初会让人感到困惑。Vim 主要由两种模式构成：查看模式和编辑模式。查看模式用于查看内容并且使用一些命令。想要进入编辑模式，只需按 `i` 键进行插入（insert）或者 `a` 键进行添加（add）。想要返回到查看模式或者进行命令式功能的操作，按 `Escape` 键即可。插入（insert）和添加（add）的差异仅仅在于你是想在光标位置之前还是在光标之后进入编辑模式并进行文字输入。要想彻底地明白，你应该亲自去尝试一下。我的建议是：仅在行尾使用添加（add），而在其它时候使用插入（insert）。

（LCTT 译注：此段落中“查看模式”原文是 “visual mode”，疑为“view mode”，在此模式下可以查看文本，但是不能进行编辑；而“visual mode” 是编辑模式的一种，可以按 `v` 键进入，然后就可以用方向键从当前光标位置开始进行选择，并以反白的视觉效果显示，通常选择后可以按 `y` 进行复制、按 `d` 进行剪切等操作。）

要想在文本之中移动光标，你通常可以使用键盘上的方向键，它们无论是在查看模式还是在编辑模式都可以生效。不过，一个真正的纯粹主义者将会告诉你使用按键 `h` 向左，`j` 向下，`k` 向上，`l` 向右来（在查看模式）进行移动。

现在你已经明白了如何和简单地控制 Vim，我们再来更加深入一些。

### 一些简单命令

现在你已经熟悉了在正常模式和插入模式之间进行切换，下面是一些可以在正常模式中使用的命令：

* `x`：删除一个字符
* `u`：撤销一个操作（相当与 `Ctrl+z`）
* `dd`：删除一行内容
* `dw`：删除一个单词
* `yy`：复制一行内容
* `yw`：复制一个单词
* `p`：粘贴一个之前删除或复制的行或者单词
* `e`：跳到下个单词（LCTT 译注：词尾）（比单纯用方向键更快）
* `r`：替换一个字母（按 `r`，松开，然后再按新字母）

当然不止这些，不过这些对现在来说已经足够了。如果你掌握了上面的全部，你将能你很顺溜地使用 Vim 了。

对于那些还想知道更多的人，我再多提一下。你可以在任何这些命令之前加上一个数值，那么这个命令将被重复执行相应的次数。例如，`5x` 将在当前行连续删除 5 个字母，而 `3p` 将会粘贴 3 次。

### 高级命令

最后，作为对你自己继续探索的鼓励和示例，这里给出几个高级且常用的命令：

* `/所搜索的内容`：在文中搜索特定内容
* `:sp 文本文件名`：将屏幕水平分割成上下两半，新文件展示在另一半。想要在两侧切换焦点，可以使用 `Ctrl+w` 快捷键。

	![vim-sp](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2012/02/vim-sp.jpg "vim-sp") 
* `:vsp 文本文件名`：同上，但是是垂直分割屏幕
* `Ctrl+Shift+C` 和 `Ctrl+Shift+V`：在终端中复制和粘贴文本
* `:! 命令名`：在 Vim 中运行 Vim 外的终端命令，直接发送给 shell。例如，`:! ls` 将在不退出编辑器的同时，显示你当前目录内的文件。
	
	![vim-ls](https://maketecheasier-2d0f.kxcdn.com/assets/uploads/2012/02/vim-ls.jpg "vim-ls") 

### 结论

我觉得你现在应该已经有了足够的准备来开始使用 Vim。你还可以通过安装各种插件，编辑 `~.vimrc` 文件，或者在 shell 中输入 `vimtutor` 命令来使用交互式教程以学到更多。

如果你有任何你想分享的关于 Vim 的其它命令，请在评论中告知我们。

--------------------------------------------------------------------------------

via: https://www.maketecheasier.com/start-with-vim-linux/

作者：[Himanshu Arora][a]
译者：[Yinr](https://github.com/Yinr)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.maketecheasier.com/author/himanshu/
[1]:https://www.maketecheasier.com/author/adrienbrochard/
[2]:https://www.maketecheasier.com/start-with-vim-linux/#comments
[3]:https://www.maketecheasier.com/vim-keyboard-shortcuts-cheatsheet/
[4]:https://www.maketecheasier.com/vim-tips-tricks-for-experienced-users/
[5]:https://www.maketecheasier.com/vim-tips-tricks-advanced-users/
[6]:https://www.maketecheasier.com/category/linux-tips/
[7]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Fwww.maketecheasier.com%2Fstart-with-vim-linux%2F
[8]:http://twitter.com/share?url=https%3A%2F%2Fwww.maketecheasier.com%2Fstart-with-vim-linux%2F&text=The+Beginner%26%238217%3Bs+Guide+to+Start+Using+Vim
[9]:mailto:?subject=The%20Beginner%E2%80%99s%20Guide%20to%20Start%20Using%20Vim&body=https%3A%2F%2Fwww.maketecheasier.com%2Fstart-with-vim-linux%2F
[10]:https://www.maketecheasier.com/turn-dropbox-into-a-blogging-tool-with-scriptogram/
[11]:https://www.maketecheasier.com/4-sms-back-up-applications-to-keep-your-messages-safe-android/
[12]:https://www.maketecheasier.com/series/vim-user-guide/
[13]:https://support.google.com/adsense/troubleshooter/1631343
