在Ubuntu内使用声音切换器简单切换音频源
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/02/Sound_switcher_Indicator.jpeg)

声音切换器是由[Dmitry Kann][1]开发的小程序。这个程序的目的很简单，让你在不同的音频源如喇叭、耳机和HDMI之间点击两下鼠标就能切换。

你可能会说“没什么大不了”。毕竟它不是火箭科学。你可以进入**系统设置> 声音设定** 并且可以简单地选择你想要的输入输出源。**声音切换器**没有做新的或者Ubuntu没有提供的功能，它只是简化整个过程。我想这可能是为什么这个没有列在[最佳Ubuntu指示器程序][2]中的原因。


你多久需要改变音频源？对于我来说，我不得不在每次从外部监视器的HDMI获取声音时切换音频源。并且我不得不在拔掉HDMI线时重新这么做。这个小程序指示器对于像我这样经常切换音频源又懒的人是很方便的。![](http://itsfoss.com/wp-includes/images/smilies/icon_razz.gif)

### 在Ubuntu中安装音频切换器: ###

打开一个终端并且使用下面的命令在Ubuntu中安装音频切换器：

    sudo apt-add-repository ppa:yktooo/ppa
    sudo apt-get update
    sudo apt-get install indicator-sound-switcher

#### 重要提示: ####

音频切换器不会自动启动。为了自动启动，你要把它加到**启动程序**中。打开**启动程序**并点击**添加**。这里，给它一个名字，比如就称声音切换器，并是在**命令**部分使用 “indicator-sound-switcher”(没有引号)。如果你在加入启动程序遇到问题时请告诉我。

你认为音频切换器怎么样？像这样的小程序对用户有好处么？让我们知道你的看法。

--------------------------------------------------------------------------------

via: http://itsfoss.com/sound-switcher-indicator-ubuntu/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://yktoo.com/about
[2]:http://itsfoss.com/7-best-indicator-applets-for-ubuntu-13-10/
[3]:http://itsfoss.com/how-to-fix-no-sound-through-hdmi-in-external-monitor-in-ubuntu/
