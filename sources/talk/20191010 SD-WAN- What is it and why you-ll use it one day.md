[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SD-WAN: What is it and why you’ll use it one day)
[#]: via: (https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

SD-WAN: What is it and why you’ll use it one day
======
Software-defined wide area networks, a software approach managing wide-area networks, offers ease of deployment, central manageability and reduced costs, and can improve connectivity to branch offices and the cloud.
Shutterstock

There have been significant changes in wide-area networks over the past few years, none more important than software-defined WAN or SD-WAN, which is changing how network pros think about optimizing the use of connectivity that is as varied as Multiprotocol Label Switching ([MPLS][1]), frame relay and even DSL.

### What is SD-WAN?

As the name states, software-defined wide-area networks use software to control the connectivity, management and services between [data centers][2] and remote branches or cloud instances. Like its bigger technology brother, software-defined networking, SD-WAN decouples the control plane from the data plane.

[[Get regularly scheduled insights by signing up for Network World newsletters. ]][3]

An SD-WAN deployment can include, existing routers and switches or virtualized customer premises equipment (vCPE) all running some version of software that handles policy, security, networking functions and other management tools, depending on vendor and customer configuration. **  **

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

One of SD-WAN’s chief features is the ability to manage multiple connections from MPLS to broadband to LTE. Another important piece is the ability to segment, partition and secure the traffic traversing the WAN. 

SD-WAN's driving principle is to simplify the way big companies turn up new links to branch offices, better manage the way those links are utilized – for data, voice or video – and potentially save money in the process.

Advertisement

As a recent [Gartner][5] report said, SD-WAN and vCPE are key technologies to help enterprises transform their networks from “fragile to agile.”

“We believe that emerging SD-WAN solutions and vCPE platforms will best address enterprise requirements for the next five years, as they provide the best mix of performance, price and flexibility compared to alternative hardware-centric approaches,” Gartner stated.   “Specifically, we predict that by 2023, more than 90% of WAN edge infrastructure refresh initiatives will be based on vCPE or SD-WAN appliances versus traditional routers (up from less than 40% today).”

Network World / Gartner

With all of its advanced features making it an attractive choice for customers, the market has also attracted a number of choices with more than 60 vendors – including [Cisco][6], VMware, Silver Peak, Riverbed, Aryaka, Fortinet, Nokia and Versa – that compete in the SD-WAN market; many with very specialized offerings, Gartner says.  [IDC says][7] that SD-WAN technology will grow at a 30.8% compound annual growth rate from 2018 to 2023 to reach $5.25 billion.

From its VNI study, Cisco says that globally, SD-WAN traffic was 9 percent of business IP WAN traffic in 2017 and will be 29 percent of business IP WAN traffic by 2022.  In addition, SD-WAN traffic will grow five-fold from 2017 to 2022, a compound annual growth rate of 37 percent.

“SD-WAN continues to be one of the fastest-growing segments of the network infrastructure market, driven by a variety of factors. First, traditional enterprise WANs are increasingly not meeting the needs of today's modern digital businesses, especially as it relates to supporting SaaS apps and multi- and hybrid-cloud usage. Second, enterprises are interested in easier management of multiple connection types across their WAN to improve application performance and end-user experience," said Rohit Mehra, IDC vice president, Network Infrastructure. "Combined with the rapid embrace of SD-WAN by leading communications service providers globally, these trends continue to drive deployments of SD-WAN, providing enterprises with dynamic management of hybrid WAN connections and the ability to guarantee high levels of quality of service on a per-application basis."

### How does SD-WAN help network security?

One of the bigger areas SD-WAN impacts is network security. 

The tipping point for a lot of customers was the advent of applications like the cloud-based Office 365 and Amazon Web Services (AWS) applications that require secure remote access. said [Neil Anderson practice director, network solutions at World Wide Technology,][8] a technology service provider.  “SD-WAN lets customers set up secure regional zones or whatever the customer needs and lets them securely direct that traffic to where it needs to go based on internal security policies. SD-WAN is about architecting and incorporating security for apps like AWS and Office 365 into your connectivity fabric. It’s a big motivator to move toward SD-WAN.”

 “With SD-WAN, mission-critical traffic and assets can be partitioned and protected against vulnerabilities in other parts of the enterprise. This use case appears to be especially popular in verticals such as retail, healthcare, and financial,” [IDC wrote][9]. "SD-WAN can also protect application traffic from threats within the enterprise and from outside by leveraging a full stack of security solutions included in SD-WAN such as [next-gen firewalls][10], IPS, URL filtering, malware protection, and cloud security.”

### What does SD-WAN mean for MPLS?

One of the hotter SD-WAN debates is what the software technology would do to the use of MPLS, the packet-forwarding technology that uses labels in order to make data forwarding decisions. The most common use cases are branch offices, campus networks, metro Ethernet services and enterprises that need quality of service (QoS) for real-time applications.

For the most part, networking vendors believe MPLS will be around for a long time and that SD-WAN won’t totally eliminate the need for it. The major slaps against MPLS are how traditionally expensive the service is and how complicated it is to set up.

A recent report from [Avant Communications][11], a cloud services provider that specializes in SD-WAN, found that 83% of enterprises that use or are familiar with MPLS plan to increase their MPLS network infrastructure this year, and 40% say they will “significantly increase” their use of it.

How that shakes out remains an unknown, but it seems both technologies will have role in near future enterprises anyway.

“For us, MPLS is just another option.  We have never said that SD-WAN versus MPLS so that MPLS is going to get killed off or it needs to get killed off,” said [Sanjay Uppal,][12] vice president and general manager of VMware’s VeloCloud Business Unit. 

Uppal said with MPLS, VMware at least is not finding that customers are turning off their MPLS in droves.  “They are capping it in several instances.  They are continuing to buy some more.  Maybe not as much as they probably had in the past but it’s really opening up applications to use more [of the the underlying network responsible for delivery of packets].  All kinds of underlay are being purchased.  MPLS is being purchased, more of broadband, direct internet access,” he said.

Gartner says its clients hope to fund their WAN expansion/update by replacing or augmenting expensive MPLS connections with internet-based VPNs, often from alternate providers. However, suitability of internet connections varies widely by geography, and service providers mixing connections from multiple providers increases complexity. SD-WAN has dramatically simplified this approach for a number of reasons, Gartner says, including:

  * Due to the simpler operational environment and the ability to use multiple circuits from multiple carriers, enterprises can abstract the transport layer from the logical layer and be less dependent on their service providers.
  * This decoupling of layers is enabling new MSPs to emerge to take advantage of the above for customers that still want to outsource their WANs.
  * Traditional service providers are responding with Network Function Virtualization ([NFV][13])-based offerings that combine and orchestrate services (SD-WAN, security, WAN optimization) from multiple popular vendors.  NFV enables virtualized network functions including routing mobility and security.



There are other reasons customers will use MPLS in the SD-WAN world, experts said.   “There is a concern about how customers will back up systems when there are outages,” Anderson said. “MPLS and other technologies have a role there.”

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/2297171/network-security-mpls-explained.html
[2]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.gartner.com/doc/reprints?id=1-5MNRUAO&ct=181019&st=sb&mkt_tok=eyJpIjoiTnpZNFlXTXpabU0xTVdNeSIsInQiOiJzSmZGdzFWZldRN0s0TUxWMVBKOFUxdnJVMCtEUk13Z3Y5VCs1Z1wvcUY5ZHQ1XC9uZG1WY1Uxbm5TOFFMZzcxQ3pybmhMSHo5RFdPVEVCVUZrbnJnODlGVklOZGtlT0pFQ1A1aFNaQ3N1ODk5Y1FaN0JqTDJiM0U5cnZpTVBMTnliIn0%3D
[6]: https://www.networkworld.com/article/3322937/what-will-be-hot-for-cisco-in-2019.html
[7]: https://www.idc.com/getdoc.jsp?containerId=prUS45380319
[8]: https://www.wwt.com/profile/neil-anderson
[9]: https://www.cisco.com/c/dam/en/us/solutions/collateral/enterprise-networks/intelligent-wan/idc-tangible-benefits.pdf
[10]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[11]: http://www.networkworld.com/cms/article/Avant%20Communications,%20a%20cloud%20services%20provider%20that%20specializes%20in%20SD-WAN,%20recently%20issued%20a%20report%20entitled%20State%20of%20Disruption%20that%20found%20that%2083%25%20of%20enterprises%20that%20use%20or%20are%20familiar%20with%20MPLS%20plan%20to%20increase%20their%20MPLS%20network%20infrastructure%20this%20year,%20and%2040%25%20say%20they%20will%20
[12]: https://www.networkworld.com/article/3387641/beyond-sd-wan-vmwares-vision-for-the-network-edge.html
[13]: https://www.networkworld.com/article/3253118/what-is-nfv-and-what-are-its-benefits.html
