translating by Locez
Set Up and Configure a Firewall with FirewallD on CentOS 7
============================================================

 ![](https://www.rosehosting.com/blog/wp-content/uploads/2017/02/set-up-and-configure-a-firewall-with-firewalld-on-centos-7.jpg) 

FirewallD is a firewall management tool available by default on CentOS 7 servers. Basically, it is a wrapper around iptables and it comes with graphical configuration tool firewall-config and command line tool firewall-cmd. With the iptables service, every change requires flushing of the old rules and reading the new rules from the `/etc/sysconfig/iptables` file, while with firewalld only differences are applied.

### FirewallD zones

FirewallD uses services and zones instead of iptables rules and chains. By default the following zones are available:

*   drop – Drop all incoming network packets with no reply, only outgoing network connections are available.
*   block – Reject all incoming network packets with an icmp-host-prohibited message, only outgoing network connections are available.
*   public – Only selected incoming connections are accepted, for use in public areas
*   external For external networks with masquerading enabled, only selected incoming connections are accepted.
*   dmz – DMZ demilitarized zone, publicly-accessible with limited access to the internal network, only selected incoming connections are accepted.
*   work – For computers in your home area, only selected incoming connections are accepted.
*   home – For computers in your home area, only selected incoming connections are accepted.
*   internal -For computers in your internal network, only selected incoming connections are accepted.
*   trusted – All network connections are accepted.

To list all available zones run:

```
# firewall-cmd --get-zones
work drop internal external trusted home dmz public block
```

To list the default zone:

```
# firewall-cmd --get-default-zone
public
```

To change the default zone:

```
# firewall-cmd --set-default-zone=dmz
# firewall-cmd --get-default-zone
dmz
```

### FirewallD services

FirewallD services are xml configuration files, with information of a service entry for firewalld. TO list all available services run:

```
# firewall-cmd --get-services
amanda-client amanda-k5-client bacula bacula-client ceph ceph-mon dhcp dhcpv6 dhcpv6-client dns docker-registry dropbox-lansync freeipa-ldap freeipa-ldaps freeipa-replication ftp high-availability http https imap imaps ipp ipp-client ipsec iscsi-target kadmin kerberos kpasswd ldap ldaps libvirt libvirt-tls mdns mosh mountd ms-wbt mysql nfs ntp openvpn pmcd pmproxy pmwebapi pmwebapis pop3 pop3s postgresql privoxy proxy-dhcp ptp pulseaudio puppetmaster radius rpc-bind rsyncd samba samba-client sane smtp smtps snmp snmptrap squid ssh synergy syslog syslog-tls telnet tftp tftp-client tinc tor-socks transmission-client vdsm vnc-server wbem-https xmpp-bosh xmpp-client xmpp-local xmpp-server
```

xml configuration files are stored in the `/usr/lib/firewalld/services/` and `/etc/firewalld/services/`directories.

### Configuring your firewall with FirewallD

As an example, here is how you can configure your [RoseHosting VPS][6] firewall with FirewallD if you were running a web server, SSH on port 7022 and mail server.

First we will set the default zone to dmz.

```
# firewall-cmd --set-default-zone=dmz
# firewall-cmd --get-default-zone
dmz
```

To add permanent service rules for HTTP and HTTPS to the dmz zone, run:

```
# firewall-cmd --zone=dmz --add-service=http --permanent
# firewall-cmd --zone=dmz --add-service=https --permanent
```

Open port 25 (SMTP) and port 465 (SMTPS) :

```
firewall-cmd --zone=dmz --add-service=smtp --permanent
firewall-cmd --zone=dmz --add-service=smtps --permanent
```

Open, IMAP, IMAPS, POP3 and POP3S ports:

```
firewall-cmd --zone=dmz --add-service=imap --permanent
firewall-cmd --zone=dmz --add-service=imaps --permanent
firewall-cmd --zone=dmz --add-service=pop3 --permanent
firewall-cmd --zone=dmz --add-service=pop3s --permanent
```

Since the SSH port is changed to 7022, we will remove the ssh service (port 22) and open port 7022

```
firewall-cmd --remove-service=ssh --permanent 
firewall-cmd --add-port=7022/tcp --permanent 
```

To implement the changes we need to reload the firewall with:

```
firewall-cmd --reload
```

Finally, you can list the rules with:

### firewall-cmd –list-all

```
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

Of course, you don’t have to do any of this if you use one of our [CentOS VPS hosting][7] services, in which case you can simply ask our expert Linux admins to setup this for you. They are available 24×7 and will take care of your request immediately.

PS. If you liked this post please share it with your friends on the social networks using the sharing buttons or simply leave a reply below. Thanks.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/set-up-and-configure-a-firewall-with-firewalld-on-centos-7/

作者：[rosehosting.com][a]
译者：[译者ID](https://github.com/译者ID)
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
