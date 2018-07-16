图解 CentOS 6.5 桌面版安装
================================================================================
### CentOS 6.5 新版本发布 ###

随着RHEL 6.5新版本的发布，[CentOS 6.5][1]在12月1号准时跟上。现在是时间来玩弄它了。如果想要从已经安装好的6.4系统升级到6.5，只要简单的使用* yum update *命令，然后就是见证奇迹的时刻。

CentOS 6.5 迎来了新的更新包和新功能。可以在[release notes][2]中查看更多细节信息。

### 主要更新 ###

- 精密时间协议 - 以前仅是一个科技预览版 - 现在已经完整支持了！以下设备支持网络时间戳：bnx2x,tg3 , e1000e , igb , ixgbe ,sfc。
- OpenSSL 升级到1.0.1版本
- OpenSSL、NSS支持TLS1.1和1.2
- KVM得到大量加强。包括提升对VMDK文件和VHDX文件的只读，CPU支持热插拔以及升级了 virt-v2v-/virt-p2v-conversion 工具
- Hyper-V 和 VMware 驱动升级
- 升级到 Evolution（2.32）和 Libre Office（4.0.4）

### 下载 ###

这篇教程我们将要安装它的桌面版。你可以从下面的任意一个url开始

[http://isoredirect.centos.org/centos-6/6.5/isos/][3]
[http://mirror.centos.org/centos/6.5/isos/][4]


选择你的机器制式，它会列出一张镜像表。进入任何一个镜像、得到种子文件下载或者直接下载iso链接。有许多选择下载方式可以选择，比如，LiveCD, LiveDVD, Dvd1+2双碟套装, Minimal最小化安装 和 Netinstall.

Minimal最小化安装是一个基于文字界面的安装程序，这样安装的CentOS将只有shell和最少软件应用程序。剩余的所有东西不得不你自己通过yum安装。

LiveCD/LiveDVD提供桌面版和GUI安装程序，可以安装CentOS系统但是不提供任何可选择的软件包。

DvD1+2双碟套装给有需求的人提供完整的应用程序集合

netinstall 事实上会先下载安装镜像然后再安装

这篇文章我们将使用LiveCD。 它大概有650MB。
尽管CentOS主要使用在服务器上，但它有一个桌面系统可以帮助你的服务器在安装时创造一个基础GUI的安装环境。在其他文章，我们将会尝试minimal 和 netinstall安装方法。


### 安装 ###

所以现在，该是时候在你的桌面系统安装CentOS了。快点使用LiveDVD或者是LiveCD去启动运行吧！


1.放入媒体然后重启。启动菜单有多个带说明的选项。选择Boot进入Live桌面。


![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-1.png)

2.在桌面上双击下列安装图标，开启anaconda安装器。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-2.png)

3.进入安装向导，点击Next（下一步）

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-3.png)

4.**键盘布局** - 这一步会询问你，选择你的键盘布局。（译注：推荐选择U.S. English）


![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-4.png)

5.**存储类型**完成键盘布局的选择，接下来的是选择用来安装CentOS的存储类型。对于本地硬盘启动，应该选择Basic storage。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-5.png)

6.**主机名** 下一步 anaconda 安装器会询问主机名。所以填入适当的词。如果不确定，随意输入一个（译注：主机名hostname可以随时更改）。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-6.png)

7.**时区选择** 接下来选择时区选项。


![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-7.png)

8.**Root 密码** 下面是输入 root 密码 ，最好是输入一个你熟悉但要足够强壮的密码。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-8.png)

9.**规划分区** 现在向导想要知道，你将要怎么规划存储设备。
如果你需要自己规划分区，选择 “Custom Layout” 并根据需要分区。为了这篇教程的目的，我们选择了第一个选项，那就是使用整个设备并让CentOS用它喜欢的规划自动分区。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-9.png)

10.**复制文件** 现在安装已经开始复制文件了。现在除了等待和盯着没有什么事情可以做。LiveCD安装器基本上从CD镜像上复制到硬盘上。你没有得到任何安装包的选项去选择安装或省略。而且liveCD本身只自带了很少的软件和应用程序。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-10.png)

### 安装完毕后配置 ###

11.在安装完毕后会自动重启，欢迎向导将出现来进一步配置系统。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-11.png)

12.许可证协议 就像所有CentOS的软件一样会有一个很小只有几行的许可证。所以同意吧！

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-12.png)

13.**创建用户** 现在为自己创建一个使用系统的普通用户。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-13.png)

14.**当前日期和时间** 输入当前日期和时间并且选择使用网络自动同步时间。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-14.png)

15.**Kdump**这是欢迎向导的最后一步，询问Kdump应该是开启还是关闭。推荐开启它。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-install-screenshot-15.png)

### 开始使用 CentOS 6.5 ###

结束完之前步骤，系统将会重启，最后引导到登陆界面。

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-login.png)

登陆之后，迎来的金光闪闪的CentOS 6.5 的桌面！

![](http://www.binarytides.com/blog/wp-content/uploads/2013/12/centos-65-desktop.png)


希望你喜欢这篇安装指南，可以在下方留下你的评论和问题。

### 资源 ###

CentOS 6.5 release notes（版本记录）
[http://wiki.centos.org/Manuals/ReleaseNotes/CentOS6.5][5]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/centos-6-5-installation-screenshots/

译者：[Vic___](http://blog.csdn.net/Vic___) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://lists.centos.org/pipermail/centos-announce/2013-December/020032.html
[2]:http://wiki.centos.org/Manuals/ReleaseNotes/CentOS6.5
[3]:http://isoredirect.centos.org/centos-6/6.5/isos/
[4]:http://mirror.centos.org/centos/6.5/isos/
[5]:http://wiki.centos.org/Manuals/ReleaseNotes/CentOS6.5
