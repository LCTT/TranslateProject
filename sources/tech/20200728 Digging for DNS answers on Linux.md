[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Digging for DNS answers on Linux)
[#]: via: (https://www.networkworld.com/article/3568488/digging-for-dns-answers-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Digging for DNS answers on Linux
======
Dig is a powerful and flexible tool for interrogating domain name system (DNS) servers. In this post, we’ll take a deep dive into how it works and what it can tell you.
[Laurie Avocado][1] [(CC BY 2.0)][2]

Dig is a powerful and flexible tool for interrogating DNS name servers. It performs DNS lookups and displays the answers that are returned from the name servers that were involved in the process along with details related to the search. System and [DNS][3] administrators often use **dig** to help troubleshoot DNS problems. In this post, we’ll take a deep dive into how it works and see what it can tell us.

To get started, it's helpful to have a good mental image of how DNS or domain name system works. It's a critical part of the global Internet because it provides a way to look up and, thereby, connect with servers around the world. You can think of it as the Internet's address book and any system that is properly connected to the Internet should be able to use it to look up the IP address of any properly registered server.

### Getting started with dig

The **dig** tool is generally installed on Linux systems by default. Here’s an example of a **dig** command with a little annotation:

```
$ dig www.networkworld.com

; <<>> DiG 9.16.1-Ubuntu <<>> www.networkworld.com <== version of dig you’re using
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 6034
;; flags: qr rd ra; QUERY: 1, ANSWER: 2, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 65494
;; QUESTION SECTION:                            <== details on your query
;www.networkworld.com.          IN      A

;; ANSWER SECTION:                              <== results

www.networkworld.com.   3568    IN      CNAME   idg.map.fastly.net.
idg.map.fastly.net.     30      IN      A       151.101.250.165

;; Query time: 36 msec                          <== query time
;; SERVER: 127.0.0.53#53(127.0.0.53)            <== local caching resolver
;; WHEN: Fri Jul 24 19:11:42 EDT 2020           <== date and time of inquiry
;; MSG SIZE  rcvd: 97                           <== bytes returned
```

If you get a response like this, is it good news?  The short answer is “yes”. You got a reply in a timely manner. The status field (status: NOERROR) shows there were no problems. You’re connecting to a name server that is able to supply the requested information and getting a reply that tells you some important details about the system you’re inquiring about. In short, you’ve verified that your system and the domain name system are getting along just fine.

Other possible status indicators include:

**SERVFAIL** – The name that was queried exists, but no data is available or available data is invalid.

**NXDOMAIN** – The name in question does not exist.

**REFUSED** – The zone does not exist at the requested authority and the infrastructure is not set up to provide responses when this is the case.

Here's an example of what you'd see if you were looking up a domain that doesn't exist:

```
$ dig cannotbe.org

; <<>> DiG 9.16.1-Ubuntu <<>> cannotbe.org
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NXDOMAIN, id: 35348
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1
```

In general, **dig** provides more details than **ping**, though **ping** will respond with "Name or service not known" if the domain doesn't exit. When you ask about a legitimate system, you get to see what the domain name system knows about the system, how those records are configured and how long it takes to retrieve that data.

In fact, sometimes **dig** can respond with information when **ping** cannot respond at all and that kind of information can be very helpful when you're trying to nail down a connection problem.

### DNS record types and flags

One thing we can see in the first query above is the presence of both **CNAME** and **A** records. The **CNAME** (canonical name) is like an alias that refers one domain name to another. Most systems that you dig for won’t have a **CNAME** record, but only an **A** record. If you run a “dig localhost” command, you will see an **A** record that simply refers to 127.0.0.1 – the "loopback" address that every system uses. An **A** record maps a name to an IP address.

The DNS record types include:

  * A or AAAA -– IPv4 and IPv6 addresses
  * CNAME –- alias
  * MX –- mail exchanger
  * NS –- name server
  * PTR –- a reversing entry that lets you find a system name when providing the IP address
  * SOA –- start of authority record
  * TXT –- some related text



We also see a series of “flags” on the fifth line of output. These are defined in [RFC 1035][4] which defines the flags included in the header of DNS messages and even shows the format of headers.

```
                                1  1  1  1  1  1
  0  1  2  3  4  5  6  7  8  9  0  1  2  3  4  5
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                      ID                       |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|QR|   Opcode  |AA|TC|RD|RA|   Z    |   RCODE   |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    QDCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    ANCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    NSCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
|                    ARCOUNT                    |
+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
```

The flags shown in the fifth line in the initial query above are:

  * **qr** = query
  * **rd** = recursion desired
  * **ra** = recursion available



Other flags described in the RFC include:

  * **aa** = authoritative answer
  * **cd** = checking disabled
  * **ad** = authentic data
  * **opcode** = a 4-bit field
  * **tc** = truncation
  * **z** (unused)



### Adding the +trace option

You will get a LOT more output from **dig** if you add **+trace** as an option. It will add information that shows how your DNS query rooted through the hierarchy of name servers to locate the answer you’re looking for.

All the **NS** records shown below reflect name servers – and this is just the first section of data you will see as the query runs through the hierarchy of name servers to track down what you're looking for. 

```
$ dig +trace networkworld.com

; <<>> DiG 9.16.1-Ubuntu <<>> +trace networkworld.com
;; global options: +cmd
.                       84895   IN      NS      k.root-servers.net.
.                       84895   IN      NS      e.root-servers.net.
.                       84895   IN      NS      m.root-servers.net.
.                       84895   IN      NS      h.root-servers.net.
.                       84895   IN      NS      c.root-servers.net.
.                       84895   IN      NS      f.root-servers.net.
.                       84895   IN      NS      a.root-servers.net.
.                       84895   IN      NS      g.root-servers.net.
.                       84895   IN      NS      l.root-servers.net.
.                       84895   IN      NS      d.root-servers.net.
.                       84895   IN      NS      b.root-servers.net.
.                       84895   IN      NS      i.root-servers.net.
.                       84895   IN      NS      j.root-servers.net.
;; Received 262 bytes from 127.0.0.53#53(127.0.0.53) in 28 ms
...
```

Eventually, you'll get information tied directly to your request.

```
networkworld.com.       300     IN      A       151.101.2.165
networkworld.com.       300     IN      A       151.101.66.165
networkworld.com.       300     IN      A       151.101.130.165
networkworld.com.       300     IN      A       151.101.194.165
networkworld.com.       14400   IN      NS      ns-d.pnap.net.
networkworld.com.       14400   IN      NS      ns-a.pnap.net.
networkworld.com.       14400   IN      NS      ns0.pcworld.com.
networkworld.com.       14400   IN      NS      ns1.pcworld.com.
networkworld.com.       14400   IN      NS      ns-b.pnap.net.
networkworld.com.       14400   IN      NS      ns-c.pnap.net.
;; Received 269 bytes from 70.42.185.30#53(ns0.pcworld.com) in 116 ms
```

### Picking your responder

You can use the **@** sign to specify a particular name server that you want to handle your query. Here we’re asking the primary name server for Google to respond to our query:

```
$ dig @8.8.8.8 networkworld.com

; <<>> DiG 9.16.1-Ubuntu <<>> @8.8.8.8 networkworld.com
; (1 server found)
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 43640
;; flags: qr rd ra; QUERY: 1, ANSWER: 4, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;networkworld.com.              IN      A

;; ANSWER SECTION:
networkworld.com.       299     IN      A       151.101.66.165
networkworld.com.       299     IN      A       151.101.194.165
networkworld.com.       299     IN      A       151.101.130.165
networkworld.com.       299     IN      A       151.101.2.165

;; Query time: 48 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Sat Jul 25 11:21:19 EDT 2020
;; MSG SIZE  rcvd: 109
```

The command shown below does a reverse lookup of the 8.8.8.8 IP address to show that it belongs to Google's DNS server.

```
$ nslookup 8.8.8.8
8.8.8.8.in-addr.arpa    name = dns.google.
```

#### Wrap-Up

The dig command is an essential tool for both grasping how DNS works and troubleshooting connection problems when they arise.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3568488/digging-for-dns-answers-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/auntylaurie/15997799384
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/article/3268449/what-is-dns-and-how-does-it-work.html
[4]: https://tools.ietf.org/html/rfc1035
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
