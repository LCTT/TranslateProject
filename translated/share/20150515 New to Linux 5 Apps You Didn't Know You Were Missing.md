sevenot Translating
New to Linux? 5 Apps You Didn’t Know You Were Missing 
初来乍到Linux? 你需要知道的5款好应用。
================================================================================
![](http://cdn.makeuseof.com/wp-content/uploads/2015/05/linux-apps-840x420.jpg?92a7a3)

When you moved to Linux, you went straight for the obvious browsers, cloud clients, music players, email clients, and perhaps image editors, right? As a result, you’ve missed several vital, productive tools. Here’s a roundup of five umissable Linux apps that you really need to install.
当你刚刚迈入linux的世界时，你会立马动身开始使用著名的浏览器，云客户端，音乐播放器，邮件客户端，也许还有图形编辑器，对吗？可是，你却错过了几个非常重要的生产工具。这里将介绍你真的需要安装的5个不可错过的应用。
### [Synergy][1] ###

Synergy is a godsend if you use multiple desktops. It’s an open-source app that allows you to use a single mouse and keyboard across multiple computers, displays, and operating systems. Switching the mouse and keyboard functionality between the desktops is easy. Just move the mouse out the edge of one screen and into another.
Synergy 简直就是多桌面用户的福音。这是一个开源软件，它可以让你用一个鼠标和键盘在数台电脑里面，演示、操作你的系统。在桌面之间切换鼠标和键盘非常简单，你只要把鼠标从一个桌面的边缘移向另一个桌面即可。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/multiple-monitors-640x431.jpg?92a7a3)

When you open Synergy for the first time, it will run you through the setup wizard. The primary desktop is the one whose input devices you’ll be sharing with the other desktops. Configure that as the server. Add the remaining computers as clients.
当你第一次打开Synergy，它会带你进入一个安装引导。你的主显示屏即是你将与其它显示屏共享的输入设备。将主显示屏设为服务端，将其它显示屏设置为客户端。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/synergy-setup-wizard-640x480.jpg?92a7a3)

Synergy maintains a common clipboard across all connected desktops. It also merges the lock screen setup, i.e. you need to bypass the lock screen just once to log in to all the computers together. Under **Edit > Settings**, you can make a few more tweaks such as adding a password and setting Synergy to launch on startup.
Synergy在互连的各个桌面间维持同一张粘贴板，并且包含了锁屏功能，即你可以设置一键将互连的屏幕同时锁屏。你可以在Edit的Setting下调整更多的设置，比如设置密码或者将Synergy设置成开启自启动。
### [BasKet Note Pads][2] ###

Using BasKet Note Pads is somewhat like mapping your brain onto a computer. It helps make sense of all the ideas floating around in your head by allowing you to organize them in digestible chunks. You can use BasKet Note Pads for various tasks such as taking notes, creating idea maps and to-do lists, saving links, managing research, and keeping track of project data.
从某种意义上来讲，用BasKet Note Pads，就像把你的大脑刻画进里计算机一样。它把我们不经意间的想法记录下来，然后任由我们去把他们组织起来。你可以在变化多端的任务中用到BasKet Note Pads，比如记录笔记，制作概念图，记录代办事项，保存链接，管理你的科研，或者追踪程序数据。
Each main idea or project goes into a section called a basket. To split ideas further, you can have one or more sub-baskets or sibling baskets. The baskets are further broken down into notes, which hold all the bits and pieces of a project. You can group them, tag them, and filter them.
在BasKet Note Pads中，每个主要的想法和工程被视作一个工作篮。至顶而下分支出去，你可以有一个或多个工作子篮或者兄弟篮。工作篮进一步分支成笔记，这些零零碎碎的笔记组成了一个工程。你可以自由组织它们，给它们打标签，筛选它们。

The left pane in the application’s two-pane structure displays a tree-like view of all the baskets you have created.
下图即是这款应用的界面，在左边的菜单中，展示了2个你创造的树形结构的工作篮。
![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/basket-note-pads-640x480.jpg?92a7a3)

BasKet Note Pads might seem a little complex on day one, but you’ll get the hang of it soon. When you’re not using it, the app sits in the system tray, ready for quick access.
BasKet Note Pads第一次用起来可能有点复杂，但是如果你经常用它的话，你会觉得相当顺手。当你暂时不用它时，它会退出到系统托盘，方便你下次快速打开它。
Want a [simpler note-taking alternative][3] on Linux? Try [Springseed][4].
想在Linux上简单体验一番，试试Springseeds。
### [Caffeine][5]###

How do you ensure that your computer doesn’t go to sleep right in the middle of an [interesting movie][6]? Caffeine is the answer. No, you don’t need to brew a cup of coffee for your computer. You just need to install a lightweight indicator applet called Caffeine. It prevents the screen-saver, lock screen, or the Sleep mode from being activated when the computer is idle, only if the current window is in full-screen mode.
你怎样确定你的电脑不会在放一部精彩的电影中途突然休眠呢？Caffeine会帮助你解决这个问题。当然，你并不需要为你的电脑泡一杯咖啡。你只需要安装一个轻量级的指示器——Caffeine。只要当前你是全屏模式，它就会禁用你的屏幕保护程序例如锁屏，让你的电脑不会因为没有在任务中而进入睡眠模式。

To install the applet, [download its latest version][7]. If you want to go [the ppa way][8], here’s how you can:
点击下载安装最新版本的Caffeine。如果你想以PPA的方式安装，使用如下命令：

    $ sudo add-apt-repository ppa:caffeine-developers/ppa
    $ sudo apt-get update
    $ sudo apt-get install caffeine

On Ubuntu versions 14.10 and 15.04 (and their derivatives), you’ll also need to install certain dependency packages:
如果你的Ubuntu版本是14.10或者15.04(或者其它衍生版本)，你还需要安装下面的依赖包：
    $ sudo apt-get install libappindicator3-1 gir1.2-appindicator3-0.1

After finishing the installation, add **caffeine-indicator** to your list of startup applications to make the indicator appear in the system tray. You can turn Caffeine’s functionality on and off via the app’s context menu, which pops up when you right-click on the tray icon.
完成安装以后，将Caffeine指示器设置成开机自启动，这样可以使指示器系统托盘里显示。你可以右键点击托盘图标打开应用目录，来开启或关闭Caffeine，

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/caffeine-indicator-640x480.jpg?92a7a3)

### Easystroke ###

Easystroke makes an excellent [Linux mouse hack][9]. Use it to set up a series of customized mouse/touchpad/pen gestures to simulate common actions such as keystrokes, commands, and scrolls. Setting up Easystroke gestures is straightforward enough, thanks to the clear instructions that appear at all the right moments when you’re navigating the UI.
Easystroke是一个将鼠标全力开发出来的应用。通过一系列的设置，用鼠标、触摸屏、手势笔的动作来完成敲击键盘、执行命令和滑动屏幕。在Easystroke里能够设置的动作相当多，而且当你浏览界面时，你会发现应用的引导非常友善。

![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/easystroke-record-640x480.jpg?92a7a3)

Begin by choosing the mouse button you’d like to use for performing gestures. Throw in a modifier if you like. You’ll find this setting under **Preferences > Behavior > Gesture Button**. Now head to the **Actions** tab and record strokes for your most commonly used actions.
从选择一个你喜欢的动作来作为你的鼠标键开始。如果你喜欢，你可以把鼠标设置得更灵敏。通过Perferences>Behavior>Gesture Button来设置。现在把你最常用的键盘动作记录在动作表里吧。
![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/easytroke-actions-640x480.jpg?92a7a3)

Using the **Preferences** and **Advanced** tabs, you can make other tweaks like setting Easystroke to autostart, adding a system tray icon, and changing scroll speed.
在Preferences和Advanced表中，你可以做一些其它的调整，比如将EasyStroke设置成自动启动，在系统托盘中显示图标，改变滑动速度。

### Guake ###

I saved my favorite Linux find for last. Guake is a dropdown command line modeled after the one in the first-person shooter video game [Quake][10]. Whether you’re [learning about terminal commands][11] or executing them on a regular basis, Guake is a great way to keep the terminal handy. You can bring it up or hide it in a single keystroke.
我把我最喜欢的应用放在最后。Guake是根据第一人称射击视屏游戏Quake建模而来的下拉命令行工具。不管你是否在学习命令行终端，或者是有一定的基础，Guake都可以将终端变得更加方便。你可以一键将它弹出，也可以一键将它隐藏。

As you can see in the image below, when in action, Guake appears as an overlay on the current window. Right-click within the terminal to access the **Preferences** section, from where you can change Guake’s appearance, its scroll action, keyboard shortcuts, and more.
就像下面这张图，当在一个应用里时，Guake的界面会覆盖在当前的屏幕上。你可以右键点击终端的Preference来改变Guake的界面，它支持滑动，快捷键等等。
![](http://cdn.makeuseof.com/wp-content/uploads/2015/04/guake-terminal-640x480.jpg?92a7a3)

If KDE is your [Linux desktop of choice][12], do check out [Yakuake][13], which provides a similar functionality.
如果你的桌面是KDE，你可以选择一个类似的工具——Yakuake.
### Name Your Favorite Linux Discovery! ###
写下你最喜欢的Linux新发现！
There are many more [super useful Linux apps][14] waiting to be discovered. Rest assured that we’ll keep introducing you to them.
还有更多超级实用的Linux应用等待被发现。放心，我们将一直关注，并把它们带到你们的生活中。
Which Linux app were you happiest to learn about? Which one do you consider a must-have? Tell us in the comments.
哪一个应用是你最喜欢学习的呢？哪一个是你觉得必不可少的呢？在评论里告诉给我们吧。
--------------------------------------------------------------------------------

via: http://www.makeuseof.com/tag/new-linux-5-apps-didnt-know-missing/

作者：[Akshata][a]
译者：[sevenot](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
