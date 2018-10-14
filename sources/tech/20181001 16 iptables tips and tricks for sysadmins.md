16 iptables tips and tricks for sysadmins
======
Iptables provides powerful capabilities to control traffic coming in and out of your system.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/command_line_prompt.png?itok=wbGiJ_yg)

Modern Linux kernels come with a packet-filtering framework named [Netfilter][1]. Netfilter enables you to allow, drop, and modify traffic coming in and going out of a system. The **iptables** userspace command-line tool builds upon this functionality to provide a powerful firewall, which you can configure by adding rules to form a firewall policy. [iptables][2] can be very daunting with its rich set of capabilities and baroque command syntax. Let's explore some of them and develop a set of iptables tips and tricks for many situations a system administrator might encounter.

### Avoid locking yourself out

Scenario: You are going to make changes to the iptables policy rules on your company's primary server. You want to avoid locking yourself—and potentially everybody else—out. (This costs time and money and causes your phone to ring off the wall.)

#### Tip #1: Take a backup of your iptables configuration before you start working on it.

Back up your configuration with the command:

```
/sbin/iptables-save > /root/iptables-works

```
#### Tip #2: Even better, include a timestamp in the filename.

Add the timestamp with the command:

```
/sbin/iptables-save > /root/iptables-works-`date +%F`

```

You get a file with a name like:

```
/root/iptables-works-2018-09-11

```

If you do something that prevents your system from working, you can quickly restore it:

```
/sbin/iptables-restore < /root/iptables-works-2018-09-11

```

#### Tip #3: Every time you create a backup copy of the iptables policy, create a link to the file with 'latest' in the name.

```
ln –s /root/iptables-works-`date +%F` /root/iptables-works-latest

```

#### Tip #4: Put specific rules at the top of the policy and generic rules at the bottom.

Avoid generic rules like this at the top of the policy rules:

```
iptables -A INPUT -p tcp --dport 22 -j DROP

```

The more criteria you specify in the rule, the less chance you will have of locking yourself out. Instead of the very generic rule above, use something like this:

```
iptables -A INPUT -p tcp --dport 22 –s 10.0.0.0/8 –d 192.168.100.101 -j DROP

```

This rule appends ( **-A** ) to the **INPUT** chain a rule that will **DROP** any packets originating from the CIDR block **10.0.0.0/8** on TCP ( **-p tcp** ) port 22 ( **\--dport 22** ) destined for IP address 192.168.100.101 ( **-d 192.168.100.101** ).

There are plenty of ways you can be more specific. For example, using **-i eth0** will limit the processing to a single NIC in your server. This way, the filtering actions will not apply the rule to **eth1**.

#### Tip #5: Whitelist your IP address at the top of your policy rules.

This is a very effective method of not locking yourself out. Everybody else, not so much.

```
iptables -I INPUT -s <your IP> -j ACCEPT

```

You need to put this as the first rule for it to work properly. Remember, **-I** inserts it as the first rule; **-A** appends it to the end of the list.

#### Tip #6: Know and understand all the rules in your current policy.

Not making a mistake in the first place is half the battle. If you understand the inner workings behind your iptables policy, it will make your life easier. Draw a flowchart if you must. Also remember: What the policy does and what it is supposed to do can be two different things.

### Set up a workstation firewall policy

Scenario: You want to set up a workstation with a restrictive firewall policy.

#### Tip #1: Set the default policy as DROP.

```
# Set a default policy of DROP
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]
```

#### Tip #2: Allow users the minimum amount of services needed to get their work done.

The iptables rules need to allow the workstation to get an IP address, netmask, and other important information via DHCP ( **-p udp --dport 67:68 --sport 67:68** ). For remote management, the rules need to allow inbound SSH ( **\--dport 22** ), outbound mail ( **\--dport 25** ), DNS ( **\--dport 53** ), outbound ping ( **-p icmp** ), Network Time Protocol ( **\--dport 123 --sport 123** ), and outbound HTTP ( **\--dport 80** ) and HTTPS ( **\--dport 443** ).

```
# Set a default policy of DROP
*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT DROP [0:0]

# Accept any related or established connections
-I INPUT  1 -m state --state RELATED,ESTABLISHED -j ACCEPT
-I OUTPUT 1 -m state --state RELATED,ESTABLISHED -j ACCEPT

# Allow all traffic on the loopback interface
-A INPUT -i lo -j ACCEPT
-A OUTPUT -o lo -j ACCEPT

# Allow outbound DHCP request
-A OUTPUT –o eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT

# Allow inbound SSH
-A INPUT -i eth0 -p tcp -m tcp --dport 22 -m state --state NEW  -j ACCEPT

# Allow outbound email
-A OUTPUT -i eth0 -p tcp -m tcp --dport 25 -m state --state NEW  -j ACCEPT

# Outbound DNS lookups
-A OUTPUT -o eth0 -p udp -m udp --dport 53 -j ACCEPT

# Outbound PING requests
-A OUTPUT –o eth0 -p icmp -j ACCEPT

# Outbound Network Time Protocol (NTP) requests
-A OUTPUT –o eth0 -p udp --dport 123 --sport 123 -j ACCEPT

# Outbound HTTP
-A OUTPUT -o eth0 -p tcp -m tcp --dport 80 -m state --state NEW -j ACCEPT
-A OUTPUT -o eth0 -p tcp -m tcp --dport 443 -m state --state NEW -j ACCEPT

COMMIT
```

### Restrict an IP address range

Scenario: The CEO of your company thinks the employees are spending too much time on Facebook and not getting any work done. The CEO tells the CIO to do something about the employees wasting time on Facebook. The CIO tells the CISO to do something about employees wasting time on Facebook. Eventually, you are told the employees are wasting too much time on Facebook, and you have to do something about it. You decide to block all access to Facebook. First, find out Facebook's IP address by using the **host** and **whois** commands.

```
host -t a www.facebook.com
www.facebook.com is an alias for star.c10r.facebook.com.
star.c10r.facebook.com has address 31.13.65.17
whois 31.13.65.17 | grep inetnum
inetnum:        31.13.64.0 - 31.13.127.255
```

Then convert that range to CIDR notation by using the [CIDR to IPv4 Conversion][3] page. You get **31.13.64.0/18**. To prevent outgoing access to [www.facebook.com][4], enter:

```
iptables -A OUTPUT -p tcp -i eth0 –o eth1 –d 31.13.64.0/18 -j DROP
```

### Regulate by time

Scenario: The backlash from the company's employees over denying access to Facebook access causes the CEO to relent a little (that and his administrative assistant's reminding him that she keeps HIS Facebook page up-to-date). The CEO decides to allow access to Facebook.com only at lunchtime (12PM to 1PM). Assuming the default policy is DROP, use iptables' time features to open up access.

```
iptables –A OUTPUT -p tcp -m multiport --dport http,https -i eth0 -o eth1 -m time --timestart 12:00 --timestart 12:00 –timestop 13:00 –d
31.13.64.0/18  -j ACCEPT
```

This command sets the policy to allow ( **-j ACCEPT** ) http and https ( **-m multiport --dport http,https** ) between noon ( **\--timestart 12:00** ) and 13PM ( **\--timestop 13:00** ) to Facebook.com ( **–d[31.13.64.0/18][5]** ).

### Regulate by time—Take 2

Scenario: During planned downtime for system maintenance, you need to deny all TCP and UDP traffic between the hours of 2AM and 3AM so maintenance tasks won't be disrupted by incoming traffic. This will take two iptables rules:

```
iptables -A INPUT -p tcp -m time --timestart 02:00 --timestop 03:00 -j DROP
iptables -A INPUT -p udp -m time --timestart 02:00 --timestop 03:00 -j DROP
```

With these rules, TCP and UDP traffic ( **-p tcp and -p udp** ) are denied ( **-j DROP** ) between the hours of 2AM ( **\--timestart 02:00** ) and 3AM ( **\--timestop 03:00** ) on input ( **-A INPUT** ).

### Limit connections with iptables

Scenario: Your internet-connected web servers are under attack by bad actors from around the world attempting to DoS (Denial of Service) them. To mitigate these attacks, you restrict the number of connections a single IP address can have to your web server:

```
iptables –A INPUT –p tcp –syn -m multiport -–dport http,https –m connlimit -–connlimit-above 20 –j REJECT -–reject-with-tcp-reset
```

Let's look at what this rule does. If a host makes more than 20 ( **-–connlimit-above 20** ) new connections ( **–p tcp –syn** ) in a minute to the web servers ( **-–dport http,https** ), reject the new connection ( **–j REJECT** ) and tell the connecting host you are rejecting the connection ( **-–reject-with-tcp-reset** ).

### Monitor iptables rules

Scenario: Since iptables operates on a "first match wins" basis as packets traverse the rules in a chain, frequently matched rules should be near the top of the policy and less frequently matched rules should be near the bottom. How do you know which rules are traversed the most or the least so they can be ordered nearer the top or the bottom?

#### Tip #1: See how many times each rule has been hit.

Use this command:

```
iptables -L -v -n –line-numbers
```

The command will list all the rules in the chain ( **-L** ). Since no chain was specified, all the chains will be listed with verbose output ( **-v** ) showing packet and byte counters in numeric format ( **-n** ) with line numbers at the beginning of each rule corresponding to that rule's position in the chain.

Using the packet and bytes counts, you can order the most frequently traversed rules to the top and the least frequently traversed rules towards the bottom.

#### Tip #2: Remove unnecessary rules.

Which rules aren't getting any matches at all? These would be good candidates for removal from the policy. You can find that out with this command:

```
iptables -nvL | grep -v "0     0"
```

Note: that's not a tab between the zeros; there are five spaces between the zeros.

#### Tip #3: Monitor what's going on.

You would like to monitor what's going on with iptables in real time, like with **top**. Use this command to monitor the activity of iptables activity dynamically and show only the rules that are actively being traversed:

```
watch --interval=5 'iptables -nvL | grep -v "0     0"'
```

**watch** runs **'iptables -nvL | grep -v "0 0"'** every five seconds and displays the first screen of its output. This allows you to watch the packet and byte counts change over time.

### Report on iptables

Scenario: Your manager thinks this iptables firewall stuff is just great, but a daily activity report would be even better. Sometimes it's more important to write a report than to do the work.

Use the packet filter/firewall/IDS log analyzer [FWLogwatch][6] to create reports based on the iptables firewall logs. FWLogwatch supports many log formats and offers many analysis options. It generates daily and monthly summaries of the log files, allowing the security administrator to free up substantial time, maintain better control over network security, and reduce unnoticed attacks.

Here is sample output from FWLogwatch:

![](https://opensource.com/sites/default/files/uploads/fwlogwatch.png)

### More than just ACCEPT and DROP

We've covered many facets of iptables, all the way from making sure you don't lock yourself out when working with iptables to monitoring iptables to visualizing the activity of an iptables firewall. These will get you started down the path to realizing even more iptables tips and tricks.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/iptables-tips-and-tricks

作者：[Gary Smith][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/greptile
[1]: https://en.wikipedia.org/wiki/Netfilter
[2]: https://en.wikipedia.org/wiki/Iptables
[3]: http://www.ipaddressguide.com/cidr
[4]: http://www.facebook.com
[5]: http://31.13.64.0/18
[6]: http://fwlogwatch.inside-security.de/
