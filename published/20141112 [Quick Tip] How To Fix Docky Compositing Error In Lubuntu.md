小技巧：如何修复Lubuntu中的Docky混合错误
================================================================================
总所周知，**Docky**是Unix/Linux类系统中的轻量级应用启动器。我是 Lubuntu 和 Docky 的忠实粉丝，因为它们不需要占用我的所有系统资源，这样就可以同时运行更多应用。我在笔记本上使用Docky应用启动器，系统为Lubuntu 14.04.

但是，如果你使用LXDE发行版，你也许肯定遇到过使用Docky时报混合的错误。看下面的截图。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/Docky.png)

如果不开启混合功能，就不能使用Docky一些特别功能，如3D背景、自动隐藏。如果你想开启这些Docky的功能，那么你需要在你的LXDE系统中开启混合功能。

就像这样，首先安装 **xcompmgr**包：

    sudo apt-get install xcompmgr

然后，选择**菜单（Menu） -> 偏好（Preferences） -> LXSession默认程序（Default applications for LXSession）**。选择自动开始（Autostart）选项卡。 在**（+增加）+Add**框中输入“**@xcompmgr -n**”不带引号。最后点击增加按钮。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/LXSession-configuration_002.png)

这样就搞定了。关掉LXSession配置窗口，注销或重启系统。之后，你就可以看见混合功能已经打开。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/unknown_006.png)

这时，你就可以使用3D背景和隐藏功能，如自动隐藏（Auto-hide），Intellihide和窗口闪烁（Window dodge）等。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/11/Docky-Settings_003.png)

搞定！干杯！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/quick-tip-fix-docky-compositing-error-lubuntu/

作者：[SK][a]
译者：[Vic020/VicYu](http://www.vicyu.net)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
