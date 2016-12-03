Locking Down Your Linux Server
============================================================

> By: Steven J. Vaughan-Nichols

 ![](https://cdn-images-1.medium.com/max/800/1*DeQtDiP3I2sn0Ba7hO53DA.png) 

### No matter what your Linux, you need to protect it with an iptables-based firewall.

Yes! You’ve just set up your first Linux server and you’re ready to rock and roll! Right? Uh, no.

By default, your Linux box is not secure against attackers. Oh sure, it’s more secure than Windows XP, but that’s not saying much.

To really nail down your Linux system you need to follow the instructions in [Linode][1]’s [Securing your Server][2] guide.

To summarize, you must — first — turn off the services you don’t need. Of course to do that, you need to know what network services you’re running in the first place.

You can find out what those are with the shell command:

_netstat -tulpn_

[_Netstat_][3] will tell you what services you’re running and what ports they’re using. If you don’t need a particular service or port, you should turn it off. For example, unless you’re running a website, you don’t need to be running the [Apache][4] or [Nginx][5] web servers or have the 80 or 8080 ports open.

In short, when in doubt, turn it off or close it down.

On a plain vanilla Linux server, with nothing extra, you’ll see [SSH][6], [RPC][7], and [NTPdate][8] up and running with open ports. Do not add such old and insecure shell programs as [telnet][9] or the hackers will rise up and slap your server right out of your control. Yeah, maybe you loved telnet back on your SunOS box in the 80s, but that was then and this is now.

As for SSH, be sure to lock it down with [RSA keys][10] and [Fail2Ban][11]. Unless you need RPC — and if you need it, you’ll know — go ahead and uninstall it.

So much for closing your doors; let’s talk about using iptables to lock them from intruders.

When you start your Linux server it has no — nada — rules. That means all traffic is allowed. This is NOT GOOD. So, you need to setup your firewall … as soon as possible!

Iptables is a shell utility that sets network rule policies for [netfilter][12], Linux’s default firewall, using a set of rules to allow or block traffic. When someone tries to connect with your system — and someone will every day, without fail — iptables looks to match the request with its rules list. If it can’t find a match, it will resort to whatever the default action is.

That action should be to “Drop” the connection, which will block those outsiders wanting in. But it won’t let them know what happened to their attempts to knock on your server’s network door. (You could also “Reject” the connection, but that let’s them know you have a Linux firewall up and running. These days, the less information a stranger has about my system, the better. At least, that’s my philosophy.)

Now, you could set up your firewall with _just_ iptables. I’ve done it. But then, I used to ride a bike to work six miles away, uphill both directions. These days, I drive.

That means I use [FirewallD][13] for the Fedora distributions and [UFW][14][Uncomplicated Firewall] for the Debian family. These are easy-to-use, shell front-ends to iptables. For the finer details on how use either, see these Linode guides: [FirewallD][15] and [UFW][16].

Both come with default rule sets that, in essence, put up “No Trespassing” signs around your server. Use them.

But don’t get too excited about shutting down all your connections. For example:

_sudo ufw default deny incoming_

may look like a good idea. After all, it blocks everything!

Well, yes. Yes, it does. That means it also blocks ssh. And _that_ means you can no longer get to your shiny new server. Whoops!

Still, if you’re going to err, err on the side of blocking more connections. You see — the hackers really are out to get you.

Or, to be more exact, it’s not you or your servers personally. Sure, you’re not the [National Security Agency (NSA), which gets — no kidding — 300-million hacking attempts per day][17]. But a hacking script doesn’t care. It just screens the internet looking for a server with a known hole. My own quiet little servers get hundreds of attacks — on a slow day.

So, what are you waiting for? Go, lock down your network services. Install FirewallD or UFW and secure your servers. You’ll be glad you did.


* * *

_Please feel free to share below any comments or insights about your experience locking down a Linux server with an IPtables-based firewall. And if this blog was useful, consider sharing it through social media._


--------------------------------------------------------------------------------

via: https://medium.com/linode-cube/locking-down-your-linux-server-24d8516ae374#.qy8qq4bx2

作者：[Steven J. Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.com/linode-cube/locking-down-your-linux-server-24d8516ae374#.qy8qq4bx2
[1]:https://www.linode.com/
[2]:https://www.linode.com/docs/security/securing-your-server
[3]:http://www.faqs.org/docs/linux_network/x-087-2-iface.netstat.html
[4]:https://httpd.apache.org/
[5]:https://www.nginx.com/
[6]:https://www.linode.com/docs/tools-reference/ssh/
[7]:http://www.linux.org/threads/tcp-ip-service-remote-procedure-call-rpc.4913/
[8]:https://help.ubuntu.com/lts/serverguide/NTP.html
[9]:http://www.telnet.org/htm/faq.htm
[10]:https://www.linode.com/docs/security/securing-your-server/#create-an-authentication-key-pair
[11]:https://www.linode.com/docs/security/securing-your-server/#use-fail2ban-for-ssh-login-protection
[12]:https://www.netfilter.org/
[13]:http://www.firewalld.org/
[14]:https://help.ubuntu.com/community/UFW
[15]:https://www.linode.com/docs/security/firewalls/introduction-to-firewalld-on-centos
[16]:https://www.linode.com/docs/security/firewalls/configure-firewall-with-ufw
[17]:http://thehackernews.com/2016/02/nsa-utah-data-center.html
[18]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[19]:http://www.pcmag.com/author-bio/steven-j.-vaughan-nichols
[20]:http://www.infoworld.com/author/Steven-J.-Vaughan_Nichols/
[21]:http://www.computerworld.com/author/Steven-J.-Vaughan_Nichols/
[22]:http://www.linuxtoday.com/author/Steven+J.+Vaughan-Nichols/
[23]:http://www.eweek.com/cp/bio/Steven-J.-Vaughan-Nichols/
