[#]: subject: "How do you tell if a problem is caused by DNS?"
[#]: via: "https://jvns.ca/blog/2021/11/04/how-do-you-tell-if-a-problem-is-caused-by-dns/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How do you tell if a problem is caused by DNS?
======

I was looking into problems people were having with DNS a few months ago and I noticed one common theme – a lot of people have server issues (“my server is down! or it’s slow!“), but they can’t tell if the problem is caused by DNS or not.

So here are a few tools I use to tell if a problem I’m having is caused by DNS, as well as a few DNS debuggging stories from my life.

### I don’t try to interpret browser error messages

First, let’s talk briefly about browser error messages. You might think that your browser will tell you if the problem is DNS or not! And it _could_ but mine doesn’t seem to do so in any obvious way.

On my machine, if Firefox fails to resolve DNS for a site, it gives me the error: **Hmm. We’re having trouble finding that site. We can’t connect to the server at bananas.wizardzines.com.**

But if the DNS succeeds and it just can’t establish a TCP connection to that service, I get the error: **Unable to connect. Firefox can’t establish a connection to the server at localhost:1324**

These two error messages (“we can’t connect to the server” and “firefox can’t establish a connection to the server”) are so similar that I don’t try to distinguish them – if I see any kind of “connection failure” error in the browser, I’ll immediately go the command line to investigate.

### tool 1: error messages

I was complaining about browser error messages being misleading, but if you’re writing a program, there’s usually some kind of standard error message that you get for DNS errors. It often won’t say “DNS” in it, it’ll usually be something about “unknown host” or “name or service not found” or “getaddrinfo”.

For example, let’s run this Python program:

```

    import requests
    r = requests.get('http://examplezzz.com')

```

This gives me the error message:

```

    socket.gaierror: [Errno -2] Name or service not known

```

If I write the same program in Ruby, I get this error:

```

    Failed to open TCP connection to examplezzzzz.com:80 (getaddrinfo: Name or service not known

```

If I write the same program in Java, I get:

```

    Exception in thread "main" java.net.UnknownHostException: examplezzzz.com

```

In Node, I get:

```

    Error: getaddrinfo ENOTFOUND examplezzzz.com

```

These error messages aren’t quite as uniform as I thought they would be, there are quite a few different error messages in different languages for exact the same problem, and it depends on the library you’re using too. But if you Google the error you can find out if it means “resolving DNS failed” or not.

### tool 2: use `dig` to make sure it’s a DNS problem

For example, the other day I was setting up a new subdomain, let’s say it was <https://bananas.wizardzines.com>.

I set up my DNS, but when I went to the site in Firefox, it wasn’t working. So I ran `dig` to check whether the DNS was resolving for that domain, like this:

```

    $ dig bananas.wizardzines.com
    (empty response)

```

I didn’t get a response, which is a failure. A success looks like this:

```

    $ dig wizardzines.com
    wizardzines.com.    283 IN  A   172.64.80.1

```

Even if my programming language gives me a clear DNS error, I like to use `dig` to independently confirm because there are still a lot of different error messages and I find them confusing.

### tool 3: check against more than one DNS server

There are LOTS of DNS servers, and they often don’t have the same information. So when I’m investigating a potential DNS issue, I like to query more than one server.

For example, if it’s a site on the public internet I’ll both use my local DNS server (`dig domain.com`) and a big public DNS server like 1.1.1.1 or 8.8.8.8 or 9.9.9.9 (`dig @8.8.8.8 domain.com`).

The other day, I’d set up a new domain, let’s say it was <https://bananas.wizardzines.com>.

Here’s what I did:

  1. go to <https://bananas.wizardzines.com> in a browser (spoiler: huge mistake!)
  2. go to my DNS provider and set up bananas.wizardzines.com
  3. try to go to <https://bananas.wizardzines.com> in my browser. It fails! Oh no!



I wasn’t sure why it failed, so I checked against 2 different DNS servers:

```

    $ dig bananas.wizardzines.com
    $ dig @8.8.8.8 bananas.wizardzines.com
    feedback.wizardzines.com. 300   IN  A   172.67.209.237
    feedback.wizardzines.com. 300   IN  A   104.21.85.200

```

From this I could see that `8.8.8.8` actually did have DNS records for my domain, and it was just my local DNS server that didn’t.

This was because I’d gone to <https://bananas.wizardzines.com> in my browser before I’d created the DNS record (huge mistake!), and then my ISP’s DNS server cached the **absence** of a DNS record, so it was returning an empty response until the negative cached expired.

I googled “negative cache time” and found a Stack Overflow post explaining where I could find the negative cache TTL (by running `dig SOA wizardzines.com`). It turned out the TTL was 3600 seconds or 1 hour, so I just needed to wait an hour for my ISP to update its cache.

### tool 4: spy on the DNS requests being made with tcpdump

Another of my favourite things to do is spy on the DNS requests being made and check if they’re failing. There are at least 3 ways to do this:

  1. Use tcpdump (`sudo tcpdump -i any port 53`)
  2. Use wireshark
  3. Use a command line tool I wrote called [dnspeep][1], which is like tcpdump but just for DNS queries and with friendlier output



I’m going to give you 2 examples of DNS problems I diagnosed by looking at the DNS requests being made with `tcpdump`.

### problem: the case of the slow websites

One day five years ago, my internet was slow. Really slow, it was taking 10+ seconds to get to websites. I thought “hmm, maybe it’s DNS!”, so started `tcpdump` and then opened one of the slow sites in my browser.

Here’s what I saw in `tcpdump`:

```

    $ sudo tcpdump -n -i any port 53
    12:05:01.125021 wlp3s0 Out IP 192.168.1.181.56164 > 192.168.1.1.53: 11760+ [1au] A? ask.metafilter.com. (59)
    12:05:06.191382 wlp3s0 Out IP 192.168.1.181.56164 > 192.168.1.1.53: 11760+ [1au] A? ask.metafilter.com. (59)
    12:05:11.145056 wlp3s0 Out IP 192.168.1.181.56164 > 192.168.1.1.53: 11760+ [1au] A? ask.metafilter.com. (59)
    12:05:11.746358 wlp3s0 In  IP 192.168.1.1.53 > 192.168.1.181.56164: 11760 2/0/1 CNAME metafilter.com., A 54.244.168.112 (91)

```

The first 3 lines are DNS requests, and they’re separated by 5 seconds. Basically this is my browser timing out its DNS queries and retrying them.

Finally, on the 3rd query, a response comes back.

I don’t actually know exactly why this happened, but I restarted my router and the problem went away. Hooray!

(by the way the reason I know that this is the tcpdump output I got 5 years ago is that I wrote about it in my [zine on tcpdump][2], you can read that zine for free!)

### problem: the case of the nginx failure

Earlier this year, I was using <https://fly.io> to set up a website, and I was having trouble getting nginx to redirect to my site – all the requests were failing.

I eventually got SSH access to the server and ran `tcpdump` and here’s what I saw:

```

    $ tcpdump -i any port 53
    17:16:04.216161 IP6 fly-local-6pn.55356 > fdaa::3.53: 46219+ A? myservice.internal. (42)
    17:16:04.216197 IP6 fly-local-6pn.55356 > fdaa::3.53: 11993+ AAAA? myservice.internal. (42)
    17:16:04.216946 IP6 fdaa::3.53 > fly-local-6pn.55356: 46219 NXDomain- 0/0/0 (42)
    17:16:04.217063 IP6 fly-local-6pn.43938 > fdaa::3.53: 32351+ PTR? 3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.a.a.d.f.ip6.arpa. (90)
    17:16:04.218378 IP6 fdaa::3.53 > fly-local-6pn.55356: 11993- 1/0/0 AAAA fdaa:0:bff:a7b:aa2:d426:1ab:2 (70)
    17:16:04.461646 IP6 fdaa::3.53 > fly-local-6pn.43938: 32351 NXDomain 0/1/0 (154)

```

This is a bit confusing to read, but basically:

  1. nginx requests an A record
  2. nginx requests an AAAA record
  3. the DNS server returns an `NXDOMAIN` reply for the A record
  4. the DNS server returns a successful reply for the AAAA record, with an IPv6 address



The `NXDOMAIN` reponse made nginx think that that domain didn’t exist, so it ignored the IPv6 address it got later.

This was happening because there was a bug in the DNS server – according to the DNS spec it should have been returning `NOERROR` instead of `NXDOMAIN` for the A record. I reported the bug and they fixed it right away.

I think it would have been literally impossible for me to guess what was happening here without using `tcpdump` to see what queries nginx was making.

### if there are no DNS failures, it can still be a DNS problem

I originally wrote “if you can see the DNS requests, and there are no timeouts or failures, the problem isn’t DNS”. But someone on Twitter [pointed out][3] that this isn’t true!

One way you can have a DNS problem even without DNS failures is if your program is doing its own DNS caching. Here’s how that can go wrong:

  1. Your program makes a DNS request and caches the result
  2. 6 days pass
  3. Your program never updates its IP address
  4. The IP address for the site changes
  5. You start getting errors



This _is_ a DNS problem (your program should be requesting DNS updates more often!) but you have to diagnose it by noticing that there are _missing_ DNS queries. This one is very tricky and the error messages you’ll get won’t look like they have anything to do with DNS.

### that’s all for now

This definitely isn’t a complete list of ways to tell if it’s DNS or not, but I hope it helps!

I’d love to hear methods of checking “is it DNS?” that I missed – I’m pretty sure I’ve missed at least one important method.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/11/04/how-do-you-tell-if-a-problem-is-caused-by-dns/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/jvns/dnspeep/
[2]: https://wizardzines.com/zines/tcpdump/
[3]: https://twitter.com/0x2ba22e11/status/1456305123420950530
