CentOS 7 上的 FirewallD 简明指南
============================================================

![](https://www.rosehosting.com/blog/wp-content/uploads/2017/02/set-up-and-configure-a-firewall-with-firewalld-on-centos-7.jpg)

FirewallD 是 CentOS 7 服务器上默认可用的防火墙管理工具。基本上，它是 iptables 的封装，有图形配置工具 firewall-config 和命令行工具 `firewall-cmd`。使用 iptables 服务，每次改动都要求刷新旧规则，并且从 `/etc/sysconfig/iptables` 读取新规则，然而 firewalld 只应用改动了的不同部分。

### FirewallD 的区域（zone）

FirewallD 使用服务（service） 和区域（zone）来代替 iptables 的规则（rule）和链（chain）。

默认情况下，有以下的区域（zone）可用：

*   **drop** – 丢弃所有传入的网络数据包并且无回应，只有传出网络连接可用。
*   **block** — 拒绝所有传入网络数据包并回应一条主机禁止的 ICMP 消息，只有传出网络连接可用。
*   **public** — 只接受被选择的传入网络连接，用于公共区域。
*   **external** — 用于启用了地址伪装的外部网络，只接受选定的传入网络连接。
*   **dmz** — DMZ 隔离区，外部受限地访问内部网络，只接受选定的传入网络连接。
*   **work** — 对于处在你工作区域内的计算机，只接受被选择的传入网络连接。
*   **home** — 对于处在你家庭区域内的计算机，只接受被选择的传入网络连接。
*   **internal** — 对于处在你内部网络的计算机，只接受被选择的传入网络连接。
*   **trusted** — 所有网络连接都接受。

要列出所有可用的区域，运行：

```
# firewall-cmd --get-zones
work drop internal external trusted home dmz public block
```

列出默认的区域 ：

```
# firewall-cmd --get-default-zone
public
```

改变默认的区域 ：

```
# firewall-cmd --set-default-zone=dmz
# firewall-cmd --get-default-zone
dmz
```

### FirewallD 服务

FirewallD 服务使用 XML 配置文件，记录了 firewalld 服务信息。

列出所有可用的服务：

```
# firewall-cmd --get-services
amanda-client amanda-k5-client bacula bacula-client ceph ceph-mon dhcp dhcpv6 dhcpv6-client dns docker-registry dropbox-lansync freeipa-ldap freeipa-ldaps freeipa-replication ftp high-availability http https imap imaps ipp ipp-client ipsec iscsi-target kadmin kerberos kpasswd ldap ldaps libvirt libvirt-tls mdns mosh mountd ms-wbt mysql nfs ntp openvpn pmcd pmproxy pmwebapi pmwebapis pop3 pop3s postgresql privoxy proxy-dhcp ptp pulseaudio puppetmaster radius rpc-bind rsyncd samba samba-client sane smtp smtps snmp snmptrap squid ssh synergy syslog syslog-tls telnet tftp tftp-client tinc tor-socks transmission-client vdsm vnc-server wbem-https xmpp-bosh xmpp-client xmpp-local xmpp-server
```

XML 配置文件存储在 `/usr/lib/firewalld/services/` 和 `/etc/firewalld/services/` 目录下。

### 用 FirewallD 配置你的防火墙

作为一个例子，假设你正在运行一个 web 服务器，SSH 服务端口为 7022 ，以及邮件服务，你可以利用 FirewallD 这样配置你的服务器:

首先设置默认区为 dmz。

```
# firewall-cmd --set-default-zone=dmz
# firewall-cmd --get-default-zone
dmz
```

为 dmz 区添加持久性的 HTTP 和 HTTPS 规则：

```
# firewall-cmd --zone=dmz --add-service=http --permanent
# firewall-cmd --zone=dmz --add-service=https --permanent
```

开启端口 25 (SMTP) 和端口 465 (SMTPS) ：

```
firewall-cmd --zone=dmz --add-service=smtp --permanent
firewall-cmd --zone=dmz --add-service=smtps --permanent
```

开启 IMAP、IMAPS、POP3 和 POP3S 端口：

```
firewall-cmd --zone=dmz --add-service=imap --permanent
firewall-cmd --zone=dmz --add-service=imaps --permanent
firewall-cmd --zone=dmz --add-service=pop3 --permanent
firewall-cmd --zone=dmz --add-service=pop3s --permanent
```

因为将 SSH 端口改到了 7022，所以要移除 ssh 服务（端口 22），开启端口 7022：

```
firewall-cmd --remove-service=ssh --permanent
firewall-cmd --add-port=7022/tcp --permanent
```

要应用这些更改，我们需要重新加载防火墙：

```
firewall-cmd --reload
```

最后可以列出这些规则：

```
# firewall-cmd –list-all
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

* * *


PS. 如果你喜欢这篇文章，请在下面留下一个回复。谢谢。

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/

译者简介：

[Locez](http://locez.com) 是一个喜欢技术，喜欢折腾的 Linuxer，靠着对 Linux 的兴趣自学了很多 Linux 相关的知识，并且志在于为 Linux 在中国普及出一份力。

作者：[rosehosting.com][a]
译者：[Locez](https://github.com/locez)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/
[1]:https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/
[2]:https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/#comments
[3]:https://www.rosehosting.com/blog/category/tips-and-tricks/
[4]:https://plus.google.com/share?url=https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/
[5]:http://www.linkedin.com/shareArticle?mini=true&url=https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/&title=Set%20Up%20and%20Configure%20a%20Firewall%20with%20FirewallD%20on%20CentOS%207&summary=FirewallD%20is%20a%20firewall%20management%20tool%20available%20by%20default%20on%20CentOS%207%20servers.%20Basically,%20it%20is%20a%20wrapper%20around%20iptables%20and%20it%20comes%20with%20graphical%20configuration%20tool%20firewall-config%20and%20command%20line%20tool%20firewall-cmd.%20With%20the%20iptables%20service,%20every%20change%20requires%20flushing%20of%20the%20old%20rules%20and%20reading%20the%20new%20rules%20...
[6]:https://www.rosehosting.com/linux-vps-hosting.html
[7]:https://www.rosehosting.com/centos-vps.html
