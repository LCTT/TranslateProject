在 Debian Linux 上安装配置 ISC DHCP 服务器
================================================================================

动态主机控制协议（Dynamic Host Control Protocol，DHCP）给网络管理员提供了一种便捷的方式，为不断变化的网络主机或是动态网络提供网络层地址。其中最常用的 DHCP 服务工具是 ISC DHCP Server。DHCP 服务的目的是给主机提供必要的网络信息以便能够和其他连接在网络中的主机互相通信。DHCP 服务提供的信息包括：DNS 服务器信息，网络地址（IP），子网掩码，默认网关信息，主机名等等。

本教程介绍运行在 Debian 7.7 上 4.2.4 版的 ISC-DHCP-Server 如何管理多个虚拟局域网（VLAN），也可以非常容易应用到单一网络上。

测试用的网络是通过思科路由器使用传统的方式来管理 DHCP 租约地址的。目前有 12 个 VLAN 需要通过集中式服务器来管理。把 DHCP 的任务转移到一个专用的服务器上，路由器可以收回相应的资源，把资源用到更重要的任务上，比如路由寻址，访问控制列表，流量监测以及网络地址转换等。

另一个将 DHCP 服务转移到专用服务器的好处，以后会讲到，它可以建立动态域名服务器（DDNS），这样当主机从服务器请求 DHCP 地址的时候，这样新主机的主机名就会被添加到 DNS 系统里面。

### 安装和配置 ISC DHCP 服务器###

1、使用 apt 工具用来安装 Debian 软件仓库中的 ISC 软件，来创建这个多宿主服务器。与其他教程一样需要使用 root 或者 sudo 访问权限。请适当的修改，以便使用下面的命令。（LCTT 译注：下面中括号里面是注释，使用的时候请删除，#表示使用的 root 权限）

    # apt-get install isc-dhcp-server 		[安装 the ISC DHCP Server 软件]
    # dpkg --get-selections isc-dhcp-server		[确认软件已经成功安装]
    # dpkg -s isc-dhcp-server 			[用另一种方式确认成功安装]

![Install ISC DHCP Server in Debian](http://www.tecmint.com/wp-content/uploads/2015/04/Install-ISC-DHCP-Server.jpg)

2、 确认服务软件已经安装完成，现在需要提供网络信息来配置服务器，这样服务器才能够根据我们的需要来分发网络信息。作为管理员最起码需要了解的 DHCP 信息如下：

- 网络地址
- 子网掩码
- 动态分配的地址范围

其他一些服务器动态分配的有用信息包括：

- 默认网关
- DNS 服务器 IP 地址
- 域名
- 主机名
- 网络广播地址

这只是能让 ISC DHCP 服务器处理的选项中非常少的一部分。如果你想查看所有选项及其描述需要在安装好软件后输入以下命令：

    # man dhcpd.conf

3、 一旦管理员已经确定了这台服务器分发的所有必要信息，那么是时候配置服务器并且分配必要的地址池了。在配置任何地址池或服务器配置之前，必须配置 DHCP 服务器侦听这台服务器上面的一个接口。 

在这台特定的服务器上，设置好网卡后，DHCP 会侦听名称名为`'bond0'`的接口。请适根据你的实际情况来更改服务器以及网络环境。下面的配置都是针对本教程的。

![Configure ISC DHCP Network](http://www.tecmint.com/wp-content/uploads/2015/04/Configure-ISC-DHCP-Network.jpg)

这行指定的是 DHCP 服务侦听接口（一个或多个）上的 DHCP 流量。修改主配置文件，分配适合的 DHCP 地址池到所需要的网络上。主配置文件在 /etc/dhcp/dhcpd.conf。用文本编辑器打开这个文件

    # nano /etc/dhcp/dhcpd.conf

这个配置文件可以配置我们所需要的地址池/主机。文件顶部有 ‘ddns-update-style‘ 这样一句，在本教程中它设置为 ‘none‘。在以后的教程中会讲到动态 DNS，ISC-DHCP-Server 将会与 BIND9 集成，它能够使主机名更新指向到 IP 地址。 

4、 接下来的部分是管理员配置全局网络设置，如 DNS 域名，默认的租约时间，IP地址，子网的掩码，以及其它。如果你想了解所有的选项，请阅读 man 手册中的 dhcpd.conf 文件，命令如下：

    # man dhcpd.conf

对于这台服务器，我们需要在配置文件顶部配置一些全局网络设置，这样就不用到每个地址池中去单独设置了。

![Configure ISC DDNS](http://www.tecmint.com/wp-content/uploads/2015/04/Configure-ISC-DDNS.png)

我们花一点时间来解释一下这些选项，在本教程中虽然它们是一些全局设置，但是也可以单独的为某一个地址池进行配置。

- option domain-name “comptech.local”; – 所有使用这台 DHCP 服务器的主机，都将成为 DNS 域 “comptech.local” 的一员

- option domain-name-servers 172.27.10.6; DHCP 向所有配置这台 DHCP 服务器的的网络主机分发 DNS 服务器地址为 172.27.10.6

- option subnet-mask 255.255.255.0; – 每个网络设备都分配子网掩码 255.255.255.0 或 /24

- default-lease-time 3600; – 默认有效的地址租约时间（单位是秒）。如果租约时间耗尽，那么主机可以重新申请租约。如果租约完成，那么相应的地址也将被尽快回收。

- max-lease-time 86400; – 这是一台主机所能租用的最大的租约时间（单位为秒）。

- ping-check true; – 这是一个额外的测试，以确保服务器分发出的网络地址不是当前网络中另一台主机已使用的网络地址。

- ping-timeout; – 在判断地址以前没有使用过前，服务器将等待 ping 响应多少秒。

- ignore client-updates; 现在这个选项是可以忽略的，因为 DDNS 在前面已在配置文件中已经被禁用，但是当 DDNS 运行时，这个选项会忽略主机更新其 DNS 主机名的请求。

5、 文件中下面一行是权威 DHCP 所在行。这行的意义是如果服务器是为文件中所配置的网络分发地址的服务器，那么取消对该权威关键字(authoritative stanza) 的注释。

通过去掉关键字 authoritative 前面的 ‘#’，取消注释全局权威关键字。这台服务器将是它所管理网络里面的唯一权威。

![Enable ISC Authoritative](http://www.tecmint.com/wp-content/uploads/2015/04/ISC-authoritative.png)

默认情况下服务器被假定为**不是**网络上的权威服务器。之所以这样做是出于安全考虑。如果有人因为不了解 DHCP 服务的配置，导致配置不当或配置到一个不该出现的网络里面，这都将带来非常严重的连接问题。这行还可用在每个网络中单独配置使用。也就是说如果这台服务器不是整个网络的 DHCP 服务器，authoritative 行可以用在每个单独的网络中，而不是像上面截图中那样的全局配置。

6、 这一步是配置服务器将要管理的所有 DHCP 地址池/网络。简短起见，本教程只讲到配置的地址池之一。作为管理员需要收集一些必要的网络信息（比如域名，网络地址，有多少地址能够被分发等等）

以下这个地址池所用到的信息都是管理员收集整理的：网络 ID 172.27.60.0, 子网掩码 255.255.255.0 或 /24, 默认子网网关 172.27.60.1，广播地址 172.27.60.255.0 。

以上这些信息对于构建 dhcpd.conf 文件中新网络非常重要。使用文本编辑器修改配置文件添加新网络进去，这里我们需要使用 root 或 sudo 访问权限。

    # nano /etc/dhcp/dhcpd.conf

![Configure DHCP Pools and Networks](http://www.tecmint.com/wp-content/uploads/2015/04/ISC-network.png)

当前这个例子是给用 VMWare 创建的虚拟服务器分配 IP 地址。第一行显示是该网络的子网掩码。括号里面的内容是 DHCP 服务器应该提供给网络上面主机的所有选项。

第一行， range 172.27.60.50 172.27.60.254; 这一行显示的是，DHCP 服务在这个网络上能够给主机动态分发的地址范围。

第二行，option routers 172.27.60.1; 这里显示的是给网络里面所有的主机分发的默认网关地址。

最后一行， option broadcast-address 172.27.60.255; 显示当前网络的广播地址。这个地址不能被包含在要分发放的地址范围内，因为广播地址不能分配到一个主机上面。

必须要强调的是每行的结尾必须要用（;）来结束，所有创建的网络必须要在 {} 里面。

7、 如果要创建多个网络，继续创建完它们的相应选项后保存文本文件即可。配置完成以后如果有更改，ISC-DHCP-Server 进程需要重启来使新的更改生效。重启进程可以通过下面的命令来完成：

    # service isc-dhcp-server restart

这条命令将重启 DHCP 服务，管理员能够使用几种不同的方式来检查服务器是否已经可以处理 dhcp 请求。最简单的方法是通过 [lsof 命令][1]来查看服务器是否在侦听67端口，命令如下：

    # lsof -i :67

![Check DHCP Listening Port](http://www.tecmint.com/wp-content/uploads/2015/04/lsof.png)

这里输出的结果表明 dhcpd（DHCP 服务守护进程）正在运行并且侦听67端口。由于在 /etc/services 文件中67端口的映射，所以输出中的67端口实际上被转换成了 “bootps”。

在大多数的系统中这是非常常见的，现在服务器应该已经为网络连接做好准备，我们可以将一台主机接入网络请求DHCP地址来验证服务是否正常。

### 测试客户端连接 ###

8、 现在许多系统使用网络管理器来维护网络连接状态，因此这个设备应该预先配置好的，只要对应的接口处于活跃状态就能够获取 DHCP。

然而当一台设备无法使用网络管理器时，它可能需要手动获取 DHCP 地址。下面的几步将演示怎样手动获取以及如何查看服务器是否已经按需要分发地址。

‘[ifconfig][2]‘工具能够用来检查接口的配置。这台被用来测试的 DHCP 服务器的设备，它只有一个网络适配器（网卡），这块网卡被命名为 ‘eth0‘。
 
    # ifconfig eth0

![Check Network Interface IP Address](http://www.tecmint.com/wp-content/uploads/2015/04/No-ip.png)

从输出结果上看，这台设备目前没有 IPv4 地址，这样很便于测试。我们把这台设备连接到 DHCP 服务器并发出一个请求。这台设备上已经安装了一个名为 ‘dhclient‘ 的DHCP客户端工具。因为操作系统各不相同，所以这个客户端软件也是互不一样的。

    # dhclient eth0

![Request IP Address from DHCP](http://www.tecmint.com/wp-content/uploads/2015/04/IP.png)

当前 `'inet addr:'` 字段中显示了属于 172.27.60.0 网络地址范围内的 IPv4 地址。值得欣慰的是当前网络还配置了正确的子网掩码并且分发了广播地址。

到这里看起来还都不错，让我们来测试一下，看看这台设备收到新 IP 地址是不是由服务器发出的。这里我们参照服务器的日志文件来完成这个任务。虽然这个日志的内容有几十万条，但是里面只有几条是用来确定服务器是否正常工作的。这里我们使用一个工具 ‘tail’，它只显示日志文件的最后几行，这样我们就可以不用拿一个文本编辑器去查看所有的日志文件了。命令如下：

    # tail /var/log/syslog

![Check DHCP Logs](http://www.tecmint.com/wp-content/uploads/2015/04/DHCP-Log.png)

OK!服务器记录表明它分发了一个地址给这台主机 (HRTDEBXENSRV)。服务器按预期运行，给它充当权威服务器的网络分发了适合的网络地址。至此 DHCP 服务器搭建成功并且运行。如果有需要你可以继续配置其他的网络，排查故障，确保安全。

在以后的Debian教程中我会讲一些新的 ISC-DHCP-Server 功能。有时间的话我将写一篇关于 Bind9 和 DDNS 的教程，融入到这篇文章里面。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-and-configure-multihomed-isc-dhcp-server-on-debian-linux/

作者：[Rob Turner][a]
译者：[ivo-wang](https://github.com/ivo-wang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/robturner/
[1]:http://www.tecmint.com/10-lsof-command-examples-in-linux/
[2]:http://www.tecmint.com/ifconfig-command-examples/
