在CentOS/RHEL/Scientific Linux 6 & 7 上安装Telnet
================================================================================

#### 声明： ####

在安装和使用Telnet之前，需要记住以下几点。

- 在公网(WAN)中使用Telnet是非常不好的想法。它会以明文的格式传输登入数据。每个人都可以看到明文。
- 如果你还是需要Telnet，强烈建议你只在局域网内部使用。
- 你可以使用**SSH**作为替代方法。但是确保不要用root用户登录。

### Telnet是什么？ ###

[Telnet][1] 是用于通过TCP/IP网络远程登录计算机的协议。一旦与远程计算机建立了连接，它就会成为一个虚拟终端且允许你与远程计算机通信。

在本篇教程中，我们会展示如何安装Telnet并且如何通过Telnet访问远程系统。

### 安装 ###

打开终端并输入下面的命令来安装telnet：

    yum install telnet telnet-server -y

现在telnet已经安装在你的服务器上了。接下来编辑文件**/etc/xinetd.d/telnet**：

    vi /etc/xinetd.d/telnet

设置 **disable = no**:

    # default: on
    # description: The telnet server serves telnet sessions; it uses \
    #       unencrypted username/password pairs for authentication.
    service telnet
    {
            flags           = REUSE
            socket_type     = stream
            wait            = no
            user            = root
            server          = /usr/sbin/in.telnetd
            log_on_failure  += USERID
            disable         = no
    }

保存并退出文件。记住我们不必在CentOS 7做这步。

接下来使用下面的命令重启telnet服务：

在CentOS 6.x 系统中：

    service xinetd start

让这个服务在每次重启时都会启动：

在CentOS 6上：

    chkconfig telnet on
    chkconfig xinetd on

在CentOS 7上：

    systemctl start telnet.socket
    systemctl enable telnet.socket

让telnet的默认端口**23**可以通过防火墙和路由器。要让telnet端口可以通过防火墙，在CentOS 6.x系统中编辑下面的文件：

    vi /etc/sysconfig/iptables

加入如下行“-A INPUT -p tcp -m state --state NEW --dport 23 -j ACCEPT”：

    # Firewall configuration written by system-config-firewall
    # Manual customization of this file is not recommended.
    *filter
    :INPUT ACCEPT [0:0]
    :FORWARD ACCEPT [0:0]
    :OUTPUT ACCEPT [0:0]
    -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
    -A INPUT -p icmp -j ACCEPT
    -A INPUT -i lo -j ACCEPT
    -A INPUT -p tcp -m state --state NEW --dport 23 -j ACCEPT
    -A INPUT -m state --state NEW -m tcp -p tcp --dport 22 -j ACCEPT
    -A INPUT -j REJECT --reject-with icmp-host-prohibited
    -A FORWARD -j REJECT --reject-with icmp-host-prohibited
    COMMIT

保存并退出文件。重启iptables服务：

    service iptables restart

在CentOS 7中，运行下面的命令让telnet服务可以通过防火墙。

    firewall-cmd --permanent --add-port=23/tcp
    firewall-cmd --reload

就是这样。现在telnet服务就可以使用了。

#### 创建用户 ####

创建一个测试用户，比如用户名是“**sk**”，密码是“**centos**“:

    useradd sk
    passwd sk

#### 客户端配置 ####

安装telnet包：

    yum install telnet

在基于DEB的系统中：

    sudo apt-get install telnet

现在，打开终端，尝试访问你的服务器（远程主机）。

如果你的客户端是Linux系统，打开终端并输入下面的命令来连接到telnet服务器上。

    telnet 192.168.1.150

输入服务器上已经创建的用户名和密码：

示例输出:

    Trying 192.168.1.150...
    Connected to 192.168.1.150.
    Escape character is '^]'.
    
    Kernel 3.10.0-123.13.2.el7.x86_64 on an x86_64
    server1 login: sk
    Password: 
    [sk@server1 ~]$

如你所见，已经成功从本地访问远程主机了。

如果你的系统是windows，进入**开始 -> 运行 -> 命令提示符**。

在命令提示符中，输入命令：

    telnet 192.168.1.150

**192.168.1.150**是远程主机IP地址。

现在你就可以连接到你的服务器上了。

就是这样。

干杯！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/installing-telnet-centosrhelscientific-linux-6-7/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://en.wikipedia.org/wiki/Telnet