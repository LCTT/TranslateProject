[#]: subject: "Diagnose connectivity issues with the Linux ping command"
[#]: via: "https://opensource.com/article/21/10/linux-ping-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "chai001125"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Diagnose connectivity issues with the Linux ping command
======
One of the most fundamental diagnostic tools for networked connectivity
is the ping command.
![World locations with red dots with a sun burst background][1]

Networked computers are so common these days that most of us take it for granted that a computer on one side of a room can contact one on the other side of the room, much less the other side of the world. When it works as designed, networking is what makes the Internet, the cloud, file shares, media streaming, remote administration, printing, and much more possible. When something goes wrong, it can sometimes be challenging to diagnose. One of the most fundamental diagnostic tools for networked connectivity is the `ping` command.

### The basic ping

When you can't reach a computer on your local network, or a server on the Internet, you can ping it. A ping sends an Internet Control Message Protocol (ICMP) packet to a destination IP address. ICMP is, by design, a rudimentary format used mostly for diagnostics: It's essentially a call and response signal.

But there's an order to troubleshooting, and it starts as close to home as possible. When in doubt, first ping your own computer to ensure you're running a networking stack. The computer you're operating is also called your _localhost_, and it has a special IP address assigned for speaking to itself: 12.0.0.1.

The `ping`** **command understands the _localhost_ hostname, its IP address, and a shortcut of just `0`.

You can control how many signals you send with the `-c` (as in _count_)** **option.


```
$ ping 0 -c1
PING 0 (127.0.0.1) 56(84) bytes of data.
64 bytes from 127.0.0.1: icmp_seq=1 ttl=64 time=0.069 ms

\--- 0 ping statistics ---
1 packets transmitted, 1 received, 0% packet loss, time 0ms
rtt min/avg/max/mdev = 0.069/0.069/0.069/0.000 ms
```

After you've established that your local networking stack is up and running, you can ping your router. The address of a router usually starts with 192,168, or 10. The exact IP address depends on your router's configuration.

When you don't specify how many pings to send, you can stop `ping` from running with **Ctrl**+**C**.


```
$ ping 192.168.0.1 
PING 192.168.0.1 (192.168.0.1) 56(84) bytes of data.
From 192.168.0.100: icmp_seq=2 Redirect Host(New nexthop: 192.168.0.1)
From 192.168.0.100: icmp_seq=3 Redirect Host(New nexthop: 192.168.0.1)
From 192.168.0.100: icmp_seq=4 Redirect Host(New nexthop: 192.168.0.1)
From 192.168.0.100: icmp_seq=5 Redirect Host(New nexthop: 192.168.0.1)
^C
```

If you can reach your router, that means your wired or wireless connection is working. 

What about other hosts on my network? You can ping all kinds of devices. Not all are guaranteed to respond (some devices drop ICMP packets), but many do. For instance, I can ping my printer:


```
`$ ping 192.168.0.4 `
```

### Pinging beyond your network

Beyond establishing that your own network is working as expected, you can also ping out into the wider world beyond your router. Again, not all servers are permitted to receive, much less respond to, ICMP. However, there are some that do, and a vital server to the working of the Internet is a nameserver.

Google's DNS server is relatively easy to remember, and it does respond to pings:


```
$ ping -c 2 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=116 time=53.3 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=116 time=53.5 ms

\--- 8.8.8.8 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1000ms
rtt min/avg/max/mdev = 53.304/53.424/53.544/0.120 ms
```

When a site has apparently disappeared, you might be able to probe the worldwide DNS network to find out what its host server's address is, and then ping that server. This at least tells you whether the host is down or whether it's just a web server issue.

For example, say you're trying unsuccessfully to reach example.com. First, find the IP address using the `host` command:


```
$ host example.com
example.com has address 93.184.216.34
example.com has IPv6 address 2606:2800:220:1:248:1893:25c8:1946
example.com mail is handled by 0
```

And then ping the website's host by IP:


```
`$ ping 93.184.216.34 -c 1`
```

### Ping and IPv6

Ping works over IPv4 as well as IPv6. Using only one of them explicitly can be enforced by specifying `-4` or `-6`. 

### Packet size

You can change the size of the ICMP packets you're sending with the `-s` option. The default packet size is 56, which translates into 64 ICMP data bytes when combined with the 8-byte header. This command sends 43 bytes:


```
`$ ping -s 35 -c 5 8.8.8.8`
```

You can print a timestamp before each ping report in your terminal with the `-D` option. This provides the UNIX epoch time, plus microseconds:


```
$ ping -D 8.8.8.8 
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
[1634013430.297468] 64 bytes from 8.8.8.8: icmp_seq=1 ttl=116 time=53.3 ms
[1634013431.298738] 64 bytes from 8.8.8.8: icmp_seq=2 ttl=116 time=53.1 ms
```

### Ping time

You can change the time interval between pings using the `-i` option. This changes the ping interval to two seconds:


```
`$ ping -s 2 `
```

You can also stop pinging after some value of time (in seconds) with the `-w` option:


```
`$ ping -w 6`
```

### Variants

There are many implementations of ping. The `iputils` package provides a `ping` command, [Busybox ][2]has a `ping` command, and there's one from BSD and others. There's even a GUI for `ping`: Gping is available for Linux, macOS, and Windows. You can find more information for `gping` on [Github][3]. 

### Learn to ping

The `ping` command is simple, but it can be eyes and ears out on the vast expanse that is your network. Next time you have connectivity issues, let `ping` be the first tool you turn to.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/10/linux-ping-command

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/world_remote_teams.png?itok=Wk1yBFv6 (World locations with red dots with a sun burst background)
[2]: https://opensource.com/article/21/8/what-busybox
[3]: https://github.com/orf/gping
