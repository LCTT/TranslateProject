translating by firmianay

Examining network connections on Linux systems
============================================================

### Linux systems provide a lot of useful commands for reviewing network configuration and connections. Here's a look at a few, including ifquery, ifup, ifdown and ifconfig.


There are a lot of commands available on Linux for looking at network settings and connections. In today's post, we're going to run through some very handy commands and see how they work.

### ifquery command

One very useful command is the **ifquery** command. This command should give you a quick list of network interfaces. However, you might only see something like this —showing only the loopback interface:

```
$ ifquery --list
lo
```

If this is the case, your **/etc/network/interfaces** file doesn't include information on network interfaces except for the loopback interface. You can add lines like the last two in the example below — assuming DHCP is used to assign addresses — if you'd like it to be more useful.

```
# interfaces(5) file used by ifup(8) and ifdown(8)
auto lo
iface lo inet loopback
auto eth0
iface eth0 inet dhcp
```

### ifup and ifdown commands

The related **ifup** and **ifdown** commands can be used to bring network connections up and shut them down as needed provided this file has the required descriptive data. Just keep in mind that "if" means "interface" in these commands just as it does in the **ifconfig** command, not "if" as in "if I only had a brain".

<aside class="nativo-promo smartphone" id="" style="overflow: hidden; margin-bottom: 16px; max-width: 620px;"></aside>

### ifconfig command

The **ifconfig** command, on the other hand, doesn't read the /etc/network/interfaces file at all and still provides quite a bit of useful information on network interfaces -- configuration data along with packet counts that tell you how busy each interface has been. The ifconfig command can also be used to shut down and restart network interfaces (e.g., ifconfig eth0 down).

```
$ ifconfig eth0
eth0      Link encap:Ethernet  HWaddr 00:1e:4f:c8:43:fc
          inet addr:192.168.0.6  Bcast:192.168.0.255  Mask:255.255.255.0
          inet6 addr: fe80::b44b:bdb6:2527:6ae9/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:60474 errors:0 dropped:0 overruns:0 frame:0
          TX packets:33463 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:43922053 (43.9 MB)  TX bytes:4000460 (4.0 MB)
          Interrupt:21 Memory:fe9e0000-fea00000
```

The RX and TX packet counts in this output are extremely low. In addition, no errors or packet collisions have been reported. The **uptime** command will likely confirm that this system has only recently been rebooted.

The broadcast (Bcast) and network mask (Mask) addresses shown above indicate that the system is operating on a Class C equivalent network (the default) so local addresses will range from 192.168.0.1 to 192.168.0.254.

### netstat command

The **netstat** command provides information on routing and network connections. The **netstat -rn** command displays the system's routing table.

<aside class="nativo-promo tablet desktop" id="" style="overflow: hidden; margin-bottom: 16px; max-width: 620px;"></aside>

```
$ netstat -rn
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.0.1     0.0.0.0         UG        0 0          0 eth0
169.254.0.0     0.0.0.0         255.255.0.0     U         0 0          0 eth0
192.168.0.0     0.0.0.0         255.255.255.0   U         0 0          0 eth0
```

That **169.254.0.0** entry in the above output is only necessary if you are using or planning to use link-local communications. You can comment out the related lines in the **/etc/network/if-up.d/avahi-autoipd** file like this if this is not the case:

```
$ tail -12 /etc/network/if-up.d/avahi-autoipd
#if [ -x /bin/ip ]; then
#       # route already present?
#       ip route show | grep -q '^169.254.0.0/16[[:space:]]' && exit 0
#
#       /bin/ip route add 169.254.0.0/16 dev $IFACE metric 1000 scope link
#elif [ -x /sbin/route ]; then
#       # route already present?
#       /sbin/route -n | egrep -q "^169.254.0.0[[:space:]]" && exit 0
#
#       /sbin/route add -net 169.254.0.0 netmask 255.255.0.0 dev $IFACE metric 1000
#fi
```

### netstat -a command

The **netstat -a** command will display  **_all_**  network connections. To limit this to listening and established connections (generally much more useful), use the **netstat -at** command instead.

```
$ netstat -at
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State
tcp        0      0 *:ssh                   *:*                     LISTEN
tcp        0      0 localhost:ipp           *:*                     LISTEN
tcp        0      0 localhost:smtp          *:*                     LISTEN
tcp        0    256 192.168.0.6:ssh         192.168.0.32:53550      ESTABLISHED
tcp6       0      0 [::]:http               [::]:*                  LISTEN
tcp6       0      0 [::]:ssh                [::]:*                  LISTEN
tcp6       0      0 ip6-localhost:ipp       [::]:*                  LISTEN
tcp6       0      0 ip6-localhost:smtp      [::]:*                  LISTEN
```

### netstat -rn command

The **netstat -rn** command displays the system's routing table. The 192.168.0.1 address is the local gateway (Flags=UG).

```
$ netstat -rn
Kernel IP routing table
Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
0.0.0.0         192.168.0.1     0.0.0.0         UG        0 0          0 eth0
192.168.0.0     0.0.0.0         255.255.255.0   U         0 0          0 eth0
```

### host command

The **host** command works a lot like **nslookup** by looking up the remote system's IP address, but also provides the system's mail handler.

```
$ host world.std.com
world.std.com has address 192.74.137.5
world.std.com mail is handled by 10 smtp.theworld.com.
```

### nslookup command

The **nslookup** also provides information on the system (in this case, the local system) that is providing DNS lookup services.

```
$ nslookup world.std.com
Server:         127.0.1.1
Address:        127.0.1.1#53

Non-authoritative answer:
Name:   world.std.com
Address: 192.74.137.5
```

### dig command

The **dig** command provides quitea lot of information on connecting to a remote system -- including the name server we are communicating with and how long the query takes to respond and is often used for troubleshooting.

```
$ dig world.std.com

; <<>> DiG 9.10.3-P4-Ubuntu <<>> world.std.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 28679
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;world.std.com.                 IN      A

;; ANSWER SECTION:
world.std.com.          78146   IN      A       192.74.137.5

;; Query time: 37 msec
;; SERVER: 127.0.1.1#53(127.0.1.1)
;; WHEN: Mon Oct 09 13:26:46 EDT 2017
;; MSG SIZE  rcvd: 58
```

### nmap command

The **nmap** command is most frequently used to probe remote systems, but can also be used to report on the services being offered by the local system. In the output below, we can see that ssh is available for logins, that smtp is servicing email, that a web site is active, and that an ipp print service is running.

```
$ nmap localhost

Starting Nmap 7.01 ( https://nmap.org ) at 2017-10-09 15:01 EDT
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00016s latency).
Not shown: 996 closed ports
PORT    STATE SERVICE
22/tcp  open  ssh
25/tcp  open  smtp
80/tcp  open  http
631/tcp open  ipp

Nmap done: 1 IP address (1 host up) scanned in 0.09 seconds
```

Linux systems provide a lot of useful commands for reviewing their network configuration and connections. If you run out of commands to explore, keep in mind that **apropos network** might point you toward even more.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3230519/linux/examining-network-connections-on-linux-systems.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.networkworld.com/article/3221393/linux/review-considering-oracle-linux-is-a-no-brainer-if-you-re-an-oracle-shop.html
[2]:https://www.networkworld.com/article/3221393/linux/review-considering-oracle-linux-is-a-no-brainer-if-you-re-an-oracle-shop.html#tk.nww_nsdr_ndxprmomod
[3]:https://www.networkworld.com/article/3221423/linux/review-suse-linux-enterprise-server-12-sp2-scales-well-supports-3rd-party-virtualization.html
[4]:https://www.networkworld.com/article/3221423/linux/review-suse-linux-enterprise-server-12-sp2-scales-well-supports-3rd-party-virtualization.html#tk.nww_nsdr_ndxprmomod
[5]:https://www.networkworld.com/article/3221476/linux/review-free-linux-fedora-server-offers-upgrades-as-they-become-available-no-wait.html
[6]:https://www.networkworld.com/article/3221476/linux/review-free-linux-fedora-server-offers-upgrades-as-they-become-available-no-wait.html#tk.nww_nsdr_ndxprmomod
[7]:https://www.networkworld.com/article/3227929/linux/making-good-use-of-the-files-in-proc.html
[8]:https://www.networkworld.com/article/3221415/linux/linux-commands-for-managing-partitioning-troubleshooting.html
[9]:https://www.networkworld.com/article/2225768/cisco-subnet/dual-protocol-routing-with-raspberry-pi.html
[10]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[11]:https://www.networkworld.com/insider
[12]:https://www.networkworld.com/article/3227929/linux/making-good-use-of-the-files-in-proc.html
[13]:https://www.networkworld.com/article/3221415/linux/linux-commands-for-managing-partitioning-troubleshooting.html
[14]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[15]:https://www.networkworld.com/video/51206/solo-drone-has-linux-smarts-gopro-mount
[16]:https://www.flickr.com/photos/cogdog/4317096083/in/photolist-7zufg6-8JS2ym-bmDGsu-cnYW2C-mnrvP-a1s6VU-4ThA5-33B4ME-7GHEod-ERKLhX-5iPi6m-dTZAW6-UC6wyi-dRCJAZ-dq4wxW-peQyWU-8AGfjw-8wGAqs-4oLjd2-4T6pXM-dQua38-UKngxR-5kQwHN-ejjXMo-q4YvvL-7AUF3h-39ya27-7HiWfp-TosWda-6L3BZn-uST4Hi-TkRW8U-H7zBu-oDkNvU-6T2pZg-dQEbs9-39hxfS-5pBhQL-eR6iKT-7dgDwk-W15qVn-nVQHN3-mdRj8-75tqVh-RajJsC-7gympc-7dwxjt-9EadYN-p1qH1G-6rZhh6
[17]:https://creativecommons.org/licenses/by/2.0/legalcode
