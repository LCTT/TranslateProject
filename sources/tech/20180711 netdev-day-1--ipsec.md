
FSSlc is translating

netdev day 1: IPsec!
============================================================

Hello! This year, like last year, I’m at the [netdev conference][3]. (here are my [notes from last year][4]).

Today at the conference I learned a lot about IPsec, so we’re going to talk about IPsec! There was an IPsec workshop given by Sowmini Varadhan and [Paul Wouters][5]. All of the mistakes in this post are 100% my fault though :).

### what’s IPsec?

IPsec is a protocol used to encrypt IP packets. Some VPNs are implemented with IPsec. One big thing I hadn’t really realized until today is that there isn’t just one protocol used for VPNs – I think VPN is just a general term meaning “your IP packets get encrypted and sent through another server” and VPNs can be implemented using a bunch of different protocols (OpenVPN, PPTP, SSTP, IPsec, etc) in a bunch of different ways.

Why is IPsec different from other VPN protocols? (like, why was there a tutorial about it at netdev and not the other protocols?) My understanding is that there are 2 things that make it different:

*   It’s an IETF standard, documented in eg [RFC 6071][1] (did you know the IETF is the group that makes RFCs? I didn’t until today!)

*   it’s implemented in the Linux kernel (so it makes sense that there was a netdev tutorial on it, since netdev is a Linux kernel networking conference :))

### How does IPsec work?

So let’s say your laptop is using IPsec to encrypt its packets and send them through another device. How does that work? There are 2 parts to IPsec: a userspace part, and a kernel part.

The userspace part of IPsec is responsible for key exchange, using a protocol called [IKE][6] (“internet key exchange”). Basically when you open a new VPN connection, you need to talk to the VPN server and negotiate a key to do encryption.

The kernel part of IPsec is responsible for the actual encryption of packets – once a key is generated using IKE, the userspace part of IPsec will tell the kernel which encryption key to use. Then the kernel will use that key to encrypt packets!

### Security Policy & Security Associations

The kernel part of IPSec has two databases: the security policy database(SPD) and the security association database (SAD).

The security policy database has IP ranges and rules for what to do to packets for that IP range (“do IPsec to it”, “drop the packet”, “let it through”). I find this a little confusing because I’m used to rules about what to do to packets in various IP ranges being in the route table (`sudo ip route list`), but apparently you can have IPsec rules too and they’re in a different place!

The security association database I think has the encryption keys to use for various IPs.

The way you inspect these databases is, extremely unintuitively, using a command called `ip xfrm`. What does xfrm mean? I don’t know!

```
# security policy database
$ sudo ip xfrm policy
$ sudo ip x p

# security association database
$ sudo ip xfrm state
$ sudo ip x s

```

### Why is IPsec implemented in the Linux kernel and TLS isn’t?

For both TLS and IPsec, you need to do a key exchange when opening the connection (using Diffie-Hellman or something). For some reason that might be obvious but that I don’t understand yet (??) people don’t want to do key exchange in the kernel.

The reason IPsec is easier to implement in the kernel is that with IPsec, you need to negotiate key exchanges much less frequently (once for every IP address you want to open a VPN connection with), and IPsec sessions are much longer lived. So it’s easy for userspace to do a key exchange, get the key, and hand it off to the kernel which will then use that key for every IP packet.

With TLS, there are a couple of problems:

a. you’re constantly doing new key exchanges every time you open a new TLS connection, and TLS connections are shorter-lived b. there isn’t a natural protocol boundary where you need to start doing encryption – with IPsec, you just encrypt every IP packet in a given IP range, but with TLS you need to look at your TCP stream, recognize whether the TCP packet is a data packet or not, and decide to encrypt it

There’s actually a patch [implementing TLS in the Linux kernel][7] which lets userspace do key exchange and then pass the kernel the keys, so this obviously isn’t impossible, but it’s a much newer thing and I think it’s more complicated with TLS than with IPsec.

### What software do you use to do IPsec?

The ones I know about are Libreswan and Strongswan. Today’s tutorial focused on Libreswan.

Somewhat confusingly, even though Libreswan and Strongswan are different software packages, they both install a binary called `ipsec` for managing IPsec connections, and the two `ipsec` binaries are not the same program (even though they do have the same role).

Strongswan and Libreswan do what’s described in the “how does IPsec work” section above – they do key exchange with IKE and tell the kernel about keys to configure it to do encryption.

### IPsec isn’t only for VPNs!

At the beginning of this post I said “IPsec is a VPN protocol”, which is true, but you don’t have to use IPsec to implement VPNs! There are actually two ways to use IPsec:

1.  “transport mode”, where the IP header is unchanged and only the contents of the IP packet are encrypted. This mode is a little more like using TLS – you talk to the server you’re communicating with directly (not through a VPN server or something), it’s just that the contents of the IP packet get encrypted

2.  “tunnel mode”, where the IP header and its contents are all encrypted and encapsulated into another UDP packet. This is the mode that’s used for VPNs – you take your packet that you’re sending to secret_site.com, encrypt it, send it to your VPN server, and the VPN server passes it on for you.

### opportunistic IPsec

An interesting application of “transport mode” IPsec I learned about today (where you open an IPsec connection directly with the host you’re communicating with instead of some other intermediary server) is this thing called “opportunistic IPsec”. There’s an opportunistic IPsec server here:[http://oe.libreswan.org/][8].

I think the idea is that if you set up Libreswan and unbound up on your computer, then when you connect to [http://oe.libreswan.org][9], what happens is:

1.  `unbound` makes a DNS query for the IPSECKEY record of oe.libreswan.org (`dig ipseckey oe.libreswan.org`) to get a public key to use for that domain. (this requires DNSSEC to be secure which when I learn about it will be a whole other blog post, but you can just run that DNS query with dig and it will work if you want to see the results)

2.  `unbound` gives the public key to libreswan, which uses it to do a key exchange with the IKE server running on oe.libreswan.org

3.  `libreswan` finishes the key exchange, gives the encryption key to the kernel, and tells the kernel to use that encryption key when talking to `oe.libreswan.org`

4.  Your connection is now encrypted! Even though it’s a HTTP connection! so interesting!

### IPsec and TLS learn from each other

One interesting tidbit from the tutorial today was that the IPsec and TLS protocols have actually learned from each other over time – like they said IPsec’s IKE protocol had perfect forward secrecy before TLS, and IPsec has also learned some things from TLS. It’s neat to hear about how different internet protocols are learning & changing over time!

### IPsec is interesting!

I’ve spent quite a lot of time learning about TLS, which is obviously a super important networking protocol (let’s encrypt the internet! :D). But IPsec is an important internet encryption protocol too, and it has a different role from TLS! Apparently some mobile phone protocols (like 5G/LTE) use IPsec to encrypt their network traffic!

I’m happy I know a little more about it now! As usual several things in this post are probably wrong, but hopefully not too wrong :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/07/11/netdev-day-1--ipsec/

作者：[ Julia Evans][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about
[1]:https://tools.ietf.org/html/rfc6071
[2]:https://jvns.ca/categories/netdev
[3]:https://www.netdevconf.org/0x12/
[4]:https://jvns.ca/categories/netdev/
[5]:https://nohats.ca/
[6]:https://en.wikipedia.org/wiki/Internet_Key_Exchange
[7]:https://blog.filippo.io/playing-with-kernel-tls-in-linux-4-13-and-go/
[8]:http://oe.libreswan.org/
[9]:http://oe.libreswan.org/
