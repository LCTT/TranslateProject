[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Transition to Nftables)
[#]: via: (https://opensourceforu.com/2019/10/transition-to-nftables/)
[#]: author: (Vijay Marcel D https://opensourceforu.com/author/vijay-marcel/)

Transition to Nftables
======

[![][1]][2]

_Every major distribution in the open source world is moving towards nftables as the default firewall. In short, the venerable Iptables is now dead. This article is a tutorial on how to build nftables._

Currently, there is an iptables-nft backend that is compatible with nftables but soon, even this will not be available. Also, as noted by Red Hat developers, sometimes it may translate the rules incorrectly. Rather than rely on an iptables-to-nftables converter, we need to know how to build our own nftables. In nftables, all the address families come under one rule. Nftables runs in the user space unlike iptables, where every module is in the kernel. It also needs less kernel updates and comes with new features such as maps, families and dictionaries.

**Address families**
Address families determine the types of packets that are processed. There are six address families in nftables and they are:

  * ip
  * ipv6
  * inet
  * arp
  * bridge
  * netdev



In nftables, the ipv4 and ipv6 protocols are combined into one single family called inet. So we do not need to specify two rules – one for ipv4 and another for ipv6. If no address family is specified, it will default to ip protocol, i.e., ipv4. Our area of interest lies in the inet family, since most home users will use either ipv4 or ipv6 protocols (see Figure 1).

**Nftables**
A typical nftable rule contains three parts – table, chain and rules.
Tables are containers for chains and rules. They are identified by their address families and their names. Chains contain the rules needed for the _inet/arp/bridge/netdev_ protocols and are of three types — filter, NAT and route. Nftable rules can be loaded from a script or they can be typed into a terminal and then saved as a rule-set. For home users, the default chain will be filter. The inet family contains the following hooks:

  * Input
  * Output
  * Forward
  * Pre-routing
  * Post-routing



**To script or not to script?**
One of the biggest questions is whether we can use a firewall script or not. The answer is: it’s your choice. Here’s some advice – if you have hundreds of rules in your firewall, then it is best to use a script, but if you are a typical home user, then you can type the commands in the terminal and then load your rule-set. Each option has its own advantages and disadvantages. In this article, we will type them in the terminal to build our firewall.

Nftables uses a program called nft to add, create, list, delete and load rules. Make sure nftables is installed along with conntrackd and netfilter-persistent, and remove iptables, using the following command:

```
apt-get install nftables conntrackd netfilter-persistent
apt-get purge iptables
```

_nft_ needs to be run as root or use sudo. Use the following commands to list, flush, delete ruleset and load the script respectively.

```
nft list ruleset
nft flush ruleset
nft delete table inet filter
/usr/sbin/nft -f /etc/nftables.conf
```

**Input policy**
The firewall will contain three parts – input, forward and output – just like in iptables. In the terminal, type the following commands for the input firewall. Make sure you have flushed your rule-set before you begin. Our default policy will be to drop everything. We will use the inet family in the firewall. Add the following rules as root or use sudo:

```
nft add table inet filter
nft add chain inet filter input { type filter hook input priority 0 \; counter \; policy drop \; }
```

You have noticed there is something called _priority 0_. It means giving the rule higher precedence. Hooks typically give higher precedence to the negative integer. Every hook has its own precedence and the filter chain has priority 0. You can check the nftables wiki page to see the priority of each hook.
To know the network interfaces in your computer, run the following command:

```
ip link show
```

It will show the installed network interface, one local host and other Ethernet port or your wireless port. Your Ethernet port’s name looks something like this: _enpXsY_ where X and Y are numbers, and the same goes for your wireless port. We have to allow the local host and only allow established incoming connections from the Internet.
Nftables has a feature called verdict statements on how to parse a rule. The verdict statements are _accept, drop, queue, jump, goto, continue_ and _return_. Since the firewall is a simple one, we will use either _accept_ or _drop the packets_ (Figure 2).

```
nft add rule inet filter input iifname lo accept
nft add rule inet filter input iifname enpXsY ct state new, established, related accept
```

Next, we have to add rules to protect us from stealth scans. Not all stealth scans are malicious but most of them are. We have to protect the network from such scans. The first set lists the TCP flags to be tested. Of these flags, the second set lists the flags to be matched with the first.

```
nft add rule inet filter input iifname enpXsY tcp flags \& \(syn\|fin\) == \(syn\|fin\) drop
nft add rule inet filter input iifname enpXsY tcp flags \& \(syn\|rst\) == \(syn\|rst\) drop
nft add rule inet filter input iifname enpXsY tcp flags \& \(fin\|rst\) == \(fin\|rst\) drop
nft add rule inet filter input iifname enpXsY tcp flags \& \(ack\|fin\) == fin drop
nft add rule inet filter input iifname enpXsY tcp flags \& \(ack\|psh\) == psh drop
nft add rule inet filter input iifname enpXsY tcp flags \& \(ack\|urg\) == urg drop
```

Remember, we are typing these commands in the terminal. So we have to add a backslash before some special characters, to make sure the terminal interprets it as it should. If you are using a script, then this isn’t required.

**A word of caution regarding ICMP**
The Internet Control Message Protocol (ICMP) is a diagnostic tool and so should not be dropped outright. Any attempt to fully block ICMP is unwise as it will also stop giving error messages to us. Enable only the most important control messages such as echo-request, echo-reply, destination-unreachable and time-exceeded, and reject the rest. Echo-request and echo-reply are part of ping. In the input, we only allow echo reply and in the output, we only allow the echo-request.

```
nft add rule inet filter input iifname enpXsY icmp type { echo-reply, destination-unreachable, time-exceeded } limit rate 1/second accept
nft add rule inet filter input iifname enpXsY ip protocol icmp drop
```

Finally, we are logging and dropping all the invalid packets.

```
nft add rule inet filter input iifname enpXsY ct state invalid log flags all level info prefix \”Invalid-Input: \”
nft add rule inet filter input iifname enpXsY ct state invalid drop
```

**Forward and output policy**
In both the forward and output policies, we will drop packets by default and only accept those that are established connections.

```
nft add chain inet filter forward { type filter hook forward priority 0 \; counter \; policy drop \; }
nft add rule inet filter forward ct state established, related accept
nft add rule inet filter forward ct state invalid drop
nft add chain inet filter output { type filter hook output priority 0 \; counter \; policy drop \; }
```

A typical desktop user needs only Port 80 and 443 to be allowed to access the Internet. Finally, allow acceptable ICMP protocols and drop the invalid packets while logging them.

```
nft add rule inet filter output oifname enpXsY tcp dport { 80, 443 } ct state established accept
nft add rule inet filter output oifname enpXsY icmp type { echo-request, destination-unreachable, time-exceeded } limit rate 1/second accept
nft add rule inet filter output oifname enpXsY ip protocol icmp drop
nft add rule inet filter output oifname enpXsY ct state invalid log flags all level info prefix \”Invalid-Output: \”
nft add rule inet filter output oifname enpXsY ct state invalid drop
```

Now we have to save our rule-set, otherwise it will be lost when we reboot. To do so, run the following command:

```
sudo nft list ruleset. > /etc/nftables.conf
```

We now have to load nftables at boot, for that enables the nftables service in systemd:

```
sudo systemctl enable nftables
```

Next, edit the nftables unit file to remove the Execstop option to avoid flushing the rule-set at every boot. The file is usually located in /etc/systemd/system/sysinit.target.wants/nftables.service. Now restart the nftables:

```
sudo systemctl restart nftables
```

**Logging in rsyslog**
When you log the dropped packets, they go straight to _syslog_, which makes reading your log file quite difficult. It is better to redirect your firewall logs to a separate file. Create a directory called nftables in
_/var/log_ and in it, create two files called _input.log_ and _output.log_ to store the input and output logs, respectively. Make sure rsyslog is installed in your system. Now go to _/etc/rsyslog.d_ and create a file called _nftables.conf_ with the following contents:

```
:msg,regex,”Invalid-Input: “ -/var/log/nftables/Input.log
:msg,regex,”Invalid-Output: “ -/var/log/nftables/Output.log
& stop
```

Now we have to make sure the log is manageable. For that, create another file in _/etc/logrotate.d_ called nftables with the following code:

```
/var/log/nftables/* { rotate 5 daily maxsize 50M missingok notifempty delaycompress compress postrotate invoke-rc.d rsyslog rotate > /dev/null endscript }
```

Restart nftables. You can now check your rule-set. If you feel typing each command in the terminal is bothersome, you can use a script to load the nftables firewall. I hope this article is useful in protecting your system.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/transition-to-nftables/

作者：[Vijay Marcel D][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/vijay-marcel/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2017/01/REHfirewall-1.jpg?resize=696%2C481&ssl=1 (REHfirewall)
[2]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2017/01/REHfirewall-1.jpg?fit=900%2C622&ssl=1
