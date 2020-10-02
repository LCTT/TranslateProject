[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware highlights security in COVID-era networking)
[#]: via: (https://www.networkworld.com/article/3584412/vmware-highlights-security-in-covid-era-networking.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

VMware highlights security in COVID-era networking
======
VMware is tackling the challenges of securing distributed enterprise resources with product enhancements including the new Carbon Black Cloud Workload software and upgrades to its SD-WAN and SASE products.
ArtyStarty / Getty Images

As enterprise workloads continue to move off-premises and employees continue to work remotely during the COVID-19 pandemic, securing that environment remains a critical challenge for IT.

At its virtual VWworld 2020 gathering, VMware detailed products and plans to help customers deal with the challenges of securing distributed enterprise resources.

**More about SD-WAN**: [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][1] • [What SD-Branch is and why you'll need it][2] • [What are the options for securing SD-WAN?][3]

"Amid global disruption, the key to survival for many companies has meant an accelerated shift to the cloud and, ultimately, bolting on security products in their data centers," said Sanjay Poonen, VMware's Chief Operating Officer, Customer Operations. "But legacy security systems are no longer sufficient for organizations that are using the cloud as part of their computing infrastructure. It's time to rethink security for the cloud. Organizations need protection at the workload level, not just at the endpoint."

With that in mind, VMware introduced Carbon Black Cloud Workload software that combines vulnerability reporting with security detection and response capabilities to protect workloads running in virtualized, private and hybrid cloud environments, VMware stated.   

The new packages – along with [other upgrades to its security software][4] – represent VMware's continued development and integration of the Carbon Black security technology it [acquired a year ago][5] for $2.1 billion. 

"Tightly integrated with vSphere, VMware Carbon Black Cloud Workload provides agentless security that alleviates installation and management overhead and consolidates the collection of [telemetry][6] for multiple workload security use cases," VMware stated. 

The idea is to allow security and infrastructure teams to automatically secure new and existing workloads at every point in the security lifecycle, while simplifying operations and consolidating the IT and security stack. With the software, customers can analyze attacker behavior patterns over time to detect and stop never-seen-before attacks, including those manipulating known-good software. If an attacker bypasses perimeter defenses, security teams can shut down the attack before it escalates to a data breach, VMware stated. 

All current vSphere 6.5 and VMware Cloud Foundation 4.0 customers can give the package a try for free for the next six months, VMware stated. VMware plans to introduce a Carbon Black Cloud module for hardening and better securing Kubernetes workloads as well.

The company also enhanced its Workspace ONE platform that securely manages end users' mobile devices and cloud-hosted virtual desktops and applications from the cloud or on-premise.

The company says it blended VMware Workspace ONE Horizon and VMware Carbon Black Cloud to offer behavioral detection to protect against ransomware and file-less malware. On VMware vSphere, the solution is integrated into VMware Tools, removing the need to install and manage additional security agents, according to the company. 

Bolstering support for Apple Mac and Microsoft Windows 10 remote users, VMware added Workspace Security Remote, which includes the antivirus, audit and remediation, and detection and response capabilities of Carbon Black Cloud. It also includes the analytics, automation, device health, orchestration, and zero-trust access capabilities of the Workspace ONE platform.

Securing the remote work environment is a common theme among other VMWare announcements, including news around its [SD-WAN and secure access service edge (SASE)][7] products and its overarching Virtual Cloud Network architecture.

Taken together, the enhancements further VMware's goal of integrating security features within its infrastructure – a concept it calls intrinsic security – in an effort to better protect networked workloads than traditional piecemeal protection systems could.

The democratization of compute was already underway before the COVID situation pushed it further, faster, said Sanjay Uppal, senior vice president and general manager of the VeloCloud Business Unit at VMware. "So with the remote workforce growing we need to make privacy and security drop-dead simple, and that is the goal."

A more futuristic goal for the company is to provide a unified approach to security incident detection and response that can leverage multiple domains – from endpoint to workload to user to network. An emerging architecture that promises those capabilities is Extended Detection and Response (XDR), and VMware says it intends to support it. 

In a recent _[CSO][8]_ [column][8], Enterprise Strategy Group senior principal analyst Jon Oltsik defined XDR as "an integrated suite of security products spanning hybrid IT architectures, designed to interoperate and coordinate on threat prevention, detection and response. In other words, XDR unifies control points, security telemetry, analytics, and operations into one enterprise system."

ESG research indicates that 84% of organizations are actively integrating security technologies so XDR can act as a turnkey security technology integration solution. 

"While vendors will offer different XDR bundles, ESG research indicates that large organizations really want XDR to include endpoint/server/cloud workload security, network security, coverage of the most common threat vectors (i.e., email/web), file detonation (i.e., sandboxing), threat intelligence, and analytics," Oltsik stated.

Gartner said of XDR: "Although XDR tools are similar in function to security incident and event monitoring (SIEM) and security orchestration, automation and response tools, they are primarily differentiated by the level of integration at deployment and the focus on incident response."

The primary goals of an XDR solution are to increase detection accuracy by correlating threat intelligence and signals across multiple security solutions, and to improve security operations efficiency and productivity.

For its part, VMware said XDR is the opportunity to do just that: provide a unified approach to security incident detection and response that can leverage multiple domains from endpoint to workload to user to network.

VMware called XDR "a multi-year effort to build the most advanced and comprehensive security incident detection and response solutions available" and will include cross-platform integration across its portfolio including Workspace ONE, vSphere, Carbon Black Cloud, and NSX Service-defined Firewall.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3584412/vmware-highlights-security-in-covid-era-networking.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[2]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[3]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html
[4]: https://www.networkworld.com/article/3529369/vmware-amps-up-its-cloud-and-data-center-security.html
[5]: https://www.networkworld.com/article/3445383/vmware-builds-security-unit-around-carbon-black-tech.html
[6]: https://www.networkworld.com/article/3575837/streaming-telemetry-gains-interest-as-snmp-reliance-fades.html
[7]: https://www.networkworld.com/article/3583939/vmware-amps-up-security-for-network-sase-sd-wan-products.html
[8]: https://www.csoonline.com/article/3561291/what-is-xdr-10-things-you-should-know-about-this-security-buzz-term.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
