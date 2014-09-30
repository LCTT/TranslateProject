QuiteRSS: Linux桌面的RSS阅读器
================================================================================
[QuiteRSS][1]是一个免费的[开源][2]RSS/Atome阅读器。它可以在Windows、Linux和Mac上运行。它用C++/QT编写。它有许多的特色功能。

QuiteRSS的界面让我想起Lotus Notes mail，会有很多RSS信息排列在右侧面板上，你可以通过标签分组。点击一个 RSS 条目时，会在下方的面板里面显示该信息。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/09/QuiteRSS_Ubuntu.jpeg)

除了上述功能，它还有一个广告屏蔽器，一个报纸视图，通过URL导入RSS源等众多功能。你可以在[这里][3]查找到完整的功能列表。

### 在 Ubuntu 和 Linux Mint 上安装 QuiteRSS ###

QuiteRSS在Ubuntu 14.04 和 Linux Mint 17中可用。你可以通过以下命令行轻松安装：

    sudo apt-get install quiterss

如果你想安装最新的稳定版本，你可以使用官方的[QuiteRSS PPA][4]:

    sudo add-apt-repository ppa:quiterss/quiterss
    sudo apt-get update
    sudo apt-get install quiterss

上面的命令支持所有基于Ubuntu的发行版，比如Linux Mint, Elementary OS, Linux Lite, Pinguy OS等等。对于其他Linux发行版和平台上,你可以从 [下载页][5]获得源码来安装。

### 卸载 QuiteRSS ###

用下列命令卸载 QuiteRSS：

    sudo apt-get remove quiterss

如果你使用了PPA,你还也应该从源列表中把仓库删除：

    sudo add-apt-repository --remove ppa:quiterss/quiterss

QuiteRSS是一个不错的开源RSS阅读器，尽管我更喜欢[Feedly][6]。不过现在 Feedly 还没有Linux桌面程序，但是你依然可以在网页浏览器中使用。希望你会觉得QuiteRSS值得在桌面Linux一试。

--------------------------------------------------------------------------------

via: http://itsfoss.com/quiterss-rss-reader-desktop-linux/
 
作者：[Abhishek][a]
译者：[2q1w2007](https://github.com/2q1w2007)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://quiterss.org/
[2]:http://itsfoss.com/category/open-source-software/
[3]:http://quiterss.org/en/about
[4]:https://launchpad.net/~quiterss/+archive/ubuntu/quiterss/
[5]:http://quiterss.org/en/download
[6]:http://feedly.com/
