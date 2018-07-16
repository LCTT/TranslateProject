如何使用图形界面Webmin管理linux服务器
================================================================================
一台典型的linux服务器运行命令行环境中，并已经包括了一些用于安装和配置各种没有界面的服务的基本工具。和一些成熟的具有图形界面的桌面软件相比，就安全性、资源消费和速度来说，仅需要少量的设置无疑是一个优点。

如果你习惯了使用基于图形界面的软件环境，你也许会想在Linux服务器中是否也有图形界面。典型的Linux桌面环境如`GNOME`、`KDE`等，与它们提供的功能相比，其所占用的系统资源负担是很不值得的，而且还不够安全，因为越多的代码越会带来安全弱点。

另外一个成熟的桌面GUI的可选替代是使用 **基于Web的管理工具**。现在已经有许多基于Web的配置管理工具，如 [Webmin][1]、[ISPconfig][2]、[Zentyal][3]等。

在这篇教程中, 我会讲述 **怎样利用基于Web的界面工具来管理和配置Linux服务器**。

Webmin 是一个用`Perl`语言写的轻量级 (~20 MB) 系统配置工具。 Webmin 具有内置的web服务器， 允许用户通过web接口来配置Linux服务器。 其中一个优点是由于它是基于模块架构的，你可以选择性加载[模块][12]来扩展其功能。

### Linux服务器上安装Webmin ###

在 Ubuntu 或 Debian 系统中安装Webmin， 你可以使用如下命令。

    $ sudo apt-get install perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python
    $ wget http://prdownloads.sourceforge.net/webadmin/webmin_1.660_all.deb
    $ sudo dpkg -i webmin_1.660_all.deb 

在CentOS 或 RHEL 系统中安装Webmin， 使用如下命令：

    $ wget http://prdownloads.sourceforge.net/webadmin/webmin_1.660_all.deb
    $ sudo rpm -U webmin-1.660-1.noarch.rpm 

### 使用 Webmin ###

安装好Webmin之后，你可以通过在浏览器中输入 https://\<主机的IP地址\>:10000 来使用。 如果你开启了防火墙， 请确保TCP端口 10000 没有被拦截。

同时， 请注意你应该使用 HTTPS， 而不是 HTTP。 否则， 会出现重定向错误。 Webmin 默认使用其自己生成的的SSL验证模式。

一旦你进入了Webmin登录页面， 你可以使用root身份登录 （当然需要输入root账户密码）或者使用具有root权限的任何用户账户登录。 登录成功后， 你可以看到如下Linux服务器的状态信息。

[![](http://farm4.staticflickr.com/3803/10937800943_e1ac465c3f_z.jpg)][4]

### Webmin 的特点 ###

Webmin 一个引以为豪的优点就是它几乎能够配置任何Linux服务器所支持的配置。接下来我来介绍，让你们大体了解它的一些重要功能。

设置引导时自动启动的服务， 同时显示他们相关配置信息。

[![](http://farm8.staticflickr.com/7437/10937589506_7abcaac10e_z.jpg)][5]

实时监控服务器状态和其他服务， 同时配置定时监控及邮件提醒。 你也可以监控一系列服务器守护进程如 NFS、MySQL、 BIND DNS、Squid proxy、Apache Web server等， 或者监控系统资源如磁盘存储情况、内存使用和网络占用等。

[![](http://farm6.staticflickr.com/5521/10937589676_a64d4eee57_z.jpg)][6]

配置 iptables-based firewall。

[![](http://farm4.staticflickr.com/3679/10937801173_61cd4b11a3_z.jpg)][7]

配置本地路由表和网关。

[![](http://farm6.staticflickr.com/5545/10937531925_a5d77384ac_z.jpg)][8]

挂载和配置文件系统。

[![](http://farm4.staticflickr.com/3710/10937589556_9fd192cdb9_z.jpg)][9]

通过文件管理接口来查看和修改本地文件，但是这需要浏览器有相关的java插件。

[![](http://farm6.staticflickr.com/5544/10937531975_368196fd03_z.jpg)][10]

通过改变Webmin的相关配置，你可以控制管理 IP 地址，添加/删除 Webmin 功能模块，开启双因子认证来使用安全登录功能，或者创建证书验证等。

[![](http://farm8.staticflickr.com/7317/10937532015_b5e1263496_z.jpg)][11]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/11/manage-linux-server-gui.html

译者：[thinkinglk](https://github.com/译者ID) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.webmin.com/
[2]:http://www.ispconfig.org/
[3]:http://www.zentyal.org/
[4]:http://www.flickr.com/photos/xmodulo/10937800943/
[5]:http://www.flickr.com/photos/xmodulo/10937589506/
[6]:http://www.flickr.com/photos/xmodulo/10937589676/
[7]:http://www.flickr.com/photos/xmodulo/10937801173/
[8]:http://www.flickr.com/photos/xmodulo/10937531925/
[9]:http://www.flickr.com/photos/xmodulo/10937589556/
[10]:http://www.flickr.com/photos/xmodulo/10937531975/
[11]:http://www.flickr.com/photos/xmodulo/10937532015/
[12]:http://www.webmin.com/standard.html
