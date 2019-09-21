[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (When Wi-Fi is mission-critical, a mixed-channel architecture is the best option)
[#]: via: (https://www.networkworld.com/article/3386376/when-wi-fi-is-mission-critical-a-mixed-channel-architecture-is-the-best-option.html#tk.rss_all)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

When Wi-Fi is mission-critical, a mixed-channel architecture is the best option
======

### Multi-channel is the norm for Wi-Fi today, but it’s not always the best choice. Single-channel and hybrid APs offer compelling alternatives when reliable Wi-Fi is a must.

![Getty Images][1]

I’ve worked with a number of companies that have implemented digital projects only to see them fail. The ideation was correct, the implementation was sound, and the market opportunity was there. The weak link? The Wi-Fi network.

For example, a large hospital wanted to improve clinician response times to patient alarms by having telemetry information sent to mobile devices. Without the system, the only way a nurse would know about a patient alarm is from an audible alert. And with all the background noise, it’s often tough to discern where noises are coming from. The problem was the Wi-Fi network in the hospital had not been upgraded in years and caused messages to be significantly delayed in their delivery, often taking four to five minutes to deliver. The long delivery times caused a lack of confidence in the system, so many clinicians stopped using it and went back to manual alerting. As a result, the project was considered a failure.

I’ve seen similar examples in manufacturing, K-12 education, entertainment, and other industries. Businesses are competing on the basis of customer experience, and that’s driven from the ever-expanding, ubiquitous wireless edge. Great Wi-Fi doesn’t necessarily mean market leadership, but bad Wi-Fi will have a negative impact on customers and employees. And in today’s competitive climate, that’s a recipe for disaster.

**[ Read also:[Wi-Fi site-survey tips: How to avoid interference, dead spots][2] ]**

## Wi-Fi performance historically inconsistent

The problem with Wi-Fi is that it’s inherently flaky. I’m sure everyone reading this has experienced the typical flaws with failed downloads, dropped connections, inconsistent performance, and lengthy wait times to connect to public hot spots.

Picture sitting in a conference prior to a keynote address and being able to tweet, send email, browse the web, and do other things with no problem. Then the keynote speaker comes on stage and the entire audiences start snapping pics, uploading those pictures, and streaming things – and the Wi-Fi stops working. I find this to be the norm more than the exception, underscoring the need for [no-compromise Wi-Fi][3].

The question for network professionals is how to get to a place where the Wi-Fi is rock solid 100% of the time. Some say that just beefing up the existing network will do that, and it might, but in some cases, the type of Wi-Fi might not be appropriate.

The most commonly deployed type of Wi-Fi is multi-channel, also known as micro-cell, where each client connects to the access point (AP) using a radio channel. A high-quality experience is based on two things: good signal strength and minimal interference. Several things can cause interference, such as APs being too close, layout issues, or interference from other equipment. To minimize interference, businesses invest a significant amount of time and money in [site surveys to plan the optimal channel map][2], but even with that’s done well, Wi-Fi glitches can still happen.

**[[Take this mobile device management course from PluralSight and learn how to secure devices in your company without degrading the user experience.][4] ]**

## Multi-channel Wi-Fi not always the best choice

For many carpeted offices, multi-channel Wi-Fi is likely to be solid, but there are some environments where external circumstances will impact performance. A good example of this is a multi-tenant building in which there are multiple Wi-Fi networks transmitting on the same channel and interfering with one another. Another example is a hospital where there are many campus workers moving between APs. The client will also try to connect to the best AP, causing the client to continually disconnect and reconnect resulting in dropped sessions. Then there are environments such as schools, airports, and conference facilities where there is a high number of transient devices and multi-channel can struggle to keep up.

## Single channel Wi-Fi offers better reliability but with a performance hit

What’s a network manager to do? Is inconsistent Wi-Fi just a fait accompli? Multi-channel is the norm, but it isn’t designed for dynamic physical environments or those where reliable connectivity is a must.

Several years ago an alternative architecture was proposed that would solve these problems. As the name suggests, “single channel” Wi-Fi uses a single radio channel for all APs in the network. Think of this as being a single Wi-Fi fabric that operates on one channel. With this architecture, the placement of APs is irrelevant because they all utilize the same channel, so they won’t interfere with one another. This has an obvious simplicity advantage, such as if coverage is poor, there’s no reason to do another expensive site survey. Instead, just drop in APs where they are needed.

One of the disadvantages of single-channel is that aggregate network throughput was lower than multi-channel because only one channel can be used. This might be fine in environments where reliability trumps performance, but many organizations want both.

## Hybrid APs offer the best of both worlds

There has been recent innovation from the manufacturers of single-channel systems that mix channel architectures, creating a “best of both worlds” deployment that offers the throughput of multi-channel with the reliability of single-channel. For example, Allied Telesis offers Hybrid APs that can operate in multi-channel and single-channel mode simultaneously. That means some web clients can be assigned to the multi-channel to have maximum throughput, while others can use single-channel for seamless roaming experience.

A practical use-case of such a mix might be a logistics facility where the office staff uses multi-channel, but the fork-lift operators use single-channel for continuous connectivity as they move throughout the warehouse.

Wi-Fi was once a network of convenience, but now it is perhaps the most mission-critical of all networks. A traditional multi-channel system might work, but due diligence should be done to see how it functions under a heavy load. IT leaders need to understand how important Wi-Fi is to digital transformation initiatives and do the proper testing to ensure it’s not the weak link in the infrastructure chain and choose the best technology for today’s environment.

**Reviews: 4 free, open-source network monitoring tools:**

  * [Icinga: Enterprise-grade, open-source network-monitoring that scales][5]
  * [Nagios Core: Network-monitoring software with lots of plugins, steep learning curve][6]
  * [Observium open-source network monitoring tool: Won’t run on Windows but has a great user interface][7]
  * [Zabbix delivers effective no-frills network monitoring][8]



Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3386376/when-wi-fi-is-mission-critical-a-mixed-channel-architecture-is-the-best-option.html#tk.rss_all

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/09/tablet_graph_wifi_analytics-100771638-large.jpg
[2]: https://www.networkworld.com/article/3315269/wi-fi-site-survey-tips-how-to-avoid-interference-dead-spots.html
[3]: https://www.alliedtelesis.com/blog/no-compromise-wi-fi
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Fmobile-device-management-big-picture
[5]: https://www.networkworld.com/article/3273439/review-icinga-enterprise-grade-open-source-network-monitoring-that-scales.html?nsdr=true#nww-fsb
[6]: https://www.networkworld.com/article/3304307/nagios-core-monitoring-software-lots-of-plugins-steep-learning-curve.html
[7]: https://www.networkworld.com/article/3269279/review-observium-open-source-network-monitoring-won-t-run-on-windows-but-has-a-great-user-interface.html?nsdr=true#nww-fsb
[8]: https://www.networkworld.com/article/3304253/zabbix-delivers-effective-no-frills-network-monitoring.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
