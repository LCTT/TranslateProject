如何在 CentOS 6/7 上移除被 Fail2ban 禁止的 IP
================================================================================
![](http://www.ehowstuff.com/wp-content/uploads/2015/12/security-265130_1280.jpg)

[fail2ban][1] 是一款用于保护你的服务器免于暴力攻击的入侵保护软件。fail2ban 用 python 写成，并广泛用于很多服务器上。fail2ban 会扫描日志文件和 IP 黑名单来显示恶意软件、过多的密码失败尝试、web 服务器利用、wordpress 插件攻击和其他漏洞。如果你已经安装并使用了 fail2ban 来保护你的 web 服务器，你也许会想知道如何在 CentOS 6、CentOS 7、RHEL 6、RHEL 7 和 Oracle Linux 6/7 中找到被 fail2ban 阻止的 IP，或者你想将 ip 从 fail2ban 监狱中移除。

### 如何列出被禁止的 IP ###

要查看所有被禁止的 ip 地址，运行下面的命令：

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

### 如何从 Fail2ban 中移除 IP ###

    # iptables -D f2b-NoAuthFailures -s banned_ip -j REJECT

我希望这篇教程可以给你在 CentOS 6、CentOS 7、RHEL 6、RHEL 7 和 Oracle Linux 6/7 中移除被禁止的 ip 一些指导。

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-remove-banned-ip-from-fail2ban-on-centos/

作者：[skytech][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/skytech/
[1]:http://www.fail2ban.org/wiki/index.php/Main_Page
