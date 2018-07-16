一步步安装Ubuntu 13.10服务版
========================

如你所见，这是一篇关于**Ubuntu 13.10服务版的安装**的指南。

下载最新的版本**[Ubuntu 13.10 服务版][4]**，然后用刻录好的Ubuntu 13.10服务版光盘引导你的服务器，你将会看到类似下面的显示。

首先选择您的语言：（建议使用英文）

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server1.png)

点击安装Ubuntu服务版：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server2.png)

选择安装过程中所使用的语言：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server3.png)

选择你的国家（译注：用于决定时区，请选择中国，使用+8时区）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server4.png)

配置区域设置：（译注：对于服务器版本，我们建议一律采用英文的locale—— en_US.UTF-8，当然，你可以增加中文字体包，但是保持服务器环境是英文环境，有助于减少出现奇怪问题的几率。）

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server5.png)

检测键盘布局（译注：一般不必检测）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server6.png)

选择键盘布局（译注：如下图的英文即可）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server7.png)

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server8.png)

自动检测网络设置：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server9.png)

输入你的服务器主机名（译注：作为服务器，尤其是运行在互联网上的，一般都输入包括域名在内的完全限定主机名。）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server10.png)

输入用户名以创建一个非特权用户（译注：操作服务器要习惯使用普通用户操作，**仅仅**在必要使用使用sudo来使用root权限。）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server11.png)

设置用户的密码：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server12.png)

如果你想加密用户主目录，选择Yes，否则选择No（译注：这点无所谓。）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server13.png)

选择分区方案（译注：如果你有特定需求，可以采用manual分区方式，没有经验的用户可以使用预设的Guied分区模式。关于分区，是一个值得系统管理员仔细研究的课题，建议搜索更多深入的文章来看看，或者在此进行讨论）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server14.png)

开始安装：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server15.png)

如果在你的网络上有代理服务，输入代理服务的IP地址（译注：绝大多数的服务器都是直接接入互联网，并有公网IP的，所以不会使用代理服务器的。）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server16.png)

选择安全更新的安装方式，然后回车（译注：我不同意原文的选择。对于服务器，不建议采用自动更新，因为服务器的第一要务是稳定；在出现必要的安全更新补丁时，系统管理员要评估并测试是否应该安装，是否会对现有应用造成影响，如果可以通过其他方式，如防火墙来消除安全隐患，那么一动不如一静，不安装任何补丁和更新为好。）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server17.png)

选择要安装的软件（译注：仅仅选择你的服务器所必须的，暂时不用的，最好不要选择。将来需要增加或许修改时，你还有足够的时间去改变。）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server18.png)

点击Yes安装Grub引导装载程序（译注：这里一般没有别的选择，肯定是安装Grub，除非你有特别的理由给服务器安装其他的引导器。）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server20.png)

安装完成以后，选择continue重启服务器即可：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server21.png)

登入Ubuntu服务器：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server22.png)

输入用户名和密码登录（译注：如你所见，服务器版默认是没有图形界面的，一般而言，除非你有一个必须图形界面运行的程序，否则不要安装图形界面。不安装图形界面的主要原因是，减少不必要的包和服务，每多一个服务就会多带来一份安全威胁的可能性，当然，也会消耗一点内存和处理能力。你现在可以在登录后输入ps或者pstree看看已经运行的服务有多少。）：

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server23.png)

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Server24.png)

这就是这次的指南。现在你的Ubuntu 13.10 服务版已经启动运行了。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/install-ubuntu-server-13-10-step-step/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.unixmen.com/ubuntu-13-10-saucy-salamander-released-screenshots/
[2]:http://www.unixmen.com/upgrade-ubuntu-13-04-raring-ubuntu-13-10-saucy-salamander/
[3]:http://www.unixmen.com/top-things-installing-ubuntu-13-10/
[4]:http://releases.ubuntu.com/saucy/
