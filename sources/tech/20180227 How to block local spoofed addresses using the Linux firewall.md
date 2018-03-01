How to block local spoofed addresses using the Linux firewall
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_UnspokenBlockers_1110_A.png?itok=x8A9mqVA)

Attackers are finding sophisticated ways to penetrate even remote networks that are protected by intrusion detection and prevention systems. No IDS/IPS can halt or minimize attacks by hackers who are determined to take over your network. Improper configuration allows attackers to bypass all implemented network security measures.

In this article, I will explain how security engineers or system administrators can prevent these attacks.

Almost all Linux distributions come with a built-in firewall to secure processes and applications running on the Linux host. Most firewalls are designed as IDS/IPS solutions, whose primary purpose is to detect and prevent malicious packets from gaining access to a network.

A Linux firewall usually comes with two interfaces: iptables and ipchains. Most people refer to these interfaces as the "iptables firewall" or the "ipchains firewall." Both interfaces are designed as packet filters. Iptables acts as a stateful firewall, making decisions based on previous packets. Ipchains does not make decisions based on previous packets; hence, it is designed as a stateless firewall.

In this article, we will focus on the iptables firewall, which comes with kernel version 2.4 and beyond.

With the iptables firewall, you can create policies, or ordered sets of rules, which communicate to the kernel how it should treat specific classes of packets. Inside the kernel is the Netfilter framework. Netfilter is both a framework and the project name for the iptables firewall. As a framework, Netfilter allows iptables to hook functions designed to perform operations on packets. In a nutshell, iptables relies on the Netfilter framework to build firewall functionality such as filtering packet data.

Each iptables rule is applied to a chain within a table. An iptables chain is a collection of rules that are compared against packets with similar characteristics, while a table (such as nat or mangle) describes diverse categories of functionality. For instance, a mangle table alters packet data. Thus, specialized rules that alter packet data are applied to it, and filtering rules are applied to the filter table because the filter table filters packet data.

Iptables rules have a set of matches, along with a target, such as `Drop` or `Deny`, that instructs iptables what to do with a packet that conforms to the rule. Thus, without a target and a set of matches, iptables can’t effectively process packets. A target simply refers to a specific action to be taken if a packet matches a rule. Matches, on the other hand, must be met by every packet in order for iptables to process them.

Now that we understand how the iptables firewall operates, let's look at how to use iptables firewall to detect and reject or drop spoofed addresses.

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
