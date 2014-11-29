
如何从Ubuntu的声音菜单中移除音乐播放器
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/music-players.jpg)


**自从2010年的介绍一来，Ubuntu声音菜单已经被证明是最流行和个性的统一桌面之一.**

随着音乐播放器与音量程序合成小体积的应用程序-即集成，其中一个希望找到与声音相关的蠢事-通过标准接口的灵感。人们不禁要问，为什么其它操作系统没有效仿这种做法！

#### 冗长的 ####


尽管它看起来很方便，但是这个小应用当前存在一个问题：相当多的东西集在一起看起来想一个MP3,是否真正的把想要的东西都放在里面了。虽然有用，但是一个无所不再的应用程序清单已经安装了，这让一些不经常适用的人看着很累赘和反感。


我将要打赌上面的截图看起来一定很熟悉，你们中的很多人一定阅读过吧！不要害怕，**dconf-editor **就在这里。



### 从Ubuntu 声音菜单中移除播放器 ###


#### 第一部分: 基础知识 ####
 
最快速和最简单地从声音菜单中移除播放器的方法就是卸载相关的应用程序。但这是极端的方式，我的意思是指你也许想要保留应用程序，但是不需要它集成。
 
只删除播放器但是保留我们需要的应用程序，我们用到一个看起来令人惊讶的工具叫“dconf-editor”.

你可能已经安装了，如果没有安装的话，那么你从Ubuntu软件中心找出。


- [在Ubuntu中点击安装Dconf-Editor][1]

一旦安装完毕，找到Unity Dash并打开。打开的时候不要惊慌；你不会再回到2002年了，它确实是这样子的。


使用右侧菜单栏，你需要从导航到 com > canonical > indicator > sound.下面的面板将会出现。
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/dconf-editor.jpg)

双击靠近interested-media-players的比括号并删除你希望从声音菜单里移除掉的播放器，但需要保留在方括号中，且不要删除任何你想保留逗号或者撇号。


举个例子，我移除掉这些

‘**rhythmbox.desktop**’, ‘**pithos.desktop**’, ‘**clementine.desktop**’,

这样就好留了一行如下：

    ['tomahawk.desktop']

现在，当我再打开声音菜单时，我只看到Tomahawk:

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/11/music-players-2.jpg)

#### 第二部分：黑名单 ####

等等！还不能关闭dconf-editor。尽管上面的步骤看起来把事情处理得干净利落，但是一些播放器在打开时会立即重新加载到声音菜单。为了避免重复这个过程，将它们添加到**媒体播放器黑名单**中。

记得每个在撇括号里的播放器都用逗号分隔多个条目。他们也必须在方括号内，所以在退出之前请务必仔细检查。

最终结果如下：

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/from-to-.jpg)

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/11/remove-players-ubuntu-sound-menu

作者：[Joey-Elijah Sneddon][a]
译者：[disylee](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:apt://dconf-editor
