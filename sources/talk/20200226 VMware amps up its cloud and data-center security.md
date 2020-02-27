[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (VMware amps up its cloud and data-center security)
[#]: via: (https://www.networkworld.com/article/3529369/vmware-amps-up-its-cloud-and-data-center-security.html)
[#]: author: (Michael Cooney https://www.networkworld.com/author/Michael-Cooney/)

VMware amps up its cloud and data-center security
======
Upgrades to VMware security software rely on technology it bought with the purchase of Carbon Black, Avi Networks, Cloud Coreo and CloudHealth.
Magdalena Petrova

VMware this week further integrated and added new features to its security software in an effort to bring unified protection to resources in [data centers][1], and [private clouds][2] and public clouds.

The company rolled out three new offerings:

  * VMware Advanced Security for Cloud Foundation – an integrated package of VMware Carbon Black technology, NSX Advanced Load Balancer with Web Application Firewall capabilities and NSX Distributed IDS/IPS aimed at offering customers a unified shield for data centers, private and public clouds.
  * Support for security correlation with the MITRE ATT&amp;CK framework Technique IDs (TIDs)—a list of common tactics, techniques, and procedures now built into the VMware Carbon Black Cloud that customers can use to determine network threat risks and prioritize resolutions. Improved Carbon Black Cloud support for Microsoft and Linux is coming as well.
  * VMware Secure State – real-time detection and remediation capabilities to automate problem resolution across clouds.



[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

The announcements further VMware’s overarching goal of integrating security features within its infrastructure – a concept it calls intrinsic security – that it says will better protect networked workloads than traditional piecemeal protection systems. They also feature the further integration of a number of technologies VMware has recently acquired.

For example, Carbon Black and Avi Networks technology is at the heart of the VMware Advanced Security for Cloud Foundation package.  Cloud Foundation is VMware’s core virtualization package featuring vSphere, NSX network capabilities and storage. It is the core underpinning for the company's key cloud offerings such as VMware Cloud for AWS and Dell EMC.   The [company bought Avi Networks][4] load balancing, analytics and application-delivery technology last year for an undisclosed amount and  later in the year snapped up security technology from [Carbon Black for $2.1 billion][5]. 

In the Advanced Security for Cloud Foundation package VMware Carbon Black technology protects workloads with Real-time Workload Audit/Remediation, Next-Generation Antivirus and Endpoint Detection &amp; Response.

VMware Carbon Black will be tightly integrated with VMware vSphere to yield an agentless offering, eliminating the need to insert antivirus and other agents, VMware stated. 

“Instead, endpoint telemetry will be managed and gathered via built-in sensors protected by the hypervisor. This also means, unlike agent-based solutions, the hypervisor will be able to detect if an attacker attempts to gain root access and tamper with the VMware Carbon Black technology — all from a separate trust domain,” VMware said.

[][6]

The Avi technology, now called NSX Advanced Load Balancer  and VMware’s Web Application Firewall combination to protects a common attack point – web servers.

“Traditional hardware-based solutions are notoriously complex to manage. They are either massively over-provisioned for peak traffic or end up turning off security filtering under heavy loads. In contrast, the scale-out software architecture of the NSX Advanced Load Balancer enables capacity to scale elastically with traffic,” wrote VMware engineer Vivek Bhandari in a [blog][7] about the announcement. 

Also part of the package is VMware’s NSX Distributed IDS/IPS. According to VMware, the distributed architecture of NSX Distributed IDS/IPS will enable advanced filtering to be applied to every hop of the application. The idea is to decrease  blind spots created when using traditional perimeter security products. Policies can also be set and enforced on an application-specific basis, Bhandari wrote.

In addition to the Advanced Security for Cloud Foundation package, VMware also bolstered the Carbon Black security cloud by tying in support for the MITRE ATT&amp;CK framework. 

According to the most recent Verizon Data Breach Investigations Report, only [28% of today’s attacks stem from][8] malware, which makes it an imperative for organizations to be vigilant in detecting and identifying these techniques, used commonly in fileless attacks, wrote Scott Lundgren, vice president of engineering with VMware Carbon Black in a [blog][9] about the announcement.

“With this framework included in the VMware Carbon Black Cloud product experience, customers now have the ability to search by MITRE Technique IDs (TIDs), view the information on individual TIDs directly from the MITRE website, see when a particular TID is encountered, and set up alerts within their dashboard when specific TIDs are present in their environment. These capabilities will enable customers to speed integration of MITRE ATT&amp;CK into their internal workflow and training, so they can more easily detect and prevent suspicious activity,” Lundgren stated.

VMware also enhanced the Carbon Black Cloud with support for Microsoft Windows Anti-Malware Scanning Interface (AMSI) that will give customers improved visibility into script content that is executed on Windows devices, with the ability to both hunt and detect more effectively within the platform, Lundgren stated. This capability provides insight into the de-obfuscated command of a script, displaying them exactly as they are executed by the interpreter, leaving nowhere for the attacker to hide, Lundgren stated.

Research from the recent [Carbon Black Global Incident Response Threat Report][10] showed that 70% of today’s attacks featured lateral movement of some kind, wherein a common and seemingly innocuous application, like Microsoft PowerShell, is used to instill damage by running nefarious script commands, Lundgren stated.

Additionally VMware said it would add malware prevention capabilities for Linux machines to the Carbon Black Cloud.

With Linux now making up about [70% of the web-server market and 90% of all cloud servers][11], and with the recent emergence of more Linux-specific threats such as HiddenWasp, QNAPCrypt, and Evilgnome, there is a nned to address security needs specific to Linux machines in endpoint security products Lundgren stated.

Now the VMware Carbon Black Cloud platform provides endpoint security Windows, macOS, and Linux machines and  the ability to protect endpoints with a single cloud-native platform, Lundgren stated.

VMware Secure State was born out of two acquisitions VMWare made last year: CloudCoreo, with a focus on continuous automation, and [CloudHealth][12], which focuses on cloud management and optimization. VMware Secure State provides real-time visibility, detection, and risk prioritization capabilities for assessing security risks.

VMware Secure State is getting a new, flexible remediation framework to help automate actions across multicloud environments. Currently in beta, Secure State helps facilitate  collaboration between cloud security and DevOps teams to build security into multicloud and public-cloud operations. 

Join the Network World communities on [Facebook][13] and [LinkedIn][14] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3529369/vmware-amps-up-its-cloud-and-data-center-security.html

作者：[Michael Cooney][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Michael-Cooney/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[2]: https://www.networkworld.com/article/2159885/cloud-computing-gartner-5-things-a-private-cloud-is-not.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3402981/vmware-eyes-avi-networks-for-data-center-software.html
[5]: https://www.networkworld.com/article/3445383/vmware-builds-security-unit-around-carbon-black-tech.html
[6]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[7]: https://blogs.vmware.com/networkvirtualization/2020/02/security-for-modern-data-center.html/
[8]: https://enterprise.verizon.com/resources/reports/dbir/
[9]: https://www.carbonblack.com/2020/02/25/bringing-intrinsic-security-to-rsa-conference-2020/
[10]: https://www.carbonblack.com/global-incident-response-threat-report/april-2019/#form
[11]: https://www.darkreading.com/cloud/the-forgotten-link-between-linux-threats-and-cloud-security/d/d-id/1336870?cid=smartbox_techweb_whitepaper_14.500003847
[12]: https://www.cloudhealthtech.com/blog/remediate-misconfigurations-at-scale-with-vmware-secure-state
[13]: https://www.facebook.com/NetworkWorld/
[14]: https://www.linkedin.com/company/network-world
