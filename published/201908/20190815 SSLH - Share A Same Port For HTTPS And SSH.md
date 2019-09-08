[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11247-1.html)
[#]: subject: (SSLH – Share A Same Port For HTTPS And SSH)
[#]: via: (https://www.ostechnix.com/sslh-share-port-https-ssh/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

SSLH：让 HTTPS 和 SSH 共享同一个端口
======

![SSLH - Share A Same Port For HTTPS And SSH][1]

一些 ISP 和公司可能已经阻止了大多数端口，并且只允许少数特定端口（如端口 80 和 443）访问来加强其安全性。在这种情况下，我们别无选择，但同一个端口可以用于多个程序，比如 HTTPS 端口 443，很少被阻止。通过 SSL/SSH 多路复用器 SSLH 的帮助，它可以侦听端口 443 上的传入连接。更简单地说，SSLH 允许我们在 Linux 系统上的端口 443 上运行多个程序/服务。因此，你可以同时通过同一个端口同时使用 SSL 和 SSH。如果你遇到大多数端口被防火墙阻止的情况，你可以使用 SSLH 访问远程服务器。这个简短的教程描述了如何在类 Unix 操作系统中使用 SSLH 让 https、ssh 共享相同的端口。

### SSLH：让 HTTPS、SSH 共享端口

#### 安装 SSLH

大多数 Linux 发行版上 SSLH 都有软件包，因此你可以使用默认包管理器进行安装。

在 Debian、Ubuntu 及其衍生品上运行：

```
$ sudo apt-get install sslh
```

安装 SSLH 时，将提示你是要将 sslh 作为从 inetd 运行的服务，还是作为独立服务器运行。每种选择都有其自身的优点。如果每天只有少量连接，最好从 inetd 运行 sslh 以节省资源。另一方面，如果有很多连接，sslh 应作为独立服务器运行，以避免为每个传入连接生成新进程。

![][2]

*安装 sslh*

在 Arch Linux 和 Antergos、Manjaro Linux 等衍生品上，使用 Pacman 进行安装，如下所示：

```
$ sudo pacman -S sslh
```

在 RHEL、CentOS 上，你需要添加 EPEL 存储库，然后安装 SSLH，如下所示：

```
$ sudo yum install epel-release
$ sudo yum install sslh
```

在 Fedora：

```
$ sudo dnf install sslh
```

如果它在默认存储库中不可用，你可以如[这里][3]所述手动编译和安装 SSLH。

#### 配置 Apache 或 Nginx Web 服务器

如你所知，Apache 和 Nginx Web 服务器默认会监听所有网络接口（即 `0.0.0.0:443`）。我们需要更改此设置以告知 Web 服务器仅侦听 `localhost` 接口（即 `127.0.0.1:443` 或 `localhost:443`）。

为此，请编辑 Web 服务器（nginx 或 apache）配置文件并找到以下行：

```
listen 443 ssl;
```

将其修改为：

```
listen 127.0.0.1:443 ssl;
```

如果你在 Apache 中使用虚拟主机，请确保你也修改了它。

```
VirtualHost 127.0.0.1:443
```

保存并关闭配置文件。不要重新启动该服务。我们还没有完成。

#### 配置 SSLH

使 Web 服务器仅在本地接口上侦听后，编辑 SSLH 配置文件：

```
$ sudo vi /etc/default/sslh
```

找到下列行：

```
Run=no
```

将其修改为：

```
Run=yes
```

然后，向下滚动一点并修改以下行以允许 SSLH 在所有可用接口上侦听端口 443（例如 `0.0.0.0:443`）。

```
DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssh 127.0.0.1:22 --ssl 127.0.0.1:443 --pidfile /var/run/sslh/sslh.pid"
```

这里，

  * `–user sslh`：要求在这个特定的用户身份下运行。
  * `–listen 0.0.0.0:443`：SSLH 监听于所有可用接口的 443 端口。
  * `–sshs 127.0.0.1:22` : 将 SSH 流量路由到本地的 22 端口。
  * `–ssl 127.0.0.1:443` : 将 HTTPS/SSL 流量路由到本地的 443 端口。

保存并关闭文件。

最后，启用并启动 `sslh` 服务以更新更改。

```
$ sudo systemctl enable sslh
$ sudo systemctl start sslh
```

#### 测试

检查 SSLH 守护程序是否正在监听 443。

```
$ ps -ef | grep sslh
sslh 2746 1 0 15:51 ? 00:00:00 /usr/sbin/sslh --foreground --user sslh --listen 0.0.0.0 443 --ssh 127.0.0.1 22 --ssl 127.0.0.1 443 --pidfile /var/run/sslh/sslh.pid
sslh 2747 2746 0 15:51 ? 00:00:00 /usr/sbin/sslh --foreground --user sslh --listen 0.0.0.0 443 --ssh 127.0.0.1 22 --ssl 127.0.0.1 443 --pidfile /var/run/sslh/sslh.pid
sk 2754 1432 0 15:51 pts/0 00:00:00 grep --color=auto sslh
```

现在，你可以使用端口 443 通过 SSH 访问远程服务器：

```
$ ssh -p 443 [email protected]
```

示例输出：

```
[email protected]'s password:
Welcome to Ubuntu 18.04.2 LTS (GNU/Linux 4.15.0-55-generic x86_64)

* Documentation: https://help.ubuntu.com
* Management: https://landscape.canonical.com
* Support: https://ubuntu.com/advantage

System information as of Wed Aug 14 13:11:04 IST 2019

System load: 0.23 Processes: 101
Usage of /: 53.5% of 19.56GB Users logged in: 0
Memory usage: 9% IP address for enp0s3: 192.168.225.50
Swap usage: 0% IP address for enp0s8: 192.168.225.51

* Keen to learn Istio? It's included in the single-package MicroK8s.

https://snapcraft.io/microk8s

61 packages can be updated.
22 updates are security updates.


Last login: Wed Aug 14 13:10:33 2019 from 127.0.0.1
```

![][4]

*通过 SSH 使用 443 端口访问远程系统*

看见了吗？即使默认的 SSH 端口 22 被阻止，我现在也可以通过 SSH 访问远程服务器。正如你在上面的示例中所看到的，我使用 https 端口 443 进行 SSH 连接。

我在我的 Ubuntu 18.04 LTS 服务器上测试了 SSLH，它如上所述工作得很好。我在受保护的局域网中测试了 SSLH，所以我不知道是否有安全问题。如果你在生产环境中使用它，请在下面的评论部分中告诉我们使用 SSLH 的优缺点。

有关更多详细信息，请查看下面给出的官方 GitHub 页面。

资源：

* [SSLH GitHub 仓库][12]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/sslh-share-port-https-ssh/

作者：[sk][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2017/08/SSLH-Share-A-Same-Port-For-HTTPS-And-SSH-1-720x340.jpg
[2]: https://www.ostechnix.com/wp-content/uploads/2017/08/install-sslh.png
[3]: https://github.com/yrutschle/sslh/blob/master/doc/INSTALL.md
[4]: https://www.ostechnix.com/wp-content/uploads/2017/08/Access-remote-systems-via-SSH-using-port-443.png
[5]: https://www.ostechnix.com/how-to-ssh-into-a-particular-directory-on-linux/
[6]: https://www.ostechnix.com/how-to-create-ssh-alias-in-linux/
[7]: https://www.ostechnix.com/configure-ssh-key-based-authentication-linux/
[8]: https://www.ostechnix.com/how-to-stop-ssh-session-from-disconnecting-in-linux/
[9]: https://www.ostechnix.com/allow-deny-ssh-access-particular-user-group-linux/
[10]: https://www.ostechnix.com/4-ways-keep-command-running-log-ssh-session/
[11]: https://www.ostechnix.com/scanssh-fast-ssh-server-open-proxy-scanner/
[12]: https://github.com/yrutschle/sslh
