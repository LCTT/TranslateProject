[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Performance-Based Routing (PBR) – The gold rush for SD-WAN)
[#]: via: (https://www.networkworld.com/article/3387152/performance-based-routing-pbr-the-gold-rush-for-sd-wan.html#tk.rss_all)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

Performance-Based Routing (PBR) – The gold rush for SD-WAN
======
The inefficiency factor in the case of traditional routing is one of the main reasons why SD-WAN is really taking off.
![Getty Images][1]

BGP (Border Gateway Protocol) is considered the glue of the internet. If we view through the lens of farsightedness, however, there’s a question that still remains unanswered for the future. Will BGP have the ability to route on the best path versus the shortest path?

There are vendors offering performance-based solutions for BGP-based networks. They have adopted various practices, such as, sending out pings to monitor the network and then modifying the BGP attributes, such as the AS prepending to make BGP do the performance-based routing (PBR). However, this falls short in a number of ways.

The problem with BGP is that it's not capacity or performance aware and therefore its decisions can sink the application’s performance. The attributes that BGP relies upon for path selection are, for example, AS-Path length and multi-exit discriminators (MEDs), which do not always correlate with the network’s performance.

[The time of 5G is almost here][2]

Also, BGP changes paths only in reaction to changes in the policy or the set of available routes. It traditionally permits the use of only one path to reach a destination. Hence, traditional routing falls short as it doesn't always look for the best path which may not be the shortest path.

### Blackout and brownouts

As a matter of fact, we live in a world where we have more brownouts than blackouts. However, BGP was originally designed to detect only the blackouts i.e. the events wherein a link fails to reroute the traffic to another link. In a world where brownouts can last from 10 milliseconds to 10 seconds, you ought to be able to detect the failure in sub-seconds and re-route to a better path.

This triggered my curiosity to dig out some of the real yet significant reasons why [SD-WAN][3] was introduced. We all know it saves cost and does many other things but were the inefficiencies in routing one of the main reasons? I decided to sit down with [Sorell][4] to discuss the need for policy-based routing (PBR).

### SD-WAN is taking off

The inefficiency factor in the case of traditional routing is one of the main reasons why SD-WAN is really taking off. SD-WAN vendors are adding proprietary mechanisms to their routing in order to select the best path, not the shortest path.

Originally, we didn't have real-time traffic, such as, voice and video, which is latency and jitter sensitive. Besides, we also assumed that all links were equal. But in today's world, we witness more of a mix and match, for example, 100Gig and slower long-term evolution (LTE) links. The assumption that the shortest path is the best no longer holds true.

### Introduction of new protocols

To overcome the drawbacks of traditional routing, we have had the onset of new protocols, such as, [IPv6 segment routing][5] and named data networking along with specific SD-WAN vendor mechanisms that improve routing.

For optimum routing, effective packet steering is a must. And SD-WAN overlays provide this by utilizing encapsulation which could be a combination of GRE, UDP, Ethernet, MPLS, [VxLAN][6] and IPsec. IPv6 segment routing implements a stack of segments (IPv6 address list) inserted in every packet and the named data networking can be distributed with routing protocols.

Another critical requirement is the hop-by-hop payload encryption. You should be able to encrypt payloads for sessions that do not have transport layer encryption. Re-encrypting data can be expensive; it fragments the packets and further complicates the networks. Therefore, avoiding double encryption is also a must.

The SD-WAN overlays furnish an all or nothing approach with [IPsec][7]. IPv6 segment routing requires application layer security that is provided by [IPsec][8] and named data network can offer since it’s object-based.

### The various SD-WAN solutions

The above are some of the new protocols available and some of the technologies that the SD-WAN vendors offer. Different vendors will have different mechanisms to implement PBR. Different vendors term PBR with different names, such as, “application-aware routing.”

SD-WAN vendors are using many factors to influence the routing decision. They are not just making routing decisions on the number of hops or links the way traditional routing does by default. They monitor how the link is performing and do not just evaluate if the link is up or down.

They are using a variety of mechanisms to perform PBR. For example, some are adding timestamps to every packet. Whereas, others are adding sequence numbers to the packets over and above what you would get in a transmission control protocol (TCP) sequence number.

Another option is the use of the domain name system (DNS) and [transport layer security][9] (TLS) certificates to automatically identify the application and then based on the identity of the application; they have default classes for it. However, others use timestamps by adding a proprietary label. This is the same as adding a sequence number to the packets, but the sequence number is at Layer 3 instead of Layer 4.

I can tie all my applications and sequence numbers and then use the network time protocol (NTP) to identify latency, jitter and dropped packets. Running NTP on both ends enables the identification of end-to-end vs hop-by-hop performance.

Some vendors use an internet control message protocol (ICMP) or bidirectional forwarding detection (BFD). Hence, instead of adding a label to every packet which can introduce overhead, they are doing a sampling for every quarter or half a second.

Realistically, it is yet to be determined which technology is the best to use, but what is consistent is that these mechanisms are examining elements, such as, the latency, dropped packets and jitter on the links. Essentially, different vendors are using different technologies to choose the best path, but the end result is still the same.

With these approaches, one can, for example, identify a WebEx session and since a WebEx session has voice and video, can create that session as a high-priority session. All packets associated with the WebEx sessions get placed in a high-value queue.

The rules are set to say, “I want my WebEx session to go over the multiprotocol label switching (MPLS) link instead of a slow LTE link.” Hence, if your MPLS link faces latency or jitter problems, it automatically reroutes the flow to a better alternate path.

### Problems with TCP

One critical problem that surfaces today due to the transmission control protocol (TCP) and adaptive codex is called waves. Let’s say you have 30 file transfers across a link, now to carry out the file transfers, the TCP window size will grow to a point where the link gets maxed out. The router will start to drop packets, followed by the reduced TCP window size. As a result, the bandwidth shrinks and at times when not dropping packets the window size increases. This hits the threshold and eventually, the packets start getting dropped again.

This can be a continuous process, happening again and again. With all these waves obstructing the efficiency, we need products, like wide area network (WAN) optimizations to manage multiple TCP flows. Why? Because only TCP is aware of the flow that it controls, the single flow. It is not the networking aware of other flows moving across the path. Primarily, the TCP window size is only aware of one single file transfer.

### Problems with adaptive codex

Adaptive codex will use upward of 6 megabytes of the video if the link is clean but as soon as it starts to drop packets, the adaptive codex will send more packets for forwarding error-control in the codex. Therefore, it makes the problem even worse before it backs off to change the frame rate and resolution.

Adaptive codex is the opposite of fixed codex that will always send out a fixed packet size. Adaptive codex is the standard used in WebRTC and can vary the jitter, buffer size and the frequency of packets based on the network conditions.

Adaptive codex works better off Internet connections that have higher loss and jitter rate than, for example, more stable links, such as MPLS. This is the reason why real-time voice and the video does not use TCP because if the packet gets dropped, there is no point in sending a new packet. Logically, having the additional headers of TCP does not buy you anything.

QUIC, on the other hand, can take a single flow and run it across multiple network-flows. This helps the video applications in rebuffering and improves throughput. In addition, it helps in boosting the response for bandwidth-intensive applications.

### The introduction of new technologies

With the introduction of [edge computing][10], augmented reality (AR), virtual reality (VR), real-time driving applications, [IoT sensors][11] on critical systems and other hypersensitive latency applications, PBR becomes a necessity.

With AR you want the computing to be accomplished between 5 to 10 milliseconds of the endpoint. In the world of brownouts and path congestion, you need to pick a better path much more quickly. Also, service providers (SP) are rolling out 5G networks and announcing the use of different routing protocols that are being used as PBR. So the future looks bright for PBR.

As voice and video, edge and virtual reality gain more existence in the market, PBR will become more popular. Even Facebook and Google are putting PBR inside their internal networks. Over time it will have a role in all the networks, specifically, the Internet Exchange points, both private and public.

### Internet exchange points

Back in the early 90s, there were only 4 internet exchange points in the US and 9 across the world overall. Now we have more than 3,000 where different providers have come together, and they exchange Internet traffic.

When BGP was first rolled out in the mid-‘90s, because the internet exchange points were located far apart, the concept of shortest path held true more than today, where you have an internet that is highly distributed.

The internet architecture will get changed as different service providers move to software-defined networking and update the routing protocols that they use. As far as the foreseeable future is concerned, however, the core internet exchanges will still use BGP.

**This article is published as part of the IDG Contributor Network.[Want to Join?][12]**

Join the Network World communities on [Facebook][13] and [LinkedIn][14] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387152/performance-based-routing-pbr-the-gold-rush-for-sd-wan.html#tk.rss_all

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/10/smart-city_iot_digital-transformation_networking_wireless_city-scape_skyline-100777499-large.jpg
[2]: https://www.networkworld.com/article/3354477/mobile-world-congress-the-time-of-5g-is-almost-here.html
[3]: https://network-insight.net/2017/08/sd-wan-networks-scalpel/
[4]: https://techvisionresearch.com/
[5]: https://network-insight.net/2015/07/segment-routing-introduction/
[6]: https://youtu.be/5XtkCSfRy3c
[7]: https://network-insight.net/2015/01/design-guide-ipsec-fault-tolerance/
[8]: https://network-insight.net/2015/01/ipsec-virtual-private-network-vpn-overview/
[9]: https://network-insight.net/2015/10/back-to-basics-ssl-security/
[10]: https://youtu.be/5mbPiKd_TFc
[11]: https://network-insight.net/2016/11/internet-of-things-iot-networking/
[12]: /contributor-network/signup.html
[13]: https://www.facebook.com/NetworkWorld/
[14]: https://www.linkedin.com/company/network-world
