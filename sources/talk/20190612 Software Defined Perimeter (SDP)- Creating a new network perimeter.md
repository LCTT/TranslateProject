[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Software Defined Perimeter (SDP): Creating a new network perimeter)
[#]: via: (https://www.networkworld.com/article/3402258/software-defined-perimeter-sdp-creating-a-new-network-perimeter.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

Software Defined Perimeter (SDP): Creating a new network perimeter
======
Considering the way networks work today and the change in traffic patterns; both internal and to the cloud, this limits the effect of the fixed perimeter.
![monsitj / Getty Images][1]

Networks were initially designed to create internal segments that were separated from the external world by using a fixed perimeter. The internal network was deemed trustworthy, whereas the external was considered hostile. However, this is still the foundation for most networking professionals even though a lot has changed since the inception of the design.

More often than not the fixed perimeter consists of a number of network and security appliances, thereby creating a service chained stack, resulting in appliance sprawl. Typically, the appliances that a user may need to pass to get to the internal LAN may vary. But generally, the stack would consist of global load balancers, external firewall, DDoS appliance, VPN concentrator, internal firewall and eventually LAN segments.

The perimeter approach based its design on visibility and accessibility. If an entity external to the network can’t see an internal resource, then access cannot be gained. As a result, external entities were blocked from coming in, yet internal entities were permitted to passage out. However, it worked only to a certain degree. Realistically, the fixed network perimeter will always be breachable; it's just a matter of time. Someone with enough skill will eventually get through.

**[ Related:[MPLS explained – What you need to know about multi-protocol label switching][2]**

### Environmental changes – the cloud and mobile workforce

Considering the way networks work today and the change in traffic patterns; both internal and to the cloud, this limits the effect of the fixed perimeter. Nowadays, we have a very fluid network perimeter with many points of entry.

Imagine a castle with a portcullis that was used to gain access. To gain entry into the portcullis was easy as we just needed to pass one guard. There was only one way in and one way out. But today, in this digital world, we have so many small doors and ways to enter, all of which need to be individually protected.

This boils down to the introduction of cloud-based application services and changing the location of the perimeter. Therefore, the existing networking equipment used for the perimeter is topologically ill-located. Nowadays, everything that is important is outside the perimeter, such as, remote access workers, SaaS, IaaS and PaaS-based applications.

Users require access to the resources in various cloud services regardless of where the resources are located, resulting in complex-to-control multi-cloud environments. Objectively, the users do not and should not care where the applications are located. They just require access to the application. Also, the increased use of mobile workforce that demands anytime and anywhere access from a variety of devices has challenged the enterprises to support this dynamic workforce.

There is also an increasing number of devices, such as, BYOD, on-site contractors, and partners that will continue to grow internal to the network. This ultimately leads to a world of over-connected networks.

### Over-connected networks

Over-connected networks result in complex configurations of network appliances. This results in large and complex policies without any context.

They provide a level of coarse-grained access to a variety of services where the IP address does not correspond to the actual user. Traditional appliances that use static configurations to limit the incoming and outgoing traffic are commonly based on information in the IP packet and the port number.

Essentially, there is no notion of policy and explanation of why a given source IP address is on the list. This approach fails to take into consideration any notion of trust and dynamically adjust access in relation to the device, users and application request events.

### Problems with IP addresses

Back in the early 1990s, RFC 1597 declared three IP ranges reserved for private use: 10.0.0.0/8, 172.16.0.0/12 and 192.168.0.0/16. If an end host was configured with one of these addresses, it was considered more secure. However, this assumption of trust was shattered with the passage of time and it still haunts us today.

Network Address Translation (NAT) also changed things to a great extent. NAT allowed internal trusted hosts to communicate directly with the external untrusted hosts. However, since Transmission Control Protocol (TCP) is bidirectional, it allows the data to be injected by the external hosts while connecting back to the internal hosts.

Also, there is no contextual information regarding the IP addresses as the sole purpose revolved around connectivity. If you have the IP address of someone, you can connect to them. The authentication was handled higher up in the stack.

Not only do user’s IP addresses change regularly, but there’s also not a one-to-one correspondence between the users and IP addresses. Anyone can communicate from any IP address they please and also insert themselves between you and the trusted resource.

Have you ever heard of the 20-year old computer that responds to an internet control message protocol (ICMP) request, yet no one knows where it is? But this would not exist on a zero trust network as the network is dark until the administrator turns the lights on with a whitelist policy rule set. This is contrary to the legacy black policy rule set. You can find more information on zero trust in my course: [Zero Trust Networking: The Big Picture][3].

Therefore, we can’t just rely on the IP addresses and expect them to do much more other than connect. As a result, we have to move away from the IP addresses and network location as the proxy for access trust. The network location can longer be the driver of network access levels. It is not fully equipped to decide the trust of a device, user or application.

### Visibility – a major gap

When we analyze networking and its flaws, visibility is a major gap in today’s hybrid environments. By and large, enterprise networks are complex beasts. More than often networking pros do not have accurate data or insights into who or what is accessing the network resource.

I.T does not have the visibility in place to detect, for example, insecure devices, unauthorized users and potentially harmful connections that could propagate malware or perform data exfiltration.

Also, once you know how network elements connect, how do you ensure that they don’t reconnect through a broader definition of connectivity? For this, you need contextual visibility. You need full visibility into the network to see who, what, when, and how they are connecting with the device.

### What’s the workaround?

A new approach is needed that enables the application owners to protect the infrastructure located in a public or private cloud and on-premise data center. This new network architecture is known as [software-defined perimeter][4] (SDP). Back in 2013, Cloud Security Alliance (CSA) launched the SDP initiative, a project designed to develop the architecture for creating more robust networks.

The principles behind SDPs are not entirely new. Organizations within the DoD and Intelligence Communities (IC) have implemented a similar network architecture that is based on authentication and authorization prior to network access.

Typically, every internal resource is hidden behind an appliance. And a user must authenticate before visibility of the authorized services is made available and access is granted.

### Applying the zero trust framework

SDP is an extension to [zero trust][5] which removes the implicit trust from the network. The concept of SDP started with Google’s BeyondCorp, which is the general direction that the industry is heading to right now.

Google’s BeyondCorp puts forward the idea that the corporate network does not have any meaning. The trust regarding accessing an application is set by a static network perimeter containing a central appliance. This appliance permits the inbound and outbound access based on a very coarse policy.

However, access to the application should be based on other parameters such as who the user is, the judgment of the security stance of the device, followed by some continuous assessment of the session. Rationally, only then should access be permitted.

Let’s face it, the assumption that internal traffic can be trusted is flawed and zero trust assumes that all hosts internal to the network are internet facing, thereby hostile.

### What is software-defined perimeter (SDP)?

The SDP aims to deploy perimeter functionality for dynamically provisioned perimeters meant for clouds, hybrid environments, and on-premise data center infrastructures. There is often a dynamic tunnel that automatically gets created during the session. That is a one-to-one mapping between the requesting entity and the trusted resource. The important point to note here is that perimeters are formed not solely to obey a fixed location already design by the network team.

SDP relies on two major pillars and these are the authentication and authorization stages. SDPs require endpoints to authenticate and be authorized first before obtaining network access to the protected entities. Then, encrypted connections are created in real-time between the requesting systems and application infrastructure.

Authenticating and authorizing the users and their devices before even allowing a single packet to reach the target service, enforces what's known as least privilege at the network layer. Essentially, the concept of least privilege is for an entity to be granted only the minimum privileges that it needs to get its work done. Within a zero trust network, privilege is more dynamic than it would be in traditional networks since it uses many different attributes of activity to determine the trust score.

### The dark network

Connectivity is based on a need-to-know model. Under this model, no DNS information, internal IP addresses or visible ports of internal network infrastructure are transmitted. This is the reason why SDP assets are considered as “dark”. As a result, SDP isolates any concerns about the network and application. The applications and users are considered abstract, be it on-premise or in the cloud, which becomes irrelevant to the assigned policy.

Access is granted directly between the users and their devices to the application and resource, regardless of the underlying network infrastructure. There simply is no concept of inside and outside of the network. This ultimately removes the network location point as a position of advantage and also eliminates the excessive implicit trust that IP addresses offer.

**This article is published as part of the IDG Contributor Network.[Want to Join?][6]**

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3402258/software-defined-perimeter-sdp-creating-a-new-network-perimeter.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/03/sdn_software-defined-network_architecture-100791938-large.jpg
[2]: https://www.networkworld.com/article/2297171/sd-wan/network-security-mpls-explained.html
[3]: http://pluralsight.com/courses/zero-trust-networking-big-picture
[4]: https://network-insight.net/2018/09/software-defined-perimeter-zero-trust/
[5]: https://network-insight.net/2018/10/zero-trust-networking-ztn-want-ghosted/
[6]: /contributor-network/signup.html
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
