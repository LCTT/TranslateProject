如何在CentOS 6/7 上移除被Fail2ban禁止的IP
================================================================================
![](http://www.ehowstuff.com/wp-content/uploads/2015/12/security-265130_1280.jpg)

[Fail2ban][1]是一款用于保护你的服务器免于暴力攻击的入侵保护软件。Fail2ban用python写成，并被广泛用户大多数服务器上。Fail2ban将扫描日志文件和IP黑名单来显示恶意软件、过多的密码失败、web服务器利用、Wordpress插件攻击和其他漏洞。如果你已经安装并使用了fail2ban来保护你的web服务器，你也许会想知道如何在CentOS 6、CentOS 7、RHEL 6、RHEL 7 和 Oracle Linux 6/7中找到被Fail2ban阻止的IP，或者你想将ip从fail2ban监狱中移除。

### 如何列出被禁止的IP ###

要查看所有被禁止的ip地址，运行下面的命令：

    # iptables -L
    Chain INPUT (policy ACCEPT)
    target     prot opt source               destination
    f2b-AccessForbidden  tcp  --  anywhere             anywhere            tcp dpt:http
    f2b-WPLogin  tcp  --  anywhere             anywhere            tcp dpt:http
    f2b-ConnLimit  tcp  --  anywhere             anywhere            tcp dpt:http
    f2b-ReqLimit  tcp  --  anywhere             anywhere            tcp dpt:http
    f2b-NoAuthFailures  tcp  --  anywhere             anywhere            tcp dpt:http
    f2b-SSH    tcp  --  anywhere             anywhere            tcp dpt:ssh
    f2b-php-url-open  tcp  --  anywhere             anywhere            tcp dpt:http
    f2b-nginx-http-auth  tcp  --  anywhere             anywhere            multiport dports http,https
    ACCEPT     all  --  anywhere             anywhere            state RELATED,ESTABLISHED
    ACCEPT     icmp --  anywhere             anywhere
    ACCEPT     all  --  anywhere             anywhere
    ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:EtherNet/IP-1
    ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:http
    REJECT     all  --  anywhere             anywhere            reject-with icmp-host-prohibited
    
    Chain FORWARD (policy ACCEPT)
    target     prot opt source               destination
    REJECT     all  --  anywhere             anywhere            reject-with icmp-host-prohibited
    
    Chain OUTPUT (policy ACCEPT)
    target     prot opt source               destination
    
    
    Chain f2b-NoAuthFailures (1 references)
    target     prot opt source               destination
    REJECT     all  --  64.68.50.128         anywhere            reject-with icmp-port-unreachable
    REJECT     all  --  104.194.26.205       anywhere            reject-with icmp-port-unreachable
    RETURN     all  --  anywhere             anywhere

### 如何从Fail2ban中移除IP ###

    # iptables -D f2b-NoAuthFailures -s banned_ip -j REJECT

我希望这篇教程可以给你在CentOS 6、CentOS 7、RHEL 6、RHEL 7 和 Oracle Linux 6/7中移除被禁止的ip一些指导。

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-remove-banned-ip-from-fail2ban-on-centos/

作者：[skytech][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/skytech/
[1]:http://www.fail2ban.org/wiki/index.php/Main_Page
