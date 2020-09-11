[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (7 considerations when buying network-automation tools)
[#]: via: (https://www.networkworld.com/article/3490459/7-considerations-when-buying-network-automation-tools.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

7 considerations when buying network-automation tools
======
Here’s the factors you need to weigh so you can make a smart decision about the network automation tool that’s best for your organization.
bananajazz / Getty Images

The concept of network automation has been around for as long as there have been networks, and until now the uptake has been slow for a number of reasons including resistance from network engineers.  But now forces are coming together to create a perfect storm of sorts, driving a need for network automation tools.

One factor is that more and more network teams are starting to feel the pain of working in the fast-paced digital world where doing things the old way simply does not work.  The manual, box-by-box, method of configuring and updating routers and switches through a command-line interface (CLI) is too slow and error prone. 

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

Also, the rise of software-defined networks ([SDN][2]), including software-defined WANs ([SD-WAN][3]), has enabled network-automation tools to evolve from operationally focused point products that address things like change management and configuration into policy and orchestration tools.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Today, network-automation tools are strategic, enable business alignment, and provide a roadmap to the utopian state of a fully intent-based system where the network runs and secures itself. Their time is now, but there is a wide range of them. Below are seven key criteria that enterprises should consider when deciding which is best for them.

### Single vendor or multi-vendor?

There are several third-party and vendor-specific network automation tools.  Red Hat, NetBrain and Forward Networks are three of the leading multi-vendor tools.  All of the major network vendors including Cisco, Juniper, Arista and Extreme have their own automation platforms.

Customers need to determine if they want to go all in with a single vendor or strive for multiple vendors. Neither is better per se; it’s a choice the enterprise needs to make. If a single vendor platform is chosen, ensure it works with the vendor's entire product line and not just a subset. If a third-party tool is chosen, seek out one that that supports the current and likely future vendors whose gear will be in the organization’s network.

### Breadth of APIs

It’s important that network-automation tools interface with other tools such as ServiceNow and Splunk. This means every feature should be available as an API, which isn’t always the case. Even if a tool is being used standalone today, it will likely need to interface with another application in the near future for broader automation capabilities, so this should not be overlooked.

### Orchestration

When network devices change, it’s often the case that another element of the infrastructure must also change. For example, when a network device is added, it may require changing a [firewall][5] setting or connecting to a load balancer. This drives up the need for orchestration capabilities so the network-automation tool can trigger other automation frameworks to change devices that are upstream or downstream from it.

### AI/intent-based networking capabilities

The concept of an [intent-based network][6] is that it runs, heals and secures itself. This can’t be done with a bevy of rules because the environment changes too fast. Instead, AI capabilities should be included in the system to fully automate all operations so the network itself can adapt to changes.

ZK Research recommends that the system have two modes of operation – one that recommends changes for the engineer to execute on and then one that fully executes changes without requiring human intervention.  This will let the customer get comfortable with AI first. (One question ZK Research gets a lot is how one knows it’s really AI based. The answer is that the tool gets smarter over time.  All changes should feed back into the system as part of the learning data set and make the system smarter.  Rules-based systems will not.)

### SaaS or on-prem?

Traditional network-automation tools have been offered only as on-premises software or appliances. There is a growing number of companies that prefer to buy the tools in a software as a service (SaaS) model to ensure rapid deployment and continuous updates.

Again, there’s no wrong choice.  The company needs to determine which option best fits its operating model and compliance requirements.

One important note: It’s the belief of ZK Research that all solutions will eventually be hybrid where customers may keep the data on the local premises, but advanced, artificial intelligence capabilities and cross-company comparisons will be done in the cloud.  On-prem solutions do not have the necessary horsepower to deliver real-time AI capabilities

### Compliance and security reporting

There’s a growing push from leading organizations to bring IT and security operations together.  This means network-automation tools need to provide information that shows security policies are continually being adhered to and compliance mandates are being met. The reporting capabilities need to provide visibility into every phase of the network lifecycle including planning, deploying and optimization.

### Ease of use

This is an often-overlooked component of management platforms. Feature-rich tools with long learning curves can require years before IT teams realize their full value.  Also, when a product is too technical, the company is put at risk if people with the best knowledge of it exit the organization.

Network automation tools should be fully GUI based, which means every feature available via the CLI should also be accessible through the graphical interface.  The tools should be easy to use as well so lower level engineers can work with it. This will obviate the need to always include a senior, more expensive engineer.

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3490459/7-considerations-when-buying-network-automation-tools.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3209131/what-sdn-is-and-where-its-going.html
[3]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[6]: https://www.networkworld.com/article/3202699/what-is-intent-based-networking.html
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
