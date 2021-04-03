[#]: subject: (A tool to spy on your DNS queries: dnspeep)
[#]: via: (https://jvns.ca/blog/2021/03/31/dnspeep-tool/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

A tool to spy on your DNS queries: dnspeep
======

Hello! Over the last few days I made a little tool called [dnspeep][1] that lets you see what DNS queries your computer is making, and what responses it’s getting. It’s about [250 lines of Rust right now][2].

I’ll talk about how you can try it, what it’s for, why I made it, and some problems I ran into while writing it.

### how to try it

I built some binaries so you can quickly try it out.

For Linux (x86):

```
wget https://github.com/jvns/dnspeep/releases/download/v0.1.0/dnspeep-linux.tar.gz
tar -xf dnspeep-linux.tar.gz
sudo ./dnspeep
```

For Mac:

```
wget https://github.com/jvns/dnspeep/releases/download/v0.1.0/dnspeep-macos.tar.gz
tar -xf dnspeep-macos.tar.gz
sudo ./dnspeep
```

It needs to run as root because it needs access to all the DNS packets your computer is sending. This is the same reason `tcpdump` needs to run as root – it uses `libpcap` which is the same library that tcpdump uses.

You can also read the source and build it yourself at <https://github.com/jvns/dnspeep> if you don’t want to just download binaries and run them as root :).

### what the output looks like

Here’s what the output looks like. Each line is a DNS query and the response.

```
$ sudo dnspeep
query   name                 server IP      response
A       firefox.com          192.168.1.1    A: 44.235.246.155, A: 44.236.72.93, A: 44.236.48.31
AAAA    firefox.com          192.168.1.1    NOERROR
A       bolt.dropbox.com     192.168.1.1    CNAME: bolt.v.dropbox.com, A: 162.125.19.131
```

Those queries are from me going to `neopets.com` in my browser, and the `bolt.dropbox.com` query is because I’m running a Dropbox agent and I guess it phones home behind the scenes from time to time because it needs to sync.

### why make another DNS tool?

I made this because I think DNS can seem really mysterious when you don’t know a lot about it!

Your browser (and other software on your computer) is making DNS queries all the time, and I think it makes it seem a lot more “real” when you can actually see the queries and responses.

I also wrote this to be used as a debugging tool. I think the question “is this a DNS problem?” is harder to answer than it should be – I get the impression that when trying to check if a problem is caused by DNS people often use trial and error or guess instead of just looking at the DNS responses that their computer is getting.

### you can see which software is “secretly” using the Internet

One thing I like about this tool is that it gives me a sense for what programs on my computer are using the Internet! For example, I found out that something on my computer is making requests to `ping.manjaro.org` from time to time for some reason, probably to check I’m connected to the internet.

A friend of mine actually discovered using this tool that he had some corporate monitoring software installed on his computer from an old job that he’d forgotten to uninstall, so you might even find something you want to remove.

### tcpdump is confusing if you’re not used to it

My first instinct when trying to show people the DNS queries their computer is making was to say “well, use tcpdump”! And `tcpdump` does parse DNS packets!

For example, here’s what a DNS query for `incoming.telemetry.mozilla.org.` looks like:

```
11:36:38.973512 wlp3s0 Out IP 192.168.1.181.42281 > 192.168.1.1.53: 56271+ A? incoming.telemetry.mozilla.org. (48)
11:36:38.996060 wlp3s0 In  IP 192.168.1.1.53 > 192.168.1.181.42281: 56271 3/0/0 CNAME telemetry-incoming.r53-2.services.mozilla.com., CNAME prod.data-ingestion.prod.dataops.mozgcp.net., A 35.244.247.133 (180)
```

This is definitely possible to learn to read, for example let’s break down the query:

`192.168.1.181.42281 > 192.168.1.1.53: 56271+ A? incoming.telemetry.mozilla.org. (48)`

  * `A?` means it’s a DNS **query** of type A
  * `incoming.telemetry.mozilla.org.` is the name being qeried
  * `56271` is the DNS query’s ID
  * `192.168.1.181.42281` is the source IP/port
  * `192.168.1.1.53` is the destination IP/port
  * `(48)` is the length of the DNS packet



And in the response breaks down like this:

`56271 3/0/0 CNAME telemetry-incoming.r53-2.services.mozilla.com., CNAME prod.data-ingestion.prod.dataops.mozgcp.net., A 35.244.247.133 (180)`

  * `3/0/0` is the number of records in the response: 3 answers, 0 authority, 0 additional. I think tcpdump will only ever print out the answer responses though.
  * `CNAME telemetry-incoming.r53-2.services.mozilla.com`, `CNAME prod.data-ingestion.prod.dataops.mozgcp.net.`, and `A 35.244.247.133` are the three answers
  * `56271` is the responses ID, which matches up with the query’s ID. That’s how you can tell it’s a response to the request in the previous line.



I think what makes this format the most difficult to deal with (as a human who just wants to look at some DNS traffic) though is that you have to manually match up the requests and responses, and they’re not always on adjacent lines. That’s the kind of thing computers are good at!

So I decided to write a little program (`dnspeep`) which would do this matching up and also remove some of the information I felt was extraneous.

### problems I ran into while writing it

When writing this I ran into a few problems.

  * I had to patch the `pcap` crate to make it work properly with Tokio on Mac OS ([this change][3]). This was one of those bugs which took many hours to figure out and 1 line to fix :)
  * Different Linux distros seem to have different versions of `libpcap.so`, so I couldn’t easily distribute a binary that dynamically links libpcap (you can see other people having the same problem [here][4]). So I decided to statically compile libpcap into the tool on Linux. I still don’t really know how to do this properly in Rust, but I got it to work by copying the `libpcap.a` file into `target/release/deps` and then just running `cargo build`.
  * The `dns_parser` crate I’m using doesn’t support all DNS query types, only the most common ones. I probably need to switch to a different crate for parsing DNS packets but I haven’t found the right one yet.
  * Becuase the `pcap` interface just gives you raw bytes (including the Ethernet frame), I needed to [write code to figure out how many bytes to strip from the beginning to get the packet’s IP header][5]. I’m pretty sure there are some cases I’m still missing there.



I also had a hard time naming it because there are SO MANY DNS tools already (dnsspy! dnssnoop! dnssniff! dnswatch!). I basically just looked at every synonym for “spy” and then picked one that seemed fun and did not already have a DNS tool attached to it.

One thing this program doesn’t do is tell you which process made the DNS query, there’s a tool called [dnssnoop][6] I found that does that. It uses eBPF and it looks cool but I haven’t tried it.

### there are probably still lots of bugs

I’ve only tested this briefly on Linux and Mac and I already know of at least one bug (caused by not supporting enough DNS query types), so please report problems you run into!

The bugs aren’t dangerous though – because the libpcap interface is read-only the worst thing that can happen is that it’ll get some input it doesn’t understand and print out an error or crash.

### writing small educational tools is fun

I’ve been having a lot of fun writing small educational DNS tools recently.

So far I’ve made:

  * <https://dns-lookup.jvns.ca> (a simple way to make DNS queries)
  * <https://dns-lookup.jvns.ca/trace.html> (shows you exactly what happens behind the scenes when you make a DNS query)
  * this tool (`dnspeep`)



Historically I’ve mostly tried to explain existing tools (like `dig` or `tcpdump`) instead of writing my own tools, but often I find that the output of those tools is confusing, so I’m interested in making more friendly ways to see the same information so that everyone can understand what DNS queries their computer is making instead of just tcpdump wizards :).

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/03/31/dnspeep-tool/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://github.com/jvns/dnspeep
[2]: https://github.com/jvns/dnspeep/blob/f5780dc822df5151f83703f05c767dad830bd3b2/src/main.rs
[3]: https://github.com/ebfull/pcap/pull/168
[4]: https://github.com/google/gopacket/issues/734
[5]: https://github.com/jvns/dnspeep/blob/f5780dc822df5151f83703f05c767dad830bd3b2/src/main.rs#L136
[6]: https://github.com/lilydjwg/dnssnoop
