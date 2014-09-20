GNOME控制中心3.14 RC1修复大量潜在崩溃因素
================================================================================
![GNOME Control Center in Arch Linux](http://i1-news.softpedia-static.com/images/news2/GNOME-Control-Center-3-14-RC1-Correct-Lots-of-Potential-Crashes-458986-2.jpg)

Arch Linux下的GNOME控制中心

**GNOME控制中心，GNOME中更改你的桌面各个方面设置的主界面，已经升级至3.14 RC1，伴随而来的是大量来自GNOME stack的包。**

GNOME控制中心是在GNOME生态系统中十分重要的软件之一，尽管不是所有的用户意识到了它的存在。GNOME控制中心是管理由GNOME驱动的操作系统中所有设置的部分，就像你从截图里看到的那样。

GNOME控制中心不是很经常被宣传，它实际上是GNOME stack中为数不多的作为源包以及工具时，拥有不同名字的包之一。源包为称为GNOME控制中心，但用户经常看到的是设置或系统设置，取决于开发者的选择。

### GNOME控制中心 3.14 RC1 带来哪些新东西 ###

通过更新日志可以得知，libgd得到了升级以修复GdNotification主题，切换视图时背景选择对话框不能够自适应大小，一个带有树状视图的堆叠现在被用于选择对话框，修复Flickr支持中的一个内存泄漏，硬编码字体大小不再用于日期和时间，修复WM改变（或重启）时引起的崩溃，更改无线网络启用时可能引起的崩溃也已被修复，以及纠正了更多可能的WWAN潜在崩溃因素。

同时，现在热点仅在设备活动时运行，所有虚拟桥接现在是隐藏的，VPN连接的底层设备不再显示，空文件夹列表不再默认显示，不同的UI填充问题已经得到解决，焦点现在重新回到了账户对话框，将年份设置为0时导致的崩溃已修复，“Wi-Fi热点”属性居中，打开并启用热点时弹出警告已修复，以及现在打开热点失败时将弹出错误信息。

完整的变动，更新以及bug修复，参见官方[更新日志][1]。

你可以下载GNOME控制中心 3.14 RC1：

- [tar.xz (3.12.1 稳定版)][2][sources] [6.50 MB]
- [tar.xz (3.14 RC1 开发版)][3][sources] [6.60 MB]

这里提供的仅仅是源代码包，你必须自己编译以测试GNOME控制中心。除非你真的知道自己在做什么，否则你应该等到完整的GNOME stack在源中可用时再使用。

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/GNOME-Control-Center-3-14-RC1-Correct-Lots-of-Potential-Crashes-458986.shtml

作者：[Silviu Stahie][a]
译者：[alim0x](https://github.com/alim0x)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://news.softpedia.com/editors/browse/silviu-stahie
[1]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-control-center/3.13/gnome-control-center-3.13.92.news
[2]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-control-center/3.12/gnome-control-center-3.12.1.tar.xz
[3]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-control-center/3.13/gnome-control-center-3.13.92.tar.xz
