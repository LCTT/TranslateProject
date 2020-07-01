[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco bumps up ISR/ASR router performance and capacity)
[#]: via: (https://www.networkworld.com/article/3564719/cisco-bumps-up-israsr-router-performance-and-capacity.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco bumps up ISR/ASR router performance and capacity
======
Cisco adds Terminal Services Gateway for network management
Thinkstock

With an eye towards easing potential performance and capacity constraints at the edge of the network, Cisco has bumped up the performance and configuration options for its workhorse router families.

The networking vendor rolled out a new pluggable switching module ([SM-X][1]) for the Integrated Services Router (ISR) 4000 branch and a pluggable Embedded Services Process module ([ESP-X][2]) for its Aggregation Services Router (ASR) 1000 that promise improved switching, throughput and security features. And for on-premise or public cloud connectivity, management and security, Cisco added a 1100 Series Terminal Services Gateway.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

According to Pat Vitalone product marketing manager in Cisco’s  Intent-Based Networking Group, the new modules address growing throughput and encryption performance needs in locations that serve as aggregation hubs at the cloud edge.

These locations need to be able to encrypt all traffic while delivering unhindered performance – whether it's remote work VPNs or automated IoT pinging the internet in a factory, Vitalone stated.

The improvements will also help customers that are reopening and want to incorporate more VPN tunnels into core locations as well as more egress from new apps, IoT/OT and more Vitalone stated.

The new SM-X module for the Cisco 4000 ISR is built on the same Unified Access Data Plane (UADP) programmable ASIC that powers the company’s core [Catalyst 9000][4] switch family. The idea is that from a single branch location, where space is at a premium, users can support a full stack of virtualized services from switching and routing to dynamic link selection and security, Vitalone stated.

“The latest SM-X release extends your ISR 4000 performance and investment even further to include switching capabilities on par with the Cisco Catalyst 9000 Series and extends your network fabric to include Layer 2 to Layer 7 control – MAC to application,” Vitalone stated.

The new ASR ESP-X module features the third generation of [Cisco’s Quantum Flow processor][5], a Layer 3 forwarding ASIC. The ESP-X provides customers more than 265 Gbps of IPv4 and IPv6 throughput, along with IPSec that is more than 2X better performing than previous generations of the processor, according to Vitalone. 

Cisco ASR 1000s typically reside at the WAN edge of an enterprise data center or large office, as well as in service provider Points of Presence (POPs). The routers use the ESPs to aggregate multiple traffic flows and network services, including encryption and traffic management, and forward them across WAN connections at line speeds.

The ESP-aX can reach more than 2X better scale compared to previous generations for classic network address translation (NAT), carrier-grade NAT and zone based firewall, an important capability for edge locations that experience bandwidth demands in great bursts or waves, Vitalone said.

Cisco also introduced the 1100 Terminal Services Gateway, a secure remote console for customers needing Out of Band Management tools. Like the ASR devices, the 1100 runs Cisco’s IOS XE software and lets customers securely manage a variety of networking, compute, internet of things (IoT), and other devices. It integrates Layer 2 switching and security with the ability to integrate and manage wired and wireless WAN connections into a single rack unit.

The top-of-rack [1100][6] offers integrated asynchronous ports, optional switching, and simplified Ethernet. It also supports secure tunnels, such as IPSec, generic routing encapsulation (GRE), and Cisco Dynamic Multipoint VPN, all at scale. The 1100 TSG also supports Advanced LTE modules can use the latest in wireless technology for backup connectivity when managing the WAN, according to Vitalone.

Cloud service providers can deploy the C1100 TSG in data centers to provide secure connectivity to terminal servers, computers, IoT devices, and other networking equipment located in the internal network or behind a firewall.

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3564719/cisco-bumps-up-israsr-router-performance-and-capacity.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.cisco.com/c/en/us/products/collateral/routers/4000-series-integrated-services-routers-isr/nb-06-sm-x-bas-switc-ds-cte-en.html?oid=dstetr021627)%20is%20a%20layer%202
[2]: https://www.cisco.com/c/en/us/products/collateral/routers/asr-1000-series-aggregation-services-routers/datasheet-c78-731640.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3391580/venerable-cisco-catalyst-6000-switches-ousted-by-new-catalyst-9600.html
[5]: https://www.cisco.com/c/en/us/products/collateral/routers/asr-1000-series-aggregation-services-routers/solution_overview_c22-448936.html
[6]: https://www.cisco.com/c/en/us/products/collateral/cloud-systems-management/terminal-services-gateways/nb-06-1100-term-ser-gateway-ds-cte-en.html
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
