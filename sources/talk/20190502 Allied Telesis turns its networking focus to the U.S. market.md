[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Allied Telesis turns its networking focus to the U.S. market)
[#]: via: (https://www.networkworld.com/article/3392800/allied-telesis-turns-its-networking-focus-to-the-us-market.html#tk.rss_all)
[#]: author: (Linda Musthaler https://www.networkworld.com/author/Linda-Musthaler/)

Allied Telesis turns its networking focus to the U.S. market
======
While big names like Cisco and Juniper dominate the enterprise networking landscape, Allied Telesis quietly brings 30 years of experience and innovation to the market.
![Thinkstock][1]

I recently had the opportunity to talk to Mark Wutzke, chief solution architect with [Allied Telesis][2], to learn about the company’s smart networking offerings. Perhaps you, like me, don’t know much about this networking company, though it’s been in business since 1987. That might be because the global company, until recently, has focused its efforts outside the U.S. However, that focus is beginning to change, so I wanted to learn what the company brings to the table that enterprises would be interested in.

First, a little background on the company. Allied Telesis is headquartered in both Japan and the U.S. The company has global R&D centers and manufactures its own products. Among the products are intelligent switches and stackable chassis, industrial switches, wireless solutions, firewalls and routers, optics, NICs and media converters—basically end-to-end solutions from edge to core for LAN, WLAN and WAN. In addition, Allied Telesis writes its own operating system software for its equipment, as well as the network management software that provides many of the smart networking features the company is touting today.

“We aren’t very well known among enterprises in the U.S. market today, but we do work with a lot of federal and government agencies here,” says Wutzke. “To be considered for those tenders, we have to meet certain security and performance standards, which we validate through a number of industry certifications. We’ve also garnered quite a few industry awards and are recognized in the Gartner Magic Quadrant for WAN and wireless LAN products. We believe we have some real innovations that enterprises can benefit from.”

**[ Also read:[What to consider when deploying a next generation firewall][3] | Get regularly scheduled insights: [Sign up for Network World newsletters][4] ]**

He says many of those innovations are based on the company’s AlliedWare Plus operating system, a Linux-based next-generation network OS. It’s the common OS that underlies Allied Telesis’ switching and routing platforms, and it supports some interesting features designed to improve usability and reduce the burden of network management.

### Giving the network autonomy

One of those features is the Autonomous Management Framework, or AMF.

“Conventional network management requires skilled resources, particularly at the network edge, doing repetitive or time-consuming tasks,” says Wutzke. “AMF simplifies the management of a network by automating and assisting with everyday tasks like making configuration changes to multiple units, backing up configurations, adding new units, recovering a failed unit, or rolling out a firmware upgrade.

“For example, AMF automatically backs up the configuration on every single device every 24 hours and stores it away in a network repository. If a device in your network fails, you can pull out a spare unit, install the device and AMF will automatically push the correct configuration onto that device for you. You can have the new device operating like the previous one in that location within minutes,” he says.

AMF also can be used to configure multiple units at the same time. Instead of having to log into each device, the network engineer can tell AMF to talk to all the edge devices at once; for example, to add a VLAN to all the edge switches. Then commands can be issued as if talking to a single device, saving time and reducing the likelihood of mistakes.

### A self-defending network

Another example of Allied Telesis’ innovation is the self-defending network with Secure Enterprise SDN (SES).

“Firewalls protect networks from a lot of threats by blocking traffic, but they can’t protect against threats that originate at a user’s device, which don’t go through the firewall initially,” says Wutzke. “Say that someone plugs in a USB stick with malware on it. The virus is trying to reach out to its C&C server, so the firewall sees that outbound traffic but at this stage it can’t do anything to affect the now-infected device. The bad actor is still connected to the network and can spread his malware to other devices. The SES controller looks at log messages from the firewall, sees the C&C outreach and determines there is a security issue. It figures out which switch port to shut off to disable the offending device. It can either block it completely or move it to a quarantine network.”

The self-defending network can take action within a split second to switch off an offending endpoint.” — Mark Wutzke, Allied Telesis

Wutzke says the SES controller can work with many firewalls to read log messages and look for security issues. This solution doesn’t require any agent software on the user devices because SES controls the switch, not the endpoint itself. SES also can work with large data center or corporate-type traffic by mirroring the traffic going through the core switch. Again, SES detects issues on the mirror traffic and then influences the edge switches to block or quarantine the endpoint that’s causing the problem.

“The self-defending network can take action within a split second to switch off an offending endpoint. The network or security administrator can be alerted to come in later to take control of the situation, but SES neutralizes the problem before damage can be done,” explains Wutzke.

### Active Fiber Monitoring

The idea for Active Fiber Monitoring came to Allied Telesis from a European military organization that was worried about adversaries eavesdropping on their network fiber, Wutzke says.

“If you bend fiber to a certain degree, a small but detectable amount of light escapes. Someone can pick up that light and read what’s happening on the fiber, and the owner of the fiber would never know. This is a concern for anyone who sends sensitive information over long distances in remote locations using fiber,” he says.

The obvious solution would be to encrypt everything traveling on the fiber, Wutzke says, but that’s expensive and it introduces latency. Another approach is to detect fluctuations in the light. Allied Telesis implemented a feature on switches using AlliedWare Plus that monitors the amount of light being received on a port, and depending on the sensitivity you choose, the switch can take actions such as logging the results, shutting the port down, sending an SNMP trap, and so on. By monitoring the fiber links, Allied Telesis can look for any instances of tampering or light fluctuations. The process also is useful for detecting that a fiber-optic module is beginning to fail as the light level begins to drop.

### Other features of AlliedWare Plus

The AlliedWare Plus operating system has numerous other features that increase network intelligence, such as smart diagnostics, log-defined triggers, continuous Power Over Ethernet, and CPU control plane protection. “We have a lot of individual features that are unique to Allied Telesis, and collectively this combination of smart tools reduces management effort and time,” says Wutzke.

### “No compromise” Wi-Fi

Allied Telesis also has a hybrid wireless solution that addresses many of the technical issues of Wi-Fi today, such as configuration complexities, interference of devices on the same frequency, dead spots, and the need for careful planning of placement of the access points. Zeus Kerravala did a great job describing the problems and the exact approach that Allied Telesis takes in solving them with his recent article, [When Wi-Fi is mission-critical, a mixed-channel architecture is the best option][5]. Kerravala covered all the details, so I’ll just summarize by saying that Allied Telesis supports both multi-channel and single-channel wireless architectures to give customers the flexibility of choosing the model that best fits their needs.

### Use case: Naka City, Japan, deploys an Allied Telesis network

Naka City in Japan recently updated its network based on solutions from Allied Telesis. The city’s technology infrastructure team manages the public computer network for schools, local government offices, and public buildings, providing both wired and wireless access for the city’s residents. Following a cyber attack on a different Japanese government network, Naka City wanted a more robust network that incorporated better security and easier administration. They chose an Allied Telesis solution in large part for the Autonomous Management Framework and the Secure Enterprise SDN technology.

The system was rolled out in 39 locations over a two-week period and was successfully commissioned after a one-week trial period.

“With AMF, we can manage and operate all our devices remotely, enabling a swift maintenance response,” according to Wataru Kobayashi, infrastructure engineering department manager with the VAR Osaki Computer Engineering. “SES lets us implement internal security measures, including behavior detection and anti-proliferation of security threats, which is a major advantage.”

The city’s future plans for SES include an automatic remediation process to fix a device and allow it to re-join the network. Not only will this remove threats, but it will also reduce disruption by making services available again as quickly as possible.

**Learn about SD-WAN:**

  * [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][6]
  * [How to pick an off-site data-backup method][7]
  * [SD-Branch: What it is and why you’ll need it][8]
  * [What are the options for security SD-WAN?][9]



Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3392800/allied-telesis-turns-its-networking-focus-to-the-us-market.html#tk.rss_all

作者：[Linda Musthaler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Linda-Musthaler/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/02/networking_thinkstock_508791260-100749950-large.jpg
[2]: https://www.alliedtelesis.com/
[3]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://www.networkworld.com/article/3386376/when-wi-fi-is-mission-critical-a-mixed-channel-architecture-is-the-best-option.html
[6]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[7]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[8]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[9]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html?nsdr=true
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
