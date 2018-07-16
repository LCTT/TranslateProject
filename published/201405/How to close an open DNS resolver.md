如何关闭一个开放的DNS解析器
================================================================================
我们在[之前的教程中][1]创建的DNS服务器是一个开放DNS解析器。开放解析器不会过滤任何来源请求，并会接受来自所有IP的查询、

不幸的是，开放解析器很容易成为一个攻击目标。比如，攻击者可以对开放DNS服务器发起一个拒绝服务攻击(DoS)或者更糟的分布式拒绝服务攻击(DDoS)。这些也可与IP欺骗结合，将应答包指向受害者被欺骗的IP地址。在另外的场合下称作[DNS放大攻击][2]，开放的DNS服务器很容易就会成为攻击的对象。

根据[openresolverproject.org][3]，除非有必要，运行一个开放解析器是不明智的。大多数公司要让它们的DNS服务器仅对他们的客户开放。本篇教程会只要集中于如何配置一个DNS服务器来使它停止开放解析且仅对有效的客户响应。

### 调整防火墙 ###

由于DNS运行在UDP的53端口上，系统管理可能试图仅允许来自53端口的客户端IP地址，并阻止剩余的因特网端口。虽然这可以工作，但是也会有一些问题。既然根服务器与DNS服务器的通信也用53端口，我们不得不在防火墙内也确保UDP 53端口被允许。

一个防火墙示例如下所示。对于生产服务器，确保你的规则匹配你的要求并遵守与公司安全制度。

    # vim firewall-script 

----------

    ## existing rules are flushed to start with a new set of rules ##
    iptables -F
     
    iptables -A INPUT -s A.A.A.A/X -p udp --dport 53 -j ACCEPT
    iptables -A INPUT -s B.B.B.B/Y -p udp --dport 53 -j ACCEPT
    iptables -A INPUT -s C.C.C.C/Z -p udp --dport 53 -j ACCEPT
     
    iptables -A INPUT -p udp --dport 53 -j DROP
     
    ## making the rules persistent ##
    service iptables save

让脚本可执行并运行它。

    # chmod +x firewall-script
    # ./firewall-script 

### 阻止递归查询 ###

DNS查询主要可以[分为][4]递归查询和迭代查询。对于递归查询,服务器会响应客户端应答或者错误信息。如果应答不在服务器的缓存中，服务器会与根服务器通信并获得授权域名服务器。服务器会不停查询知道获得结果，或者请求超时。对于迭代查询，另一个方面讲，服务器会将客户端指向另外一个可能可以处理的服务器上，那么就会减少服务器自身的处理。

我们可以控制运行递归查询的IP地址。我们修改位于/etc/named.conf的配置文件并增加/修改下面的参数。

    # vim /etc/named.conf

----------
 
    ## we define ACLs to specify the source address/es ##
    acl customer-a{ A.A.A.A/X; };
    acl customer-b { B.B.B.B/Y; C.C.C.C/Z; };
    
    ## we call the ACLs under options directive ##
    options {
            directory "/var/named";
            allow-recursion { customer-a; customer-b; };
    };

### 调整用于开放解析器的防火墙 ###

如果你必须运行一个开放解析器，建议你适当调节一下你的服务器，这样就不会被利用了。[smurfmonitor 仓库][5]提供了强大的一组可以用于开放解析器的iptables规则，比如阻止来自DNS放大攻击的域名解析请求。这个仓库会定期地更新，强烈建议DNS服务器管理员使用它。

总的来说，对于开放DNS解析器的攻击是很常见的，特别是对于没有适当安全防护的DNS服务器而言。这个教程延时了如何禁止一个开放DNS服务器。我们同样看到了如何使用iptables在一个开放DNS服务器上加上一层安全防护。

希望这对你有用。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/close-open-dns-resolver.html

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2014/04/primary-dns-server-using-centos.html
[2]:https://www.us-cert.gov/ncas/alerts/TA13-088A
[3]:http://openresolverproject.org/
[4]:http://technet.microsoft.com/en-us/library/cc961401.aspx
[5]:https://github.com/smurfmonitor/dns-iptables-rules
