Linux输入统计神器——WhatPulse
================================================================================
![](http://cdn.linuxaria.com/wp-content/uploads/2014/08/whatpulse.png)

如果，你像我这样，是个对统计数据有着狂热癖好的人，那么你必须在你的计算机上安装这个小应用：[WhatPulse][1]

此软件会追踪用户的击键、鼠标点击以及使用的[带宽][2]和系统开机时间。用户可以周期性地，或者手动上传击键的数量到服务器上，这称之为“脉动”。

用户可以看到他们在所有加入该程序的人的领先选手排行板的所处位置，并且与他们自己国家的人作比较。用户也可以加入团队，在团队中他们可以和有着相同爱好的人作对比（去吧，Linux用户们！！）。

软件分为免费的基础版和高级版，在基础版中你可以查看并检查所有的基本统计数据，而在高级版中你可以看到更多。

该软件可用于Linux，Windows和Mac。

### 在线注册 ###

第一步，你必须在[WhatPulse网站][1]注册帐号，或者也可以在你第一次启动WhatPulse客户端时出现的实用向导中创建帐号，以用于上传自己的统计数据（你也可以使用Facebook的帐号登录）。

你会被提示需要登录，登录之后，你必须找到你的计算机名，这是因为你可以通过该帐号登录到多台计算机，而它们的数据都会上传到同一统计帐号。一旦你登入后，一个小小的W将出现在你的系统托盘中，那就对了，你已搞定！

### 在Linux上安装WhatPulse ###

官方网站在[下载页][3]提供了一个通用版本的.tar.gz归档压缩包（用于32位和64位）和一个debian包。

就我个人而言，我已经在我的Mint Qiana上安装了debian包，在我的Arch Linux[Aur包][4]一点问题都没有。

如果你想要使用通用版本安装，请记住：WhatPulse需要几个库文件。最主要的是QT，因为WhatPulse构建于QT平台。下面列出了软件安装需求：

- libQtCore
- libQtWebKit
- libqt4-sql
- libqt4-sql-sqlite
- openssl-devel (libssl-dev)
- libQtScript

#### 输入统计数据 ####

客户端需要设置相应的权限，以读取键盘/鼠标输入。运行包含的交互脚本.sh来设置这些权限。

#### [网络][5]统计数据 ####

要启用网络测量，你也需要**libpcap**包来允许WhatPulse挂钩到网络通信。如果WhatPulse找不到libpcap，它会运行，但不会显示任何网络统计数据。

![](http://cdn.linuxaria.com/wp-content/uploads/2014/08/heatmap.png)

### 使用应用程序 ###

默认情况下，WhatPulse会在登入图形会话后自动启动。点击系统托盘上的W图标，你将进入总览标签页，这里显示你机器上收集到的所有不同信息的鸟瞰图。例如，安装在你PC上的Linux版本、处理器型号、RAM、GPU、总点击次数、击键和带宽使用。点击这些信息下面的‘Pulse’，它将会上传这些收集到的数据到主服务器上。

也可以选择自动‘Pulse’数据到服务器的时间，如每50.000点击，或者1GB下载量。

要了解深度详情，你可以切换到每个类目的附属标签。例如，Input标签展示给你的是注册后一段时间内的击键的数量和点击次数。时间周期分为每日、每周、每月、每年以及全时。‘all’设置将显示程序安装以来的数据。

在击键下面，你会找到键盘点击热图，它简单地使用冷暖色显示选定周期内各个键的使用状况，如上述截图所示。在图的下面，应用显示了选定周期内记录的点击总量。

在Network标签下，可以查看到日常互联网使用情况。应用程序可以监控所有网络设备的带宽使用量，甚至也可以给你展示按国家分布的带宽使用情况。再次提醒，你可以使用顶部右边的箭头按钮浏览可用的数据。

在网站上，你会看到与客户端上相同的所有统计数据。

免责声明：上面的WhatPulse网站链接包含了我的参考链接，注册时可以使用该链接，这会让我的帐号在某天升级到高级帐号。

--------------------------------------------------------------------------------

via: http://linuxaria.com/recensioni/check-how-much-do-you-type-with-whatpulse-on-linux

作者：[linuxari][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/100563597940685405833?rel=author
[1]:http://whatpulse.org/ref/833872/
[2]:http://linuxaria.com/article/tool-command-line-bandwidth-linux
[3]:http://www.whatpulse.org/downloads/
[4]:https://aur.archlinux.org/packages/whatpulse/
[5]:http://linuxaria.com/tag/network
