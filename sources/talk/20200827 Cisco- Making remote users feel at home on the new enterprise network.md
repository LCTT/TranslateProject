[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco: Making remote users feel at home on the new enterprise network)
[#]: via: (https://www.networkworld.com/article/3572446/cisco-making-remote-users-feel-at-home-on-the-new-enterprise-network.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco: Making remote users feel at home on the new enterprise network
======
With many remote workers likely to keep working from home even after COVID-19 subsides, Cisco joins other vendors offering infrastructure to make the remote network experience close to what it's like at corporate sites.
[Thinkstock][1]

When Covid-19 reared its ugly head earlier this year it [altered the way millions of corporate workers][2] access enterprise resources.  Now that it’s obvious those changes in many cases are going to be more permanent than originally thought, many customers and vendors are looking to support remote workers in ways not really expected in the past.

“The Covid-19 pandemic brought about a huge experiment in widespread remote working,” said Gartner vice president Elisabeth Joyce, of a recent survey of 127 company leaders that found  47% said they intend to allow employees to work remotely full time going forward. “As business leaders plan and execute [reopening of their workplace][3]s, they are evaluating more permanent remote working arrangements as a way to meet employee expectations and to build more resilient business operations."

**See** ["How to determine if Wi-Fi 6 is right for you"][4]

Indeed building [robust remote networking][5] environments is driving what Cisco and others are preparing for. 

“The fundamental shift is that we need to think about our people working from home, and the home networks they use, as the default network. What we want is to create a high-quality micro-branch office in your home,” said Greg Dorai, vice president of product management and strategy for Cisco’s Enterprise Infrastructure and Solutions Group.  “Now we must consider every work-from-home worker and every one of their home offices as worthy of the same level of connectivity support as our company headquarters and branches.”

Realistically every company cannot provide every worker with headquarters-level support for their home networks, but there are technologies available and coming in the near future that can address the different needs of different workers, Dorai said.

In Cisco’s case a couple of new offerings address wireless and wide area networking connectivity for remote users. 

“For employees for whom best-effort connectivity isn’t enough, we can replace or augment their home-networking access point with a Wi-Fi router that acts as an extension of the corporate network,” Dorai said. “Home wireless access points, configured by company IT before the employee installs them, can provide advanced security and monitoring and prioritize bandwidth for applications that need it.”

[[Get regularly scheduled insights by signing up for Network World newsletters.]][6]

Corporate access points can make the in-home user experience appear the same as the experience on the corproate-office network. If the devices automatically connect at the office, they’ll do the same at home – no need to bother with firing up a VPN, Dorai said.

As remote extensions of the corporate network, corporate IT will have full visibility into these access points, and can manage the devices remotely and track performance and security issues, Dorai said.

In Cisco’s case IT can manage remote users through its DNA Spaces package, which is comprised of Cisco’s Connected Mobile Experience (CMX) wireless suite and enterprise geolocation technology. Cisco CMX is a software engine that analyzes location and other intelligence gleaned from Cisco wireless infrastructure to help deliver services to customers on their mobile devices. DNA Spaces also provides businesses with analytics about who and what are in their physical locations along with the ability to act on those insights in real-time, according to Cisco.

To address some of these issues, Cisco has recently added a package called [Remote Workforce Wireless Solution][7] that lets customers provision and manage home workers. 

Another remote worker extension Cisco suggests is the use of [SD-WAN][8] routers for the home that include a wireless connection. 

“While this solution is overkill for most workers, when connectivity is mission-critical it’s the best option. It’s also a good solution for employees who don’t have a reliable primary ISP,” Dorai said. “IT can configure this equipment so critical communications are routed over it – either all the time, or when the main link becomes burdened.”

Cisco recently added a package called Remote Workforce Routing that offers zero-touch onboarding of all remote workers' wired and wireless devices and the company’s wireless LTE Advanced PRO for backup. The bundle also features Cisco’s SD-WAN Cloud OnRamp and Umbrella security support to let remote users access applications remotely and securely, Cisco says.

### Security for remote users

“For many office employees in companies that rely heavily on corporate applications, the standard model of equipping them with virtual private network software for their computers will continue to work. Configuring split tunneling can optimize performance to cloud-hosted services while still giving employees secure access to corporate-hosted resources,” Dorai said. 

[Split tunneling][9] is lets customers select specific, enterprise-bound traffic to be sent through a corporate [VPN][10] tunnel. The rest goes directly to the internet without going through the tunnel. Otherwise all traffic, even traffic headed for sites on the internet, would go through the VPN, through enterprise security measures and then back out to the internet. The idea is that the VPN infrastructure has to handle less traffic, so it performs better.

At the onset of the remote worker rush, many VPN providers – including Cisco and Microsoft – were talking up split tunneling as a key technology to help companies handle remote traffic.

"Remote users that require access to mostly cloud-based resources can use zero-trust technologies for security,” Dorai said  “But even in cases where the end user isn’t connected to corporate-controlled resources or for whom connecting to a VPN is superfluous, IT should still monitor the performance of the services they are using, to get ahead of any issues that may arise in their cloud services.”

Dorai said that Cisco is working on other packages it will ultimately offer “as-a-service” to help customers support remote workers.

The as-a-service strategy is part of a larger Cisco goal of increasing service offerings. Cisco CEO Chuck Robbins said in the company’s recent financial results call that the vendor “will accelerate the transition of the majority of our portfolio to be delivered as a service,” Robbins said. “We will also accelerate our investments in the following areas: cloud security; cloud collaboration; key enhancements for education, healthcare, and other industries; increased automation in the enterprise; the future of work; and application insights and analytics.”

### Cisco's not alone

Across the board other vendors are offering enterprise customers better remote-worker support as well.  For example, earlier this month [Juniper extended][11] its family of [Wi-Fi 6][4] wireless access points with the express idea of helping enterprise customers support remote workers.  The access points feature integration with the Juniper Mist Wi-Fi Assurance cloud service to help customers with automated WLAN configuration, anomaly detection, performance and service-level metrics to ultimately make wireless networks more predictable and reliable.

Other wireless vendors such as Cisco’s Meraki, CommScope, Cambium Networks are targeting the remote workforce.

For example, HPE’s Aruba has also [targeted remote users][12] with services from it recently introduced Edge Services Platform (ESP) which promises to analyze telemetry data and automatically optimize connectivity, find network problems, and secure edge networking. Its SD-Branch support offers a variety of corporate network-type feature support. 

Extreme too, through its ExtremeCloud IQ package and Wi-Fi 6 offerings, has also extended the enterprise network to help run and manage remote workers.

VMware has made upgrades to its Workspace Workspace ONE platform that securely manages end users' mobile devices and cloud-hosted virtual desktops and applications from the cloud or on-premise.

Join the Network World communities on [Facebook][13] and [LinkedIn][14] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3572446/cisco-making-remote-users-feel-at-home-on-the-new-enterprise-network.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: http://www.thinkstockphotos.com
[2]: https://www.networkworld.com/article/3532440/coronavirus-challenges-remote-networking.html
[3]: https://www.gartner.com/smarterwithgartner/return-to-workplace-guide-for-hr-leaders/
[4]: https://www.networkworld.com/article/3356838/how-to-determine-if-wi-fi-6-is-right-for-you.html
[5]: https://www.cisco.com/c/en/us/solutions/collateral/enterprise-networks/nb-06-remote-network-access-sol-overview-cte-en.html#Benefits
[6]: https://www.networkworld.com/newsletters/signup.html
[7]: https://www.cisco.com/c/en/us/solutions/enterprise-networks/enable-business-continuity-using-your-network.html
[8]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[9]: https://www.networkworld.com/article/3543298/cisco-others-shine-a-light-on-vpn-split-tunneling.html
[10]: https://www.networkworld.com/article/3268744/understanding-virtual-private-networks-and-why-vpns-are-important-to-sd-wan.html
[11]: https://www.networkworld.com/article/3570434/juniper-expands-wifi-6-access-point-family-to-support-remote-workers.html
[12]: https://www.networkworld.com/article/3562069/aruba-ai-platform-aims-to-streamline-management-of-edge-networks.html
[13]: https://www.facebook.com/NetworkWorld/
[14]: https://www.linkedin.com/company/network-world
