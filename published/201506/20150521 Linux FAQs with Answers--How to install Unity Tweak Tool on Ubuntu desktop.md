Linux 有问必答：如何在桌面版 Ubuntu 中安装 Unity Tweak Tool
================================================================================
> **问题**: 我试着给刚安装的桌面版 Ubuntu 自定制桌面。我想使用 Unity Tweak Tool。我怎样才能在 Ubuntu 上安装 Unity Tweak Tool 呢？

[Unity Tweak Tool][1] 是个流行的 Unity 桌面自定制工具。顾名思义，该工具只适用于 Ubuntu 的默认桌面环境(例如，基于 Unity 的 GNOME 桌面)。这个多功能的工具允许你通过非常直观和简单易用的图形用户界面自定义多种 Unity 桌面特性。它的菜单看起来类似于 Ubuntu 的官方系统设置，但它的桌面自定制能力远远超过默认的系统设置。通过使用 Unity Tweak Tool，你可以自定制外观、行为以及很多桌面组件的配置，例如工作区、窗口、图标、主题、光标、字体、滑动、热键等等。如果你是 Unity 桌面用户，Unity Tweak Tool 一定是个必不可少的应用程序。

![](https://farm6.staticflickr.com/5463/17684020389_25dc7f0db2_b.jpg)

尽管 Unity Tweak Tool 是桌面版 Ubuntu 的重要工具，但并没有在桌面版 Ubuntu 中预安装。为了能自定制 Unity 桌面，下面介绍一下如何在桌面版 Ubuntu 中安装 Unity Tweak Tool。

### 在 Ubuntu 13.04 或更高版本中安装 Unity Tweak Tool ###

从 Ubuntu 13.04 开始， Ubuntu 的基础库中就有 Unity Tweak Tool 了。因此它的安装非常简单： 

    $ sudo apt-get install unity-tweak-tool 

启动 Unity Tweak Tool：

    $ unity-tweak-tool 

如果你想使用最新版本的 Unity Tweak Tool，你可以从它的 PPA 中安装(如下所述)。

### 在 Ubuntu 12.10 中安装 Unity Tweak Tool ###

注意，Unity Tweak Tool 要求 Ubuntu 12.10 或更高的版本。如果你想着 Ubuntu 上安装它，你可以安装下面方法使用 PPA。当你想测试最新的开发版的时候这个 PPA 库也非常有用。

    $ sudo add-apt-repository ppa:freyja-dev/unity-tweak-tool-daily
    $ sudo apt-get update
    $ sudo apt-get install unity-tweak-tool 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-unity-tweak-tool-ubuntu-desktop.html

作者：[Dan Nanni][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://launchpad.net/unity-tweak-tool