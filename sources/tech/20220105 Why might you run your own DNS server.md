[#]: subject: "Why might you run your own DNS server?"
[#]: via: "https://jvns.ca/blog/2022/01/05/why-might-you-run-your-own-dns-server-/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why might you run your own DNS server?
======

One of the things that makes DNS difficult to understand is that it’s **decentralized**. There are thousands (maybe hundreds of thousands? I don’t know!) of authoritative nameservers, and at least [10 million resolvers][1]. And they’re running lots of different software! All these different servers running software means that there’s a lot of inconsistency in how DNS works, which can cause all kinds of frustrating problems.

But instead of talking about the problems, I’m interested in figuring out – why is it a good thing that DNS is decentralized?

### why is it good that DNS is decentralized?

One reason is **scalability** – the decentralized design of DNS makes it easier to scale and more resilient to failures. I find it really amazing that DNS is still scaling well even though it’s almost 40 years old. This is very important but it’s not what this post is about.

Instead, I want to talk about how the fact that it’s decentralized means that you can have **control** of how your DNS works. You can add more servers to the giant complicated mess of DNS servers! Servers that you control!

Yesterday I [asked on Twitter][2] why you might want to run your own DNS servers, and I got a lot of great answers that I wanted to summarize here.

### you can run 2 types of DNS servers

There are 2 main types of DNS servers you can run:

  1. if you own a domain, you can run an **authoritative nameserver** for that domain
  2. if you have a computer (or a company with lots of computers), you can run a **resolver** that’s resolves DNS for those computers



### DNS isn’t a static database

I’ve seen the “phone book” metaphor for DNS a lot, where domain names are like names and IP addresses are like phone numbers.

This is an okay mental model to start with. But the “phone book” mental model might make you think that if you make a DNS query for `google.com`, you’ll always get the same result. And that’s not true at all!

Which record you get in reply to a DNS query can depend on:

  * where you are in the world (maybe you’ll get an IP address of a server that’s physically closer to you!)
  * if you’re on a corporate network (where you might be able to resolve internal domain names)
  * whether the domain name is considered “bad” by your DNS resolver (it might be blocked!)
  * the previous DNS query (maybe the DNS resolver is doing DNS-based load balancing to give you a different IP address every time)
  * whether you’re using an airport wifi captive portal (airport wifi will resolve DNS records differently before you log in, it’ll send you a special IP to redirect you)
  * literally anything



A lot of the reasons you might want to control your own server are related to the fact that DNS isn’t a static database – there are a lot of choices you might want to make about how DNS queries are handled (either for your domain or for your organization).

### reasons to run an authoritative nameserver

These reasons aren’t in any particular order.

For some of these you don’t necessarily have to run your own authoritative nameserver, you can just choose an authoritative nameserver service that has the features you want.

To be clear: there are lots of reasons **not** to run your own authoritative nameserver – I don’t run my own, and I’m not trying to convince you that you should. It takes time to maintain, your service might not be as reliable, etc.

**reason: security**

[this tweet phrased it well][3]:

> [There’s a] risk of an attacker gaining DNS change access through your vendor’s customer support people, who only want to be helpful. Or getting locked out from your DNS (perhaps because of the lack of that). In-house may be easier to audit and verify the contents.

**reason: you like running bind/nsd**

One reason several people mentioned was “I’m used to writing zone files and running `bind` or `nsd`, it’s easier for me to just do that”.

If you like the interface of bind/nsd but don’t want to operate your own server, a couple of people mentioned that you can also get the advantages of bind by running a “hidden primary” server which stores the records, but serve all of the actual DNS queries from a “secondary” server. Here are some pages I found about configuring secondary DNS from from [NS1][4] and [cloudflare][5] and [Dyn][6] as an example.

I don’t really know what the best authoritative DNS server to run is. I think I’ve only used nsd at work.

**reason: you can use new record types**

Some newer DNS record types aren’t supported by all DNS services, but if you run your own you can support any record types you want.

**reason: user interface**

You might not like the user interface (or API, or lack of API) of the DNS service you’re using. This is pretty related to the “you like running BIND” reason – maybe you like the zone file interface!

**reason: you can fix problems yourself**

There are some obvious pros and cons to being able to fix problems yourself when they arise (pro: you can fix the problem, con: you have to fix the problem).

**reason: do something weird and custom**

You can write a DNS server that does anything you want, it doesn’t have to just return a static set of records.

A few examples:

  * Replit has a blog post about [why they wrote their own authoritative DNS server to handle routing][7]
  * [nip.io][8] maps 10.0.0.1.nip.io to 10.0.0.1
  * I wrote a custom DNS server for [mess with dns][9]



**reason: to save money**

Authoritative nameservers seem to generally charge per million DNS queries. As an example, at a quick glance it looks like Route 53 charges about $0.50 per million queries and [NS1][10] charges about $8 per million queries.

I don’t have the best sense for how many queries a large website’s authoritative DNS server can expect to actually need to resolve (what kinds of sites get 1 billion DNS queries to their authoritative DNS server? Probably a lot, but I don’t have experience with that.). But a few people in the replies mentioned cost as a reason.

**reason: you can change your registrar**

If you use a separate authoritative nameserver for your domain instead of your registrar’s nameserver, then when you move to a different registrar all you hvae to do to get your DNS back up is to set your authoritative DNS server to the right value. You don’t need to migrate all your DNS records, which is a huge pain!

You don’t need to run your own nameserver to do this.

**reason: geo DNS**

You might want to return different IP addresses for your domain depending on where the client is, to give them a server that’s close to them.

This is a service lots of authoritative nameserver services offer, you don’t need to write your own to do this.

**reason: avoid denial of service attacks targeted at someone else**

Many authoritative DNS servers are shared. This means that if someone attacks the DNS server for `google.com` or something and you happen to be using the same authoritative DNS server, you could be affected even though the attack wasn’t aimed at you. For example, this [DDoS attack on Dyn][11] in 2016.

**reason: keep all of your configuration in one place**

One person mentioned that they like to keep all of their configuration (DNS records, let’s encrypt, nginx, etc) in the same place on one server.

**wild reason: use DNS as a VPN**

Apparently [iodine][12] is an authoritative DNS server that lets you tunnel your traffic over DNS, if you’re on a network that only allows you to contact the outside world as a VPN.

### reasons to run a resolver

**reason: privacy**

If someone can see all your DNS lookups, they have a complete list of all the domains you (or everyone from your organization) is visiting! You might prefer to keep that private.

**reason: block malicious sites**

If you run your own resolver, you can refuse to resolve DNS queries (by just not returning any results) for domains that you consider “bad”.

A few examples of resolvers that you can run yourself (or just use):

  * [Pi-Hole][13] blocks advertisers
  * [Quad9][14] blocks domains that do malware/phishing/spyware. Cloudflare seems to have a [similar service][15]
  * I imagine there’s also corporate security software that blocks DNS queries for domains that host malware
  * DNS isn’t a static database. It’s very dynamic, and answers often depend in real time on the IP address a query came from, current load on content servers etc. That’s hard to do in real time unless you delegate serving those records to the entity making those decisions.
  * DNS delegating control makes access control very simple. Everything under a zone cut is controlled by the person who controls the delegated server, so responsibility for a hostname is implicit in the DNS delegation.



**reason: get dynamic proxying in nginx**

Here’s a cool story from [this tweet][16]:

> I wrote a DNS server into an app and then set it as nginx’s resolver so that I could get dynamic backend proxying without needing nginx to run lua. Nginx sends DNS query to app, app queries redis and responds accordingly. It worked pretty great for what I was doing.

**reason: avoid malicious resolvers**

Some ISPs run DNS resolvers that do bad things like nonexistent domains to an IP they control that shows you ads or a weird search page that they control.

Using either a resolver you control or a different resolver that you trust can help you avoid that.

**reason: resolve internal domains**

You might have an internal network with domains (like `blah.corp.yourcompany.com`) that aren’t on the public internet. Running your own resolver for machines in the internal network makes it possible to access those domains.

You can do the same thing on a home network, either to access local-only services or to just get local addresses for services that are on the public internet.

**reason: avoid your DNS queries being MITM’d**

One person [said][17]:

> I run a resolver on my LAN router that uses DNS over HTTPS for its upstream, so IoT and other devices that don’t support DoH or DoT don’t spray plaintext DNS outside

### that’s all for now

It feels important to me to explore the “why” of DNS, because it’s such a complicated messy system and I think most people find it hard to get motivated to learn about complex topics if they don’t understand why all this complexity is useful.

Thanks to Marie and Kamal for discussing this post, and to everyone on Twitter who provided reasons

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/01/05/why-might-you-run-your-own-dns-server-/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://www.icann.org/en/blogs/details/ten-million-dns-resolvers-on-the-internet-22-3-2012-en
[2]: https://twitter.com/b0rk/status/1478490484406468614
[3]: https://twitter.com/thatcks/status/1478503078680838153
[4]: https://help.ns1.com/hc/en-us/articles/360017508173-Configuring-NS1-as-a-secondary-provider-a-k-a-Creating-secondary-zones-
[5]: https://blog.cloudflare.com/secondary-dns-a-faster-more-resilient-way-to-serve-your-dns-records/
[6]: https://help.dyn.com/standard-dns/dyn-secondary-dns-information/
[7]: https://blog.replit.com/dns
[8]: https://nip.io
[9]: https://jvns.ca/blog/2021/12/15/mess-with-dns/
[10]: https://ns1.com/plans
[11]: https://en.wikipedia.org/wiki/DDoS_attack_on_Dyn
[12]: https://github.com/yarrick/iodine
[13]: https://pi-hole.net/
[14]: https://www.quad9.net/
[15]: https://developers.cloudflare.com/1.1.1.1/1.1.1.1-for-families
[16]: https://twitter.com/jordanorelli/status/1478795241876504577
[17]: https://twitter.com/passcod/status/1478806468539269120
