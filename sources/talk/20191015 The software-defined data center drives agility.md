[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The software-defined data center drives agility)
[#]: via: (https://www.networkworld.com/article/3446040/the-software-defined-data-center-drives-agility.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

The software-defined data center drives agility
======
The value of SDN is doing as much as possible in the software so you don’t depend on the delivery of new features to come from a new generation of the hardware.
monsitj / Getty Images

In this day and age, demands on networks are coming from a variety of sources, internal end-users, external customers and via changes in the application architecture. Such demands put pressure on traditional architectures.

To deal effectively with these demands requires the network domain to become more dynamic. For this, we must embrace digital transformation. However, current methods are delaying this much-needed transition. One major pain point that networks suffer from is the necessity to dispense with manual working, which lacks fabric wide automation. This must be addressed if organizations are to implement new products and services ahead of the competition.

So, to evolve, to be in line with the current times and use technology as an effective tool, one must drive the entire organization to become a digital enterprise. The network components do play a key role, but the digital transformation process is an enterprise-wide initiative.

[][1]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][1]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

### Digital transformation and network visibility

As a part of this transformation, the network is no longer considered a black box. Now the network is a source for deep visibility that can aid a large set of use cases like network performance, monitoring, security and capacity planning, to name a few. However, in spite of such critical importance visibility is often overlooked.

We need the ability to provide deep visibility for the application at a flow level. Rationally, today if you want anything comparable, you would deploy a redundant monitoring network. Such a network would consist of probes, packet brokers and various tools to process the packet for metadata.

A more viable solution would integrate the network visibility into the fabric and therefore would not need a bunch of components. This enables us to do more with the data and aids with agility for ongoing network operations. There will always be some kind of requirement for application optimization or a security breach. And this is where visibility can help you iron out such issues quickly.

### Gaining agility with SDN

When increasing agility, what is useful is the building of a complete network overlay. An overlay is a solution that is abstracted from the underlying physical infrastructure in a certain way.

**[ Related: [MPLS explained – What you need to know about multi-protocol label switching][2]**

What this means is that we are separating and disaggregating the customer applications or services from the network infrastructure. This is more like a sandbox or private network for each application that is on an existing network. This way we are empowered with both the SDN controller and controllerless options. Both [data center architectures][3] _[Disclaimer: The author is employed by Network Insight]_ have their advantages and disadvantages.

Traditionally, the deployment of an application to the network involves propagating the policy to work through the entire infrastructure. Why? Because the network simply acts as an underlay and the segmentation rules configured on this underlay are needed to separate different applications and services. This, ultimately, creates a very rigid architecture that is unable to react quickly and adapt to the changes, therefore lacking agility. In essence, the applications and the physical network are tightly coupled.

[Virtual networks][4] are mostly built from either the servers or ToR switches. Either way, the underlying network transports the traffic and doesn’t need to be configured to accommodate the customer application. That is all carried in the overlay. By and large, everything happens in the overlay network which is most efficient when done in a fully distributed manner.

Now the application and service deployment occur without touching the network. Once the tight coupling between the application and network is removed, increased agility and simplicity of deploying applications and services are created.

### Where do your features live?

Some vendors build into the hardware the differentiator of the offering. With different hardware, you can accelerate the services. With this design, the hardware level is manipulated, but it does not use the standard Open Networking protocols. The result is that you are 100% locked, unable to move as the cost of moving is too much.

You could have numerous generations: for example, line cards, all the line cards have different capabilities, resulting in a complex feature matrix. When the Cisco Nexus platform first came out, I was onsite as a TDA trying to bring in some redundancy into the edge/access layer.

When the virtual PortChannel (vPC) came out they were several topologies and some of these topologies were only available on certain hardware. As it’s just a topology, it would have been useful to have it across all line cards. This is the world of closed networking, which has been accepted as the norm until now.

### Open networking

Traditionally, networking products were a combination of the hardware and software that had to be purchased together as an integrated solution. Open Networking, on the other hand, is the disaggregation of hardware from the software. This basically allows IT to mix and match at will.

With Open Networking, you are not reinventing the way packets are forwarded, or the way routers communicate with each other. Why? Because, with Open Networking, you are never alone and never the only vendor. You need to adapt and fit, and for this, you need to use open protocols.

The value of SDN is doing as much as possible in the software so you don’t depend on the delivery of new features to come from a new generation of the hardware. You want to put as much intelligence as possible into the software, thus removing the intelligence from the physical layer.

You don’t want to build the hardware features; instead, you want to use the software to provide the new features. This is an important philosophy and is the essence of Open Networking. From the customer's point of view, they get more agility as they can move from generation to generation of services without having hardware dependency. They don’t have to incur the operational costs of swapping out the hardware constantly.

### First steps

It is agreed that agility is a necessity. So, what is the prime step? One of the key steps is to create a software-defined data center that will allow the rapid deployment of compute and storage for the workloads. In addition to software-defined compute and storage, the network must be automated and not be an impediment.

Many organizations assume that to achieve agility, we must move everything to the cloud. Migrating workloads to the cloud indeed allow organizations to be competitive and equipped with the capabilities of a much larger organization.

Only a small proportion can adopt a fully cloud-native design. More often than not, there will always be some kind of application that needs to stay on-premise. In this case, the agility in the cloud needs to be matched by the on-premise infrastructure. This requires the virtualization of the on-premise compute, storage and network components.

Compute and storage, affordable software control, and virtualization have progressed dramatically. However, the network can cause a lag. Solutions do exist but they are complex, expensive and return on investment (ROI) is a stretch. Therefore, such solutions are workable only for the largest enterprises. This creates a challenge for mid-sized businesses that want to virtualize the network components.

**This article is published as part of the IDG Contributor Network. [Want to Join?][5]**

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3446040/the-software-defined-data-center-drives-agility.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[2]: https://www.networkworld.com/article/2297171/sd-wan/network-security-mpls-explained.html
[3]: https://network-insight.net/2014/08/data-center-topologies/
[4]: https://youtu.be/-Yjk0GiysLI
[5]: https://www.networkworld.com/contributor-network/signup.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
