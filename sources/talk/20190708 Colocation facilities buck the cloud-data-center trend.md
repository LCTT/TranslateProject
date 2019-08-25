[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Colocation facilities buck the cloud-data-center trend)
[#]: via: (https://www.networkworld.com/article/3407756/colocation-facilities-buck-the-cloud-data-center-trend.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Colocation facilities buck the cloud-data-center trend
======
Lower prices and latency plus easy access to multiple cloud providers make colocation facilities an attractive option compared to building on-site data centers.
![gorodenkoff / Getty Images][1]

[Data center][2] workloads are moving but not only to the cloud. Increasingly, they are shifting to colocation facilities as an alternative to privately owned data centers.

### What is colocation?

A colocation facility or colo is a data center in which a business can rent space for servers and other computing hardware that they purchase but that the colo provider manages.

[Read about IPv6 and cloud-access security brokers][3]

The colo company provides the building, cooling, power, bandwidth and physical security. Space is leased by the rack, cabinet, cage or room. Many colos started out as managed services and continue  to offer those specialized services.

Some prominent providers include Equinix, Digital Reality Trust, CenturyLink, and NTT Communications, and there are several Chinese providers that only serve the China market. Unlike the data centers of cloud vendors like Amazon and Microsoft, these colo facilities are generally in large metropolitan areas.

“Colos have been around a long time, but their initial use case was Web servers,” said Rick Villars, vice president of data centers and cloud research at IDC. “What’s changed now is the ratio of what’s customer-facing is much greater than in 2000, [with the]  expansion of companies needing to have more assets that are network-facing.”

### Advantages of colos: Cost, cloud interconnect

Homegrown data centers are often sized correctly, with either too much capacity or too little, said Jim Poole, vice president of business development at Equinix. “Customers come to us all the time and say, ‘Would you buy my data center? Because I only use 25 percent of it,’” he said.

Poole said the average capital expenditure for a stand-alone enterprise data center that is not a part of the corporate campus is $9 million. Companies are increasingly realizing that it makes sense to buy the racks of hardware but place it in someone else’s secure facility that handles the power and cooling. “It’s the same argument for doing cloud computing but at the physical-infrastructure level,” he said.

Mike Satter, vice president for OceanTech, a data-center-decommissioning service provider, says enterprises should absolutely outsource data-center construction or go the colo route. Just as there are contractors who specialize in building houses, there are experts who specialize in data-center design, he said.

He added that with many data-center closures there is subsequent consolidation. “For every decommissioning we do, that same company is adding to another environment somewhere else. With the new hardware out there now, the servers can do the same work in 20 racks as they did in 80 racks five years ago. That means a reduced footprint and energy cost,” he said.

Often these closures mean moving to a colo. OceanTech recently decommissioned a private data center for a major media outlet he declined to identify that involved shutting down a data center in New Jersey that held 70 racks of gear. The firm was going to move its apps to the cloud but ended up expanding to a colo facility in New York City.

### Cloud isn't cheaper than private data centers

Satter said he’s had conversations with companies that planned to go to the cloud but changed their minds when they saw what it would cost if they later decided to move workloads out. Cloud providers can “kill you with guidelines and costs” because your data is in their infrastructure, and they can set fees that make it expensive to move it to another provider, he said. “The cloud not a money saver.”

That can drive decisions to keep data in-house or in a colo in order to keep tighter possession of their data. “Early on, when people weren’t hip to the game for how much it cost to move to the cloud, you had decision makers with influence say the cloud sounded good. Now they are realizing it costs a lot more dollars to do that vs. doing something on-prem, on your own,” said Satter.

Guy Churchward, CEO of Datera, developer of software designed storage platforms for enterprises, has noticed a new trend among CIOs making a cloud vs. private decision for apps based on the lifespan of the app.

“Organizations don’t know how much resource they need to throw at a task. The cloud makes more sense for [short-term apps],” he said. For applications that will be used for five years or more, it makes more sense to place them in company-controlled facilities, he said. That's because with three-to-five-year hardware-refresh cycles, the hardware lasts the entire lifespan of the app, and the hardware and app can be retired at the same time.

Another force driving the decision of private data center vs. the cloud is machine learning. Churchward said that’s because machine learning is often done using large amounts of highly sensitive data, so customers wanted data kept securely in house. They also wanted a low-latency loop between their ML apps and the data lake from which they draw.

### Colos connect to mulitple cloud providers

Another allure of colocation providers is that they can act as a pipeline between enterprises and multiple cloud providers. So rather than directly connecting to AWS, Azure, etc., businesses can connect to a colo, and that colo acts like a giant switch, connecting them to cloud providers through dedicated, high-speed networks.

Villars notes the typical corporate data center is either inside corporate HQ or someplace remote, like South Dakota where land was cheap. But the trade-off is that network connectivity to remote locations is often slower and more expensive.

That’s where a data-center colo providers with a large footprints come in, since they have points of presence in major cities. No one would fault a New York City-based firm for putting its data center in upstate New York or even further away. But when Equinix, DTR, and others all have data centers right in New York City, customers might get faster and sometimes cheaper connections plus lower latency.

Steve Cretney, vice president and CIO for food distributor Colony Brands, is in the midst of migrating the company to the cloud and moving everything he can from his data center to AWS. Rather than connect directly to AWS, Colony’s Wisconsin headquarters is connected to an Equinix data center in Chicago.

Going with Equinix provides more and cheaper bandwidth to the cloud than buying direct connectivity on his own. “I effectively moved my data center into Chicago. Now I can compete with a better price on data communication and networks,” he said.

Cretney estimates that by moving Colony’s networking from a smaller, local provider to Chicago, the company is seeing an annual cost savings of 50 percent for network connectivity that includes telecommunications.

Also, Colony wants to adopt a mult-cloud-provider strategy to avoid vendor lock-in, and he gets that by using Equinix as his network connection. As the company eventually uses Microsoft Azure and Google Cloud and other providers, Equinex can provide flexible and economic interconnections, he said.

### **Colos reduce the need for enterprise data-center real estate**

In 2014, 80 percent of data-centers were owned by enterprises, while colos and the early cloud accounted for 20 percent, said Villars. Today that’s a 50-50 split, and by 2022-2023, IDC projects service providers will own 70 percent of the large-data-center space.

For the past five years, the amount of new data-center construction by enterprises has been falling steadily at  5 to 10 percent per year, said Villars. “They are not building new ones because they are coming to the realization that being an expert at data-center construction is not something a company has.”

Enterprises across many sectors are looking at their data-center environment and leveraging things like virtual machines and SSD, thereby compressing the size of their data centers and getting more work done within smaller physical footprints. “So at some point they ask if they are spending appropriately for this space. That’s when they look at colo,” said Villars.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3407756/colocation-facilities-buck-the-cloud-data-center-trend.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/05/cso_cloud_computing_backups_it_engineer_data_center_server_racks_connections_by_gorodenkoff_gettyimages-943065400_3x2_2400x1600-100796535-large.jpg
[2]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[3]: https://www.networkworld.com/article/3391380/does-your-cloud-access-security-broker-support-ipv6-it-should.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
