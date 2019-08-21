[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Open architecture and open source – The new wave for SD-WAN?)
[#]: via: (https://www.networkworld.com/article/3390151/open-architecture-and-open-source-the-new-wave-for-sd-wan.html#tk.rss_all)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

Open architecture and open source – The new wave for SD-WAN?
======
As networking continues to evolve, you certainly don't want to break out a forklift every time new technologies are introduced. Open architecture would allow you to replace the components of a system, and give you more flexibility to control your own networking destiny.
![opensource.com \(CC BY-SA 2.0\)][1]

I recently shared my thoughts about the [role of open source in networking][2]. I discussed two significant technological changes that we have witnessed. I call them waves, and these waves will redefine how we think about networking and security.

The first wave signifies that networking is moving to the software so that it can run on commodity off-the-shelf hardware. The second wave is the use of open source technologies, thereby removing the barriers to entry for new product innovation and rapid market access. This is especially supported in the SD-WAN market rush.

Seemingly, we are beginning to see less investment in hardware unless there is a specific segment that needs to be resolved. But generally, software-based platforms are preferred as they bring many advantages. It is evident that there has been a technology shift. We have moved networking from hardware to software and this shift has positive effects for users, enterprises and service providers.

**[ Don’t miss[customer reviews of top remote access tools][3] and see [the most powerful IoT companies][4] . | Get daily insights by [signing up for Network World newsletters][5]. ]**

### Performance (hardware vs software)

There has always been a misconception that the hardware-based platforms are faster due to the hardware acceleration that exists in the network interface controller (NIC). However, this is a mistaken belief. Nowadays, software platforms can reach similar performance levels as compared to hardware-based platforms.

Initially, people viewed hardware as a performance-based vehicle but today this does not hold true anymore. Even the bigger vendors are switching to software-based platforms. We are beginning to see this almost everywhere in networking.

### SD-WAN and open source

SD-WAN really took off quite rapidly due to the availability of open source. It enabled the vendors to leverage all the available open source components and then create their solution on top. By and large, SD-WAN vendors used the open source as the foundation of their solution and then added additional proprietary code over the baseline.

However, even when using various open source components, there is still a lot of work left for these vendors to make it to a complete SD-WAN solution, even for reaching a baseline of centrally managed routers with flexible network architecture control, not to talk about complete feature set of SD-WAN.

The result of the work done by these vendors is still closed products so the fact they are using open source components in their products is merely a time-to-market advantage but not a big benefit to the end users (enterprises) or service providers launching hosted services with these products. They are still limited in flexibility and vendor diversity is only achieved through a multi-vendor strategy which in practice means launching multiple silo services each based on a different SD-WAN vendor without real selection of the technologies that make each of the SD-WAN services they launch.

I recently came across a company called [Flexiwan][6], their goal is to fundamentally change this limitation of SD-WAN by offering a full open source solution that, as they say, “includes integration points in the core of the system that allow for 3rd party logic to be integrated in an efficient way.” They call this an open architecture, which, in practical terms, means a service provider or enterprise can integrate his own application logic into the core of the SD-WAN router…or select best of breed sub-technologies or applications instead of having these dictated by the vendor himself. I believe there is the possibility of another wave of SD-WAN with a fully open source and open architecture to SD-WAN.

This type of architecture brings many benefits to users, enterprises and service providers, especially when compared to the typical lock-in of bigger vendors, such as Cisco and VMware.

With an open source open architecture, it’s easier to control the versions and extend more flexibility by using the software offered by different providers. It offers the ability to switch providers, not to mention being easier to install and upgrade the versions.

### SD-WAN, open source and open architecture

An SD-WAN solution that is an open source with open architecture provides a modular and decomposed type of SD-WAN. This enables the selection of elements to provide a solution.

For example, enterprises and service providers can select the best-of-breed technologies from independent vendors, such as deep packet inspection (DPI), security, wide area network (WAN) optimization, session border controller (SBC), VoIP and other traffic specific optimization logic.

Some SD-WAN vendors define an open architecture in such a way that they just have a set of APIs, for example, northbound APIs, to enable one to build management or do service chaining. This is one approach to an open architecture but in fact, it’s pretty limited since it does not bring the full benefits that an open architecture should offer.

### Open source and the fear of hacking

However, when I think about an open source and open architecture for SD-WAN, the first thing that comes to mind is bad actors. What about the code? If it’s an open source, the bad actor can find vulnerabilities, right?

The community is a powerful force and will fix any vulnerability. Also with open source, the vendor, who is the one responsible for the open source component will fix the vulnerability much faster than a closed solution, where you are unaware of the vulnerability until a fix is released.

### The SD-WAN evolution

Before we go any further, let’s examine the history of SD-WAN and its origins, how we used to connect from the wide area network (WAN) to other branches via private or public links.

SD-WAN offers the ability to connect your organization to a WAN. This could be connecting to the Internet or other branches, to optimally deliver applications with a good user-experience. Essentially, SD-WAN allows the organizations to design the architecture of their network dynamically by means of software.

### In the beginning, there was IPSec

It started with IPSec. Around two decades back, in 1995, the popular design was that of mesh architecture. As a result, we had a lot of point-to-point connections. Firstly, mesh architectures with IPSec VPNs are tiresome to manage as there is a potential for 100s of virtual private network (VPN) configurations.

Authentically, IPSec started with two fundamental goals. The first was the tunneling protocol that would allow organizations to connect the users or other networks to their private network. This enabled the enterprises to connect to networks that they did not have a direct route to.

The second goal of IPSec was to encrypt packets at the network layer and therefore securing the data in motion. Let’s face it: at that time, IPSec was terrible for complicated multi-site interconnectivity and high availability designs. If left to its defaults, IPSec is best suited for static designs.

This was the reason why we had to step in the next era where additional functionality was added to IPSec. For example, IPSec had issues in supporting routing protocols using multicast. To overcome this, IPSec over generic routing encapsulation (GRE) was introduced.

### The next era of SD-WAN

During the journey to 2008, one could argue that the next era of WAN connectivity was when additional features were added to IPSec. At this time IPSec became known as a “Swiss army knife.” It could do many things but not anything really well.

Back then, you could create multiple links, but it failed to select the traffic over these links other than by using simple routing. You needed to add a routing protocol. For advanced agile architectures, IPSec had to be incorporated with other higher-level protocols.

Features were then added based on measuring the quality. Link quality features were added to analyze any delay, drops and to select alternative links for your applications. We began to add tunnels, multi-links and to select the traffic based on the priority, not just based on the routing.

The most common way to the tunnel was to have IPSec over GRE. You have the GRE tunnel that enables you to send any protocol end-to-end by using IPSec for the encryption. All this functionality was added to achieve and create dynamic tunnels over IPSec and to optimize the IPSec tunnels.

This was a move in the right direction, but it was still complex. It was not centrally managed and was error-prone with complex configurations that were unable to manage large deployments. IPSec had far too many limitations, so in the mid-2000s early SD-WAN vendors started cropping up. Some of these vendors enabled the enterprises to aggregate many separate digital subscriber lines (DSL) links into one faster logical link. At the same time, others added time stamps and/or sequence numbers to packets to improve the network performance and security when running over best effort (internet) links.

International WAN connectivity was a popular focus since the cost delta between the Internet and private multiprotocol label switching (MPLS) was 10x+ different. Primarily, enterprises wanted the network performance and security of MPLS without having to pay a premium for it.

Most of these solutions sat in-front or behind a traditional router from companies like Cisco. Evidently, just like WAN Optimization vendors, these were additional boxes/solutions that enterprises added to their networks.

### The next era of SD-WAN, circa 2012

It was somewhere in 2012 that we started to see the big rush to the SD-WAN market. Vendors such as Velocloud, Viptela and a lot of the other big players in the SD-WAN market kicked off with the objective of claiming some of the early SD-WAN success and going after the edge router market with a full feature router replacement and management simplicity.

Open source networking software and other open source components for managing the traffic enabled these early SD-WAN vendors to lay a foundation where a lot of the code base was open source. They would then “glue” it together and add their own additional features.

Around this time, Intel was driving data plane development kit (DPDK) and advanced encryption standard (AES) instruction set, which enabled that software to run on commodity hardware. The SD-WAN solutions were delivered as closed solutions where each solution used its own set of features. The features and technologies chosen for each vendor were different and not compatible with each other.

### The recent era of SD-WAN, circa 2017

A tipping point in 2017 was the gold rush for SD-WAN deployments. Everyone wanted to have SD-WAN as fast as possible.

The SD-WAN market has taken off, as seen by 50 vendors with competing, proprietary solutions and market growth curves with a CAGR of 100%. There is a trend of big vendors like Cisco, Vmware and Oracle acquiring startups to compete in this new market.

As a result, Cisco, which is the traditional enterprise market leader in WAN routing solutions felt threatened since its IWAN solution, which had been around since 2008, was too complex (a 900-page configuration and operations manual). Besides, its simple solution based on the Meraki acquisition was not feature-rich enough for the large enterprises.

With their acquisition of Viptela, Cisco currently has a 13% of the market share, and for the first time in decades, it is not the market leader. The large cloud vendors, such as Google and Facebook are utilizing their own technology for routing within their very large private networks.

At some point between 2012 and 2017, we witnessed the service providers adopting SD-WAN. This introduced the onset and movement of managed SD-WAN services. As a result, the service providers wanted to have SD-WAN on the menu for their customers. But there were many limitations in the SD-WAN market, as it was offered as a closed-box solution, giving the service providers limited control.

At this point surfaced an expectation of change, as service providers and enterprises looked for more control. Customers can get better functionality from a multi-vendor approach than from a single vendor.

### Don’t forget DIY SD-WAN

Up to 60% of service providers and enterprises within the USA are now looking at DIY SD-WAN. A DIY SD-WAN solution is not where the many pieces of open source are taken and caste into something. The utmost focus is on the solution that can be self-managed but buy from a vendor.

Today, the majority of the market is looking for managed solutions and the upper section that has the expertise wants to be equipped with more control options.

### SD-WAN vendors attempting everything

There is a trend that some vendors try to do everything with SD-WAN. As a result, whether you are an enterprise or a service provider, you are locked into a solution that is dictated by the SD-WAN vendor.

The SD-WAN vendors have made the supplier choice or developed what they think is relevant. Evidently, some vendors are using stacks and software development kits (SDKs) that they purchased, for example, for deep packet inspection (DPI).

Ultimately, you are locked into a specific solution that the vendor has chosen for you. If you are a service provider, you might disapprove of this limitation and if you are an enterprise with specific expertise, you might want to zoom in for more control.

### All-in-one security vendors

Many SD-WAN vendors promote themselves as security companies. But would you prefer to buy a security solution from an SD-WAN vendor or from an experienced vendor, such as Checkpoint?

Both: enterprise and service providers want to have a choice, but with an integrated black box security solution, you don't have a choice. The more you integrate and throw into the same box, the stronger the vendor lock-in is and the weaker the flexibility.

Essentially, with this approach, you are going for the lowest common denominator instead of the highest. Ideally, the technology of the services that you deploy on your network requires expertise. One vendor cannot be an expert in everything.

An open architecture lies in a place for experts in different areas to join together and add their own specialist functionality.

### Encrypted traffic

As a matter of fact, what is not encrypted today will be encrypted tomorrow. The vendor of the application can perform intelligent things that the SD-WAN vendor cannot because they control both sides. Hence, if you can put something inside the SD-WAN edge device, they can make smart decisions even if the traffic is encrypted.

But in the case of traditional SD-WANs, there needs to be a corporation with a content provider. However, with an open architecture, you can integrate anything, and nothing prevents the integration. A lot of traffic is encrypted and it's harder to manage encrypted traffic. However, an open architecture would allow the content providers to manage the traffic more effectively.

### 2019 and beyond: what is an open architecture?

Cloud providers and enterprises have discovered that 90% of the user experience and security problems arise due to the network: between where the cloud provider resides and where the end-user consumes the application.

Therefore, both cloud providers and large enterprise with digital strategies are focusing on building their solutions based on open source stacks. Having a viable open source SD-WAN solution is the next step in the SD-WAN evolution, where it moves to involve the community in the solution. This is similar to what happens with containers and tools.

Now, since we’re in 2019, are we going to witness a new era of SD-WAN? Are we moving to the open architecture with an open source SD-WAN solution? An open architecture should be the core of the SD-WAN infrastructure, where additional technologies are integrated inside the SD-WAN solution and not only complementary VNFs. There is an interface and native APIs that allow you to integrate logic into the router. This way, the router will be able to intercept and act according to the traffic.

So, if I’m a service provider and have my own application, I would want to write logic that would be able to communicate with my application. Without an open architecture, the service providers can’t really offer differentiation and change the way SD-WAN makes decisions and interacts with the traffic of their applications.

There is a list of various technologies that you need to be an expert in to be able to integrate. And each one of these technologies can be a company, for example, DPI, VoIP optimization, and network monitoring to name a few. An open architecture will allow you to pick and choose these various elements as per your requirements.

Networking is going through a lot of changes and it will continue to evolve with the passage of time. As a result, you wouldn’t want something that forces you to break out a forklift each time new technologies are introduced. Primarily, open architecture allows you to replace the components of the system and add code or elements that handle specific traffic and applications.

### Open source

Open source gives you more flexibility to control your own destiny. It offers the ability to select your own services that you want to be applied to your system. It provides security in the sense that if something happens to the vendor or there is a vulnerability in the system, you know that you are backed by the community that can fix such misadventures.

From the perspective of the business model, it makes a more flexible and cost-effective system. Besides, with open source, the total cost of ownership will also be lower.

**This article is published as part of the IDG Contributor Network.[Want to Join?][7]**

Join the Network World communities on [Facebook][8] and [LinkedIn][9] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3390151/open-architecture-and-open-source-the-new-wave-for-sd-wan.html#tk.rss_all

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.techhive.com/images/article/2017/03/6554314981_7f95641814_o-100714680-large.jpg
[2]: https://www.networkworld.com/article/3338143/the-role-of-open-source-in-networking.html
[3]: https://www.networkworld.com/article/3262145/lan-wan/customer-reviews-top-remote-access-tools.html#nww-fsb
[4]: https://www.networkworld.com/article/2287045/internet-of-things/wireless-153629-10-most-powerful-internet-of-things-companies.html#nww-fsb
[5]: https://www.networkworld.com/newsletters/signup.html#nww-fsb
[6]: https://flexiwan.com/sd-wan-open-source/
[7]: /contributor-network/signup.html
[8]: https://www.facebook.com/NetworkWorld/
[9]: https://www.linkedin.com/company/network-world
