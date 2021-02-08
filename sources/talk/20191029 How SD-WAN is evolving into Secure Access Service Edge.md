[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How SD-WAN is evolving into Secure Access Service Edge)
[#]: via: (https://www.networkworld.com/article/3449136/how-sd-wan-is-evolving-into-secure-access-service-edge.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

How SD-WAN is evolving into Secure Access Service Edge
======
SASE, pronounced 'sassy,' combines elements of SD-WAN and network security into a single cloud-based service.
Anya Berkut / Getty Images

SASE, pronounced "sassy," stands for secure access service edge, and it's being positioned by Gartner as the next big thing in enterprise networking. The technology category, which Gartner and other network experts first introduced earlier this year, converges the WAN edge and network security into a cloud-based, as-a-service delivery model. [According to Gartner][1], the convergence is driven by customer demands for simplicity, scalability, flexibility, low latency, and pervasive security.

### SASE brings together security and networking

A SASE implementation requires a comprehensive technology portfolio that only a few vendors can currently deliver. The technology is still in its infancy, with less than 1% adoption. There are a handful of existing [SD-WAN][2] providers, including Cato Networks, Juniper, Fortinet and Versa, that are expected to compete in the emerging SASE market. There will be other SD-WAN vendors jumping on this wagon, and the industry is likely to see another wave of startups. 

**READ MORE:** [Gartner's top 10 strategic technology trends for 2020][3]

When networking and security devices are procured from different vendors, as is typical, the result is a complex network architecture that relies on the data center as the hub for enterprise applications. But with growing digital business and edge computing requirements, organizations are no longer primarily accessing their apps and services from within the data center. This approach is ineffective for organizations that are shifting to cloud services.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

### Existing network and security models to become obsolete? Not so fast

An architectural transformation of the traditional data center-centric networking and security is underway to better meet the needs of today’s mobile workforces. Gartner predicts that the adoption of SASE will take place over the next five to 10 years, rendering existing network and security models obsolete.

In my opinion, the term "obsolete" is a bit aggressive, but I do agree there is a need to bring networking and security together. Having them be procured and managed by separate teams is inefficient and leads to inconsistencies and blind spots. SD-WANs enable a number of new design principals, such as direct to cloud or user access, and necessitate the need for a new architecture – enter SASE.

SASE combines elements of SD-WAN and network security into a single cloud-based service. It supports all types of edges, including WAN, mobile, cloud, and edge computing. So, instead of connecting a branch to the central office, it connects individual users and devices to a centralized cloud-based service. With this model, the endpoint is the individual user, device, or application, not the data center.

### Cloud delivery benefits

The cloud delivery-based approach benefits providers with many points of presence. Gartner highlighted a number of advantages of this approach, such as:

  * There are limited endpoint functions like routing and path selection, with the rest delivered as a service from the cloud.
  * Due to the thinner stack, functions can be provided via software without requiring dedicated hardware.
  * New endpoints such as pop-up stores can be added quickly.
  * Since SASE favors cloud-based delivery, vendors can add new services to the stack faster.
  * Common policies are shared by branch offices and individual devices. The policies are also more consistent and can be managed through a cloud-based console from one vendor.
  * The overall infrastructure is simpler and less expensive for an organization to manage.
  * Emerging latency-sensitive apps, such as the IoT edge to edge, can be supported even if the endpoints have minimal local resources.
  * Malware, decryption, and management is performed within SASE, and organizations can scale up or down based on their needs.



### Agility is the biggest benefit SASE brings

These advantages are all true, but Gartner missed the biggest advantage, and that’s increased agility to accelerate business velocity. SASE makes security intrinsic in the network and, if architected correctly, organizations should not have to hold up the rollout of new apps and services while the security implications are being figured out. Instead, with security being "baked in," companies can be as aggressive as they want and know the environment is secure. Speed is the new currency of business, and SASE lets companies move faster. 

### SASE is identify driven instead of location driven

In addition to being cloud native, SASE is identity driven instead of location driven. An identity is attached to every person, application, service, or device within an organization. The convergence of networking and security allows an identity to follow a person or device wherever they need access and makes the experience seamless for the user.

Think of this scenario: An employee working remotely on an unmanaged laptop needs to connect to Salesforce, which is hosted on its own cloud. Traditionally, an administrator would go through many steps to authenticate a user and connect them to a virtual private network (VPN). But with a single identity, a remote employee could access Salesforce or any other app seamlessly, regardless of their device, location, or network.

SASE addresses new security demands networks face from a variety of sources. The core capabilities of SASE include multifactor authentication and access to applications and services controlled by firewall policies. Therefore, users can only access authorized applications without entering the general network. SASE can also detect sensitive data and stop it from leaving the network by applying specific data loss prevention rules.

In the [report][1], Gartner does caution that some vendors will attempt to satisfy customers by combining separate products together or by acquiring appliance-based point products that are then hosted in the cloud, which is likely to result in higher latency and poor performance. This shouldn’t be a surprise as this is how legacy vendors have attacked new markets in the past. Industry people often refer to this as “sheet metal” integration, where a vendor essentially tosses a number of capabilities into a single appliance and makes it looks integrated – but it’s not. Buyers need to ensure the vendor is delivering an integrated, cloud-native set of services to be delivered on demand. Organizations can begin transitioning to SASE with a WAN makeover and by gradually retiring their legacy network security appliance.

(Gartner defines and discusses demand for SASE in its 2019 [Hype Cycle for Enterprise Networking][1]; this post by [Cato][5] effectively summarizes SASE without having to read the entire Gartner report.)

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3449136/how-sd-wan-is-evolving-into-secure-access-service-edge.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.gartner.com/doc/3947237
[2]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[3]: https://www.networkworld.com/article/3447401/gartner-top-10-strategic-technology-trends-for-2020.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.catonetworks.com/blog/the-secure-access-service-edge-sase-as-described-in-gartners-hype-cycle-for-enterprise-networking-2019/
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
