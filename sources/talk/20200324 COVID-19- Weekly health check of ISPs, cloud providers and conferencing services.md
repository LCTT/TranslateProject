[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (COVID-19: Weekly health check of ISPs, cloud providers and conferencing services)
[#]: via: (https://www.networkworld.com/article/3534130/covid-19-weekly-health-check-of-isps-cloud-providers-and-conferencing-services.html)
[#]: author: (Tim Greene https://www.networkworld.com/author/Tim-Greene/)

COVID-19: Weekly health check of ISPs, cloud providers and conferencing services
======
ThousandEyes, which tracks internet and cloud traffic, is providing Network World with weekly updates on the performance of three categories of service provider: ISP, cloud provider, UCaaS
[ThousandEyes][1]

_As COVID-19 continues to spread, forcing employees to work from home, the services of ISPs, cloud providers and conferencing services a.k.a. unified communications as a service (UCaaS) providers are experiencing increased traffic._

_Thousand Eyes is monitoring how these increases affect outages and the performance these providers undergo. It will provide Network World a roundup of interesting events of  the week in the delivery of these services, and Network World will provide a summary here. Stop back next week for another update._

With the increased use of remote-access VPNs, major carriers are reporting dramatic increases in their network traffic – with Verizon reporting a 20% week-over-week increase, and Vodafone reporting an increase of 50%.

[Read about IPv6 and cloud-access security brokers][2]

While there has been no corresponding spike in outages in service provider networks, over the past six weeks there has been a steady increase in outages across multiple provider types both worldwide and in the U.S., all according to ThousandEyes, which keeps track of internet and cloud traffic.

### IDG Special Report:

Navigating the Pandemic

  * [Business continuity: Coronavirus crisis puts CIOs’ plans to the test][3]
  * [Coronavirus challenges remote networking][4]
  * [A security guide for pandemic planning: 7 key steps][5]
  * [10 tips to set up your home office for videoconferencing][6]
  * [How to survive and thrive while working from home][7]
  * [WTH? OSS knows how to WFH IRL][8]



This includes “a concerning upward trajectory” since the beginning of March of ISP outages worldwide that coincides with the spread of COVID-19, [according to a ThousandEyes blog][9] by Angelique Medina, the company’s director of product marketing. ISP outages worldwide hovered around 150 per week between Feb. 10 and March 19, but then increased to between just under 200 and about 225 during the following three weeks.

In the U.S. those numbers were a little over 50 in the first time range and reaching about 100 during the first week of March. “That early March level has been mostly sustained over the last couple of weeks,” Medina writes.

Cogent Communications was one ISP with nearly identical large scale outages on March 11 and March 18, with “disruptions for the fairly lengthy period (by Internet standards) of 30 minutes,” she wrote.

[][10]

Hurricane Electric suffered an outage March 20 that was less extensive and shorter than Cogent’s but included smaller disruptions that altogether affected hundreds of sites and services, she wrote.

Public-cloud provider networks have withstood the effects of COVID-19 well, with slight increases in the number of outages in the U.S., but otherwise relatively level around the world. The possible reason: “Major public cloud providers, such as AWS, Microsoft Azure, and Google Cloud, have built massive global networks that are incredibly well-equipped to handle traffic surges,” Medina wrote. And when these networks do have major outages it’s due to routing or infrastructure state changes, not traffic congestion.

Some providers of collaboration applications – the likes of Zoom, Webex, MSFT Teams, RingCentral – also experienced performance problems between March 9 and March 20. ThousandEyes doesn’t name them, but does list performance numbers for what it describes “the top three” UCaaS providers. One actually showed improvements in availability, latency, packet loss and jitter. The other two “showed minimal (in the grand scheme of things) degradations on all fronts — not surprising given the unprecedented strain they’ve been under,” according to the blog.

Each provider showed spikes in traffic loss over the time period that ranged from less than 1% to more than 4% in one case. In the case of one provider, “outages within its own network spiked last week, meaning that the network issues impacting users were taking place on infrastructure managed by the provider versus an external ISP.”

“Outage incidents within large UCaaS provider networks are fairly infrequent; however, the recent massive surge in usage is clearly stressing current design limits. Capacity is reportedly being added across the board to meet new service demands,” according to the blog.

Meanwhile, ThousandEyes has introduced a new feature on its site a [Global Internet Outages Map][1] that is updated every few minutes. It shows recent and ongoing outages

## Google outage unrelated to COVID-19

On March 26 Google suffered a 20 minute outage on the East Coast of the U.S., apparently from a router failure in Atlanta, ThousandEyes said, agreeing with a statement put out by Googe to that effect.

That problem affected other regions of the U.S. as evidenced by Google sites such as google.com intermittently returning server errors."These 500 server errors are consistent with an inability to reach the backend systems necessary to correctly load various services," ThousandEyes said in a statement. "Any traffic traversing the affected region — connecting from Google’s front-end servers to backend services — may have been impacted and seen the resulting server errors."

ThousandEyes posted interactive results of tests it ran about the outage [here][11] and [here][12].

.

Join the Network World communities on [Facebook][13] and [LinkedIn][14] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3534130/covid-19-weekly-health-check-of-isps-cloud-providers-and-conferencing-services.html

作者：[Tim Greene][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Tim-Greene/
[b]: https://github.com/lujun9972
[1]: https://www.thousandeyes.com/outages
[2]: https://www.networkworld.com/article/3391380/does-your-cloud-access-security-broker-support-ipv6-it-should.html
[3]: https://www.cio.com/article/3532899/business-continuity-coronavirus-crisis-puts-cios-plans-to-the-test.html
[4]: https://www.networkworld.com/article/3532440/coronavirus-challenges-remote-networking.html
[5]: https://www.csoonline.com/article/3528878/a-security-guide-for-pandemic-planning-7-key-steps.html
[6]: https://www.computerworld.com/article/3250684/10-tips-to-set-up-your-home-office-for-videoconferencing.html
[7]: https://www.computerworld.com/article/3532283/how-to-survive-and-thrive-while-working-from-home.html
[8]: https://www.infoworld.com/article/3533050/wth-oss-knows-how-to-wfh-irl.html
[9]: https://blog.thousandeyes.com/internet-health-during-covid-19/
[10]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[11]: https://agisi.share.thousandeyes.com/view/endpoint-agent/?roundId=1585237800&metric=loss&scenarioId=eyebrowNetwork&filters=%7B%22filters%22:%7B%22domain%22:%5B%22google.com%22%5D,%22geonameId%22:%5B4148757,4180439,4459467,4460243,4509177,4671240,4744709,4744870,4887398,4890864,4930956,5099836,5110266,5110302,5128581,5145476,5150529,5282804,5786882%5D%7D%7D&page=0,0&grouping=BY_NETWORK,BY_DOMAIN
[12]: https://ythkurgdz.share.thousandeyes.com/view/tests/?roundId=1585236900&metric=availability&scenarioId=httpServer&testId=1283781
[13]: https://www.facebook.com/NetworkWorld/
[14]: https://www.linkedin.com/company/network-world
