[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tempered Networks simplifies secure network connectivity and microsegmentation)
[#]: via: (https://www.networkworld.com/article/3405853/tempered-networks-simplifies-secure-network-connectivity-and-microsegmentation.html)
[#]: author: (Linda Musthaler https://www.networkworld.com/author/Linda-Musthaler/)

Tempered Networks simplifies secure network connectivity and microsegmentation
======
Tempered Networks’ Identity Defined Network platform uses the Host Identity Protocol to partition and isolate the network into trusted microsegments, providing an easy and cost-effective way to secure the network.
![Thinkstock][1]

The TCP/IP protocol is the foundation of the internet and pretty much every single network out there. The protocol was designed 45 years ago and was originally only created for connectivity. There’s nothing in the protocol for security, mobility, or trusted authentication.

The fundamental problem with TCP/IP is that the IP address within the protocol represents both the device location and the device identity on a network. This dual functionality of the address lacks the basic mechanisms for security and mobility of devices on a network.

This is one of the reasons networks are so complicated today. To connect to things on a network or over the internet, you need VPNs, firewalls, routers, cell modems, etc. and you have all the configurations that come with ACLs, VLANs, certificates, and so on. The nightmare grows exponentially when you factor in internet of things (IoT) device connectivity and security. It’s all unsustainable at scale.

Clearly, we need a more efficient and effective way to take on network connectivity, mobility, and security.

**[ Also read: [What is microsegmentation? How getting granular improves network security][2] | Get regularly scheduled insights: [Sign up for Network World newsletters][3] ]**

The Internet Engineering Task Force (IETF) tackled this problem with the Host Identity Protocol (HIP). It provides a method of separating the endpoint identifier and the locator roles of IP addresses. It introduces a new Host Identity (HI) name space, based on public keys, from which endpoint identifiers are taken. HIP uses existing IP addressing and forwarding for locators and packet delivery.The protocol is compatible with IPv4 and IPv6 applications and utilizes a customized IPsec tunnel mode for confidentiality, authentication, and integrity of network applications.

Ratified by IETF in 2015, HIP represents a new security networking layer within the OSI stack. Think of it as Layer 3.5. It’s a flip of the trust model where TCP/IP is inherently promiscuous and will answer to anything that wants to talk to a device on that network. In contrast, HIP is a trust protocol that will not answer to anything on the network unless that connection has been authenticated and authorized based on its cryptographic identity. It is, in effect, a form of a [software-defined perimeter][4] around specific network resources. This is also known as [microsegmentation][5].

![][6]

### Tempered Networks’ IDN platform creates segmented, encrypted network

[Tempered Networks][7] has created a platform utilizing the HIP and a variety of technologies that partitions and isolates the network into trusted microsegments. Tempered Networks’ Identity Defined Networking (IDN) platform is deployed as an overlay technology that layers on top of any IP network. The HIP was designed to be both forward and backward compatible with any IP network without having to make any changes to the underlay network. The overlay network creates a direct tunnel between the two things you want to connect.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][8] ]**

The IDN platform uses three components to create a segmented and encrypted network: an orchestration engine called the Conductor, the HIPrelay identity-based router, and HIP Services enforcement points.

The Conductor is a centralized orchestration and intelligence engine that connects, protects, and disconnects any resource globally through a single pane of glass. The Conductor is used to define and enforce policies for HIP Services. Policy configuration is done in a simple point-and-click manner. The Conductor is available as a physical or virtual appliance or in the Amazon Web Services (AWS) cloud.

HIP Services provide software-based policy enforcement, enabling secure connectivity among IDN-protected devices, as well as cloaking, segmentation, identity-based routing, and IP mobility. They can be deployed on or in-line to any device or system and come in the form of HIPswitch hardware, HIPserver, HIPclient, Cloud HIPswitch, or Virtual HIPswitch. HIP Services also can be embedded in customer hardware or applications.

Placing HIPswitches in front of any connected device renders the device HIP-enabled and immediately microsegments the traffic, isolating inbound and outbound traffic from the underlying network. HIPswitches deployed on the network automatically register with the Conductor using their cryptographic identity.

HIPrelay works with the HIP Service-enabled endpoints to deliver peer-to-peer connectivity for any device or system across all networks and transport options. Rather than using Layer 3 or 4 rule sets or traditional routing protocols, HIPrelay routes and connects encrypted communications based on provable cryptographic identities traversing existing infrastructure.

It sounds complicated, but it really isn’t. A use case example should demonstrate the ease and power of this solution.

### Use case: Smart Ships

An international cruise line recently installed Tempered Networks’ IDN solution to provide tighter security around its critical maritime systems. Prior to deployment, the systems for fuel, propulsion, navigation, ballast, weather, and incinerators were on a flat Layer 2 network, which basically allowed authorized users of the network to see everything.

Given that vendors of the different maritime systems had access to their own system, the lack of microsegmentation allowed them to see the other systems as well. The cruise line needed a simple way to segment access to these different systems — isolating them from each other — and they wanted to do it without having to put the ships in dry dock for the network reconfiguration.

The original configuration looked like this:

![][9]

The company implemented microsegmentation of the network based on the functionality of the systems. This isolated and segmented vendor access to only their own systems — everything else was hidden to them. The implementation involved installing HIPrelay identity routing in the cloud, several HIPswitch wireless devices onboard the ships, and HIPclient software on the vendors’ and crew members’ devices. The Conductor appliance that managed the entire deployment was installed in AWS.

All of that was done without impacting the underlying network, and no dry dock time was required for the deployment. In addition, the cruise line was able to eliminate internal firewalls and VPNs that had previously been used for segmentation and remote access. The resulting configuration looks like this:

![][10]

The color coding of the illustration above indicates what systems are now able to directly see and communicate with their corresponding controllers and sensors. Everything else on the network is hidden from view of those systems.

The acquisition cost of the Tempered Networks’ solution was one-tenth that of a traditional microsegmentation solution. The deployment time was 2 FTE days per ship compared to the 40 FTE days a traditional solution would have needed. No additional staffing was required to support the solution, and no changes were made to the underlying network.

### A time-tested microsegmentation solution

This technology came out of Boeing and was deployed for over 12 years within their manufacturing facilities until 2014, when Boeing allowed the technology to become commercialized. Tempered Networks took the HIP and developed the full platform with easy, centralized management. It was purpose-built to provide secure connectivity to networks. The solution has been successfully deployed in industrial domains such as the utilities sector, oil and gas, electricity generation, and aircraft manufacturing, as well as in enterprise domains and healthcare.

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3405853/tempered-networks-simplifies-secure-network-connectivity-and-microsegmentation.html

作者：[Linda Musthaler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Linda-Musthaler/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/01/network_security_hacker_virus_crime-100745979-large.jpg
[2]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3359363/software-defined-perimeter-brings-trusted-access-to-multi-cloud-applications-network-resources.html
[5]: https://www.networkworld.com/article/3247672/what-is-microsegmentation-how-getting-granular-improves-network-security.html
[6]: https://images.idgesg.net/images/article/2019/07/hip-slide-100800735-large.jpg
[7]: https://www.temperednetworks.com/
[8]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[9]: https://images.idgesg.net/images/article/2019/07/cruise-ship-before-100800736-large.jpg
[10]: https://images.idgesg.net/images/article/2019/07/cruise-ship-after-100800738-large.jpg
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
