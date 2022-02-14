[#]: subject: "The multiple meanings of "nameserver" and "DNS resolver""
[#]: via: "https://jvns.ca/blog/2022/02/14/some-dns-terminology/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The multiple meanings of "nameserver" and "DNS resolver"
======

I’m working on a zine about DNS right now, so I’ve been thinking about DNS terminology a lot more than a normal person. Here’s something slightly confusing I’ve noticed about DNS terminology!

Two of the most common DNS server terms (“nameserver” and “DNS resolver”) have different meanings depending on the situation.

Now this isn’t a problem if you already understand how DNS works – I can easily figure out what type of “nameserver” is being discussed based on context.

But it can be a problem if you’re trying to learn how DNS works and you don’t realize that those words might refer to different things depending on the context – it’s confusing! So I’m going to explain the different possible meanings and how to figure out which meaning is intended.

### the 2 meanings of “nameserver”

There are 2 types of nameservers, and which one the term “nameserver” means depends on the context.

**Meaning 1: “authoritative” nameservers**

When you update the DNS records for a domain, those records are stored on a server called an **authoritative nameserver**.

This is what “nameserver” means in the context of a **specific domain**. Here are a few examples:

  * “Connect a domain you already own to Wix by changing its _name servers_.”
  * “Almost all domains rely on multiple _nameservers_ to increase reliability: if one nameserver goes down or is unavailable, DNS queries can go to another one.”
  * “You can update the _nameserver_ records yourself by following the steps your domain registrar may provide in the help content at their website”



**Meaning 2. “recursive” nameservers, also known as “DNS resolvers”**

These servers cache DNS records. Your browser doesn’t make a request to an authoritative nameserver directly. Instead it makes a request to a DNS resolver (aka recursive nameserver) which figures out what the right authoritative nameserver to talk to is, gets the record, and caches the result.

This is what “nameserver” means in the context of **you browsing the internet**. (“your computer’s nameservers”). Here are a few examples:

  * “Changing _nameservers_ can be a pain on some devices and require multiple clicks through a user interface. On Windows 10, for example…”
  * “Are your DNS _nameservers_ impeding your Internet experience? NEW RELEASE adds nameservers 1.1.1.1, 1.0.0.1 and 9.9.9.9”
  * “Configure your network settings to use the IP addresses 8.8.8.8 and 8.8.4.4 as your DNS servers”



I prefer to use the term “DNS resolver” even though it has 2 meanings because it’s much more commonly used than “recursive nameserver”.

### meanings of “DNS resolver”

A DNS resolver can either be a library or a server. (I’m sorry, I know I said that a DNS resolver is a server earlier. But sometimes it’s a library.)

**Meaning 1a: “stub resolver” (library version)**

A “stub resolver” is something (it can be either a library or a DNS server) which doesn’t know how to resolve DNS names itself, it’s just in charge of forwarding DNS queries to the “real” DNS resolver. Let’s talk about stub resolvers that are libraries first.

For example, the `getaddrinfo` function from libc doesn’t know how to look up DNS records itself, it just knows to look in `/etc/resolv.conf` and forward the query to whatever DNS server(s) it finds there.

How you can tell if this is what’s meant: if it’s part of your computer’s operating system and/or if it’s a library, it’s a stub resolver.

Examples of this meaning of “DNS resolver”:

  * “The _resolver_ is a set of routines in the C library that provide access to the Internet Domain Name System (DNS)”
  * “These are the DNS servers used to resolve web addresses. You can list up to three, and the _resolver_ tries each of them, one by one, until it finds one that works.”
  * “If the command succeeds, you will receive the following message “Successfully flushed the _DNS Resolver_ Cache.“”



**Meaning 1b: “stub resolver” (server version)**

Stub resolvers aren’t always libraries though, like `systemd-resolved` and `dnsmasq` are stub resolvers but they’re servers. Your router might be running `dnsmasq`.

This is also known as a “DNS forwarder”.

How you can tell if this is what’s meant: if your router is running it or it’s part of your OS, it’s probably a stub resolver.

**Meaning 2: a recursive nameserver (a server)**

A “recursive nameserver” (like we talked about before) is a server that knows how to find the authoritative nameservers for a domain. This is the kind of DNS resolver I was talking about in this [A toy DNS resolver][1] post a couple of weeks ago (though mine wasn’t a server).

How to tell if this is what’s meant: if it’s `unbound`, `bind`, 8.8.8.8, 1.1.1.1, or run by your ISP, then it’s a recursive nameserver.

Examples of this meaning of “DNS resolver”:

  * “The DNS Resolver in pfSense® software utilizes unbound, which is a validating, recursive, caching _DNS resolver_…”
  * “We invite you to try Google Public DNS as your primary or secondary _DNS resolver_…”
  * “I work for a reasonably large mobile service provider and we are in the process of implementing our own _DNS resolver_…”



### the most popular DNS server words

I also did a quick unscientific survey of which terms to refer to DNS servers were the most common by counting Google results. Here’s what I found:

  * dns server: 8,000,000
  * nameserver: 4,200,000
  * dns resolver: 933,000
  * public DNS server: 204,000
  * root nameserver: 42,000
  * recursive resolver: 38,500
  * stub resolver: 26,100
  * authoritative nameserver: 17,000
  * dns resolution service: 9,450
  * TLD nameserver: 7,500
  * dns recursor: 5,300
  * recursive nameserver: 5,060



Basically what this tells me is that by a pretty big margin, the most popular words used when talking about DNS serves are “nameserver”, and “DNS resolver”.

The more specific terms like “recursive nameserver”, “authoritative nameserver”, and “stub resolver” are much less common.

### that’s all!

I hope this helps some folks understand what these words mean! The terminology is a bit messier than I’d like, but it seems better to me to explain it than to use less-ambiguous language that isn’t as commonly used in practice.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/02/14/some-dns-terminology/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/blog/2022/02/01/a-dns-resolver-in-80-lines-of-go/
