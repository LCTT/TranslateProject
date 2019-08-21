[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SD-WAN Buyers Should Think Application Performance as well as Resiliency)
[#]: via: (https://www.networkworld.com/article/3406456/sd-wan-buyers-should-think-application-performance-as-well-as-resiliency.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

SD-WAN Buyers Should Think Application Performance as well as Resiliency
======

![istock][1]

As an industry analyst, not since the days of WAN Optimization have I seen a technology gain as much interest as I am seeing with [SD-WANs][2] today. Although full deployments are still limited, nearly every network manager, and often many IT leaders I talk to, are interested in it. The reason for this is two-fold – the WAN has grown in importance for cloud-first enterprises and is badly in need of an overhaul. This hasn’t gone unnoticed by the vendor community as there has been an explosion of companies bringing a broad range of SD-WAN offerings to market. The great news for buyers is that there is no shortage of choices. The bad news is there are too many choices and making the right decision difficult.

One area of differentiation for SD-WAN vendors is how they handle application performance.  I think of the SD-WAN market as being split into two categories – basic and advanced SD-WANs.  A good analogy is to think of the virtualization market.  There are many vendors that offer hypervisors – in fact there are a number of free ones.  So why do companies pay a premium for VMware? It’s because VMware offers many advanced features and capabilities that make its solution do more than just virtualize servers.

Similarly, basic SD-WAN solutions do a great job of helping to lower costs and to increase application resiliency through path selection capabilities but do nothing to improve application performance. One myth that needs busting is that all SD-WANs make your applications perform better. That’s simply not true as application availability and performance are two different things. It’s possible to have great performance and poor availability or high availability with lackluster performance. 

Consider the case where a business runs a hybrid WAN and voice and video traffic is sent over the MPLS connection and broadband is used for other traffic. If the MPLS link becomes congested, but doesn’t go down, most SD-WAN solutions will continue to send video and voice over it, which obviously degrades the performance. If multiple broadband connections are used, the chances of congestion related issues are even more likely. 

This is an important point for IT professionals to understand. The business justification for SD-WAN was initially built around saving money but if application performance suffers, the entire return on investment (ROI) for the project might as well be tossed out the window.  For many companies, the network is the business, so a poor performing network means equally poor performing applications which results lost productivity, lower revenues and possibly brand damage from customer experience issues. 

I’ve talked to many organizations that had digital initiatives fail because the network wasn’t transformed. For example, a luxury retailer implemented a tablet program for in store personnel to be able to show merchandise to customers. High end retail is almost wholly impulse purchases so the more inventory that can be shown to a customer, the larger the resulting sales. The WAN that was in place was causing the mobile application to perform poorly causing the digital initiative to have a negative effect. Instead of driving sales, the mobile initiative was chasing customers from the store.  The idea was right but the poor performing WAN caused the project to fail.

SD-WAN decision makers need to look to suppliers that have specific technologies integrated into it that can act when congestion occurs.  A great example of this is the Silver Peak [Unity EdgeConnect™][3] SD-WAN edge platform with [path conditioning][4], [traffic shaping][5] and sub-second link failover. This ensures the best possible quality for all critical applications, even when an underlying link experiences congestion or an outage, even for [voice and video over broadband][6]. This is a foundational component of advanced SD-WAN providers as they offer the same resiliency and cost benefits as a basic SD-WAN but also ensure application performance remains high. 

The SD-WAN era is here, and organizations should be aggressive with deployments as it will transform the WAN and make it a digital transformation enabler. Decision makers should choose their provider carefully and ensure the vendor also improves application performance.  Without it, the digital initiatives will likely fail and negate any ROI the company was hoping to realize.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3406456/sd-wan-buyers-should-think-application-performance-as-well-as-resiliency.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/07/istock-157647179-100800860-large.jpg
[2]: https://www.silver-peak.com/sd-wan/sd-wan-explained
[3]: https://www.silver-peak.com/products/unity-edge-connect
[4]: https://www.silver-peak.com/products/unity-edge-connect/path-conditioning
[5]: https://www.silver-peak.com/products-solutions/unity/traffic-shaping
[6]: https://www.silver-peak.com/sd-wan/voice-video-over-broadband
