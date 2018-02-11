使用 TLS 加密保护 VNC 服务器的简单指南
======

在本教程中，我们将学习安装 VNC 服务器并使用 TLS 加密保护 VNC 会话。

此方法已经在 CentOS 6＆7 上测试过了，但是也可以在其它的版本/操作系统上运行（RHEL、Scientific Linux 等）。

**（推荐阅读：[保护 SSH 会话终极指南][1]）**

### 安装 VNC 服务器

在机器上安装 VNC 服务器之前，请确保我们有一个可用的 GUI（图形用户界面）。如果机器上还没有安装 GUI，我们可以通过执行以下命令来安装：

```
yum groupinstall "GNOME Desktop"
```

现在我们将 tigervnc 作为我们的 VNC 服务器，运行下面的命令运行：

```
# yum install tigervnc-server
```

安装完成后，我们将创建一个新的用户访问服务器：

```
# useradd vncuser
```

并使用以下命令为其分配访问 VNC 的密码：

```
# vncpasswd vncuser
```

我们在 CentOS 6&7 上配置会有一点改变，我们首先看 CentOS 6 的配置。

#### CentOS 6

现在我们需要编辑 VNC 配置文件：

```
# vim /etc/sysconfig/vncservers
```

并添加下面这几行：

```
[ …]
VNCSERVERS= "1:vncuser"
VNCSERVERARGS[1]= "-geometry 1024×768″
```

保存文件并退出。接下来重启 vnc 服务使改动生效：

```
# service vncserver restart
```

并在启动时启用它：

```
# chkconfig vncserver on
```

#### CentOS 7

在 CentOS 7 上，`/etc/sysconfig/vncservers` 已经改为 `/lib/systemd/system/vncserver@.service`。我们将使用这个配置文件作为参考，所以创建一个文件的副本，

```
# cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
```

接下来，我们将编辑文件以包含我们创建的用户：

```
# vim /etc/systemd/system/vncserver@:1.service
```

编辑下面 2 行中的用户：

```
ExecStart=/sbin/runuser -l vncuser -c "/usr/bin/vncserver %i"
PIDFile=/home/vncuser/.vnc/%H%i.pid
```

保存文件并退出。接下来重启服务并在启动时启用它：

```
# systemctl restart vncserver@:1.service
# systemctl enable vncserver@:1.service
```

现在我们已经设置好了 VNC 服务器，并且可以使用 VNC 服务器的 IP 地址从客户机连接到它。但是，在此之前，我们将使用 TLS 加密保护我们的连接。

### 保护 VNC 会话

要保护 VNC 会话，我们将首先配置加密方法。我们将使用 TLS 加密，但也可以使用 SSL 加密。执行以下命令在 VNC 服务器上使用 TLS 加密：

```
# vncserver -SecurityTypes=VeNCrypt,TLSVnc
```

你将被要求输入密码来访问 VNC（如果使用其他用户，而不是上述用户）。

![secure vnc server][4]

现在，我们可以使用客户机上的 VNC 浏览器访问服务器，使用以下命令以安全连接启动 vnc 浏览器：

```
# vncviewer -SecurityTypes=VeNCrypt,TLSVnc 192.168.1.45:1
```

这里，192.168.1.45 是 VNC 服务器的 IP 地址。

![secure vnc server][6]

输入密码，我们可以远程访问服务器，并且也是 TLS 加密的。

这篇教程就完了，欢迎随时使用下面的评论栏提交你的建议或疑问。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/secure-vnc-server-tls-encryption/

作者：[Shusain][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/ultimate-guide-to-securing-ssh-sessions/
[2]:/cdn-cgi/l/email-protection
[3]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=642%2C241
[4]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2017/10/secure_vnc-1.png?resize=642%2C241
[5]:https://i1.wp.com/linuxtechlab.com/wp-content/plugins/a3-lazy-load/assets/images/lazy_placeholder.gif?resize=665%2C419
[6]:https://i2.wp.com/linuxtechlab.com/wp-content/uploads/2017/10/secure_vnc-2.png?resize=665%2C419
