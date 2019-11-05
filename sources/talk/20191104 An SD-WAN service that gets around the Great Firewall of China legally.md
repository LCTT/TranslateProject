[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (An SD-WAN service that gets around the Great Firewall of China legally)
[#]: via: (https://www.networkworld.com/article/3451384/a-vpn-service-that-gets-around-the-great-firewall-of-china-legally.html)
[#]: author: (Linda Musthaler https://www.networkworld.com/author/Linda-Musthaler/)

An SD-WAN service that gets around the Great Firewall of China legally
======
Teridion’s SD-WAN service for China complies with government restrictions on IPSec traffic leaving the country yet supports broadband IPSec WAN interfaces for international businesses with branches in China.
Matejmo / Getty Images

The saying goes that China is the world’s factory. For many companies around the world, their products or components of their products are produced in mainland China. At the same time, China’s population of more than a billion people makes it one of the world’s largest consumer markets. Thus, for either production or sales, many companies want to do business in China and have established facilities there.

On the networking front, this means that multinational companies need to extend their wide area network into China to support their large or rapidly growing operations—and that’s easier said than done.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

Many organizations had done this using [VPNs][2], but in early 2018, the Chinese government placed restrictions on IPsec traffic to basically block it from going in and out of the country. The Ministry of Industry and Information Technology (MIIT) said these restrictions are in accordance with the China Cross-border Data Telecommunications Industry Alliance (CDTIA), which was created to regulate cross-border data communication.

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

The results of the regulation were very disruptive to businesses that depended on their VPNs for access to cloud services and data security, among other things. This regulation threw a big monkey wrench in the global WAN strategies for a lot of enterprises. Companies weren’t totally left without options to deploy a WAN into China, but the solutions that were available at that point were very expensive.

One option is to run an [MPLS][4] circuit into the country. So, for example, a business with a factory in Shanghai can run an MPLS circuit from there back to Hong Kong or Singapore, and then connect that into a global SD-WAN. However, this option is very expensive, takes a long time to deliver and is bandwidth-constrained. A typical Chinese MPLS circuit is somewhere south of 20 MB of bandwidth, and it could cost $15,000 to $20,000 for a single circuit. On the other hand, it does work, it’s reliable, and it is compliant with the CDTIA requirements, making it a viable solution for enterprises that must have WAN access in China.

Another option is to go with a managed VPN solution from one of the three major telecom providers: China Telecom, China Unicom and China Mobile. While the service they provide is based on IPsec, they are sanctioned by the MIIT to provide this service because they agree to force all outbound traffic through the [Great Firewall of China][5]. This enables the telecom companies to block restricted traffic, which of course is sub-optimal for enterprises. What’s more, going through the Great Firewall causes tremendous performance issues. For example, it can take two minutes just to load a text-only website if one has to go through the firewall to get to it.

The CDTIA regulations have a loophole that allows an enterprise to do VPN connectivity between sites that go outside the country, as long as the traffic is carried by one of the three Chinese telecom providers listed above. Businesses can use a private MPLS circuit or managed IPsec. Broadband access within China actually offers good performance and is relatively inexpensive. A 500 MB broadband connection from China Telecom is about $30 a month. The performance degradation occurs when traffic has to pass through the Great Firewall but going from one factory to another within China across broadband is pretty fast.

### A new option for SD-WAN service into China

Now there is a third option for WAN connectivity outside China. [Teridion][6] has developed an [SD-WAN][7] solution that leverages the plentiful, fast, low-cost domestic broadband and builds on it to provide access into high speed WAN connectivity outside the country in a way that’s consistent with the regulatory environment. To develop its [SD-WAN Service for China][8], Teridion worked with legal authorities within China to ensure that this solution meets all Chinese regulations while being available to the world.

Outside of China, Teridion has built a [global WAN service][9] that utilizes the public Internet as a backbone with unique capabilities to direct and manage the routing of traffic across this network. Teridion leverages a private routing infrastructure using Teridion Cloud Routers (TCRs) at the edge to establish the fastest path, at any given time, between a source and a destination. This approach provides accelerated access from one user site to another, or from user to SaaS applications and cloud workloads.

Because Teridion has a lot of flexibility in choosing routes, this approach eliminates the reliability and performance gaps that are introduced when relying on the public Internet. What’s more, it provides reliability equivalent to MPLS and is fully backed by Teridion’s SLAs, according to Ed Wright, Director of Marketing at Teridion. The company has more than 400 PoPs worldwide, enabling them to create a high performance and highly reliable “middle mile” global network, he said.

Teridion is using that same architecture and same technology to build out its China SD-WAN solution. The company deploys TCRs at the cloud edge within China. Sites in China connect to the TCRs via an IPsec connection through broadband. The connection to the rest-of-world Teridion network runs through dedicated circuits from inside China to Hong Kong and Singapore. Think of it as two “twinned” Teridion architectures which are connected to each other through these massive circuits between China and Hong Kong and Singapore. It’s a layered approach that meets the regulatory environment but also allows for broadband at the edge, and the advantages of Teridion optimization, according to Wright.

### A unified global WAN

From a customer perspective, this “twinned” model results in a unified environment for a global WAN. A customer can go into a Teridion portal to manage their Chinese locations in exactly the same way they manage their other locations, all through a single pane of glass. The Chinese sites look exactly the same, and there’s nothing to configure or manage differently with the Chinese sites.

The solution leverages the low cost, high speed local broadband connections in China, allows the enterprise to use these fully, connects to Teridion within country, and then Teridion takes the traffic out of the country and passes it onto the network out of the country. All of this takes place within the regulatory environment so that Teridion and its customers can comply with Chinese law. Teridion says it has received certification of compliance from the providers, who are then in turn beholden to the government.

From the standpoint of the enterprise, they're simply connecting to Teridion’s network. Let's say a company has a site in Los Angeles site as well as one in Guangzhou. In Guangzhou, they bring up an IPsec connection to a Teridion Cloud Router that's running in Shanghai. And so, from their standpoint, they've got an IPsec connection into mainland China, an IPsec connection in the US, and then Teridion routes the traffic through its network, which is conforming to the spirit of the CDTIA regulations as imposed by the MIIT.

“It's confusing,” says Pejman Roshan, VP of Products and Marketing for Teridion. “It took us a lot of lawyers to figure out what was allowed and what wasn't allowed. Even when we talked to the Chinese ISPs, the big three, it's very gray and muddy. We had a dedicated team of lawyers in the US and in China that were helping us navigate these rules to finally figure out what's allowed, what's not allowed, what's compliant, and how we maintain compliance so it doesn't just turn off tomorrow. It’s all very complicated and we’ve eliminated that complexity for enterprises as part of this.”

Sean Dublin is president of business development with the IT consulting firm 26Connect. “Our global customers were looking for a ubiquitous platform for all of their users, including their mainland China sites,” says Dublin. “Up until recently there really hasn’t been a good solution. You could go back to the previous world of MPLS, but if you don’t have physical connectivity between mainland China and the rest of the world, the experience is sub-par, to say the least. Before partners like Teridion, there wasn’t a great solution other than the Chinese carriers. It was very kludgy. Technology is now meeting that demand and a company like Teridion that offers an agnostic platform where you can overlay MPLS, SD-WAN, IP, any of those different things means now we have a true solution for mainland China.”

“What we found with SD-WAN is that people were putting PoPs in mainland China and then in the rest of the world but they weren’t going the extra step for the physical connectivity through the Great Chinese Firewall,” says Dublin “With the constant fluidity and volatility of the Great Firewall and their regulations pertaining to IPSec, we need partners like Teridion who are willing to take that extra step for you to really get that true, perfect, even customer experience.”

26Connect has clients that are on the Teridion network and they have been waiting for the Chinese service to be generally available. (It went live October 24.) “The good news is, with Teridion, regardless of what region they open up, the platform is the same. With China there will be some marketing differentiators with compliance, but at the end of the day what you have is a single platform that can now work throughout the entire world,” says Dublin. “For Teridion to bring a proven technology that will solve that problem at the price point they are able to do it is kind of mind blowing. It’s a difficult thing to do so people usually charge a significant premium for it. Teridion is now able to offer that to anybody who has offices in mainland China and have it be cost-effective.”

["How to determine if Wi-Fi 6 is right for you"][10]

Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3451384/a-vpn-service-that-gets-around-the-great-firewall-of-china-legally.html

作者：[Linda Musthaler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Linda-Musthaler/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3268744/understanding-virtual-private-networks-and-why-vpns-are-important-to-sd-wan.html
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.networkworld.com/article/2297171/network-security-mpls-explained.html
[5]: https://www.networkworld.com/article/2362051/behind-the-great-firewall-what-its-really-like-to-log-on-from-china.html
[6]: https://www.teridion.com/
[7]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[8]: https://www.teridion.com/china
[9]: https://www.networkworld.com/article/3398939/teridion-s-entry-in-the-mns-market-supports-enterprise-wide-area-networking.html
[10]: https://www.networkworld.com/article/3356838/how-to-determine-if-wi-fi-6-is-right-for-you.html
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
