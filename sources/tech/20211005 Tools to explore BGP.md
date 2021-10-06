[#]: subject: "Tools to explore BGP"
[#]: via: "https://jvns.ca/blog/2021/10/05/tools-to-look-at-bgp-routes/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Tools to explore BGP
======

Yesterday there was a big Facebook outage caused by BGP. I’ve been vaguely interested in learning more about BGP for a long time, so I was reading a couple of articles.

I got frustrated because none of the articles showed me how I could actually look up information related to BGP on my computer, so I [wrote a tweet asking for tools][1].

I got a bunch of useful replies as always, so this blog post shows some tools you can use to look up BGP information. There might be an above average number of things wrong in this post because I don’t understand BGP that well.

### I can’t publish BGP routes

One of the reasons I’ve never learned much about BGP is – as far as I know, I don’t have access to publish BGP routes on the internet.

With most networking protocols, you can pretty trivially get access to implement the protocol yourself if you want. For example you can:

  * issue your own TLS certificates
  * write your own HTTP server
  * write your own TCP implementation
  * write your own authoritative DNS server for your domain (I’m trying to do that right now for a small project)
  * set up your own certificate authority



But with BGP, I think that unless you own your own ASN, you can’t publish routes yourself! (you _could_ implement BGP on your home network, but that feels a bit boring to me, when I experiment with things I like them to actually be on the real internet).

Anyway, even though I can’t experiment with it, I still think it’s super interesting because I love networking, so I’m going to show you some tools I found to learn about BGP :)

First let’s talk through some BGP terminology though. I’m going to go pretty fast because I’m more interested in the tools and there are a lot of high level explanations of BGP out there (like this [cloudflare post][2]).

### What’s an AS (“autonomous system”)

The first thing we need to understand is an AS. Every AS:

  1. is owned by an organization (usually a large organization like your ISP, a government, a university, Facebook, etc)
  2. controls a specific set of IP addresses (for example my ISP’s AS includes 247,808 IP addresses)
  3. has a number (like 1403)



Here are some observations I made about ASes just by doing some experimentation:

  * Some fairly big tech companies don’t have their own AS. For example, I looked up Patreon on BGPView, and as far as I can tell they don’t own as AS – their main site (patreon.com, [104.16.6.49][3]) is in Cloudflare’s AS.
  * An AS can include IPs in many countries. Facebook’s AS ([AS32934][4]) definitely has IP addresses in Singapore, Canada, Nigeria, Kenya, the US, and more countries.
  * It seems like IP address can be in more than one AS. For example, if I look up [209.216.230.240][5], it has 2 ASNs associated with it – AS6130 and AS21581. Apparently when this happens the more specific route takes priority – so packets to that IP would get routed to AS21581.



### what’s a BGP route?

There are a lot of routers on the internet. For example, my ISP has routers.

When I send my ISP a packet (for example by running `ping 129.134.30.0`), my ISP’s routers needs to figure out how to actually get my packet to the IP address `129.134.30.0`.

The way the router figures this out is that it has a **route table** – it has a list of a bunch of IP ranges (like `129.134.30.0/23`), and routes it knows about to get to that subnet.

Here’s an example of a real route for `129.134.30.0/23`: (one of Facebook’s subnets). This one isn’t from my ISP.

```
11670 32934
  206.108.35.2 from 206.108.35.254 (206.108.35.254)
    Origin IGP, metric 0, valid, external
    Community: 3856:55000
    Last update: Mon Oct  4 21:17:33 2021
```

I think that this is saying that one path to `129.134.30.0` is through the machine `206.108.35.2`, which is on its local network. So the router might send my ping packet to `206.108.35.2` next, and then `206.108.35.2` will know how to get it to Facebook. The two numbers at the beginning (`11670 32934`) are ASNs.

### what’s BGP?

My understanding of BGP is very shaky, but it’s a protocol that companies use to advertise BGP routes.

What happened yesterday with Facebook is that they basically made BGP announcements withdrawing all their BGP routes, so every router in the world deleted all of its routes related to Facebook, so no traffic could get there.

Okay, now that we’ve covered some basic terminology, let’s talk about tools you can use to look at autonomous systems and BGP!

### tool 1: look at your ISP’s AS with BGPView

To make this AS thing less abstract, let’s use a tool called [BGPView][6] to look at a real AS.

My ISP (EBOX) owns [AS 1403][7]. Here are the [IP addresses my ISP owns][8]. If I look up my computer’s public IPv4 address, I can check that it’s one of the IP addresses my ISP owns – it’s in the `104.163.128.0/17` block.

BGPView also has this graph of how my ISP is connected to other ASes

![][9]

### tool 2: `traceroute -A` and `mtr -z`

Okay, so we’re interested in autonomous systems. Let’s see which ASes I go through from

`traceroute` and `mtr` both have options to tell you the ASN for every IP you go through. The flags are `traceroute -A` and `mtr -z`, respectively.

Let’s see which autonomous systems I go through on my way to facebook.com with `mtr`!

```
$ mtr -z facebook.com
 1. AS???    LEDE.lan
 2. AS1403   104-163-190-1.qc.cable.ebox.net
 3. AS???    10.170.192.58
 4. AS1403   0.et-5-2-0.er1.mtl7.yul.ebox.ca
 5. AS1403   0.ae17.er2.mtl3.yul.ebox.ca
 6. AS1403   0.ae0.er1.151fw.yyz.ebox.ca
 7. AS???    facebook-a.ip4.torontointernetxchange.net
 8. AS32934  po103.psw01.yyz1.tfbnw.net
 9. AS32934  157.240.38.75
10. AS32934  edge-star-mini-shv-01-yyz1.facebook.com
```

This is interesting – it looks like we go directly from my ISP’s AS (1403) to Facebook’s AS (32934), with an “internet exchange” in between.

I’m not sure what an [internet exchange][10] is but I know that it’s an extremely important part of the internet. That’s going to be for another day though. My best guess is that it’s the part of the internet that enables “peering” – like an IX is a server room with a gigantic switch with infinite bandwith in it where a bunch of different companies put their computers so they can send each other packets.

### mtr looks up ASNs with DNS

I got curious about how mtr looks up ASNs, so I used strace. I saw that it looked like it was using DNS, so I ran [dnspeep][11], and voila!

```
$ sudo dnspeep
...
TXT   1.190.163.104.origin.asn.cymru.com 192.168.1.1          TXT: 1403 | 104.163.176.0/20 | CA | arin | 2014-08-14, TXT: 1403 | 104.163.160.0/19 | CA | arin | 2014-08-14, TXT: 1403 | 104.163.128.0/17 | CA | arin | 2014-08-14
...
```

So it looks like we can find the ASN for `104.163.190.1` by looking up the `txt` record on `1.190.163.104.origin.asn.cymru.com`, like this:

```
$ dig txt 1.190.163.104.origin.asn.cymru.com
1.190.163.104.origin.asn.cymru.com. 13911 IN TXT "1403 | 104.163.160.0/19 | CA | arin | 2014-08-14"
1.190.163.104.origin.asn.cymru.com. 13911 IN TXT "1403 | 104.163.128.0/17 | CA | arin | 2014-08-14"
1.190.163.104.origin.asn.cymru.com. 13911 IN TXT "1403 | 104.163.176.0/20 | CA | arin | 2014-08-14"
```

That’s cool! Let’s keep moving though.

### tool 3: the packet clearing house looking glass

PCH (“packet clearing house”) is the organization that runs a lot of internet exchange points. A “looking glass” seems to be a generic term for a web form that lets you run network commands from another person’s computer. There are looking glasses that don’t support BGP, but I’m just interested in ones that show you information about BGP routes.

Here’s the PCH looking glass: <https://www.pch.net/tools/looking_glass/>.

In the web form on that site, I picked the Toronto IX (“TORIX”), since that’s what `mtr` said I was using to go to facebook.com.

**thing 1: “show ip bgp summary”**

Here’s the output. I’ve redacted some of it:

```
IPv4 Unicast Summary:
BGP router identifier 74.80.118.4, local AS number 3856 vrf-id 0
BGP table version 33061919
RIB entries 513241, using 90 MiB of memory
Peers 147, using 3003 KiB of memory
Peer groups 8, using 512 bytes of memory

Neighbor        V         AS MsgRcvd MsgSent   TblVer  InQ OutQ  Up/Down State/PfxRcd
...
206.108.34.248  4       1403  484672  466938        0    0    0 05w3d03h           50
...
206.108.35.2    4      32934  482088  466714        0    0    0 01w6d07h           38
206.108.35.3    4      32934  482019  466475        0    0    0 01w0d06h           38
...

Total number of neighbors 147
```

My understanding of what this is saying is that the Toronto Internet Exchange (“TORIX”) is directly connected to both my ISP (EBOX, AS 1403) and Facebook (AS 32934).

**thing 2: “show ip bgp 129.134.30.0”**

Here’s the output of picking “show ip bgp” for `129.134.30.0` (one of Facebook’s IP addresses):

```
BGP routing table entry for 129.134.30.0/23
Paths: (4 available, best #4, table default)
  Advertised to non peer-group peers:
  206.220.231.55
  11670 32934
    206.108.35.2 from 206.108.35.254 (206.108.35.254)
      Origin IGP, metric 0, valid, external
      Community: 3856:55000
      Last update: Mon Oct  4 21:17:33 2021

  11670 32934
    206.108.35.2 from 206.108.35.253 (206.108.35.253)
      Origin IGP, metric 0, valid, external
      Community: 3856:55000
      Last update: Mon Oct  4 21:17:31 2021

  32934
    206.108.35.3 from 206.108.35.3 (157.240.58.225)
      Origin IGP, metric 0, valid, external, multipath
      Community: 3856:55000
      Last update: Mon Oct  4 21:17:27 2021

  32934
    206.108.35.2 from 206.108.35.2 (157.240.58.182)
      Origin IGP, metric 0, valid, external, multipath, best (Older Path)
      Community: 3856:55000
      Last update: Mon Oct  4 21:17:27 2021
```

This seems to be saying that there are 4 routes to Facebook from that internet exchange.

**the quebec internet exchange doesn’t seem to know anything about Facebook**

I also tried the same thing from the Quebec internet exchange QIX (which is presumably closer to me, since I live in Montreal and not Toronto). But the QIX doesn’t seem to know anything about Facebook – when I put in `129.134.30.0` it just says “% Network not in table”.

So I guess that’s why I was sent through the Toronto IX and not the Quebec one.

### more BGP looking glasses

Here are some more websites with looking glasses that will give you similar information from other points of view. They all seem to support the same `show ip bgp` syntax, maybe because they’re running the same software? I’m not sure.

  * <http://www.routeviews.org/routeviews/index.php/collectors/>
  * <http://www.routeservers.org/>
  * <https://lg.he.net/>



There seem to be a LOT of these looking glass services out there, way more than just those 3 lists.

Here’s an example session with one of the servers on this list: route-views.routeviews.org. This time I connected via telnet and not through a web form, but the output looks like it’s in the same format.

```
$ telnet route-views.routeviews.org

route-views>show ip bgp 31.13.80.36

BGP routing table entry for 31.13.80.0/24, version 1053404087
Paths: (23 available, best #2, table default)
  Not advertised to any peer
  Refresh Epoch 1
  3267 1299 32934
    194.85.40.15 from 194.85.40.15 (185.141.126.1)
      Origin IGP, metric 0, localpref 100, valid, external
      path 7FE0C3340190 RPKI State valid
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  6939 32934
    64.71.137.241 from 64.71.137.241 (216.218.252.164)
      Origin IGP, localpref 100, valid, external, best
      path 7FE135DB6500 RPKI State valid
      rx pathid: 0, tx pathid: 0x0
  Refresh Epoch 1
  701 174 32934
    137.39.3.55 from 137.39.3.55 (137.39.3.55)
      Origin IGP, localpref 100, valid, external
      path 7FE1604D3AF0 RPKI State valid
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  20912 3257 1299 32934
    212.66.96.126 from 212.66.96.126 (212.66.96.126)
      Origin IGP, localpref 100, valid, external
      Community: 3257:8095 3257:30622 3257:50001 3257:53900 3257:53904 20912:65004
      path 7FE1195AF140 RPKI State valid
      rx pathid: 0, tx pathid: 0
  Refresh Epoch 1
  7660 2516 1299 32934
    203.181.248.168 from 203.181.248.168 (203.181.248.168)
      Origin IGP, localpref 100, valid, external
      Community: 2516:1030 7660:9001
      path 7FE0D195E7D0 RPKI State valid
      rx pathid: 0, tx pathid: 0
```

Here there are a few options for routes:

  * `3267 1299 32934`
  * `6939 32934`
  * `701 174 32934`
  * `20912 3257 1299 32934`
  * `7660 2516 1299 32934`



I think the reason there’s more than one AS in all of these is that `31.13.80.36` is a Facebook IP address in Toronto, so this server (which is maybe on the US west coast, I’m not sure) is not able to connect to it directly, it needs to go to another AS first. So all of the routes have one or more ASNs

The shortest one is 6939 (“Hurricane Electric”), which is a “global internet backbone”. They also have their own [hurricane electric looking glass][12] page.

### tool 4: BGPlay

All the other tools so far have just shown us the current state of Facebook routing where everything is fine, but this 4th tool lets us see the history of this Facebook BGP internet disaster! It’s a GUI tool so I’m going to include a bunch of screenshots.

The tool is at <https://stat.ripe.net/special/bgplay>. I typed in the IP address 129.134.30.12 (one of Facebook’s IPs), if you want to play along.

First, let’s look at the state of things before everything went wrong. I clicked in the timeline at 13:11:28 on Oct. 4, and got this:

![][13]

I originally found this very overwhelming. What’s happening? But then someone on Twitter pointed out that the next place to look is to click on the timeline right _after_ the Facebook disaster happened (at 18:38 on Oct. 4).

![][14]

It’s pretty clear that something is wrong in this picture – all the BGP routes are gone! oh no!

The text at the top shows the last Facebook BGP route disappearing:

```
Type: W > withdrawal Involving: 129.134.30.0/24
Short description: The route 50869, 25091, 32934 has been withdrawn.
Date and time: 2021-10-04 16:02:33 Collected by: 20-91.206.53.12
```

If I then click the “fast forward” button, we see the BGP routes start to come back:

![][15]

The first one announced is `137409 32934`. I don’t think this is _actually_ the first one announced though – there are a lot of route announcements inside the same second (at 2021-10-04 21:00:40), and I think the ordering inside BGPlay is arbitrary.

If I click the “fast forward” button again, more and more routes start to come back and routing starts to go back to normal

I found looking at this outage in BGPlay really fun, even though the interface is pretty confusing at first.

### maybe it is important to understand a little about BGP?

I started out this post by saying you can’t change BGP routes BGP, but then I remembered that in 2016 or 2017 there was a [Telia routing issue][16] that caused us some minor network at work. And when that happens, it is actually useful to understand why your customers can’t reach your site, even if it’s totally out of your control. I didn’t know about any of these tools at that time but I would have liked to!

I think for most companies all you can do to respond to outages caused by someone else’s bad BGP routes is “do nothing and wait for it to get fixed”, but it’s nice to be able to _confidently_ do nothing.

### some ways to publish BGP routes

If you want to (as a hobbyist) actually publish BGP routes, here are some links from the comments:

  * [a guide to getting your own ASN][17]
  * [dn42][18] seems to have a playground for BGP (it’s not on the public internet, but it does have other people on it which seems more fun than just doing BGP by yourself at home)



### that’s all for now

I think there are a lot more BGP tools (like PCH has a bunch of [daily snapshots of routing data][19] which look like fun), but this post is already pretty long and there are other things I need to do today.

I was surprised by how much information I could get about BGP just as a regular person, I always think of it as a “secret network wizard” thing but apparently there are all kind of public machines anybody can just telnet to and use to look at the route tables! Who knew!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/10/05/tools-to-look-at-bgp-routes/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://twitter.com/b0rk/status/1445199475195236356
[2]: https://blog.cloudflare.com/october-2021-facebook-outage/
[3]: https://bgpview.io/ip/104.16.6.49
[4]: https://bgpview.io/asn/32934#prefixes-v4
[5]: https://bgpview.io/ip/209.216.230.240
[6]: https://bgpview.io
[7]: https://bgpview.io/asn/1403
[8]: https://bgpview.io/asn/1403#prefixes-v4
[9]: https://jvns.ca/images/ebox-graph.png
[10]: https://en.wikipedia.org/wiki/Internet_exchange_point
[11]: https://github.com/jvns/dnspeep/
[12]: https://lg.he.net/
[13]: https://jvns.ca/images/bgplay-before.png
[14]: https://jvns.ca/images/bgplay-after.png
[15]: https://jvns.ca/images/bgplay-return.png
[16]: https://news.ycombinator.com/item?id=14246888
[17]: https://labs.ripe.net/author/samir_jafferali/build-your-own-anycast-network-in-nine-steps/
[18]: https://dn42.eu/Home
[19]: https://www.pch.net/resources/Routing_Data/IPv4_daily_snapshots/
