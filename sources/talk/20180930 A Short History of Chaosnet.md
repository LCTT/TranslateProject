A Short History of Chaosnet
======
If you fire up `dig` and run a DNS query for `google.com`, you will get a response somewhat like the following:

```
$ dig google.com

; <<>> DiG 9.10.6 <<>> google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 27120
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;google.com.            IN  A

;; ANSWER SECTION:
google.com.     194 IN  A   216.58.192.206

;; Query time: 23 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Fri Sep 21 16:14:48 CDT 2018
;; MSG SIZE rcvd: 55
```

The output contains both a section describing the “question” you asked (“What is the IP address of `google.com`?”) and a section describing the answer you received. In the answer section, we see that `dig` found a single record with what looks to be five fields. The record’s type is indicated by the `A` in the fourth field from the left—this is an “address” record. To the right of the `A`, in the fifth field, we can see that the IP address for `google.com` is `216.58.192.206`. The `194` value in the second field specifies how long in seconds this particular record can be cached.

What does the `IN` field tell us? For an embarrassingly long time, I thought `IN` functioned as a preposition, so that every DNS record was saying something like “`google.com` is in `A` and has IP address `216.58.192.206`.” It turns out that `IN` actually stands for “internet.” The `IN` part of a DNS record tells us the record’s class.

Why might a DNS record have a class other than “internet”? What would that even mean? How do you search for a host that isn’t on the internet? It would seem that `IN` is the only value that could possibly make sense here. Indeed, when you try to ask for the address of `google.com` while specifying that you expect a record with a class other than `IN`, the DNS server you are asking will probably complain. In the below, when we try to ask for the IP address of `google.com` using the `HS` class, the name server at `8.8.8.8` (Google Public DNS) returns a status of `SERVFAIL`:

```
$ dig -c HS google.com

; <<>> DiG 9.10.6 <<>> -c HS google.com
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: SERVFAIL, id: 31517
;; flags: qr rd ra; QUERY: 1, ANSWER: 0, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 512
;; QUESTION SECTION:
;google.com.            HS  A

;; Query time: 34 msec
;; SERVER: 8.8.8.8#53(8.8.8.8)
;; WHEN: Tue Sep 25 14:48:10 CDT 2018
;; MSG SIZE rcvd: 39
```

So classes other than `IN` aren’t widely supported. But they do exist. In addition to `IN`, DNS records can have the `HS` class (as we’ve just seen) or the `CH` class. The `HS` class is reserved for use by a system called [Hesiod][1] that stores and distributes simple textual data using the Domain Name System. It is typically used in local environments as a stand-in for [LDAP][2]. The `CH` class is reserved for something called Chaosnet.

Today, the world belongs to TCP/IP. Those two protocols (together with UDP) govern most of the remote communication that happens between computers. But I think it’s wonderful that you can still find, hidden in the plumbing of the internet, traces of this other, long-extinct, evocatively named system. What was Chaosnet? And why did it go the way of the dinosaurs?

### A Machine Room at MIT

Chaosnet was developed in the 1970s by researchers at the MIT Artificial Intelligence Lab. It was created as a part of a larger effort to design and build a machine that could run the Lisp programming language more efficiently than a general-purpose computer.

Lisp was the brainchild of MIT professor John McCarthy, who pioneered the field of artificial intelligence. He first described Lisp to the world in [a paper][3] published in 1960. By 1962, an interpreter and a compiler had been written. Lisp introduced an astounding number of features that today we consider standard for many programming languages. It was the first language to have a garbage collector. It was the first to have a REPL. And it was the first to support dynamic typing. It found favor among programmers working in artificial intelligence and—to name just one example—was used to develop the famous [SHRDLU][4] demonstration, which allowed a human to dictate simple actions involving toy blocks to a computer in natural language.

The problem with Lisp was that it could be slow. Simple operations could take twice as long to execute as was typical with other languages because Lisp variables were type-checked at runtime and not just during compilation. Lisp’s garbage collector was known to take up to an entire second to run on the IBM 7090 at MIT. These performance issues were especially unwelcome because the AI researchers using Lisp were trying to build applications like SHRDLU that interacted with users in real time. In the late 1970s, a group of MIT Artificial Intelligence Lab researchers decided to address these problems by building machines specifically designed to run Lisp programs. These “Lisp machines” had more memory and a compact instruction set better-suited to Lisp. Type-checking would be done by dedicated circuitry, speeding it up by orders of magnitude. And unlike most computer systems at the time, Lisp machines would not be time-shared, since ambitious Lisp programs needed all the resources a computer had available. Each user would be assigned his or her own CPU. In a memo, the Lisp Machine Group at MIT described how this would make Lisp programming significantly easier:

> The Lisp Machine is a personal computer. Personal computing means that the processor and main memory are not time-division multiplexed, instead each person gets his own. The personal computation system consists of a pool of processors, each with its own main memory, and its own disk for swapping. When a user logs in, he is assigned a processor, and he has exclusive use of it for the duration of the session. When he logs out, the processor is returned to the pool, for the next person to use. This way, there is no competition from other users for memory; the pages the user is frequently referring to remain in core, and so swapping overhead is considerably reduced. Thus the Lisp Machine solves a basic problem of the time-sharing Lisp system.

The Lisp machine would be a personal computer in a different sense than the one we think of today. As the Lisp Machine Group originally envisioned it, users would sit down in their offices not in front of their own Lisp machines but in front of terminals. The terminals would be connected to the actual Lisp machine, which would be elsewhere. Even though each user would be assigned his or her own processor, the processors would still be “kept off in a machine room,” since they would make noise and take up space and thus be “unwelcome office companions.” The processors would share access to a file system and to devices like printers via a high-speed local network “with completely distributed control.” That network was Chaosnet.

Chaosnet is both a hardware standard and a software protocol. The hardware standard resembles Ethernet, and in fact the Chaosnet software protocol was eventually run over Ethernet. The software protocol, which specifies both network-layer and transport-layer interactions, was, unlike TCP/IP, always meant to govern a local network. In another memo released by the MIT Artificial Intelligence Lab, David Moon, a member of the Lisp Machine Group, explained that Chaosnet “contains no special provisions for things such as low-speed links, noisy links, multiple paths, and long-distance links with significant transit time.” The focus was instead on designing a protocol that could outperform other protocols on a small network.

Speed was important because Chaosnet sat between each Lisp processor and the file system. Network delays would significantly slow rudimentary operations like viewing the contents of a text document. To be fast enough, Chaosnet incorporated several improvements over the Network Control Program then in use on Arpanet. According to Moon, “it was important to design out bottlenecks such as are found in Arpanet, for instance the control-link which is shared between multiple connections and the need to acknowledge each message before the next message is sent.” The Chaosnet protocol batches packet acknowledgments in much the same way that TCP does today and so reduced the number of packets that needed to be transmitted by a half to a third.

Chaosnet could also get away with a relatively simple routing algorithm, since most hosts on the Lisp machine network were probably connected by a single, short wire. Moon wrote that the Chaosnet routing scheme “is predicated on the assumption that the network geometry is simple, there are few multiple paths, and the length of any path is quite short. This makes more sophisticated schemes unnecessary.” The simplicity of the algorithm meant that implementing the Chaosnet protocol was easy. The implementation program was supposedly half the size of the Arpanet Network Control Program.

The Chaosnet protocol has other idiosyncrasies. A Chaosnet address is only 16 bits, half the size of an IPv4 address, which makes sense given that Chaosnet was only ever meant to work on a local network. Chaosnet also doesn’t use port numbers; instead, a process that wants to connect to another process on a different machine first makes a connection request that specifies a target “contact name.” That contact name is often just the name of a particular service. For example, one host may try to connect to another host using the contact name `TELNET`. In practice, I assume this works more or less just like TCP, since something well-known like port 80 might as well have the contact name `HTTP`.

The Chaosnet DNS class was added to the Domain Name System by [RFC 973][5] in 1986. It replaced another class that had been available early on, the `CSNET` class, which was there to support a network called the Computer Science Network. I haven’t been able to figure out why Chaosnet was picked out for special treatment by the Domain Name System. There were other protocol families that could have been added but never were. For example, Paul Mockapetris, one of the principal architects of the Domain Name System, has written that he originally imagined that DNS would include a class for Xerox’s network protocol. That never happened. Chaosnet may have been added just because so much of the early work on Arpanet and the internet happened at Bolt, Beranek and Newman in Cambridge, Massachusetts, whose employees were often connected in some way with MIT. Chaosnet was probably well-known among the then relatively small group of people working on computer networks.

Usage of Chaosnet presumably waned as Lisp machines became less and less popular. Though Lisp machines were for a short time commercially viable products—sold by companies such as Symbolics and Lisp Machines Inc. during the 1980s—they were soon displaced by cheaper microcomputers that could run Lisp just as quickly without special-purpose circuitry. TCP/IP also fixed many of the issues with the original Arpanet protocols that Chaosnet had been created to circumvent.

### Ghost in the Shell

There unfortunately isn’t a huge amount of information still around about Chaosnet. RFC 675, which was essentially the first draft of TCP/IP, was published in 1974. Chaosnet was first developed in 1975. TCP/IP eventually conquered the world, but Chaosnet seems to have been a technological dead end. Though it’s possible that Chaosnet influenced subsequent work on TCP/IP, I haven’t found any specific examples of that happening.

The only really visible remnant of Chaosnet is the `CH` DNS class. There’s something about that fact that I find strangely fascinating. The `CH` class is a vestigial ghost of an alternative network protocol in a world that has long since settled on TCP/IP. It’s exciting, at least to me, to know that the last traces of Chaosnet still lurk out there in the infrastructure of our networked society. The `CH` DNS class is a fun artifact of digital archaeology. But it’s also a living reminder that the internet was not born fully formed, that TCP/IP is not the only way to connect computers to each other, and that “the internet” is far from the coolest name we could have had for our global communication system.

If you enjoyed this post, more like it come out every two weeks! Follow [@TwoBitHistory][6] on Twitter or subscribe to the [RSS feed][7] to make sure you know when a new post is out.

Previously on TwoBitHistory…

> Where did RSS come from? Why are there so many competing formats? Why don't people seem to use it that much anymore?
>
> Answers to these questions and many more in this week's post about RSS:<https://t.co/BsCN5GQidR>
>
> — TwoBitHistory (@TwoBitHistory) [September 17, 2018][8]

--------------------------------------------------------------------------------

via: https://twobithistory.org/2018/09/30/chaosnet.html

作者：[Two-Bit History][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://twobithistory.org
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Hesiod_(name_service)
[2]: https://en.wikipedia.org/wiki/Lightweight_Directory_Access_Protocol
[3]: http://www-formal.stanford.edu/jmc/recursive.pdf
[4]: https://en.wikipedia.org/wiki/SHRDLU
[5]: https://tools.ietf.org/html/rfc973
[6]: https://twitter.com/TwoBitHistory
[7]: https://twobithistory.org/feed.xml
[8]: https://twitter.com/TwoBitHistory/status/1041485204802756608?ref_src=twsrc%5Etfw
