[#]: subject: "How to send raw network packets in Python with tun/tap"
[#]: via: "https://jvns.ca/blog/2022/09/06/send-network-packets-python-tun-tap/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "HankChow"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to send raw network packets in Python with tun/tap
======

Hello!

Recently I’ve been working on a project where I implement a bunch of tiny toy working versions of computer networking protocols in Python without using any libraries, as a way to explain how computer networking works.

I’m still working on writing up that project, but today I wanted to talk about how to do the very first step: sending network packets in Python.

In this post we’re going to send a SYN packet (the first packet in a TCP connection) from a tiny Python program, and get a reply from `example.com`. All the code from this post is in [this gist][1].

### what’s a network packet?

A network packet is a byte string. For example, here’s the first packet in a TCP connection:

```

    b'E\x00\x00,\x00\x01\x00\x00@\x06\x00\xc4\xc0\x00\x02\x02"\xc2\x95Cx\x0c\x00P\xf4p\x98\x8b\x00\x00\x00\x00`\x02\xff\xff\x18\xc6\x00\x00\x02\x04\x05\xb4'

```

I’m not going to talk about the structure of this byte string in this post (though I’ll say that this particular byte string has two parts: the first 20 bytes are the IP address part and the rest is the TCP part)

The point is that to send network packets, we need to be able to send and receive strings of bytes.

### why tun/tap?

The problem with writing your own TCP implementation on Linux (or any operating system) is – the Linux kernel already has a TCP implementation!

So if you send out a SYN packet on your normal network interface to a host like example.com, here’s what will happen:

  1. you send a SYN packet to example.com
  2. example.com replies with a SYN ACK (so far so good!)
  3. the Linux kernel on your machine gets the SYN ACK, thinks “wtf?? I didn’t make this connection??”, and closes the connection
  4. you’re sad. no TCP connection for you.



I was talking to a friend about this problem a few years ago and he said “you should use tun/tap!“. It took quite a few hours to figure out how to do that though, which is why I’m writing this blog post :)

### tun/tap gives you a “virtual network device”

The way I like to think of `tun/tap` is – imagine I have a tiny computer in my network which is sending and receiving network packets. But instead of it being a real computer, it’s just a Python program I wrote.

That explanation is honestly worse than I would like. I wish I understood exactly how tun/tap devices interfaced with the real Linux network stack but unfortunately I do not, so “virtual network device” is what you’re getting. Hopefully the code examples below will make all it a bit more clear.

### tun vs tap

The system called “tun/tap” lets you create two kinds of network interfaces:

  * “tun”, which lets you set IP-layer packets
  * “tap”, which lets you set Ethernet-layer packets



We’re going to be using **tun**, because that’s what I could figure out how to get to work. It’s possible that tap would work too.

### how to create a tun interface

Here’s how I created a tun interface with IP address 192.0.2.2.

```

    sudo ip tuntap add name tun0 mode tun user $USER
    sudo ip link set tun0 up
    sudo ip addr add 192.0.2.1 peer 192.0.2.2 dev tun0

    sudo iptables -t nat -A POSTROUTING -s 192.0.2.2 -j MASQUERADE
    sudo iptables -A FORWARD -i tun0 -s 192.0.2.2 -j ACCEPT
    sudo iptables -A FORWARD -o tun0 -d 192.0.2.2 -j ACCEPT

```

These commands do two things:

  1. Create the `tun` device with the IP `192.0.2.2` (and give your user access to write to it)
  2. set up `iptables` to proxy packets from that tun device to the internet using NAT



The iptables part is very important because otherwise the packets would only exist inside my computer and wouldn’t be sent to the internet, and what fun would that be?

I’m not going to explain this `ip addr add` command because I don’t understand it, I find `ip` to be very inscrutable and for now I’m resigned to just copying and pasting `ip` commands without fully understanding them. It does work though.

### how to connect to the tun interface in Python

Here’s a function to open a tun interface, you call it like `openTun('tun0')`. I figured out how to write it by searching through the [scapy][2] source code for “tun”.

```

    import struct
    from fcntl import ioctl

    def openTun(tunName):
        tun = open("/dev/net/tun", "r+b", buffering=0)
        LINUX_IFF_TUN = 0x0001
        LINUX_IFF_NO_PI = 0x1000
        LINUX_TUNSETIFF = 0x400454CA
        flags = LINUX_IFF_TUN | LINUX_IFF_NO_PI
        ifs = struct.pack("16sH22s", tunName, flags, b"")
        ioctl(tun, LINUX_TUNSETIFF, ifs)
        return tun

```

All this is doing is

  1. opening `/dev/net/tun` in binary mode
  2. calling an `ioctl` to tell Linux that we want a `tun` device, and that the one we want is called `tun0` (or whatever `tunName` we’ve passed to the function).



Once it’s open, we can `read` from and `write` to it like any other file in Python.

### let’s send a SYN packet!

Now that we have the `openTun` function, we can send a SYN packet!

Here’s what the Python code looks like, using the `openTun` function.

```

    syn = b'E\x00\x00,\x00\x01\x00\x00@\x06\x00\xc4\xc0\x00\x02\x02"\xc2\x95Cx\x0c\x00P\xf4p\x98\x8b\x00\x00\x00\x00`\x02\xff\xff\x18\xc6\x00\x00\x02\x04\x05\xb4'
    tun = openTun(b"tun0")
    tun.write(syn)
    reply = tun.read(1024)
    print(repr(reply))

```

If I run this as `sudo python3 syn.py`, it prints out the reply from `example.com`:

```

    b'E\x00\x00,\x00\x00@\x00&\x06\xda\xc4"\xc2\x95C\xc0\x00\x02\x02\x00Px\x0cyvL\x84\xf4p\x98\x8c`\x12\xfb\xe0W\xb5\x00\x00\x02\x04\x04\xd8'

```

Obviously this is a pretty silly way to send a SYN packet – a real implementation would have actual code to generate that byte string instead of hardcoding it, and we would parse the reply instead of just printing out the raw byte string. But I didn’t want to go into the structure of TCP in this post so that’s what we’re doing.

### looking at these packets with tcpdump

If we run tcpdump on the `tun0` interface, we can see the packet we sent and the answer from `example.com`:

```

    $ sudo tcpdump -ni tun0
    12:51:01.905933 IP 192.0.2.2.30732 > 34.194.149.67.80: Flags [S], seq 4101019787, win 65535, options [mss 1460], length 0
    12:51:01.932178 IP 34.194.149.67.80 > 192.0.2.2.30732: Flags [S.], seq 3300937416, ack 4101019788, win 64480, options [mss 1240], length 0

```

`Flags [S]` is the SYN we sent, and `Flags [S.]` is the SYN ACK packet in response! We successfully communicated! And the Linux network stack didn’t interfere at all!

### tcpdump also shows us how NAT is working

We can also run `tcpdump` on my real network interface (`wlp3so`, my wireless card), to see the packets being sent and received. We’ll pass `-i wlp3s0` instead of `-i tun0`.

```

    $ sudo tcpdump -ni wlp3s0 host 34.194.149.67
    tcpdump: verbose output suppressed, use -v[v]... for full protocol decode
    listening on wlp3s0, link-type EN10MB (Ethernet), snapshot length 262144 bytes
    12:56:01.204382 IP 192.168.1.181.30732 > 34.194.149.67.80: Flags [S], seq 4101019787, win 65535, options [mss 1460], length 0
    12:56:01.228239 IP 34.194.149.67.80 > 192.168.1.181.30732: Flags [S.], seq 144769955, ack 4101019788, win 64480, options [mss 1240], length 0
    12:56:05.334427 IP 34.194.149.67.80 > 192.168.1.181.30732: Flags [S.], seq 144769955, ack 4101019788, win 64480, options [mss 1240], length 0
    12:56:13.524973 IP 34.194.149.67.80 > 192.168.1.181.30732: Flags [S.], seq 144769955, ack 4101019788, win 64480, options [mss 1240], length 0
    12:56:29.705007 IP 34.194.149.67.80 > 192.168.1.181.30732: Flags [S.], seq 144769955, ack 4101019788, win 64480, options [mss 1240], length 0

```

A couple of things to notice here:

  * The IP addresses are different – that IPtables rule from above has rewritten them from `192.0.2.2` to `192.168.1.181`. This rewriting is called “network address translation”, or “NAT”.
  * We’re getting a bunch of replies from `example.com` – it’s doing an exponential backoff where it retries after 4 seconds, then 8 seconds, then 16 seconds. This is because we didn’t finish the TCP handshake – we just sent a SYN and left it hanging! There’s actually a type of DDOS attack like this called SYN flooding, but just sending one or two SYN packets isn’t a big deal.
  * I had to add `host 34.194.149.67` because there are a lot of TCP packets being sent on my real wifi connection so I needed to ignore those



I’m not totally sure why we see more SYN replies on `wlp3s0` than on `tun0`, my guess is that it’s because we only read 1 reply in our Python program.

### this is pretty easy and really reliable

The last time I tried to implement TCP in Python I did it with something called “ARP spoofing”. I won’t talk about that here (there are some posts about it on this blog back in 2013), but this way is a lot more reliable.

And ARP spoofing is kind of a sketchy thing to do on a network you don’t own.

### here’s the code

I put all the code from this blog post in [this gist][1], if you want to try it yourself, you can run

```

    bash setup.sh # needs to run as root, has lots of `sudo` commands
    python3 syn.py # runs as a regular user

```

It only works on Linux, but I think there’s a way to set up tun/tap on Mac too.

### a plug for scapy

I’ll close with a plug for [scapy][2] here: it’s a really great Python networking library for doing this kind of experimentation without writing all the code yourself.

This post is about writing all the code yourself though so I won’t say more about it than that.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/09/06/send-network-packets-python-tun-tap/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://gist.github.com/jvns/552e6d5e6fec6c3ddf2fcd4ccdab45d5
[2]: https://scapy.net/
