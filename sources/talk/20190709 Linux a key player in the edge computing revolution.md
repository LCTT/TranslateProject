[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux a key player in the edge computing revolution)
[#]: via: (https://www.networkworld.com/article/3407702/linux-a-key-player-in-the-edge-computing-revolution.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Linux a key player in the edge computing revolution
======
Edge computing is augmenting the role that Linux plays in our day-to-day lives. A conversation with Jaromir Coufal from Red Hat helps to define what the edge has become.
![Dominic Smith \(CC BY 2.0\)][1]

In the past few years, [edge computing][2] has been revolutionizing how some very familiar services are provided to individuals like you and me, as well as how services are managed within major industries. Try to get your arms around what edge computing is today, and you might just discover that your arms aren’t nearly as long or as flexible as you’d imagined. And Linux is playing a major role in this ever-expanding edge.

One reason why edge computing defies easy definition is that it takes many different forms. As Jaromir Coufal, principal product manager at Red Hat, recently pointed out to me, there is no single edge. Instead, there are lots of edges – depending on what compute features are needed. He suggests that we can think of the edge as something of a continuum of capabilities with the problem being resolved determining where along that particular continuum any edge solution will rest.

**[ Also read: [What is edge computing?][3] and [How edge networking and IoT will reshape data centers][4] ]**

Some forms of edge computing include consumer electronics that are used and installed in millions of homes, others that serve tens of thousands of small businesses with operating their facilities, and still others that tie large companies to their remote sites. Key to this elusive definition is the idea that edge computing always involves distributing the workload in such a way that the bulk of the computing work is done remotely from the central core of the business and close to the business problem being addressed.

Done properly, edge computing can provide services that are both faster and more reliable. Applications running on the edge can be more resilient and run considerably faster because their required data resources are local. In addition, data can be processed or analyzed locally, often requiring only periodic transfer of results to central sites.

While physical security might be lower at the edge, edge devices often implement security features that allow them to detect 1) manipulation of the device, 2) malicious software, and 3) a physical breach and wipe data.

### Benefits of edge computing

Some of the benefits of edge computing include:

  * A quick response to intrusion detection, including the ability for a remote device to detach or self-destruct
  * The ability to instantly stop communication when needed
  * Constrained functionality and fewer generic entry points
  * Rugged and reliable problem resistance
  * Making the overall computing system harder to attack because computing is distributed
  * Less data-in-transit exposure



Some examples of edge computing devices include those that provide:

  * Video surveillance – watching for activity, reporting only if seen
  * Controlling autonomous vehicles
  * Production monitoring and control



### Edge computing success story: Chick-fil-A

One impressive example of highly successful edge computing caught me by surprise. It turns out Chick-fil-A uses edge computing devices to help manage its food preparation services. At Chick-fil-A, edge devices:

  1. Analyze a fryer’s cleaning and cooking
  2. Aggregate data as a failsafe in case internet connectivity is lost
  3. Help with decision-making about cooking – how much and how long to cook
  4. Enhance business operations
  5. Help automate the complex food cooking and holding decisions so that even newbies get things right
  6. Function even when the connection with the central site is down



As Coufal pointed out, Chick-fil-A runs [Kubernetes][5] at the edge in every one of its restaurants. Their key motivators are low-latency, scale of operations, and continuous business. And it seems to be working extremely well.

[Chick-fil-A’s hypothesis][6] captures it all: By making smarter kitchen equipment, we can collect more data. By applying data to our restaurant, we can build more intelligent systems. By building more intelligent systems, we can better scale our business.

### Are you edge-ready?

There’s no quick answer as to whether your organization is “edge ready.” Many factors determine what kind of services can be deployed on the edge and whether and when those services need to communicate with more central devices. Some of these include:

  * Whether your workload can be functionally distributed
  * If it’s OK for devices to have infrequent contact with the central services
  * If devices can work properly when cut off from their connection back to central services
  * Whether the devices can be secured (e.g., trusted not to provide an entry point)



Implementing an edge computing network will likely take a long time from initial planning to implementation. Still, this kind of technology is taking hold and offers some strong advantages. While edge computing initially took hold 15 or more years ago, the last few years have seen renewed interest thanks to tech advances that have enabled new uses.

Coufal noted that it's been 15 or more years since edge computing concepts and technologies were first introduced, but renewed interest has come about due to tech advances enabling new uses that require this technology.

**More about edge computing:**

  * [How edge networking and IoT will reshape data centers][4]
  * [Edge computing best practices][7]
  * [How edge computing can help secure the IoT][8]



Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3407702/linux-a-key-player-in-the-edge-computing-revolution.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/07/telecom-100801330-large.jpg
[2]: https://www.networkworld.com/article/3224893/what-is-edge-computing-and-how-it-s-changing-the-network.html
[3]: https://www.networkworld.com/article/3224893/internet-of-things/what-is-edge-computing-and-how-it-s-changing-the-network.html
[4]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[5]: https://www.infoworld.com/article/3268073/what-is-kubernetes-container-orchestration-explained.html
[6]: https://medium.com/@cfatechblog/edge-computing-at-chick-fil-a-7d67242675e2
[7]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[8]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
