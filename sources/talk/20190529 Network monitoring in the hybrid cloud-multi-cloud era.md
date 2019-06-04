[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Network monitoring in the hybrid cloud/multi-cloud era)
[#]: via: (https://www.networkworld.com/article/3398482/network-monitoring-in-the-hybrid-cloudmulti-cloud-era.html)
[#]: author: (Stacy Collett )

Network monitoring in the hybrid cloud/multi-cloud era
======
Most enterprises now use two or more cloud service providers, and 35% use up to five monitoring tools to keep tabs on hybrid cloud and multi-cloud environments. What’s the best approach to full network visibility?
![Thinkstock][1]

Network monitoring in the enterprise has never been easy. Even before organizations began moving software and infrastructure to the cloud, a typical enterprise used four to 10 tools just to monitor and troubleshoot their own networks, according to analyst and consulting firm [Enterprise Management Associates][2].

The public cloud adds another complex wrinkle to network visibility. Traditional monitoring tools center around the health and performance of individual network elements. Today’s digital business era requires a more holistic view of networks with the ability to glean and correlate data from diverse cloud environments using big data analytics and machine learning.

**Learn more about network management**

  * [What’s hot in network certifications][3]
  * [Review: 4 open-source network management tools][4]
  * [Coding, cloud skills are most in demand for network pros][5]
  * [Network operations: A new role for AI and ML][6]



Today 40% of organizations consider themselves multi-cloud users, having two or more cloud service providers for their organization, according to a survey by [Kentik][7]. One-third of organizations have a [hybrid cloud][8] environment, with at least one cloud service provider and some type of traditional infrastructure that is company-owned, co-located, or a third-party data center.

“There’s a lot of different types of data that people collect and analyze on the network – everything from device metrics to NetFlow to packets to logs to active synthetic monitoring, and no one vendor does it all very well. Most of them don’t even try to do all of it,” says Shamus McGillicuddy, research director at EMA.

As a result, 35% of multi-cloud users have three to five monitoring tools, including log management tools (48%), application performance management tools (40%), open-source tools (34%), and network performance management tools (25%).

“Network people tell me they just can’t find end-to-end tools. They have a really good view of the data center, a good view of AWS, a good view of Azure, but they can’t pull it all together,” McGillicuddy says.

“The environment is getting far more complex,” says Bob Laliberte, senior analyst at [Enterprise Strategy Group][9]. “So it will be critical for them to find very sophisticated tools that will allow that complex environment to become simple to manage."

Easier said than done. Network professionals often complain that existing device-centric network monitoring does not scale or provide the needed visibility for cloud and digital-business-era applications. Cloud-native monitoring tools, such as Amazon CloudWatch, Azure Monitor or GCP Stackdriver, are less piecemeal and can observe all infrastructure and application layers, but some users find cloud tools often lacking in features and visibility, not to mention that they don’t integrate well with on-premises tools.

No vendor has come up with a “big picture” monitoring solution, and one shouldn’t be expected anytime soon because of the vast differences between the networks you own and those you rent, analysts say. But there are ways to close the gap just a little and achieve better visibility across the networks.

### Connecting islands of network insight

In a hybrid cloud environment, “you’re always going to have islands of visibility. The important thing is to look for opportunities to integrate those islands,” McGillicuddy says.

One of the most valuable sources of data for a network monitoring tool is a management system API used to pull data from other platforms, whether it’s from AWS, or an IT service management platform like ServiceNow that’s sending ticket data, or a security monitoring tool.

“If you’re going to try to pull these things together, you need a network monitoring vendor that has a very modern API on the tool that gives you access to things like custom data collection, tool customization, and the ability to build new dashboards that allow you to see the cloud in the way you want to see it," McGillicuddy says.

Most newer vendors will have a good API, he adds. Older ones might be slower to open up APIs to customers because they consider the data they produce with their analytics to be proprietary.

“Infrastructure teams may have an advantage with some of the legacy tools that they currently have that are expanding into cloud-native environments,” Laliberte says. Tool sets like Riverbed, which integrates SNMP polling, flow and packet capture to get an enterprise network view of performance in hybrid cloud environments, and SolarWinds advanced network monitoring for on-premises, hybrid, and cloud, “give the opportunity to tie in both the legacy and cloud” monitoring, he adds.

Many traditional network monitoring tools, however, have been slow to adopt a roadmap for the cloud. Some 74% of network managers surveyed by EMA say they had a network management tool fail to meet their public cloud requirements. Among those network managers, 28% said this failure was due to vendor inaction or lack of a cloud support roadmap.

“I think we’ll get to the place where all the vendors are ‘good’ at incorporating some insight into the cloud with their tool – but I don’t think you’ll ever see a time where there is true parity,” McGillicuddy says.

### Cloud service providers make some progress

For cloud native and multi-cloud environments, “the cloud providers are starting to provide a little more consistent access to tools to monitor the networks that cross their perimeters,” says Gregg Siegfried, research director, cloud and IT operations at [Gartner][10].

Microsoft Azure, for example, has added Virtual Network TAP (currently in preview in all Azure regions), which allows you to continuously stream your virtual machine network traffic to a network packet collector or analytics tool. The collector or analytics tool is provided by a network virtual appliance partner.

“Those are much more akin to what network engineers are seeing from their onsite [systems] – so the ability to integrate things like that will certainly assist in those hybrid environments,” Siegfried says.

Despite the progress being made, many cloud users don’t know about or take advantage of some of the monitoring features already in place, according to Kentik. For instance, more than half of AWS users surveyed say they are using the cloud-specific monitoring tools offered by AWS, such as flow logs.

“I generally recommend that clients try the cloud providers’ tools first and cloud-native tools first before spending time and money on third parties,” Siegfried says, “but there is absolutely a delta between the visibility you get from a cloud provider and the visibility you can get with one of these [add-on] products.”

### Crossing the lines: multi-cloud monitoring

New tools have emerged that combine monitoring across multi-cloud environments.

The types of features that are important in these tools are their ability to be adaptable, their ability to support collaboration with product development and other infrastructure teams, and their ability to integrate data from multiple sources. It should also be able to factor in things like cost and capacity management that are important in a hybrid network, Siegfried says.

Some of these tools include ThousandEyes, Kentik and APM tools, such as New Relic and Dynatrace, to name a few, Siegfried adds.

Kentik in April announced integrated support for Microsoft Azure. Kentik began using flow data from AWS and Google Cloud Platform late last year. The platform also integrates with other cloud infrastructure data sources, such as host-level instrumentation, virtual network appliances, and container orchestration or service mesh.

Kentik primarily collects NetFlow or real traffic data between two points. It’s telling you what happened on your network and enhances it with other data sources.

Internet monitoring vendor ThousandEyes last year extended its Network Intelligence product to multi-cloud environments. The company has pre-provisioned IaaS vantage points, including 15 AWS, 25 Azure, and 15 GCP regions, giving them visibility into how specific cloud providers are performing in various geographies. It can also do agent-to-agent testing between clouds, giving IT the ability to measure inter-region, hybrid, inter and intra-cloud performance.

While Kentik monitors live traffic, ThousandEyes generates synthetic traffic that emulates a user, and then tells you what could be happening with a hypothetical network transaction.

Interest in active synthetic monitoring solutions has grown over the last three years, McGillicuddy says. “It’s two different ways of looking at things. Synthetic is good because some transactions you can’t see from both sides.”

### AIOps and advanced analytics platforms

As network monitoring becomes as much about data acquisition and ingestion as it does about troubleshooting, analysts see the emergence of artificial intelligence for IT Operations (AIOps) and advanced analytics platforms that perform big data analysis and machine learning to correlate insights across tools.

“You see some vendors like CA doing that with their big data stack they’ve built called Jarvis that plugs into different parts of their tool portfolio to correlate insights across them,” McGillicuddy says. “They’ve also tried to make it easier to pull data from third-party vendors to correlate insights. Some specialist vendors can also plug into all your monitoring stuff and correlate everything for you in a way that’s easy to see,” he adds. “We see some indication in our research so far that that’s actually a good approach.”

### Looking ahead: Distributed network monitoring

Gartner recommends a data-driven network monitoring framework for boosting network visibility across multiple cloud services, rather than rely on traditional infrastructure tools.

“Use cloud native tools, as opposed to trying to bring your internal tools in the cloud, and wait to see how the market [develops],” says Simon Richard, senior director and analyst at Gartner. “I suspect that the better tools to do multi-cloud monitoring will be coming from the cloud [providers].”

“Whether we call it hybrid, cloud or SD networking, the future of networking is software defined – with distributed rather than centralized intelligence or control,” Siegfried says. “The same automation philosophy, infrastructure and code techniques that have disrupted other areas of infrastructure management are applying to networking as well. Consider a data-centric network monitor framework … for building the types of network monitoring platforms that will survive or support some of these evolving architectures.”

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3398482/network-monitoring-in-the-hybrid-cloudmulti-cloud-era.html

作者：[Stacy Collett][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/clouds_binoculars_network-monitoring_future-it_looking_horizon_vision-100797672-large.jpg
[2]: https://www.enterprisemanagement.com/
[3]: https://www.networkworld.com/article/3317565/what-s-hot-in-network-certifications.html?nsdr=true
[4]: https://www.networkworld.com/article/3331852/review-4-open-source-network-management-tools-improve-usability-performance.html
[5]: https://www.networkworld.com/article/3332923/software-cloud-lead-in-demand-skills-for-network-pros.html
[6]: https://www.networkworld.com/article/3320978/network-operations-a-new-role-for-ai-and-ml.html?nsdr=true
[7]: https://www.kentik.com/
[8]: https://www.networkworld.com/article/3233132/what-is-hybrid-cloud-computing.html
[9]: https://www.esg-global.com/
[10]: https://www.gartner.com/en
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
