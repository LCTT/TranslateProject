[#]: subject: "How to find a domain's authoritative nameservers"
[#]: via: "https://jvns.ca/blog/2022/01/11/how-to-find-a-domain-s-authoritative-nameserver/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to find a domain's authoritative nameservers
======

Here’s a very quick “how to” post on how to find your domain’s authoritative nameserver.

I’m writing this because if you made a DNS update and it didn’t work, there are 2 options:

  1. Your authoritative nameserver doesn’t have the correct record
  2. Your authoritative nameserver **does** have the correct record, but an old record is cached and you need to wait for the cache to expire



To be able to tell which one is happening (do you need to make a change, or do you just need to wait?), you need to be able to find your domain’s authoritative nameserver and query it to see what records it has.

But when I looked up “how to find a domain’s authoritative nameserver” to see what advice was out there, I found a lot of different methods being mentioned, some of which can give you the wrong answer.

So let’s walk through a way to find your domain’s authoritative nameservers that’s guaranteed to always give you the correct answer. I’ll also explain why some of the other methods aren’t always accurate.

### first, an easy but less accurate way

If you definitely haven’t updated your authoritative DNS server in the last week or so, a very easy way to find it is to run `dig +short ns DOMAIN`

```

    $ dig +short ns jvns.ca
    art.ns.cloudflare.com.
    roxy.ns.cloudflare.com.

```

In this case, we get the correct answer. Great!

But if you _have_ updated your authoritative DNS server in the last few days (maybe because you just registered the domain!), that can give you an inaccurate answer. So here’s the slightly more complicated way that’s guaranteed to always give you the correct answer.

### step 1: query a root nameserver

We’re going to look up the authoritative nameserver for `jvns.ca` in this example.

No matter what domain we’re looking up, we need to start with the root nameservers. `h.root-servers.net` is one of the [13 DNS root nameservers][1], and `dig @h.root-servers.net` means “send the query to `h.root-servers.net`”.

```

    $ dig @h.root-servers.net jvns.ca
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 42165
    ;; flags: qr rd; QUERY: 1, ANSWER: 0, AUTHORITY: 4, ADDITIONAL: 9
    ;; WARNING: recursion requested but not available

    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 1232
    ;; QUESTION SECTION:
    ;jvns.ca.           IN  A

    ;; AUTHORITY SECTION: <------------ this is the section we're interested in
    ca.         172800  IN  NS  c.ca-servers.ca. <------- we'll use this record
    ca.         172800  IN  NS  j.ca-servers.ca.
    ca.         172800  IN  NS  x.ca-servers.ca.
    ca.         172800  IN  NS  any.ca-servers.ca.

    ;; ADDITIONAL SECTION:
    c.ca-servers.ca.    172800  IN  A   185.159.196.2
    j.ca-servers.ca.    172800  IN  A   198.182.167.1
    x.ca-servers.ca.    172800  IN  A   199.253.250.68
    any.ca-servers.ca.  172800  IN  A   199.4.144.2
    c.ca-servers.ca.    172800  IN  AAAA    2620:10a:8053::2
    j.ca-servers.ca.    172800  IN  AAAA    2001:500:83::1
    x.ca-servers.ca.    172800  IN  AAAA    2620:10a:80ba::68
    any.ca-servers.ca.  172800  IN  AAAA    2001:500:a7::2

    ;; Query time: 96 msec
    ;; SERVER: 198.97.190.53#53(198.97.190.53)
    ;; WHEN: Tue Jan 11 08:30:57 EST 2022
    ;; MSG SIZE  rcvd: 289

```

The answer we’re looking for is this line in the “AUTHORITY SECTION”:

```

    ca.          172800  IN  NS  c.ca-servers.ca.

```

It doesn’t matter which line in this section you pick, you can use any of them. I just picked the first one.

This tells us the server we need to talk to in step 2: `c.ca-servers.ca.`

### step 2: query the .ca nameservers

Now we run `dig @c.ca-servers.ca jvns.ca`

```

    $ dig @c.ca-servers.ca jvns.ca
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 24920
    ;; flags: qr rd; QUERY: 1, ANSWER: 0, AUTHORITY: 2, ADDITIONAL: 1
    ;; WARNING: recursion requested but not available

    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 1232
    ;; QUESTION SECTION:
    ;jvns.ca.           IN  A

    ;; AUTHORITY SECTION: <------------ this is the section we're interested in
    jvns.ca.        86400   IN  NS  art.ns.cloudflare.com. <---- we'll use this record
    jvns.ca.        86400   IN  NS  roxy.ns.cloudflare.com.

    ;; Query time: 26 msec
    ;; SERVER: 185.159.196.2#53(185.159.196.2)
    ;; WHEN: Tue Jan 11 08:32:44 EST 2022
    ;; MSG SIZE  rcvd: 90

```

Same as last time: the answer we’re looking for is this line in the “AUTHORITY SECTION”:

```

    jvns.ca.     86400   IN  NS  art.ns.cloudflare.com.

```

Again, it doesn’t matter which line in this section you pick, you can use any of them. I just picked the first one.

### success! we know the authoritative nameserver!

The authoritative nameserver for `jvns.ca` is `art.ns.cloudflare.com.`. Now you can now query `art.ns.cloudflare.com.` directly to see what DNS records it has for `jvns.ca`.

```

    $ dig @art.ns.cloudflare.com. jvns.ca
    jvns.ca.        292 IN  A   172.64.80.1

```

Nice, it worked.

### this is exactly what’s happening behind the scenes when you make a DNS query

The reason I like this method is that it mimics what’s happening behind the scenes when you make a DNS query. When Google’s DNS resolver `8.8.8.8.` looks up `jvns.ca`, the server it queries to to get `jvns.ca`’s authoritative nameserver is `c.ca-servers.net` (or one of the other options, like `j.ca-servers.ca.` or `x.ca-servers.ca.`)

Because this method uses the exact same information source as a real DNS query, you’re guaranteed to get a correct answer every time.

Often in practice I skip step 1 because I remember that the answer for `.ca` domains is `c.ca-servers.net`, so I can skip straight to step 2.

### this is useful to do when you’re updating your nameservers

When I update my nameservers with my domain registrar, they don’t actually update the authoritative nameserver right away. It takes a while, maybe an hour. So I like to go through these steps to check if my registrar has actually updated my authoritative nameserver yet.

### other ways to get a domain’s authoritative nameserver

Here are a few other ways you can get the authoritative nameserver for a domain and why I didn’t recommend them as the main method.

**dig +trace jvns.ca**

This does the exact same thing so it will always give you the right answer, but the output is a bit confusing to read so I’m a bit more hesitant to recommend it.

**dig ns jvns.ca**

This will usually give you the right answer, but there are 2 reasons it might be wrong:

  1. You might get an old cached record
  2. The NS record you get doesn’t come from the same place as it does when we do the method described in this post. In this example, instead of getting a NS record from `c.ca-servers.net`, `dig ns jvns.ca` will give you an NS record from `art.ns.cloudflare.com`. In practice usually these are the exact same thing, but in some weird edge cases they might not be.



**dig soa jvns.ca**

You can also find nameservers in the SOA record!

```

    $ dig SOA jvns.ca
    jvns.ca.   3600    IN    SOA    art.ns.cloudflare.com. dns.cloudflare.com. 2267173366 10000 2400 604800 3600
                                    ^^^^^^^^^^^^^^^^^^^^^
                                        here it is

```

This will usually give the right answer, there are 2 reasons it might be wrong, similarly to the NS record:

  1. This response comes from your authoritative nameserver. So if you’re in the middle of updating your nameserver, you might get the wrong answer because your DNS resolver sent the request to the old nameserver.
  2. Your authoritative nameserver could be returning a SOA record which doesn’t have the correct nameserver for some reason



**whois jvns.ca**

This will usually give you the right answer, but it might be an old cached version.

Here’s what this looks like on my machine for this example: (it gives us the right answer)

```

    $ whois jvns.ca | grep 'Name Server'
    Name Server: art.ns.cloudflare.com
    Name Server: roxy.ns.cloudflare.com

```

### that’s all!

I hope this helps some of you debug your DNS issues!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/01/11/how-to-find-a-domain-s-authoritative-nameserver/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://www.iana.org/domains/root/servers
