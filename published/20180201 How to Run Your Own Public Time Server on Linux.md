如何在 Linux 上运行你自己的公共时间服务器
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/eddington_a._space_time_and_gravitation._fig._9.jpg?itok=KgNqViyZ)

最重要的公共服务之一就是<ruby>报时<rt>timekeeping</rt></ruby>，但是很多人并没有意识到这一点。大多数公共时间服务器都是由志愿者管理，以满足不断增长的需求。这里学习一下如何运行你自己的时间服务器，为基础公共利益做贡献。（查看 [在 Linux 上使用 NTP 保持精确时间][1] 去学习如何设置一台局域网时间服务器）

### 著名的时间服务器滥用事件

就像现实生活中任何一件事情一样，即便是像时间服务器这样的公益项目，也会遭受不称职的或者恶意的滥用。

消费类网络设备的供应商因制造了大混乱而臭名昭著。我回想起的第一件事发生在 2003 年，那时，NetGear 在它们的路由器中硬编码了威斯康星大学的 NTP 时间服务器地址。使得时间服务器的查询请求突然增加，随着 NetGear 卖出越来越多的路由器，这种情况越发严重。更有意思的是，路由器的程序设置是每秒钟发送一次请求，这将使服务器难堪重负。后来 Netgear 发布了升级固件，但是，升级他们的设备的用户很少，并且他们的其中一些用户的设备，到今天为止，还在不停地每秒钟查询一次威斯康星大学的 NTP 服务器。Netgear 给威斯康星大学捐献了一些钱，以帮助弥补他们带来的成本增加，直到这些路由器全部淘汰。类似的事件还有 D-Link、Snapchat、TP-Link 等等。

对 NTP 协议进行反射和放大，已经成为发起 DDoS 攻击的一个选择。当攻击者使用一个伪造的目标受害者的源地址向时间服务器发送请求，称为反射攻击；攻击者发送请求到多个服务器，这些服务器将回复请求，这样就使伪造的源地址受到轰炸。放大攻击是指一个很小的请求收到大量的回复信息。例如，在 Linux 上，`ntpq` 命令是一个查询你的 NTP 服务器并验证它们的系统时间是否正确的很有用的工具。一些回复，比如，对端列表，是非常大的。组合使用反射和放大，攻击者可以将 10 倍甚至更多带宽的数据量发送到被攻击者。

那么，如何保护提供公益服务的公共 NTP 服务器呢？从使用 NTP 4.2.7p26 或者更新的版本开始，它们可以帮助你的 Linux 发行版不会发生前面所说的这种问题，因为它们都是在 2010 年以后发布的。这个发行版都默认禁用了最常见的滥用攻击。目前，[最新版本是 4.2.8p10][2]，它发布于 2017 年。

你可以采用的另一个措施是，在你的网络上启用入站和出站过滤器。阻塞宣称来自你的网络的数据包进入你的网络，以及拦截发送到伪造返回地址的出站数据包。入站过滤器可以帮助你，而出站过滤器则帮助你和其他人。阅读 [BCP38.info][3] 了解更多信息。

### 层级为 0、1、2 的时间服务器

NTP 有超过 30 年的历史了，它是至今还在使用的最老的因特网协议之一。它的用途是保持计算机与世界标准时间（UTC）的同步。NTP 网络是分层组织的，并且同层的设备是对等的。<ruby>层次<rt>Stratum</rt></ruby> 0 包含主报时设备，比如，原子钟。层级 1 的时间服务器与层级 0 的设备同步。层级 2 的设备与层级 1 的设备同步，层级 3 的设备与层级 2 的设备同步。NTP 协议支持 16 个层级，现实中并没有使用那么多的层级。同一个层级的服务器是相互对等的。

过去很长一段时间内，我们都为客户端选择配置单一的 NTP 服务器，而现在更好的做法是使用 [NTP 服务器地址池][4]，它使用轮询的 DNS 信息去共享负载。池地址只是为客户端服务的，比如单一的 PC 和你的本地局域网 NTP 服务器。当你运行一台自己的公共服务器时，你不用使用这些池地址。

### 公共 NTP 服务器配置

运行一台公共 NTP 服务器只有两步：设置你的服务器，然后申请加入到 NTP 服务器池。运行一台公共的 NTP 服务器是一种很高尚的行为，但是你得先知道这意味着什么。加入 NTP 服务器池是一种长期责任，因为即使你加入服务器池后，运行了很短的时间马上退出，然后接下来的很多年你仍然会接收到请求。

你需要一个静态的公共 IP 地址，一个至少 512Kb/s 带宽的、可靠的、持久的因特网连接。NTP 使用的是 UDP 的 123 端口。它对机器本身要求并不高，很多管理员在其它的面向公共的服务器（比如，Web 服务器）上顺带架设了 NTP 服务。

配置一台公共的 NTP 服务器与配置一台用于局域网的 NTP 服务器是一样的，只需要几个配置。我们从阅读 [协议规则][5] 开始。遵守规则并注意你的行为；几乎每个时间服务器的维护者都是像你这样的志愿者。然后，从  [StratumTwoTimeServers][6] 中选择 4 到 7 个层级 2 的上游服务器。选择的时候，选取地理位置上靠近（小于 300 英里的）你的因特网服务提供商的上游服务器，阅读他们的访问规则，然后，使用 `ping` 和 `mtr` 去找到延迟和跳数最小的服务器。

以下的 `/etc/ntp.conf` 配置示例文件，包括了 IPv4 和 IPv6，以及基本的安全防护：

```
# stratum 2 server list
server servername_1 iburst
server servername_2 iburst
server servername_3 iburst
server servername_4 iburst
server servername_5 iburst

# access restrictions
restrict -4 default kod noquery nomodify notrap nopeer limited
restrict -6 default kod noquery nomodify notrap nopeer limited

# Allow ntpq and ntpdc queries only from localhost
restrict 127.0.0.1
restrict ::1
```

启动你的 NTP 服务器，让它运行几分钟，然后测试它对远程服务器的查询：

```
$ ntpq -p
 remote refid st t when poll reach delay offset jitter
=================================================================
+tock.no-such-ag 200.98.196.212 2 u 36 64 7 98.654 88.439 65.123
+PBX.cytranet.ne 45.33.84.208 3 u 37 64 7 72.419 113.535 129.313
*eterna.binary.n 199.102.46.70 2 u 39 64 7 92.933 98.475 56.778
+time.mclarkdev. 132.236.56.250 3 u 37 64 5 111.059 88.029 74.919

```

目前表现很好。现在从另一台 PC 上使用你的 NTP 服务器名字进行测试。以下的示例是一个正确的输出。如果有不正确的地方，你将看到一些错误信息。

```
$ ntpdate -q yourservername
server 66.96.99.10, stratum 2, offset 0.017690, delay 0.12794
server 98.191.213.2, stratum 1, offset 0.014798, delay 0.22887
server 173.49.198.27, stratum 2, offset 0.020665, delay 0.15012
server 129.6.15.28, stratum 1, offset -0.018846, delay 0.20966
26 Jan 11:13:54 ntpdate[17293]: adjust time server 98.191.213.2 offset 0.014798 sec
```

一旦你的服务器运行的很好，你就可以向 [manage.ntppool.org][7] 申请加入池中。

查看官方的手册 [分布式网络时间服务器（NTP）][8] 学习所有的命令、配置选项、以及高级特性，比如，管理、查询、和验证。访问以下的站点学习关于运行一台时间服务器所需要的一切东西。

通过来自 Linux 基金会和 edX 的免费课程 [“Linux 入门”][9] 学习更多 Linux 的知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/2/how-run-your-own-public-time-server-linux

作者：[CARLA SCHRODER][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://linux.cn/article-9462-1.html
[2]:http://www.ntp.org/downloads.html
[3]:http://www.bcp38.info/index.php/Main_Page
[4]:http://www.pool.ntp.org/en/use.html
[5]:http://support.ntp.org/bin/view/Servers/RulesOfEngagement
[6]:http://support.ntp.org/bin/view/Servers/StratumTwoTimeServers?redirectedfrom=Servers.StratumTwo
[7]:https://manage.ntppool.org/manage
[8]:https://www.eecis.udel.edu/~mills/ntp/html/index.html
[9]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
