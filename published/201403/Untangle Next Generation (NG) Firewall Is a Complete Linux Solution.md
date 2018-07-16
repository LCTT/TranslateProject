一个纯Linux的防火墙解决方案：Untangle Next Generation (NG) Firewall
================================================================================
**Untangle Next Generation (NG) Firewall 10.1是一个基于Linux的网关，带有模块化的网络应用，比如垃圾邮件过滤，网页过滤，防病毒，防间谍软件，防入侵，VPN，SSL VPN，以及防火墙。它已经发布并可以下载了。**

![](http://i1-news.softpedia-static.com/images/news2/Untangle-Next-Generation-NG-Firewall-Is-a-Complete-Linux-Solution-425968-2.jpg)

Untangle Next Generation (NG，下一代) Firewall曾经叫Ungangle网关，但是开发者们为了更好地展现它的功能，给它改了个名字。

NG防火墙现在是许多应用的集合，根据开发者的介绍，它们会并发地侦测网络数据，极大地减少了单独应用的系统资源消耗。

NG防火墙的特性包括一个专用的过滤器、高级带宽管理功能、支持加密VPN连接、按组或者按用户来控制，以及许多的支持服务。

### Untangle Next Generation (NG) Firewall 10.1的亮点: ###

- 用户不能下载应用程序，整个下载系统都被移除了，所有的应用都预装在平台中。
- 支持基本的VRRP设置，在有多个Untangle服务器的时候支持热/冷高可用性。
- 网络过滤器现在在阻止https链接的时候会显示一个阻挡页面，即使没有使用专用的https检查器。
- 改善了网络过滤器的https阻挡功能（不带https检查器），在Untanble最新的版本中，https流量会先通过SNI分类。默认情况下，这个分发会根据从https网站获取的证书以及根据证书的CN来建立会话来分类，这个过程更加精确。
- 支持根据列值或任意值过滤。
- 支持通过“搜索”做做全局过滤。
- 提高了广告过滤器的性能。

请查看官方的[声明][1]来获得完整的改动和改善列表。

### 下载Untangle Gateway Platform 10.1: ###

- [Untangle Gateway Platform 10.1 (ISO) 64-bit[iso]][2] [565 MB]
- [Untangle Gateway Platform 10.1 (ISO) 32-bit[iso]][3] [561 MB]

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/Untangle-Next-Generation-NG-Firewall-Is-a-Complete-Linux-Solution-425968.shtml

译者：[zpl1025](https://github.com/zpl1025) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://wiki.untangle.com/index.php/10.1.0_Changelog
[2]:http://download.untangle.com/untangle_1010_x64.iso
[3]:http://download.untangle.com/untangle_1010_x32.iso
