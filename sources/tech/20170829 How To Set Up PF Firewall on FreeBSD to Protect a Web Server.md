How To Set Up PF Firewall on FreeBSD to Protect a Web Server
======

I am a new FreeBSD server user and moved from netfilter on Linux. How do I setup a firewall with PF on FreeBSD server to protect a web server with single public IP address and interface?


PF is an acronym for packet filter. It was created for OpenBSD but has been ported to FreeBSD and other operating systems. It is a stateful packet filtering engine. This tutorial will show you how to set up a firewall with PF on FreeBSD 10.x and 11.x server to protect your web server.


## Step 1 - Turn on PF firewall

You need to add the following three lines to /etc/rc.conf file:
```
# echo 'pf_enable="YES"' >> /etc/rc.conf
# echo 'pf_rules="/usr/local/etc/pf.conf"' >> /etc/rc.conf
# echo 'pflog_enable="YES"' >> /etc/rc.conf
# echo 'pflog_logfile="/var/log/pflog"' >> /etc/rc.conf
```
Where,

  1.  **pf_enable="YES"** - Turn on PF service.
  2.  **pf_rules="/usr/local/etc/pf.conf"** - Read PF rules from this file.
  3.  **pflog_enable="YES"** - Turn on logging support for PF.
  4.  **pflog_logfile="/var/log/pflog"** - File where pflogd should store the logfile i.e. store logs in /var/log/pflog file.



[![How To Set Up a Firewall with PF on FreeBSD to Protect a Web Server][1]][1]

## Step 2 - Creating firewall rules in /usr/local/etc/pf.conf

Type the following command:
```
# vi /usr/local/etc/pf.conf
```
Append the following PF rulesets :
```
# vim: set ft=pf
# /usr/local/etc/pf.conf
 
## Set your public interface ##
ext_if="vtnet0"
 
## Set your server public IP address ##
ext_if_ip="172.xxx.yyy.zzz"
 
## Set and drop these IP ranges on public interface ##
martians = "{ 127.0.0.0/8, 192.168.0.0/16, 172.16.0.0/12, \
	      10.0.0.0/8, 169.254.0.0/16, 192.0.2.0/24, \
	      0.0.0.0/8, 240.0.0.0/4 }"
 
## Set http(80)/https (443) port here ##
webports = "{http, https}"
 
## enable these services ##
int_tcp_services = "{domain, ntp, smtp, www, https, ftp, ssh}"
int_udp_services = "{domain, ntp}"
 
## Skip loop back interface - Skip all PF processing on interface ##
set skip on lo
 
## Sets the interface for which PF should gather statistics such as bytes in/out and packets passed/blocked ##
set loginterface $ext_if
 
## Set default policy ##
block return in log all
block out all
 
# Deal with attacks based on incorrect handling of packet fragments 
scrub in all
 
# Drop all Non-Routable Addresses 
block drop in quick on $ext_if from $martians to any
block drop out quick on $ext_if from any to $martians
 
## Blocking spoofed packets
antispoof quick for $ext_if
 
# Open SSH port which is listening on port 22 from VPN 139.xx.yy.zz Ip only
# I do not allow or accept ssh traffic from ALL for security reasons 
pass in quick on $ext_if inet proto tcp from 139.xxx.yyy.zzz to $ext_if_ip port = ssh flags S/SA keep state label "USER_RULE: Allow SSH from 139.xxx.yyy.zzz"
## Use the following rule to enable ssh for ALL users from any IP address #
## pass in inet proto tcp to $ext_if port ssh
### [ OR ] ###
## pass in inet proto tcp to $ext_if port 22 
 
# Allow Ping-Pong stuff. Be a good sysadmin 
pass inet proto icmp icmp-type echoreq
 
# All access to our Nginx/Apache/Lighttpd Webserver ports 
pass proto tcp from any to $ext_if port $webports
 
# Allow essential outgoing traffic 
pass out quick on $ext_if proto tcp to any port $int_tcp_services
pass out quick on $ext_if proto udp to any port $int_udp_services
 
# Add custom rules below
```

Save and close the file. PR [welcome here to improve rulesets][2]. To check for syntax error, run:
`# service pf check`
OR
`/etc/rc.d/pf check`
OR
`# pfctl -n -f /usr/local/etc/pf.conf `

## Step 3 - Start PF firewall

The commands are as follows. Be careful you might be disconnected from your server over ssh based session:

### Start PF

`# service pf start`

### Stop PF

`# service pf stop`

### Check PF for syntax error

`# service pf check`

### Restart PF

`# service pf restart`

### See PF status

`# service pf status`
Sample outputs:
```
Status: Enabled for 0 days 00:02:18           Debug: Urgent
 
Interface Stats for vtnet0            IPv4             IPv6
  Bytes In                           19463                0
  Bytes Out                          18541                0
  Packets In
    Passed                             244                0
    Blocked                              3                0
  Packets Out
    Passed                             136                0
    Blocked                             12                0
 
State Table                          Total             Rate
  current entries                        1               
  searches                             395            2.9/s
  inserts                                4            0.0/s
  removals                               3            0.0/s
Counters
  match                                 19            0.1/s
  bad-offset                             0            0.0/s
  fragment                               0            0.0/s
  short                                  0            0.0/s
  normalize                              0            0.0/s
  memory                                 0            0.0/s
  bad-timestamp                          0            0.0/s
  congestion                             0            0.0/s
  ip-option                              0            0.0/s
  proto-cksum                            0            0.0/s
  state-mismatch                         0            0.0/s
  state-insert                           0            0.0/s
  state-limit                            0            0.0/s
  src-limit                              0            0.0/s
  synproxy                               0            0.0/s
  map-failed                             0            0.0/s
```


### Command to start/stop/restart pflog service

Type the following commands:
```
# service pflog start
# service pflog stop
# service pflog restart
```

## Step 4 - A quick introduction to pfctl command

You need to use the pfctl command to see PF ruleset and parameter configuration including status information from the packet filter. Let us see all common commands:

### Show PF rules information

`# pfctl -s rules`
Sample outputs:
```
block return in log all
block drop out all
block drop in quick on ! vtnet0 inet from 172.xxx.yyy.zzz/24 to any
block drop in quick inet from 172.xxx.yyy.zzz/24 to any
pass in quick on vtnet0 inet proto tcp from 139.aaa.ccc.ddd to 172.xxx.yyy.zzz/24 port = ssh flags S/SA keep state label "USER_RULE: Allow SSH from 139.aaa.ccc.ddd"
pass inet proto icmp all icmp-type echoreq keep state
pass out quick on vtnet0 proto tcp from any to any port = domain flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = ntp flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = smtp flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = http flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = https flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = ftp flags S/SA keep state
pass out quick on vtnet0 proto tcp from any to any port = ssh flags S/SA keep state
pass out quick on vtnet0 proto udp from any to any port = domain keep state
pass out quick on vtnet0 proto udp from any to any port = ntp keep state
```

#### Show verbose output for each rule

`# pfctl -v -s rules`

#### Add rule numbers with verbose output for each rule

`# pfctl -vvsr show`

#### Show state

```
# pfctl -s state
# pfctl -s state | more
# pfctl -s state | grep 'something'
```

### How to disable PF from the CLI

`# pfctl -d `

### How to enable PF from the CLI

`# pfctl -e `

### How to flush ALL PF rules/nat/tables from the CLI

`# pfctl -F all`
Sample outputs:
```
rules cleared
nat cleared
0 tables deleted.
2 states cleared
source tracking entries cleared
pf: statistics cleared
pf: interface flags reset
```

#### How to flush only the PF RULES from the CLI

`# pfctl -F rules `

#### How to flush only queue's from the CLI

`# pfctl -F queue `

#### How to flush all stats that are not part of any rule from the CLI

`# pfctl -F info`

#### How to clear all counters from the CLI

`# pfctl -z clear `

## Step 5 - See PF log

PF logs are in binary format. To see them type:
`# tcpdump -n -e -ttt -r /var/log/pflog`
Sample outputs:
```
Aug 29 15:41:11.757829 rule 0/(match) block in on vio0: 86.47.225.151.55806 > 45.FOO.BAR.IP.23: S 757158343:757158343(0) win 52206 [tos 0x28]
Aug 29 15:41:44.193309 rule 0/(match) block in on vio0: 5.196.83.88.25461 > 45.FOO.BAR.IP.26941: S 2224505792:2224505792(0) ack 4252565505 win 17520 (DF) [tos 0x24]
Aug 29 15:41:54.628027 rule 0/(match) block in on vio0: 45.55.13.94.50217 > 45.FOO.BAR.IP.465: S 3941123632:3941123632(0) win 65535
Aug 29 15:42:11.126427 rule 0/(match) block in on vio0: 87.250.224.127.59862 > 45.FOO.BAR.IP.80: S 248176545:248176545(0) win 28200 <mss 1410,sackOK,timestamp 1044055305 0,nop,wscale 8> (DF)
Aug 29 15:43:04.953537 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.7475: S 1164335542:1164335542(0) win 1024
Aug 29 15:43:05.122156 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.7475: R 1164335543:1164335543(0) win 1200
Aug 29 15:43:37.302410 rule 0/(match) block in on vio0: 94.130.12.27.18080 > 45.FOO.BAR.IP.64857: S 683904905:683904905(0) ack 4000841729 win 16384 <mss 1460>
Aug 29 15:44:46.574863 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.7677: S 3451987887:3451987887(0) win 1024
Aug 29 15:44:46.819754 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.7677: R 3451987888:3451987888(0) win 1200
Aug 29 15:45:21.194752 rule 0/(match) block in on vio0: 185.40.4.130.55910 > 45.FOO.BAR.IP.80: S 3106068642:3106068642(0) win 1024
Aug 29 15:45:32.999219 rule 0/(match) block in on vio0: 185.40.4.130.55910 > 45.FOO.BAR.IP.808: S 322591763:322591763(0) win 1024
Aug 29 15:46:30.157884 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6511: S 2412580953:2412580953(0) win 1024 [tos 0x28]
Aug 29 15:46:30.252023 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6511: R 2412580954:2412580954(0) win 1200 [tos 0x28]
Aug 29 15:49:44.337015 rule 0/(match) block in on vio0: 189.219.226.213.22640 > 45.FOO.BAR.IP.23: S 14807:14807(0) win 14600 [tos 0x28]
Aug 29 15:49:55.161572 rule 0/(match) block in on vio0: 5.196.83.88.25461 > 45.FOO.BAR.IP.40321: S 1297217585:1297217585(0) ack 1051525121 win 17520 (DF) [tos 0x24]
Aug 29 15:49:59.735391 rule 0/(match) block in on vio0: 36.7.147.209.2545 > 45.FOO.BAR.IP.3389: SWE 3577047469:3577047469(0) win 8192 <mss 1460,nop,wscale 8,nop,nop,sackOK> (DF) [tos 0x2 (E)]
Aug 29 15:50:00.703229 rule 0/(match) block in on vio0: 36.7.147.209.2546 > 45.FOO.BAR.IP.3389: SWE 1539382950:1539382950(0) win 8192 <mss 1460,nop,wscale 8,nop,nop,sackOK> (DF) [tos 0x2 (E)]
Aug 29 15:51:33.880334 rule 0/(match) block in on vio0: 45.55.22.21.53510 > 45.FOO.BAR.IP.2362: udp 14
Aug 29 15:51:34.006656 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6491: S 151489102:151489102(0) win 1024 [tos 0x28]
Aug 29 15:51:34.274654 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6491: R 151489103:151489103(0) win 1200 [tos 0x28]
Aug 29 15:51:36.393019 rule 0/(match) block in on vio0: 60.191.38.78.4249 > 45.FOO.BAR.IP.8000: S 3746478095:3746478095(0) win 29200 (DF)
Aug 29 15:51:57.213051 rule 0/(match) block in on vio0: 24.137.245.138.7343 > 45.FOO.BAR.IP.5358: S 14134:14134(0) win 14600
Aug 29 15:52:37.852219 rule 0/(match) block in on vio0: 122.226.185.125.51128 > 45.FOO.BAR.IP.23: S 1715745381:1715745381(0) win 5840 <mss 1420,sackOK,timestamp 13511417 0,nop,wscale 2> (DF)
Aug 29 15:53:31.309325 rule 0/(match) block in on vio0: 189.218.148.69.377 > 45.FOO.BAR.IP5358: S 65340:65340(0) win 14600 [tos 0x28]
Aug 29 15:53:31.809570 rule 0/(match) block in on vio0: 13.93.104.140.53184 > 45.FOO.BAR.IP.1433: S 39854048:39854048(0) win 1024
Aug 29 15:53:32.138231 rule 0/(match) block in on vio0: 13.93.104.140.53184 > 45.FOO.BAR.IP.1433: R 39854049:39854049(0) win 1200
Aug 29 15:53:41.459088 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6028: S 168338703:168338703(0) win 1024
Aug 29 15:53:41.789732 rule 0/(match) block in on vio0: 77.72.82.22.47218 > 45.FOO.BAR.IP.6028: R 168338704:168338704(0) win 1200
Aug 29 15:54:34.993594 rule 0/(match) block in on vio0: 212.47.234.50.5102 > 45.FOO.BAR.IP.5060: udp 408 (DF) [tos 0x28]
Aug 29 15:54:57.987449 rule 0/(match) block in on vio0: 51.15.69.145.5100 > 45.FOO.BAR.IP.5060: udp 406 (DF) [tos 0x28]
Aug 29 15:55:07.001743 rule 0/(match) block in on vio0: 190.83.174.214.58863 > 45.FOO.BAR.IP.23: S 757158343:757158343(0) win 27420
Aug 29 15:55:51.269549 rule 0/(match) block in on vio0: 142.217.201.69.26112 > 45.FOO.BAR.IP.22: S 757158343:757158343(0) win 22840 <mss 1460>
Aug 29 15:58:41.346028 rule 0/(match) block in on vio0: 169.1.29.111.29765 > 45.FOO.BAR.IP.23: S 757158343:757158343(0) win 28509
Aug 29 15:59:11.575927 rule 0/(match) block in on vio0: 187.160.235.162.32427 > 45.FOO.BAR.IP.5358: S 22445:22445(0) win 14600 [tos 0x28]
Aug 29 15:59:37.826598 rule 0/(match) block in on vio0: 94.74.81.97.54656 > 45.FOO.BAR.IP.3128: S 2720157526:2720157526(0) win 1024 [tos 0x28]
Aug 29 15:59:37.991171 rule 0/(match) block in on vio0: 94.74.81.97.54656 > 45.FOO.BAR.IP.3128: R 2720157527:2720157527(0) win 1200 [tos 0x28]
Aug 29 16:01:36.990050 rule 0/(match) block in on vio0: 182.18.8.28.23299 > 45.FOO.BAR.IP.445: S 1510146048:1510146048(0) win 16384
```

To see live log run:
`# tcpdump -n -e -ttt -i pflog0`
For more info the [PF FAQ][3], [FreeBSD HANDBOOK][4] and the following man pages:
```
# man tcpdump
# man pfctl
# man pf
```

## about the author:

The author is the creator of nixCraft and a seasoned sysadmin and a trainer for the Linux operating system/Unix shell scripting. He has worked with global clients and in various industries, including IT, education, defense and space research, and the nonprofit sector. Follow him on [Twitter][5], [Facebook][6], [Google+][7].

--------------------------------------------------------------------------------

via: https://www.cyberciti.biz/faq/how-to-set-up-a-firewall-with-pf-on-freebsd-to-protect-a-web-server/

作者：[Vivek Gite][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.cyberciti.biz
[1]:https://www.cyberciti.biz/media/new/faq/2017/08/howto-setup-a-firewall-with-pf-on-freebsd.001.jpeg
[2]:https://github.com/nixcraft/pf.conf/blob/master/pf.conf
[3]:https://www.openbsd.org/faq/pf/
[4]:https://www.freebsd.org/doc/handbook/firewalls.html
[5]:https://twitter.com/nixcraft
[6]:https://facebook.com/nixcraft
[7]:https://plus.google.com/+CybercitiBiz
