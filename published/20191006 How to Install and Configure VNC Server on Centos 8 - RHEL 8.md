[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11458-1.html)
[#]: subject: (How to Install and Configure VNC Server on Centos 8 / RHEL 8)
[#]: via: (https://www.linuxtechi.com/install-configure-vnc-server-centos8-rhel8/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

如何在 Centos 8 / RHEL 8 上安装和配置 VNC 服务器
======

VNC（<ruby>虚拟网络计算<rt>Virtual Network Computing</rt></ruby>）服务器是基于 GUI 的桌面共享平台，它可让你访问远程桌面计算机。在 Centos 8 和 RHEL 8 系统中，默认未安装 VNC 服务器，它需要手动安装。在本文中，我们将通过简单的分步指南，介绍如何在 Centos 8 / RHEL 8 上安装 VNC 服务器。

### 在 Centos 8 / RHEL 8 上安装 VNC 服务器的先决要求

要在你的系统中安装 VNC 服务器，请确保你的系统满足以下要求：

  * CentOS 8 / RHEL 8
  * GNOME 桌面环境
  * root 用户权限
  * DNF / YUM 软件包仓库

### 在 Centos 8 / RHEL 8 上安装 VNC 服务器的分步指导

#### 步骤 1）安装 GNOME 桌面环境

在 CentOS 8 / RHEL 8 中安装 VNC 服务器之前，请确保已安装了桌面环境（DE）。如果已经安装了 GNOME 桌面或安装了 GUI 支持，那么可以跳过此步骤。

在 CentOS 8 / RHEL 8 中，GNOME 是默认的桌面环境。如果你的系统中没有它，请使用以下命令进行安装：

```
[root@linuxtechi ~]# dnf groupinstall "workstation"
或者
[root@linuxtechi ~]# dnf groupinstall "Server with GUI
```

成功安装上面的包后，请运行以下命令启用图形模式：

```
[root@linuxtechi ~]# systemctl set-default graphical
```

现在重启系统，进入 GNOME 登录页面（LCTT 译注：你可以通过切换运行态来进入图形界面）。

```
[root@linuxtechi ~]# reboot
```

重启后，请取消注释 `/etc/gdm/custom.conf` 中的 `WaylandEnable=false`，以使通过 vnc 进行的远程桌面会话请求由 GNOME 桌面的 xorg 处理，来代替 Wayland 显示管理器。

注意： Wayland 是 GNOME 中的默认显示管理器 （GDM），并且未配置用于处理 X.org 等远程渲染的 API。

#### 步骤 2）安装 VNC 服务器（tigervnc-server）

接下来，我们将安装 VNC 服务器，有很多 VNC 服务器可以选择，出于安装目的，我们将安装 `TigerVNC 服务器`。它是最受欢迎的 VNC 服务器之一，并且高性能还独立于平台，它使用户可以轻松地与远程计算机进行交互。

现在，使用以下命令安装 TigerVNC 服务器：

```
[root@linuxtechi ~]# dnf install tigervnc-server tigervnc-server-module -y
```

#### 步骤 3）为本地用户设置 VNC 密码

假设我们希望用户 `pkumar` 使用 VNC 进行远程桌面会话，然后切换到该用户并使用 `vncpasswd` 命令设置其密码，

```
[root@linuxtechi ~]# su - pkumar
[root@linuxtechi ~]$ vncpasswd
Password:
Verify:
Would you like to enter a view-only password (y/n)? n
A view-only password is not used
[root@linuxtechi ~]$
[root@linuxtechi ~]$ exit
logout
[root@linuxtechi ~]#
```

#### 步骤 4）设置 VNC 服务器配置文件

下一步是配置 VNC 服务器配置文件。创建含以下内容的 `/etc/systemd/system/vncserver@.service`，以便为上面的本地用户 `pkumar` 启动 tigervnc-server 的服务。

```
[root@linuxtechi ~]# vim /etc/systemd/system/vncserver@.service
[Unit]
Description=Remote Desktop VNC Service
After=syslog.target network.target

[Service]
Type=forking
WorkingDirectory=/home/pkumar
User=pkumar
Group=pkumar

ExecStartPre=/bin/sh -c '/usr/bin/vncserver -kill %i > /dev/null 2>&1 || :'
ExecStart=/usr/bin/vncserver -autokill %i
ExecStop=/usr/bin/vncserver -kill %i

[Install]
WantedBy=multi-user.target
```

保存并退出文件，

注意：替换上面文件中的用户名为你自己的。

默认情况下，VNC 服务器在 tcp 端口 5900+n 上监听，其中 n 是显示端口号，如果显示端口号为 “1”，那么 VNC 服务器将在 TCP 端口 5901 上监听其请求。

#### 步骤 5）启动 VNC 服务并允许防火墙中的端口

我将显示端口号设置为 1，因此请使用以下命令在显示端口号 “1” 上启动并启用 vnc 服务，

```
[root@linuxtechi ~]# systemctl daemon-reload
[root@linuxtechi ~]# systemctl start vncserver@:1.service
[root@linuxtechi ~]# systemctl enable vncserver@:1.service
Created symlink /etc/systemd/system/multi-user.target.wants/vncserver@:1.service → /etc/systemd/system/vncserver@.service.
[root@linuxtechi ~]#
```

使用下面的 `netstat` 或 `ss` 命令来验证 VNC 服务器是否开始监听 5901 上的请求，

```
[root@linuxtechi ~]# netstat -tunlp | grep 5901
tcp        0      0 0.0.0.0:5901            0.0.0.0:*               LISTEN      8169/Xvnc
tcp6       0      0 :::5901                 :::*                    LISTEN      8169/Xvnc
[root@linuxtechi ~]# ss -tunlp | grep -i 5901
tcp   LISTEN  0       5                    0.0.0.0:5901           0.0.0.0:*      users:(("Xvnc",pid=8169,fd=6))                    
tcp   LISTEN  0       5                       [::]:5901              [::]:*      users:(("Xvnc",pid=8169,fd=7))                    
[root@linuxtechi ~]#
```

使用下面的 `systemctl` 命令验证 VNC 服务器的状态，

```
[root@linuxtechi ~]# systemctl status vncserver@:1.service
```

![vncserver-status-centos8-rhel8][2]

上面命令的输出确认在 tcp 端口 5901 上成功启动了 VNC。使用以下命令在系统防火墙中允许 VNC 服务器端口 “5901”，

```
[root@linuxtechi ~]# firewall-cmd --permanent --add-port=5901/tcp
success
[root@linuxtechi ~]# firewall-cmd --reload
success
[root@linuxtechi ~]#
```

#### 步骤 6）连接到远程桌面会话

现在，我们已经准备就绪，可以查看远程桌面连接是否正常工作。要访问远程桌面，请在 Windows / Linux 工作站中启动 VNC Viewer，然后输入 VNC 服务器的 IP 地址和端口号，然后按回车。

![VNC-Viewer-Windows10][3]

接下来，它将询问你的 VNC 密码。输入你先前为本地用户创建的密码，然后单击 “OK” 继续。

![VNC-Viewer-Connect-CentOS8-RHEL8-VNC-Server][4]

现在你可以看到远程桌面，

![VNC-Desktop-Screen-CentOS8][5]

就是这样，你已经在 Centos 8 / RHEL 8 中成功安装了 VNC 服务器。

### 总结

希望这篇在 Centos 8 / RHEL 8 上安装 VNC 服务器的分步指南为你提供了轻松设置 VNC 服务器并访问远程桌面的所有信息。请在下面的评论栏中提供你的意见和建议。下篇文章再见。谢谢再见！！！

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-configure-vnc-server-centos8-rhel8/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/cdn-cgi/l/email-protection
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/10/vncserver-status-centos8-rhel8.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/10/VNC-Viewer-Windows10.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/10/VNC-Viewer-Connect-CentOS8-RHEL8-VNC-Server.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/10/VNC-Desktop-Screen-CentOS8.jpg
