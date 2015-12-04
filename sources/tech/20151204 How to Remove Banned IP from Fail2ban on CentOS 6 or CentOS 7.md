How to Remove Banned IP from Fail2ban on CentOS 6 / CentOS 7
================================================================================
![](http://www.ehowstuff.com/wp-content/uploads/2015/12/security-265130_1280.jpg)

[Fail2ban][1] is an intrusion prevention software framework that able to protect your server from brute-force attacks. Fail2ban written in the Python programming language and is widely used by most of the VPS servers. Fail2ban will scan log files and IP blacklists that shows signs of malicious, too many password failures, web server exploitation, WordPress plugin attacks and other vulnerabilities. If you already installed and used fail2ban to protect your web server, you may be wondering how to find the IP banned or blocked by Fail2ban, or you may want to remove banned ip from fail2ban jail on CentOS 6, CentOS 7, RHEL 6, RHEL 7 and Oracle Linux 6/7.

### How to List of Banned IP address ###

To see all the blocked ip addresses, run the following command :

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

### How to Remove Banned IP from Fail2ban jail ###

    # iptables -D f2b-NoAuthFailures -s banned_ip -j REJECT

I hope this article gives you some ideas and quick guide on remove banned IP from Fail2ban jail on on CentOS 6, CentOS 7, RHEL 6, RHEL 7 and Oracle Linux 6/7.

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-remove-banned-ip-from-fail2ban-on-centos/

作者：[skytech][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/skytech/
[1]:http://www.fail2ban.org/wiki/index.php/Main_Page
