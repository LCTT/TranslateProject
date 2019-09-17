[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Rating IoT devices to gauge their impact on your network)
[#]: via: (https://www.networkworld.com/article/3435136/rating-iot-devices-to-gauge-their-impact-on-your-network.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

Rating IoT devices to gauge their impact on your network
======
With the wide range of internet of things devices being connected to business networks, there’s no cookie-cutter solution to building networks to support them, but assessing their needs can help.
Natalya Burova / Getty Images

One difficulty designing [IoT][1] implementations is the large number of moving parts. Most IoT setups are built out of components from many different manufacturers – one company’s sensors here, another’s there, someone else handling the networking and someone else again making the backend.

To help you get a ballpark sense of what any given implementation will demand from your network, we’ve come up with a basic taxonomy for rating IoT endpoints. It’s got three main axes: delay tolerance, data throughput and processing power. Here is an explainer for each. (Terminology note: We’ll use “IoT setup” or “IoT implementation” to refer to the entirety of the IoT infrastructure being used by a given organization.)

**Learn about edge networking**

  * [How edge networking and IoT will reshape data centers][2]
  * [Edge computing best practices][3]
  * [How edge computing can help secure the IoT][4]



### Delay tolerance

Many IoT implementation don’t require the millisecond-scale delay tolerance that traditional enterprise networks can provide, so that opens up a lot of network-connectivity options and means that going for a lower-priced choice could prove very successful.

For example, a connected parking meter doesn’t need to report its status to the city more than once a minute or so (if that), so a delay-inducing wireless option like [LoRaWAN][5] might be perfectly acceptable. Some systems of that type even use standard cellular SMS services to send updates back to central hubs.

For less delay-tolerant applications, like a production line or oil and gas extraction, industrial Ethernet or particularly low-latency wireless links should be used. Older-generation orchestration systems usually have the actual handling of instructions and coordination between machines well in hand, but adding real-time analytics data to the mix can increase network demands.

### Data throughput

Again, networking pros used to dealing with nothing less than megabits per second should adjust their expectations here, as there are plenty of IoT devices that require as little as a few kilobits per second or even less.

Devices with low-bandwidth requirements include smart-building devices such as connected door locks and light switches that mostly say “open” or “closed” or “on” or “off.”

Fewer demands on a given data link opens up the possibility of using less-capable wireless technology. Low-power WAN and Sigfox might not have the bandwidth to handle large amounts of traffic, but they are well suited for connections that don’t need to move large amounts of data in the first place, and they can cover significant areas. The range of Sigfox is 3 to 50 km depending on the terrain, and for Bluetooth, it’s 100 meters to 1,000 meters, depending on the class of Bluetooth being used.

Conversely, an IoT setup such as multiple security cameras connected to a central hub to a backend for image analysis will require many times more bandwidth. In such a case the networking piece of the puzzle will have to be more capable and, consequently, more expensive. Widely distributed devices could demand a dedicated [LTE][6] connection, for example, or perhaps even a microcell of their own for coverage.

Network World / IDG

### Processing power

The degree to which an IoT device is capable of doing its own processing is a somewhat indirect measurement of its impact on your network, to be sure, but it’s still relevant in terms of comparing it to other devices that perform a similar function. A device that’s constantly streaming raw data onto the network, without performing any meaningful analysis or shaping of its own, can be a bigger traffic burden than one that’s doing at least some of the work.

That’s not always the case, of course. Many less-capable devices won’t generate a lot of data with which to clog up whatever network connection they have, while some more-capable ones (let’s say industrial robots with a lot of inbuilt power to processing data they collect) might still generate plenty of traffic.

But the onboard computing power of a device is still relevant when comparing it to others that perform similar jobs, particularly in sectors like manufacturing and energy extraction where a lot of analysis has to be performed somewhere, whether it’s on the device, at the edge or at the back end.

It’s even more relevant in the context of an edge setup, where some or all of the data analysis is done on an [edge-gateway device][7] located close to the endpoints. These gateways can be a good choice when fairly complicated analysis has to be performed as close to real-time as possible. But edge gateways don’t have the same resources available as a full-on [data center][8] or cloud so the amount of work that can be done on the endpoint itself remains a crucial concern. Synthesizing raw information into analysis can mean less traffic that has to go on the network.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3435136/rating-iot-devices-to-gauge-their-impact-on-your-network.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3207535/what-is-iot-how-the-internet-of-things-works.html
[2]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[3]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[4]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[5]: https://www.networkworld.com/article/3235124/internet-of-things-definitions-a-handy-guide-to-essential-iot-terms.html
[6]: https://www.networkworld.com/article/3432938/when-private-lte-is-better-than-wi-fi.html
[7]: https://www.networkworld.com/article/3327197/edge-gateways-flexible-rugged-iot-enablers.html
[8]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
