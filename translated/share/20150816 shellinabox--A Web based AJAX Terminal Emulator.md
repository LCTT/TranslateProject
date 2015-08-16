shellinabox–基于Web的Ajax的终端模拟器安装及使用详解
================================================================================
### shellinabox简介 ###

unixmen的读者朋友们，你们好！

通常情况下，我们访问任何远程服务器时，使用常见的通信工具如OpenSSH和Putty等。但是如果我们在防火墙外，或者防火墙只允许HTTPS流量才能通过，那么我们就不能再使用这些工具来访问远程系统了。不用担心！即使你在防火墙后面，我们依然有办法来访问你的远程系统。而且，你不需要安装任何类似于OpenSSH或Putty的通讯工具。你只需要有一个支持JavaScript和CSS的现代浏览器。并且你不用安装任何插件或第三方应用软件。

Meet **Shell In A Box**，发音是**shellinabox**，是由**Markus Gutschke**开发的一款免费的，开源的，基于Web的Ajax的终端模拟器。它使用AJAX技术，通过Web浏览器提供的外观和感觉像一个原生壳。该**shellinaboxd**的守护进程实现了一个Web服务器，能够侦听指定的端口。Web服务器发布一个或多个服务，这些服务将在VT100模拟器实现为一个AJAX的Web应用程序显示。默认情况下，端口为4200。你可以更改默认端口到任意选择的任意端口号。在你的远程服务器安装shellinabox以后，如果你想从本地系统接入，打开Web浏览器并导航到：**http://IP-Address:4200/**。输入你的用户名和密码，然后就可以开始使用你远程系统的外壳。看起来很有趣，不是吗？确实！

**免责声明**:

shellinabox不是SSH客户端或任何安全软件。它仅仅是一个应用程序，能够通过Web浏览器模拟一个远程系统的壳。同时，它和SSH没有任何关系。这不是防弹的安全的方式来远程控制您的系统。这只是迄今为止最简单的方法之一。无论什么原因，你都不应该在任何公共网络上运行它。

### 安装shellinabox ###

#### 在Debian / Ubuntu系统上： ####

shellinabox在默认库是可用的。所以，你可以使用命令来安装它：

    $ sudo apt-get install shellinabox

#### 在RHEL / CentOS系统上： ####

首先，使用命令安装EPEL仓库：

    # yum install epel-release

然后，使用命令安装shellinabox：

    # yum install shellinabox

完成！

### 配置shellinabox ###

正如我之前提到的，shellinabox侦听端口默认为**4200**。你可以将此端口更改为任意数字，以防别人猜到。

在Debian/Ubuntu系统上shellinabox配置文件的默认位置是**/etc/default/shellinabox**。在RHEL/CentOS/Fedora上，默认位置在**/etc/sysconfig/shellinaboxd**。

如果要更改默认端口，

在Debian / Ubuntu：

    $ sudo vi /etc/default/shellinabox

在RHEL / CentOS / Fedora：

    # vi /etc/sysconfig/shellinaboxd

更改你的端口到任意数量。因为我在本地网络上测试它，所以我使用默认值。

    # Shell in a box daemon configuration
    # For details see shellinaboxd man page
    
    # Basic options
    USER=shellinabox
    GROUP=shellinabox
    CERTDIR=/var/lib/shellinabox
    PORT=4200
    OPTS="--disable-ssl-menu -s /:LOGIN"
    
    # Additional examples with custom options:
    
    # Fancy configuration with right-click menu choice for black-on-white:
    # OPTS="--user-css Normal:+black-on-white.css,Reverse:-white-on-black.css --disable-ssl-menu -s /:LOGIN"
    
    # Simple configuration for running it as an SSH console with SSL disabled:
    # OPTS="-t -s /:SSH:host.example.com"

重启shelinabox服务。

**在Debian/Ubuntu:**

    $ sudo systemctl restart shellinabox

或者

    $ sudo service shellinabox restart

在RHEL/CentOS系统，运行下面的命令能在每次重启时自动启动shellinaboxd服务

    # systemctl enable shellinaboxd

或者

    # chkconfig shellinaboxd on

如果你正在运行一个防火墙，记得要打开端口**4200**或任何你指定的端口。

例如，在RHEL/CentOS系统，你可以如下图所示允许端口。

    # firewall-cmd --permanent --add-port=4200/tcp

----------

    # firewall-cmd --reload

### 使用 ###

现在，去你的客户端系统，打开Web浏览器并导航到：**https://ip-address-of-remote-servers:4200**。

**注意**：如果你改变了端口，请填写修改后的端口。

你会得到一个证书问题的警告信息。接受该证书并继续。

![Privacy error - Google Chrome_001](http://www.unixmen.com/wp-content/uploads/2015/08/Privacy-error-Google-Chrome_001.jpg)

输入远程系统的用户名和密码。现在，您就能够从浏览器本身访问远程系统的外壳。

![Shell In A Box - Google Chrome_003](http://www.unixmen.com/wp-content/uploads/2015/08/sk@server1-Shell-In-A-Box-Google-Chrome_003.jpg)

右键点击你浏览器的空白位置。你可以得到一些有很有用的额外的菜单选项。

![Shell In A Box - Google Chrome_004](http://www.unixmen.com/wp-content/uploads/2015/08/sk@server1-Shell-In-A-Box-Google-Chrome_004.jpg)

从现在开始，你可以通过本地系统的Web浏览器在你的远程服务器随意操作。

当你完成时，记得点击**退出**。

当再次连接到远程系统时，单击**连接**按钮，然后输入远程服务器的用户名和密码。

![Shell In A Box - Google Chrome_005](http://www.unixmen.com/wp-content/uploads/2015/08/sk@server1-Shell-In-A-Box-Google-Chrome_005.jpg)

如果想了解shellinabox更多细节，在你的终端键入下面的命令：

    # man shellinabox

或者

    # shellinaboxd -help

同时，参考[shellinabox 在wiki页面的介绍][1]，来了解shellinabox的综合使用细节。

### 结论 ###

正如我之前提到的，如果你在服务器运行在防火墙后面，那么基于web的SSH工具是非常有用的。有许多基于web的SSH工具，但shellinabox是非常简单并且有用的工具，能从的网络上的任何地方，模拟一个远程系统的壳。因为它是基于浏览器的，所以你可以从任何设备访问您的远程服务器，只要你有一个支持JavaScript和CSS的浏览器。

就这些啦。祝你今天有个好心情！

#### 参考链接： ####

- [shellinabox website][2]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/shellinabox-a-web-based-ajax-terminal-emulator/

作者：[SK][a]
译者：[xiaoyu33](https://github.com/xiaoyu33)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:https://code.google.com/p/shellinabox/wiki/shellinaboxd_man
[2]:https://code.google.com/p/shellinabox/
