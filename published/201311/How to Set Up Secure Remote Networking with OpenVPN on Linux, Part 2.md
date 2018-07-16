Linux上如何通过 OpenVPN 建立安全的远程连接【下】
================================================================================

欢迎你们回来继续看我们的 OpenVPN 系列的下篇。[上次][1]我们讲到如何让远端计算机（如笔记本电脑）[通过简单的加密隧道][1]登录到家里的服务器。今天我们接着讲进阶部分：比如设置 OpenVPN 开机启动，省得我们每次重启服务器的时候都要手动开启 OpenVPN 服务；比如使用 Network Manager 简化访问到远程服务器的过程。

### 整合到 Network Manager ###

Network Manager 是一个不错的 OpenVPN 客户端；你只需要安装 network-manager-openvpn 这个插件。我们继续[上篇][1]使用的配置。打开 Network Manager 配置界面，进入“新建 VPN 连接”的窗口。这个界面布局在 KDE 和 GNOME 下面看起来有点不一样，但是大体的信息是一样的。开始的时候你需要选择 OpenVPN 作为你的 VPN 连接类型，就像图1所示；如果你没看到 OpenVPN 的选项，说明你没有安装好插件。（图1是一张 GNOME 下面的图片。）

![](http://www.linux.com/images/stories/41373/figu-1-openvpn-nm.jpg)

*图1：在 Network Manager 上新建 OpenVPN 客户端 *

图2显示了配置主界面。从上到下分别为：

- 连接名，随便取一个。
- 远程服务器的网关。
- 下拉菜单选择静态密钥（Static Key）。
- 然后通过文件浏览器找到静态密钥文件。
- 这个不是方向性的密钥，所以 Key Direction 这里设为 None。
- 远程 IP 和 本地 IP 是我们在上一部分已经设置好的虚拟 OpenVPN 地址，可分别通过 /etc/openvpn/studio.conf 和 /etc/openvpn/shop.conf 文件获得。
- 我们无需设置密码，所以“Show passwords”复选框为空。
- 这个VPN连接是“所有人都可用”，还是只有你可用，随你喜欢。

![](http://www.linux.com/images/stories/41373/fig-2-openvpn-nm-1.jpg)

*图2：Network Manager 配置 OpenVPN 客户端主界面*

保存然后就可以使用 Network Manager 建立连接了。So easy，妈妈再也不用担心我的学习了！看见图3了么？你现在只需点击一下高亮的按钮就可以连接到你的家庭服务器，或从你的家庭服务器中断开连接。

![](http://www.linux.com/images/stories/41373/fig-3-openvpn-nm-3.jpg)

### OpenVPN 开机启动 ###

手动开启 OpenVPN 很简单，但是你也许想要更简单，让它能够在服务器重启的时候跟着自动启动。在 Debian/Ubuntu 以及绝大部分发行版中，当你安装完 OpenVPN 的时候就被设置为开机启动的。所以你需要重启系统，或者按下面的方法启动后台进程：

    $ sudo /etc/init.d/openvpn start
    $ sudo service openvpn start

第一个命令是比较老的启动方法，第二个命令使用了“service”命令。“service”命令第一次出现在 Red Hat 发行版中，如果你的发行版中没有安装这个命令，你需要从你的软件源里面去找到它。

Ubuntu 使用 Upstart 管理服务进程，Debain 使用的老的 SysV，而 Fedora 使用“systemd”。如果你在 /etc/openvpn 目录下配置了多个 OpenVPN 的服务，你可以通过“systemd”的命令启动你要的服务：

    # systemctl start openvpn@studio.service

这里的“studio.service”与我们在上篇讲过的例子中的 /etc/openvpn/studio.conf 配置的服务相对应。用这些方法启动的后台进程，在系统重启后会失效，所以这些方法都和上篇讲的启动方式一样，仅能使 OpenVPN 运行一次。你可以将启动 OpenVPN 进程的任务交给 chkconfig：

    # service openvpn start
    # chkconfig openvpn on

上面列出的是启动 OpenVPN 后台进程最常见的方式，这个命令启动了一整个进程，而不是对 /etc/openvpn/下面的所有 .conf 配置文件都维护一个进程。systemd 支持chkconfig 以及 service 命令，所以上面两条命令能够正常工作。然而使用 systemd 的发行版非常多，如果你的工作环境和我们的不一样，请通过发表评论的方式通知我们。

### 强化你的连接 ###

OpenVPN 的健壮性足够维持一条持久的连接，即使服务宕掉。而你可以令这个连接变得更加稳定，只需要在服务器端和客户端的 .conf 文件内添加下面两条属性：

    persist-tun
    persist-key

这两条属性对于那些笔记本电脑用户来说非常有用，他们的电脑会因为电源保护或需要移来移去而经常断开 OpenVPN 的连接。

### 现在，该做些什么？ ###

你已经完成了所有设置，并且你的服务工作正常，你接下来能用这个干点什么？如果你以前一直用 OpenSSH 来远程你的服务器，你会有这样的思维定势：你可以利用 OpenVPN 登录到远程机器，然后跑上面的应用。你要是那样做，就太浪费 OpenVPN 了。你可以将 OpenVPN 想像成是一条虚拟的以太网电缆接到你的服务器上或者是你的局域网内，这条电缆还包着厚厚的加密保护。你可以在它提供的隧道上跑任何加密的或不加密的服务，并且只需要在防火墙上开一个端口。

所以你可以利用 OpenVPN 隧道来建立 SSH 连接，然后远程到服务器，然后在服务器上跑应用。你可以访问到网络资源，比如文件共享和 Web 应用。你可以强制让你的电脑通过 VPN 隧道访问到网络，但我认为你会想要同时能够使用本地网络和 VPN 网络的。

所以，在你的笔记本上你可以上网冲浪，使用 SSH，做你想做的任何事，上你想上的**任何**网络。当你想利用 OpenVPN 隧道做一些事情时，你只需要打开它，然后输入 IP 地址：

    $ ssh carla@10.0.0.1

对于一些 Web 服务，操作也简单：让你的 Web 浏览器访问到 OpenVPN 的 IP 地址然后登录进去。举个例子，我在我家的服务器上跑了多个 Web 服务做测试，我可以通过[http://10.0.0.1/drupal][2]访问 Drupal，可以通过[http://10.0.0.1/owncloud][3]访问 OwnCloud。我电脑上有优秀的图形界面 FTP 客户端 gFTP，所以只需要填入 IP 地址、用户名、密码就能访问到 FTP 服务器，或者使用下面的命令：

    $ ftp 10.0.0.1 21

你可以远程管理你的 MySQL 数据库，输入帐号密码：

    $ mysql -h 10.0.0.1 -u admin -p

所以最重要的是你要知道怎么去配置一个你想要玩的功能。

很显然，当我们使用名称服务（name service）时，会比直接使用 IP 地址更方便。所以某一天我们可以学学如何在 OpenVPN 上布署一个名称服务。现在，先享受一下 OpenVPN 带给你的乐趣吧。

--------------------------------------------------------------------------------

via: http://www.linux.com/learn/tutorials/745233-how-to-set-up-secure-remote-networking-with-openvpn-on-linux-part-2

译者：[bazz2](https://github.com/bazz2) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-2286-1.html
[2]:http://10.0.0.1/drupal
[3]:http://10.0.0.1/owncloud
