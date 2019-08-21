[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco will use AI/ML to boost intent-based networking)
[#]: via: (https://www.networkworld.com/article/3400382/cisco-will-use-aiml-to-boost-intent-based-networking.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco will use AI/ML to boost intent-based networking
======
Cisco explains how artificial intelligence and machine learning fit into a feedback loop that implements and maintain desired network conditions to optimize network performance for workloads using real-time data.
![xijian / Getty Images][1]

Artificial Intelligence and machine learning are expected to be some of the big topics at next week’s Cisco Live event and the company is already talking about how those technologies will help drive the next generation of [Intent-Based Networking][2].

“Artificial intelligence will change how we manage networks, and it’s a change we need,” wrote John Apostolopoulos Cisco CTO and vice president of Enterprise Networking in a [blog][3] about how Cisco says these technologies impact the network.

**[ Now see[7 free network tools you must have][4]. ]**

AI is the next major step for networking capabilities, and while researchers have talked in the past about how great AI would be, now the compute power and algorithms exist to make it possible, Apostolopoulos told Network World.

To understand how AI and ML can boost IBN, Cisco says it's necessary to understand four key factors an IBN environment needs: infrastructure, translation, activation and assurance.

Infrastructure can be virtual or physical and include wireless access points, switches, routers, compute and storage. “To make the infrastructure do what we want, we use the translation function to convert the intent, or what we are trying to make the network accomplish, from a person or computer into the correct network and security policies. These policies then must be activated on the network,” Apostolopoulos said.

The activation step takes the network and security polices and couples them with a deep understanding of the network infrastructure that includes both real-time and historic data about its behavior. It then activates or automates the policies across all of the network infrastructure elements, ideally optimizing for performance, reliability and security, Apostolopoulos wrote.

Finally assurance maintains a continuous validation-and-verification loop. IBN improves on translation and assurance to form a valuable feedback loop about what’s going on in the network that wasn’t available before. ** **

Apostolopoulos used the example of an international company that wanted to set up a world-wide video all-hands meeting. Everyone on the call had to have high-quality, low-latency video, and also needed the capability to send high-quality video into the call when it was time for Q&A.

“By applying machine learning and related machine reasoning, assurance can also sift through the massive amount of data related to such a global event to correctly identify if there are any problems arising. We can then get solutions to these issues – and even automatically apply solutions – more quickly and more reliably than before,” Apostolopoulos said.

In this case, assurance could identify that the use of WAN bandwidth to certain sites is increasing at a rate that will saturate the network paths and could proactively reroute some of the WAN flows through alternative paths to prevent congestion from occurring, Apostolopoulos wrote.

“In prior systems, this problem would typically only be recognized after the bandwidth bottleneck occurred and users experienced a drop in call quality or even lost their connection to the meeting. It would be challenging or impossible to identify the issue in real time, much less to fix it before it distracted from the experience of the meeting. Accurate and fast identification through ML and MR coupled with intelligent automation through the feedback loop is key to successful outcome.”

Apostolopoulos said AI can accelerate the path from intent into translation and activation and then examine network and behavior data in the assurance step to make sure everything is working correctly. Activation uses the insights to drive more intelligent actions for improved performance, reliability and security, creating a cycle of network optimization.

So what might an implementation of this look like? Applications that run on Cisco’s DNA Center may be the central component in an IBN environment. Introduced on 2017 as the heart of its IBN initiative, [Cisco DNA Center][5] features automation capabilities, assurance setting, fabric provisioning and policy-based segmentation for enterprise networks.

“DNA Center can bring together AI and ML in a unified manner,” Apostolopoulos said. “It can store data from across the network and then customers can do AI and ML on that data.”

Central to Cisco's push is being able to gather metadata about traffic as it passes without slowing the traffic, which is accomplished through the use of ASICs in its campus and data-center switches.

“We have designed our networking gear from the ASIC, OS and software levels to gather key data via our IBN architecture, which provides unified data collection and performs algorithmic analysis across the entire network (wired, wireless, LAN, WAN, datacenter), Apostolopoulos said. “We have a massive collection of network data, including a database of problems and associated root causes, from being the world’s top enterprise network vendor over the past 20-plus years. And we have been investing for many years to create innovative network-data analysis and ML, MR, and other AI techniques to identify and solve key problems.”

Machine learning and AI can then be applied to all that data to help network operators handle everything from policy setting and network control to security.

“I also want to stress that the feedback the IT user gets from the IBN system with AI is not overwhelming telemetry data,” Apostolopoulos said. Instead it is valuable and actionable insights at scale, derived from immense data and behavioral analytics using AI.

Managing and developing new AI/ML-based applications from enormous data sets beyond what Cisco already has is a key driver behind it’s the company’s Unified Compute System (UCS) server that wasa rolled out last September. While the new server, the UCS C480 ML, is powerful – it includes eight Nvidia Tesla V100-32G GPUs with 128GB of DDR4 RAM, 24 SATA hard drives and more – it is the ecosystem of vendors – Cloudera, HortonWorks and others that will end up being more important.

[Earlier this year Cisco forecast][6] that [AI and ML][7] will significantly boost network management this year.

“In 2019, companies will start to adopt Artificial Intelligence, in particular Machine Learning, to analyze the telemetry coming off networks to see these patterns, in an attempt to get ahead of issues from performance optimization, to financial efficiency, to security,” said [Anand Oswal][8], senior vice president of engineering in Cisco’s Enterprise Networking Business. The pattern-matching capabilities of ML will be used to spot anomalies in network behavior that might otherwise be missed, while also de-prioritizing alerts that otherwise nag network operators but that aren’t critical, Oswal said.

“We will also start to use these tools to categorize and cluster device and user types, which can help us create profiles for use cases as well as spot outlier activities that could indicate security incursions,” he said.

The first application of AI in network management will be smarter alerts that simply report on activities that break normal patterns, but as the technology advances it will react to more situations autonomously. The idea is to give customers more information so they and the systems can make better network decisions. Workable tools should appear later in 2019, Oswal said.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3400382/cisco-will-use-aiml-to-boost-intent-based-networking.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/ai-vendor-relationship-management_bar-code_purple_artificial-intelligence_hand-on-virtual-screen-100795252-large.jpg
[2]: http://www.networkworld.com/cms/article/3202699
[3]: https://blogs.cisco.com/enterprise/improving-networks-with-ai
[4]: https://www.networkworld.com/article/2825879/7-free-open-source-network-monitoring-tools.html
[5]: https://www.networkworld.com/article/3280988/cisco-opens-dna-center-network-control-and-management-software-to-the-devops-masses.html
[6]: https://www.networkworld.com/article/3332027/cisco-touts-5-technologies-that-will-change-networking-in-2019.html
[7]: https://www.networkworld.com/article/3320978/data-center/network-operations-a-new-role-for-ai-and-ml.html
[8]: https://blogs.cisco.com/author/anandoswal
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
