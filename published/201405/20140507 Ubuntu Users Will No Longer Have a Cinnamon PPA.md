『我终于失去了你~在拥挤的人群中~』Ubuntu用户即将失去Cinnamon
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/Ubuntu-Users-Will-No-Longer-Have-a-Cinnamon-PPA-443933-2.jpg)

**许多Ubuntu用户过去一直在使用第三方仓库体验Cinnamon而不用安装Linux Mint，然而似乎在不久的将来，不会再有Cinnamon的第三方仓库了**。

如果你在用Ubuntu系统，当前你能够通过添加一个PPA源并安装相应的软件包就可以体验到Cinnamon桌面环境。这让你可以获得像Linux Mint一样的体验，而不用真的去安装它。

不幸的是，该功能即将消失，但不是因为主要维护者不想再继续提供该软件。很显然，Ubuntu仓库将不再保留旧版本的GNOME软件包，而Cinnamon却需要这些包，这让Cinnamon要想通过PPA方式安装，即使可能，也困难重重。

“稳定的PPA源确实不再维护了，而每晚更新的PPA源也只为开发而保留，但不应该用于任何种类的生产机器上（它可能会在任何时候中断）。”

“坦率地说，除了切换到其它支持Cinnamon的版本外，目前我没有其它替代品可以提供给Ubuntu用户。外面有很多这样的版本，我只是希望有人（最终）站到Ubuntu这边来为它的用户提供合适的包。”Gwendal Le Bihan——Cinnamon包的维护者[说][1]。

这意味着，从今往后，只有不稳定的PPA源可用了，但也只是用于测试，用户不应该将该源部署到正式机器上。而不久之后，你要想见见Cinnamon的样子，就只好去安装Linux Mint（或者Arch也行），或者你自己动手编译吧。

如果你仍然想要安装Cinnamon，Ubuntu 14.04 LTS（Trusty Tahr）可以使用不稳定的PPA源。你所要做是在终端下输入一些命令（你需要root权限来做此事）：

    sudo add-apt-repository ppa:gwendal-lebihan-dev/cinnamon-nightly
    sudo apt-get update
    sudo apt-get install cinnamon

安装完成后，你所要做的仅仅是注销系统并从欢迎屏幕选择Cinnamon桌面。

Cinnamon桌面环境是作为GNOME shell的分支开发的，目的在于提供一个简洁而保守的替代品用于替代当前提供的一切。许多用户不满意GNOME、Unity以及KDE的取向而正在寻找那些没有偏移常规太多的桌面。

有可能有别人会构建另外一个提供了所有所需软件包的PPA源，让Cinnamon能在即将发布的Ubuntu 14.10中正常工作，但可能性似乎不大。

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Ubuntu-Users-Will-No-Longer-Have-a-Cinnamon-PPA-443933.shtml

译者：[GOLinux](https://github.com/GOLinux) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://askubuntu.com/questions/94201/how-do-i-install-the-cinnamon-desktop