在Ubuntu14.10/Mint7上安装Gnome Flashback  经典桌面
================================================================================
如果你不喜欢现在的Unity桌面，[Gnome Flashback][1]桌面环境是一个简单的并且很棒的选择，让你能找回曾经经典的桌面。

Gnome Flashback基于GTK3并提供与原先gnome桌面视觉上相似的界面。

 Gnome Flashback的另一个改变是采用了源自mint和xface的MATE桌面，但无论mint还是xface都是基于GTK2的。

### 安装 Gnome Flashback ###

在你的ubuntu上安装以下包即可：

    $ sudo apt-get install gnome-session-flashback

然后注销返回到登录界面，单击密码输入框右上角的徽标型按钮，即可选择桌面环境。可供选择的有Gnome Flashback (Metacity) 会话模式和Gnome Flashback (Compiz)会话模式。

Metacity更轻更快，而Compiz则能带给你更棒的桌面效果。下面是我使用gnome flashback桌面的截图。

桌面采用了elementary OS的壁纸和Plank dock并且移除了底部面板。这些都会在这篇教程中涉及到。

![ubuntu gnome flashback](http://www.binarytides.com/blog/wp-content/uploads/2015/02/ubuntu-gnome-flashback.png)

在安装好gnome flashback桌面以后也许你对效果还不满意，这样你可能需要执行接下来的一系列操作来对它进行微调。

### 1. 安装 Gnome Tweak Tool ###

Gnome Tweak Tool能够帮助你定制比如字体、主题等，这些在Unity桌面的控制中心是十分困难，几乎不可能完成的任务。

    $ sudo apt-get install gnome-tweak-tool

启动按步骤： 应用程序 > 系统工具 > 首选项 > Tweak Tool

### 2. 在面板上添加小应用 ###

默认的右键点击面板是没有效果的。你可以尝试在右键点击面板的同时按住键盘上的Alt+Super (win)键，这样就会出现定制面板的相关选项。

你可以修改或删除面板，并在上面添加些小应用。在这个例子中我们移除了底部面板，并用Plank dock来代替它的位置。

在顶部面板的中间添加一个显示时间的小应用。通过配置使它显示时间和天气。

同样的添加一个工作空间切换器到顶部面板，并创建合适个数的工作空间。

### 3. 将窗口标题栏的按钮右置 ###

在ubuntu中，最小化、最大化和关闭按钮默认是在标题栏左侧的。需要稍作手脚才能让他们乖乖回到右边去。

想让窗口的按钮到右边可以使用下面的命令，这是我在askubuntu上找到的。

    $ gsettings set org.gnome.desktop.wm.preferences button-layout 'menu:minimize,maximize,close'

### 4.安装 Plank dock ###

plank dock位于屏幕底部，用于启动应用和切换打开的窗口。它会在必要的时间隐藏自己，并在需要的时候出现。elementary OS使用的dock就是plank dock。

运行以下命令安装:

    $ sudo add-apt-repository ppa:ricotz/docky -y 
    $ sudo apt-get update 
    $ sudo apt-get install plank -y

现在启动：应用程序 > 附件 > Plank。若想让它开机自动启动，找到 应用程序 > 系统工具 > 首选项 > 启动应用程序 并将“plank”的命令加到列表中。

### 5. 安装 Conky 系统监视器 ###

Conky非常酷，它用系统的中如CPU和内存使用率的统计值来装饰桌面。它不太占资源，并且绝大部分情况下运行都不会有什么问题。

运行如下命令安装:

    $ sudo apt-add-repository -y ppa:teejee2008/ppa
    $ sudo apt-get update
    $ sudo apt-get install conky-manager

现在启动：应用程序 > 附件 > Conky Manager ，选择你想在桌面上显示的部件。Conky Manager同样可以配置到启动项中。

### 6. 安装CCSM ###

如果你更愿意使用Gnome Flashback (Compiz)，那么CCSM将是你配置桌面特效的得力助手。

运行以下命令安装:

    $ sudo apt-get install compizconfig-settings-manager

启动按步骤： 应用程序 > 系统工具 > 首选项 > CompizConfig Settings Manager.


> 在虚拟机中经常会发生compiz会话中装饰窗口消失。可以通过启动Compiz设置，并启用"Copy to texture"插件，注销后重新登录即可。

不过值得一提的是Compiz 会话会比Metacity慢。

--------------------------------------------------------------------------------

via: http://www.binarytides.com/install-gnome-flashback-ubuntu/

作者：[Silver Moon][a]
译者：[martin2011qi](https://github.com/martin2011qi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117145272367995638274/posts
[1]:https://wiki.gnome.org/action/show/Projects/GnomeFlashback?action=show&redirect=GnomeFlashback
