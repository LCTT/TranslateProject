如何在CentOS 7中禁止IPv6
================================================================================
最近，我的一位朋友问我该如何禁止IPv6。在搜索了一番之后，我找到了下面的方案。下面就是在我的CentOS 7 迷你服务器禁止IPv6的方法。

你可以用两个方法做到这个。

### 方法 1 ###

编辑文件**/etc/sysctl.conf**，

    vi /etc/sysctl.conf

添加下面的行：

    net.ipv6.conf.all.disable_ipv6 = 1
    net.ipv6.conf.default.disable_ipv6 = 1

如果你想要为特定的网卡禁止IPv6，比如，对于enp0s3，添加下面的行。

    net.ipv6.conf.enp0s3.disable_ipv6 = 1

保存并退出文件。

执行下面的命令来使设置生效。

    sysctl -p

### 方法 2 ###

要在运行的系统中禁止IPv6，依次输入下面的命令：

    echo 1 > /proc/sys/net/ipv6/conf/all/disable_ipv6
    echo 1 > /proc/sys/net/ipv6/conf/default/disable_ipv6

或者，

    sysctl -w net.ipv6.conf.all.disable_ipv6=1
    sysctl -w net.ipv6.conf.default.disable_ipv6=1

就是这样。现在IPv6已经禁止了。

### 我在禁止IPv6后遇到问题怎么办 ###

你可能在禁止IPv6后遇到一些问题

#### 问题1： ####

如果你在禁止IPv6后SSH遇到问题，按照下面的做。

编辑 **/etc/ssh/sshd_config** 文件

vi /etc/ssh/sshd_config

找到下面的行：

    #AddressFamily any

把它改成：

    AddressFamily inet

或者，在这行的前面去掉注释**(#)**：

    #ListenAddress 0.0.0.0

接着重启ssh来使改变生效。

    systemctl restart sshd

#### 问题2： ####

如果你在禁止Ipv6后启动postfix遇到问题，编辑**/etc/postfix/main.cf**：

    vi /etc/postfix/main.cf

注释掉配置中的localhost部分，并且使用ipv4回环。

    #inet_interfaces = localhost
    inet_interfaces = 127.0.0.1

就是这样，干杯！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/disable-ipv6-centos-7/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/