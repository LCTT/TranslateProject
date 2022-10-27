[#]: subject: "Why do domain names sometimes end with a dot?"
[#]: via: "https://jvns.ca/blog/2022/09/12/why-do-domain-names-end-with-a-dot-/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Why do domain names sometimes end with a dot?
======

Hello! When I was writing the zine [How DNS Works][1] earlier this year, someone asked me – why do people sometimes put a dot at the end of a domain name? For example, if you look up the IP for `example.com` by running `dig example.com`, you’ll see this:

```

    $ dig example.com
    example.com.        5678    IN  A   93.184.216.34

```

`dig` has put a `.` to the end of `example.com` – now it’s `example.com.`! What’s up with that?

Also, some DNS tools require domains to have a `"."` at the end: if you try to pass `example.com` to [miekg/dns][2], like this, it’ll fail:

```

    // trying to send this message will return an error
    m := new(dns.Msg)
    m.SetQuestion("example.com", dns.TypeA)

```

Originally I thought I knew the answer to this (“uh, the dot at the end means the domain is fully qualified?“). And that’s true – a fully qualified domain name is a domain with a “.” at the end!

But that doesn’t explain _why_ dots at the end are useful or important.

### in a DNS request/response, domain names don’t have a trailing “.”

I once (incorrectly) thought the answer to “why is there a dot at the end?” might be “In a DNS request/response, domain names have a “.” at the end, so we put it in to match what actually gets sent/received by your computer”. But that’s not true at all!

When a computer sends a DNS request or response, the domain names in it don’t have a trailing dot. Actually, the domain names don’t have _any_ dots.

Instead, they’re encoded as a series of length/string pairs. For example, the domain `example.com` is encoded as these 13 bytes:

```

    7example3com0

```

So there are no dots at all. Instead, an ASCII domain name (like “example.com”) gets translated into the format used in a DNS request / response by various DNS software.

So let’s talk about one place where domain names are translated into DNS responses: zone files.

### the trailing “.” in zone files

One way that some people manage DNS records for a domain is to create a text file called a “zone file” and then configure some DNS server software (like `nsd` or `bind`) to serve the DNS records specified in that zone file.

Here’s an imaginary zone file for `example.com`:

```

    orange  300   IN    A     1.2.3.4
    fruit   300   IN    CNAME orange
    grape   3000  IN    CNAME example.com.

```

In this zone file, anything that doesn’t end in a `"."` (like `"orange"`) gets `.example.com` added to it. So `"orange"` is shorthand for `"orange.example.com"`. The DNS server knows from its configuration that this is a zone file for `example.com`, so it knows to automatically append `example.com` at the end of any name that doesn’t end with a dot.

I assume the idea here is just to save typing – you could imagine writing this zone file by fully typing out all of the domain names:

```

    orange.example.com.  300   IN    A     1.2.3.4
    fruit.example.com.   300   IN    CNAME orange.example.com.
    grape.example.com.   3000  IN    CNAME example.com.

```

But that’s a lot of typing.

### you don’t need zone files to use DNS

Even though the zone file format is defined in the official DNS RFC ([RFC 1035][3]), you don’t have to use zone files at all to use DNS. For example, AWS Route 53 doesn’t use zone files to store DNS records! Instead you create records through the web interface or API, and I assume they store records in some kind of database and not a bunch of text files.

Route 53 (like many other DNS tools) does support importing and exporting zone files though and it can be a good way to migrate records from one DNS provider to another.

### the trailing “.” in dig

Now, let’s talk about `dig`’s output:

```

    $ dig example.com
    ; <<>> DiG 9.18.1-1ubuntu1.1-Ubuntu <<>> +all example.com
    ;; global options: +cmd
    ;; Got answer:
    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 10712
    ;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

    ;; OPT PSEUDOSECTION:
    ; EDNS: version: 0, flags:; udp: 65494
    ;; QUESTION SECTION:
    ;example.com.           IN  A

    ;; ANSWER SECTION:
    example.com.        81239   IN  A   93.184.216.34

```

One weird thing about this is that almost every line starts with a `;;`. What’s up with that? Well `;` is the comment character in zone files!

So I think the reason that dig prints out its output in this weird way is so that if you wanted, you could just paste this into a zone file and have it work without any changes.

This also explains why there’s a `.` at the end of `example.com.` – zone files require a trailing dot at the end of a domain name (because otherwise they’re interpreted as being relative to the zone). So `dig` does too.

I really wish dig had a `+human` flag that printed out all of this information in a more human readable way, but for now I’m too lazy to put in the work to actually contribute code to do that (and I’m a pretty bad C programmer) so I’ll just complain about it on my blog instead :)

### the trailing `"."` in curl

Let’s talk about another case where the trailing `"."` shows up: curl!

One of the computers in my house is called “grapefruit”, and it’s running a webserver. Here’s what happens if I run `curl grapefruit`:

```

    $ curl grapefruit
    <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

    <html>
    <head>

```

It works! Cool. But what happens if I add a `.` at the end? Suddenly it doesn’t work:

```

    $ curl grapefruit.
    curl: (6) Could not resolve host: grapefruit.

```

What’s going on? To understand, we need to learn about search domains:

### meet search domains

When I run `curl grapefrult`, how does that get translated into a DNS request? You might think that my computer would send a request for the domain `grapefruit`, right? But that’s not true.

Let’s use `tcpdump` to see what domain is actually being looked up:

```

    $ sudo tcpdump -i any port 53
    [...] A? grapefruit.lan. (32)

```

It’s actually sending a request for `grapefruit.lan`. What’s up with that?

Well, what’s going on is that:

  1. To look up `grapefruit`, `curl` calls a function called `getaddrinfo`

  2. `getaddrinfo` looks in a file on my computer called `/etc/resolv.conf`

  3. `/etc/resolv.conf` contains these 2 lines:

```
     nameserver 127.0.0.53
    search lan

```

  4. Because it sees `search lan`, `getaddrinfo` adds a `lan` at the end of `grapefruit` and looks up `grapefruit.lan` instead




### when are search domains used?

Now we know something weird: that when we look up a domain, sometimes an extra thing (like `lan`) will be added to the end. But when does that happen?

  1. If we put a `"."` at the **end** of the domain (like `curl grapefruit.`, then search domains aren’t used
  2. If the domain has an `"."` **inside** it (like `example.com` has a dot in it), then by default search domains aren’t used either. But this can be changed with configuration (see this blog post about [ndots][4] that talks about this more)



So now we know why `curl grapefruit.` has different results than `curl grapefruit` – it’s because one looks up the domain `grapefruit.` and the other one looks up `grapefruit.lan.`

### how does my computer know what search domain to use?

When I connect to my router, it tells me that its search domain is `lan` with DHCP – it’s the same way that my computer gets assigned an IP address.

### so why do people put a dot at the end of domain names?

Now that we know about zone files and search domains, here’s why I think people like to put dots at the end of a domain name.

There are two contexts where domain names are modified and get something else added to the end:

  * in a zone file for `example.com`, `grapefruit` get translated to `grapefruit.example.com`
  * on my local network (with my computer configured to use the search domain `lan`), `grapefruit` gets translated to `grapefruit.lan`



So because domain names can actually be translated to something else in some cases, people like to put a `"."` at the end to communicate “THIS IS THE DOMAIN NAME, NOTHING GETS ADDED AT THE END, THIS IS THE WHOLE THING”. Because otherwise it can get confusing.

The technical term for “THIS IS THE WHOLE THING” is **“fully qualified domain name”** or **“FQDN”**. So `google.com.` is a fully qualified domain name, and `google.com` isn’t.

I always have to remind myself for the reasons for this because I rarely use zone files or search domains, so I often feel like – “of course I mean `google.com` and not `google.com.something.else`! Why would I mean anything else?? That’s silly!”

But some people do use zone files and search domains (search domains are used in Kubernetes, for example!), so the “.” at the end is useful to make it 100% clear that nothing else should be added.

### when to put a “.” at the end?

Here are a couple of quick notes about when to put a “.” at the end of your domain names:

**Yes: when configuring DNS**

It’s never bad to use fully qualified domain names when configuring DNS. You don’t always have to: a non-fully-qualified domain name will often work just fine as well, but I’ve never met a piece of DNS software that wouldn’t accept a fully qualified domain name.

And some DNS software requires it: right now the DNS server I use for `jvns.ca` makes me put a `"."` at the end of domains names (for example in CNAME records) and warns me otherwise it’ll append `.jvns.ca` to whatever I typed in. I don’t agree with this design decision but it’s not a big deal, I just put a “.” at the end.

**No: in a browser**

Confusingly, it often _doesn’t_ work to put a `"."` at the end of a domain name in a browser! For example, if I type `https://twitter.com.` into my browser, it doesn’t work! It gives me a 404.

I think what’s going on here is that it’s setting the HTTP Host header to `Host: twitter.com.` and the web server on the other end is expecting `Host: twitter.com`.

Similarly, `https://jvns.ca.` gives me an SSL error for some reason.

### I think relative domain names used to be more common

One last thing: I think that “relative” domain names (like me using `grapefruit` to refer to the other computer in my house, `grapefruit.lan`) used to be more commonly used, because DNS was developed in the context of universities or other big institutions which have big internal networks.

On the internet today, it seems like it’s more common to use “absolute” domain names (like `example.com`).

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/09/12/why-do-domain-names-end-with-a-dot-/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://wizardzines.com/zines/dns/
[2]: https://github.com/miekg/dns
[3]: https://www.rfc-editor.org/rfc/rfc1035#section-4.1.1
[4]: https://pracucci.com/kubernetes-dns-resolution-ndots-options-and-why-it-may-affect-application-performances.html
