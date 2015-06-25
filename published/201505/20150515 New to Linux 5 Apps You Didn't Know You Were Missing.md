初来乍到Linux? 你需要知道的5款好应用
================================================================================
![](http://cdn.makeuseof.com/wp-content/uploads/2015/05/linux-apps-840x420.jpg?92a7a3)

当你刚刚迈入linux的世界时，你会立马动身开始使用那些知名的浏览器、云客户端、音乐播放器、邮件客户端，也许还有图形编辑器，对吗？可是，你却错过了几个非常重要的生产工具。这里将介绍给你5个应该安装的不容错过的应用。

### [Synergy][1] ###

Synergy 简直就是多桌面用户的福音。这是一个开源软件，它可以让你用一个鼠标和键盘跨越几台电脑、显示器和操作系统。在桌面之间切换鼠标和键盘非常简单，你只要把鼠标从一个桌面的边缘移向另一个桌面即可。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/multiple-monitors-640x431.jpg?92a7a3)

当你第一次打开 Synergy，它会引导你完成设置。你的主桌面就是你将与其它桌面共享输入设备的那个。将主桌面设为服务端，将其它桌面设置为客户端。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/synergy-setup-wizard-640x480.jpg?92a7a3)

Synergy 在互连的各个桌面间维持同一张粘贴板。它也将锁屏功能融合到了一起，例如，你可以跳过锁屏一次登录到所有桌面。你可以在 **Edit 菜单的 Setting** 下调整更多的设置，比如设置密码或者将 Synergy 设置成开机自启动。

（LCTT 译注：这是个[自由而开源][15]的好软件，但是如果你从它的网站下载，由于商业支持的缘故，是需要付费的；当然你可以自己[下载源代码并编译][15]。）

### [BasKet Note Pads][2] ###

从某种意义上来讲，用 BasKet Note Pads，就像把你的大脑刻画进计算机里一样。它把我们不经意间的想法记录下来，然后任由我们去把它们组织起来。你可以在各种任务中用到 BasKet Note Pads，比如记录笔记、制作脑图、记录代办事项、保存链接、管理你的发现、或者追踪项目数据。

在 BasKet Note Pads 中，每个放到一个区域的主要的想法或项目被称作一个篮子（basket）。你可以进一步拆分，成一个或多个子篮或者兄弟篮。篮子进一步分成笔记，这些零零碎碎的笔记组成了一个项目。你可以自由组织它们，给它们打标签，和筛选它们。

该应用的双面板结构的左侧以树形结构显示了你创建的所有篮子。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/basket-note-pads-640x480.jpg?92a7a3)

BasKet Note Pads 第一次用起来可能有点复杂，但是如果你经常用它的话，你会觉得相当顺手。当你暂时不用它时，它会退出到系统托盘，方便你下次快速打开它。

如果在 Linux 上想要一个[更简单的笔记本替代品][3]？可以试试[Springseed][4]。

### [Caffeine（咖啡因）][5]###

你怎样确保你的电脑不会在放一部[精彩的电影][6]中途突然休眠呢？Caffeine 会帮助你解决这个问题。当然，你并不需要为你的电脑泡一杯咖啡。你只需要安装一个轻量级的指示器 —— Caffeine。只要当前你是全屏模式，它就会禁用你的屏幕保护程序、锁屏程序，让你的电脑不会因为没有在任务中而进入睡眠模式。

[点击下载][7]安装最新版本的 Caffeine。如果你想以[PPA的方式][8]安装，使用如下命令：

    $ sudo add-apt-repository ppa:caffeine-developers/ppa
    $ sudo apt-get update
    $ sudo apt-get install caffeine

如果你的Ubuntu版本是14.10或者15.04(或者其它衍生版本)，你还需要安装下面的依赖包：

    $ sudo apt-get install libappindicator3-1 gir1.2-appindicator3-0.1

完成安装以后，将**Caffeine指示器**设置成开机自启动，这样可以使指示器显示在系统托盘里。你可以右键点击托盘图标打开应用的关联菜单，来开启或关闭Caffeine，

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/caffeine-indicator-640x480.jpg?92a7a3)

### Easystroke ###

Easystroke 是一个将[鼠标潜力][9]开发出来的应用。通过一系列的设置，用鼠标、触摸屏、手写笔的手势来完成敲击键盘、执行命令和滚动屏幕等通用操作。在 Easystroke 里能够设置的手势相当多，而且当你看到应用的界面时，你会发现应用的引导非常清晰。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/easystroke-record-640x480.jpg?92a7a3)

选择一个你喜欢的鼠标键开始设置手势。如果你喜欢，你还可以设置辅助功能键。通过Perferences>Behavior>Gesture Button 来设置。现在到**Action**选项卡里面，把你最常用的动作记录成手势吧。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/easytroke-actions-640x480.jpg?92a7a3)

在 Preferences 和 Advanced 选项卡中，你可以做一些其它的调整，比如将 EasyStroke 设置成自动启动，在系统托盘中显示图标，改变滚动速度。

### Guake ###

我把我最喜欢的应用放在最后。Guake 是根据第一人称射击视屏游戏 [Quake][10] 模仿而来的下拉式命令行终端。不管你是否在[学习命令行终端][11]，或者是有一定的基础，Guake 都可以将终端变得更加方便。你可以一键将它呼出，也可以一键将它隐藏。

就像下面这张图，当打开时，Guake 的界面会覆盖在当前的屏幕上。你可以在终端中右键点击，调出 Preference 来改变 Guake 的界面，滚动方式，快捷键等等。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/guake-terminal-640x480.jpg?92a7a3)

如果[你的桌面][12]是 KDE，你可以选择一个类似的工具——[Yakuake][13].

### 写下你最喜欢的Linux新发现！###

还有更多[超级实用的 Linux 应用][14]等待被发现。放心，我们将一直关注，并把它们带到你们的生活中。

哪一个应用是你最喜欢研究的呢？哪一个是你觉得必不可少的呢？在评论里告诉给我们吧。

--------------------------------------------------------------------------------

via: http://www.makeuseof.com/tag/new-linux-5-apps-didnt-know-missing/

作者：[Akshata][a]
译者：[sevenot](https://github.com/sevenot)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.makeuseof.com/tag/author/akshata/
[1]:http://synergy-project.org/
[2]:http://basket.kde.org/
[3]:http://www.makeuseof.com/tag/try-these-3-beautiful-note-taking-apps-that-work-offline/
[4]:http://getspringseed.com/
[5]:https://launchpad.net/caffeine
[6]:http://www.makeuseof.com/tag/popular-apps-movies-according-google/
[7]:http://ppa.launchpad.net/caffeine-developers/ppa/ubuntu/pool/main/c/caffeine/
[8]:http://www.makeuseof.com/tag/ubuntu-ppa-technology-explained/
[9]:http://www.makeuseof.com/tag/4-astounding-linux-mouse-hacks/
[10]:http://en.wikipedia.org/wiki/Quake_%28video_game%29
[11]:http://www.makeuseof.com/tag/4-ways-teach-terminal-commands-linux-si/
[12]:http://www.makeuseof.com/tag/10-top-linux-desktop-environments-available/
[13]:https://yakuake.kde.org/
[14]:http://www.makeuseof.com/tag/linux-treasures-x-sublime-native-linux-apps-will-make-want-switch/
