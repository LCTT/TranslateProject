[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What happens when you update your DNS?)
[#]: via: (https://jvns.ca/blog/how-updating-dns-works/)
[#]: author: (Julia Evans https://jvns.ca/)

What happens when you update your DNS?
======

I’ve seen a lot of people get confused about updating their site’s DNS records to change the IP address. Why is it slow? Do you really have to wait 2 days for everything to update? Why do some people see the new IP and some people see the old IP? What’s happening?

So I wanted to write a quick exploration of what’s happening behind the scenes when you update a DNS record.

### how DNS works: recursive vs authoritative DNS servers

First, we need to explain a little bit about DNS. There are 2 kinds of DNS servers: **authoritative** and **recursive**.

**authoritative** DNS servers (also known as **nameservers**) have a database of IP addresses for each domain they’re responsible for. For example, right now an authoritative DNS server for github.com is ns-421.awsdns-52.com. You can ask it for github.com’s IP like this;

```
dig @ns-421.awsdns-52.com github.com
```

**recursive** DNS servers, by themselves, don’t know anything about who owns what IP address. They figure out the IP address for a domain by asking the right authoritative DNS servers, and then cache that IP address in case they’re asked again. 8.8.8.8 is a recursive DNS server.

When people visit your website, they’re probably making their DNS queries to a recursive DNS server. So, how do recursive DNS servers work? Let’s see!

### how does a recursive DNS server query for github.com?

Let’s go through an example of what a recursive DNS server (like 8.8.8.8) does when you ask it for an IP address (A record) for github.com. First – if it already has something cached, it’ll give you what it has cached. But what if all of its caches are expired? Here’s what happens:

**step 1**: it has IP addresses for the root DNS servers hardcoded in its source code. You can see this in [unbound’s source code here][1]. Let’s say it picks `198.41.0.4` to start with. Here’s the [official source][2] for those hardcoded IP addresses, also known as a “root hints file”.

**step 2**: Ask the root nameservers about `github.com`.

We can roughly reproduce what happens with `dig`. What this gives us is a new authoritative nameserver to ask: a nameserver for `.com`, with the IP `192.5.6.30`.

```
$ dig @198.41.0.4 github.com
...
com.            172800  IN  NS  a.gtld-servers.net.
...
a.gtld-servers.net. 172800  IN  A   192.5.6.30
...
```

The details of the DNS response are a little more complicated than that – in this case, there’s an authority section with some NS records and an additional section with A records so you don’t need to do an extra lookup to get the IP addresses of those nameservers.

(in practice, 99.99% of the time it’ll already have the address of the `.com` nameservers cached, but we’re pretending we’re really starting from scratch)

**step 3**: Ask the `.com` nameservers about `github.com`.

```
$ dig @192.5.6.30 github.com
...
github.com.     172800  IN  NS  ns-421.awsdns-52.com.
ns-421.awsdns-52.com.   172800  IN  A   205.251.193.165
...
```

We have a new IP address to ask! This one is the nameserver for `github.com`.

**step 4**: Ask the `github.com` nameservers about `github.com`.

We’re almost done!

```
$ dig @205.251.193.165 github.com

github.com.     60  IN  A   140.82.112.4
```

Hooray!! We have an `A` record for `github.com`! Now the recursive nameserver has `github.com`’s IP address and can return it back to you. And it could do all of this by only hardcoding a few IP addresses: the addresses of the root nameservers.

### how to see all of a recursive DNS server’s steps: `dig +trace`

When I want to see what a recursive DNS server would do when resolving a domain, I run

```
$ dig @8.8.8.8 +trace github.com
```

This shows all the DNS records that it requests, starting at the root DNS servers – all the 4 steps that we just went through.

### let’s update some DNS records!

Now that we know the basics of how DNS works, let’s update some DNS records and see what happens.

When you update your DNS records, there are two main options:

  1. keep the same nameservers
  2. change nameservers



### let’s talk about TTLs

We’ve forgotten something important though! TTLs! You know how we said earlier that the recursive DNS server will cache records until they expire? The way it decides whether the record should expire is by looking at its **TTL** or “time to live”.

In this example, the TTL for the A record github’s nameserver returns for its DNS record is `60`, which means 60 seconds:

```
$ dig @205.251.193.165 github.com

github.com.     60  IN  A   140.82.112.4
```

That’s a pretty short TTL, and _in theory_ if everybody’s DNS implementation followed the [DNS standard][3] it means that if Github decided to change the IP address for `github.com`, everyone should get the new IP address within 60 seconds. Let’s see how that plays out in practice

### option 1: update a DNS record on the same nameservers

First, I updated my nameservers (Cloudflare) to have a new DNS record: an A record that maps `test.jvns.ca` to `1.2.3.4`.

```
$ dig @8.8.8.8 test.jvns.ca
test.jvns.ca.       299 IN  A   1.2.3.4
```

This worked immediately! There was no need to wait at all, because there was no `test.jvns.ca` DNS record before that could have been cached. Great. But it looks like the new record is cached for ~5 minutes (299 seconds).

So, what if we try to change that IP? I changed it to `5.6.7.8`, and then ran the same DNS query.

```
$ dig @8.8.8.8 test.jvns.ca
test.jvns.ca.       144 IN  A   1.2.3.4
```

Hmm, it seems like that DNS server has the `1.2.3.4` record still cached for another 144 seconds. Interestingly, if I query `8.8.8.8` multiple times I actually get inconsistent results – sometimes it’ll give me the new IP and sometimes the old IP, I guess because 8.8.8.8 actually load balances to a bunch of different backends which each have their own cache.

After I waited 5 minutes, all of the `8.8.8.8` caches had updated and were always returning the new `5.6.7.8` record. Awesome. That was pretty fast!

### you can’t always rely on the TTL

As with most internet protocols, not everything obeys the DNS specification. Some ISP DNS servers will cache records for longer than the TTL specifies, like maybe for 2 days instead of 5 minutes. And people can always hardcode the old IP address in their /etc/hosts.

What I’d expect to happen in practice when updating a DNS record with a 5 minute TTL is that a large percentage of clients will move over to the new IPs quickly (like within 15 minutes), and then there will be a bunch of stragglers that slowly update over the next few days.

### option 2: updating your nameservers

So we’ve seen that when you update an IP address without changing your nameservers, a lot of DNS servers will pick up the new IP pretty quickly. Great. But what happens if you change your nameservers? Let’s try it!

I didn’t want to update the nameservers for my blog, so instead I went with a different domain I own and use in the examples for the [HTTP zine][4]: `examplecat.com`.

Previously, my nameservers were set to dns1.p01.nsone.net. I decided to switch them over to Google’s nameservers – `ns-cloud-b1.googledomains.com` etc.

When I made the change, my domain registrar somewhat ominiously popped up the message – “Changes to examplecat.com saved. They’ll take effect within the next 48 hours”. Then I set up a new A record for the domain, to make it point to `1.2.3.4`

Okay, let’s see if that did anything

```
$ dig @8.8.8.8 examplecat.com
examplecat.com.     17  IN  A   104.248.50.87
```

No change. If I ask a different DNS server, it knows the new IP:

```
$ dig @1.1.1.1 examplecat.com
examplecat.com.     299 IN  A   1.2.3.4
```

but 8.8.8.8 is still clueless. The reason 1.1.1.1 sees the new IP even though I just changed it 5 minutes ago is presumably that nobody had ever queried 1.1.1.1 about examplecat.com before, so it had nothing in its cache.

### nameserver TTLs are much longer

The reason that my registrar was saying “THIS WILL TAKE 48 HOURS” is that the TTLs on NS records (which are how recursive nameservers know which nameserver to ask) are MUCH longer!

The new nameserver is definitely returning the new IP address for `examplecat.com`

```
$ dig @ns-cloud-b1.googledomains.com examplecat.com
examplecat.com.     300 IN  A   1.2.3.4
```

But remember what happened when we queried for the `github.com` nameservers, way back?

```
$ dig @192.5.6.30 github.com
...
github.com.     172800  IN  NS  ns-421.awsdns-52.com.
ns-421.awsdns-52.com.   172800  IN  A   205.251.193.165
...
```

172800 seconds is 48 hours! So nameserver updates will in general take a lot longer to expire from caches and propagate than just updating an IP address without changing your nameserver.

### how do your nameservers get updated?

When I update the nameservers for `examplecat.com`, what happens is that he `.com` nameserver gets a new `NS` record with the new domain. Like this:

```
dig ns @j.gtld-servers.net examplecat.com

examplecat.com.     172800  IN  NS  ns-cloud-b1.googledomains.com
```

But how does that new NS record get there? What happens is that I tell my **domain registrar** what I want the new nameservers to be by updating it on the website, and then my domain registrar tells the `.com` nameservers to make the update.

For `.com`, these updates happen pretty fast (within a few minutes), but I think for some other TLDs the TLD nameservers might not apply updates as quickly.

### your program’s DNS resolver library might also cache DNS records

One more reason TTLs might not be respected in practice: many programs need to resolve DNS names, and some programs will also cache DNS records indefinitely in memory (until the program is restarted).

For example, AWS has an article on [Setting the JVM TTL for DNS Name Lookups][5]. I haven’t written that much JVM code that does DNS lookups myself, but from a little Googling about the JVM and DNS it seems like you can configure the JVM so that it caches every DNS lookup indefinitely. (like [this elasticsearch issue][6])

### that’s all!

I hope this helps you understand what’s going on when updating your DNS!

As a disclaimer, again – TTLs definitely don’t tell the whole story about DNS propagation – some recursive DNS servers definitely don’t respect TTLs, even if the major ones like 8.8.8.8 do. So even if you’re just updating an A record with a short TTL, it’s very possible that in practice you’ll still get some requests to the old IP for a day or two.

Also, I changed the nameservers for `examplecat.com` back to their old values after publishing this post.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/how-updating-dns-works/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/NLnetLabs/unbound/blob/6e0756e819779d9cc2a14741b501cadffe446c93/iterator/iter_hints.c#L131
[2]: https://www.iana.org/domains/root/files
[3]: https://tools.ietf.org/html/rfc1035
[4]: https://wizardzines.com/zines/http/
[5]: https://docs.aws.amazon.com/sdk-for-java/v1/developer-guide/java-dg-jvm-ttl.html
[6]: https://github.com/elastic/elasticsearch/issues/16412
