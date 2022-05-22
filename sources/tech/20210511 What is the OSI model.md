[#]: subject: (What is the OSI model?)
[#]: via: (https://jvns.ca/blog/2021/05/11/what-s-the-osi-model-/)
[#]: author: (Julia Evans https://jvns.ca/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

What is the OSI model?
======

Today I tweeted something about how the OSI model doesn’t correspond well to the reality of how TCP/IP works and it made me think – what is the OSI model, exactly? From reading some of the replies on Twitter, it seems like there are at least 3 different ways to think about it:

  1. A literal description of how TCP/IP works
  2. An abstract model that you can use to describe and compare a lot of different networking protocols
  3. A literal description of some computer networking protocols from the 1980s that are mostly no longer used today



In this post I’m not going to try to argue that any one of these is “really” what the OSI model is – it seems like different people think about the OSI model in all of these ways, and that’s okay.

### the OSI model has 7 layers

Before we talk about what the OSI model means, let’s very briefly discuss what it is: it’s an abstract model for how networking works with 7 numbered layers:

  * Layer 1: physical layer
  * Layer 2: data link
  * Layer 3: network
  * Layer 4: transport
  * Layer 5: session
  * Layer 6: presentation
  * Layer 7: application



I won’t say more about what each of those is supposed to mean, there are a thousand explanations of it online.

### the OSI model as a literal description of how TCP/IP works

First, I want to talk about one common way people use the OSI model in practice: as a literal description of how TCP/IP works. Some layers of the OSI model are really easy to map to TCP/IP:

  * Layer 2 corresponds to Ethernet
  * Layer 3 corresponds to IP
  * Layer 4 corresponds to TCP or UDP (or ICMP etc)
  * Layer 7 corresponds to whatever is inside the TCP or UDP packet (for example a DNS query)



This mapping makes a lot of sense for layers 2, 3, and 4 – TCP packets have 3 headers corresponding to these 3 layers (the Ethernet header, the IP header, and the TCP header).

Having numbers to describe the different headers in a TCP packet is pretty useful – if you say “layer 2”, it’s clear that that lives “underneath” layer 3, because 2 is a smaller number than 3.

The weird thing about “OSI model as literal description” is that layers 5 and 6 don’t really correspond to anything in TCP/IP – I’ve heard a lot of different interpretations of what layers 5 or 6 could be (you could say layer 5 is TLS or something!) but they don’t have a clear correspondence like “every layer has a corresponding header in the TCP packet” the way layers 2, 3, and 4 do.

Also, some parts of TCP/IP don’t fit well into the OSI model even around layers 2-4 – for example, what layer is an ARP packet? ARP packets send some data with an Ethernet header, so does that mean they’re layer 3? Layer 2? The Wikipedia article listing different OSI layers categorizes it under “layer 2.5” which is pretty unsatisfying.

This is only really a problem because the OSI model is sometimes used to teach TCP/IP, and it’s confusing if it’s not made clear which parts of the model map well to TCP/IP and which don’t.

### the OSI model as an abstraction for comparing networking protocols

Another way of thinking of OSI that I’ve heard is that it’s an abstraction you can use to draw analogies between lots of different networking protocols. For example, if you want to understand how Bluetooth works, maybe you can use the OSI model to help you – here’s an diagram I found on [this page][1] showing how Bluetooth fits into the OSI model.

![][2]

As another example of this, [this Wikipedia article][3] has a list of OSI layers and which specific networking protocols correspond to those OSI layers.

### the OSI model as a literal description of some obsolete protocols

Some very brief research on Wikipedia says that in addition to an abstract description of 7 layers, the OSI model also contained a [bunch of specific protocols implementing those layers][4]. Apparently this happened during the [Protocol Wars][5] in the 70s and 80s, where the OSI model lost and TCP/IP won.

This explains why the OSI model doesn’t really correspond that well to TCP/IP, since if the OSI protocols had “won” then the OSI model _would_ correspond exactly to how internet networking actually works.

### that’s all!

I’m writing this because when I originally learned about the OSI model I found it super confusing (what are all these layers? are they real? is this actually how networking works? what’s happening?) and I wish someone had told me that (as someone who does not work with any networking protocols other than TCP/IP) I could just learn how layers 2, 3, 4, and 7 relate to TCP/IP and then ignore everything else about it. So hopefully this will help clear things up for somebody!

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2021/05/11/what-s-the-osi-model-/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://flylib.com/books/en/4.215.1.116/1/
[2]: https://jvns.ca/images/bluetooth.gif
[3]: https://en.wikipedia.org/wiki/List_of_network_protocols_(OSI_model)
[4]: https://en.wikipedia.org/wiki/OSI_protocols
[5]: https://en.wikipedia.org/wiki/Protocol_Wars
