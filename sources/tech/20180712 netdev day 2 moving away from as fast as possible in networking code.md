FSSlc  is translating


netdev day 2: moving away from "as fast as possible" in networking code
============================================================

Hello! Today was day 2 of netdev. I only made it to the morning of the conference, but the morning was VERY EXCITING. The highlight of this morning was a keynote by [Van Jacobson][1] about the future of congestion control on the internet (!!!) called “Evolving from As Fast As Possible: Teaching NICs about time”

I’m going to try to summarize what I learned from this talk. I almost certainly have some things wrong, but let’s go!

This talk was about how the internet has changed since 1988, why we need new algorithms today, and how we can change Linux’s networking stack to implement those algorithms more easily.

### what’s congestion control?

Everyone on the internet is sending packets all at once, all the time. The links on the internet are of dramatically different speeds (some are WAY slower than others), and sometimes they get full! When a device on the internet receives packets at a rate faster than it can handle, it drops the packets.

The most naive you way you could imagine sending packets is:

1.  Send all the packets you have to send all at once

2.  If you discover any of those packets got dropped, resend the packet right away

It turns out that if you implemented TCP that way, the internet would collapse and grind to a halt. We know that it would collapse because it did kinda collapse, in 1986\. To fix this, folks invented congestion control algorithms – the original paper describing how they avoided collapsing the internet is [Congestion Avoidance and Control][2], by Van Jacobson from 1988\. (30 years ago!)

### How has the internet changed since 1988?

The main thing he said has changed about the internet is – it used to be that switches would always have faster network cards than servers on the internet. So the servers in the middle of the internet would be a lot faster than the clients, and it didn’t matter as much how fast clients sent packets.

Today apparently that’s not true! As we all know, computers today aren’t really faster than computers 5 years ago (we ran into some problems with the speed of light). So what happens (I think) is that the big switches in routers are not really that much faster than the NICs on servers in datacenters.

This is bad because it means that clients are much more easily able to saturate the links in the middle, which results in the internet getting slower. (and there’s [buffer bloat][3] which results in high latency)

So to improve performance on the internet and not saturate all the queues on every router, clients need to be a little better behaved and to send packets a bit more slowly.

### sending more packets more slowly results in better performance

Here’s an idea that was really surprising to me – sending packets more slowly often actually results in better performance (even if you are the only one doing it). Here’s why!

Suppose you’re trying to send 10MB of data, and there’s a link somewhere in the middle between you and the client you’re trying to talk to that is SLOW, like 1MB/s or something. Assuming that you can tell the speed of this slow link (more on that later), you have 2 choices:

1.  Send the entire 10MB of data at once and see what happens

2.  Slow it down so you send it at 1MB/s

Now – either way, you’re probably going to end up with some packet loss. So it seems like you might as well just send all the data at once if you’re going to end up with packet loss either way, right? No!! The key observation is that packet loss in the middle of your stream is much better than packet loss at the end of your stream. If a few packets in the middle are dropped, the client you’re sending to will realize, tell you, and you can just resend them. No big deal! But if packets at the END are dropped, the client has no way of knowing you sent those packets at all! So you basically need to time out at some point when you don’t get an ACK for those packets and resend it. And timeouts typically take a long time to happen!

So why is sending data more slowly better? Well, if you send data faster than the bottleneck for the link, what will happen is that all the packets will pile up in a queue somewhere, the queue will get full, and then the packets at the END of your stream will get dropped. And, like we just explained, the packets at the end of the stream are the worst packets to drop! So then you have all these timeouts, and sending your 10MB of data will take way longer than if you’d just sent your packets at the correct speed in the first place.

I thought this was really cool because it doesn’t require cooperation from anybody else on the internet – even if everybody else is sending all their packets really fast, it’s  _still_  more advantageous for you to send your packets at the correct rate (the rate of the bottleneck in the middle)

### how to tell the right speed to send data at: BBR!

Earlier I said “assuming that you can tell the speed of the slow link between your client and server…“. How do you do that? Well, some folks from Google (where Jacobson works) came up with an algorithm for measuring the speed of bottlenecks! It’s called BBR. This post is already long enough, but for more about BBR, see [BBR: Congestion-based congestion control][4] and [the summary from the morning paper][5].

(as an aside, [https://blog.acolyer.org][6]’s daily “the morning paper” summaries are basically the only way I learn about / understand CS papers, it’s possibly the greatest blog on the internet)

### networking code is designed to run “as fast as possible”

So! Let’s say we believe we want to send data a little more slowly, at the speed of the bottleneck in our connection. This is all very well, but networking software isn’t really designed to send data at a controlled rate! This (as far as I understand it) is how most networking stuff is designed:

1.  There’s a queue of packets coming in

2.  It reads off the queue and sends the packets out as as fast as possible

3.  That’s it

This is pretty inflexible! Like – suppose I have one really fast connection I’m sending packets on, and one really slow connection. If all I have is a queue to put packets on, I don’t get that much control over when the packets I’m sending actually get sent out. I can’t slow down the queue!

### a better way: give every packet an “earliest departure time”

His proposal was to modify the skb data structure in the Linux kernel (which is the data structure used to represent network packets) to have a TIMESTAMP on it representing the earliest time that packet should go out.

I don’t know a lot about the Linux network stack, but the interesting thing to me about this proposal is that it doesn’t sound like a huge change! It’s just an extra timestamp.

### replace queues with timing wheels!!!

Once we have all these packets with times on them, how do we get them sent out at the right time? TIMING WHEELS!

At Papers We Love a while back ([some good links in the meetup description][7]) there was a talk about timing wheels. Timing wheels are the algorithm the Linux process scheduler decides when to run processes.

He said that timing wheels actually perform better than queues for scheduling work – they both offer constant time operations, but the timing wheels constant is smaller because of some stuff to do with cache performance. I didn’t really follow the performance arguments.

One point he made about timing wheels is that you can easily implement a queue with a timing wheel (though not vice versa!) – if every time you add a new packet, you say that you want it to be sent RIGHT NOW at the earliest, then you effectively end up with a queue. So this timing wheel approach is backwards compatible, but it makes it much easier to implement more complex traffic shaping algorithms where you send out different packets at different rates.

### maybe we can fix the internet by improving Linux!

With any internet-scale problem, the tricky thing about making progress on it is that you need cooperation from SO MANY different parties to change how internet protocols are implemented. You have Linux machines, BSD machines, Windows machines, different kinds of phones, Juniper/Cisco routers, and lots of other devices!

But Linux is in kind of an interesting position in the networking landscape!

*   Android phones run Linux

*   Most consumer wifi routers run Linux

*   Lots of servers run Linux

So in any given network connection, you’re actually relatively likely to have a Linux machine at both ends (a linux server, and either a Linux router or Android device).

So the point is that if you want to improve congestion on the internet in general, it would make a huge difference to just change the Linux networking stack. (and maybe the iOS networking stack too) Which is why there was a keynote at this Linux networking conference about it!

### the internet is still changing! Cool!

I usually think of TCP/IP as something that we figured out in the 80s, so it was really fascinating to hear that folks think that there are still serious issues with how we’re designing our networking protocols, and that there’s work to do to design them differently.

And of course it makes sense – the landscape of networking hardware and the relative speeds of everything and the kinds of things people are using the internet for (netflix!) is changing all the time, so it’s reasonable that at some point we need to start designing our algorithms differently for the internet of 2018 instead of the internet of 1998.

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2018/07/12/netdev-day-2--moving-away-from--as-fast-as-possible/

作者：[Julia Evans][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://jvns.ca/about
[1]:https://en.wikipedia.org/wiki/Van_Jacobson
[2]:https://cs162.eecs.berkeley.edu/static/readings/jacobson-congestion.pdf
[3]:https://apenwarr.ca/log/?m=201101#10
[4]:https://queue.acm.org/detail.cfm?id=3022184
[5]:https://blog.acolyer.org/2017/03/31/bbr-congestion-based-congestion-control/
[6]:https://blog.acolyer.org/
[7]:https://www.meetup.com/Papers-We-Love-Montreal/events/235100825/
