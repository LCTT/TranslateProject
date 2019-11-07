[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The evolution to Secure Access Service Edge (SASE) is being driven by necessity)
[#]: via: (https://www.networkworld.com/article/3448276/the-evolution-to-secure-access-service-edge-sase-is-being-driven-by-necessity.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

The evolution to Secure Access Service Edge (SASE) is being driven by necessity
======
The users and devices are everywhere. As a result, secure access services also need to be everywhere.
MF3d / Getty Images

The WAN consists of network and security stacks, both of which have gone through several phases of evolution. Initially, we began with the router, introduced WAN optimization, and then edge SD-WAN. From the perspective of security, we have a number of firewall generations that lead to network security-as-a-service. In today’s scenario, we have advanced to another stage that is more suited to today’s environment. This stage is the convergence of network and security in the cloud.

For some, the network and security trends have been thought of in terms of silos. However, the new market category of secure access service edge (SASE) challenges this ideology and recommends a converged cloud-delivered secure access service edge.

Gartner proposes that the future of the network and network security is in the cloud. This is similar to what [Cato Networks][1] has been offering for quite some time – the convergence of networking and security-as-a-service capabilities into a private, global cloud.

[][2]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][2]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

We all know; when we employ anything new, there will be noise. Therefore, it's difficult to dissect the right information and understand who is doing what and if SASE actually benefits your organization. And this is the prime motive of this post. However, before we proceed, I have a question for you.

Will combining the comprehensive WAN capabilities with comprehensive network security functions be the next evolution? In the following sections, I would like to discuss each of the previous network and security stages to help you answer the same question. So, first, let’s begin with networking.

### The networking era

### The router

We started with the router at the WAN edge, configured with routing protocols. Routing protocols do not make a decision on global information and are limited to the routing loop restrictions. This restricts the number of paths that the application traffic can take.

For a redundant WAN design, we need the complex BGP tuning to the load balance between the border edges along with the path attributes. This is because these path attributes may not choose the best performing path. By and large, the shortest path is not necessarily the best path.

**[ Now read [20 hot jobs ambitious IT pros should shoot for][3]. ]**

The WAN edge exhibited a rigid network topology that applications had to fit into. Security was provided by pushing the traffic from one appliance to another. With the passage of time, we began to see the rise of real-time voice and video traffic which are highly sensitive to latency and jitter. Hence, the WAN optimization was a welcomed feature.

### WAN optimization

The basic WAN optimization includes a range of TCP optimizations and basic in-line compression. The advanced WAN optimization includes deduplication, file-based caching and protocol-specific optimizations. This, indeed, helped in managing the latency-sensitive applications and applications where large amounts of data must be transferred across the WAN.

However, it was a complex deployment. A WAN optimization physical appliance was needed at both ends of the connection and had to be used for all the applications. At that time, it was an all or nothing approach and you couldn’t roll out WAN optimization per application. Besides, it had no effect on the remote workers where the users were not located in the office.

Subsequently, SD-WAN started to appear in 2015. During this year, I was consulting an Azure migration and attempting to [create my own DIY SD-WAN][4] _[Disclaimer: the author works for Network Insight]_ with a protocol called Tina from Barracuda. Since I was facing some challenges, so I welcomed the news of SD-WAN with open arms. For the first time, we had a decent level of abstraction in the WAN that was manageable.

Deploying SD-WAN allows me to have all the available bandwidth. Contrarily, many of the WAN optimization techniques such as data compression and deduplication are not as useful.

But others, such as error correction, protocol, and application acceleration could still be useful and are widely used today. Regardless of how many links you bundle, it might still result in latency and packet loss unless of course, you privatize as much as possible.

### The security era

### Packet filters

Elementally, the firewall is classed in a number of generations. We started with the first-generation firewalls that are just simple packet filters. These packet filters match on layer 2 to 4 headers. Since most of them do not match on the TCP SYN flags it’s impossible to identify the established sessions.

### Stateful devices

The second-generation firewalls refer to stateful devices. Stateful firewalls keep the state connections and the return traffic is permitted if the state for that flow is in the connection table.

These stateful firewalls did not inspect at an application level. The second-generation firewalls were stateful and could track the state of the session. However, they could not go deeper into the application, for example, examining the HTTP content and inspecting what users are doing.

### Next-generation firewalls

Just because a firewall is stateful doesn’t mean it can examine the application layer and determine what users are doing. Therefore, we switched to the third-generation firewalls.

These firewall types are often termed as the next-generation firewalls because they offer layer 7 inspections combined with other network device filtering functionalities. Some examples could be an application firewall using an in-line deep packet inspection (DPI) or intrusion prevention system (IPS).

Eventually, other niche devices started to emerge, called application-level firewalls. These devices are usually only concerned with the HTTP traffic, also known as web application firewalls (WAF). The WAF has similar functionality to reverse the web proxy, thereby terminating the HTTP session.

From my experience, while designing the on-premises active/active firewalls with a redundant WAN, you must keep an eye on the asymmetric traffic flows. If the firewall receives a packet that does not have any connection/state information for that packet, it will drop the packet.

Having an active/active design is complicated, whereas the active/passive design with an idle firewall is expensive. Anyways, if you manage to piece together a redundant design, most firewall vendors will require the management of security boxes instead of delivering policy-based security services.

### Network Security-as-a-Service

We then witnessed some major environmental changes. The introduction of the cloud and workload mobility changed the network and security paradigm completely. Workload fluidity and the movement of network state put pressure on the traditional physical security devices.

The physical devices cannot follow workloads and you can’t move a physical appliance around the network. There is also considerable operational overhead. We have to constantly maintain these devices which literally becomes a race against time. For example, when a new patch is issued there will be a test, stage and deploy phase. All of this needs to be done before the network becomes prone to vulnerability.

Network Security-as-a-Service was one solution to this problem. Network security functions, such as the CASB, FWaaS cloud SWG are now pushed to the cloud.

### Converging network and security

All the technologies described above have a time and a place. But these traditional networks and network security architectures are becoming increasingly ineffective.

Now, we have more users, devices, applications, services and data located outside of an enterprise than inside. Hence, with the emergence of edge and cloud-based service, we need a completely different type of architecture.

The SASE proposes combining the network-as-a-service capabilities (SD-WAN, WAN optimization, etc.) with the Security-as-a-Service (SWG, CASB, FWaaS, etc.) to support the dynamic secure access. It focuses extensively on the identity of the user and/or device, not the data center.

Then policy can be applied to the identity and context. Following this model inverts our thinking about network and security. To be fair, we have seen the adoption of some cloud-based services including cloud-based SWG, content delivery network (CDN) and the WAF. However, the overarching design stays the same – the data center is still the center of most enterprise networks and network security architectures. Yet, the user/identity should be the new center of its operations.

In the present era, we have dynamic secure access requirements. The users and devices are everywhere. As a result, secure access services need to be everywhere and distributed closer to the systems and devices that require access. When pursuing a data-centric approach to cloud security, one must follow the data everywhere it goes.

**This article is published as part of the IDG Contributor Network. [Want to Join?][5]**

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3448276/the-evolution-to-secure-access-service-edge-sase-is-being-driven-by-necessity.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://www.catonetworks.com/blog/the-secure-access-service-edge-sase-as-described-in-gartners-hype-cycle-for-enterprise-networking-2019/
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.networkworld.com/article/3276025/careers/20-hot-jobs-ambitious-it-pros-should-shoot-for.html
[4]: https://network-insight.net/2015/07/azure-expressroute-cloud-ix-barracuda/
[5]: https://www.networkworld.com/contributor-network/signup.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
