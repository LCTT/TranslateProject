[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (ROLLING UPDATE: The impact of COVID-19 on public networks and security)
[#]: via: (https://www.networkworld.com/article/3534037/rolling-update-the-impact-of-covid-19-on-public-networks-and-security.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

ROLLING UPDATE: The impact of COVID-19 on public networks and security
======
Network World updates the latest coronavirus-related networking news
Ig0rZh / Getty Images

_As the coronavirus spreads, public and private companies as well as government entities are requiring employees to work from home, putting unforeseen strain on all manner of networking technologies and causing bandwidth and security concerns.  What follows is a round-up of news and traffic updates that Network World will update as needed to help keep up with the ever-changing situation.  Check back frequently!_

**UPDATE 3.27**

Broadband watchers at [BroadbandNow][1] say users in most of the cities it analyzed are experiencing normal network conditions, suggesting that ISP’s (and their networks) are holding up to the shifting demand. In a March 25 [post][2] the firm wrote: “Encouragingly, many of the areas hit hardest by the spread of the coronavirus are holding up to increased network demand. Cities like Los Angeles, Chicago, Brooklyn, and San Francisco have all experienced little or no disruption. New York City,  now the epicenter of the virus in the U.S., has seen a 24% dip out of its previous ten-week range. However, with a new median speed of nearly 52 Mbps, home connections still appear to be holding up overall.”

**[ Also see [What to consider when deploying a next generation firewall][3]. | Get regularly scheduled insights by [signing up for Network World newsletters][4]. ]**

Other BroadbandNow findings included:

  * Eighty eight (44%) of the 200 cities it analyzed experienced some degree of network degradation over the past week compared to the 10 weeks prior. However, only 27 (13.5%) cities experienced dips of 20% below range or greater.
  * Seattle download speeds have continued to hold up over the past week, while New York City’s speeds have fallen out of range by 24%. Both cities are currently heavily affected by the coronavirus pandemic.
  * Three cities – Austin, Texas, Winston Salem, N.C., and Oxnard, Calif. – have experienced significant degradations, falling out of their 10-week range by more than 40%.



Cisco’s Talos threat-intelligence arm [wrote][5] on March 26 about the COVID security threat noting what it called three broad categories of attacks leveraging COVID with known advanced persistent threat participation in: [Malware and phishing campaigns][6] using COVID-themed lures; attacks against organizations that carry out research and other work related to COVID; and fraud and disinformation. From an enterprise security perspective, Talos recommended:

  * Remote access: Do not expose Remote Desktop Protocol (RDP) to the internet. Use secure VPN connections with multi-factor authentication schemes. Network access control packages can be used to ensure that systems attempting to remotely connect to the corporate environment meet a minimum set of security standards such as anti-malware protection, patch levels, etc,. prior to granting them access to corporate resources. Continually identify and remediate access-policy violations.
  * Identity Management: Protect critical and public-facing applications with multi-factor authentication and supporting corporate policies. Verify that remote-account and access-termination capabilities work as intended in a remote environment.
  * Endpoint Control: Because many people may be working from home networks, endpoint visibility, protection, and mitigation is now more important than ever. Consider whether remediation and reimaging capabilities will work as intended in a remote environment. Encrypt devices where possible, and add this check to your NAC solution as a gate for connectivity. Another simple method of protecting endpoints is via DNS, such as with [Cisco’s] Umbrella, by blocking the resolution of malicious domains before the host has a chance to make a connection.



In an [FAQ][7] about the impact of COVID-19 on fulfilling customer hardware orders, VMware stated: “Some VMware SD-WAN hardware appliances are on backorder as a result of supply chain issues. As a result, we are extending the option to update existing orders with different appliances where inventory is more readily available. Customers may contact a special email hotline with questions related to backordered appliances. Please send an email to [sd-wan-hotline@vmware.com][8] with your questions and include the order number, urgent quantities, and contact information. We will do our best to respond within 48 hours.”

Cisco said it has been analyzing traffic statistics with major carriers across Asia, Europe, and the Americas, and its data shows that typically, the most congested point in the network occurs at inter-provider peering points, Jonathan Davidson, senior vice president and general manager of Cisco's Mass-Scale Infrastructure Group wrote in a [blog][9] on March 26. “However, the traffic exchanged at these bottlenecks is only a part of the total internet traffic, meaning reports on traffic may be higher overall as private peering and local destinations also contribute to more traffic growth.”

[][10]

“Our analysis at these locations shows an increase in traffic of 10% to 33% over normal levels. In every country, traffic spiked with the decision to shut down non-essential businesses and keep people at home. Since then, traffic has remained stable or has experienced a slight uptick over the days that followed,” Davidson stated.

He said that traffic during peak hours from 6 p.m. and 10 p.m. has increased slightly, but is not the primary driver for the overall inrease. Busy hours have extended to 9 a.m. 10 p.m., although the new busy-hour (9 a.m. to 6 p.m.) traffic is still below the traditional peak hours. "Service providers are certainly paying attention to these changes, but they are not yet a dire concern, as most networks are designed for growth. Current capacities are utilized more over the course of the entire day,” he wrote.

Spanish multinational telecommunications company [Telefonica][11]’ said IP networks are experiencing traffic increases of close to 40% while mobile voice use is up about 50% and data is up 25%. In general, traffic through IP networks has experienced increases of nearly 40% while mobile use has increased by about 50% for voice and 25% for data. Likewise, traffic from instant-messaging tools such as Whatsapp has increased fivefold in recent days.

**UPDATE: 3.26**

  * Week over week (ending March 23) [Ookla][12] says it has started to see a degradation of mobile and fixed-broadband performance worldwide. More detail on specific locations is available below. Comparing the week of March 16 to the week of March 9, mean download speed over mobile and fixed broadband decreased in Canada and the U.S. while both remained relatively flat in Mexico.
  * What is the impact of the coronavirus on corporate network planning? Depends on how long the work-from-home mandate goes on really. Tom Nolle, president of CIMI Corp. [takes an interesting look at the situation][13] saying the shutdown “could eventually produce a major uptick for SD-WAN services, particularly in [managed service provider]    Businesses would be much more likely to embark on an SD-WAN VPN adventure that didn’t involve purchase/licensing, favoring a service approach in general, and in particular one with a fairly short contract period.”
  * Statistics from VPN provider [NordVPN][14] show the growth of VPN usage across the globe.  For example, the company said the US has experienced a 65.93% growth in the use of business VPNs since March 11. It reported that mass remote working has contributed towards a rise in desktop (94.09%) and mobile app (0.39%) usage among Americans. Globally, NordVPN teams has seen a 165% spike in the use of business VPNs and business VPN usage in Netherlands (240.49%), Canada (206.29%) and Austria (207.86%) has skyrocketed beyond 200%. Italy has had the most modest growth in business VPN usage at just 10.57%.



**UPDATE: 3. 25**:

  * According to [Atlas VPN][15] user data, VPN usage in the US increased by 124% during the last two weeks. VPN usage in the country increased by 71% between March 16 and 22 alone. Atlas said it measured how much traffic traveled through its servers during that period compared to March 9 to 15. The data came from the company's 53,000 weekly users.
  * Verizon [reports][16] that voice usage, long declining in the age of texting, chat and social media, is up 25% in the last week. The network report shows the primary driver is accessing conference calls. In addition, people are talking longer on mobile devices with wireless voice usage notching a 10% increase and calls lasting 15% longer. 
  * AT&amp;T also [reported][17] increased calling, especially Wi-Fi calling, up 88% on March 22 versus a normal Sunday. It says that consumer home voice calls were up 74% more than an average Sunday; traffic from Netflix dipped after all-time highs on Friday and Saturday; and data traffic due to heavy video streaming between its network and peered networks tied record highs. AT&amp;T said it has deployed portable cell nodes to bolster coverage supporting FirstNet customers in Indiana, Connecticut, New Jersey, California and New York.
  * Microsoft this week advised users of Office 365 it was throttling back some services:
    * **OneNote: ** OneNote in Teams will be read-only for commercial tenants, excluding EDU. Users can go to OneNote for the web for editing. Download size and sync frequency of file attachments has been changed. You can find details on these and other OneNote related updates as <http://aka.ms/notesupdates>.
    * **SharePoint:** We are rescheduling specific backend operations to regional evening and weekend business hours. Impacted capabilities include migration, DLP and delays in file management after uploading a new file, video or image. Reduced video resolution for playback videos.
    * **Stream:** People timeline has been disabled for newly uploaded videos. Pre-existing videos will not be impacted. Meeting recording video resolution adjusted to 720p.



**RELATED COVID-19 NEWS:**

  * Security vendor [Check Point’s Threat Intelligence][18] says that Since January 2020, there have been over 4,000 coronavirus-related domains registered globally. Out of these websites, 3% were found to be malicious and an additional 5% are suspicious. Coronavirus- related domains are 50% more likely to be malicious than other domains registered at the same period, and also higher than recent seasonal themes such as Valentine’s day.
  * [Orange][19] an IT and communications **services** company aid that has increased its network capacity and upgraded its service platforms. These measures allow it to support the ongoing exponential increase in needs and uses. The number of users connecting to their company's network remotely has already increased by 700% among its customers. It has also doubled the capacity for simultaneous connections on its platforms. The use of remote collaboration solutions such as video conferencing has also risen massively with usage increasing by between 20% to 100%.
  * Verizon said it has seen a 34% increase in VPN traffic from March 10 to 17. It has also seen a 75% increase in gaming traffic and web traffic increased by just under 20% in that time period according to Verizon.
  * One week after the CDC declaration of the virus as a pandemic, data analytics and broadband vendor OpenVault wrote on March 19 that:
    * Subscribers’ average usage during the 9 am-to-5 pm daypart has risen to 6.3 GB, 41.4% higher than the January figure of 4.4 GB. 
    * During the same period, peak hours (6 pm–11 pm) usage has risen 17.2% from 5.0 GB per subscriber in January to 5.87 GB in March. 
    * Overall daily usage has grown from 12.19 GB to 15.46 GB, an increase of 26.8%.
    * Based on the current rate of growth, OpenVault projected that consumption for March will reach nearly 400 GB per subscriber, an increase of almost 11% over the previous monthly record of 361 GB, established in January of this year. In addition, OpenVault projects a new coronavirus-influenced run rate of 460 GB per subscriber per month going forward.



Join the Network World communities on [Facebook][20] and [LinkedIn][21] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3534037/rolling-update-the-impact-of-covid-19-on-public-networks-and-security.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://broadbandnow.com/
[2]: https://broadbandnow.com/report/internet-speed-analysis-march-15th-21st/
[3]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://blog.talosintelligence.com/2020/03/covid-19-pandemic-threats.html
[6]: https://blog.talosintelligence.com/2020/02/coronavirus-themed-malware.html
[7]: https://www.vmware.com/company/news/updates/vmware-response-covid-19.html?mid=31381&eid=CVMW2000048242496
[8]: mailto:sd-wan-hotline@vmware.com
[9]: https://blogs.cisco.com/news/global-traffic-spikes-no-panic-at-the-cisco
[10]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[11]: https://www.telefonica.com/en/web/press-office/-/telefonica-announces-measures-related-to-covid-19
[12]: https://downdetector.com/?utm_campaign=Ookla%20Insights%20Blog%20Subscription&utm_source=hs_email&utm_medium=email&utm_content=85202785&_hsenc=p2ANqtz--Nj93d_eQyJpsqxrPJyNPtTiMBWBQU984psLyalw51K61e4d1WODareMF5NWFriHY2Uzw3WF7rF-2vSfH5cR53Jg3K5Q&_hsmi=85202785
[13]: https://blog.cimicorp.com/?p=4068
[14]: https://nordvpnteams.com/
[15]: https://atlasvpn.com/blog/lockdowns-and-panic-leads-to-a-124-surge-in-vpn-usage-in-the-us/
[16]: https://www.verizon.com/about/news/update-verizon-serve-customers-covid-19
[17]: https://about.att.com/pages/COVID-19.html
[18]: https://blog.checkpoint.com/2020/03/05/update-coronavirus-themed-domains-50-more-likely-to-be-malicious-than-other-domains/
[19]: https://www.orange.com/en/Press-Room/press-releases/press-releases-2020/Orange-is-mobilised-to-ensure-continuity-of-service-for-all-customers-in-France-and-around-the-world
[20]: https://www.facebook.com/NetworkWorld/
[21]: https://www.linkedin.com/company/network-world
