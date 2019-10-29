[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (To secure industrial IoT, use segmentation instead of firewalls)
[#]: via: (https://www.networkworld.com/article/3437956/to-secure-industrial-iot-use-segmentation-instead-of-firewalls.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

To secure industrial IoT, use segmentation instead of firewalls
======
Firewalls have been the de facto standard for securing internal devices for years, but the industrial internet of things (IIoT) will change that.
Jiraroj Praditcharoenkul / Getty Images

The internet of things (IoT) has been top of mind for network and security professionals for the better part of the past five years. This has been particularly true for the area of industrial IoT (IIoT). Connected industrial devices are nothing new, but most IT people aren’t familiar with them because they have been managed by operational technology (OT) teams. More and more, though, business leaders want to bring OT and IT together to drive better insights from the combined data set.

While there are many advantages to merging IT and OT and having IIoT fall under IT ownership, it has a profound impact on the cybersecurity team because it introduces several new security threats. Each connected endpoint, if breached, creates a backdoor into the other systems.

**[ Also read: [A corporate guide to addressing IoT security][1] ]**

### Internal firewalls an expensive, complex option for IIoT

One way to protect IIoT environments is to use internal firewalls. This may seem like an obvious choice because internal firewalls have become the de facto standard for securing almost anything. However, in an IIoT environment, firewalls are perhaps the worst choice because of cost and complexity.

Historically, internal firewalls were deployed where traffic moved in a “north-south” direction and would pass through a single ingress/egress point, such as a core switch.  Also, the devices connected were all known and managed by IT. With IIoT, connections can be much more dynamic and traffic can flow between devices in an “east-west” pattern, bypassing where the firewalls are located. That means security teams would need to deploy an internal firewall at every possible IIoT connection point and then manage the policies and configurations across hundreds, possibly thousands of firewalls, creating an almost unmanageable situation.

To get a better understanding of the magnitude of this problem, I talked with Jeff Hussey, president and CEO of Tempered Networks, which specializes in IIoT security solutions, and he told me about one of the company’s customers that explored using internal firewalls. After doing an extensive evaluation of where all the internal firewalls would need to go, the business estimated that the total cost of firewalls would be about $100 million. Even if a business could afford that, there’s another layer of challenges associated with the operational side.

Hussey then told me about a healthcare customer that’s trying to use a combination of firewall rules, ACL, VLANs, and VPNs to secure their environment, but, as he put it, “the complexity was killing them” and makes it impossible to get anything done because of the operational overhead.

I also spoke with Derek Harp, founder and chairman of the [Control System Cyber Security Association International][2] (CS2AI), who does a lot of work in the IIoT area. He described the current IIoT environments as getting “more porous” as networks continue to evolve and become more open as third parties need access to data from internal systems. Toss in the advanced skill level of threat actors, and it’s easy to see how this isn’t a fight that cybersecurity teams can fight with traditional network security.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][3] ]**

### Micro-segmentation preferred over internal firewalls for IIoT

Instead of using internal firewalls, security professionals should turn towards IIoT micro-segmentation. Segmentation is similar to the use of VLANs and ACLs, but the environmental separation is done at the device level and managed with rules instead of at the network layer. With VLANs and ACLs, all devices, including IIoT endpoints, would need to be assigned to a VLAN. If the endpoint moves, the network then needs to be reconfigured to accommodate. If it’s not, the device either can’t connect or is on the same network as devices where bad things could happen if it were breached.

The Target breach of a few years ago is an excellent example of this where the retailer's HVAC system was compromised, and that created a back door into the point-of-sale (PoS) system. Traditional security works great in highly static environments, but IIoT can be highly dynamic with devices routinely joining and leaving the network.

### Segmentation operates at the device layer

The benefit of segmentation is that it’s done in software and operates at the device connectivity layer, so policies follow the endpoints. For example, a rule could be created where all medical devices are in a particular segment and isolated from the rest of the connected nodes. If a medical device moves, the policy goes with it and there’s no need to reconfigure things. If Target had been using IIoT micro-segmentation and the HVAC and PoS systems were in separate segments (which they should be from a best practice standpoint), the worst that could have happened is the stores got too warm.

Micro-segmentation has been used in data centers to secure lateral traffic that flows between virtual machines and containers. Cybersecurity teams should now look to extend the technology out to the broader network, with the first use case being to secure IIoT endpoints. This will let businesses move forward with digital transformation plans without putting their companies at risk.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3437956/to-secure-industrial-iot-use-segmentation-instead-of-firewalls.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3269165/internet-of-things/a-corporate-guide-to-addressing-iot-security-concerns.html
[2]: https://www.cs2ai.org/
[3]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
