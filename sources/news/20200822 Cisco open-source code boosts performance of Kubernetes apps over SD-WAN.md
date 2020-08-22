[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Cisco open-source code boosts performance of Kubernetes apps over SD-WAN)
[#]: via: (https://www.networkworld.com/article/3572310/cisco-open-source-code-boosts-performance-of-kubernetes-apps-over-sd-wan.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

Cisco open-source code boosts performance of Kubernetes apps over SD-WAN
======
Cisco's Cloud-Native SD-WAN project marries SD-WANs to Kubernetes applications to cut down on the manual work needed to optimize latency and packet loss.
Thinkstock

Cisco has introduced an open-source project that it says could go a long way toward reducing the manual work involved in optimizing performance of Kubernetes-applications across [SD-WANs][1].

Cisco said it launched the Cloud-Native SD-WAN (CN-WAN) project to show how Kubernetes applications can be automatically mapped to SD-WAN with the result that the applications perform better over the WAN.

**More about SD-WAN**: [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][2] • [How to pick an off-site data-backup method][3] •  [SD-Branch: What it is and why you’ll need it][4] • [What are the options for security SD-WAN?][5]

“In many cases, enterprises deploy an SD-WAN to connect a Kubernetes cluster with users or workloads that consume cloud-native applications. In a typical enterprise, NetOps teams leverage their network expertise to program SD-WAN policies to optimize general connectivity to the Kubernetes hosted applications, with the goal to reduce latency, reduce packet loss, etc.” wrote John Apostolopoulos, vice president and CTO of Cisco’s intent-based networking group in a group [blog][6].

“The enterprise usually also has DevOps teams that maintain and optimize the Kubernetes infrastructure. However, despite the efforts of NetOps and DevOps teams, today Kubernetes and SD-WAN operate mostly like ships in the night, often unaware of each other. Integration between SD-WAN and Kubernetes typically involves time-consuming manual coordination between the two teams.”

Current SD-WAN offering often have APIs that let customers programmatically influence how their traffic is handled over the WAN. This enables interesting and valuable opportunities for automation and application optimization, Apostolopoulos stated.  “We believe there is an opportunity to pair the declarative nature of Kubernetes with the programmable nature of modern SD-WAN solutions,”  he stated.

Enter CN-WAN, which defines a set of components that can be used to integrate an SD-WAN package, such as Cisco Viptela SD-WAN, with Kubernetes to enable DevOps teams to express the WAN needs of the microservices they deploy in a Kubernetes cluster, while simultaneously letting NetOps automatically render the microservices needs to optimize the application performance over the WAN, Apostolopoulos stated.

Apostolopoulos wrote that CN-WAN is composed of a Kubernetes Operator, a Reader, and an Adaptor. It works like this: The CN-WAN Operator runs in the Kubernetes cluster, actively monitoring the deployed services. DevOps teams can use standard Kubernetes annotations on the services to define WAN-specific metadata, such as the traffic profile of the application. The CN-WAN Operator then automatically registers the service along with the metadata in a service registry. In a demo at KubeCon EU this week Cisco used Google Service Directory as the service registry.

Earlier this year [Cisco and Google][7] deepened their relationship with a turnkey package that lets customers mesh SD-WAN connectivity with applications running in a private [data center][8], Google Cloud or another cloud or SaaS application. That jointly developed platform, called Cisco SD-WAN Cloud Hub with Google Cloud, combines Cisco’s SD-WAN policy-, telemetry- and security-setting capabilities with Google's software-defined backbone to ensure that application service-level agreement, security and compliance policies are extended across the network.

Meanwhile, on the SD-WAN side, the CN-WAN Reader connects to the service registry to learn about how Kubernetes is exposing the services and the associated WAN metadata extracted by the CN-WAN operator, Cisco stated. When new or updated services or metadata are detected, the CN-WAN Reader sends a message towards the CN-WAN Adaptor so SD-WAN policies can be updated.

Finally, the CN-WAN Adaptor, maps the service-associated metadata into the detailed SD-WAN policies programmed by NetOps in the SD-WAN controller. The SD-WAN controller automatically renders the SD-WAN policies, specified by the NetOps for each metadata type, into specific SD-WAN data-plane optimizations for the service, Cisco stated.  

“The SD-WAN may support multiple types of access at both sender and receiver (e.g., wired Internet, MPLS, wireless 4G or 5G), as well as multiple service options and prioritizations per access network, and of course multiple paths between source and destination,” Apostolopoulos stated.

The code for the CN-WAN project is available as open-source in [GitHub][9].

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3572310/cisco-open-source-code-boosts-performance-of-kubernetes-apps-over-sd-wan.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[2]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[3]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[4]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[5]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html
[6]: https://blogs.cisco.com/networking/introducing-the-cloud-native-sd-wan-project
[7]: https://www.networkworld.com/article/3539252/cisco-integrates-sd-wan-connectivity-with-google-cloud.html
[8]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[9]: https://github.com/CloudNativeSDWAN/cnwan-docs
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
