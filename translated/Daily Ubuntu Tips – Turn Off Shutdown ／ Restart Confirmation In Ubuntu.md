每天Ubuntu小知识 - 在Ubuntu中的关机/重启确认
================================================================================


对于Ubuntu绿手来说，有很多新东西要学，但是网上很多教程不是针对新手的。

在这里，我们不走寻常路。如果大多数教程不是适合初学者。

这篇文章也是一个新手的文章，并且展示如何在每次执行shutdown，restart，logout时禁用确定框。

Ubuntu总是配置好了一个对话框，每当你要shutdown，reastart或者logout的时候提示你。

这是一个保护措施，防止你本不打算这样做的时候错误执行关机。

不是所有人都想每次关机的时候都被询问。忙碌的小伙伴可能就让Ubuntu就那么开着，因为他shutdown了，但是忘了确认那个该死的对话框。

这个教程主要是告诉你关机的时候，如何可以避免那个对话框。

当这个特性被激活，你将会收到下面的提示。
> Are you sure you want to close all programs and shutdown your computer?

运行下面命令关掉它。

按下键盘上的**Ctrl – Alt – T**打开终端。然后敲击下面的命令

    gsettings set com.canonical.indicator.session suppress-logout-restart-shutdown true

就是这些，你就再也不会被该死的确认对话框骚扰了。

如果想恢复这个对话框，敲下面的命令就可以了

    gsettings set com.canonical.indicator.session suppress-logout-restart-shutdown false

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/shutdownubuntuconfirm.png)

干巴爹！ 

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-turn-off-shutdown-restart-confirmation-in-ubuntu/

译者：[ggaaooppeenngg](https://github.com/ggaaooppeenngg) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
