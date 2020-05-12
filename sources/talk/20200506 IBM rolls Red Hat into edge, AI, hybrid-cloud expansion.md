[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IBM rolls Red Hat into edge, AI, hybrid-cloud expansion)
[#]: via: (https://www.networkworld.com/article/3542409/ibm-rolls-red-hat-into-edge-ai-hybrid-cloud-expansion.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

IBM rolls Red Hat into edge, AI, hybrid-cloud expansion
======
Every company will be an AI company new IBM CEO Krishna tells Think! virtual gathering
Getty

Deeply assimilating its Red Hat technology, IBM this week rolled out a set of new platforms and services designed to help customers manage edge-based application workloads and exploit artificial intelligence for infrastructure resiliency.

The announcements came at IBM’s virtualized Think! 2020 event that also featured the first Big Blue keynote by [the company's new CEO Arvind Krishna][1], during which he told the online audience about challenges of COVID-19: "History will look back on this as the moment when the digital transformation of business and society suddenly accelerated,” but also that [hybrid cloud and AI][2] are the two dominant forces driving digital transformation.

[Now see how AI can boost data-center availability and efficiency][3]

“More than 20 years ago, experts predicted every company would become an internet company. I am predicting today that every company will become an AI company, not because they can, but because they must,” he said.

With that idea in mind the company rolled out [IBM Watson AIOps][4], an application that uses AI to automate how enterprises detect, diagnose and respond to IT anomalies in real time. Watson AIOps works by grouping log anomalies and alerts based on spatial and temporal reasoning as well as similarity to past situations, IBM said. It uses IBM’s natural language processing technology to understand the content in trouble tickets to identify and extract resolution actions automatically.

Then it provides a pointer to where the problem is and identifies other services that might be affected.  “It does this by showing details of the problem based on data from existing tools in the environment, all in the context of the application topology, distilling multiple signals into a succinct report” and eliminating the need for multiple dashboards, IBM stated.

AI can automate tasks like shifting traffic from one router to another, freeing up space on a drive, or restarting an application. AI systems can also be trained to self-correct, IBM stated.

“The problem is that many businesses are consumed with fixing problems after they occur, instead of preventing them before they happen. Watson AIOps relies on AI to solve and automate how enterprises self-detect, diagnose and respond to anomalies in real time,” Krishna said.

AIOps is built on the latest release of Red Hat OpenShift, supports Slack and Box, and can be integrated with IT-monitoring packages from Mattermost and ServiceNow, IBM stated. 

The Kubernetes-based OpenShift Container Platform lets enterprise customers deploy and manage containers on their infrastructure of choice, be it private or public clouds, including AWS, Microsoft Azure, Google Cloud Platform, Alibaba and IBM Cloud.  It also integrates with IBM prepackaged Cloud Paks, which include a secured Kubernetes container and containerized IBM middleware designed to let customers quickly spin-up enterprise-ready containers.

OpenShift is also the underlying package for a new version of its [edge network][5] management application called IBM Edge Application Manager. Based on the open source project [Open Horizon][6], the Edge Application Manager can use AI and analytics to help deploy and manage up to 10,000 edge nodes simultaneously by a single administrator. With the platform customers can remotely add new capabilities to a single-purpose device or automatically direct a device to use a variety of cloud-based resources depending on what resources it needs.  

Cisco said it was working with the IBM Edge Application Manager to deploy apps and analytics models that run on a broad range of Cisco products, such as servers, its industrial portfolio of gateways, routers, switches, SD-WAN, and wireless-connectivity offerings for edge computing. 

“As an example, IBM Edge Application Manager leverages [Cisco HyperFlex Edge][7] and Cisco IC3000 Industrial Compute Gateway servers. The HyperFlex Edge and IC3K platforms are specifically designed to support a number of edge use cases, such as optimizing traffic management, increasing manufacturing productivity, and increasing the safety of oil and gas pipelines,” Cisco [stated][8].

In addition, Cisco said it has used the capabilities in IBM Edge Application Manager to build an “Edge in a Box proposal,” where customers can deploy remote edge applications that run entirely disconnected from public or private clouds but are also synchronized and managed remotely in controlled connectivity windows. For instance, client edge locations may need to operate in disconnected mode but have the ability to synch up for automated application updates and data exchanges, Cisco stated.

Other edge-related announcements include:

  * IBM [Edge Ecosystem][9], a group of industry players who will target open technology developments to let customers move data and applications between private data centers, hybrid multicloud environments and the edge. The group includes Cisco, Juniper, Samsung and NVIDIA among others. IBM said a Telco Network Cloud Ecosystem will serve a similar function for their network cloud platforms.
  * A preview of an upcoming service, called IBM Cloud Satellite. This will extend IBM’s public-cloud service to give customers the ability to use IBM Cloud anywhere – on-premises, in data centers or at the edge – delivered as a service that can be managed from a single pane of glass controlled through the public cloud. It lets customers run applications where it makes sense while utilizing cloud security and ops benefits, IBM stated. Satellite runs on Red Hat OpenShift.
  * Telco Network Cloud Manager – a telco/service provider offering that runs  on Red Hat OpenShift to deliver intelligent automation capabilities to orchestrate virtual and container network functions in minutes. Service providers will have the ability to manage workloads on both Red Hat OpenShift and Red Hat OpenStack platforms, which will be critical as telcos increasingly look to modernize their networks for greater agility and efficiency, and to provide new services as 5G adoption expands, IBM stated.
  * New capabilities for some of its Cloud Paks including extending the Cloud Pak for Data to include the ability to better automate planning, budgeting and forecasting in [hybrid-cloud][10] environments. IBM upgraded tools for business routing and data capture to the Cloud Pak for Automation as well.



Join the Network World communities on [Facebook][11] and [LinkedIn][12] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3542409/ibm-rolls-red-hat-into-edge-ai-hybrid-cloud-expansion.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3536654/ibm-taps-new-leaders-for-hybrid-cloud-battles-ahead.html
[2]: https://www.infoworld.com/article/3541825/ibms-new-ceo-lays-out-his-roadmap.html
[3]: https://www.networkworld.com/article/3274654/ai-boosts-data-center-availability-efficiency.html
[4]: https://www.ibm.com/watson/assets/duo/pdf/WDDE814_IBM_Watson_AIOps_Web.pdf
[5]: https://www.networkworld.com/article/3224893/what-is-edge-computing-and-how-it-s-changing-the-network.html
[6]: https://developer.ibm.com/blogs/open-horizon-joins-linux-foundation-grow-open-edge-computing-platform/
[7]: https://www.cisco.com/c/en/us/products/hyperconverged-infrastructure/index.html?dtid=oblgzzz001087
[8]: https://blogs.cisco.com/partner/cisco-and-ibm-teaming-at-the-edge
[9]: https://www.ibm.com/blogs/business-partners/join-the-edge-ecosystem/
[10]: https://www.networkworld.com/article/3268448/what-is-hybrid-cloud-really-and-whats-the-best-strategy.html
[11]: https://www.facebook.com/NetworkWorld/
[12]: https://www.linkedin.com/company/network-world
