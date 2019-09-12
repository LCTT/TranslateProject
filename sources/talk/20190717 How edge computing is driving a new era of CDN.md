[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How edge computing is driving a new era of CDN)
[#]: via: (https://www.networkworld.com/article/3409027/how-edge-computing-is-driving-a-new-era-of-cdn.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

How edge computing is driving a new era of CDN
======
A CDN is an edge application and an edge application is a superset of what your CDN is doing.
![geralt \(CC0\)][1]

We are living in a hyperconnected world where anything can now be pushed to the cloud. The idea of having content located in one place, which could be useful from the management’s perspective, is now redundant. Today, the users and data are omnipresent.

The customer’s expectations have up-surged because of this evolution. There is now an increased expectation of high-quality service and a decrease in customer’s patience. In the past, one could patiently wait 10 hours to download the content. But this is certainly not the scenario at the present time. Nowadays we have high expectations and high-performance requirements but on the other hand, there are concerns as well. The internet is a weird place, with unpredictable asymmetric patterns, buffer bloat and a list of other [performance-related problems][2] that I wrote about on Network Insight. _[Disclaimer: the author is employed by Network Insight.]_

Also, the internet is growing at an accelerated rate. By the year 2020, the internet is expected to reach 1.5 Gigabyte of traffic per day per person. In the coming times, the world of the Internet of Things (IoT) driven by objects will far supersede these data figures as well. For example, a connected airplane will generate around 5 Terabytes of data per day. This spiraling level of volume requires a new approach to data management and forces us to re-think how we delivery applications.

[RELATED: How Notre Dame is going all in with Amazon’s cloud][3]

Why? Because all this information cannot be processed by a single cloud or an on-premise location. Latency will always be a problem. For example, in virtual reality (VR) anything over 7 milliseconds will cause motion sickness. When decisions are required to be taken in real-time, you cannot send data to the cloud. You can, however, make use of edge computing and a multi-CDN design.

### Introducing edge computing and multi-CDN

The rate of cloud adoption, all-things-video, IoT and edge computing are bringing life back to CDNs and multi-CDN designs. Typically, a multi-CDN is an implementation pattern that includes more than one CDN vendor. The traffic direction is performed by using different metrics, whereby traffic can either be load balanced or failed across the different vendors.

Edge computing moves actions as close as possible to the source. It is the point where the physical world interacts with the digital world. Logically, the decentralized approach of edge computing will not take over the centralized approach. They will be complementary to each other, so that the application can run at its peak level, depending on its position in the network.

For example, in IoT, saving battery life is crucial. Let’s assume an IoT device can conduct the transaction in 10ms round trip time (RTT), instead of 100ms RTT. As a result, it can use 10 times less battery.

### The internet, a performance bottleneck

The internet is designed on the principle that everyone can talk to everyone, thereby providing universal connectivity whether required or not. There has been a number of design changes with network address translation (NAT) being the biggest. However, essentially the role of the internet has remained the same in terms of connectivity, regardless of location.

With this type of connectivity model, distance is an important determinant for the application’s performance. Users on the other side of the planet will suffer regardless of buffer sizes or other device optimizations. Long RTT is experienced as packets go back and forth before the actual data transmission. Although caching and traffic redirection is being used but limited success has been achieved so far.

### The principles of application delivery

When transmission control protocol (TCP) starts, it thinks it is back in the late 1970s. It assumes that all services are on a local area network (LAN) and there is no packet loss. It then starts to work backward from there. Back when it was designed, we didn't have real-time traffic, such as voice and video that is latency and jitter sensitive.

Ideally, TCP was designed for the ease of use and reliability, not to boost the performance. You actually need to optimize the TCP stack. And this is why CDNs are very good at performing such tasks. For example, if a connection is received from a mobile phone, a CDN will start with the assumption that there is going to be high jitter and packet loss. This allows them to size the TCP window correctly that accurately match network conditions.

How do you magnify the performance, what options do you have? In a generic sense, many look to lowering the latency. However, with applications, such as video streaming, latency does not tell you if the video is going to buffer. One can only assume that lower latency will lead to less buffering. In such a scenario, measurement-based on throughput is a far better performance metric since will tell you how fast an object will load.

We have also to consider the page load times. At the network level, it's the time to first byte (TTFB) and ping. However, these mechanisms don’t tell you much about the user experience as everything fits into one packet. Using ping will not inform you about the bandwidth problems.

And if a web page goes slower by 25% once packet loss exceeds 5% and you are measuring time to the first byte which is the 4th packet - what exactly can you learn? TTFB is comparable to an internet control message protocol (ICMP) request just one layer up the stack. It's good if something is broken but not if there is underperformance issue.

When you examine the history of TTFB measuring, you will find that it was deployed due to the lack of Real User Monitoring (RUM) measurements. Previously TTFB was as good in approximating how fast something was going to load, but we don't have to approximate anymore as we can measure it with RUM. RUM is measurements from the end-users. An example could be the metrics generated from a webpage that is being served to an actual user.

Conclusively, TTFB, ping and page load times are not sophisticated measurements. We should prefer RUM time measurements as much as we can. This provides a more accurate picture of the user experience. This is something which has become critical over the last decade.

Now we are living in a world of RUM which lets us build our network based on what matters to the business users. All CDNs should aim for RUM measurements. For this, they may need to integrate with traffic management systems that intelligently measure on what the end-user really sees.

### The need for multi-CDN

Primarily, the reasons one would opt for a multi-CDN environment are availability and performance. No single CDN can be the fastest to everyone and everywhere in the world. It is impossible due to the internet's connectivity model. However, combining the best of two or even more CDN providers will increase the performance.

A multi-CDN will give a faster performance and higher availability than what can be achieved with a single CDN. A good design is what runs two availability zones. A better design is what runs two availability zones with a single CDN provider. However, superior design is what runs two availability zones in a multi-CDN environment.

### Edge applications will be the new norm

It’s not that long ago that there was a transition from the heavy physical monolithic architecture to the agile cloud. But all that really happened was the transition from the physical appliance to a virtual cloud-based appliance. Maybe now is the time that we should ask, is this the future that we really want?

One of the main issues in introducing edge applications is the mindset. It is challenging to convince yourself or your peers that the infrastructure you have spent all your time working on and investing in is not the best way forward for your business. 

Although the cloud has created a big buzz, just because you migrate to the cloud does not mean that your applications will run faster. In fact, all you are really doing is abstracting the physical pieces of the architecture and paying someone else to manage it. The cloud has, however, opened the door for the edge application conversation. We have already taken the first step to the cloud and now it's time to make the second move.

Basically, when you think about edge applications: its simplicity is a programmable CDN. A CDN is an edge application and an edge application is a superset of what your CDN is doing. Edge applications denote cloud computing at the edge. It is a paradigm to distribute the application closer to the source for lower latency, additional resilience, and simplified infrastructure, where you still have control and privacy.

From an architectural point of view, an edge application provides more resilience than deploying centralized applications. In today's world of high expectations, resilience is a necessity for the continuity of business. Edge applications allow you to collapse the infrastructure into an architecture that is cheaper, simpler and more attentive to the application. The less in the expanse of infrastructure, the more time you can focus on what really matters to your business - the customer.

### An example of an edge architecture

An example of edge architecture is within each PoP, every application has its own isolated JavaScript (JS) environment. JavaScript is great for security isolation and the performance guarantees scale. The JavaScript is a dedicated isolated instance that executes the code at the edge.

Most likely, each JavaScript has its own virtual machine (VM). The sole operation that the VM is performing is the JavaScript runtime engine and the only thing it is running is the customer's code. One could use Google V8 open-source high-performance JavaScript and WebAssembly engine.

Let’s face it, if you continue building more PoPs, you will hit the law of diminishing returns. When it comes to application such as mobile, you really are maxed out when throwing PoPs to form a solution. So we need to find another solution.

In the coming times, we are going to witness a trend where most applications will become global, which means edge applications. It certainly makes little sense to place all the application in one location when your users are everywhere else.

**This article is published as part of the IDG Contributor Network. [Want to Join?][4]**

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3409027/how-edge-computing-is-driving-a-new-era-of-cdn.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.techhive.com/images/article/2017/02/network-traffic-100707086-large.jpg
[2]: https://network-insight.net/2016/12/buffers-packet-drops/
[3]: https://www.networkworld.com/article/3014599/cloud-computing/how-notre-dame-is-going-all-in-with-amazon-s-cloud.html#tk.nww-fsb
[4]: https://www.networkworld.com/contributor-network/signup.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
