[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Secure SD-WAN: The security vendors and their SD-WAN offerings)
[#]: via: (https://www.networkworld.com/article/3489480/secure-sd-wan-the-security-vendors-and-their-sd-wan-offerings.html)
[#]: author: (Matt Conran https://www.networkworld.com/author/Matt-Conran/)

Secure SD-WAN: The security vendors and their SD-WAN offerings
======
A networking vendor simply can’t jump into this space. Some SD-WANs add stateful packet filters and call this security.
[Gerd Altmann][1] [(CC0)][2]

During its inception, we had the early adopters and pure SD-WAN players. Soon it became obvious that something was missing, and that missing component was “security.” However, security vendors have highlighted the importance of security from the very beginning.

Today, the market seems to be moving in the direction where the security vendors are focusing on delivering SD-WAN features around pervasive security. The Magic Quadrant for WAN Edge Infrastructure has made a substantial prediction. It states, “By 2024, 50% of new firewall purchases in distributed enterprises will utilize SD-WAN features with the growing adoption of cloud-based services, up from less than 20% today.”

Nowadays we have security vendors like Forcepoint, SonicWall and Barracuda that follow the pattern of Fortinet. The vendors offer a built-in security stack to the WAN edge architecture for distributed enterprise use cases.

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

### Introducing secure SD-WAN

Pronouncedly, secure SD-WAN includes the best-of-breed next-generation firewall security, SD-WAN, advanced routing, and WAN optimization to deliver a security-driven WAN edge. It combines the SD-WAN feature and security features together.  

The secure SD-WAN solution can be placed fully in the branch and the cloud or a hybrid approach can be adopted. For those who don’t want to put everything in the cloud, a hybrid approach could be more viable.

To me, it is quite interesting seeing how the queries are coming into the analysts and how customers are giving attention to this field. Markedly, Gartner estimates that Fortinet has more than 21,000 WAN edge customers. That’s a considerable user base and makes a compelling case, especially when strong and built-in security capabilities are the key requirements.

### Adding security to networking

It is definitely easier for a security company to add new networking features than for an SD-WAN company to add 20 years of advanced security features. We can safely assume that no SD-WAN vendor is going to become a security vendor.

**[ Now read [20 hot jobs ambitious IT pros should shoot for][4]. ]**

As the market developed, in due course, some features had to be renamed: when we talk about application identification, encryption, path monitoring, routing protocols and WAN link load balancing. Fundamentally, all of these advanced routing features are not new and specific to SD-WAN. These are not overnight successes and have been in the market even before the market existed.

However, in some scenarios, maybe you have to implement a proprietary routing protocol across the WAN. In this case, yes, of course, you require a new device. But for most of the part, a comprehensive firewall at the edge will suffice.

### The firewall at the WAN edge

Firewalls are evolving into network security platforms, thereby offering SD-WAN capabilities. The Magic Quadrant for Network Firewalls states “The SMB multifunction firewall market grew 10.1% in 2018, with SD-WAN adoption being a strong driver.”

When you think about it, you will realize that the firewall has been acting as a router for a long time. Essentially, the firewall can provide all the routing protocols to facilitate private WAN, internet and internal routing. This functionality is usually provided by a basic device that just does the routing. However, now we are witnessing the replacement of these by an edge appliance with firewalls.

Firewalls have resided in the networks for decades. Their role has not just been confined to doing the firewalling but also participating in the routed networks. Time and again, they have been providing a routed WAN edge device.

### Issues with legacy security design

How do you integrate security with SD-WAN? Primarily, the common design involves the integration of multiple security point solutions. Now, let’s learn about the aftermath of these point solutions.

### Complexity

The point solution only addresses one issue and requires a considerable amount of integration with others. Because of this, they are often service-chained together. Each part must be carefully integrated with the other.

You must continuously add solutions to the stack, which is likely to result in management overhead and increased complexity. Not to mention the challenges with NOC and SOC team integration. Contrarily, the original selling point for SD-WAN was to reduce complexity and not intensify it.

If we examine security in the world of SD-WAN; the way it has been geared up at the moment is provided in parts that actually increase complexity. It’s like building a house with individual pieces when you actually just want to buy a house.

If you analyze, you will find that many SD-WANs are merely bringing in security technologies from other vendors, joined together to sell them to the customers.

### Associated costs

Having multiple point solutions often from different vendors dispersed around the network is expensive. There’s never a fixed price. Some security vendors may charge on usage models which you may not have the quantity for yet. So, how do you effectively plan for this when you have multiples? 

As the costs keep adding up, the security professionals may decide to trade-off certain point solutions due to the associated costs. We know now this is not an effective risk management strategy. Ideally, in terms of security, you don't do something when it is needed; you do it before it is needed. This means threat intelligence is the key, which is often overlooked by many SD-WAN vendors.

It’s far more critical from both technical and cost perspective to bring each of the security point solution functionalities together under one hood. And to do this, someone that specializes in security from day one would fit the bill. This is why there has been a move to provide SD-WAN features along with advanced security into one comprehensive integrated platform.

Secure SD-WAN is what combines both network and security into one integrated platform. This leads to no more complex management, licensing issues, high costs or unnecessary service chaining.

### SD-WAN is not about features

There is a lot of noise in the SD-WAN market about the features. Let’s face it ‘features really don’t draw much value to create market separation’. Practically, the value proposition for SD-WAN is not about the feature. Everyone is doing a good job in classifying applications and sending them across the best path. Let’s understand the true value proposition for SD-WAN.

### Performance and scalability

When it comes to SD-WAN, the bell to ring is often application steering, but if you don’t have, for example, the deep TLS1.3 inspection with solid performance, how can you get accurate identification and make sure your branch is secure? Not enough people are talking about this.

For this, we need custom SD-WAN-specific application-specific integrated circuits (ASICs). This offers an incredible advantage for the high resource intensive encryption/decryption and overlay scalability.

With IPSec, there are intensive encrypting operations that consume a lot of CPU and RAM. Therefore, a purpose-built SD-WAN ASIC is built just to do that so it consumes less CPU and RAM per tunnel.

In general, the scalability stops at 1,000 or 1,500. With the proper ASIC, this number can be scaled to over 100,000, which may be useful for some hub site designs. By using the ASIC, you can run the networking stack and security stack in the same appliance, making a very efficient and cost-effective solution.

### The importance of threat intelligence

The next-generation firewall is in the datasheets for many SD-WAN vendors. However, what about the threat detection and threat prevention? A big piece missing from the many SD-WAN vendors is threat intelligence in alliance with threat research. The threat landscape is evolving, so too should the security solution to keep in line with today’s and tomorrow's threats.

Threat prevention has core features from layer 4 to layer 7 such as IPS, content filtering, deep SSL inspection, and anti-malware. Furthermore, we also have a threat detection piece. Nowadays, you can no longer rely on detecting known threats, you have to detect unknown threats too. So having a stack of both prevention and detection features is very important. With the two features glued together, we can have experienced security research and analyst teams. It is significant to observe whether the SD-WAN vendor has its own threat intelligence.

For this, we really do need the security company pedigree. The core value for any security vendor comes with their level of intelligence research. This is what creates market separation, not SD-WAN features.

However, there is another step, which is to confirm if the proposed features have been validated by 3rd parties such as NSS labs. NSS Labs has evaluated some of these security vendors for their SD-WAN leading products on areas such as the quality of experience (QoE) of VoIP and video, performance (WAN impairments and HA), the total cost of ownership (TCO) along with security effectiveness.

Also, we must question how often does the ‘SD-WAN device providing firewalling’ gets updated with the latest threat information. Is this process carried a few times per day or per week? Some SD-WAN solutions market them as a secure SD-WAN vendor, but if we go back to the point of building effective security, we need a solid threat intelligence team. Do startups have enough manpower to do that? A networking vendor simply can’t jump into this space. Some SD-WANs add stateful packet filters and call this security.

Let’s be honest, a next-generation firewall can be used by anyone. However, the importance of the breadth of the features, the intelligence they provide and the recognition in the market play a huge role. This is what builds trust in the next-generation firewall in the branch and ensures that the best security posture remains the best.

When you’re looking for secure SD-WAN vendors, highlight these questions and examine how old their security stack is. Also, assess if they have an experienced threat intelligence team.

The market is moving towards a secure SD-WAN solution. The industry analysis and the rise of the customer base have a great impact in today’s time. It is not the case that people are recognizing security vendors as strong SD-WAN players.

However, recognizing the market demands secure SD-WAN in one integrated comprehensive platform.

**This article is published as part of the IDG Contributor Network. [Want to Join?][5]**

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3489480/secure-sd-wan-the-security-vendors-and-their-sd-wan-offerings.html

作者：[Matt Conran][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://pixabay.com/illustrations/network-control-block-chain-hexagon-4478145/
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.networkworld.com/article/3276025/careers/20-hot-jobs-ambitious-it-pros-should-shoot-for.html
[5]: https://www.networkworld.com/contributor-network/signup.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
