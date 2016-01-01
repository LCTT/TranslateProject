Linux 下如何安装 Retro Terminal
================================================================================
![Retro Terminal in Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Retro-Terminal-Linux.jpeg)

你有怀旧情节？那就试试 **安装复古终端应用** [cool-retro-term][1] 来一瞥过去的时光吧。顾名思义，`cool-retro-term` 是一个兼具酷炫和怀旧的终端。

你还记得那段遍地都是 CRT 显示器、终端屏幕闪烁不停的时光吗？现在你并不需要穿越到过去来见证那段时光。假如你观看背景设置在上世纪 90 年代的电影，你就可以看到大量带有绿色或黑底白字的显像管显示器。这种极客光环让它们看起来非常酷！

若你已经厌倦了你机器中终端的外表，正寻找某些炫酷且‘新奇’的东西，则 `cool-retro-term` 将会带给你一个复古的终端外表，使你可以重温过去。你也可以改变它的颜色、动画类型并添加一些额外的特效。

下面是不同外观下 `cool-retro-term` 的一些截图：

![Retro Terminal](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Retro-Terminal-Linux-1.jpeg)

![Retro Terminal Linux](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Retro-Terminal-Linux-2.jpeg)

![Vintage Terminal](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/10/Retro-Terminal-Linux-3.jpeg)

### 在基于 Ubuntu 的 Linux 发行版本下安装 cool-retro-term ###

如果想在基于 Ubuntu 的 Linux 发行版本下安装 cool-retro-term，例如 Linux Mint，elementary OS, Linux Lite 等，可以使用下面的 PPA：

    sudo add-apt-repository ppa:noobslab/apps
    sudo apt-get update
    sudo apt-get install cool-retro-term

### 在基于 Arch 的 Linux 发行版本下安装 cool-retro-term ###

若你想在诸如 [Antergos][2] 和 [Manjaro][3] 等基于 Arch 的 Linux 发行版本下安装 cool-retro-term ，则可以使用下面的命令：

    sudo pacman -S cool-retro-term

### 从源代码安装 cool-retro-term  ###

如果你想从源代码安装这个应用，那么首先你需要安装一些依赖。在基于 Ubuntu 的发行版本中，已知的依赖有：

    sudo apt-get install git build-essential qmlscene qt5-qmake qt5-default qtdeclarative5-dev qtdeclarative5-controls-plugin qtdeclarative5-qtquick2-plugin libqt5qml-graphicaleffects qtdeclarative5-dialogs-plugin qtdeclarative5-localstorage-plugin qtdeclarative5-window-plugin

对于其他发行版本，已知的依赖可以在 [cool-retro-term 的 github 页面][4] 中找到。

现在使用下面的命令来编译这个程序吧：

    git clone https://github.com/Swordfish90/cool-retro-term.git
    cd cool-retro-term
    qmake && make

一旦程序编译成功，你就可以使用下面的命令来运行它了：

    ./cool-retro-term

假如你想把这个应用放在程序菜单中以便快速找到，这样你就不用再每次手动地用命令来启动它，则你可以使用下面的命令：

    sudo cp cool-retro-term.desktop /usr/share/applications

在这里你可以学到更多的终端技巧。在 Linux 中享受这个复古的终端吧 ：）

稿件来自： [Abhishek Prakash][5]

--------------------------------------------------------------------------------

via: http://itsfoss.com/cool-retro-term/

作者：[Abhishek Prakash][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:https://github.com/Swordfish90/cool-retro-term
[2]:http://itsfoss.com/tag/antergos/
[3]:https://manjaro.github.io/
[4]:https://github.com/Swordfish90/cool-retro-term
[5]:http://itsfoss.com/author/abhishek/
