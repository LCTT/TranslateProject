在 CentOS 上使用 FirewallD 配置防火墙
================================================

![](https://www.rosehosting.com/blog/wp-content/uploads/2017/02/set-up-and-configure-a-firewall-with-firewalld-on-centos-7.jpg) 

FirewallD 是 CentOS 7 服务器上默认使用的防火墙管理工具。从根本上来讲，它是在 iptables 基础上的一个包装，它同时拥有图形配置工具 firewall-config 和命令行工具 firewall-cmd。使用 iptables 服务的话，每次更改设置后都要求刷新旧的规则，然后从文件 `/etc/sysconfig/iptables` 中读取新的规则，然而 firewalld 只对差异进行改动。

### FirewallD 区域

FirewallD 使用服务和区域代替 iptables 的规则和链。默认下面的区域都是可用的：

* drop——任何流入网络的包都被丢弃，不作出任何响应，只允许流出的网络连接。

* block——任何进入的网络连接都被拒绝，并返回 IPv4 的 icmp-host-prohibited 报文。只允许流出的网络连接。

* public——只接受选中的传入网络连接，例如在公共场合。

* public——用于启用伪装的外部网络，只接受被选中的传入网络连接。

* dmz——隔离区域(demilitarized zone),有限制地公开访问内部网络，只接受被选中的传入网络连接。

* work——用于工作区域中的计算机，只接受选中的流入网络连接。

* home——用于家庭区域中的计算机，只接受选中的流入网络连接。

* internal——用于内部网络中的计算机，只接受选中的流入网络连接。

* trusted——所有的网络连接都可以接受。

要显示所有可用的区域可以运行：

```
# firewall-cmd --get-zones
work drop internal external trusted home dmz public block
```
要显示默认的区域：

```
# firewall-cmd --get-default-zone
public
```

改变默认的区域：

```
# firewall-cmd --set-default-zone=dmz
# firewall-cmd --get-default-zone
dmz
```

### FirewallD 服务

FirewallD服务是 xml 配置文件，每个文件里面记录有防火墙针对某项服务的配置信息。要列出所有可用的服务，运行命令：

```
# firewall-cmd --get-services
amanda-client amanda-k5-client bacula bacula-client ceph ceph-mon dhcp dhcpv6 dhcpv6-client dns docker-registry dropbox-lansync freeipa-ldap freeipa-ldaps freeipa-replication ftp high-availability http https imap imaps ipp ipp-client ipsec iscsi-target kadmin kerberos kpasswd ldap ldaps libvirt libvirt-tls mdns mosh mountd ms-wbt mysql nfs ntp openvpn pmcd pmproxy pmwebapi pmwebapis pop3 pop3s postgresql privoxy proxy-dhcp ptp pulseaudio puppetmaster radius rpc-bind rsyncd samba samba-client sane smtp smtps snmp snmptrap squid ssh synergy syslog syslog-tls telnet tftp tftp-client tinc tor-socks transmission-client vdsm vnc-server wbem-https xmpp-bosh xmpp-client xmpp-local xmpp-server
```

xml 配置文件存放在 `/usr/lib/firewalld/services/` 和 `/etc/firewalld/services/` 目录内。

### 使用 FirewallD 配置你的防火墙

作为一个例子，如果你正在运行一个 web 服务器、7022端口上的 SSH 和 mail 服务器，这里会告诉你如何用 FirewallD 配置你的 [RoseHosting VPS](6) 防火墙。

我们首先设置默认区域为 dmz：

```
# firewall-cmd --set-default-zone=dmz
# firewall-cmd --get-default-zone
dmz
```
为了将 HTTP 和 HTTPS 的服务规则永久加入 dmz 区域，运行命令：

```
# firewall-cmd --zone=dmz --add-service=http --permanent
# firewall-cmd --zone=dmz --add-service=https --permanent
```
打开 25 端口SMTP)和 465 端口(SMTPS):

```
firewall-cmd --zone=dmz --add-service=smtp --permanent
firewall-cmd --zone=dmz --add-service=smtps --permanent
```
打开 IMAP、IMAPS、POP3 和 POP3S端口：

```
firewall-cmd --zone=dmz --add-service=imap --permanent
firewall-cmd --zone=dmz --add-service=imaps --permanent
firewall-cmd --zone=dmz --add-service=pop3 --permanent
firewall-cmd --zone=dmz --add-service=pop3s --permanent
```

因为 SSH 端口号已经被改为 7022，所以我们将删除 ssh 服务(端口 22)，然后开启端口 7022：

```
firewall-cmd --remove-service=ssh --permanent 
firewall-cmd --add-port=7022/tcp --permanent 
```
为了让这些改变生效，我们需要用命令重新加载防火墙：

```
firewall-cmd --reload
```
最后，你可以使用命令列出规则：


```
### firewall-cmd –list-all
dmz
target: default
icmp-block-inversion: no
interfaces:
sources:
services: http https imap imaps pop3 pop3s smtp smtps
ports: 7022/tcp
protocols:
masquerade: no
forward-ports:
sourceports:
icmp-blocks:
rich rules:

```

***

当然，如果您使用我们的 [CentOS VPS hosting][7] 服务中任何一种服务，您都不必亲自做上面任何设置，您可以让我们专业的 Linux 管理员来为您设置。他们提供 24x7 的服务，并且会立即处理您的要求。

PS：如果您喜欢这篇文章，请将它分享到社交平台上与您的朋友共享，或者仅仅在下面留言回复。谢谢！

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/

作者：[rosehosting.com][a]
译者：[zhousiyu325](https://github.com/zhousiyu325)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/
[1]:https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/
[2]:https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/#comments
[3]:https://www.rosehosting.com/blog/category/tips-and-tricks/
[4]:https://plus.google.com/share?url=https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/
[5]:http://www.linkedin.com/shareArticle?mini=true&url=https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/&title=Set%20Up%20and%20Configure%20a%20Firewall%20with%20FirewallD%20on%20CentOS%207&summary=FirewallD%20is%20a%20firewall%20management%20tool%20available%20by%20default%20on%20CentOS%207%20servers.%20Basically,%20it%20is%20a%20wrapper%20around%20iptables%20and%20it%20comes%20with%20graphical%20configuration%20tool%20firewall-config%20and%20command%20line%20tool%20firewall-cmd.%20With%20the%20iptables%20service,%20every%20change%20requires%20flushing%20of%20the%20old%20rules%20and%20reading%20the%20new%20rules%20...
[6]:https://www.rosehosting.com/linux-vps-hosting.html
[7]:https://www.rosehosting.com/centos-vps.html