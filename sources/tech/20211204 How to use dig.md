[#]: subject: "How to use dig"
[#]: via: "https://jvns.ca/blog/2021/12/04/how-to-use-dig/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to use dig
======

Hello! I talked to a couple of friends recently who mentioned they wished they knew how to use `dig` to make DNS queries, so here’s a quick blog post about it.

When I first started using `dig` I found it a bit intimidating – there are so many options! I’m going to leave out most of dig’s options in this post and just talk about the ones I actually use.

Also I learned recently that you can set up a `.digrc` configuration file to make its output easier to read and it makes it SO MUCH nicer to use.

I also drew a [zine page about dig][1] a few years ago, but I wanted to write this post to include a bit more information.

### 2 types of dig arguments: query and formatting

There are 2 main types of arguments you can pass to `dig`:

  1. arguments that tell dig **what DNS query to make**
  2. arguments that tell dig how to **format the response**



First, let’s go through the query options.

### the main query options

The 3 things you usually want to control about a DNS query are:

  1. the **name** (like `jvns.ca`). The default is a query for the empty name (`.`).
  2. the **DNS query type** (like `A` or `CNAME`). The default is `A`.
  3. the **server** to send the query to (like `8.8.8.8`). The default is what’s in `/etc/resolv.conf`.



The format for these is:

```

    dig @server name type

```

Here are a couple of examples:

  * `dig @8.8.8.8 jvns.ca` queries Google’s public DNS server (`8.8.8.8`) for `jvns.ca`.
  * `dig ns jvns.ca` makes an query with type `NS` for `jvns.ca`



### `-x`: make a reverse DNS query

One other query option I use occasionally is `-x`, to make a reverse DNS query. Here’s what the output looks like.

```

    $ dig -x 172.217.13.174
    174.13.217.172.in-addr.arpa. 72888 IN   PTR yul03s04-in-f14.1e100.net.

```

`-x` isn’t magic – `dig -x 172.217.13.174` just makes a `PTR` query for `174.13.217.172.in-addr.arpa.`. Here’s how to make exact the same reverse DNS query without using `-x`.

```

    $ dig ptr 174.13.217.172.in-addr.arpa.
    174.13.217.172.in-addr.arpa. 72888 IN   PTR yul03s04-in-f14.1e100.net.

```

I always use `-x` though because it’s less typing.

### options for formatting the response

Now, let’s talk about arguments you can use to format the response.

I’ve found that the way `dig` formats DNS responses by default is pretty overwhelming to beginners. Here’s what the output looks like:

```

    ; <<>> DiG 9.16.20 <<>> -r jvns.ca
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 28629
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 4096
    ; COOKIE: d87fc3022c0604d60100000061ab74857110b908b274494d (good)
    ;; QUESTION SECTION:
    ;jvns.ca.           IN  A

    ;; ANSWER SECTION:
    jvns.ca.        276 IN  A   172.64.80.1

    ;; Query time: 9 msec
    ;; SERVER: 192.168.1.1#53(192.168.1.1)
    ;; WHEN: Sat Dec 04 09:00:37 EST 2021
    ;; MSG SIZE  rcvd: 80

```

If you’re not used to reading this, it might take you a while to sift through it and find the IP address you’re looking for. And most of the time, you’re only interested in one line of this response (`jvns.ca. 180 IN A 172.64.80.1`).

Here are my 2 favourite ways to make dig’s output more manageable.

**way 1: +noall +answer**

This tells dig to just print what’s in the “Answer” section of the DNS response. Here’s an example of querying for the `NS` records for `google.com`.

```

    $ dig +noall +answer ns google.com
    google.com.     158564  IN  NS  ns4.google.com.
    google.com.     158564  IN  NS  ns1.google.com.
    google.com.     158564  IN  NS  ns2.google.com.
    google.com.     158564  IN  NS  ns3.google.com.

```

The format here is:

```

    NAME         TTL            TYPE   CONTENT
    google.com   158564   IN    NS     ns3.google.com.

```

By the way: if you’ve ever wondered what `IN` means, it’s the “query class” and stands for “internet”. It’s basically just a relic from the 80s and 90s when there were other networks competing with the internet like “chaosnet”.

**way 2: +short**

This is like `dig +noall +answer`, but even shorter – it just shows the content of each record. For example:

```

    $ dig +short ns google.com
    ns2.google.com.
    ns1.google.com.
    ns4.google.com.
    ns3.google.com.

```

### you can put formatting options in `digrc`

If you don’t like dig’s default format (I don’t!), you can tell it to use a different format by default by creating a `.digrc` file in your home directory.

I really like the `+noall +answer` format, so I put `+noall +answer` in my `~/.digrc`. Here’s what it looks like for me when I run `dig jvns.ca` using that configuration file.

```

    $ dig jvns.ca
    jvns.ca.        255 IN  A   172.64.80.1

```

So much easier to read!

And if I want to go back to the long format with all of the output (which I do sometimes, usually because I want to look at the records in the Authority section of the response), I can get a long answer again by running:

```

    $ dig +all jvns.ca

```

### dig +trace

The last dig option that I use is `+trace`. `dig +trace` mimics what a DNS resolver does when it looks up a domain – it starts at the root nameservers, and then queries the next level of nameservers (like `.com`), and so on until it reaches the authoritative nameserver for the domain. So it’ll make about 30 DNS queries. (I checked using tcpdump, it seems to make 2 queries to get A/AAAA records for each of the root nameservers so that’s already 26 queries. I’m not really sure _why_ it does this because it should already have those IPs hardcoded, but it does.)

I find this mostly useful for understanding how DNS works though, I don’t think that I’ve used it to solve a problem.

### why dig?

Even though there are simpler tools to make DNS queries (like `dog` and `host`), I find myself sticking with dig.

What I like about dig is actually the same thing I **don’t** like about dig – it shows a lot of detail!

I know that if I run `dig +all`, it’ll show me all of the sections of the DNS response. For example, let’s query one of the root nameservers for `jvns.ca`. The response has 3 sections I might care about – Answer, Authority, and Additional.

```

    $ dig @h.root-servers.net. jvns.ca +all
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 18229
    ;; flags: qr rd; QUERY: 1, ANSWER: 0, AUTHORITY: 4, ADDITIONAL: 9
    ;; WARNING: recursion requested but not available

    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 1232
    ;; QUESTION SECTION:
    ;jvns.ca.           IN  A

    ;; AUTHORITY SECTION:
    ca.         172800  IN  NS  c.ca-servers.ca.
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

    ;; Query time: 103 msec
    ;; SERVER: 198.97.190.53#53(198.97.190.53)
    ;; WHEN: Sat Dec 04 11:23:32 EST 2021
    ;; MSG SIZE  rcvd: 289

```

`dog` also shows the records in the “additional” section , but it’s not super explicit about which is which (I guess the `+` means it’s in the additional section?). It doesn’t seem to show the records in the “Authority” section.

```

    $ dog @h.root-servers.net. jvns.ca
      NS ca.                2d0h00m00s A "c.ca-servers.ca."
      NS ca.                2d0h00m00s A "j.ca-servers.ca."
      NS ca.                2d0h00m00s A "x.ca-servers.ca."
      NS ca.                2d0h00m00s A "any.ca-servers.ca."
       A c.ca-servers.ca.   2d0h00m00s + 185.159.196.2
       A j.ca-servers.ca.   2d0h00m00s + 198.182.167.1
       A x.ca-servers.ca.   2d0h00m00s + 199.253.250.68
       A any.ca-servers.ca. 2d0h00m00s + 199.4.144.2
    AAAA c.ca-servers.ca.   2d0h00m00s + 2620:10a:8053::2
    AAAA j.ca-servers.ca.   2d0h00m00s + 2001:500:83::1
    AAAA x.ca-servers.ca.   2d0h00m00s + 2620:10a:80ba::68
    AAAA any.ca-servers.ca. 2d0h00m00s + 2001:500:a7::2

```

And `host` seems to only show the records in the “answer” section (in this case no records)

```

    $ host jvns.ca h.root-servers.net
    Using domain server:
    Name: h.root-servers.net
    Address: 198.97.190.53#53
    Aliases:

```

Anyway, I think that these simpler DNS tools are great (I even made my own [simple web DNS tool][2]) and you should absolutely use them if you find them easier but that’s why I stick with dig. `drill`’s output format seems very similar to `dig`’s though, and maybe `drill` is better! I haven’t really tried it.

### that’s all!

I only learned about `.digrc` recently and I love using it so much, so I hope it helps some of you spend less time sorting though dig output!

Someone on Twitter pointed out that it would be nice if there were a way to tell dig to show a short version of the response which also included the response’s status (like `NOERROR`, `NXDOMAIN`, `SERVFAIL`, etc), and I agree! I couldn’t find an option in the man page that does that though.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/12/04/how-to-use-dig/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com/comics/dig/
[2]: https://dns-lookup.jvns.ca/
