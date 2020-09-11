[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How a simpler mmWave architecture can connect IoT)
[#]: via: (https://www.networkworld.com/article/3440498/how-a-simpler-mmwave-architecture-can-connect-iot.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

How a simpler mmWave architecture can connect IoT
======
Upcoming 5G millimeter wave frequencies are being bandied as a good, solid network for IoT. But some say they may be too elaborate. A stripped-down version of millimeter wave technology may be the solution.
Cofotoisme / Getty Images

Current wireless technologies, such as Wi-Fi, won’t provide enough support for the billions of internet of things (IoT) sensors and networks that are expected to come on stream in the next few years, say researchers. More speed, efficiency and bandwidth will be needed. Plus, the equipment must cost significantly less than existing gear, including upcoming 5G equipment.

To address the issue, scientists at University of Waterloo are developing a stripped-down version of millimeter wave technology.

“A growing strain will be placed on requirements of wireless networks,” the researchers say in an [article announcing a new low-power, low-cost 5G network technology][1] that it calls mmX. They say the technology is specifically geared towards IoT.

“Millimeter wave offers multi-gigahertz of unlicensed bandwidth. More than 200 times that allocated to today's Wi-Fi and cellular networks,” the article says. That’s “in comparison to Wi-Fi and Bluetooth, which are slow for many IoT applications.”

**[ Also see: [What is edge computing?][2] and [How edge networking and IoT will reshape data centers][3] ]**

However, upcoming, ultra-fast, ultra-high capacity 5G networks, which will take advantage of millimeter wave, use considerable amounts of electrical energy and computing power, the researchers say. That means they aren't good for the low-cost, low-power IoT devices of the kind we’re going to see in many use cases. New devices must be low-power because they need to stay up longer, preferably indefinitely. Therefore, the idea of just adding power-intensive millimeter radios to the networks defeats the object to a certain extent. There needs to be more of a stripped-down millimeter network.

“We address the key challenges that prevent existing mmWave technology from being used for such IoT devices,” the researcher say in their [the SIGCOMM ’19-published paper][4].

The problem with current wireless technologies isn’t so much that there’s anything fundamentally wrong with them, but that new IoT devices have triggered changes in requirements from incumbent radios, such as in today’s smartphones, and also that new devices function with a low-rate modulation scheme—rates much lower than channel capacity, in other words. Both are inefficient in use of spectrum.

**** From HPE: [ITaaS and Corporate Storage Technology][5]: This blog explains why pay-per-use IT models, such as ITaaS, could be the next chapter in IT infrastructure. (Sponsored) ****

### Beam searching prevents mmWave from being used for IoT

The researchers say they have identified high-power consumption, expensive hardware, and beam searching as the key culprits that will prevent mmWave from being adopted for IoT implementation.

Beam searching, for example, is a limitation of regular mmWave. It’s where power is focused to prevent the signal path-loss from decaying, but it is computationally complex, is expensive, and uses a lot of energy. That all adds to overhead. The researchers say they can eliminate beam searching through a form of over-the-air modulation where the signal isn’t modulated before transmission but during the transmission. That “eliminates the need of beam searching in mmWave radios,” they say. They also reduce the amount of feedback data needed from access points, which also helps.

Another special feature mmX offers is that its hardware is a simple Raspberry Pi add-on board, allowing the “networking community” to easily experiment. Twenty-five million Raspberry Pi development computers have reportedly been sold as of earlier this year. 

Energy efficiency is “even lower than existing Wi-Fi modules,” the researchers claim. Their mmX is “a far more efficient and cost-effective architecture for imminent IoT applications,” they say.

**More about edge networking:**

  * [How edge networking and IoT will reshape data centers][3]
  * [Edge computing best practices][6]
  * [How edge computing can help secure the IoT][7]



Join the Network World communities on [Facebook][8] and [LinkedIn][9] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3440498/how-a-simpler-mmwave-architecture-can-connect-iot.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://uwaterloo.ca/news/news/researchers-develop-low-power-low-cost-network-5g
[2]: https://www.networkworld.com/article/3224893/internet-of-things/what-is-edge-computing-and-how-it-s-changing-the-network.html
[3]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[4]: https://dl.acm.org/citation.cfm?id=3342068
[5]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/
[6]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[7]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[8]: https://www.facebook.com/NetworkWorld/
[9]: https://www.linkedin.com/company/network-world
