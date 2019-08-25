[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intent-Based Networking (IBN): Bridging the gap on network complexity)
[#]: via: (https://www.networkworld.com/article/3428356/intent-based-networking-ibn-bridging-the-gap-on-network-complexity.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

Intent-Based Networking (IBN): Bridging the gap on network complexity
======
Intent-Based Networking was a result of the need for greater network automation.
![IDG / Thinkstock][1]

Networking has gone through various transformations over the last decade. In essence, the network has become complex and hard to manage using traditional mechanisms. Now there is a significant need to design and integrate devices from multiple vendors and employ new technologies, such as virtualization and cloud services.

Therefore, every network is a unique snowflake. You will never come across two identical networks. The products offered by the vendors act as the building blocks for engineers to design solutions that work for them. If we all had a simple and predictable network, this would not be a problem. But there are no global references to follow and designs vary from organization to organization. These lead to network variation even while offering similar services.

It is estimated that over 60% of users consider their I.T environment to be more complex than it was 2 years ago. We can only assume that network complexity is going to increase in the future.

**[ Learn more about SDN: Find out [where SDN is going][2] and learn the [difference between SDN and NFV][3]. | Get regularly scheduled insights by [signing up for Network World newsletters][4]. ]**

Large enterprises and service providers need to manage this complexity to ensure that all their traffic flows, policies and configurations are in line with requirements and objectives. You cannot manage a complex network in a manual way. Human error will always get you, eventually slowing down the network prohibiting agility.

As I wrote about on Network Insight _[Disclaimer: the author is employed by Network Insight]_, the fact that the network is complex and error-prone is an [encouragement to automate][5]. How this actually happens, depends on the level of automation. Hence, a higher-level of orchestration is needed.

### The need to modernize

This complexity is compounded by the fact that the organizations are now looking to modernize their business processes and networks. The traditional vertically integrated monolithic networking solutions prohibit network modernization. This consequently creates a gap between the architect’s original intent and the actual runtime-behavior.

If you examine, you will find that the contents of a design document are loosely coupled to the network execution. Primarily, there is no structured process as to how the design documents get translated and implemented to the actual devices. How it gets implemented is wide-open to individual interpretation.

These networks were built for a different era. Therefore, we must now shift the focus from the traditional network prescriptive to Intent-Based Networking (IBN). IBN is a technology that has the capability to modernize the network and process in-line with the overall business objectives. This gives you the tight coupling of your design rules with your network.

### The need for new tools

Undoubtedly, we need new tools, not just from the physical device’s perspective, but also from the traffic’s perspective. Verifying the manual way will not work anymore. We have 100s of bits in the packet, meaning the traffic could be performing numerous talks at one time. Hence, tracking the end-to-end flow is impossible using the human approach.

When it comes to provisioning, CLI is the most common method used to make configuration changes. But it has many drawbacks. Firstly, it offers the wrong level of abstraction. It targets the human operator and there is no validation whether the engineers will follow the correct procedures.

Also, the CLI languages are not standardized across multi-vendors. The industry reacted and introduced NETCONF. However, NETCONF has many inconsistencies across the vendor operating systems. Many use their own proprietary format, making it hard to write NETCONF applications across multiple vendor networks.

NETCONF was basically meant to make the automation easy but in reality, the irregularities it presented actually made the automation even more difficult. Also, the old troubleshooting tools that we use such as ping, traceroute does not provide a holistic assessment of how the network is behaving. Traceroute has problems with IP unnumbered links which is useful in the case of fully automated network environments. On the other hand, ping tells you nothing about how the network is performing. These tools were originally built for simpler times.

We need to progress to a vendor-agnostic solution that can verify the intent against the configured policies. This should be regardless of the number of devices, the installed operating system, traffic rules and any other type of configured policy. We need networks to be automated and predictable. And the existing tools that are commonly used add no value.

In a nutshell, we need a new model that can figure out all the device and traffic interactions, not just at the device level but the network-wide level.

### IBN and SDN

Software-Defined Networking (SDN) was a success in terms of interest, on the other hand, its adoption rate largely comprised of only the big players. These were the users who had the resources to build their own hardware and software, such as Google and Facebook.

For example, Google’s B4 project to build an efficient Wide Area Network (WAN) in a dynamic fashion with flow-based optimization. However, this would be impossible to implement in case of a traditional WAN architecture on the production network.

IBN is a natural successor to SDN as it borrows the same principles and architectures; a divide between the application and the network infrastructure. Similar to SDN, IBN is making software that controls the network as a whole, instead of device-to-device.

Now the question that surfaces is can SDN, as a concept, automate as much as you want it to? Virtually, SDN uses software to configure the network, thereby driving a software-based network. But IBN is the next step where you have more of an explicit emphasis. Intent-Based systems work higher in the application level to offer true automation.

### What is IBN?

IBN was a result of the need for greater network automation. IBN is a technology that provides enhanced automation and network insights. It represents a paradigm shift that focuses on “what” the network is supposed to do versus “how” the network components are configured. It monitors if the network design is doing what it should be doing.

IBN does this by generating the configuration for the design and device implementation. In addition, it continuously verifies and validates in real-time whether the original intent is being met. For example, if the desired intent is not being met, the system can take corrective action, such as modifying a QoS policy, VLAN or ACL. This makes the network more in-line with both; business objectives and compliance requirements.

It uses declarative statements i.e. what the network should do as opposed to imperative statements that describe how it should be done. IBN has the capability to understand a large collection of heterogeneous networks which consist of a range of diverse devices that do not have one API. This substantially allows you to focus on the business needs rather than the constraints of traditional networking.

### The IBN journey

The first step on the road to IBN is to translate all of this into explicit logical rules which are essentially a piece of IBN software. You also need to understand the traffic to see if the reality is matching the intent. For this, the system would build a model of the network and then verify that model; this is known as formal verification in computer science. This is a method where we mathematically analyze the network to see if it's matching its intent. This involves certain calculations to encompass the logic.

### Network verification

Network verification is a key part of any IBN system. It requires an underlying mathematical model of the network behavior in order to analyze and reason out the targeted network design and policies. The systems need to verify all the conceivable packets flows and traffic patterns.

Although there are no clear architectural guidelines for IBN a mathematical model can be used to treat every network device. This can be treated as a set of algebraic and logical operations on all the packet types and traffic flows at a per-device level. This allows the IBM system to evaluate and verify all the possible scenarios.

When a device receives a packet, it can perform a number of actions. It can forward the packet to a particular port, drop the packet, or modify the packet header and then forward to a port. It’s up to the mathematical model to understand how each device responds to every possible type of packet and to evaluate the behavior at a network-wide level, not just at a device-level.

Principally, the verification process must be end-to-end. It must collect the configuration files and state information from every device on the network. It then mathematically analyzes the behavior of all the possible traffic flows on a hop-by-hop basis. The IBM system builds a software model of the network infrastructure. This model first reads the Layer 2 to Layer 4 configuration details and then collects the state from each device (IP routing tables).

With IBN we will see the shift from a reactive to a proactive approach. It will have a profound effect on the future of networking as we switch to a model that primarily focuses on the business needs and makes things easier. We are not as far down the road as one might think, but if you want to you can start your IBN journey today. So, the technology is there, and a phased deployment model is recommended. If you look at the deployment of IDS/IPS, you will find that most are still altering.

**This article is published as part of the IDG Contributor Network. [Want to Join?][6]**

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3428356/intent-based-networking-ibn-bridging-the-gap-on-network-complexity.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/01/nw_2018_intent-based_networking_cover_art-100747914-large.jpg
[2]: https://www.networkworld.com/article/3209131/lan-wan/what-sdn-is-and-where-its-going.html
[3]: https://www.networkworld.com/article/3206709/lan-wan/what-s-the-difference-between-sdn-and-nfv.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://network-insight.net/2019/07/introducing-intent-based-networking-its-not-hype/
[6]: https://www.networkworld.com/contributor-network/signup.html
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
