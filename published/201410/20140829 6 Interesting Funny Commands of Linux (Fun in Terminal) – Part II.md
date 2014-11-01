终端中的乐趣：6个有趣的Linux命令行工具
================================================================================
之前, 我们展示了一些有关有趣的 Linux 命令行命令的文章, 这些文章告诉我们, Linux 并不像看起来那样复杂, 如果我们知道如何使用的话, 反而会非常有趣. Linux 命令行可以简洁而完美地执行一些复杂的任务, 并且十分有趣.

- [Linux命令及Linux终端的20个趣事][3]
- [Linux终端的乐趣之把玩字词计数][2]

![Funny Linux Commands](http://www.tecmint.com/wp-content/uploads/2014/08/Funny-Linux-Commands.png)

*有趣的 Linux 命令*

前者包含了20个有趣的 Linux 命令/脚本(和子命令), 得到了读者的高度赞扬. 而另一篇文章虽然没有之前那篇文章那么受欢迎，包含了一些命令/脚本和改进，让你能够玩儿转文本文件、单词和字符串.

这篇文章介绍了一些新的有趣命令和单行脚本，一定会让你感到欣喜.

### 1. pv 命令 ###

你也许曾经看到过电影里的模拟字幕, 它们好像是被实时敲打出来的. 如果我么能在终端里实现这样的效果, 那不是很好?

这是可以做到的. 我们可以安装通过 '**apt**' 或者 '**yum**' 工具在 Linux 系统上安装 '**pv**' 命令. 安装命令如下.

	# yum install pv			[在基于 RedHat 的系统上]

	# sudo apt-get install pv			[在基于 Debian 的系统上]

'**pv**' 命令安装成功之后, 我们尝试运行下面的单行命令在终端查看实时文字输出的效果. 

    $ echo "Tecmint[dot]com is a community of Linux Nerds and Geeks" | pv -qL 10 

![pv command in action](http://www.tecmint.com/wp-content/uploads/2014/08/pv-command.gif)

*正在运行的 pv 命令*

**注意**: '**q**' 选项表示'安静'，没有其他输出信息, '**L**' 选项表示每秒转化的字节数上限. 调整数字的值(必须是整数)可以以另外的方向显示文字效果。

### 2. toilet 命令 ###

用单行脚本命令 '**toilet**' 在终端里显示一个添加边框的文本怎么样呢？同样, 你必须保证 '**toilet**' 已经安装在你的电脑上. 如果没有的话, 请使用 apt 或 yum 安装. (译者注: 'toilet' 并不在 Fedora 的官方仓库里, 你可以从 github 上下载源代码来安装)

    $ while true; do echo “$(date | toilet -f term -F border –Tecmint)”; sleep 1; done

![toilet command in action](http://www.tecmint.com/wp-content/uploads/2014/08/toilet-command.gif)

*正在运行的 toilet 命令*

**注意**: 上面的脚本需要使用 **ctrl+z** 键来暂停.

### 3. rig 命令 ###

这个命令每次生成一个随机的身份信息和地址. 要运行这个命令, 你需要用 apt 或 yum 安装 '**rig**'. (译者注: 'rig' 不在 Fedora 的官方仓库中, 我只在 rpmseek 上找到了 Ubuntu 的 deb 包, 可以使用它来安装.)

    # rig

![rig command in action](http://www.tecmint.com/wp-content/uploads/2014/08/rig-command.gif)

*正在运行的 rig 命令*

### 4. aview 命令 ###

你觉得在终端用 ASCII 格式显示图片怎么样? 我们必须用 apt 或 yum 安装软件包 '**aview**'. (译者注: 'avieww' 不在 Fedora 的官方仓库中, 可以从 aview 的[项目主页][4]上下载源代码来安装. ) 在当前工作目录下有一个名为 '**elephant.jpg**' 的图片, 我想用 ASCII 模式在终端查看.

    $ asciiview elephant.jpg -driver curses 

![aview command in action](http://www.tecmint.com/wp-content/uploads/2014/08/elephant.gif)

*正在运行的 aview 命令*

### 5. xeyes 命令 ###

在上一篇文章中, 我们介绍了 '**oneko**' 命令, 它可以显示一个追随鼠标指针运动的小老鼠. '**xeyes**' 是一个类似的图形程序, 当你运行它, 你可以看见小怪物的两个眼球追随你的鼠标运动.

    $ xeyes

![xeyes command in action](http://www.tecmint.com/wp-content/uploads/2014/08/xeyes.gif)

*正在运行的 xeyes 命令*

### 6. cowsay 命令 ###

你是否还记得上一次我们介绍的这个命令? 它可以显示一段预先确定的文本和一个字符构成的奶牛. 如果你想使用其它动物来代替奶牛怎么办? 查看可用的动物列表:

    $ cowsay -l 

如何用ASCII描绘蛇吞象？

    $ cowsay -f elephant-in-snake Tecmint is Best 

![cowsay command in action](http://www.tecmint.com/wp-content/uploads/2014/08/cowsay.gif)

*正在运行的 cowsay 命令*

换作山羊又会怎样？

    $ cowsay -f gnu Tecmint is Best 

![cowsay goat in action](http://www.tecmint.com/wp-content/uploads/2014/08/cowsay-goat.gif)

*正在运行的 山羊cowsay 命令*

今天就到这里吧. 我将带着另一篇有趣的文章回来. 不要忘记在下面留下您的评论.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-funny-commands/

作者：[Avishek Kumar][a] 
译者：[wangjiezhe](https://github.com/wangjiezhe)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/20-funny-commands-of-linux-or-linux-is-fun-in-terminal/
[2]:http://linux.cn/article-4088-1.html
[3]:http://linux.cn/article-2831-1.html
[4]:http://aa-project.sourceforge.net/aview/
