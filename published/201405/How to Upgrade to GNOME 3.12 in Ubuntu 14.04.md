Ubuntu 14.04下升级GNOME至3.12
================================================================================
![读者可以直接升级GNOME至3.12-但并不建议这么做](http://www.omgubuntu.co.uk/wp-content/uploads/2014/03/Screen-Shot-2014-03-26-at-21.53.58-350x200.png)

**如果您的系统最近已升级至Ubuntu GNOME 14.04 LTS版本，那么拥有稳定独立的GNOME Shell无疑是您最佳的选择**

但我认为比较保守的用户会倾向于选择默认向新手提供的稳定版本。你真想要了解如何在Ubuntu14.04升级GNOME至3.12吗？

好的，接下来我将向你介绍如何完成。首先，我们需要先了解下来龙去脉。

#### 默认采用GNOME 3.10的原因 ####

GNOME 3.12在3月底发布后引发了一阵轰动而天马行空的评论。尽管其上个月发布的版本在Ubuntu 14.04 LTS版本之前已经逐步趋于稳定，却仍不能从14.04包中直接安装，这是为什么呢?

简单来说在开发周期中它出现太晚以至于没有充足的时间来对它进行审查、测试并确保它已经更新至LTS命令发布支持的标准及用户期望。默认至旧版发布的3.10是有意义的，因为有专门的计划来确保测试完整。

所以，正因为这样**不建议升级GNOME至3.12**。

这样清楚了吗？接下来，让我们进入下一个阶段。

### 如何在Ubuntu 14.04升级GNOME至3.12###

#### 确保你正在运行的GNOME版本是3.10 ####

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/gr.jpg)

为确保正确遵循本向导，需要在最新版本的Ubuntu(14.04 LTS)或Ubuntu GNOME下继续操作。如果不是最新版本的话，请停止操作；你需要升级后再继续。如果不这样做，接下来将会有一系列复杂又麻烦的事情需要解决。

若你运行的是Ubuntu常规版本（例如带有Unity），那么需要在开始以下步骤前从Ubuntu软件中心安装GNOME 3.10。

按以下给出的链接选项准备好安装程序。

- [Ubuntu14.04LTS版本下安装GNOME3.10]

#### 增加GNOME 3.12 PPA ####

起初人们预想的是GNOME 3.12将会由标准GNOME Team PPA随着 14.04 LTS 发布。但3个星期过去了，却什么都没有。这是因为一些小的3.10软件包仍然没有跟着发布最新的3.12的包。

然而，[GNOME Team Staging PPA][2]确实涵盖了升级用到的各种3.12版本包。开发者强调说，增加这个存档会让桌面系统‘运行流畅’，但现在包含的包并未‘准备好为大众所使用’。

这儿假设您是一个PPA清理工具的行家，以上的一切都已明了，请继续向下。首先，让我们核对并安装已发布的更新：

    sudo apt-get update && sudo apt-get dist-upgrade

按下回车键后等待安装包程序。

一旦完成此过程或再没有任何挂起的更新，就可以增加 GNOME Team Staging PPA了。为实现这项操作，打开新的命令行窗口输入以下命令：

    sudo add-apt-repository ppa:gnome3-team/gnome3-staging

    sudo apt-get update && sudo apt-get dist-upgrade

升级过程开始前需要输入密码，同时需要注意此过程中命令行提示的信息。如果一切顺利点击‘y’键确认安装。

#### 附加内容 ####

为体验真实的GNOME环境也许你想获取一些新的GNOME应用，例如[Polari IRC客户端、GNOME地图和GNOME网页浏览器][3]。安装这三个应用需要运行如下的命令：

    sudo apt-get install epiphany-browser gnome-maps polari -y

在这些都安装完成之后，你就可以安全的重启了！

### 善后服务 ###

#### 登录 ####

如果你之前使用Unity,Xfce或别的桌面环境，不要忘记登录前从登录界面选择GNOME会话。

#### 回顾 ####

![GNOME Weather & GNOME Maps in 3.12 3.12版GNOME天气&GNOME地图](http://www.omgubuntu.co.uk/wp-content/uploads/2014/04/gnome-aspps.jpg)

对我自己来说，Ubuntu 14.04下运行GNOME 3.12很流畅。升级后没有出现任何诸如性能下降的问题，尽管我确实见到过在打开活动窗口时的奇怪罕见的显示故障，并且在一个应用下发生的间歇性阴影消失现象。但随着错误不断消除这些都不是大问题。

3.12版本的性能等同于GNOME3.10；应用的打开方式交互性强且体验并没有明显下降。

所有新的GNOME影音应用在PPA上并没有现成的包，这让人有点失望。当然有理由解释这点(很可能需要新版本的视频解码器)。此外仍要注意的是一些GNOME扩展包在升级后不能继续工作。

当然3.12因为测试不足，其中存在错误不可避免。若用户要求稳定性（或者希望保持系统工作时的高度统一和完整），可以继续支持已通过测试的GNOME 3.10版本。

### 从GNOME 3.12 降至3.10版本 ###

但是如果想要体验闪闪亮的新功能及最新发布的GNOME应用，那就试一试PPA平台吧。如果遇到了错误可以随时使用PPA清理工具来降级至稳定版本。

    sudo apt-get install ppa-purge

    sudo ppa-purge ppa:gnome3-team/gnome3-staging

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/upgrade-gnome-3-12-ubuntu-14-04

译者：[icybreaker](https://github.com/icybreaker) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:apt:gnome-shell
[2]:https://launchpad.net/~gnome3-team/+archive/gnome3-staging?field.series_filter=trusty
[3]:http://www.omgubuntu.co.uk/2014/03/top-12-features-gnome-3-12
