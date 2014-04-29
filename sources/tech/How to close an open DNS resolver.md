How to close an open DNS resolver
================================================================================
The DNS server that we have created in the [previous tutorial][1] is an open DNS resolver. An open resolver does not filter any incoming requests, and accepts queries from any source IP address.

Unfortunately, an open resolver can become an easy target to attackers. For example, attackers can initiate a Denial of Service (DoS) or even worse, a Distributed Denial of Service (DDoS) attack on the open DNS server. These attacks can also be combined with IP spoofing, where all the reply packets will be directed to a victim’s spoofed IP address. In another attack scenario called [DNS amplification attacks][2], an open DNS server can actively participate in the attacks.

According to [openresolverproject.org][3], it is not advisable to run an open resolver unless necessary. Most companies keep their DNS servers accessible to only their customers. This tutorial will focus on how to configure a DNS server so that it stops being an open resolver and responds only to valid customers.

### Tuning Firewall ###

As DNS runs on UDP port 53, system admins may attempt to allow port 53 for client IP addresses only, and block the port from the rest of the Internet. Though this will work, there are going to be some problems. Since the communication between the root servers and the DNS servers use port 53 as well, we have to make sure that the IP addresses of the root servers are also allowed on UDP port 53 in the firewall.

A sample firewall script is provided below. For production servers, make sure that the rules match your requirements and also comply with company security policies.

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

Make the script executable and run it.

    # chmod +x firewall-script
    # ./firewall-script 

### Blocking Recursive Queries ###

DNS queries can be primarily [categorized][4] as recursive and iterative queries. For a recursive query, the server responds to the client with either the answer or an error message. If the answer is not available in the server cache, the server communicates with the root servers to obtain authoritative name servers. The servers keeps looking up until it gets an answer, or until the query times out. For an iterative query, on the other hand, the server simply refers the client to another server who would be able to process, thus leading to less processing on the server itself.

We can control the IP addresses that are allowed for recursive queries. We modify the configuration file /etc/named.conf and add/modify the following parameters.

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

### Tuning Firewall for Open Resolver ###

If you must run an open resolver, it is recommended that you tune the firewall properly so that your server cannot be exploited. [smurfmonitor repository][5] provides a powerful set of iptables rules that can be used in open resolvers, such as blocking requests for domains involved in DNS amplification attacks. The repository is updated periodically, and it is highly recommended for DNS server admins.

To sum up, attacks on open DNS resolvers are common, especially for DNS servers without proper security. This tutorial demonstrated how to disable an open DNS server. We have also seen how iptables can be used to add an additional layer of security to an open DNS server.

Hope this helps.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/close-open-dns-resolver.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2014/04/primary-dns-server-using-centos.html
[2]:https://www.us-cert.gov/ncas/alerts/TA13-088A
[3]:http://openresolverproject.org/
[4]:http://technet.microsoft.com/en-us/library/cc961401.aspx
[5]:https://github.com/smurfmonitor/dns-iptables-rules