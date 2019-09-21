[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IoT roundup: Keeping an eye on energy use and Volkswagen teams with AWS)
[#]: via: (https://www.networkworld.com/article/3384697/iot-roundup-keeping-an-eye-on-energy-use-and-volkswagen-teams-with-aws.html#tk.rss_all)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

IoT roundup: Keeping an eye on energy use and Volkswagen teams with AWS
======

### This week's roundup features new tech from MIT, big news in the automotive sector and a handy new level of centralization from a smaller IoT-focused company.

![Getty Images][1]

Much of what’s exciting about IoT technology has to do with getting data from a huge variety of sources into one place so it can be mined for insight, but sensors used to gather that data are frequently legacy devices from the early days of industrial automation or cheap, lightweight, SoC-based gadgets without a lot of sophistication of their own.

Researchers at MIT have devised a system that can gather a certain slice of data from unsophisticated devices that are grouped on the same electrical circuit without adding sensors to each device.

**[ Check out our[corporate guide to addressing IoT security][2]. ]**

The technology’s called non-intrusive load monitoring, and sits directly on a given building's, vehicle's or other piece of infrastructure’s electrical circuits, identifies devices based on their power usage, and sends alerts when there are irregularities.

It seems likely to make IIoT-related waves once it’s out of testing and onto the market.

NLIM was recently tested, said MIT’s news service, on a U.S. Coast Guard cutter based in Boston, where it was attached to the outside of an electrical wire “at a single point, without requiring any cutting or splicing of wires.”

Two such connections allowed the scientists to monitor roughly 20 separate devices on an electrical circuit, and the system was able to detect an anomalous amount of energy use from a component of the ship’s diesel engines known as a jacket water heater.

“[C]rewmembers were skeptical about the reading but went to check it anyway. The heaters are hidden under protective metal covers, but as soon as the cover was removed from the suspect device, smoke came pouring out, and severe corrosion and broken insulation were clearly revealed,” the MIT report stated. Two other important but slightly less critical faults were also detected by the system.

It’s easy to see why NLIM could easily prove to be an attractive technology for IIoT use in the future. It sounds as though it’s very simple to install, can operate without any kind of Internet connection (though most implementers will probably want to connect it to a wider monitoring setup for a more holistic picture of their systems) and does all of its computational work locally. It can even be used for general energy audits. What, in short, is not to like?

**Volkswagen teams up with Amazon**

AWS has got a new flagship client for its growing IoT services in the form of the Volkswagen Group, which [announced][3] that AWS is going to design and build the Volkswagen Industrial Cloud, a floor-to-ceiling industrial IoT implementation aimed at improving uptime, flexibility, productivity and vehicle quality.

Real-time data from all 122 of VW’s manufacturing plants around the world will be available to the system, everything from part tracking to comparative analysis of efficiency to even deeper forms of analytics will take place in the company’s “data lake,” as the announcement calls it. Oh, and machine learning is part of it, too.

The German carmaker clearly believes that AWS’s technology can provide a lot of help to its operations across the board, [even in the wake of a partnership with Microsoft for Azure-based cloud services announced last year.][4]

**IoT-in-a-box**

IoT can be very complicated. While individual components of any given implementation are often quite simple, each implementation usually contains a host of technologies that have to work in close concert. That means a lot of orchestration work has to go into making this stuff work.

Enter Digi International, which rolled out an IoT-in-a-box package called Digi Foundations earlier this month. The idea is to take a lot of the logistical legwork out of IoT implementations by integrating cloud-connection software and edge-computing capabilities into the company’s core industrial router business. Foundations, which is packaged as a software subscription that adds these capabilities and more to the company’s devices, also includes a built-in management layer, allowing for simplified configuration and monitoring.

OK, so it’s not quite all-in-one, but it’s still an impressive level of integration, particularly from a company that many might not have heard of before. It’s also a potential bellwether for other smaller firms upping their technical sophistication in the IoT sector.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3384697/iot-roundup-keeping-an-eye-on-energy-use-and-volkswagen-teams-with-aws.html#tk.rss_all

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/08/nw_iot-news_internet-of-things_smart-city_smart-home7-100768495-large.jpg
[2]: https://www.networkworld.com/article/3269165/internet-of-things/a-corporate-guide-to-addressing-iot-security-concerns.html
[3]: https://www.volkswagen-newsroom.com/en/press-releases/volkswagen-and-amazon-web-services-to-develop-industrial-cloud-4780
[4]: https://www.volkswagenag.com/en/news/2018/09/volkswagen-and-microsoft-announce-strategic-partnership.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
