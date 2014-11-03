Linux有问必答：如何修复“X11 forwarding request failed on channel 0”错误
================================================================================
> **问题**: 当我尝试使用SSH的X11转发选项连接到远程主机时, 我在登录时遇到了一个 "X11 forwarding request failed on channel 0" （X11 转发请求在通道0上失败）的错误。 我为什么会遇到这个错误，并且该如何修复它

![](https://farm6.staticflickr.com/5562/14909594691_ce7ca01b2d_z.jpg)

首先，我们假设你已经正确启用了[SSH的X11转发][1]。 

如果你在登录时遇到"X11 forwarding request failed on channel 0" （X11 转发请求在通道0上失败），这里可能有不同的原因，解决的方法也不同。

### 方案一 ###

出于安全原因，OpenSSH服务默认将X11转发请求绑定到本地回环地址上，并且在DISPLAY环境变量中将主机名设置为“localhost”。在这样的设定下，一些
X11客户端不能正确处理X11转发，这会导致报告中的错误。要解决这个问题，在/etc/ssh/sshd配置文件中加入下面这几行，它可以将X11转发请求绑定到外网卡地址上。

    $ sudo vi /etc/ssh/sshd_config 

----------

    X11Forwarding yes
    X11UseLocalhost no

重启SSH使设置生效:

    $ sudo /etc/init.d/ssh restart (Debian 6, Ubuntu or Linux Mint)
    $ sudo systemctl restart ssh.service (Debian 7, CentOS/RHEL 7, Fedora)
    $ sudo service sshd restart (CentOS/RHEL 6) 

### 方案二 ###

如果远程主机的SSH服务禁止了IPv6，那么X11转发失败的错误也有可能发生。要解决这个情况下的错误。打开/etc/ssh/sshd配置文件，取消对"AddressFamily all" （如果有这条的话）的注释。接着加入下面这行。这会强制SSH服务只使用IPv4而不是IPv6。（LCTT 译注：此处恐有误，AddressFamily 没有 all 这个参数，而 any 代表同时支持 IPv6和 IPv4，以此处的场景而言，应该是关闭IPv6支持，只支持 IPv4，所以此处应该是“注释掉 AddressFamily any”才对。）

    $ sudo vi /etc/ssh/sshd_config 

----------

    AddressFamily inet

再说一次，重启SSH服务来完成设置

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/fix-broken-x11-forwarding-ssh.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2012/11/how-to-enable-x11-forwarding-using-ssh.html