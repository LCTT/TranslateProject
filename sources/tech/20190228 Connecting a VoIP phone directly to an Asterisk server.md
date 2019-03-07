[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Connecting a VoIP phone directly to an Asterisk server)
[#]: via: (https://feeding.cloud.geek.nz/posts/connecting-voip-phone-directly-to-asterisk-server/)
[#]: author: (François Marier https://fmarier.org/)

Connecting a VoIP phone directly to an Asterisk server
======

On my [Asterisk][1] server, I happen to have two on-board ethernet boards. Since I only used one of these, I decided to move my VoIP phone from the local network switch to being connected directly to the Asterisk server.

The main advantage is that this phone, running proprietary software of unknown quality, is no longer available on my general home network. Most importantly though, it no longer has access to the Internet, without my having to firewall it manually.

Here's how I configured everything.

### Private network configuration

On the server, I started by giving the second network interface a static IP address in `/etc/network/interfaces`:

```
auto eth1
iface eth1 inet static
 address 192.168.2.2
 netmask 255.255.255.0
```

On the VoIP phone itself, I set the static IP address to `192.168.2.3` and the DNS server to `192.168.2.2`. I then updated the SIP registrar IP address to `192.168.2.2`.

The DNS server actually refers to an [unbound daemon][2] running on the Asterisk server. The only configuration change I had to make was to listen on the second interface and allow the VoIP phone in:

```
server:
 interface: 127.0.0.1
 interface: 192.168.2.2
 access-control: 0.0.0.0/0 refuse
 access-control: 127.0.0.1/32 allow
 access-control: 192.168.2.3/32 allow
```

Finally, I opened the right ports on the server's firewall in `/etc/network/iptables.up.rules`:

```
-A INPUT -s 192.168.2.3/32 -p udp --dport 5060 -j ACCEPT
-A INPUT -s 192.168.2.3/32 -p udp --dport 10000:20000 -j ACCEPT
```

### Accessing the admin page

Now that the VoIP phone is no longer available on the local network, it's not possible to access its admin page. That's a good thing from a security point of view, but it's somewhat inconvenient.

Therefore I put the following in my `~/.ssh/config` to make the admin page available on `http://localhost:8081` after I connect to the Asterisk server via ssh:

```
Host asterisk
 LocalForward 8081 192.168.2.3:80
```

--------------------------------------------------------------------------------

via: https://feeding.cloud.geek.nz/posts/connecting-voip-phone-directly-to-asterisk-server/

作者：[François Marier][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fmarier.org/
[b]: https://github.com/lujun9972
[1]: https://www.asterisk.org/
[2]: https://feeding.cloud.geek.nz/posts/setting-up-your-own-dnssec-aware/
