[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Managed WAN and the cloud-native SD-WAN)
[#]: via: (https://www.networkworld.com/article/3398476/managed-wan-and-the-cloud-native-sd-wan.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

Managed WAN and the cloud-native SD-WAN
======
The motivation for WAN transformation is clear, today organizations require: improved internet access and last mile connectivity, additional bandwidth and a reduction in the WAN costs.
![Gerd Altmann \(CC0\)][1]

In recent years, a significant number of organizations have transformed their wide area network (WAN). Many of these organizations have some kind of cloud-presence across on-premise data centers and remote site locations.

The vast majority of organizations that I have consulted with have over 10 locations. And it is common to have headquarters in both the US and Europe, along with remote site locations spanning North America, Europe, and Asia.

A WAN transformation project requires this diversity to be taken into consideration when choosing the best SD-WAN vendor to satisfy both; networking and security requirements. Fundamentally, SD-WAN is not just about physical connectivity, there are many more related aspects.

**[ Related:[MPLS explained – What you need to know about multi-protocol label switching][2]**

### Motivations for transforming the WAN

The motivation for WAN transformation is clear: Today organizations prefer improved internet access and last mile connectivity, additional bandwidth along with a reduction in the WAN costs. Replacing Multiprotocol Label Switching (MPLS) with SD-WAN has of course been the main driver for the SD-WAN evolution, but it is only a single piece of the jigsaw puzzle.

Many SD-WAN vendors are quickly brought to their knees when they try to address security and gain direct internet access from remote site locations. The problem is how to ensure optimized cloud access that is secure, has improved visibility and predictable performance without the high costs associated with MPLS? SD-WAN is not just about connecting locations. Primarily, it needs to combine many other important network and security elements into one seamless worldwide experience.

According to a recent report from [Cato Networks][3] into enterprise IT managers, a staggering 85% will confront use cases in 2019 that are poorly addressed or outright ignored by SD-WAN. Examples includes providing secure, Internet access from any location (50%) and improving visibility into and control over mobile access to cloud applications, such as Office 365 (46%).

### Issues with traditional SD-WAN vendors

First and foremost, SD-WAN unable to address the security challenges that arise during the WAN transformation. Such security challenges include protection against malware, ransomware and implementing the necessary security policies. Besides, there is a lack of visibility that is required to police the mobile users and remote site locations accessing resources in the public cloud.

To combat this, organizations have to purchase additional equipment. There has always been and will always be a high cost associated with buying such security appliances. Furthermore, the additional tools that are needed to protect the remote site locations increase the network complexity and reduce visibility. Let’s us not forget that the variety of physical appliances require talented engineers for design, deployment and maintenance.

There will often be a single network-cowboy. This means the network and security configuration along with the design essentials are stored in the mind of the engineer, not in a central database from where the knowledge can be accessed if the engineer leaves his or her employment.

The physical appliance approach to SD-WAN makes it hard, if not impossible, to accommodate for the future. If the current SD-WAN vendors continue to focus just on connecting the devices with the physical appliances, they will have limited ability to accommodate for example, with the future of network IoT devices. With these factors in mind what are the available options to overcome the SD-WAN shortcomings?

One can opt for a do it yourself (DIY) solution, or a managed service, which can fall into the category of telcos, with the improvements of either co-managed or self-managed service categories.

### Option 1: The DIY solution

Firstly DIY, from the experience of trying to stitch together a global network, this is not only costly but also complex and is a very constrained approach to the network transformation. We started with physical appliances decades ago and it was sufficient to an extent. The reason it worked was that it suited the requirements of the time, but our environment has changed since then. Hence, we need to accommodate these changes with the current requirements.

Even back in those days, we always had a breachable perimeter. The perimeter-approach to networking and security never really worked and it was just a matter of time before the bad actor would penetrate the guarded walls.

Securing a global network involves more than just firewalling the devices. A solid security perimeter requires URL filtering, anti-malware and IPS to secure the internet traffic. If you try to deploy all these functions in a single device, such as, unified threat management (UTM), you will hit scaling problems. As a result, you will be left with appliance sprawl.

Back in my early days as an engineer, I recall stitching together a global network with a mixture of security and network appliances from a variety of vendors. It was me and just two others who used to get the job done on time and for a production network, our uptime levels were superior to most.

However, it involved too many late nights, daily flights to our PoPs and of course the major changes required a forklift. A lot of work had to be done at that time, which made me want to push some or most of the work to a 3rd party.

### Option 2: The managed service solution

Today, there is a growing need for the managed service approach to SD-WAN. Notably, it simplifies the network design, deployment and maintenance activities while offloading the complexity, in line with what most CIOs are talking about today.

Managed service provides a number of benefits, such as the elimination of backhauling to centralized cloud connectors or VPN concentrators. Evidently, backhauling is never favored for a network architect. More than often it will result in increased latency, congested links, internet chokepoints, and last-mile outages.

Managed service can also authenticate mobile users at the local communication hub and not at a centralized point which would increase the latency. So what options are available when considering a managed service?

### Telcos: An average service level

Let’s be honest, telcos have a mixed track record and enterprises rely on them with caution. Essentially, you are building a network with 3rd party appliances and services that put the technical expertise outside of the organization.

Secondly, the telco must orchestrate, monitor and manage numerous technical domains which are likely to introduce further complexity. As a result, troubleshooting requires close coordination with the suppliers which will have an impact on the customer experience.

### Time equals money

To resolve a query could easily take two or three attempts. It’s rare that you will get to the right person straight away. This eventually increases the time to resolve problems. Even for a minor feature change, you have to open tickets. Hence, with telcos, it increases the time required to solve a problem.

In addition, it takes time to make major network changes such as opening new locations, which could take up to 45 days. In the same report mentioned above, 71% of the respondents are frustrated with the telco customer-service-time to resolve the problems, 73% indicated that deploying new locations requires at least 15 days and 47% claimed that “high bandwidth costs” is the biggest frustration while working with telcos.

When it comes to lead times for projects, an engineer does not care. Does a project manager care if you have an optimum network design? No, many don’t, most just care about the timeframes. During my career, now spanning 18 years, I have never seen comments from any of my contacts saying “you must adhere to your project manager’s timelines”.

However, out of the experience, the project managers have their ways and lead times do become a big part of your daily job. So as an engineer, 45-day lead time will certainly hit your brand hard, especially if you are an external consultant.

There is also a problem with bandwidth costs. Telcos need to charge due to their complexity. There is always going to be a series of problems when working with them. Let’s face it, they offer an average service level.

### Co-management and self-service management

What is needed is a service that equips with the visibility and control of DIY to managed services. This, ultimately, opens the door to co-management and self-service management.

Co-management allows both the telco and enterprise to make changes to the WAN. Then we have the self-service management of WAN that allows the enterprises to have sole access over the aspect of their network.

However, these are just sticking plasters covering up the flaws. We need a managed service that not only connects locations but also synthesizes the site connectivity, along with security, mobile access, and cloud access.

### Introducing the cloud-native approach to SD-WAN

There should be a new style of managed services that combines the best of both worlds. It should offer the uptime, predictability and reach of the best telcos along with the cost structure and versatility of cloud providers. All such requirements can be met by what is known as the cloud-native carrier.

Therefore, we should be looking for a platform that can connect and secure all the users and resources at scale, no matter where they are positioned. Eventually, such a platform will limit the costs and increase the velocity and agility.

This is what a cloud-native carrier can offer you. You could say it’s a new kind of managed service, which is what enterprises are now looking for. A cloud-native carrier service brings the best of cloud services to the world of networking. This new style of managed service brings to SD-WAN the global reach, self-service, and agility of the cloud with the ability to easily migrate from MPLS.

In summary, a cloud-native carrier service will improve global connectivity to on-premises and cloud applications, enable secure branch to internet access, and both securely and optimally integrate cloud datacenters.

**This article is published as part of the IDG Contributor Network.[Want to Join?][4]**

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3398476/managed-wan-and-the-cloud-native-sd-wan.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.techhive.com/images/article/2017/03/network-wan-100713693-large.jpg
[2]: https://www.networkworld.com/article/2297171/sd-wan/network-security-mpls-explained.html
[3]: https://www.catonetworks.com/news/digital-transformation-survey
[4]: /contributor-network/signup.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
