How to Run Your Own Public Time Server on Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/eddington_a._space_time_and_gravitation._fig._9.jpg?itok=KgNqViyZ)

One of the most important public services is timekeeping, but it doesn't get a lot of attention. Most public time servers are run by volunteers to help meet always-increasing demands. Learn how to run your own public time server and contribute to an essential public good. (See [Keep Accurate Time on Linux with NTP][1] to learn how to set up a LAN time server.)

### Famous Time Server Abusers

Like everything in life, even something as beneficial as time servers are subject to abuse fueled by either incompetence or malice.

Vendors of consumer network appliances are notorious for creating big messes. The first one I recall happened in 2003, when Netgear hard-coded the address of the University of Wisconsin-Madison's NTP server into their routers. All of a sudden the server was getting hammered with requests, and as Netgear sold more routers, the worse it got. Adding to the fun, the routers were programmed to send requests every second, which is way too many. Netgear issued a firmware upgrade, but few users ever upgrade their devices, and a number of them are pummeling the University of Wisconsin-Madison's NTP server to this day. Netgear gave them a pile of money, which hopefully will cover their costs until the last defective router dies. Similar ineptitudes were perpetrated by D-Link, Snapchat, TP-Link, and others.

The NTP protocol has become a choice vector for distributed denial-of-service attacks, using both reflection and amplification. It is called reflection when an attacker uses a forged source address to target a victim; the attacker sends requests to multiple servers, which then reply and bombard the forged address. Amplification is a large reply to a small request. For example, on Linux the `ntpq` command is a useful tool to query your NTP servers to verify that they are operating correctly. Some replies, such as lists of peers, are large. Combine reflection with amplification, and an attacker can get a return of 10x or more on the bandwidth they spend on the attack.

How do you protect your nice beneficial public NTP server? Start by using NTP 4.2.7p26 or newer, which hopefully is not an issue with your Linux distribution because that version was released in 2010. That release shipped with the most significant abuse vectors disabled as the default. The [current release is 4.2.8p10][2], released in 2017.

Another step you can take, which you should be doing anyway, is use ingress and egress filtering on your network. Block packets from entering your network that claim to be from your network, and block outgoing packets with forged return addresses. Ingress filtering helps you, and egress filtering helps you and everyone else. Read [BCP38.info][3] for much more information.

### Stratum 0, 1, 2 Time Servers

NTP is more than 30 years old, one of the oldest Internet protocols that is still widely used. Its purpose is keep computers synchronized to Coordinated Universal Time (UTC). The NTP network is both hierarchical, organized into strata, and peer. Stratum 0 contains master timekeeping devices such as atomic clocks. Stratum 1 time servers synchronize with Stratum 0 devices. Stratum 2 time servers synchronize with Stratum 1 time servers, and Stratum 3 with Stratum 2. The NTP protocol supports 16 strata, though in real life there not that many. Servers in each stratum also peer with each other.

In the olden days, we selected individual NTP servers for our client configurations. Those days are long gone, and now the better way is to use the [NTP pool addresses][4], which use round-robin DNS to share the load. Pool addresses are only for clients, such as individual PCs and your local LAN NTP server. When you run your own public server you won't use the pool addresses.

### Public NTP Server Configuration

There are two steps to running a public NTP server: set up your server, and then apply to join the NTP server pool. Running a public NTP server is a noble deed, but make sure you know what you're getting into. Joining the NTP pool is a long-term commitment, because even if you run it for a short time and then quit, you'll be receiving requests for years.

You need a static public IP address, a permanent reliable Internet connection with at least 512Kb/s bandwidth, and know how to configure your firewall correctly. NTP uses UDP port 123. The machine itself doesn't have to be any great thing, and a lot of admins piggyback NTP on other public-facing servers such as Web servers.

Configuring a public NTP server is just like configuring a LAN NTP server, with a few more configurations. Start by reading the [Rules of Engagement][5]. Follow the rules and mind your manners; almost everyone maintaining a time server is a volunteer just like you. Then select 4-7 Stratum 2 upstream time servers from [StratumTwoTimeServers][6]. Select some that are geographically close to your upstream Internet service provider (mine is 300 miles away), read their access policies, and then use `ping` and `mtr` to find the servers with the lowest latency and least number of hops.

This example `/etc/ntp.conf` includes both IPv4 and IPv6 and basic safeguards:
```
# stratum 2 server list
server servername_1 iburst
server servername_2 iburst
server servername_3 iburst
server servername_4 iburst
server servername_5 iburst

# access restrictions
restrict -4 default kod noquery nomodify notrap nopeer limited
restrict -6 default kod noquery nomodify notrap nopeer limited

# Allow ntpq and ntpdc queries only from localhost
restrict 127.0.0.1
restrict ::1

```

Start your NTP server, let it run for a few minutes, and then test that it is querying the remote servers:
```
$ ntpq -p
 remote refid st t when poll reach delay offset jitter
=================================================================
+tock.no-such-ag 200.98.196.212 2 u 36 64 7 98.654 88.439 65.123
+PBX.cytranet.ne 45.33.84.208 3 u 37 64 7 72.419 113.535 129.313
*eterna.binary.n 199.102.46.70 2 u 39 64 7 92.933 98.475 56.778
+time.mclarkdev. 132.236.56.250 3 u 37 64 5 111.059 88.029 74.919

```

Good so far. Now test from another PC, using your NTP server name. The following example shows correct output. If something is not correct you'll see an error message.
```
$ ntpdate -q _yourservername_
server 66.96.99.10, stratum 2, offset 0.017690, delay 0.12794
server 98.191.213.2, stratum 1, offset 0.014798, delay 0.22887
server 173.49.198.27, stratum 2, offset 0.020665, delay 0.15012
server 129.6.15.28, stratum 1, offset -0.018846, delay 0.20966
26 Jan 11:13:54 ntpdate[17293]: adjust time server 98.191.213.2 offset 0.014798 sec

```

Once your server is running satisfactorily apply at [manage.ntppool.org][7] to join the pool.

See the official handbook, [The Network Time Protocol (NTP) Distribution][8] to learn about all the command and configuration options, and advanced features such as management, querying, and authentication. Visit the following sites to learn pretty much everything you need about running a time server.

Learn more about Linux through the free ["Introduction to Linux" ][9]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/2/how-run-your-own-public-time-server-linux

作者：[CARLA SCHRODER][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/intro-to-linux/2018/1/keep-accurate-time-linux-ntp
[2]:http://www.ntp.org/downloads.html
[3]:http://www.bcp38.info/index.php/Main_Page
[4]:http://www.pool.ntp.org/en/use.html
[5]:http://support.ntp.org/bin/view/Servers/RulesOfEngagement
[6]:http://support.ntp.org/bin/view/Servers/StratumTwoTimeServers?redirectedfrom=Servers.StratumTwo
[7]:https://manage.ntppool.org/manage
[8]:https://www.eecis.udel.edu/~mills/ntp/html/index.html
[9]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
