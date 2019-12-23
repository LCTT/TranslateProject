[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (SASE: Redefining the network and security architecture)
[#]: via: (https://www.networkworld.com/article/3481519/sase-redefining-the-network-and-security-architecture.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

SASE: Redefining the network and security architecture
======
Adoption of SASE reduces complexity and overhead, improves security and boosts application performance.
Getty Images

In a cloud-centric world, users and devices require access to services everywhere. The focal point has changed. Now it is the identity of the user and device as opposed to the traditional model that focused solely on the data center. As a result, these environmental changes have created a new landscape that we need to protect and connect.

This new landscape is challenged by many common problems. The enterprises are loaded with complexity and overhead due to deployed appliances for different technology stacks. The legacy network and security designs increase latency. In addition, the world is encrypted; this dimension needs to be inspected carefully, without degrading the application performance.

These are some of the reasons that surface the need for a cloud-delivered secure access service edge (SASE). SASE consists of a tailored network fabric optimization where it makes the most sense for the user, device and application - at geographically dispersed PoPs. To deliver optimum network experience everywhere you should avoid the unpredictability of the Internet core. In the requirements for SASE, Gartner recommends that this backbone should not be based on AWS or Azure. Their PoP density is insufficient. It is not sufficient to offer a SASE service built solely on a hyper-scale.

[][1]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][1]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

There are clear benefits that can be achieved by redefining the network and security architecture. Yes, the adoption of SASE reduces complexity and overhead, improves security. It increases the application performance, but practically, what does that mean?

[Linda Musthaler had a great example in her conversation with Andrew Thomson, Director of IT at BioIVT,][2] a provider of biological materials and scientific services to research and development organizations, who adopted Cato Networks’ SASE platform nearly two years ago:

_“We positioned it as a platform for everything that we wanted to be able to do over the next three years with the business,” he told Linda, “The big goal, the business strategy, is growth and acquisition. We presented this as a platform, as a base service that we just had to have in place in order to leverage things like voice over IP, Office 365, Azure, cloud-based computing services, hosting servers in the cloud. Without a common core solid foundation, we wouldn't have been able to do any of those things reliably without adding staff to do monitoring or maintenance or administrative overhead.”_

It’s that last line – “without adding staff to do monitoring or maintenance or administrative overhead” – that I found particularly striking. So, let’s understand why SASE can be so impactful from an architectural perspective.

**[ Now read [20 hot jobs ambitious IT pros should shoot for][3]. ]**

### Complexity and overhead

Traditional mechanisms are limited by the hardware capacity of the physical appliances located at the customer's site. Such mechanisms create a lag in the hardware refresh rates that are needed to add new functionality.

Hardware-based network and security solutions build into the hardware the differentiator of the offering. Primarily, with different hardware, you can accelerate the services and add new features. There are some features that are available only on the specific hardware, not the hardware you already have onsite. In this case, heavy lifting by the customer will be required.

As the environment evolves, we should not depend on the new network and security features coming from the new generation of an appliance. Typically, this model is inefficient and complex. It creates high operational overhead and management complexity.

Device upgrades for new features require a lot of management. From past experience, to change out a line card would involve multiple teams. The line card might run out of ports or you may simply need additional features from a new generation. Largely, this would involve project planning, on-site engineers, design guides, hopefully, line card testing and hours of work. For critical sites to ensure a successful refresh, team members may need to be backed up. Therefore, there are many touches that need to be managed.

### SASE – Easing management

The cloud-based SASE enables the updates for new features and functionality without the need for new deployments of appliances (physical or virtual) and software versions on the customer side. This has an immediate effect on the ease of management.

Now the network and security deployment can occur without ever touching the enterprise network. This allows enterprises to adopt new capabilities quickly. Once the tight coupling between the features and the customer appliance is removed, this increases the agility and simplicity for the deployment of network and security services.

With a SASE platform, when we create an object, such as a policy in the networking domain, it is then available in other domains as well. So any policies assigned to users are tied to that user, regardless of the network location. This significantly removes the complexity of managing both; network and security policies across multiple locations, users and types of devices. Supremely, all of this can be done from one platform.

Also, when we examine the security solution, many buy individual appliances that focus just on one job. To troubleshoot, you need to gather information, such as the logs from each device. This is what a SIEM is useful for but it can only be used in some organizations as it’s resource-heavy. For the ones who don’t have ample resources, the process is backbreaking and there will be false positives.

In addition, SASE enables easier troubleshooting because all the data is in one common repository. You no longer have normalized data from different appliances/solution and then import the data into a database for a common view.

### Consolidation of vendors and technology stacks

I recall an experience from a previous consultancy, wherein we were planning the next year's security budget. The network was packed with numerous security solutions. All these point solutions are expensive and there is never a fixed price. So how do you actually plan for this?

Some new solutions we were considering charge on the usage models which at that time we didn’t have the quantity. SASE removes these types of headaches. By consolidating services into a single provider, there will be a reduction in the number of vendors and agents/clients on the end-user device.

Overall, there will be high complexity saving from the consolidation of vendors and technology stacks. The complexity is pushed to the cloud away from the on-premise enterprise network. The SASE fabric abstracts the complexity and reduces costs.

From a hardware point of view: for scale and additional capacity, the cloud-based SASE can add more PoPs of the same instance. This is known as vertical scaling. This scaling can also be carried in new locations, known as horizontal scaling.

Additionally, the SASE-based cloud takes care of intensive processing. For example, since a large proportion of internet traffic is now encrypted, malware can use encryption to evade and hide from detection. Here, each of the PoPs can perform DPI on TLS-encrypted traffic.

Traditional firewalls are not capable of inspecting encrypted traffic. Performing DPI on TLS-encrypted traffic would require extra modules or a new appliance. A SASE solution ensures that the decryption and inspection are done at the PoP. Consequently, there is no performance-hit or the need for new appliances on the customer sites.

### Ways to improve performance

Network congestion resulting in dropped and out of order packets is bad for applications. Latency-sensitive applications, such as collaboration, video, VoIP and web conferencing are hit hardest because of packet drops. Luckily, there are options to minimize latency and the effects of packet loss.

SD-WAN solutions have WAN optimization features that can be applied on an application-by-application or site-by-site basis. Along with WAN optimization features, there are protocol and application acceleration techniques that can be employed.

On top of the existing techniques to reduce the packet loss and latency, we can privatize the WAN as much as possible. You can control the adverse and varying effects that the last mile and middle mile have on the applications by privatizing with a global backbone consisting of a fabric of PoPs.

Once privatized, we can have more control over traffic paths, packet loss and latency. A private network fabric is a key benefit gained from SASE as it drives the application performance.

### SASE PoP optimizations

Each PoP in the SASE cloud-based solution optimizes where it makes the most sense, not just at the WAN edge. Within the backbone, we have global route optimizations to determine which path is the best at the current time and it can also be changed for all traffic or certain applications.

These routing algorithms factor in the performance metrics, such as latency, packet loss and jitter. These algorithms can help in selecting the optimal route for every network packet. The WAN backbone constantly analyzes and tries to improve the performance. This is unlike internet routing that favors cost over performance.

As everything is privatized, we have all the information to create the largest packet size and use rate-based algorithms over traditional loss-based algorithms. As a result, you don't need to learn anything, and the end-to-end throughput can be maintained.

As each PoP acts as a TCP proxy server, certain techniques are employed so that the TCP client and server think that they are closer. Therefore, a larger TCP window is set, allowing more data to be passed before waiting for an acknowledgment.

### Preferred egress points

We can also define preferred egress points to exit the cloud application traffic. These could be the points closest to the customer's application instance. The optimal global routing algorithms determine the best path to the customer's cloud application instance from anywhere in the world.

The PoPs can be collocated in the data centers directly connected to the IXP that connects to all major Infrastructures as service providers. This provides a good on-ramp to access the services from Amazon AWS, Microsoft Azure and Google cloud.

Therefore, you can keep the traffic on the private cloud for the majority of the time. Within a SASE design, the internet is used only to provide a short hop to the SASE fabric.

### Security – Identity-centric perimeter

SASE converges the networking and security pillars into a single platform. This allows multiple security solutions into a cloud service that enforces a unified policy across all the corporate locations, users and data.

SASE recommends you employ the zero-trust principles. The initial path to zero trust starts with identifying that network access is based on the identity of user, device and application. It is not based on the IP address or physical location of the device. And this is for a good reason as there is no contextual information.

The identity of the user/device must reflect the business context as opposed to being associated with binary constructs that are completely disjointed from the upper layers. This binds the identity to the world of networking and is the best way forward for policy enforcement. This way, the dependency on IP or applications as identifiers is removed. Now, the policy can be applied consistently, regardless of where the user/device is located. At the same time, the identity of the user/device/service can be factored into the applied policy.

The SASE stack is dynamically applied based on the identity and context while serving zero trust at strategic points in the cloud. This is what enforces an identity-centric perimeter.

_You can learn more about SASE and how it relates to [SD-WAN architectures][4] in a recent course I’ve rolled out. The course shines the torch on various SD-WAN solutions from Silver Peak, VMware, Cisco and Cato._

**This article is published as part of the IDG Contributor Network. [Want to Join?][5]**

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3481519/sase-redefining-the-network-and-security-architecture.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[2]: https://www.networkworld.com/article/3453030/sase-is-more-than-a-buzzword-for-bioivt.html
[3]: https://www.networkworld.com/article/3276025/careers/20-hot-jobs-ambitious-it-pros-should-shoot-for.html
[4]: https://www.pluralsight.com/courses/sd-wan-architectures-big-picture
[5]: https://www.networkworld.com/contributor-network/signup.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
