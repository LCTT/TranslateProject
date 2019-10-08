[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Early adopter finds SD-WAN yields better management, costs, uptime)
[#]: via: (https://www.networkworld.com/article/3444622/early-adopter-finds-sd-wan-yields-better-management-costs-uptime.html)
[#]: author: (Brandon Butler https://www.networkworld.com/author/Brandon-Butler/)

Early adopter finds SD-WAN yields better management, costs, uptime
======
Industrial supplier Redmond Inc. gets tighter control over bandwidth allocations, makes configuration changes with a software-defined WAN.
jamesteohart

Managing the Wide Area Network (WAN) for Redmond Inc., a supplier of industrial and commercial products – from salt that’s used to protect winter roadways to organic dairy products and health items – is an easier job today for the company’s technical project manager Aaron Gabrielson than it was a year ago.

Redmond manages a phone system, point of sale and fax centrally out of headquarters in Heber City, Utah, which means each of Redmond’s 10 branch sites across the Midwest need a reliable connection back to headquarters in Utah. That’s easier for some sites, like those in Salt Lake City, than others, such as rural areas where there may only be a handful of workers on a farm.

[[Get regularly scheduled insights by signing up for Network World newsletters. ]][1]

It was here that a software-defined WAN (SD-WAN) came to the rescue. Gartner estimates that SD-WAN has less than 5% market share today, but it predicts that up to 25% of users will manage their WAN through software within two years. Revenue from SD-WAN vendors is growing at 59% annually, Gartner estimates, and it’s expected to become a $1.3 billion market by 2020. Redmond is an early adopter.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

**+More on Network World:** [**How to make the transition to SD-WAN**][3] **+**

One of the chief characteristics of an SD-WAN is its ability to manage multiple types of connections – from MPLS to broadband to LTE. For Redmond, that’s been hugely helpful.

Advertisement

Gabrielson buys cheap commercial-grade Internet connections at his rural branch sites. The SD-WAN program from VeloCloud aggregates at least two links together to create a single bundled link that’s stronger than either one individually. It provides rural sites with enough bandwidth to use voice over IP (VoIP) and process credit card transactions.

SD-WAN can be thought of as a little brother to its better known sibling software-defined networking (SDN). They’re related – both software-defined – but whereas SDN is meant for internal data centers at a campus or headquarter location, [SD-WAN takes those similar software-defined concepts and the decoupling of the control plane from the data plane to the WAN][4]. “SDN is an architecture, whereas SD-WAN is a technology you can buy,” explains Gartner analyst Andrew Lerner, who tracks the SD-WAN market closely.

Managing a WAN through software provides helpful benefits for Gabrielson. He’s notified of any issues that sprout up and is able to manage his entire WAN through a single interface. In the past, making changes to network configurations in branch offices would have required manual configurations being created and installed and likely an on-site technician to do it. If a business decided to roll out teleconferencing to their branch offices, for example, predefined bandwidth allocations would have to be rearchitected. More bandwidth may need to be acquired, then programmed in and installed at each branch location. “(With SD-WAN) we control the entire WAN, it’s easy to manage, easy to change,” Gabrielson says. “I can control and shape the bandwidth at each location centrally through a GUI. Plus, we get to buy cheap bandwidth while having quality uptime.”

Much of the technology that makes up SD-WAN is not new, rather it's the packaging of it together that is. Internet vendors offer various aggregation technologies and are happy to sell multiple links to a site, so that itself is not novel. Centrally managing a WAN is not new either. But the combination of those, plus SD-WAN’s ability to dynamically share network bandwidth across connection points is a new packaging of these components together. “It’s the whole being greater than the sum of the parts,” Gabrielson says.

**The way WAN used to be**

Many enterprises have complex infrastructure at their branch offices consisting of routers, WAN path controllers, WAN optimizers, firewalls and other components. It’s expensive to buy and maintain and complex to manage.

“SD-WAN has basically lobotomized traditional branch routers,” Lerner says. “Most enterprises just need a small subset of functionality. SD-WAN vendors package up the four or five most important features – path selection, low cost – and bundle it together. It’s a smart car compared to an SUV.”

Redmond’s SD-WAN deployment consists of a single VeloCloud box that sits at each branch offices that all network traffic is routed through. SD-WANs are sold as either a software that runs on commodity infrastructure, or as a hardware/software combination, like VeloCloud’s.

Gartner

Lerner estimates that an SD-WAN can be up to two and a half times less expensive than a traditional WAN architecture. A 250-branch WAN over three years is estimated to cost $1,285,000 in a traditional WAN architecture, but only $452,500 with an SD-WAN deployment. The ability to use commodity routers is the biggest savings, along with staffing and a small decrease in router maintenance and support.

The market for SD-WAN vendors can be broken into multiple buckets: Incumbent routing and switching vendors who are rolling out SD-WAN products (i.e Cisco, Hewlett Packard Enterprise, Huawei and Brocade); WAN optimization specialists who extend their products to include SD-WAN (Silver Peak, Riverbed, Talari Networks); pure-play SD-WAN startups (VeloCloud, CloudGenix, and Cato Networks); and vendors who offer managed SD-WAN products (AT&amp;T, CenturyLink, Spring, Comcast Business, etc.) Some vendors have already been aggressive making mergers and acquisitions. [Cisco bought Viptella][5] in April and [Riverbed bought Ocedo][6].

This ease of deployment, central manageability and reduced costs make SD-WAN an attractive option for many businesses. At VMworld 2015 29% of 260 attendees surveyed by Riverbed were exploring SD-WAN while 5% had adopted it. That compares to 77% who were exploring SDN, with 13% who had deployed it. Lerner says leading adopters of SD-WAN have been retailers and financial institutions that have a large number of branch offices.

So if SD-WAN is so great why isn’t it more ubiquitous? Many organizations have custom built ASICs controlling their WANs and LANs, which have long refresh cycles.

Network engineers are traditionally averse to dramatic changes too, Lerner says. When the hardware is ready for an upgrade Lerner expects organizations will consider SD-WANs, but that could be a multi-year process.

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3444622/early-adopter-finds-sd-wan-yields-better-management-costs-uptime.html

作者：[Brandon Butler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Brandon-Butler/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: http://www.networkworld.com/article/3029718/lan-wan/how-to-make-the-transition-to-a-software-defined-wan.html
[4]: http://www.networkworld.com/article/2873964/sdn/the-first-place-to-tackle-sdn-in-the-wan.html
[5]: http://www.networkworld.com/article/3193888/software-defined-networking/why-cisco-needs-sd-wan-vendor-viptela.html
[6]: http://www.networkworld.com/article/3024735/cisco-subnet/riverbed-acquires-ocedo-accelerates-its-sd-wan-timeline.html
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
