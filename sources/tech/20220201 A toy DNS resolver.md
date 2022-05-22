[#]: subject: "A toy DNS resolver"
[#]: via: "https://jvns.ca/blog/2022/02/01/a-dns-resolver-in-80-lines-of-go/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A toy DNS resolver
======

Hello! I wrote a comic last week called “life of a DNS query” that explains how DNS resolvers work.

In this post, I want to explain how DNS resolvers work in a different way – with a short Go program that does the same thing described in the comic. The main function (`resolve`) is actually just 20 lines, including comments.

I usually find it easier to understand things work when they come in the form of programs that I can run and modify and poke at, so hopefully this program will be helpful to some of you.

The program is here: <https://github.com/jvns/tiny-resolver/blob/main/resolve.go>

### what’s a DNS resolver?

When your browser needs to make a DNS query, it asks a **DNS resolvers**. When they start, DNS resolvers don’t know any DNS records (except the IP addresses of the root nameservers). But they _do_ know how to find DNS records for you.

Here’s the “life of a DNS query” comic, which explains how DNS resolvers find DNS records for you.

[![][1]][2]

### we’ll use a library for parsing DNS packets.

I’m not going to write this completely from scratch – I think parsing DNS packets is really interesting, but it’s definitely more than 80 lines of code, and I find that it kind of distracts from the algorithm.

I really recommend writing a toy DNS resolver that actually does the parsing of DNS packets if you want to learn about binary protocols though, it’s really fun and it’s a totally doable to get something basic working in a weekend.

So I’ve used <https://github.com/miekg/dns> for creating and parsing the DNS packets.

### DNS responses contain 4 sections

You might think of DNS queries as just being a question and an answer (“what’s the IP for `example.com`? it’s `93.184.216.34`!). But actually DNS responses contain 4 sections, and we need to use all 4 sections to write our DNS resolver. So let’s explain what they are.

Here’s the `Msg` struct from the `miekg/dns` library, which lists the sections.

```

    type Msg struct {
            MsgHdr
            Compress bool       `json:"-"` // If true, the message will be compressed when converted to wire format.
            Question []Question // Holds the RR(s) of the question section.
            Answer   []RR       // Holds the RR(s) of the answer section.
            Ns       []RR       // Holds the RR(s) of the authority section.
            Extra    []RR       // Holds the RR(s) of the additional section.
    }

```

**Section 1: Question**. This is the section you use when you’re creating a query. There’s not much to it – it just has a query name (like `jvns.ca.`), a type (like `A`, but encoded as an integer), and a class (which is always the same these days, “internet”).

Here’s what the Question struct `miekg/dns` looks like:

```

    type Question struct {
            Name   string `dns:"cdomain-name"` // "cdomain-name" specifies encoding (and may be compressed)
            Qtype  uint16
            Qclass uint16
    }

```

**Section 2: Answer**. When you make a request like this:

```

    $ dig +short google.com
    93.184.216.34

```

the IP address `93.184.216.34` comes from the **Answer** section.

The Answer, Authority, and Additional sections all contain **DNS records**. Different types of records have different formats, but they all contain a **name**, **type**, **class**, and **TTL**

Here’s what the shared header looks like in `miekg/dns`:

```

    type RR_Header struct {
            Name     string `dns:"cdomain-name"`
            Rrtype   uint16
            Class    uint16
            Ttl      uint32
            Rdlength uint16 // Length of data after header.
    }

```

“RR” stands for “Resource Record”.

**Section 3: Authority**. When a nameserver redirects you to another server (“ask `a.iana-servers.net` instead!“), this is the section it uses. `miekg/dns` calls this section `Ns` instead of `Authority`, I guess because it contains `NS` records.

Here’s an example of an record in the Authority section of a DNS response.

```

    $ dig +noall +authority @h.root-servers.net example.com
    com.            172800  IN  NS  a.gtld-servers.net.
    com.            172800  IN  NS  b.gtld-servers.net.

```

The Authority section can also contain SOA records but that’s not relevant to this post so I’m not going to talk about that.

**Section 4: Additional**. This is where “glue records” live. What’s a glue record? Well, basically when a nameserver redirects you to another server, often it’ll include the IP address of that server as well.

Here are the glue records from the same query above.

```

    $ dig +noall +additional @h.root-servers.net example.com
    a.gtld-servers.net. 172800  IN  A   192.5.6.30
    b.gtld-servers.net. 172800  IN  A   192.33.14.30

```

There are other things in the Additional section as well, not just glue records, but they’re not relevant to this blog post so I’m not going to talk about them.

### the basic `resolve` function is pretty short

Now that we’ve talked about the different sections in a DNS response, I can explain the resolver code.

Let’s jump into the main function for resolving a name to an IP address.

`name` here is a domain name, like `example.com.``

```

    func resolve(name string) net.IP {
       // We always start with a root nameserver
       nameserver := net.ParseIP("198.41.0.4")
       for {
          reply := dnsQuery(name, nameserver)
          if ip := getAnswer(reply); ip != nil { // look in the "Answer" section
             // Best case: we get an answer to our query  and we're done
             return ip
          } else if nsIP := getGlue(reply); nsIP != nil { // look in the "Additional" section
                // Second best: we get a "glue record" with the *IP address* of
                // another nameserver to query
             nameserver = nsIP
          } else if domain := getNS(reply); domain != "" { // look in the "Authority" section
                // Third best: we get the *domain name* of another nameserver to
                // query, which we can look up the IP for
             nameserver = resolve(domain)
          } else {
             // If there's no A record we just panic, this is not a very good
             // resolver :)
             panic("something went wrong")
          }
       }
    }

```

Here’s what that `resolve` function is doing: 1. We start with the root nameserver 2. Then we do a loop: a. Query the nameserver and parse the response a. Look in the “Answer” section for a response. If we find one, we’re done a. Look in the “Additional” section for a glue record. If we find one, use that as the nameserver for the next query a. Look in the “Authority” section for a nameserver domain. If we find one, look up its IP and then use that IP as the nameserver for the next query

That’s basically the whole program. There are a few helper functions to get records out of the DNS response and to make DNS queries but I don’t think they’re that interesting so I won’t explain them.

### the output

The resolver prints out all DNS queries it made, and the record it used to figure out what query to make it next.

It prints out `dig -r @SERVER DOMAIN` for each query even though it’s not actually using `dig` to make the query because I liked being able to run the same query myself from the command line to see the response myself, for debugging purposes.

`-r` just means “ignore what’s in `.digrc`”, it’s there because I have some options in my `.digrc` (`+noall +answer`) that I wanted to disable when debugging.

Let’s look at 3 examples of the output.

### example 1: jvns.ca

```

    $ go run resolve.go jvns.ca.
    dig -r @198.41.0.4 jvns.ca.
       any.ca-servers.ca.   172800  IN  A   199.4.144.2
    dig -r @199.4.144.2 jvns.ca.
       jvns.ca. 86400   IN  NS  art.ns.cloudflare.com.
    dig -r @198.41.0.4 art.ns.cloudflare.com.
       a.gtld-servers.net.  172800  IN  A   192.5.6.30
    dig -r @192.5.6.30 art.ns.cloudflare.com.
       ns3.cloudflare.com.  172800  IN  A   162.159.0.33
    dig -r @162.159.0.33 art.ns.cloudflare.com.
       art.ns.cloudflare.com.   900 IN  A   173.245.59.102
    dig -r @173.245.59.102 jvns.ca.
       jvns.ca. 256 IN  A   172.64.80.1

```

We can see it had to make 6 DNS queries, 3 to look up `jvns.ca` and 3 to look up `jvns.ca`’s nameserver, `art.ns.cloudflare.com`

### example 2: archive.org

```

    $ go run resolve.go archive.org.
    dig -r @198.41.0.4 archive.org.
       a0.org.afilias-nst.info. 172800  IN  A   199.19.56.1
    dig -r @199.19.56.1 archive.org.
       ns1.archive.org. 86400   IN  A   208.70.31.236
    dig -r @208.70.31.236 archive.org.
       archive.org. 300 IN  A   207.241.224.2
    Result: 207.241.224.2

```

This one only had to make 3 DNS queries. This is because there was a glue record available for archive.org’s nameserver (`ns1.archive.org.`).

### example 3: [www.maths.ox.ac.uk][3]

One last example: let’s look up `www.maths.ox.ac.uk`. There’s a reason for this one, I promise!

```

    dig -r @198.41.0.4 www.maths.ox.ac.uk.
       dns1.nic.uk. 172800  IN  A   213.248.216.1
    dig -r @213.248.216.1 www.maths.ox.ac.uk.
       ac.uk.   172800  IN  NS  ns0.ja.net.
    dig -r @198.41.0.4 ns0.ja.net.
       e.gtld-servers.net.  172800  IN  A   192.12.94.30
    dig -r @192.12.94.30 ns0.ja.net.
       ns0.ja.net.  172800  IN  A   128.86.1.20
    dig -r @128.86.1.20 ns0.ja.net.
       ns0.ja.net.  86400   IN  A   128.86.1.20
    dig -r @128.86.1.20 www.maths.ox.ac.uk.
       ns2.ja.net.  86400   IN  A   193.63.105.17
    dig -r @193.63.105.17 www.maths.ox.ac.uk.
       www.maths.ox.ac.uk.  300 IN  A   129.67.184.128
    Result: 129.67.184.128

```

This makes **7** DNS queries, which is more than `jvns.ca`, which only needed 6. Why does it make 7 DNS queries instead of 6?

Well, it’s because there are 4 nameservers involved in resolving `www.maths.ox.ac.uk` instead of 3. They are:

  * the `.` nameserver
  * the `uk.` nameserver
  * the `ac.uk.` nameserver
  * the `ox.ac.uk.` nameserver



You could even imagine there being a 5th one (a `maths.ox.ac.uk.` nameserver), but there isn’t in this case.

jvns.ca only involves 3 nameservers:

  * the `.` nameserver
  * the `ca.` nameserver
  * the `jvns.ca.` nameserver



### real DNS resolvers actually make more queries than this

When my resolver resolves `reddit.com.`, it only makes 3 DNS queries.

```

    $ go run resolve.go reddit.com.
    dig -r @198.41.0.4 reddit.com.
       e.gtld-servers.net.  172800  IN  A   192.12.94.30
    dig -r @192.12.94.30 reddit.com.
       ns-378.awsdns-47.com.    172800  IN  A   205.251.193.122
    dig -r @205.251.193.122 reddit.com.
       reddit.com.  300 IN  A   151.101.129.140
    Result: 151.101.129.140

```

But when `unbound` (the actual DNS resolver that I have running on my laptop) resolves reddit.com, it makes more DNS queries. I captured them with `tcpdump` to see what they were.

This `tcpdump` output might be a little illegible because well, that’s how tcpdump is, but hopefully it makes some sense.

Unbound skips the first step, because it has the address of the `com.` nameserver cached. Then the next 2 queries `unbound` makes are exactly the same as my tiny Go resolver, except that it sends its first query to `k.gtld-servers.net` instead of `e.gtld-servers.net`:

```

    12:38:35.479222 wlp3s0 Out IP pomegranate.19946 > k.gtld-servers.net.domain: 51686% [1au] A? reddit.com. (39)
    12:38:35.757033 wlp3s0 Out IP pomegranate.29111 > ns-378.awsdns-47.com.domain: 8859% [1au] A? reddit.com. (39)

```

But then it keeps making DNS queries, even after it’s done resolving `reddit.com`:

```

    12:38:35.757033 wlp3s0 Out IP pomegranate.29111 > ns-378.awsdns-47.com.domain: 8859% [1au] A? reddit.com. (39)
    12:38:35.757396 wlp3s0 Out IP pomegranate.31913 > ns-1775.awsdns-29.co.uk.domain: 54236% [1au] A? ns-378.awsdns-47.com. (49)
    12:38:35.757761 wlp3s0 Out IP pomegranate.62059 > g.gtld-servers.net.domain: 28793% [1au] A? awsdns-05.net. (42)
    12:38:35.757955 wlp3s0 Out IP pomegranate.34743 > b0.org.afilias-nst.org.domain: 24975% [1au] A? awsdns-00.org. (42)
    12:38:35.758051 wlp3s0 Out IP pomegranate.8977 > a0.org.afilias-nst.info.domain: 53387% [1au] A? awsdns-00.org. (42)
    12:38:35.758285 wlp3s0 Out IP pomegranate.11376 > j.gtld-servers.net.domain: 41181% [1au] A? awsdns-05.net. (42)
    12:38:35.775497 wlp3s0 In  IP ns-378.awsdns-47.com.domain > pomegranate.29111: 8859*-$ 4/4/1 A 151.101.1.140, A 151.101.129.140, A 151.101.65.140, A 151.101.193.140 (240)
    12:38:35.775948 lo    In  IP localhost.domain > localhost.34429: 4033 4/0/1 A 151.101.1.140, A 151.101.129.140, A 151.101.65.140, A 151.101.193.140 (103)
    # now it's done -- it returned its DNS response!
    # but it keeps making queries about reddit.com's nameservers...
    12:38:35.843811 wlp3s0 Out IP pomegranate.44738 > ns-706.awsdns-24.net.domain: 14817% [1au] A? ns-1029.awsdns-00.org. (50)
    12:38:35.845563 wlp3s0 Out IP pomegranate.55655 > ns-1027.awsdns-00.org.domain: 3120% [1au] A? ns-1029.awsdns-00.org. (50)
    12:38:36.017618 wlp3s0 Out IP pomegranate.53397 > ns-775.awsdns-32.net.domain: 32671% [1au] A? ns-557.awsdns-05.net. (49)
    12:38:36.045151 wlp3s0 Out IP pomegranate.40525 > ns-454.awsdns-56.com.domain: 20823% [1au] A? ns-557.awsdns-05.net. (49)

```

So that’s kind of interesting. I guess it makes sense that unbound would want to cache more nameserver addresses in case it needs them in the future. Or maybe that’s what the DNS specification says to do?

### is this a “recursive” program?

DNS resolvers are often called “recursive nameservers”. I’ve stopped using that terminology myself in explanations, but as far as I can tell, this is because the `resolve` function is often a recursive function.

And the `resolve` function I wrote is definitely recursive! But I ran this program on 500 different domains, and these are the number of times it recursed:

  1. Sometimes 0 times (the function never calls itself)
  2. Sometimes 1 time (the function calls itself once, to look up the IP address of one nameserver)
  3. Very rarely 2 times (like for example to resolve `abc.net.au.` right now it needs to look up `r.au.`, then `eur2.akam.net.` then `abc.net.au.`)
  4. So far, never 3 times



Maybe there’s a domain that this function would recurse more than 2 times on, but I don’t know.

You definitely _could_ write this program in a way that recurses more, by replacing the loop with more recursion. And then it would recurse 3 or 6 or 7 or 9 times, depending on the domain. But to me the loop feels easier to read so I wrote it with a loop instead.

### a bash version of this resolver

I wanted to see if it was possible to write a DNS resolver in 10-15 lines of bash, similarly to [this short “run a container” script][4]

The program I came up with was kind of too long in the end (it’s about 36 lines), but here it is anyway. It uses the exact same algorithm as the Go program.

<https://github.com/jvns/tiny-resolver/blob/main/resolver.sh>

The bash version is even more janky and uses `grep` in very questionable ways but it did resolve every domain I tried which is cool.

It actually helped me write the Go resolver (which I actually started back in November but got stuck on) because bash’s limitations forced me to simplify the design and simplifying it fixed a bug I was running into.

### how is this different from a “real” DNS resolver?

Obviously this is only 80 lines so there are a lot of differences between this an a “real” DNS resolver. Here are a few:

  * it only handles A records, not other record types
  * specifically it doesn’t handle CNAME records (though you can easily add CNAME support with just [another 12 lines of code][5])
  * it always only returns one A record even if there are more
  * it has absolutely no ability to handle errors like “there were no A records” (the Go program just panics)
  * the way it handles the glue records is a bit sketchy, probably it should check that they match the nameservers in the “Authority” section or something. It seems to work though.
  * DNS resolvers are usually servers, this is a command line program
  * it doesn’t validate DNSSEC or whatever
  * it doesn’t do caching
  * it doesn’t try a different nameserver if one of the domain’s nameservers isn’t working and times out the DNS query
  * like we mentioned above, unbound seems to look up the addresses of all the nameservers for a domain
  * probably there are other bugs and ways it violates the DNS spec that I don’t know about



### tiny versions of real programs are fun

As usual I always learn something from writing tiny versions of real programs. I’ve written this program before but I think this version is better than the first version I wrote.

In 2020 I ran a 2-day workshop with my friend Allison called “Domain Name Saturday” where all the participants wrote DNS resolvers. Basically the idea was that you implement the algorithm described in this post, as well as the binary parsing pieces that the `miekg/dns` library handles here. At some point I want to write up that workshop so that other people could run it, because it was really fun.

One question I still have is – are there domains where the `resolve` function would recurse 3 times or more on? Obviously you could manufacture such a domain by making it intentionally have to go through a bunch of hoops, but.. do they exist in the real world?

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/02/01/a-dns-resolver-in-80-lines-of-go/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com/comics/life-of-a-dns-query/life-of-a-dns-query.png
[2]: https://wizardzines.com/comics/life-of-a-dns-query/
[3]: http://www.maths.ox.ac.uk
[4]: https://gist.github.com/jvns/ea2e4d572b4e2285148b8e87f70eed73
[5]: https://github.com/jvns/tiny-resolver/commit/8a2dada63ec214ecf01046e3f57eb5406706b302
