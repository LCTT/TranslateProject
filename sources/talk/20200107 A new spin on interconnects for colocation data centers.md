[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (A new spin on interconnects for colocation data centers)
[#]: via: (https://www.networkworld.com/article/3512576/a-new-spin-on-interconnects-for-colocation-data-centers.html)
[#]: author: (Linda Musthaler https://www.networkworld.com/author/Linda-Musthaler/)

A new spin on interconnects for colocation data centers
======
Stateless, Inc. launches its Luxon platform that enables provisioning of network functions as microservices.
Thinkstock

It has been almost a year since [I first wrote about Stateless, Inc.][1], a startup devoted to bringing software-defined interconnects (SD-IX) to colocation data centers. At that time, the company was just announcing its plans to reinvent the means to connect workloads across [data centers][2], hyperscale clouds and on-premises footprints using SD-IX. The intent was to give colo service providers a simpler way to quickly deploy network services for their tenants. Those plans have come to fruition and the company has announced the general availability (GA) of its [Luxon][3] SD-IX platform.

There’s a growing trend of enterprises moving more of their workloads to colocation data centers and the cloud. Gartner predicts that in a few years, many enterprises won’t even operate their own data centers anymore. To support the new business coming their way, [colo data centers][4] must become more agile, scalable and flexible, and this is where the Stateless offering comes in.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][5]

Here’s the general premise of what Stateless has brought to market, and why it’s a revolutionary architecture for data center interconnects.

[][6]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][6]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Today, colocation data center providers generally use cross-connect to provide services for their tenants. Cross-connect is basically the data center operator plugging two cables in—one cable from a tenant that needs a service, like access to AWS, and another cable from a company such as Megaport Networks or PacketFabric that can provide the needed on-ramp. Needless to say, this approach isn’t very scalable.

An emerging trend is that many data-center operators are expanding their direct connects to the cloud service providers (CSPs) themselves. Demands for cloud connectivity are growing so large that it makes economic sense for colo operators to put their own interconnect agreements in place with CSPs. Equinix and Cologix are a couple of examples. Stateless facilitates this approach with automation.

Advertisement

The Stateless Luxon platform enables running custom services on a single consolidated platform in an automated fashion. One of the key components of this architecture is state decoupling. Murad Kablan, Stateless co-founder and CEO, explains the critical importance of decoupling. “Each of the network functions has to keep track of all the traffic that’s going on. This is known as the state of the network functions. If you lose track of the state, it disrupts the entire network. Our approach decouples that information and puts it in a scale-out data store. Now we have these stateless network functions that can get a state from the distributed data store, and this allows elasticity, resilience and hitless updates—all the capabilities packaged together in what is needed for good operations.”

Stateless puts the data store around a [microservices][7] architecture. “This allows us to decompose the functions and control them with orchestration. Instead of these big major software applications, we break them down into small individual components that allow the network provider to define exactly what they need,” says Kablan. “Now the providers get a platform where they setup the environment, and their tenants can start defining their custom networks that they need. All the operational challenges of launching and managing the interconnections are automated behind the scenes.”

**Stateless uses patented innovation in its platform**

Stateless earned a patent for its innovations of how to route packets much more effectively. There are four key elements to the patent: use of a high-speed NIC that allows fast read/write of packets; use of a high-speed distributed storage technique dubbed RAM Cloud that allows rapid state lookup; parallel state processing that allows state lookups to be batched; and distributed state storage in multiple locations in multiple servers. These innovations enable Stateless to separate out the state of network functions such as BGP routing, IPsec or network address translation so those functions can run as microservices. Stateless can stack hundreds of network functions onto a host, and they can be shared among multiple clients, thus making the data-center operations much more efficient.

The Stateless GA product release includes interconnect service chains that allow a colo to mix and match any of the service functions, including security services like packet filtering or encryption, different versions of routing, network address translation, etc. There are no limitations on how the functions interconnect or how traffic passes through them. What’s more, Stateless has added some additional connection-protocol support, specifically VXLANs and VLANs, to make it easier for colocation data centers to integrate the solution into their existing infrastructure. Stateless has found that its data center customers put the Luxon platform in with their core switching and then hair-pin traffic through it, using VXLANs and VLANs to separate their tenants.

Stateless also utilizes a new switching technology, eschewing OpenFlow in favor of P4 (Programming Protocol-independent Packet Processors) because P4 affords them more control over the switch technology as well as the [Layer 3][8] services.

Also built into the GA is the ability to deploy multi-tenants, whether it’s an enterprise that wants to support multiple users or service providers such as a data center operator that wants to provide multiple cloud on-ramps.

The Luxon platform itself is essentially software running on a commodity hardware stack. Stateless designed it with three key attributes in mind. One, to make it very simple to deploy services quickly, from weeks down to minutes, and to build service chains to mix and match functions as needed. Two, to use microservices to instantiate the network functions efficiently, and three, the stateless nature of the functions.

The software contains the full range of network management functions to manage the microservices within the platform. They all communicate to each other through APIs, and the APIs communicate with an orchestrator within the Luxon box. This provides the ability to expose to the user full performance monitoring of everything going on inside the box. Operators can see the connections from one end to the other and have the ability to drop those network functions on a line wherever needed.

**Common use cases for Luxon**

Stateless has customer trials going on with several different use cases that demonstrate the flexibility of the platform. In one case, the company is working with a network provider that is providing cloud on-ramps to their customers. This company is testing the use of Luxon for connectivity to hyperscale cloud operators like Amazon and Azure. This provider currently offers a cloud on-ramp service that requires total manual configuration. Pending the outcome of the lab tests, they plan to deploy a Luxon cluster between their network and the hyperscale cloud providers and fully automate the delivery of that cloud connection through their portal.

In a second use case, an operator wants to provide cloud on-ramps but they don’t operate their own networks. All their connectivity is provided over the public Internet. The company is looking to do IPsec at scale. Generally speaking, IPsec is one of the most challenging network functions to implement; it’s very resource intensive. This operator first looked at deploying a solution using virtual firewalls as virtual network functions but it was far too expensive. Now they are looking to provide the service using Luxon because they can get almost ten times the efficiency they could get with the VNFs at a far more reasonable cost.

A third use case is being tested by a data-center operator that is providing services to a wireless company building an edge connectivity strategy. The wireless company is putting a variety of hotspots in different locations in tier two and tier three cities. The data center operator has its own network and it needs to provide BGP as a service. The wireless operator is running a Layer 3 network behind the scenes and they want to be able to dynamically control it. With the Luxon platform, the operator can set up hundreds of BGP sessions and manage them from their core data-center location out to the edge data center locations.

Stateless says that most of the early adoption of its product is with companies that are in the core of the network of data center operators looking to provide connectivity to hyperscalers or, in some cases, to the edge at scale. The uniqueness of removing state from the functions themselves enables scalability and efficiency that is difficult to achieve otherwise.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3512576/a-new-spin-on-interconnects-for-colocation-data-centers.html

作者：[Linda Musthaler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Linda-Musthaler/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3339558/software-defined-connectivity-planned-for-colocation-data-centers.html
[2]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[3]: https://www.stateless.net/
[4]: https://www.networkworld.com/article/3407756/colocation-facilities-buck-the-cloud-data-center-trend.html
[5]: https://www.networkworld.com/newsletters/signup.html
[6]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[7]: https://www.networkworld.com/article/3137250/what-you-need-to-know-about-microservices.html
[8]: https://www.networkworld.com/article/3239677/the-osi-model-explained-how-to-understand-and-remember-the-7-layer-network-model.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
