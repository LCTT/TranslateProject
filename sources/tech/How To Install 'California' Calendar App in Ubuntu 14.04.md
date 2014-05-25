Ubuntu 14.04上怎样安装‘California’ 日历应用
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/california-calendar.jpg)

**当非盈利软件安装Yorba时表明它开始用在被称为‘California’的桌面日历应用程序中，在上个月的 那段时间里我们都很兴奋，我们在自己的头条中进行了声明.**

那是非常好的理由，Yorba在背后支撑着用户体验好的电子邮件客户端软件‘Geary’以及照片管理软件‘Shotwell’.期望他们能够自然的成为linux系统的主流软件.

尽管 **California 尚未稳定** 到保证一个正式的发行版本，但现在将公司日常开发的PPA(Personal Package Archives)安装到ubuntu系统中是可使用的.

### 迄今取得的进展 ###

“*Neeeeeyaaaaaaaawwnnn!*” — 那是飞机即将降落在旧金山国际机场的一段警告声音.

是的，California 正在积极的开发中，该软件没有完成，也没有稳定到满足任何人每天使用，但是
如果你能够很聪明的处理一些bug的话，你能够在ubuntu 14.04上安装这款应用程序

是否这样做取决于你的需要.

当前的构建提供了本地管理以及Google 日历和web日历的基本支持. 事件甚至在GNOME桌面
的日期/时间小程序中显示.

#### 自然语言输入 ####

当你第一次打开California 软件时，当月的概要呈现在你的面前，目前还没有-至少我能够找到一种方法
按星期，年，议程去查看. 尽管月份使用导航按钮，然而能够周期性的操作.

通过点击工具栏中的日历图标创建新的日历（*e.g., ‘work‘, ‘pet schedule‘*）及打开/关闭. 当所有的日历都展现在主窗口时，每个日历分配的不同颜色能够带来视觉的区分.

为了创建新的事件，点击‘+’图标, 然后在弹出的输入框中使用**自然语言输入**，输入你想要提交事件的描述. 例如, 输入内容“*Bake Sansa Stark A Lemon Cake on Wednesday 2.45 PM*”将嵌入新的条目在周三的这个时间(14:45).

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/Screen-Shot-2014-05-15-at-21.26.20.png)

我不能等待这个功能变得更加完善。现在，尽管它能够精准定位日期，但不支持经常性事件的创建
（e.g., via “*Skype chat with Sam every Tuesday at 7 AM*“）也不能填写地点或人物（e.g., “*Coffee with Penelope on Monday 12 PM at Boston Tea Party*“）.

为了能够更好的控制，你可以在网格视图上双击它们来完善和编辑创建好条目. 将打开一个包含附加字段、时间选择、日期格式等的窗口.

#### 缺乏光芒 ####

在外观上如果有一些缺陷被发现(这个阶段bugs和遗漏选项应该被忽略). 然而在 Adwaita看来已经很棒了，ubuntu默认主题下它看起来糟透了.

这不是Yorba的错误（或GNOME） 只是Ubuntu开发团队不再增加主题来支持GNOME新的GTK标题栏以及‘光主题’的模式对话框

California 在ubuntu系统上完全可用，恰巧运行在相似软件分发升级失败之后. 这个问题将不影响它们在ubuntu GNOME中的运行或第三方主题的切换


### 在ubuntu14.04中安装California ###

如果你掩饰先前的警告， 我们再次重声：California 尚未稳定，正处于积极的开发中.

这个[Yorba Daily PPA][2] 包含最新(未稳定)的Shotwell和Geary版本. 将这个PPA安装到你的系统中将能够看到这些软件的更新.

    sudo add-apt-repository ppa:yorba/daily-builds
    sudo apt-get update && sudo apt-get install california

可通过一个安全的方法来使用这个应用程序，便是[直接下载来自PPA的.deb安装包][3]:

- [Download California for Ubuntu 14.04 (64bit)][4]
- [Download California for Ubuntu 14.04 (32bit)][5]

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/california-calendar-app-hits-yorba-daily-ppa

译者：[hunanchenxingyu](https://github.com/hunanchenxingyu) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.omgubuntu.co.uk/2014/04/yorba-california-calendar-app-linux
[2]:https://launchpad.net/~yorba/+archive/daily-builds/
[3]:https://launchpad.net/~yorba/+archive/daily-builds/+packages
[4]:https://launchpad.net/~yorba/+archive/daily-builds/+files/california_0.1.0-0%7E188%7Eubuntu14.04.1_amd64.deb
[5]:https://launchpad.net/~yorba/+archive/daily-builds/+files/california_0.1.0-0%7E188%7Eubuntu14.04.1_i386.deb