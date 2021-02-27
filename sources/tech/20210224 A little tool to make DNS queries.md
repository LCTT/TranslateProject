[#]: subject: (A little tool to make DNS queries)
[#]: via: (https://jvns.ca/blog/2021/02/24/a-little-tool-to-make-dns-queries/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

A little tool to make DNS queries
======

Hello! I made a small tool to make DNS queries over the last couple of days, and you can try it at <https://dns-lookup.jvns.ca/>.

I started thinking about this because I’m working on writing a zine about owning a domain name, and I wanted to encourage people to make a bunch of DNS queries to understand what the responses look like.

So I tried to find other tools are available to make DNS queries.

### dig is kind of complicated

I usually make DNS queries using `dig`, like this.

```
$ dig jvns.ca

; <<>> DiG 9.16.1-Ubuntu <<>> a jvns.ca
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8447
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;jvns.ca.           IN  A

;; ANSWER SECTION:
jvns.ca.        216 IN  A   104.21.5.215
jvns.ca.        216 IN  A   172.67.133.222

;; Query time: 40 msec
;; SERVER: fdaa:0:bff::3#53(fdaa:0:bff::3)
;; WHEN: Wed Feb 24 08:53:22 EST 2021
;; MSG SIZE  rcvd: 68
```

This is great if you’re used to reading it and if you know which parts to ignore and which parts to pay attention to, but for many people this is too much information.

Like, what does `flags: qr rd ra` mean? Why does it say `QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1`? What is the point of `MSG SIZE rcvd: 68`? What does `IN` mean? I mostly know the answers to these questions becuase I implemented a toy DNS server one time, but it’s kinda confusing!

### google webmaster tools has a nice interface for making DNS queries

Google has a [DNS lookup tool][1] with a simple web interface that lets you type in a domain name, click the kind of record you want (`A`, `AAAA`, etc), and get the response. I was really excited about this and I thought, “ok, great, this is what I can tell people to use!”.

But then I looked at the output of the tool, which you can see in this screenshot:

![][2]

This is just as bad as dig! (the tool is called “dig”, so it’s not a big surprise, but still :)). So I thought it would be a fun project to make a DNS lookup tool with output that’s more comprehensible by humans

I also wanted to add an option for people to query all the record types at once.

### what my lookup tool looks like

I copied the query design from the Google tool because I thought it was nice, but I put the answers in a table and left out a lot of information I thought wasn’t necessary for most people like the flags, and the `IN` (we’re all on the internet!)

It has a GET ME ALL THE RECORDS button which will make a query for each record type.

[![][3]][4]

I also made a responsive version of the table because it got too wide for a phone:

[![][5]][4]

### to get all the record types, you need to make multiple queries

The Google tool has an `ANY` option which makes an `ANY` DNS query for the domain. Some DNS servers support getting all the DNS records with an ANY query, but not all do – Cloudflare has a good blog post explaining [why they removed support for ANY][6].

So instead of making an `ANY` query (which usually doesn’t work), the tool I made just kicks off a query for each record type it wants to know about.

### the record type isn’t redundant

At first when I was removing redundant information I thought the record type was redundant too (if you’re making an A query, the responses you get back will be A records, right?), but then I remembered that this actually isn’t true – you can see in [this query for A records on www.twitter.com][7] that it replies with a CNAME record because [www.twitter.com][8] is CNAMEd to twitter.com.

### how it works

The source is on GitHub at <https://github.com/jvns/dns-lookup>.

It’s basically just 3 files right now:

  * [dns.js][9] (some Javascript using vue.js)
  * [index.html][10]
  * [dns.go][11] is the backend, it’s a Go HTTP handler running on Netlify functions



Using an AWS Lambda-style function was really nice and made this project super easy to deploy. It’s fun not to have worry about servers!

Originally I thought I was going to use the DNS code in the Go standard library, but I ended up using <https://github.com/miekg/dns> to make the DNS queries because it seemed simpler.

I also tried to use Node’s DNS library to write the backend in Javascript before I switched to Go, but I couldn’t figure out how to get that library to return a TTL for my DNS queries. I think this kind of systems-y thing is generally simpler in Go anyway.

### other DNS lookup tools

As always, after I made this, people told me about some other useful tools in the space. Here they are:

  * [zone.vision][12], which is nice because it queries the authoritative nameservers for a domain directly
  * [mxtoolbox.com][13], which seems a bit more oriented towards MX/SPF queries but does lots more
  * the [Google DNS lookup tool][1] again



If you know of others I’d love to add them here!

### things I might add

some things on my list are:

  * maybe reverse DNS queries (technically they’re supported right now if you know how to type in 4.3.2.1.in-addr.arpa, but who has time for that)
  * support for more DNS query types (I want to figure how to support all query types without cluttering up the UI too much)
  * tooltips explaining what a TTL is
  * maybe make the design less of a copy of that Google tool, it has kind of a material design vibe and I don’t know if I love it :)



### a link to the tool again

Here’s it is! <https://dns-lookup.jvns.ca/>.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/02/24/a-little-tool-to-make-dns-queries/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://toolbox.googleapps.com/apps/dig/#A/
[2]: https://jvns.ca/images/google-tool.png
[3]: https://jvns.ca/images/my-tool.png
[4]: https://dns-lookup.jvns.ca
[5]: https://jvns.ca/images/responsive.png
[6]: https://blog.cloudflare.com/deprecating-dns-any-meta-query-type/
[7]: https://dns-lookup.jvns.ca/#www.twitter.com%7CA
[8]: http://www.twitter.com
[9]: https://github.com/jvns/dns-lookup/blob/4be37ca3681480ed0f15a670fbd854ca427329de/site/dns.js
[10]: https://github.com/jvns/dns-lookup/blob/4be37ca3681480ed0f15a670fbd854ca427329de/site/index.html
[11]: https://github.com/jvns/dns-lookup/blob/4be37ca3681480ed0f15a670fbd854ca427329de/dns.go
[12]: https://zone.vision/#/twitter.com
[13]: https://mxtoolbox.com/SuperTool.aspx
