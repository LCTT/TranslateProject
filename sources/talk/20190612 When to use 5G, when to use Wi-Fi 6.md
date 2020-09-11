[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (When to use 5G, when to use Wi-Fi 6)
[#]: via: (https://www.networkworld.com/article/3402316/when-to-use-5g-when-to-use-wi-fi-6.html)
[#]: author: (Lee Doyle )

When to use 5G, when to use Wi-Fi 6
======
5G is a cellular service, and Wi-Fi 6 is a short-range wireless access technology, and each has attributes that make them useful in specific enterprise roles.
![Thinkstock][1]

We have seen hype about whether [5G][2] cellular or [Wi-Fi 6][3] will win in the enterprise, but the reality is that the two are largely complementary with an overlap for some use cases, which will make for an interesting competitive environment through the early 2020s.

### The potential for 5G in enterprises

The promise of 5G for enterprise users is higher speed connectivity with lower latency. Cellular technology uses licensed spectrum which largely eliminates potential interference that may occur with unlicensed Wi-Fi spectrum. Like current 4G LTE technologies, 5G can be supplied by cellular wireless carriers or built as a private network .

The architecture for 5G requires many more radio access points and can suffer from poor or no connectivity indoors. So, the typical organization needs to assess its [current 4G and potential 5G service][4] for its PCs, routers and other devices. Deploying indoor microcells, repeaters and distributed antennas can help solve indoor 5G service issues. As with 4G, the best enterprise 5G use case is for truly mobile connectivity such as public safety vehicles and in non-carpeted environments like mining, oil and gas extraction, transportation, farming and some manufacturing.

In addition to broad mobility, 5G offers advantages in terms of authentication while roaming and speed of deployment as might be needed to provide WAN connectivity to a pop-up office or retail site. 5G will have the capacity to offload traffic in cases of data congestion such as live video. As 5G standards mature, the technology will improve its options for low-power IoT connectivity.

5G will gradually roll out over the next four to five years starting in large cities and specific geographies; 4G technology will remain prevalent for a number of years. Enterprise users will need new devices, dongles and routers to connect to 5G services. For example, Apple iPhones are not expected to support 5G until 2020, and IoT devices will need specific cellular compatibility to connect to 5G.

Doyle Research expects the 1Gbps and higher bandwidth promised by 5G will have a significant impact on the SD-WAN market. 4G LTE already enables cellular services to become a primary WAN link. 5G is likely to be cost competitive or cheaper than many wired WAN options such as MPLS or the internet. 5G gives enterprise WAN managers more options to provide increased bandwidth to their branch sites and remote users – potentially displacing MPLS over time.

### The potential for Wi-Fi 6 in enterprises

Wi-Fi is nearly ubiquitous for connecting mobile laptops, tablets and other devices to enterprise networks. Wi-Fi 6 (802.11ax) is the latest version of Wi-Fi and brings the promise of increased speed, low latency, improved aggregate bandwidth and advanced traffic management. While it has some similarities with 5G (both are based on orthogonal frequency division multiple access), Wi-Fi 6 is less prone to interference, requires less power (which prolongs device battery life) and has improved spectral efficiency.

**[[Take this mobile device management course from PluralSight and learn how to secure devices in your company without degrading the user experience.][5] ]**

As is typical for Wi-Fi, early [vendor-specific versions of Wi-Fi 6][6] are currently available from many manufacturers. The Wi-Fi alliance plans for certification of Wi-Fi 6-standard gear in 2020. Most enterprises will upgrade to Wi-Fi 6 along standard access-point life cycles of three years or so unless they have specific performance/latency requirements that prompt an upgrade sooner.

Wi-Fi access points continue to be subject to interference, and it can be challenging to design and site APs to provide appropriate coverage. Enterprise LAN managers will continue to need vendor-supplied tools and partners to configure optimal Wi-Fi coverage for their organizations. Wi-Fi 6 solutions must be integrated with wired campus infrastructure. Wi-Fi suppliers need to do a better job at providing unified network management across wireless and wired solutions in the enterprise.

### Need for wired backhaul

For both technologies, wireless is combined with wired-network infrastructure to deliver high-speed communications end-to-end. In the enterprise, Wi-Fi is typically paired with wired Ethernet switches for campus and larger branches. Some devices are connected via cable to the switch, others via Wi-Fi – and laptops may use both methods. Wi-Fi access points are connected via Ethernet inside the enterprise and to the WAN or internet by fiber connections.

The architecture for 5G makes extensive use of fiber optics to connect the distributed radio access network back to the core of the 5G network. Fiber is typically required to provide the high bandwidth needed to connect 5G endpoints to SaaS-based applications, and to provide live video and high-speed internet access. Private 5G networks will also have to meet high-speed wired-connectivity requirements.

### Handoff issues

Enterprise IT managers need to be concerned with handoff challenges as phones switch between 5G and Wi-Fi 6. These issues can affect performance and user satisfaction. Several groups are working towards standards to promote better interoperability between Wi-Fi 6 and 5G. As the architectures of Wi-Fi 6 align with 5G, the experience of moving between cellular and Wi-Fi networks should become more seamless.

### 5G vs Wi-Fi 6 depends on locations, applications and devices

Wi-Fi 6 and 5G are competitive with each other for specific situations in the enterprise environment that depend on location, application and device type. IT managers should carefully evaluate their current and emerging connectivity requirements. Wi-Fi will continue to dominate indoor environments and cellular wins for broad outdoor coverage.

Some of the overlap cases occur in stadiums, hospitality and other large event spaces with many users competing for bandwidth. Government applications, including aspect of smart cities, can be applicable to both Wi-Fi and cellular. Health care facilities have many distributed medical devices and users that need connectivity. Large distributed manufacturing environments share similar characteristics. The emerging IoT deployments are perhaps the most interesting “competitive” environment with many overlapping use cases.

### Recommendations for IT Leaders

While the wireless technologies enabling them are converging, Wi-Fi 6 and 5G are fundamentally distinct networks – both of which have their role in enterprise connectivity. Enterprise IT leaders should focus on how Wi-Fi and cellular can complement each other, with Wi-Fi continuing as the in-building technology to connect PCs and laptops, offload phone and tablet data, and for some IoT connectivity.

4G LTE moving to 5G will remain the truly mobile technology for phone and tablet connectivity, an option (via dongle) for PC connections, and increasingly popular for connecting some IoT devices. 5G WAN links will increasingly become standard as a backup for improved SD-WAN reliability and as primary links for remote offices.

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3402316/when-to-use-5g-when-to-use-wi-fi-6.html

作者：[Lee Doyle][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: 
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2017/07/wi-fi_wireless_communication_network_abstract_thinkstock_610127984_1200x800-100730107-large.jpg
[2]: https://www.networkworld.com/article/3203489/what-is-5g-how-is-it-better-than-4g.html
[3]: https://www.networkworld.com/article/3215907/why-80211ax-is-the-next-big-thing-in-wi-fi.html
[4]: https://www.networkworld.com/article/3330603/5g-versus-4g-how-speed-latency-and-application-support-differ.html
[5]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Fmobile-device-management-big-picture
[6]: https://www.networkworld.com/article/3309439/80211ax-preview-access-points-and-routers-that-support-the-wi-fi-6-protocol-on-tap.html
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
