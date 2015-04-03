如何在Ubuntu14.04上安装轻量级web服务器Cherokee
================================================================================
**Cherokee** 是一个免费，开源，高性能轻量级的多特性web服务器，支持大部分主流操作系统(Linux, Mac OS X, Solaris, and BSD)。它兼容TLS/SSL,FastCGI, SCGI, PHP, uWSGI, SSI, CGI, LDAP, HTTP代理, 视频流处理, 内容缓存, 流量控制, 虚拟主机, 和Apache兼容的日志文件，还有负载均衡。

今天我们介绍一下怎样在Ubuntu Server 14.04LTS安装和配置轻量级的web服务器Cherokee，只需要注意修改源列表，同样适用于Ubuntu12.04，12.10和13.04.

在Ubuntu Server上逐步安装和配置Cherokee

### 1. 更新Ubuntu软件包索引 ###

首先登陆Ubuntu Server，执行以下命令，更新Ubuntu Server的软件源并安装可用的更新。

    sudo apt-get update

    sudo apt-get upgrade

### 2. 加入 PPA ###

通过运行以下命令增加Cherokee的PPA

    sudo add-apt-repository ppa:cherokee-webserver

    sudo apt-get update

对于运行14.04版本的服务器还需要执行以下步骤

    cd /etc/apt/sources.list.d

    nano cherokee-webserver-ppa-trusty.list

    用deb http://ppa.launchpad.net/cherokee-webserver/ppa/ubuntu saucy main 替换 deb http://ppa.launchpad.net/cherokee-webserver/ppa/ubuntu trusty main

**再次运行命令:**

    sudo apt-get update

### 3. 使用apt-get安装Cherokee ###
使用如下命令安装Cherokee和SSL模块

    sudo apt-get install cherokee cherokee-admin cherokee-doc libcherokee-mod-libssl libcherokee-mod-streaming libcherokee-mod-rrd

### 4. 配置Cherokee ###
重启Cherokee服务：

    sudo service cherokee start

使用Cherokee最大的好处就是能通过一个简单易用的web接口cherokee-admin来管理所有的配置选项。这是通过浏览器管理Cherokee的推荐方法。使用如下命令启动cherokee-admin

    sudo cherokee-admin

**Note: cherokee-admin 会显示用户名，一次密码和web管理界面。**

默认情况下，只能通过localhost访问Cherokee-admin，如果需要通过其它网络地址来访问，可以使用‘**-b**’参数。如果不指定任何IP地址，Cherokee-admin会自动监听所有网络端口。然后就可以通过网络访问Cherokee-admin

    sudo cherokee-admin -b

通过指定IP地址访问Cherokee-admin

    sudo cherokee-admin -b 192.168.1.102

### 5 浏览cherokee-admin面板 ###

在你喜欢的浏览器中输入地址http://hostname_or_IP:9090/就可以进入控制面板了。例如我的是http://127.0.0.1:9090/，在浏览器中显示如下图

![cherokee-admin-panel](http://blog.linoxide.com/wp-content/uploads/2014/12/cherokee-admin.png)

好了，到这里我们已经成功地在Ubuntu Server上安装和配置了Cherokee

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-cherokee-lightweight-web-server-ubuntu-14-04/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
