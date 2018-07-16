Ubuntu 14.04中的经典菜单插件重燃GNOME 2旧情
================================================================================
**有很多用户对Unity桌面并不满意，他们认为GNOME 2菜单的解决方案才是正确的道路。经典菜单插件提供了一个可能让所有人满意的妥协**

![](http://i1-news.softpedia-static.com/images/news2/ClassicMenu-Indicator-Rekindles-Old-GNOME-2-Feeling-in-Ubuntu-14-04-LTS-431399-2.jpg)

Unity可能是排在首位的被用户反对Ubuntu的功能，即使用户量正在不断增加，而且更多的用户开始用它，仍然有不少用户偏好GNOME 2中的菜单显示。

这也是“MATE”桌面环境为什么产生以及其他桌面环境尝试重建GNOME 2方法的原因。现在，如果你能至少对替代左上角的左上角菜单按钮的样子有所妥协，你可能会享受经典菜单插件带来的愉悦之感。

好消息是，经典菜单插件的开发者也为即将到来的Ubuntu 14.04(Trusty Tahr)制作了一个小应用。如果你恰好正在用Ubuntu 14.04的development build，这个插件将会在你的系统中完美运行。

你有两种方法来安装经典菜单插件，一是运行提供的deb文件，二是使用提供的PPA。我们建议你使用第二种添加PPA的做法，因为通过添加PPA，用户可以摆脱手动安装，及时收到此应用的将来的更新。打开终端输入以下命令(需要有root权限)：

    sudo add-apt-repository ppa:diesch/testing
    sudo apt-get update
    sudo apt-get install classicmenu-indicator

当安装成功后（应该用不了多久），你可以从Dash中运行这个插件。幸运的是，此插件会自动将自己纳入开机启动的列表，因此你不需要手动添加它。

前几天此插件有一个更新，不过并没有什么高大上的新功能，而且很多只是对界面的修改。比如对经典菜单的子目录中的文字显示的修复，还通过更改配置增加了一些菜单项目。

最新版本的经典菜单插件也实现了一个有意思的变化，就是通过使用Xfce解决了一些没有Unity的发行版(例如Xubuntu)的老问题。

你也可以在官方网站上获取更多关于此[更新][1]的细节.

###下载经典菜单插件0.09:###

- [classicmenu-indicator_0.09_all.deb][2][ubuntu_deb] [21.80 KB]
- [classicmenu-indicator-0.09.tar.gz][3][sources] [54.40 KB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/ClassicMenu-Indicator-Rekindles-Old-GNOME-2-Feeling-in-Ubuntu-14-04-LTS-431399.shtml

译者：[ThomazL](https://github.com/ThomazL) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.florian-diesch.de/software/classicmenu-indicator/changes.html
[2]:http://www.florian-diesch.de/software/classicmenu-indicator/dist/classicmenu-indicator_0.09_all.deb
[3]:http://www.florian-diesch.de/software/classicmenu-indicator/dist/classicmenu-indicator-0.09.tar.gz
