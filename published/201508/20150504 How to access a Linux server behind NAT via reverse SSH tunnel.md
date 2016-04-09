如何通过反向 SSH 隧道访问 NAT 后面的 Linux 服务器
================================================================================
你在家里运行着一台 Linux 服务器，它放在一个 NAT 路由器或者限制性防火墙后面。现在你想在外出时用 SSH 登录到这台服务器。你如何才能做到呢？SSH 端口转发当然是一种选择。但是，如果你需要处理多级嵌套的 NAT 环境，端口转发可能会变得非常棘手。另外，在多种 ISP 特定条件下可能会受到干扰，例如阻塞转发端口的限制性 ISP 防火墙、或者在用户间共享 IPv4 地址的运营商级 NAT。

### 什么是反向 SSH 隧道？ ###

SSH 端口转发的一种替代方案是 **反向 SSH 隧道**。反向 SSH 隧道的概念非常简单。使用这种方案，在你的受限的家庭网络之外你需要另一台主机（所谓的“中继主机”），你能从当前所在地通过 SSH 登录到它。你可以用有公网 IP 地址的 [VPS 实例][1] 配置一个中继主机。然后要做的就是从你的家庭网络服务器中建立一个到公网中继主机的永久 SSH 隧道。有了这个隧道，你就可以从中继主机中连接“回”家庭服务器（这就是为什么称之为 “反向” 隧道）。不管你在哪里、你的家庭网络中的 NAT 或 防火墙限制多么严格，只要你可以访问中继主机，你就可以连接到家庭服务器。

![](https://farm8.staticflickr.com/7742/17162647378_c7d9f10de8_b.jpg)

### 在 Linux 上设置反向 SSH 隧道 ###

让我们来看看怎样创建和使用反向 SSH 隧道。我们做如下假设：我们会设置一个从家庭服务器（homeserver）到中继服务器（relayserver）的反向 SSH 隧道，然后我们可以通过中继服务器从客户端计算机（clientcomputer） SSH 登录到家庭服务器。本例中的**中继服务器** 的公网 IP 地址是 1.1.1.1。

在家庭服务器上，按照以下方式打开一个到中继服务器的 SSH 连接。

    homeserver~$ ssh -fN -R 10022:localhost:22 relayserver_user@1.1.1.1

这里端口 10022 是任何你可以使用的端口数字。只需要确保中继服务器上不会有其它程序使用这个端口。

“-R 10022:localhost:22” 选项定义了一个反向隧道。它转发中继服务器 10022 端口的流量到家庭服务器的 22 号端口。

用 “-fN” 选项，当你成功通过 SSH 服务器验证时 SSH 会进入后台运行。当你不想在远程 SSH 服务器执行任何命令，就像我们的例子中只想转发端口的时候非常有用。

运行上面的命令之后，你就会回到家庭主机的命令行提示框中。

登录到中继服务器，确认其 127.0.0.1:10022 绑定到了 sshd。如果是的话就表示已经正确设置了反向隧道。

    relayserver~$ sudo netstat -nap | grep 10022

----------

    tcp      0    0 127.0.0.1:10022          0.0.0.0:*               LISTEN      8493/sshd           

现在就可以从任何其它计算机（客户端计算机）登录到中继服务器，然后按照下面的方法访问家庭服务器。

    relayserver~$ ssh -p 10022 homeserver_user@localhost

需要注意的一点是你在上面为localhost输入的 SSH 登录/密码应该是家庭服务器的，而不是中继服务器的，因为你是通过隧道的本地端点登录到家庭服务器，因此不要错误输入中继服务器的登录/密码。成功登录后，你就在家庭服务器上了。

### 通过反向 SSH 隧道直接连接到网络地址变换后的服务器 ###

上面的方法允许你访问 NAT 后面的 **家庭服务器**，但你需要登录两次：首先登录到 **中继服务器**，然后再登录到**家庭服务器**。这是因为中继服务器上 SSH 隧道的端点绑定到了回环地址（127.0.0.1）。

事实上，有一种方法可以只需要登录到中继服务器就能直接访问NAT之后的家庭服务器。要做到这点，你需要让中继服务器上的 sshd 不仅转发回环地址上的端口，还要转发外部主机的端口。这通过指定中继服务器上运行的 sshd 的 **GatewayPorts** 实现。

打开**中继服务器**的 /etc/ssh/sshd_conf 并添加下面的行。

    relayserver~$ vi /etc/ssh/sshd_conf

----------

    GatewayPorts clientspecified

重启 sshd。

基于 Debian 的系统：

    relayserver~$ sudo /etc/init.d/ssh restart

基于红帽的系统：

    relayserver~$ sudo systemctl restart sshd

现在在家庭服务器中按照下面方式初始化一个反向 SSH 隧道。

	homeserver~$ ssh -fN -R 1.1.1.1:10022:localhost:22 relayserver_user@1.1.1.1

登录到中继服务器然后用 netstat 命令确认成功建立的一个反向 SSH 隧道。

	relayserver~$ sudo netstat -nap | grep 10022

----------

    tcp      0      0 1.1.1.1:10022     0.0.0.0:*           LISTEN      1538/sshd: dev  

不像之前的情况，现在隧道的端点是 1.1.1.1:10022（中继服务器的公网 IP 地址），而不是 127.0.0.1:10022。这就意味着从外部主机可以访问隧道的另一端。

现在在任何其它计算机（客户端计算机），输入以下命令访问网络地址变换之后的家庭服务器。

    clientcomputer~$ ssh -p 10022 homeserver_user@1.1.1.1

在上面的命令中，1.1.1.1 是中继服务器的公共 IP 地址，homeserver_user必须是家庭服务器上的用户账户。这是因为你真正登录到的主机是家庭服务器，而不是中继服务器。后者只是中继你的 SSH 流量到家庭服务器。

### 在 Linux 上设置一个永久反向 SSH 隧道 ###

现在你已经明白了怎样创建一个反向 SSH 隧道，然后把隧道设置为 “永久”，这样隧道启动后就会一直运行（不管临时的网络拥塞、SSH 超时、中继主机重启，等等）。毕竟，如果隧道不是一直有效，你就不能可靠的登录到你的家庭服务器。

对于永久隧道，我打算使用一个叫 autossh 的工具。正如名字暗示的，这个程序可以让你的 SSH 会话无论因为什么原因中断都会自动重连。因此对于保持一个反向 SSH 隧道非常有用。

第一步，我们要设置从家庭服务器到中继服务器的[无密码 SSH 登录][2]。这样的话，autossh 可以不需要用户干预就能重启一个损坏的反向 SSH 隧道。

下一步，在建立隧道的家庭服务器上[安装 autossh][3]。

在家庭服务器上，用下面的参数运行 autossh 来创建一个连接到中继服务器的永久 SSH 隧道。

    homeserver~$ autossh -M 10900 -fN -o "PubkeyAuthentication=yes" -o "StrictHostKeyChecking=false" -o "PasswordAuthentication=no" -o "ServerAliveInterval 60" -o "ServerAliveCountMax 3" -R 1.1.1.1:10022:localhost:22 relayserver_user@1.1.1.1

“-M 10900” 选项指定中继服务器上的监视端口，用于交换监视 SSH 会话的测试数据。中继服务器上的其它程序不能使用这个端口。

“-fN” 选项传递给 ssh 命令，让 SSH 隧道在后台运行。

“-o XXXX” 选项让 ssh： 

- 使用密钥验证，而不是密码验证。
- 自动接受（未知）SSH 主机密钥。
- 每 60 秒交换 keep-alive 消息。
- 没有收到任何响应时最多发送 3 条 keep-alive 消息。

其余 SSH 隧道相关的选项和之前介绍的一样。

如果你想系统启动时自动运行 SSH 隧道，你可以将上面的 autossh 命令添加到 /etc/rc.local。

### 总结 ###

在这篇博文中，我介绍了你如何能从外部通过反向 SSH 隧道访问限制性防火墙或 NAT 网关之后的 Linux 服务器。这里我介绍了家庭网络中的一个使用事例，但在企业网络中使用时你尤其要小心。这样的一个隧道可能被视为违反公司政策，因为它绕过了企业的防火墙并把企业网络暴露给外部攻击。这很可能被误用或者滥用。因此在使用之前一定要记住它的作用。

--------------------------------------------------------------------------------

via: http://xmodulo.com/access-linux-server-behind-nat-reverse-ssh-tunnel.html

作者：[Dan Nanni][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xmodulo.com/go/digitalocean
[2]:https://linux.cn/article-5444-1.html
[3]:https://linux.cn/article-5459-1.html
