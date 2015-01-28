如何在Linux上安装一个开源VPN服务器
================================================================================
![](http://techarena51.com/wp-content/uploads/2014/10/open-vpn.png)

我上网时最担心的一件事情是，我该如何确保我的数据安全和隐私。在搜索答案的过程中，我找到了很多保持匿名的方法，比如使用代理网站。但是使用第三方的服务不能完全保证。我需要的是有一款软件可以让我自己安装并运行，那样我就能确保只有我才能访问数据。

这款软件叫什么呢？

它叫VPN服务，就是虚拟隐私网络的简称。它允许访问时通过SSL加密你的数据。因为是加密的连接，所以你的ISP不能看到你的浏览信息。

在本篇Linux教程中，我会在CentOS 7上安装一个OpenVPN服务。OpenVPN很容易使用，开源且拥有社区的支持。它的客户端支持Windows、[Android][1]和Mac。

### 第一步： 在你的Linux机器或者 VPS 上安装OpenVPN服务 ###

从 https://openvpn.net/index.php/access-server/download-openvpn-as-sw.html 下载安装包，Ubuntu用户也可以找到合适的安装包并安装。

    [leo@vps ]$ cd /tmp
    [leo@vps tmp]$ wget http://swupdate.openvpn.org/as/openvpn-as-2.0.10-CentOS7.x86_64.rpm
    [leo@vps tmp]$ sudo rpm -Uvh openvpn-as-2.0.10-CentOS7.x86_64.rpm
    Preparing...                          ################################# [100%]
    Updating / installing...
       1:openvpn-as-0:2.0.10-CentOSrelease################################# [100%]
    The Access Server has been successfully installed in /usr/local/openvpn_as
    Configuration log file has been written to /usr/local/openvpn_as/init.log
    Please enter "passwd openvpn" to set the initial
    administrative password, then login as "openvpn" to continue
    configuration here: https://yourhostIP:943/admin
    To reconfigure manually, use the /usr/local/openvpn_as/bin/ovpn-init tool.
    
    Access Server web UIs are available here:
    Admin  UI: https://yourhostIP:943/admin
    Client UI: https://yourhostIP:943/

### 第二步： 为 OpenVPN 客户端设置密码 ###

    [leo_g@vps ]$passwd openvpn

### 第三步： 通过管理URL https://yourhostIP:943/admin 登录并启动服务 ###

![](http://techarena51.com/wp-content/uploads/2014/10/open-vpn.png)

输入用户名 “openvpn” 和你先前设置的密码

![](http://techarena51.com/wp-content/uploads/2014/10/open-vpn-1.png)

### 第四步： 从客户端URL安装客户端 （它会给你一个选项下载安装程序） ###

![](http://techarena51.com/wp-content/uploads/2014/10/open-vpn-client-url.png)

你可以在[这里][3]看指导来了解如何在你的操作系统上安装。

### 第五步： 用你先前创建的用户名和密码连接你的服务器 ###

![](http://openvpn.net/images/howto/connecting/OpenVPN_Client_Connect_2.png)

就是这样，你可以访问whatismyip.com来查看你的IP，应该已经是你的CentOS 7上的OpenVPN的地址了。

--------------------------------------------------------------------------------

via: http://techarena51.com/index.php/how-to-install-an-opensource-vpn-server-on-linux/

作者：[Leo G][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://techarena51.com/
[1]:https://play.google.com/store/apps/details?id=net.openvpn.openvpn&hl=en
[3]:https://openvpn.net/index.php/access-server/docs/admin-guides-sp-859543150/howto-connect-client-configuration.html