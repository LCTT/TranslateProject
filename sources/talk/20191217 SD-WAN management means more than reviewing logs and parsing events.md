[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SD-WAN management means more than reviewing logs and parsing events)
[#]: via: (https://www.networkworld.com/article/3490333/sd-wan-management-means-more-than-reviewing-logs-and-parsing-events.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

SD-WAN management means more than reviewing logs and parsing events
======
Creating a single view of the different types of data requires specialized skills, custom integration and a significant budget. Just look at the SIEM.
Getty Images

By creating a single view of all network data, you can do things better like correlating threat information to identify real attacks or keep a log of packet statistics to better diagnose intermittent networking problems.

However, to turn data into value with the limitations of traditional systems, we must be creative with the solution. We must find ways to integrate the different repositories in various appliances. It’s not an easy task but an architectural shift that I’ve written about in the past, SASE (Secure Access Service Edge), should help significantly.

SASE is a new enterprise networking technology category introduced by Gartner in 2019. It represents a change in how we connect our sites, users, and cloud resources.

[][1]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][1]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

This can be of considerable support, especially when it comes to the challenges faced with SIEM (Security Information and Event Management).

### Creating a single view is challenging

Creating a single view of the different types of data requires specialized skills, custom integration, and a significant budget. The SIEM is used to bring data from multiple products, apply rules and orchestrate a variety of platforms to act together. In reality, there is a lot of custom integration involved.

The questions that surface is; how do logs get into the SIEM when off the network? How do you normalize the data, write the rules to detect for suspicious activity and then investigate if there are legitimate alerts? Unfortunately, the results are terrible for the investment that people make. The SIEM can’t be performed in a small organization. You will need the resources to pull it off.

### Challenges with the SIEM

In a previous consultancy role, I experienced first-hand the challenges of running a SIEM. Ultimately, the company had to improve its security monitoring. Like most, they came across the same problem and recognized there was a big gap when it came to detection.

[The time of 5G is almost here][2]

When I first came across the potentials of the SIEM, like most, I was thoroughly excited by its hype. Now, there was a tool that allowed me to take my ideas and run them against numerous rich data sets. From these sets, I could get immediately gain insight into threats on the network and act. However, this is far from reality - the SIEM is complex.

### Different data from different devices

Both security and networking store and expose data differently. Each of them carries out an individual role and have access to different data. Data can be abstracted from the management, control and data planes to build analytics that can be queried. This results in multiple levels of data available for analysis. Essentially, for this, you need to be an expert in each of these planes.

Preparing all the data gathered from your entire infrastructure is complicated. Developing a timeline of events requires mastering a range of protocols and APIs just to retrieve the necessary data from networking and security appliances. Therefore, it can be a challenge to find the right data for your problem.

### First, you need to collect the right data

Firstly, you need to collect the right data - the SIEM is only as good as the data you feed it with. This emerges the urge for the right data that needs to get loaded to the SIEM. Since the data available with SIEM rules is provided from logs and event data from other software products, the quality of the data comes down to what was first chosen to be logged. This is compounded by the accuracy/availability of the SIEM vendor's connector.

The data may be fed into the SIEM with Syslog, which requires parsing, loss of data and context from the original source. Evidently, a lot of the times, the SIEM is loaded with useless data. Many often stumble with this first step.

### Aggregate the data

When new threats materialize, it’s challenging to gather more data to support the new detection rules. There is also a long lead time associated with collecting new data and putting the brakes on agility. In short, the SIEM requires extensive data collection infrastructure and inter-team collaboration.

### Normalize the data

There will also be some kind of normalizing event where the data is cleaned up. Here, data interpretation and normalization technologies are needed to store the event data in a common format for analysis.

A big claim-to-fame for the SIEM products is that they normalize data input. If you examine a windows security event, there is a big distinction between each of these events. Therefore, it’s recommended not to count on the SIEM products to interpret the inputs they receive.

### No investigation support

The SIEM has no investigation support. Hence, once the data is in your SIEM, you must be the one to tell the SIEM what to do with it. It’s like buying an alarm clock without the batteries. Consider an intrusion detection system, we all know that a skilled analyst is required to translate the output into actionable intelligence; a SIEM is no different.

Typically, the SIEM rules are targeted for detecting the activities of interest rather than investigating them. For example, an event can only tell you that a file was uploaded. However, it tells nothing about what type of site it was uploaded to, where it came from and what the file was.

This, predominantly, involves investigation between the security analyst and the operations team. Performing the querying and utilizing this information requires specialized skills and knowledge.

### Deployment/resource-heavy

A lot of resources are spent to manage SIEM. Time is needed for deploying agents, parsing logs, or performing the upgrade. Concisely, SIEM technology requires 24x7 monitoring and maintenance. By and large, the SIEM takes too long to deploy and some of these stages can even take years to complete. You really need a handful of full-time security analysts to do this. As it stands, there is a worldwide shortage of experienced security analysts.

### Point solutions address one issue

The way networking and security have been geared up is that we are sold everything in pieces. We have point solutions that only address one issue. Then there are servers, routers, switches and a variety of security devices. When a device operates within its own domain, it will only see that domain. Therefore, these point solutions need to be integrated so the user can form a picture of what is happening on the network.

Consider an IDS, it looks at individual packets and tries to ascertain whether there is a threat or not. Practically, it does not have a holistic overall view of what is truly happening in networking. So, when you actually identity there was a problem, you simply don’t have the right information at hand to identify who the user is, what it does and what happened.

For threat investigation, the user will need to log on to other systems and glue the information. This will result in a high number of false positives in a world that already has alert-fatigue.

### How SASE can help – a common datastore

Significantly, SASE converges the functions of both networking and security into a unified and global cloud-native service. Therefore, it pulls data from both the domains into a common data store. There are of course many benefits to this but one of the substantial benefits is troubleshooting.

SASE vendors could make it very easy to drill deep into the networking and security events that should already be stored and normalized in a common data warehouse. SASE unlocks the potential for super-efficient troubleshooting without the pain of deploying a SIEM.

A case in point is Cato network’s recent announcement of [Cato Instant*Insight][3]. The new feature to its SASE platform provides a single tool for mining the security and networking event data generated across a customer’s Cato instance. That’s how SASE helps. Profoundly, everything becomes easier when your networking and security data is being gathered by one platform.

With data pulled together, investigation and analysis become easier. Cato Instant*Insight, for example, organizes the millions of networking and security events tracked by Cato into a single and queryable timeline. Here we have an automated aggregation, faceted search, and a built-in network analysis workbench.

[Netsurion][4], another SD-WAN vendor, provides a managed SIEM service. This is offered as SOC-as-a-Service. However, with this and other managed SIEMs, there may still be a strong separation between the network domain and a security domain. In the sense that they’re only gathering security data and not network data. Therefore, both NOC and SOC teams have a fragmented view. And the common challenge for the enterprise will still remain.

With the SIEM, there is no such thing as delivering visibility out-of-the-box. Realistically, it requires extensive custom integration and development. For many companies, SIEMs wasn’t feasible. The integration costs were just too high and too much time was needed to gather baseline data.

But that’s all premised on a misconception that you continue to build your network from the appliances from different vendors. If you were to replace appliances with a converged cloud infrastructure, then you eliminate much of the challenge of the SIEM.

**This article is published as part of the IDG Contributor Network. [Want to Join?][5]**

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3490333/sd-wan-management-means-more-than-reviewing-logs-and-parsing-events.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[2]: https://www.networkworld.com/article/3354477/mobile-world-congress-the-time-of-5g-is-almost-here.html
[3]: https://www.catonetworks.com/news/it-managers-analyze-1-million-events-in-1-second-at-no-charge-with-cato-instant-insight/
[4]: https://www.netsurion.com/solutions/threat-protection
[5]: https://www.networkworld.com/contributor-network/signup.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
