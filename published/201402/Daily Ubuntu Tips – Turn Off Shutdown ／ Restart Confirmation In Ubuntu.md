每日 Ubuntu 小技巧——关闭 Ubuntu 中的关机/重启确认
================================================================================

对于 Ubuntu 新手来说，有很多新东西要学，但是网上很多教程不是针对新手的。

在这里，我们不走寻常路。不能说全部的教程都是为初学者准备，但至少大部分是。

这篇文章也是一篇新手教程，并且展示如何在每次执行关机、重启、注销时禁用确定框。

Ubuntu 总是配置好了一个对话框，每当你要关机、重启或者注销时提示你。

这是一个保护措施，防止你本不打算这样做却错误关机或重启。

不是所有人都想每次关机的时候被询问。忙碌的小伙伴们可能就让自己的电脑那么醒着，因为他执行了关闭命令，却忘了确认那个该死的对话框。

这个教程将会指导你每一次关机的时候如何避免那个对话框。

当这个特性被激活，你将会收到下面的提示。

> Are you sure you want to close all programs and shutdown your computer?

运行下面命令关掉它。

按下键盘上的 **Ctrl – Alt – T** 打开终端。然后敲击下面的命令

    gsettings set com.canonical.indicator.session suppress-logout-restart-shutdown true

就这么简单，你再也不会被该死的确认对话框骚扰了。

如果想恢复这个对话框，敲下面的命令就可以了

    gsettings set com.canonical.indicator.session suppress-logout-restart-shutdown false

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/shutdownubuntuconfirm.png)

干巴爹！ 

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-turn-off-shutdown-restart-confirmation-in-ubuntu/

译者：[ggaaooppeenngg](https://github.com/ggaaooppeenngg) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
