如何在Ubuntu 14.10 上安装KDE Plasma 5.2
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Plasma_Ubuntu_1410.jpg)

[KDE][1] Plasma 5.2已经[发布][2]一段时间了，在本篇中我们将看到如何在Ubuntu 14.10 上安装KDE Plasma 5.2。

Ubuntu的默认桌面环境Unity很漂亮还有很多特性，但是如果你问任何有经验的Linux用户关于桌面定制能力，他的回答将是KDE。KDE在定制上是王者并且它得到流行大概是由于Ubuntu有官方的KDE版本，也就是Kubuntu[3]。

对于Ubuntu（或者任何其他的Linux系统）而言的一个好消息是它们没有绑定在任何特定的桌面环境上，你可以安装额外的桌面环境并在不同的桌面环境间切换。早先我们已经了解如下的桌面环境的安装。

- [如何在Ubuntu 14.04中安装Mate桌面][4]
- [如何在Ubuntu 14.04中安装Cinnamon桌面][5]
- [如何在Ubuntu 14.04中安装Budgie桌面][6]
- [如何在Ubuntu 14.04中安装Gnome Shell][7]

今天我们要展示如何在Ubuntu 14.10 中如何安装KDE Plasma。

### 如何在Ubuntu 14.10 上安装KDE Plasma 5.2 ###

在Ubuntu 14.10上安装Plasma之前，你要知道这会下载大概1GB的内容。因此在安装KDE之前要考虑速度和数据存放空间。我们下载所使用的PPA是KDE社区官方提供的。在终端中使用下面的命令：

    sudo apt-add-repository ppa:kubuntu-ppa/next-backports
    sudo apt-get update
    sudo apt-get dist-upgrade
    sudo apt-get install kubuntu-plasma5-desktop plasma-workspace-wallpapers

在安装中，我们要选择默认的显示管理器。我选择的是默认的LightDM。安装完成后，重启系统。在登录时，点击登录区域旁边的Ubuntu图标。这里选择Plasma。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Select_Plasma_KDE_Ubuntu.jpeg)

你现在就登录到KDE Plasma了。这里有一个KDE Plasma 5.2在Ubuntu 14.10下的截图：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/KDE_Plasma_Desktop.jpeg)

### 从Ubuntu中卸载KDE Plasma ###

如果你想要卸载它，使用下面的命令从Ubuntu 14.10中卸载KDE Plasma。

    sudo apt-get install ppa-purge
    sudo apt-get remove kubuntu-plasma5-desktop
    sudo ppa-purge ppa:kubuntu-ppa/next

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-kde-plasma-ubuntu-1410/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:https://www.kde.org/
[2]:https://dot.kde.org/2015/01/27/plasma-52-beautiful-and-featureful
[3]:http://www.kubuntu.org/
[4]:http://itsfoss.com/install-mate-desktop-ubuntu-14-04/
[5]:http://itsfoss.com/install-cinnamon-24-ubuntu-1404/
[6]:http://itsfoss.com/install-budgie-desktop-ubuntu-1404/
[7]:http://itsfoss.com/how-to-install-gnome-in-ubuntu-14-04/
