leemeans translating
How to block local spoofed addresses using the Linux firewall
如何使用Linux防火墙隔离局域网受欺骗地址
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_UnspokenBlockers_1110_A.png?itok=x8A9mqVA)

Attackers are finding sophisticated ways to penetrate even remote networks that are protected by intrusion detection and prevention systems. No IDS/IPS can halt or minimize attacks by hackers who are determined to take over your network. Improper configuration allows attackers to bypass all implemented network security measures.
即便是被入侵检测和隔离系统保护的远程网络，黑客们也在寻找精致的方法入侵。IDS/IPS是不能停止或者减少那些想要接管你的网络的黑客的攻击的。不恰当的配置允许攻击者绕过所有部署的安全措施。

In this article, I will explain how security engineers or system administrators can prevent these attacks.
在这篇文章中，我将会解释安全工程师或者系统管理员怎样可以避免这些攻击。

Almost all Linux distributions come with a built-in firewall to secure processes and applications running on the Linux host. Most firewalls are designed as IDS/IPS solutions, whose primary purpose is to detect and prevent malicious packets from gaining access to a network.
几乎所有的Linux发行版都带着一个内建的防火墙来保护运行在Linux宿主机上的进程和应用程序。大多数都按照IDS/IPS解决方案设计，这样的设计的主要目的是检测和避免恶意包获取网络的进入权。

A Linux firewall usually comes with two interfaces: iptables and ipchains. Most people refer to these interfaces as the "iptables firewall" or the "ipchains firewall." Both interfaces are designed as packet filters. Iptables acts as a stateful firewall, making decisions based on previous packets. Ipchains does not make decisions based on previous packets; hence, it is designed as a stateless firewall.
Linux防火墙通常带有两个接口：iptable和ipchain程序。大多数人将这些接口称作iptables防火墙或者ipchains防火墙。这两个接口都被设计成包过滤器。iptables是有状态防火墙，基于先前的包做出决定。

In this article, we will focus on the iptables firewall, which comes with kernel version 2.4 and beyond.
在这篇文章中，我们将会专注于内核2.4之后出现的iptables防火墙。

With the iptables firewall, you can create policies, or ordered sets of rules, which communicate to the kernel how it should treat specific classes of packets. Inside the kernel is the Netfilter framework. Netfilter is both a framework and the project name for the iptables firewall. As a framework, Netfilter allows iptables to hook functions designed to perform operations on packets. In a nutshell, iptables relies on the Netfilter framework to build firewall functionality such as filtering packet data.
有了iptables防火墙，你可以创建策略或者有序的规则集，规则集可以告诉内核如何对待特定的数据包。在内核中的是Netfilter框架。Netfilter既是框架也是iptables防火墙的工程名。作为一个框架，Netfilter允许iptables勾取被设计来操作数据包的函数。概括地说，iptables依靠Netfilter框架构筑诸如过滤数据包数据的功能。

Each iptables rule is applied to a chain within a table. An iptables chain is a collection of rules that are compared against packets with similar characteristics, while a table (such as nat or mangle) describes diverse categories of functionality. For instance, a mangle table alters packet data. Thus, specialized rules that alter packet data are applied to it, and filtering rules are applied to the filter table because the filter table filters packet data.
每个iptables规则都被应用到一个含表的链中。一个iptables链就是一个比较包中相似字符的规则的集合。而表(例如nat或者mangle)则描述不同的功能目录。例如，一个mangle表转化包数据。因此，特定的改变包数据的规则被应用到这里，而过滤规则被应用到filter表，因为filter表过滤包数据。

Iptables rules have a set of matches, along with a target, such as `Drop` or `Deny`, that instructs iptables what to do with a packet that conforms to the rule. Thus, without a target and a set of matches, iptables can’t effectively process packets. A target simply refers to a specific action to be taken if a packet matches a rule. Matches, on the other hand, must be met by every packet in order for iptables to process them.
iptables规则有一系列匹配，伴随着一个诸如`Drop`或者`Deny`的目标，这可以告诉iptables对一个包做什么符合规则。因此，没有一个目标和一系列匹配，iptables就不能有效地处理包。如果一个包匹配一条规则，一个目标简单地指向一个将要采取的特定措施。另一方面，为了让iptables处理，匹配必须被每个包满足吗。


Now that we understand how the iptables firewall operates, let's look at how to use iptables firewall to detect and reject or drop spoofed addresses.
现在我们已经知道iptables防火墙如何工作，开始着眼于如何使用iptables防火墙检测并拒绝或丢弃被欺骗的地址吧。

### Turning on source address verification

The first step I, as a security engineer, take when I deal with spoofed addresses from remote hosts is to turn on source address verification in the kernel.

Source address verification is a kernel-level feature that drops packets pretending to come from your network. It uses the reverse path filter method to check whether the source of the received packet is reachable through the interface it came in.

To turn source address verification, utilize the simple shell script below instead of doing it manually:
```
#!/bin/sh

#author’s name: Michael K Aboagye

#purpose of program: to enable reverse path filtering

#date: 7/02/18

#displays “enabling source address verification” on the screen

echo -n "Enabling source address verification…"

#Overwrites the value 0 to 1 to enable source address verification

echo 1 > /proc/sys/net/ipv4/conf/default/rp_filter

echo "completed"

```

The preceding script, when executed, displays the message `Enabling source address verification` without appending a new line. The default value of the reverse path filter is 0.0, which means no source validation. Thus, the second line simply overwrites the default value 0 to 1. 1 means that the kernel will validate the source by confirming the reverse path.

Finally, you can use the following command to drop or reject spoofed addresses from remote hosts by choosing either one of these targets: `DROP` or `REJECT`. However, I recommend using `DROP` for security reasons.

Replace the “IP-address” placeholder with your own IP address, as shown below. Also, you must choose to use either `REJECT` or `DROP`; the two targets don’t work together.
```
   iptables -A INPUT -i internal_interface -s IP_address -j REJECT / DROP  



    iptables -A INPUT -i internal_interface -s 192.168.0.0/16  -j REJECT/ DROP

```

This article provides only the basics of how to prevent spoofing attacks from remote hosts using the iptables firewall.


--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/block-local-spoofed-addresses-using-linux-firewall

作者：[Michael Kwaku Aboagye][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/revoks
