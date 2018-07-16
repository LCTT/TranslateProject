APP Grid:一个优秀的Ubuntu软件中心替代品
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/app-grid.png)

**Ubuntu软件中心使得查找、安装、购买并管理应用程序更简单，这一点无可否认。**

同样，也无可否认，它离最美的发行版默认自带软件的位置还远着呢。

### App Grid：Ubuntu软件中心替代品 ###

自从2011年的彻底改造后，Ubuntu的旗舰应用商店的界面就没怎么变过。这并不是说它在此期间被完全忽略了，在12.04的开发周期中可以看到已经做了一些[减少打开耗时的工作][1]。

撇开那个不算，Ubuntu软件中心还是一如既往，还有许多潜在功能还没被开发。

App Grid的目标是解决这些问题。从零开始，它要求更快的启动时间，更快的反应时间，而且“不感觉混乱，不让人失望”。

在大部分这些方面，App Grid取得了成功。它几乎可以立即打开，而在界面上点击也确实反应迅速。“不感觉混乱”这一承诺，或许有一点小小的争议。该应用有时候要你横向滚动，而另外的时候，又要你纵向滚动。也有人禁不住会想，如果这个应用能把它的网格背景样式扔了，可能看起来会显得更专业一些。

作为在Ubuntu上筛选应用程序的一个方式，App Grid做出了极大的努力。它支持Ubuntu One上的订购、评级和评论，作为Ubuntu默认应用商店的替代品，它更好用。

如果非要说点什么缺点的话，那就是它不是一个开源的应用程序，第一次运行时会显示以下免责声明：

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/app-grid-prompt.png)

### 安装App Grid ###

App Grid可运行在Ubuntu 12.04 LTS，13.10以及14.04 LTS版本下。可以通过添加以下PPA软件源来安装：

    sudo add-apt-repository -y ppa:appgrid/stable
    sudo apt-get update && sudo apt-get install appgrid

或者，也可以[从项目网站][2]抓取一个.deb安装包来安装。

- [下载用于Ubuntu 14.04的App Grid安装包][3]

试试吧，试过后请发表一下你的看法吧……

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/appgrid-ubuntu-software-centre-alternative

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.omgubuntu.co.uk/2011/10/plans-for-ubuntu-software-centre-plans-in-12-04-get-discussed
[2]:https://launchpad.net/appgrid
[3]:http://ppa.launchpad.net/appgrid/stable/ubuntu/pool/main/a/appgrid/appgrid_0.1.102~trusty_all.deb