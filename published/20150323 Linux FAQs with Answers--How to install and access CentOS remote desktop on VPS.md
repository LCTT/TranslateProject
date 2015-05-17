Linux有问必答：如何在VPS上安装和访问CentOS 7远程桌面
================================================================================
> **提问**: 我想在VPS中安装CentOS桌面，并可以直接从我家远程访问GUI桌面。在VPS上设置和访问CentOS远程桌面有什么建议吗？

如何远程办公或者远程弹性化工作制在技术领域正变得越来越流行。这个趋势背后的一个技术就是远程桌面。你的桌面环境在云中，你可以在任何你去的地方，或者在家或者工作场所访问你的远程桌面。

这个教程介绍如何VPS中设置基于CentOS的远程桌面。现在，我们会先展示CentOS的基础环境。

我们假设你已经创建了CentOS 7的VPS实例（比如，使用[DigitalOcean][1] 或者 Amazon EC2）。请确保你的VPS实例有至少1GB的内存。不然，CentOS将会在你访问远程桌面的时候回崩溃。

### 第一步： 安装CentOS桌面 ###

如果你现在安装的CentOS版本是没有桌面的最小版本，你需要先在VPS上安装桌面（比如GNOME）。比如，DigitalOcean的镜像就是最小版本，它需要如下安装[桌面GUI][2]

    # yum groupinstall "GNOME Desktop" 

在安装完成之后重启VPS。

### 第二步：安装和配置VNC服务器 ###

接下来就是安装和配置VNC服务器。我们使用的是TigerVNC,一个开源的VNC服务实现。

    # yum install tigervnc-server 

现在创建一个用户账户（比如：xmodulo）用来访问远程桌面。

    # useradd xmodulo
    # passwd xmodulo 

当一个用户尝试使用VNC访问远程桌面时，VNC守护进程就会启动来处理这个请求。这意味着你需要为每个用户创建一个独立的VNC配置文件。

CentOS依靠systemd来管理和配置系统服务。所以我们将使用systemd来为用户xmodulo配置VNC服务器。

首先让我们使用下面任意一条命令来检查VNC服务器的状态。

    # systemctl status vncserver@:.service
    # systemctl is-enabled vncserver@.service 

默认的，刚安装的VNC服务并没有激活(禁用)。

![](https://farm8.staticflickr.com/7613/16877514732_8ccffe7b6b_b.jpg)

现在复制一份通用的VNC服务文件来为用户xmodulo创建一个VNC服务配置。

    # cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service 

用本文编辑器来打开配置文件，用实际的用户名（比如：xmodulo）来替换[Service]下面的<USER>。同样。在ExecStart后面追加 "-geometry <resolution>" 参数。最后，要修改下面“ExecStart”和“PIDFile”两行。

    # vi /etc/systemd/system/vncserver@:1.service 

----------

    [Service]
    Type=forking
    # Clean any existing files in /tmp/.X11-unix environment
    ExecStartPre=/bin/sh -c '/usr/bin/vncserver -kill %i > /dev/null 2>&1 || :'
    ExecStart=/sbin/runuser -l xmodulo -c "/usr/bin/vncserver %i -geometry 1024x768"
    PIDFile=/home/xmodulo/.vnc/%H%i.pid
    ExecStop=/bin/sh -c '/usr/bin/vncserver -kill %i > /dev/null 2>&1 || :'

现在为用户xmodulo设置密码（可选）。首先切换到该用户，并运行vncserver命令。

    # su - xmodulo
    # vncserver

你会被提示输入用户的VNC密码。密码设置完成后，你下次需要用这个密码来访问你的远程桌面。

![](https://farm9.staticflickr.com/8752/16692564599_9c4e5da1b6_b.jpg)

最后，重新加载服务来使新的VNC配置生效：

    # systemctl daemon-reload

在启动时自动启动VNC服务：

    # systemctl enable vncserver@:1.service

检查vnc服务正在监听的端口：

    # netstat -tulpn | grep vnc 

![](https://farm8.staticflickr.com/7625/16692646729_7bb16c4897_b.jpg)

端口5901是VNC默认的客户端连接到VNC服务器使用的端口。

### 第三步：通过SSH连接到远程桌面 ###

从设计上说，VNC使用的远程帧缓存（RFB）并不是一种安全的协议，那么在VNC客户端上直接连接到VNC服务器上并不是一个好主意。任何敏感信息比如密码都可以在VNC流量中被轻易地泄露。因此，我强烈建议使用SSH隧道来[加密你的VNC流量][3]。

在你要运行VNC客户端的本机上，使用下面的命令来创建一个连接到远程VPS的SSH通道。当被要输入SSH密码时，输入用户的密码。

    $ ssh xmodulo@<VPS-IP-address> -L 5901:127.0.0.1:5901 

用你自己的VNC用户名来替换“xmodulo”，并填上你自己的VPS IP地址。

一旦SSH通道建立之后，远程VNC流量就会通过ssh通道路由并发送到127.0.0.1:5901。

现在启动你最爱的VNC客户端（比如：vinagre），来连接到127.0.0.1:5901。

![](https://farm8.staticflickr.com/7639/16691289910_fae83510fb_o.png)

你将被要求输入VNC密码。当你输入VNC密码时，你就可以安全地连接到CentOS的远程桌面了。

![](https://farm8.staticflickr.com/7614/16877678411_aa8349f6b1_c.jpg)

![](https://farm9.staticflickr.com/8702/16256320434_81f9b5b70c_c.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/centos-remote-desktop-vps.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://xmodulo.com/go/digitalocean
[2]:http://xmodulo.com/how-to-install-gnome-desktop-on-centos.html
[3]:http://xmodulo.com/how-to-set-up-vnc-over-ssh.html
