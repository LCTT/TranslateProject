为你的 Linux 服务器加把锁
============================================================

> By: Steven J. Vaughan-Nichols

 ![](https://cdn-images-1.medium.com/max/800/1*DeQtDiP3I2sn0Ba7hO53DA.png) 

### 无论你使用的哪种 Linux 发行版，你都需要使用基于 iptables 的防火墙来保护它。

啊哈！你已经设置好了你的第一台 Linux 服务器并且已经准备发车了！是么？恩，慢着。

默认情况下，你的 Linux 系统对攻击者来说并非是足够安全的。当然，它比 Windows XP 要安全多了，但这说明不了什么。

想要使你的 Linux 系统真正稳固，你需要按照 [Linnode][1] 的 [服务器安全指南][2] 来操作。

总的来说，首先你必须关闭那些你不需要的服务。当然要这样做的话，你先要知道你正在使用哪些网络服务。

你可以使用 shell 命令来找到是哪些服务：

_netstat -tulpn_

[_Netstat_][3] 将会告诉你正在运行哪些服务和这些服务正在使用的端口是什么。如果你不需要其中的某项服务或端口，你就应该关闭它。例如，除非你正在运行一个网站，否则你是不需要运行中的 [Apache][4] 或 [Nginx][5] 服务器或者是开启的 80 或 8080 端口的。

总之一句话，犹豫的话，就关了它先。

在一个最简单的，没有做过任何额外更改的 Linux 服务器上，你会看到 [SSH][6], [RPC]7[] 和 [NTPdate][8] 运行在它们的公开端口上。不要添加像 [telnet][9] 这样陈旧的不安全的 shell 程序，否则老司机就会在你不经意间将你的 Linux 小跑车开走了。也许，在 80 年代的时候你喜欢把 telnet 当作你 SunOS 机器上的备份登录方式，但是那早已成为了过去。

就 SSH 来说，你应该使用 [RSA keys][10] 和 [Fail2Ban][11] 来加固。如果你需要 RPC 的话，那你应该知道我们会卸载它。

如何关门已经说的够多了;让我们来聊聊利用 iptables 来锁定进来的流量吧。

当你启动 Linux 服务器的时候它是没有任何规则的。这就意味着所有的流量都是被允许的。这当然是不好的。因此，你需要及时的设置你的防火墙。

Iptables 是一种用来给 [netfilter][12] 设置网络策略规则的 shell 工具，Linux 系统下的默认防火墙，利用一组规则来允许或禁止流量。当有人尝试连接上你的系统，iptables 就会不间断的来检查这些请求是否与规则列表相匹配。如果没有匹配到任何的规则，它就会采取默认操作。

这个默认操作应该是将链接 "Drop" 掉，来禁掉这些意图闯入者。同时这不会让他们知道这些网络探测行为发生了什么。（你也可以将链接 "Reject" 掉，但是者同时让他们知道你有一个运行中的 Linux 防火墙。当前来说，让陌生人能获取到我们系统的信息越少越好。至少，我是这么认为的。）

现在，你可以用 iptables 来设置你的防火墙了。我已经这么做了。另一方面，我曾骑着自行车去六英里外上班，并且两边都是上坡。现在，我开车去。

这其实指的是我使用 Fedora 发行版的 [FirewallD][13] 和 Debian 系发行版的 [UFW][14][Uncomplicated Firewall]。这些都是易用的 iptables shell 前端。你可以在以下的 Linode 指南中找到适合的使用方式：[FirewallD][15] 和 [UFW][16]。

从本质上来说设置这些规则就是在你的服务器上放置”非请勿入“的告示牌。用起来。

但是也别太兴奋，把所有的链接都关闭了。例如：

_sudo ufw default deny incoming_

看起来是个好主意哦。别忘了，它禁止了所有链接，包括你自己哦！

很好，它就是这么干的。这意味着它也同样禁止了 SSH 的登录。也就是说你再也不能登陆你那新服务器了。哇哦！

不过，如果你犯了错，错误的将多数的链接禁止了。你看，老司机也同样被你挡在门外了。

或者，更准确得说，这不是你或你的服务器所遇到的个别现象。当然，你也不是 [每天受到 3 亿多次攻击尝试的国家安全局（NSA）][17]。但是攻击脚本更本不在乎你是谁。它只是不断的检查寻找网络中存在已知漏洞的服务器。在平常的一天中我自己的小服务器就会受到数亿百计的攻击。

都这样了，你还在等什么呢？去吧，加固你的网络服务吧。安装 FirewallD 或者 UFW 来加固你的服务器吧。你会愿意去做的。

（这里的那段客套话，把它删掉了，感觉意义不大）

--------------------------------------------------------------------------------

via: https://medium.com/linode-cube/locking-down-your-linux-server-24d8516ae374#.qy8qq4bx2

作者：[Steven J. Vaughan-Nichols][a]
译者：[wcnnbdk1](https://github.com/wcnnbdk1)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/linode-cube/locking-down-your-linux-server-24d8516ae374#.qy8qq4bx2
[1]:https://www.linode.com/
[2]:https://www.linode.com/docs/security/securing-your-server
[3]:http://www.faqs.org/docs/linux_network/x-087-2-iface.netstat.html
[4]:https://httpd.apache.org/
[5]:https://www.nginx.com/
[6]:https://www.linode.com/docs/tools-reference/ssh/
[7]:http://www.linux.org/threads/tcp-ip-service-remote-procedure-call-rpc.4913/
[8]:https://help.ubuntu.com/lts/serverguide/NTP.html
[9]:http://www.telnet.org/htm/faq.htm
[10]:https://www.linode.com/docs/security/securing-your-server/#create-an-authentication-key-pair
[11]:https://www.linode.com/docs/security/securing-your-server/#use-fail2ban-for-ssh-login-protection
[12]:https://www.netfilter.org/
[13]:http://www.firewalld.org/
[14]:https://help.ubuntu.com/community/UFW
[15]:https://www.linode.com/docs/security/firewalls/introduction-to-firewalld-on-centos
[16]:https://www.linode.com/docs/security/firewalls/configure-firewall-with-ufw
[17]:http://thehackernews.com/2016/02/nsa-utah-data-center.html
[18]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[19]:http://www.pcmag.com/author-bio/steven-j.-vaughan-nichols
[20]:http://www.infoworld.com/author/Steven-J.-Vaughan_Nichols/
[21]:http://www.computerworld.com/author/Steven-J.-Vaughan_Nichols/
[22]:http://www.linuxtoday.com/author/Steven+J.+Vaughan-Nichols/
[23]:http://www.eweek.com/cp/bio/Steven-J.-Vaughan-Nichols/
