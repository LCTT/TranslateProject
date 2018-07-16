在Linux下用命令行中玩转音乐库
================================================================================
linux下的命令行可能是对于新手而言最恐怖的经历了。我记得花费若干小时来尝试搞明白终端爆出的错误信息。当然，这是完全值得的！如果现在让我只能挑一个让新手学习学习命令行的原因，那可能就是用命令行来整个管理音乐库。在这个事情上，我喜欢用的软件叫做[cmus][1]，是"C* MUsic Player"(C音乐播放器)的简写，它完全由C写成。

cmus是一个内置了音频播放器的强大的音乐文件管理器。用它的基于ncurses的命令行界面，你可以浏览你的音乐库，并从播放列表或队列中播放音乐，这一切都是在命令行下。

### Linux上安装cmus ###

首先，你需要按照如下建议设置并安装cmus。

在Ubuntu, Debian 或者Linux Mint中:

    $ sudo apt-get install cmus 

在Fedora上，首先[启用RPM Fusion仓库][2]，接着运行:

    $ sudo yum install cmus 

在CentOS上，首先[启用Repoforge仓库][3]，接着运行:

    $ sudo yum install cmus 

在Archlinux上:

    $ sudo pacman -S cmus 

安装完之后，在命令行下如下输入就可运行cums:

    $ cmus 

### 导入音乐文件到 cmus ###

第一件要做的事情是导入你的音乐文件到你的库中。这个过程可以看出两个事情：快捷方式受到了vim的命令模式的启发；还有cmus运行的很快。我已经在20秒之内成功地导入了超过1000首歌！而在iTunes或者其他任何图形音乐库软件下试一下导入，我想你会有足够的时间来做一份花生酱三明治 :>。

要在cmus下面导入音乐，输入下面的像vim一样的命令。

    :a /path/to/your/music/folder

在我的Xubuntu上，我这么做:

    :a /home/adrien/Music/

接下来这个目录下所有的音乐文件会立马按照艺术家或者专辑的方式排列显示。

![](https://farm6.staticflickr.com/5522/14021555743_b3c545702e_z.jpg)

### 快速入门 ###

在开始前，你可能希望记住一些基本快捷方式来开始播放你的音乐。这是cmus的唯一缺点。除非你改变它们，否则默认的快捷方式并不直观，并且你不得不学习它们。简而言之:

- **x** 播放或重播音乐
- **c** 暂停
- **b** 播放下一首音乐
- **z** 播放前一首音乐
- **s** 激活随机播放

记住之后，我们就准备开始了！

### 基本使用 ###

cmus的界面由7个界面组成，你可以按下适当的数字键来访问。比如，启动页面是一个树形界面，你随时可以通过按下“1”来访问。这个界面可以很直观地来使用：通过上下键来导航位于左侧面板的艺术家，按下空格就可以看到特定艺术家的专辑，使用tab键来切换到右侧面板来选择某个歌曲，最后按下回车键来播放音乐。

![](https://farm8.staticflickr.com/7174/13998349312_74c4586d17_z.jpg)

如你所见，底部显示了艺术家的名字，专辑，和正在播放歌曲的标题，还有时间和音量。

第二个界面与第一个刚才显示的类似，显示了按照艺术家排列的歌曲列表。

![](https://farm8.staticflickr.com/7080/13998371701_be03208c2f_z.jpg)

然而，第三个界面更有用些，它显示了目前的播放列表。要在树形视图或者列表视图下增加一首歌曲，只要在选中的歌曲上输入'y'。当你创建了一个完美的歌单之后，用如下的命令行保存下来。

    :save /path/to/playlist

用下面命令加载:

    :load /path/to/playlist

![](https://farm8.staticflickr.com/7385/13978441446_2c10f35507_z.jpg)

第四个界面显示的是队列。队列与播放列表的一点不同是，一旦歌曲是按队列播放的，播放结束后就会被移出队列。要把一首歌加入队列，就像把它加到播放列表一样，但是使用快捷方式："e"

![](https://farm8.staticflickr.com/7201/14001984094_58719269c3_z.jpg)

第五个界面也同样很有用，它是一个轻量级的文件浏览器。当你在你的电脑中查找一首歌曲而不必加入到库中的时候很有用。导航方式也非常标准：用向上或者向下键，回车键用来进入文件夹或者选中一个文件。

![](https://farm6.staticflickr.com/5217/14001984224_785aac0ddb_z.jpg)

第六界面是一个库过滤器，用来动态创建播放列表。如它听上去的那样，过滤器会遍历你的库，并且只显示符合相关规则定义的音乐。之后我会描述如何定义你自己的过滤器，但是cmus已经自带了一些。要试一下，只要使用:

    :filter [name of the filter]

比如:

    :filter classical

除了带有"Classical"标签的音乐，它会隐藏你库中所有的其它音乐。

![](https://farm8.staticflickr.com/7245/14001543625_a508ec9304_z.jpg)

最后但同样重要的，第七个界面是设置。在这里，你可以定义你的快捷方式和命令。我会在下一部分给你一些例子。

![](https://farm6.staticflickr.com/5079/13998371761_df1f9b7fae_z.jpg)

### 高级用法 ###

正如承诺那样，你现在已经更加熟悉界面了，我会给你一些小技巧来增强你的体验。

要在界面中搜索任何东西，只要如vim那样使用相同的快捷方式

    /[keyword]

还有:

    n

来搜索下一处关键字。

要创建一个你的过滤器，使用语法：

    :fset [name of the new filter]=[expression]

比如，你可以找到所有的旧式摇滚音乐:

    :fset oldies=genre="Rock"&date<1970

要了解更多关于你可以使用的表达式，我建议你仔细阅读文档和已有的过滤器。

要重新播放所有的音乐（不过滤），使用如下命令:

    :set replaygain=1

要改变快捷键到不同的键上，进入设置界面并找出现有的绑定表达式。举个例子来说，我想要将播放快捷方式从"x"改到"w",我会翻到下面的行：

    common  x 		player-play

接着按下回车，并改成下面的表达式

    :bind -f common w player-play

总的来说，我真的喜欢cmus。它还有许多本篇中没有提到的技巧，因此在你准备好后，应该认真要读一下[man帮助手册][5]。简而言之，cmus是一款快速的，易于学习，不会乱动你的文件的好软件。如果你喜欢从命令行下管理音乐库的想法，但是还没有成为cmus的忠实粉丝，我建议你可以先试一下一些替代品，如MOC和PyTone，它们同样也很棒。

你认为cmus怎么样？你喜欢它么，或者作为图形界面的替代品？让我在评论区知道你们的想法。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/manage-music-library-command-line-linux.html

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://cmus.github.io/
[2]:http://xmodulo.com/2013/06/how-to-install-rpm-fusion-on-fedora.html
[3]:http://xmodulo.com/2013/01/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
[4]:http://xmodulo.com/go/mp3
[5]:https://github.com/cmus/cmus/blob/master/Doc/cmus.txt
