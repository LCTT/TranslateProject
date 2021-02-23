[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Know the benefits of cloud-native networking for SASE)
[#]: via: (https://www.networkworld.com/article/3534720/know-the-benefits-of-cloud-native-networking-for-sase.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

Know the benefits of cloud-native networking for SASE
======
Shlomo Kramer, CEO of Cato Networks discusses the benefits cloud-native networking brings to SASE
Metamorworks / Getty Images

Gartner has positioned secure access service edge (SASE) as the next wave of SD-WANs. While most industry people I talk to agree on the concept of security and networking being brought together, there is some debate surrounding cloud-native versus cloud-managed.

To get a better understanding of why cloud native matters, I sat down with Shlomo Kramer, CEO of Cato Networks, which designed its SASE service from the ground up for cloud delivery.

**Last year Gartner coined the term SASE, do you agree or disagree with their premise?**

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

Well I definitely agree.  The manifesto that Cato was founded on was the vision of converging network transport and network security and delivering it as a cloud service. The argument as to why you need SASE is topological in nature because traffic patterns have changed. Network traffic used to be inward bound because people sat at their desks, using corporate workstations and connecting to enterprise applications that resided in the company data centers.

That meant security was effectively a hard shell placed around a soft core.  Security was applied at the edge and protected all the physical locations behind it. Today, the traffic patterns have changed, and the security needs to be applied everywhere.  Applications are built in AWS as well as on-premises, workers are in the office, at home and in the hotel or anywhere.  So now corporate assets are everywhere so the hard shell no longer works.  Security needs to be different and be integrated everywhere so I absolutely agree with the concept of SASE.

**What are some other challenges with legacy technologies like MPLS and security appliances?**

**T**he problems with MPLS are well documented, so I won’t spend too much time on this topic other than say every company we talk to wants to move off of MPLS because of high costs, long deployment times and a lack of agility.  MPLS does nothing for mobile users or cloud connectivity so organizations need to deploy VPN servers, cloud interconnects and other technologies to connect all of their company resources.

[][2]

On the security side, branch appliances have been an enormous problem that we as an industry accepted as the only possible solution.  Appliances need to be procured, deployed, maintained, upgraded and retired. All of which takes time and effort. They need to be integrated with one another, which requires more time and skills. Most appliances are managed from separate management consoles making operations complex and challenging.  Over time, more appliances are added, which raises the complexity level.  Also, when traffic jumps or too many features are turned on, upgrades are often required outside budget cycles.  Security professionals often lag behind when applying software patches because updating appliances is risky and needs to be carefully planned, leaving the company at risk.

I can go on, but _appliances_ as an architecture involve too many headaches and too much cost for companies looking to become leaner and more agile. And by appliances, I also mean VNFs and virtual appliances. It's the same story again. You still need to deploy, manage and scale them. Appliances are a poor choice not because of anyone's solution's limitations but because of the architecture itself.

**What benefit do cloud-native platforms provide?**

For Gur (Co-Founder of Cato, Gur Shatz) and myself, who came from the security and networking worlds, we were well acquainted with these problems. As we thought about what the right architecture would be moving forward, the cloud seemed like the obvious choice. We had already seen how cloud computing changed markets for data centers, servers, storage, and applications. We thought the cloud could do the same for security and networking. 

Like AWS for data centers and servers, we wanted to create a utility that would secure and network the complete enterprise, not just sites, but also remote users, cloud data centers, cloud applications, and third-party devices. We wanted enterprises to "tap" into this utility and instantly receive all the advanced security and networking services for the entire organization. It's why we called our SD-WAN device the "Cato Socket," like an electrical socket you plug into. This vision is in line with the SASE definition.

Instead of appliances, we move the “heavy lifting” involved in security and networking into a global, distributed, cloud-native software platform. By cloud-native software, we mean several things.  We actually wrote a [blog on this topic][3] that talks about the value of cloud-native.  There are many benefits but in particular, multi-tenancy is game-changing. This allows cloud providers to amortize costs across their customer base, allowing them to deliver offerings at a price point unmatched by one based on purchasing appliances for customers. 

This platform runs our single-pass, security and networking stack that performs all security inspections in parallel. A packet comes in, depacketized and decrypted by our software that then performs all the necessary security inspections in parallel before sending the packet on.  This is an incredible change from the way appliances work today. Today, each appliance must depacketize and decrypt packets, run a deep packet inspection (DPI) engine to understand the packet, apply the specific security inspections, and repacketize and re-encrypt for the next appliance to do the same.  

**You’ve also stated that a global private network is necessary, why is that?**

As for the network, enterprises require predictable, low latency performance everywhere all the time. That's simply not possible with Internet routing today when broadband is used. While the problems of unpredictable latency across global routes or in under-developed Internet regions is well known even within Internet regions, we've seen specific routes have problems.  

How do you overcome latency AND the global connectivity costs of MPLS? Our answer was to leverage the massive build-out in global IP connectivity. By buying massive wholesale SLA-backed capacity across multiple IP backbones, and then dynamically selecting the best backbone at each hop across our network, we could deliver global, low-latency connections at a fraction of the cost of MPLS.   

**The SASE industry is currently filled with start-ups and smaller vendors.  Why are the big incumbents struggling to make this shift?**

** **

I think it should be evident by now, but existing appliance-based solutions simply can't be converted to become cloud-native. Re-engineering a platform for the cloud requires massive investments in R&amp;D, which will come at the expense of existing and very successful product lines, so beyond engineering, there is also an internal conflict to overcome.   

And that's why the "big incumbents," as you put it, are so threatened by SASE. We all recognize that SASE is the future, but to get that to that future, many of the established solution providers will need to disrupt their existing businesses. That's not easy to do, but what they can do is market. 

We, as an industry, are seeing vendors trying to capitalize on SASE by rebranding their solutions as SASE offerings. Some are appliances without cloud capabilities; others are security services without networking capabilities. For IT to tell the difference between a true SASE platform and a "fake" one, the litmus test is simple: If the center of gravity is in the appliances. If the offer lacks SD-WAN and if there is more than one management console. It's not SASE, and it's not the future. It's a repackaging of the past.  

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3534720/know-the-benefits-of-cloud-native-networking-for-sase.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[3]: https://www.catonetworks.com/blog/the-cloud-native-network-what-it-means-and-why-it-matters/
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
