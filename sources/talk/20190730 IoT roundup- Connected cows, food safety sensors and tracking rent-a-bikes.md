[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IoT roundup: Connected cows, food safety sensors and tracking rent-a-bikes)
[#]: via: (https://www.networkworld.com/article/3412141/iot-roundup-connected-cows-food-safety-sensors-and-tracking-rent-a-bikes.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

IoT roundup: Connected cows, food safety sensors and tracking rent-a-bikes
======
Farmers use LoRaWAN wireless with internet of things devices that monitor the health and location of beef cattle; restaurant chains use it to network IoT sensors that signal temperature shifts in commercial refrigerators.
![Getty Images][1]

While the public image of agriculture remains a bit antiquated, the industry is actually an increasingly sophisticated one, and farmers have been particularly enthusiastic in their embrace of the internet of things ([IoT][2]). Everything from GPS-guided precision for planting, watering and harvesting to remote soil monitoring and in-depth yield analysis is available to the modern farmer.

What’s more, the technology used in agriculture continues to evolve at speed; witness the recent partnership between Quantified Ag, a University of Nebraska-backed program that, among other things, can track livestock health via a system of IoT ear tags, and Cradlepoint, a vendor that makes the NetCloud Manager product.

**[ Now see: [How edge networking and IoT will reshape data centers][3] | Get regularly scheduled insights: [Sign up for Network World newsletters][4] ]**

Quantified Ag’s tags use [LoRaWAN][5] tech to transmit behavioral and biometric data to custom gateways installed at a farm, where the data is aggregated. Yet those gateways sometimes suffered from problems, particularly where unreliable wired connectivity and the complexities of working with an array of different rural ISPs were concerned. Enter Cradlepoint, which partnered up with an unnamed national cellular data provider to dramatically simplify the synchronization of data across a given implementation, as well as make it easier to deploy and provision new nodes.

Simplicity is always a desirable quality in an IoT deployment, and single-pane-of-glass systems, provisioned by a single network, are a strong play for numerous IoT use cases.

### LoRaWAN keeping food safe

Even after the livestock is no longer, well, alive, IoT technology plays a role. Restaurants such as Five Guys and Shake Shack are integrating low-power WAN technology to connect temperature sensors into a network. Sort of an Internet of Burgers, if you will.

According to an announcement earlier this month from Semtech, who makes the LoRaWAN devices in question, the restaurant chains join up-and-comers like Hattie B’s among those using IoT tech to improve food safety. The latter restaurant – a Nashville-based small chain noted for its spicy fried chicken – recently realized the benefits of such a system after a power outage. Instant notification that the refrigeration had died enabled the management to rescue tens of thousands of dollars’ worth of food inventory.

Frankly, anything that saves fried chicken and burgers from wastage – and potentially, keeps their prices fractionally lower – is a good thing in our book, and Semtech argues (as it might be expected to) that the lower-frequency LoRa-based technology is a better choice for this application, given its ability to pass through obstacles like refrigerator and freezer doors with less attenuation than, for example, Bluetooth.

### IoT tracking rental bikes**

**

Readers who live in urban areas will probably have noticed the rent-a-bike phenomenon spreading quickly of late. IoT connectivity provider Sigfox has, also, getting in on the action via a partnership with France-based INDIGO weel, a self-service bicycle fleet that was announced earlier this month.

In this application, Sigfox’s proprietary wide area network technology is used to precisely track INDIGO’s bikes, deterring theft and damage. Sigfox also claims that the integration of its technology into the bike fleet will reduce costs, since reusable sensors can be easily transferred from one bike to another, and help users find the vehicle they need more quickly.

Sigfox likes to talk about itself as an “IoT service provider,” and its large coverage footprint – the company claims to be operating in 60 countries – is a good fit for the kind of application that covers a lot of ground and might not require a great deal of bandwidth.

### Vulnerability warning for IoT medical devices

Per usual, several minor but alarming revelations about insecure, exploitable IoT devices have come to light this month. One advisory, [revealed by healthcare cybersecurity firm CyberMDX][6], said attackers could compromise GE Aestiva and Aespire anesthesia and respiration devices – changing the mix of gases that the patient breathes, altering the date and time on the machine or silencing alarms. (GE responded by pointing out that the compromise requires access to both the hospital’s network and an insufficiently secure terminal server, and urged users not to use such servers. Obviously, if devices don’t need to be on the network in the first place, that’s an even better solution.)

Elsewhere, [an anonymous researcher at VPN Mentor][7] posted early this month that China-based smart home product maker Orvibo had (presumably by accident) opened up an enormous database to public view. The database contained 2 billion log entries, which covered email addresses, usernames, passwords and even geographic locations, based on its footprint of smart home devices installed in residences and hotels. The company has since cut off access to the database, but, still – not a great look for them.

Join the Network World communities on [Facebook][8] and [LinkedIn][9] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3412141/iot-roundup-connected-cows-food-safety-sensors-and-tracking-rent-a-bikes.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/08/nw_iot-news_internet-of-things_smart-city_smart-home7-100768495-large.jpg
[2]: https://www.networkworld.com/article/3207535/what-is-iot-how-the-internet-of-things-works.html
[3]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://www.networkworld.com/article/3211390/lorawan-key-to-building-full-stack-production-iot-networks.html
[6]: https://www.cybermdx.com/news/vulnerability-discovered-ge-anesthesia-respiratory-devices
[7]: https://www.vpnmentor.com/blog/report-orvibo-leak/
[8]: https://www.facebook.com/NetworkWorld/
[9]: https://www.linkedin.com/company/network-world
