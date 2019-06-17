[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How SD-WAN Turbo-Charges UCaaS in a Cloud-First World)
[#]: via: (https://www.networkworld.com/article/3401541/how-sd-wan-turbo-charges-ucaas-in-a-cloud-first-world.html)
[#]: author: (Nav Chander )

How SD-WAN Turbo-Charges UCaaS in a Cloud-First World
======

![scyther5/istock][1]

Today, many enterprise CIO’s are of in the midst of a digital transformation journey, migrating more of their business applications and infrastructure to the cloud, including real-time voice calling, video conferencing and collaboration applications. Enterprises are increasingly adopting Unified Communications as a Service (UCaaS) services to streamline voice, video and web conferencing via cloud-based software.

In fact, [Gartner predicts that by 2021,][2] 90 percent of IT leaders will not purchase new premises-hosted Unified Communications (UC) infrastructure because future cloud-hosted UCaaS offerings will be far ahead in terms of features, functions, analytics and dashboards.

UCaaS services, however, are particularly sensitive to packet loss, latency and jitter. Dropped calls, weak signals and degraded video connections with pixelated screens are relatively common occurrences with UCaaS services. Most of these issues can be attributed to impairments in the underlying transport network, which is often the public internet.

Voice and video quality problems can be exacerbated when traffic must traverse multiple peering internet service providers, resulting in an unpredictable user experience, especially when accessing real-time services in distributed regions.

So, what are the most important SD-WAN platform capabilities that managed service providers should look for to turbocharge their UCaaS services offerings?

  * Cloud hosted offering: The ability to do ruggedized/protected last mile with a cloud-based IaaS instance of the SD-WAN is one of the best ways to assure consistent UCaaS performance – at least if it’s a Silver Peak [Unity EdgeConnect™][3] appliance with dynamic path control, forward error correction, packet order correction, etc.
  * [Local Internet Breakout][4]: Silver Peak First-packet iQTM identifies UCaaS applications on the first packet and automatically steers traffic to a local UCaaS service PoP without backhauling so users can always securely connect to their application from anywhere
  * [Business-driven Application-specific Routing][5], which also leverages First-packet iQ, automatically prioritizes network resources to UC, steering traffic directly to the UCaaS service, thereby improving QoS, and delivering the highest quality of experience to users
  * [Dynamic Path Control][6] for multiple connections to a site, which provides automatic seamless failover from a failed branch circuit for all voice calls, video calls and real-time collaboration
  * [Application, visibility and control][7] to enable better management of the underlying connectivity, eliminating the impact of possible UCaaS service packet loss/drop, WAN link congestion or failure



A business-driven SD-WAN edge platform is like a turbocharged engine in a car. It can accelerate performance and optimize the UCaaS user experience. The advanced performance, application visibility and optimization capabilities of the EdgeConnect SD-WAN edge platform can identify, classify and granularly steer UCaaS traffic. EdgeConnect can further optimize the UCaaS customer experience through partnerships with leading public cloud providers like AWS, GCP and Azure. For example, deploying EdgeConnect at each enterprise WAN site and deploying an EdgeConnect virtual instance in a public cloud instance adjacent to the UCaaS provider’s PoP/data center (figure 1) assures the highest quality of voice and video experience for end users. In this architecture, the SD-WAN fabric is extended across all sites and into the public cloud, protecting the traffic against impairments/failures in the first mile, and leveraging the cloud providers peering relationship with UCaaS providers (e.g. RingCentral and 8×8) to provide the enterprises with the highest quality of experience.

![Fig 1. End-to-end UCaaS and SD-WAN][8]

This combined UCaaS-SD-WAN solution also incorporates tunnel bonding to bond two or more WAN transport services into a single logical connection that can compensate for any degradation in the last mile. Advanced path conditioning like adaptive forward error correction and packet order correction capabilities overcome the effects of packet loss, latency and jitter to deliver private line-like voice performance – even over the public internet.

According to Courtney Munroe, GVP of Worldwide Telecom Research at IDC, “SD-WAN from technology providers such as Silver Peak, that offers advanced performance capabilities, will provide a better end user UCaaS experience and enable service providers to offer the best combination of a managed SD-WAN and UCaaS to enterprise customers.”

For service providers, offering a bundled managed UCaaS with [SD-WAN][9] to enterprises also improves the customer “stickiness”. It creates opportunities to sell more as-a-service offerings that provide a better end-user experience, offer cost savings to the enterprise and increase the opportunity for innovation.

So, are you ready to turbocharge your UCaaS service today by incorporating a business-driven EdgeConnect SD-WAN? Learn more at [SilverPeak.com][10].

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3401541/how-sd-wan-turbo-charges-ucaas-in-a-cloud-first-world.html

作者：[Nav Chander][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/06/istock-1016764582-100799008-large.jpg
[2]: https://www.ringcentral.com/blog/2018/10/2018-ucaas-magic-quadrant-leader/
[3]: https://www.silver-peak.com/products/unity-edge-connect
[4]: https://www.silver-peak.com/use-cases/local-internet-breakout
[5]: https://www.silver-peak.com/products/unity-edge-connect#business-driven
[6]: https://www.silver-peak.com/products/unity-edge-connect/dynamic-path-control
[7]: https://www.silver-peak.com/resource-center/simplify-sd-wan-operations-greater-visibility
[8]: https://images.idgesg.net/images/article/2019/06/ucaas_2-100799013-large.jpg
[9]: https://www.silver-peak.com/sd-wan/sd-wan-explained
[10]: http://www.silverpeak.com/
