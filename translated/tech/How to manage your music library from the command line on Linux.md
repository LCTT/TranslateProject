如何在Linux的命令行中管理你的音乐库
================================================================================
linux下的命令行可能是对于新手而言最恐怖的经历了。我记得花费数天的时间来尝试解码终端中错误信息。然而，这是完全值得的。如果我如今让我说只说一个让新手学习学习命令行的原因，，那可能是完全可以在命令行中管理音乐库。我喜欢用的软件是[cmus][1]，是"C* MUsic Player"(C音乐播放器)的简写，由于它完全由C写成。

cmus是一个强力的内置音频播放器的音乐文件管理器。使用它基于ncurses的命令行界面，你可以浏览你的音乐库，并从播放列表或队列中播放音乐，这一切都在命令行下。

### Linux上安装cmus ###

首先，你需要如下设置并安装cmus。

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

### 导入 [音乐文件][4] 到 cmus ###

第一件要做的事情是导入你的音乐文件到你的库中。这个过程马上揭露了两件事情：快捷方式是受到了vim的启发，还有cmus运行的很快。我已经在20秒之内成功地导入了超过1000首歌！ 在iTunes或者其他任何图形音乐库软件下试一下，你就会有足够的时间来做一份花生酱三明治。

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

掌握完后，你应该已经准备好开始了！

### 基本使用 ###

cmus的界面由7个标签组成，你可以按下适当的数字键来访问。比如，启动页面是一个树形标签界面，你随时可以通过按下1来访问。这个标签可以很直观地来使用：通过上下键来导航位于左侧面板的艺术家，按下空格就可以看到特定艺术家的专辑，使用tab键来切换到右侧面板来选择独立的歌曲，最后按下回车键来播放音乐。

![](https://farm8.staticflickr.com/7174/13998349312_74c4586d17_z.jpg)

如你所见，底部显示了艺术家的名字，专辑，和正在播放歌曲的标题，还有时间和音量。

第二个标签与第一个刚才显示的类似，显示了按照艺术家排列的歌曲列表。

![](https://farm8.staticflickr.com/7080/13998371701_be03208c2f_z.jpg)

然而，第三个标签更加有趣，因为他显示了目前的播放列表。要在树形视图或者列表视图下增加一首歌曲，只要在选中的歌曲上输入'y'。一旦创建完成后，用命令行保存下来。

    :save /path/to/playlist

用下面命令加载:

    :load /path/to/playlist

![](https://farm8.staticflickr.com/7385/13978441446_2c10f35507_z.jpg)

第四个标签显示的是队列。队列与播放列表的一点不同是，一旦歌曲是按队列播放的，播放结束后就会被移出队列。要把一首歌加入队列，就像把它加到播放列表一样，但是使用快捷方式："e"

![](https://farm8.staticflickr.com/7201/14001984094_58719269c3_z.jpg)

第五个标签也同样很有趣，因为它是一个轻量级的文件浏览器。当你在你的电脑中查找一首歌曲而不必加入到库中的时候很有用。导航方式也非常标准：用向上或者向下键，回车键用来进入文件夹或者选中一个文件。

![](https://farm6.staticflickr.com/5217/14001984224_785aac0ddb_z.jpg)

第六标签是一个库过滤器，用来动态创建播放列表。如它听上去的那样，过滤器会遍历你的库，并且只显示符合相关规则定义的音乐。之后我会描述定义你自己的过滤器，但是cmus已经自带了一些。要试一下，只要使用:

    :filter [name of the filter]

比如:

    :filter classical

除了"Classical"标签的音乐，它会隐藏你库中所有的音乐。

![](https://farm8.staticflickr.com/7245/14001543625_a508ec9304_z.jpg)

最后但同样重要的，第七个标签是设置。在这里，你可以定义你的快捷方式和命令。我会在下一部分给你一些例子。

![](https://farm6.staticflickr.com/5079/13998371761_df1f9b7fae_z.jpg)

### 高级用法 ###

正如承诺那样，你现在已经更加熟悉界面了，我会给你一些贴士来增强你的体验。

要在标签中搜索任何东西，只要如vim那样使用相同的快捷方式

    /[keyword]

还有:

    n

来搜索下一处关键字。

要创建一个你的过滤器，使用语法：

    :fset [name of the new filter]=[expression]

比如，你可以找到所有的老的摇滚音乐:

    :fset oldies=genre="Rock"&date<1970

要了解更多关于你可以使用的表达式，我邀请你更多地在文档中挖掘已有的过滤器。

要激活重新播放所有的音乐，使用如下命令:

    :set replaygain=1

要改变快捷方式到不同的键上，进入设置标签并找出现有的绑定表达式。举个例子来说，我想要将播放快捷方式从"x"改到"w",我会翻到下面的行：

    common  x 		player-play

接着按下回车，并改成下面的表达式

    :bind -f common w player-stop

总的来说，我真的喜欢cmus。它还有许多本篇中没有提到的技巧，因此在你准备好后，应该认真要读一下[man帮组手册][5]。简而言之，cmus是一款快速，易于学习，尊重你的文件的软件。如果你喜欢从命令行下管理音乐库的想法，但是还没对cmus深信不疑，我邀请你先试一下一些替代品，如MOC和PyTone，它们同样也很棒。

你认为cmus怎么样？你喜欢它么，或者作为GUI的替代品？让我在评论区知道你们的想法。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/manage-music-library-command-line-linux.html

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://cmus.github.io/
[2]:http://xmodulo.com/2013/06/how-to-install-rpm-fusion-on-fedora.html
[3]:http://xmodulo.com/2013/01/how-to-set-up-rpmforge-repoforge-repository-on-centos.html
[4]:http://xmodulo.com/go/mp3
[5]:https://github.com/cmus/cmus/blob/master/Doc/cmus.txt
