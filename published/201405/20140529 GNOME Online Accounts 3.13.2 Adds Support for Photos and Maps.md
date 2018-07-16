GNOME在线账户应用3.13.2中添加了对照片和地图的支持
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/GNOME-Online-Accounts-3-13-2-Adds-Support-or-Photos-and-Maps-444249-2.jpg)

**GNOME开发者宣布最新版的GNOME在线账户（3.13.2）现已发布，并带来数个新特性。**

GNOME的3.13.x分支的仅限用于开发，它最终会发展成为稳定的3.14版本，但那还有很长的路要走。在此之前，开发者们可以自由地改动和添加新特性。

这个分支之前的数个版本带来了一些十分有趣的改动。其它的一些改变包括，开发者们从软件中移除了对Windows和Twitter账户的支持。

通过[更新日志][1]得知，对照片应用的支持已经添加，一个对过时的GNOME_COMMON_INIT的调用已经被移除，UI进行了调整使得在线账户能够在对话框中使用标题栏，为了防止timerfd（译注：timerfd是Linux为用户程序提供的一个定时器接口）的泄漏，报警逻辑已被简化，以及添加了对Facebook地图应用的支持。

另外，对一个微小的内存泄漏问题进行了修复，默认的凭据缓存将不再泄漏，Flickr账户连接现使用SSL加密使其更加安全。

**下载 GNOME在线账户 3.13.2 源代码包：**

- [tar.xz (3.12.2 Stable)][2][sources] [1.20 MB]
- [tar.xz (3.13.2 Development)][3][sources] [1.30 MB]

请记住这是一个开发版本，不应将其安装在生产环境的机器上。该下载请仅作为测试目的安装。

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/GNOME-Online-Accounts-3-13-2-Adds-Support-or-Photos-and-Maps-444249.shtml

译者：[alim0x](https://github.com/alim0x) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-online-accounts/3.13/gnome-online-accounts-3.13.2.news
[2]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-online-accounts/3.12/gnome-online-accounts-3.12.2.tar.xz
[3]:http://ftp.acc.umu.se/pub/GNOME/sources/gnome-online-accounts/3.13/gnome-online-accounts-3.13.2.tar.xz
