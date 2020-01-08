[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Johnsonville Sausage cuts MPLS costs with SD-WAN)
[#]: via: (https://www.networkworld.com/article/3512656/johnsonville-sausage-cuts-mpls-costs-with-sd-wan.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Johnsonville Sausage cuts MPLS costs with SD-WAN
======
Johnsonville Sausage’s IT department modernized its wide-area network, getting costs down and simplifying the overall enterprise network environment, to move the business forward.
BlueBay2014 / Getty Images

About a year ago it was becoming clear to Johnsonville Sausage’s IT department that it had to modernize its [wide area network][1] to get costs down and simplify the overall enterprise network environment to effectively move the business forward. 

The company embarked on a two-pronged path that moved its US and global business and industrial networks toward a software-defined WAN ([SD-WAN][2]) environment -- eliminating costly [MPLS][3] links -- and a more automated, controlled system that has restored quality of life back to IT, said  Johnsonville Sausage Global Network Operations Manager Anthony Wild.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][4]

Johnsonville Sausage is privately owned, has about 2,000 employees and is headquartered in Sheboygan Falls, Wis.   Founded in 1945, the company is known worldwide for its variety of sausage products, including Italian, breakfast and chicken sausage, bratwurst and meatballs. 

[][5]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][5]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

[See more predictions about what's big in IT tech for the coming year.][6]

Wild’s IT team of four is responsible for the core network, wireless , [data center][7] fabric, telecom and  WAN.  It’s hub-and-spoke designed network stretches from two data centers in Wisconsin – one in Sheboygan and one Milwaukee – to five other core campus locations across the US as well as international locations in Singapore, Japan and the Philippines. The network supports eight core production facilities, a number of water treatment plants and upkeeps some 50,000 endpoints with a host of business and industrial network servers, IoT devices and applications.

At the outset, the idea was to eliminate confusing topologies, multiple management siloes and disjointed alerting to problems, Wild said.  The network did feature a number of Dynamic Multipoint VPN (DMVPN) overlays which offered enterprise scale [VPN][8] support but it wasn’t supporting what we needed, Wild said.

Advertisement

As it turned out, the revamping the WAN plan came at about the same time [Cisco said its SD-WAN software][9] would be supported across its family of core ISR/ASR routers.  Johnsonville had 16 model Cisco ISR/ASR 4000s in core sites across its global network – some over five years old – and made the aggressive decision to upgrade the software on all of them to support SD-WAN features.  

“We basically blew the dust off of some of them, upgraded the software, turned them on and did a live cutover,” Wild said.  Each site has two ISRs so the company upgraded one at each site first, then if it worked as expected the other followed. “We were very aggressive in our rollout,” Wild said.

In its branch and sales offices, the company rolled out SD-WAN support in the form of Cisco’s Enterprise Network Compute System ([ENCS][10]).  ENCS is a package of Cisco software and appliances that support SD-Branch, wireless and Enterprise Network Functions Virtualization (ENFV) capabilities in small branch offices.   

“We were challenged by the business to provide low cost, consolidated services for beachhead locations. ENCS runs the latest and greatest WiFi 6 controller, latest most sophisticated NGFW, and SD-WAN plus has the room for additional workloads like Windows Servers. This lets us serve our remote office customers with the absolute latest in secure and robust connectivity in a 1U form factor,” Wild said. 

“This is an absolute necessity for places where we also don’t have the floor capacity or HVAC requirements to place big iron, without sacrificing performance/capability. Someday as we refine our Cloud and IaaS strategy this will help us bridge the gap and balance premise and Cloud services through a graceful and sane migration path,” Wild said.

The rollout was simplified by the fact that in the core network no additional hardware was required. Across the branch sites, a home-grown template that defined what security, services and features got gear there configured and working quickly. “We live and die by templates,” Wild said.

All of those sites can now use high-bandwidth direct internet access lines. "With ENCS/ENFV we can bring up additional branch offices quickly across the globe with a few clicks, and we now have application visibility, assurance and alerting, and we can manage it all from one central location," Wild said. 

Rolling out the SD-WAN environment also let the company revamp its telecom contracts as well – eliminating $200,000 in annual MPLS costs globally. “That move saved incalculable in human effort and man-hours and a substantial amount of money the company could reinvest in innovation,” he said.

In addition to the ISR SD-WAN rollout, Johnsonville is also piloting SD-WAN for industrial automation and factory deployment using Cisco SD-WAN software on the  Cisco IR 1101 ruggedized integrated services router that will connect their wastewater treatment-plant facilities to the corporate network. “There is usable data in those locations that we never had any great access to, and we are trying to change that,” Wild said.

While the SD-WAN portion of the network was solidified and modernized, the company set out to further integrate the network and develop a central control tower for operations that allows Johnsonville to do even more with less, Wild said. 

Core for this part of the company’s plans was the deeper integration of Cisco’s DNA Center and becoming an early adopter of its AI Network Analytics service. Johnsonville already had DNA Center to help manage its wireless networks and its Cisco-based core data-center networking environment made up of Cisco [Application Centric Infrastructure][11] (ACI)-driven Nexus 9000 switches. 

ACI is Cisco’s core networking software that gives customers the flexibility to run and control applications anywhere they want across private or public clouds or at the edge while maintaining consistent network and security  policies across their entire domain.

DNA Center is Cisco’s core-networking control platform that features myriad services from analytics, network management and automation capabilities to assurance setting, fabric provisioning and policy-based segmentation for enterprise networks. 

AI Network Analytics is a software package that uses [AI and machine learning techniques][12] to learn network traffic and security patterns that can help customers spot and fix problems proactively across the enterprise.  

"The idea was to simplify things further by having SD-WAN included in what we were doing with ACI and DNA Center," Wild said. DNA Center lets Johnsonville push security policies and manage the entire network from a central location.

“The Analytics program helps us spot problems quickly that no human would be able to figure out without a ton of work,” Wild said. He cited an example that involved what was a mystery network-performance problem at one of the company’s sites. A tiny Bluetooth radio on a forklift was throwing off so much interference it was bringing an operational network to its knees, and the Analytics program figured it out quickly. “There was no human way to sit and watch the data that was needed to figure that out,’ Wild said.

"The Analytics program also reduces the amount of alerts the IT team gets because it is homed in on what we consider to be important," Wild noted.

The company expects to move toward a more automated, intent-based network in the future. “As the technology matures, the automation gets better and everything becomes more tightly integrated, the opportunities are boundless,” Wild said.

Join the Network World communities on [Facebook][13] and [LinkedIn][14] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3512656/johnsonville-sausage-cuts-mpls-costs-with-sd-wan.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3248989/what-is-a-wan-wide-area-network-definition-and-examples.html
[2]: https://www.networkworld.com/article/3505883/cisco-5-hot-networking-trends-for-2020.html
[3]: https://www.networkworld.com/article/2297171/network-security-mpls-explained.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[6]: https://www.networkworld.com/article/3488562/whats-big-in-it-tech-for-the-coming-year.html
[7]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[8]: https://www.networkworld.com/article/3268744/understanding-virtual-private-networks-and-why-vpns-are-important-to-sd-wan.html
[9]: https://www.networkworld.com/article/3296007/cisco-upgrade-enables-sd-wan-in-1m-israsr-routers.html
[10]: https://www.cisco.com/c/en/us/products/collateral/routers/5400-enterprise-network-compute-system/datasheet-c78-738512.html
[11]: https://www.networkworld.com/article/3487831/what-s-hot-for-cisco-in-2020.html
[12]: https://www.networkworld.com/article/3400382/cisco-will-use-aiml-to-boost-intent-based-networking.html
[13]: https://www.facebook.com/NetworkWorld/
[14]: https://www.linkedin.com/company/network-world
