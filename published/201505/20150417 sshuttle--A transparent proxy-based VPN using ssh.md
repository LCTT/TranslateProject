sshuttle：一个使用ssh的基于VPN的透明代理
================================================================================
sshuttle 允许你通过 ssh 创建一条从你电脑连接到任何远程服务器的 VPN 连接，只要你的服务器支持  python2.3 或则更高的版本。你必须有本机的 root 权限，但是你可以在服务端有普通账户即可。

你可以在一台机器上同时运行多次 sshuttle 来连接到不同的服务器上，这样你就可以同时使用多个 VPN， sshuttle可以转发你子网中所有流量到VPN中。

### 在Ubuntu中安装sshuttle ###

在终端中输入下面的命令

    sudo apt-get install sshuttle

### 使用 sshuttle ###

#### sshuttle 语法 ####

    sshuttle [options...] [-r [username@]sshserver[:port]] [subnets]

#### 选项细节 ####

-r, —remote=[username@]sshserver[:port]

远程主机名和可选的用户名，用于连接远程服务器的ssh端口号。比如example.com、testuser@example.com、testuser@example.com:2222或者example.com:2244。

#### sshuttle 例子 ####

在机器中使用下面的命令：

    sudo sshuttle -r username@sshserver 0.0.0.0/0 -vv

当开始后，sshuttle会创建一个ssh会话到由-r指定的服务器。如果-r被丢了，它会在本地运行客户端和服务端，这个有时会在测试时有用。

连接到远程服务器后，sshuttle会上传它的（python）源码到远程服务器并执行。所以，你就不需要在远程服务器上安装sshuttle，并且客户端和服务器端间不会存在sshuttle版本冲突。

#### 手册中的更多例子 ####

代理所有的本地连接用于本地测试，没有使用ssh：

    $ sudo sshuttle -v 0/0
    
    Starting sshuttle proxy.
    Listening on (‘0.0.0.0′, 12300).
    [local sudo] Password:
    firewall manager ready.
    c : connecting to server...
    s: available routes:
    s: 192.168.42.0/24
    c : connected.
    firewall manager: starting transproxy.
    c : Accept: ‘192.168.42.106':50035 -> ‘192.168.42.121':139.
    c : Accept: ‘192.168.42.121':47523 -> ‘77.141.99.22':443.
    ...etc...
    ^C
    firewall manager: undoing changes.
    KeyboardInterrupt
    c : Keyboard interrupt: exiting.
    c : SW#8:192.168.42.121:47523: deleting
    c : SW#6:192.168.42.106:50035: deleting

测试到远程服务器上的连接，自动猜测主机名和子网：

    $ sudo sshuttle -vNHr example.org
    
    Starting sshuttle proxy.
    Listening on (‘0.0.0.0′, 12300).
    firewall manager ready.
    c : connecting to server...
    s: available routes:
    s: 77.141.99.0/24
    c : connected.
    c : seed_hosts: []
    firewall manager: starting transproxy.
    hostwatch: Found: testbox1: 1.2.3.4
    hostwatch: Found: mytest2: 5.6.7.8
    hostwatch: Found: domaincontroller: 99.1.2.3
    c : Accept: ‘192.168.42.121':60554 -> ‘77.141.99.22':22.
    ^C
    firewall manager: undoing changes.
    c : Keyboard interrupt: exiting.
    c : SW#6:192.168.42.121:60554: deleting

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/sshuttle-a-transparent-proxy-based-vpn-using-ssh.html

作者：[ruchi][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
