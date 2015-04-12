How to secure BGP sessions using authentication on Quagga
================================================================================
The BGP protocol runs over TCP, and as such, it inherits all the vulnerabilities of a TCP connection. For example, within a BGP session, an attacker may impersonate a legitimate BGP neighbor, and convince the BGP routers on the other end to share their routing information with the attacker. The problem occurs when the attacker advertises and injects bogus routes towards neighboring routers. The unsuspecting neighboring routers may then start sending live traffic towards the attacker, which in most cases goes nowhere and simply gets dropped. Back in 2008, YouTube actually [fell victim][1] to such BGP route poisoning, and suffered major outage on their video service for more than an hour. In a far worse case, if the attacker is savvy enough, they can falsely act as a transparent transit router and sniff the transit traffic for any sensitive data. As you can imagine, this can have far reaching consequences.

To protect active BGP sessions against such attacks, many service providers leverage [MD5 checksum and a pre-shared key][2] for their BGP sessions. In a protected BGP session, a BGP router which sends a packet generates an MD5 hash value by using a pre-shared key, portions of the IP and TCP headers and the payload. The MD5 hash is then stored as a TCP option field. Upon receipt of the packet, a receiving router uses the same method to generate its version of the MD5 hash using a pre-shared key. It compares the hash with the one of the received packet to decide whether to accept the packet. For an attacker, it is almost impossible to guess the checksum or the key. For BGP routers, they can be assured that each packet is validated before its content is consumed.

In this tutorial, we will see how we can secure a BGP session between two neighbors using MD5 checksum and a pre-shared key.

### Preparation ###

Securing a BGP session is fairly straightforward. We will use the following routers.

注：表格
<table id="content">
<tbody><tr>
<td><b>Router name</b></td>
<td><b>AS</b></td>
<td><b>IP address</b></td>
</tr>
<tr>
<td>router-A</td>
<td>100</td>
<td>10.10.12.1/30</td>
</tr>
<tr>
<td>router-B</td>
<td>200</td>
<td>10.10.12.2/30</td>
</tr>
</tbody></table>

The stock Linux kernel supports TCP MD5 option natively for IPv4 and IPv6. Thus if you built Quagga router from a brand new [Linux box][3], TCP MD5 capability will be automatically available for Quagga. It'll be just a matter of configuring Quagga to take advantage of the capability. But if you are using a FreeBSD box or built a custom kernel for Quagga, make sure that you enable TCP MD5 support on the kernel (e.g., CONFIG_TCP_MD5SIG kernel option in Linux).

### Configuring Router-A for Authentication ###

We will use the CLI shell of Quagga to configure the routers. The only new command that we will use is 'password'.

    [root@router-a ~]# vtysh
    router-a# conf t
    router-a(config)# router bgp 100
    router-a(config-router)# network 192.168.100.0/24
    router-a(config-router)# neighbor 10.10.12.2 remote-as 200
    router-a(config-router)# neighbor 10.10.12.2 password xmodulo

The pre-shared key in this example is 'xmodulo'. Obviously, in a production environment you need to select a strong key.

**Note**: in Quagga, the 'service password-encryption’ command is supposed to encrypt all plain-text passwords (e.g., login password) in its configuration file. However, when I use this command, I notice that the pre-shared key in BGP configuration still remains in clear text. I am not sure whether it's a limitation of Quagga, or whether it's a version issue.

### Configuring Router-B for Authentication ###

We will configure router-B in a similar fashion.

    [root@router-b ~]# vtysh
    router-b# conf t
    router-b(config)# router bgp 200
    router-b(config-router)# network 192.168.200.0/24
    router-b(config-router)# neighbor 10.10.12.1 remote-as 100
    router-b(config-router)# neighbor 10.10.12.1 password xmodulo

### Verifying a BGP session ###

If everything has been configured correctly, the BGP session should be up, and both routers should be exchanging routes. At this point, every outgoing packet in a TCP session carries a MD5 digest of the packet contents and a secret key, and the digest is automatically validated by the other end point.

We can verify the active BGP session by viewing BGP summary as usual. MD5 checksum verification occurs transparently within Quagga, so you don't see it at the BGP level.

![](https://farm8.staticflickr.com/7621/16837774368_e9ff66b370_c.jpg)

If you want to test BGP authentication, you can configure one neighbor without a password or deliberately use a wrong pre-shared key and see what happens. You can also use a packet sniffer like tcpdump or Wireshark to analyze the packets that go through the BGP session. For example, tcpdump with "-M <secret>" option will validate the MD5 digests found in TCP option field.

To sum up, in this tutorial we demonstrate how we can easily secure the BGP session between two routers. The process is very straightforward compared to other protocols. It is always recommended to secure your BGP session, especially if you are setting up the BGP session with another AS. The pre-shared key should also be kept safe.

--------------------------------------------------------------------------------

via: http://xmodulo.com/bgp-authentication-quagga.html

作者：[Sarmed Rahman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:http://research.dyn.com/2008/02/pakistan-hijacks-youtube-1/
[2]:http://tools.ietf.org/html/rfc2385
[3]:http://xmodulo.com/centos-bgp-router-quagga.html