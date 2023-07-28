[#]: subject: "Why is DNS still hard to learn?"
[#]: via: "https://jvns.ca/blog/2023/07/28/why-is-dns-still-hard-to-learn/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why is DNS still hard to learn?
======

I write a lot about technologies that I found hard to learn about. A while back my friend Sumana asked me an interesting question – why are these things so hard to learn about? Why do they seem so mysterious?

For example, take DNS. We’ve been using DNS since the [80s][1] (for more than 35 years!). It’s used in every website on the internet. And it’s pretty stable – in a lot of ways, it works the exact same way it did 30 years ago.

But it took me YEARS to figure out how to confidently debug DNS issues, and I’ve seen a lot of other programmers struggle with debugging DNS problems as well. So what’s going on?

Here are a couple of thoughts about why learning to troubleshoot DNS problems is hard.

(I’m not going to explain DNS very much in this post, see [Implement DNS in a Weekend][2] or [my DNS blog posts][3] for more about how DNS works)

### a lot of the system is hidden

When you make a DNS request on your computer, the basic story is:

  1. your computer makes a request to a server called **resolver**
  2. the resolver checks its cache, and makes requests to some other servers called **authoritative nameservers**



Here are some things you don’t see:

  * the resolver’s **cache**. What’s in there?
  * which **library code** on your computer is making the DNS request (is it libc `getaddrinfo`? if so, is it the getaddrinfo from glibc, or musl, or apple? is it your browser’s DNS code? is it a different custom DNS implementation?). All of these options behave slightly differently and have different configuration, approaches to caching, available features, etc. For example musl DNS didn’t support TCP until [early 2023][4].
  * the **conversation** between the resolver and the authoritative nameservers. I think a lot of DNS issues would be SO simple to understand if you could magically get a trace of exactly which authoritative nameservers were queried downstream during your request, and what they said. (like, what if you could run `dig +debug google.com` and it gave you a bunch of extra debugging information?)



### dealing with hidden systems

A couple of ideas for how to deal with hidden systems

  * just teaching people what the hidden systems are makes a huge difference. For a long time I had no idea that my computer had many different DNS libraries that were used in different situations and I was confused about this for literally years. This is a big part of my approach.
  * with [Mess With DNS][5] we tried out this “fishbowl” approach where it shows you some parts of the system (the conversation with the resolver and the authoritative nameserver) that are normally hidden
  * I feel like it would be extremely cool to extend DNS to include a “debugging information” section. Like maybe it could be in the `additional` section and we could use TCP DNS so so that the response could include unlimited debug info? There’s probably prior art here that I don’t know about.



### confusing tools

Even though a lot of DNS stuff is hidden, there are a lot of ways to figure out what’s going on by using `dig`.

For example, you can use `dig +norecurse` to figure out if a given DNS resolver has a particular record in its cache. `8.8.8.8` seems to return a `SERVFAIL` response if the response isn’t cached.

here’s what that looks like for `google.com`

```

    $ dig +norecurse  @8.8.8.8 google.com
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 11653
    ;; flags: qr ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 512
    ;; QUESTION SECTION:
    ;google.com.            IN  A

    ;; ANSWER SECTION:
    google.com.     21  IN  A   172.217.4.206

    ;; Query time: 57 msec
    ;; SERVER: 8.8.8.8#53(8.8.8.8)
    ;; WHEN: Fri Jul 28 10:50:45 EDT 2023
    ;; MSG SIZE  rcvd: 55

```

and for `homestarrunner.com`:

```

    $ dig +norecurse  @8.8.8.8 homestarrunner.com
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: SERVFAIL, id: 55777
    ;; flags: qr ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1

    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 512
    ;; QUESTION SECTION:
    ;homestarrunner.com.        IN  A

    ;; Query time: 52 msec
    ;; SERVER: 8.8.8.8#53(8.8.8.8)
    ;; WHEN: Fri Jul 28 10:51:01 EDT 2023
    ;; MSG SIZE  rcvd: 47

```

Here you can see we got a normal `NOERROR` response for `google.com` (which is in `8.8.8.8`’s cache) but a `SERVFAIL` for `homestarrunner.com` (which isn’t). This doesn’t mean there’s no DNS record `homestarrunner.com` (there is!), it’s just not cached).

But this output is really confusing to read if you’re not used to it! Here are a few things that I think are weird about it:

  1. the headings are weird (there’s `->>HEADER<<-`, `flags:`, `OPT PSEUDOSECTION:`, `QUESTION SECTION:`, `ANSWER SECTION:`)
  2. the spacing is weird (why is the no newline between `OPT PSEUDOSECTION` and `QUESTION SECTION`?)
  3. `MSG SIZE rcvd: 47` is weird (are there other fields in `MSG SIZE` other than `rcvd`? what are they?)
  4. it says that there’s 1 record in the ADDITIONAL section but doesn’t show it, you have to somehow magically know that the “OPT PSEUDOSECTION” record is actually in the additional section



In general `dig`’s output has the feeling of a script someone wrote in an adhoc way that grew organically over time and not something that was intentionally designed.

### dealing with confusing tools

some ideas for improving on confusing tools:

  * **explain the output**. For example I wrote [how to use dig][6] explaining how `dig`’s output works and how to configure it to give you a shorter output by default
  * **make new, more friendly tools**. For example for DNS there’s [dog][7] and [doggo][8] and [my dns lookup tool][9]. I think these are really cool but personally I don’t use them because sometimes I want to do something a little more advanced (like using `+norecurse`) and as far as I can tell neither `dog` nor `doggo` support `+norecurse`. I’d rather use 1 tool for everything, so I stick to `dig`. Replacing the breadth of functionality of `dig` is a huge undertaking.
  * **make dig’s output a little more friendly**. If I were better at C programming, I might try to write a `dig` pull request that adds a `+human` flag to dig that formats the long form output in a more structured and readable way, maybe something like this:



```

    $ dig +human +norecurse  @8.8.8.8 google.com
    HEADER:
      opcode: QUERY
      status: NOERROR
      id: 11653
      flags: qr ra
      records: QUESTION: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

    QUESTION SECTION:
      google.com.           IN  A

    ANSWER SECTION:
      google.com.       21  IN  A   172.217.4.206

    ADDITIONAL SECTION:
      EDNS: version: 0, flags:; udp: 512

```

This makes the structure of the DNS response more clear – there’s the header, the question, the answer, and the additional section.

We’ve learned a lot about how to design more user friendly command line tools in the last 40 years and I think it would be cool to apply some of that knowledge to some of our older crustier tools.

### weird gotchas

DNS has some weird stuff that’s relatively common to run into, but pretty hard to learn about if nobody tells you what’s going on. A few examples (there are more in [some ways DNS can break][10]:

  * negative caching! (which I talk about in [this talk][11]) It took me probably 5 years to realize that I shouldn’t visit a domain that doesn’t have a DNS record yet, because then the **nonexistance** of that record will be cached, and it gets cached for HOURS, and it’s really annoying.
  * differences in `getaddrinfo` implementations: until [early 2023][4], `musl` didn’t support TCP DNS
  * resolvers that ignore TTLs: if you set a TTL on your DNS records (like “5 minutes”), some resolvers will ignore those TTLs completely and cache the records for longer, like maybe 24 hours instead
  * if you configure nginx wrong ([like this][12]), it’ll cache DNS records forever.
  * how [ndots][13] can make your Kubernetes DNS slow



### dealing with weird gotchas

I don’t have as good answers here as I would like to, but knowledge about weird gotchas is extremely hard won (again, it took me years to figure out negative caching!) and it feels very silly to me that people have to rediscover them for themselves over and over and over again.

A few ideas:

  * It’s incredibly helpful when people call out gotchas when explaining a topic. For example (leaving DNS for a moment), Josh Comeau’s Flexbox intro explains this [minimum size gotcha][14] which I ran into SO MANY times for several years before finally finding an explanation of what was going on.
  * I’d love to see more community collections of common gotchas. For bash, [shellcheck][15] is an incredible collection of bash gotchas.



One tricky thing about documenting DNS gotchas is that different people are going to run into different gotchas – if you’re just configuring DNS for your personal domain once every 3 years, you’re probably going to run into different gotchas than someone who administrates DNS for a domain with heavy traffic.

A couple of more quick reasons:

### infrequent exposure

A lot of people only deal with DNS extremely infrequently. And of course if you only touch DNS every 3 years it’s going to be harder to learn!

I think cheat sheets (like “here are the steps to changing your nameservers”) can really help with this.

### it’s hard to experiment with

DNS can be scary to experiment with – you don’t want to mess up your domain. We built [Mess With DNS][5] to make this one a little easier.

### that’s all for now

I’d love to hear other thoughts about what makes DNS (or your favourite mysterious technology) hard to learn.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2023/07/28/why-is-dns-still-hard-to-learn/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://www.ietf.org/rfc/rfc1034.txt
[2]: https://implement-dns.wizardzines.com/
[3]: https://jvns.ca/categories/dns/
[4]: https://www.theregister.com/2023/05/16/alpine_linux_318/
[5]: https://messwithdns.net/
[6]: https://jvns.ca/blog/2021/12/04/how-to-use-dig/
[7]: https://github.com/ogham/dog
[8]: https://github.com/mr-karan/doggo
[9]: https://dns-lookup.jvns.ca/
[10]: https://jvns.ca/blog/2022/01/15/some-ways-dns-can-break/
[11]: https://jvns.ca/blog/2023/05/08/new-talk-learning-dns-in-10-years/
[12]: https://jvns.ca/blog/2022/01/15/some-ways-dns-can-break/#problem-nginx-caching-dns-records-forever
[13]: https://pracucci.com/kubernetes-dns-resolution-ndots-options-and-why-it-may-affect-application-performances.html
[14]: https://www.joshwcomeau.com/css/interactive-guide-to-flexbox/#the-minimum-size-gotcha-11
[15]: https://www.shellcheck.net/
