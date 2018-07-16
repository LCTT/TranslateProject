Ubuntu 14.04上怎样安装‘California’ 日历应用
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/california-calendar.jpg)

**当非盈利软件服务商Yorba宣称它上个月开始开发名为‘California’的桌面日历应用程序时，我们很兴奋——我们在自己的头条里面说“正当其时！”**

Yorba在背后支撑着注重用户体验的电子邮件客户端软件‘Geary’以及华丽的照片管理软件‘Shotwell’，因此，我们自然有理由非常期望他们能够进军linux系统上的生产力软件主流软件。

尽管 **California 尚未稳定** 到可以发布到正式的发行版本，但现在可以通过该公司的日常开发的PPA安装到ubuntu系统中。

### 迄今取得的进展 ###

“*Neeeeeyaaaaaaaawwnnn!*” — 那是飞机即将降落在旧金山国际机场的一段警告声音.

是的，California 正在积极的开发中，该软件尚未完成，也没有稳定到满足每个人每天使用，但是
如果你愿意搞定一些bug的话，你可以在ubuntu 14.04上安装这款应用程序。

是否这样做取决于你的想法。

当前的构建（如，在写本文时的）提供了本地管理以及Google 日历和web日历（.ICS）的基本支持。事件可以甚至在GNOME桌面的日期/时间小程序中显示.

#### 自然语言输入 ####

当你第一次打开California 软件时，呈现在你面前的是当月概要，目前还没有按星期，年，议程去查看的方法，起码我没找到。你可以使用导航按钮而切换月份.

可以通过点击工具栏中的日历图标创建新的日历（*如 ‘工作‘, ‘宠物照料‘*）及打开/关闭它。当所有的日历都展现在主窗口时，每个日历通过不同颜色来视觉区分。

要创建新的事件，点击‘+’图标, 然后在弹出的输入框中使用**自然语言输入**，输入你想要提交事件的描述（译注：显然你得用英语）。例如, 输入内容“*Bake Sansa Stark A Lemon Cake on Wednesday 2.45 PM*”将在周三的这个时间(14:45)加入该事件。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/Screen-Shot-2014-05-15-at-21.26.20.png)

我希望这个功能变得更加完善些。现在，尽管它能够精准定位日期，但不支持重复性事件的创建
（e.g., via “*Skype chat with Sam every Tuesday at 7 AM*“）也不能识别地点或人物（e.g., “*Coffee with Penelope on Monday 12 PM at Boston Tea Party*“）。

要修改正确些，你可以在网格视图上双击它们来完善和编辑创建好条目。这将打开一个包含附加字段、时间选择、日期格式等的窗口。

#### 不够完善 ####

如果说有一些缺陷，那就是在外观上(这个阶段的bugs和欠缺的功能可以被忽略)。虽然在 Adwaita 主题下看来已经很棒了，不过在 Ubuntu 默认主题下它看起来糟透了。

这不是Yorba（或GNOME）的错误，而是Ubuntu开发团队仍然没有在Compiz里面增加对GNOME新的GTK标题栏的支持，现在还在使用 Unity 来渲染窗口。

California 在ubuntu系统上完全可用，这个问题只是在发行版升级之后。 这个问题没有影响到Ubuntu GNOME或Linux Mint。

### 在ubuntu14.04中安装California ###

如果你没注意先前的提醒，我们再次重申：California 尚未稳定，正处于积极的开发中。

这个[Yorba Daily PPA][2] 也包含了最新(未稳定)的Shotwell和Geary版本。将这个PPA安装到你的系统中将能够使这些软件也更新了。

    sudo add-apt-repository ppa:yorba/daily-builds
    sudo apt-get update && sudo apt-get install california

另一个安全试用这个软件的方法是，[直接下载来自PPA的.deb安装包][3]:

- [Download California for Ubuntu 14.04 (64bit)][4]
- [Download California for Ubuntu 14.04 (32bit)][5]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/california-calendar-app-hits-yorba-daily-ppa

译者：[hunanchenxingyu](https://github.com/hunanchenxingyu) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.omgubuntu.co.uk/2014/04/yorba-california-calendar-app-linux
[2]:https://launchpad.net/~yorba/+archive/daily-builds/
[3]:https://launchpad.net/~yorba/+archive/daily-builds/+packages
[4]:https://launchpad.net/~yorba/+archive/daily-builds/+files/california_0.1.0-0%7E188%7Eubuntu14.04.1_amd64.deb
[5]:https://launchpad.net/~yorba/+archive/daily-builds/+files/california_0.1.0-0%7E188%7Eubuntu14.04.1_i386.deb