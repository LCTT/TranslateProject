[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Coronavirus challenges remote networking)
[#]: via: (https://www.networkworld.com/article/3532440/coronavirus-challenges-remote-networking.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Coronavirus challenges remote networking
======
COVID-19 sends IBM, Google, Amazon, AT&T, Cisco, Apple and others scrambling to securely support an enormous rise in teleworkers, and puts stress on remote-access networks.
Thinkstock

As the coronavirus spreads, many companies are requiring employees to work from home, putting unanticipated stress on remote networking technologies and causing bandwidth and security concerns.

Businesses have facilitated brisk growth of teleworkers over the past decades to an estimated 4 million-plus. The meteoric rise in new remote users expected to come online as a result of the novel coronavirus calls for stepped-up capacity.

Research by VPN vendor [Atlas][1] shows that VPN usage in the U.S. grew by 53% between March 9 and 15, and it could grow faster. VPN usage in Italy, where the virus outbreak is about two weeks ahead of the U.S., increased by 112% during the last week. "We estimate that VPN usage in the U.S. could increase over 150% by the end of the month," said Rachel Welch, chief operating officer of Atlas VPN, in a statement.

Businesses are trying to get a handle on how much capacity they'll need by running one-day tests. For example, JPMorgan Chase, Morningstar and analytics startup Arity have tested or plan to test their systems by having employees work from home for a day, according to the [Chicago Tribune][2].

On the government side, agencies such as [National Oceanic and Atmospheric Administration][3] and NASA have or will run remote networking stress tests to understand their remote networking capacity and what the impact will be if they add thousands of new teleworkers. About [2 million people][4] work for the government in the U.S.

To help stave off congestion in cellular data networks, the [Federal Communications Commission][5] has granted T-Mobile temporary access to spectrum in the 600MHz band that's owned by other licensees. T-Mobile said it requested the spectrum "to make it easier for Americans to participate in telehealth, distance learning, and telework, and simply remain connected while practicing recommended 'social distancing'."

Last-mile internet access may become congested in areas that rely on wireless connectivity, some industry players warn.

[][6]

"Bottlenecks are likely going to exist in hard-to-reach areas, such as rural locations, where internet access relies on microwave or wireless infrastructure," said Alex Cruz Farmer, product manager for network intelligence company ThousandEyes, which makes software that analyzes the performance of local and wide area networks. "The challenge here is that the available bandwidth is usually much less via these solutions, as well as more latent."

"We have seen a very small number of platform-related issues or outages due to increased loads, although those have since been resolved," added ThousandEyes' Farmer.

For its part, AT&amp;T said it has noticed shifts in usage on its wireless network, but capacity has not been taxed.

"In cities where the coronavirus has had the biggest impact, we are seeing fewer spikes in wireless usage around particular cell towers or particular times of day, because more people are working from home rather than commuting to work, and fewer people are gathering in large crowds at specific locations," [AT&amp;T said in a statement][7]. "We continuously monitor bandwidth usage with tools that analyze and correlate network statistics, which reveal network trends and provide us with performance and capacity reports that help us manage our network."

Verizon says it hasn't seen a measurable increase in data usage since the coronavirus outbreak, despite a jump in the number of customers working from home. "Verizon’s networks are designed and built to meet future demand and are ready should demand increase or usage patterns change significantly. While this is an unprecedented situation, we know things are changing, and we are ready to adjust network resources as we better understand any shifts in demand," the company said in a statement.

Verizon has been monitoring network usage in the most affected areas and pledged to work with and prioritize network resources to meet the needs of hospitals, first responders and government agencies. It also announced plans to increase capital spending from between $17 billion and $18 billion to between $17.5 billion to $18.5 billion in 2020 in an effort to "accelerate Verizon's transition to 5G and help support the economy during this period of disruption."

### Enterprise VPN security concerns

For enterprises, supporting the myriad network and security technologies that sit between data centers and remote users is no small task, particularly since remote-access VPNs, for example, typically rely on residential internet-access services over which businesses have little control. But IT pros should try to verify that these connections meet enterprise standards, according Tom Nolle, president of CIMI Corp. (Read more of Nolle's thoughts on working at home [here][8].)

"The home broadband elements, like the ISP and DNS and Wi-Fi, should really be part of a business certification of suitable networking for home work," Nolle said. "I find that DNS services like Google's are less prone to being overloaded than ISPs' services, which suggests users should be required to adopt one of them. OpenDNS is also good."

The security of home Wi-Fi networks is also an issue, Nolle said. IT pros should require workers to submit screenshots of their Wi-Fi configurations in order to validate the encryption being used. "Home workers often bypass a lot of the security built into enterprise locations," he said. 

Education of new home workers is also important, said Andrew Wertkin, chief strategy officer with DNS software company BlueCat. "There will be remote workers who have not substantially worked from home before, and may or may not understand the implications to security," Wertkin said. "This is especially problematic if the users are accessing the network via personal home devices versus corporate devices."

An unexpected increase in remote corporate users using a [VPN][9] can also introduce cost challenges.

"VPN appliances are expensive, and moving to virtualized environments in the cloud often can turn out to be expensive when you take into account compute cost and per-seat cost," Farmer said. A significant increase in per-seat VPN licenses have likely not been budgeted for.

On the capacity side, systems such as DHCP, which doles out IP addresses, could come under stress with increased remote-access use. "It doesn't matter if there are enough licenses for VPN if the devices connecting cannot obtain network addresses," Wertkin said. "Companies must test for and understand choke points and start implementing strategies to mitigate these risks."

Along those lines, enterprises "may have to validate the number of SSL sockets their data centers can expose for use, or they could end up running out," Nolle said.

Paul Collinge, a senior program manager in the Microsoft Office 365 product team, raised similar concerns. Network elements such as VPN concentrators, central network egress equipment such as proxies, DLP, central internet bandwidth, backhaul MPLS circuits, and NAT capability are put under enormous strain when all employees are using them, Collinge wrote in a [blog][10] about optimizing Office 365 traffic for remote staff. The result is poor performance and productivity coupled with a poor user experience for those working from home.

ThousandEyes' Farmer said enterprises might have to increase the number of VPN concentrators on their networks. "This way, remote-user connectivity is distributed across multiple VPN endpoints and not concentrated," he said. If that's not an option, businesses may have to open firewall ports to allow access to essential applications, which would enable them to scale up, but could also weaken security temporarily.

### Can VPN split tunneling help?

Industry players are divided on the use of split tunnerling to minimize coronavirus capacity concerns.

VPNs can be set up to allow split tunneling, where only traffic intended for the corporate network tunnels through the VPN, BlueCat's Wertkin said. The rest of the traffic goes directly to the internet at large, meaning it isn't subject to the security controls imposed by the tunnel and by tools within the corporate network, which is a security concern. This could lead to remote users' computers being compromised by internet-borne attacks, which could in turn put corporate data and networks at risk.

Despite this, Microsoftlast week recommended split tunneling as a way for IT admins to address its Office 365 service becoming congested due to an influx of remote users. In [the advisory][10], Microsoft offers a list of URLs and IP addresses for its points of access and describes how IT can use that information to route traffic directly to Office 365.

The VPN client should be configured so that traffic to identified URLs/IPs/ports is routed in this way, according to Collinge. "This allows us to deliver extremely high performance levels to users wherever they are in the world.”

ThousandEyes' Farmer said increased use of remote access VPNs might call for a review of network security in general. "[For] enterprises that are still using a legacy network security architecture, it may be time to consider cloud-based security options, which could improve performance for remote workers and diminish the overall use of the enterprise’s WAN circuits."

Other related developments:

  * The [FCC][11] called on broadband providers to relax their data cap policies in appropriate circumstances, on telephone carriers to waive long-distance and overage fees in appropriate circumstances, on those that serve schools and libraries to work with them on remote learning opportunities, and on all network operators to prioritize the connectivity needs of hospitals and healthcare providers. AT&amp;T and others have responded.
  * [U.S. Senator Mark R. Warner (D-VA)][12] and 17 other senators sent a letter to the CEOs of eight major ISPs calling on the companies to take steps to accommodate the unprecedented reliance on telepresence services, including telework, online education, telehealth, and remote support services. In the letter, sent to the CEOs of AT&amp;T, CenturyLink, Charter Communications, Comcast, Cox Communications, Sprint, T-Mobile, and Verizon, the senators call on companies to suspend restrictions and fees that could limit telepresence options. Related to the nation's broadband gaps, they also call on the companies to provide free or at-cost broadband options for students affected by the virus who otherwise lack broadband access for online learning during the outbreak.
  * Vendors including [Cisco][13], Microsoft, [Google][14], [LogMeIn][15], [Spectrum][16] and others are offering free tools to help customers manage security and communications during the outbreak.



Join the Network World communities on [Facebook][17] and [LinkedIn][18] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3532440/coronavirus-challenges-remote-networking.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://atlasvpn.com/blog/vpn-usage-in-italy-rockets-by-112-and-53-in-the-us-amidst-coronavirus-outbreak/
[2]: https://www.chicagotribune.com/coronavirus/ct-coronavirus-work-from-home-20200312-bscm4ifjvne7dlugjn34sksrz4-story.html
[3]: https://federalnewsnetwork.com/workforce/2020/03/agencies-ramp-up-coronavirus-preparations-as-noaa-plans-large-scale-telework-test/
[4]: https://fas.org/sgp/crs/misc/R43590.pdf
[5]: https://www.fcc.gov/coronavirus
[6]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[7]: https://about.att.com/pages/COVID-19.html
[8]: https://blog.cimicorp.com/?p=4055
[9]: https://www.networkworld.com/article/3268744/understanding-virtual-private-networks-and-why-vpns-are-important-to-sd-wan.html
[10]: https://techcommunity.microsoft.com/t5/office-365-blog/how-to-quickly-optimize-office-365-traffic-for-remote-staff-amp/ba-p/1214571
[11]: https://www.fcc.gov/document/commissioner-starks-statement-fccs-response-covid-19
[12]: https://www.warner.senate.gov/public/_cache/files/2/3/239084db-83bd-4641-bf59-371cb829937a/A99E41ACD1BA92FB37BDE54E14A97BFA.letter-to-isps-on-covid-19-final-v2.-signed.pdf
[13]: https://blogs.cisco.com/collaboration/cisco-announces-work-from-home-webex-contact-center-quick-deployment
[14]: https://cloud.google.com/blog/products/g-suite/helping-businesses-and-schools-stay-connected-in-response-to-coronavirus
[15]: https://www.gotomeeting.com/work-remote?clickid=RFlSQF3DBxyOTSr0MKVSfWfHUknShrScK0%3AhTY0&irgwc=1&cid=g2m_noam_ir_aff_cm_pl_ct
[16]: https://www.multichannel.com/news/charter-opening-wi-fi-hotspots-in-face-of-covid-19
[17]: https://www.facebook.com/NetworkWorld/
[18]: https://www.linkedin.com/company/network-world
