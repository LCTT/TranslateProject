在linux桌面上观看2014年巴西世界杯比赛！
================================================================================
足球是世界上受众最广和观众最多的运动，现代足球起源于英国。足球运动员平均每场比赛要跑6个多英里。上届南非世界杯有近10亿的电视观众，而今年的的观赛数量预计还要增加。

2014年第20界世界杯在巴西举行，时间安排为从6月12号开始持续到7月13号，共有32个国家参加这项赛事。

爱足球的小伙子们，我们将要介绍一款可以提供最新的赛况以及你喜欢的球队的进球数信息的应用程序，它叫做“icup 2014 Brazil”。下面让我们介绍它的特点，用法和安装等。

![iCup 2014 Brazil](http://www.tecmint.com/wp-content/uploads/2014/06/Football-World-Cup-2014.jpeg)

*iCup 2014 Brazil*

### 什么是“icup 2014 Brazil” ###

“icup 2014 Brazil”简单的说是一个应用程序，在linux桌面为你提供2014年世界杯的最新比赛赛况。

### “icup 2014 Brazil”的特点###

- 自适应的用户界面，比如自动缩放
- 迅速查看战绩
- 支持Facebook、twitter和Google+社交分享功能
- 支持Retina显示输出
- 实时跟踪比赛结果
- 包括32个国家的国歌小工具配合露天广场效果很不错
- 内置日历和时区工具，实时的显示当天数据，图像化展示最新的战况和得分
- 支持代理


### 平台和框架支持 ###

这款软件可以运行在Mac、windows和linux上，特别提醒，在Linux上，它是为x86的CPU设计的，虽然它也可以在x64的平台上安装，不过我们需要做一下设置。

#### 在不同平台的技术规范 ####

- 实时结果，日历，数据分组，第二阶段整合，社交网络连接和多语言支持，这些支持全平台
- Retina显示支持，这个不支持windows和linux，仅支持Mac OS
- 详细的统计-支持linux。在windows和Mac需要捐赠才行
- 声音小工具-支持MAC和linux，windows不确定

**重要**: 上面的特点都支持，一些具体的特性除了linux外都不是免费提供的，这是为了支付服务器和带宽费用。对于linux用户来说，任何细节不需要关心，高兴的用去吧。

### Linux下安装“icup 2014 Brazil” ###

首先去[“icup 2014 Brazil”官方下载页面][1]下载你电脑平台的软件版本

#### 32位下的安装步骤 ####

    # cd Downloads/
    # tar xvf iCup_2014_FREE-Brazil_1.1_linux.tar.bz2 
    # cd iCup\ 2014\ FREE\ -\ Brazil\ 1.1/
    # chmod 755 iCup\ 2014\ FREE\ -\ Brazil

如上文所说，这个应用程序只为X86架构设计，为了在64位架构下安装32位的软件，我们需要在系统上安装一些软件包：**GTK+2**和**libstdc++.so.6**。

不只是这款软件，一大堆Linux下的软件不支持64位架构，例如**Skype**，我们也需要这样调整我们的系统来安装这些软件。

#### 在64位系统下 ####

安装**GTK+2**和**libstdc++so.6**，用如下apt或者yum命令

    $ sudo apt-get install libgtk2.0-0 libstdc++6 		[在基于Debian系统上执行这个命令]

如果有报错的话，运行下面的命令来解决

    $ sudo apt-get -f install

----------

    # yum install gtk2 libstdc++				[在基于Redhat系统上执行这个命令]

需要的软件包安装完后，就可以在64位系统下安装32位的软件了，进入你的下载目录，找到“**icup 2014 Brazil**”安装包然后执行下面的命令

    # cd Downloads/
    # tar xvf iCup_2014_FREE-Brazil_1.1_linux.tar.bz2 
    # cd iCup\ 2014\ FREE\ -\ Brazil\ 1.1/
    # chmod 755 iCup\ 2014\ FREE\ -\ Brazil

然后，进入软件所在目录，双击可执行文件启动软件。下面的截屏图中看不到所有的信息，**因为本文写作时2014年世界杯现在还没开始呢，开始后我们就能看到结果了**。

![iCup Brazil 2014](http://www.tecmint.com/wp-content/uploads/2014/06/Football-World-Cup-2014-01-620x437.jpeg)

iCup Brazil 2014

无具体信息，世界杯尚未开始。

![Match Detailed Information](http://www.tecmint.com/wp-content/uploads/2014/06/Football-World-Cup-2014-02-620x439.jpeg)

Match Detailed Information

分组和队伍

![Groups and Teams](http://www.tecmint.com/wp-content/uploads/2014/06/Football-World-Cup-2014-03-620x439.jpeg)

Groups and Teams

第二阶段详细信息

![2nd stage Detailed Information](http://www.tecmint.com/wp-content/uploads/2014/06/Football-World-Cup-2014-04-620x438.jpeg)

2nd stage Detailed Information

比赛细节，尚未完整

![Match Summary](http://www.tecmint.com/wp-content/uploads/2014/06/Football-World-Cup-2014-05-620x440.jpeg)

Match Summary

集成语言切换和社交分享按钮

![Language Change](http://www.tecmint.com/wp-content/uploads/2014/06/Football-World-Cup-2014-06-620x440.jpeg)

Language Change

Linux上捐赠是可选的，你可以贡献你的心意。

![Donation](http://www.tecmint.com/wp-content/uploads/2014/06/Football-World-Cup-2014-07-620x435.jpeg)

Donation

### 总结 ###

上面的这个软件有望成为足球粉丝的一大福利，赶快在线试用吧。

好了，我马上又有一个有趣的文章了。请保持关注Tecmint.com。请在评论区对我们的工作给予反馈。


--------------------------------------------------------------------------------

via: http://www.tecmint.com/view-fifa-world-cup-matche-results/

译者：[jiajia9linuxer](https://github.com/jiajia9linuxer) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.e-link.it/icup/brazil2014/icup-brazil-2014-desktop-app.php
