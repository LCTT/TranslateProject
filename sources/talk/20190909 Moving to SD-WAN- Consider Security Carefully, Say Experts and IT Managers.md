[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Moving to SD-WAN? Consider Security Carefully, Say Experts and IT Managers)
[#]: via: (https://www.networkworld.com/article/3436793/moving-to-sd-wan-consider-security-carefully-say-experts-and-it-managers.html)
[#]: author: (Cato Networks https://www.networkworld.com/author/Matt-Conran/)

Moving to SD-WAN? Consider Security Carefully, Say Experts and IT Managers
======
SD-WAN works best when branch offices have secure, direct Internet access. Here are the challenges confronted by three IT managers and how they addressed them.
bluebay2014

For those of you migrating from MPLS to [SD-WAN][1], here’s a truism that all too often is forgotten: don’t overlook your security architecture.

Failure to consider security as part of SD-WAN deployments is a major cause of security breaches.  Last year, enterprises with completed SD-WAN implementations were 1.3 times more likely to experience a branch office security breach than those without one, [says Shamus McGillicuddy][2], Research Director at analyst firm Enterprise Management Associates.

Security is essential because so many of  [SD-WAN’s benefits][3] – cost optimization, improved cloud performance, and agility – rely heavily on secure direct Internet access.

### Security Complexity Complicates SD-WAN Deployments

And there’s the rub, for the centralized security architectures long favored by legacy enterprise networks poorly fit with Internet-connected sites.  With sites already sitting on the Internet, backhauling traffic for security inspection makes little sense (at least from a performance standpoint).

It makes far more sense to implement security in the branch, but branch security is beyond the scope of SD-WAN. The next-generation firewalling, malware protection, and advanced threat protection — the preventive security needed to protect the branch requires deploying additional appliances or technologies. 

### Appliances Breed Complexity that Degrades Security Posture

Adding security appliances or, for that matter, putting security into SD-WAN appliances presents numerous problems. For one, there are the appliance’s scaling challenges. Security inspection, particularly TLS decryption, requires significant compute resources, which only increase as traffic levels grow. As a result, IT managers tell us that they’re left constantly reinvesting in their security appliances.

Upgrading local firewall appliances was a constant expense, says [Alf Dela Cruz, First Vice President, Head of IT Infrastructure and Cybersecurity at Standard Insurance][4]. The Philippines-based insurance company wanted an SD-WAN to replace its 60 branch VPN connections. The sheer complexity of maintaining all branch appliances weakened effective protection, leaving the organization to suffer from two costly ransomware incidents.

Integrating external security appliances or services with the SD-WAN also complicates branch deployments and troubleshooting. SD-WAN was supposed to be “zero-touch” with appliances being deployed in minutes by even non-technical personnel. Add security appliances into that mix and deployment becomes far more challenging.

“Updating our security architecture was going to require running different vendors, piecing together a solution, and going through all the deployment and management pains,” says [Andrew Thomson, director of IT systems and services at BioIVT, a provider of biological products to life sciences companies][5], who was looking to transition its 14-site, Internet-based VPN network to an SD-WAN.

And juggling multiple security interfaces complicates troubleshooting. Just ask [Kevin McDaid.  The Systems Manager at Fisher &amp; Company, an automotive components manufacturer,][6] noted that managing his appliance-based security infrastructure was painful. He and his team had to jump between “tons” of management interfaces,” he says.

Bottom line: security appliances means more components and complexity, creating a network that’s more difficult to maintain and protect.

### Telco-managed Services Hide but Don’t Solve the Problem

Outsourcing the responsibility to a telco-managed service isn’t the answer. You’ve just shifted the problem, and now telcos must wrestle with the same management and maintenance issuesAs traffic levels grow, telcos are still subject to the same appliance scaling issues. All of which is why telcos charge steep fees for managed services, not to mention the long delays of waiting on tickets.

McDaid and he and his team had relied on a managed security service. He could monitor firewalls and the network, but his telco had to make any changes. “Something as simple as enabling access to a website through our firewall meant having to call support. It was very frustrating.”

### Consolidate Security Inspection in the Cloud

Instead, enterprises are looking increasingly at moving security inspection into the cloud as security-as-a-service. Instead of multiple security appliances, security-as-a-service providers converge the functionality of multiple security appliances into a cloud-native software stack. Sites send traffic to the provider’s nearest point of presence (PoP) for inspection and from there directly onto the Internet. Inspecting all site-to-site and site-to-Internet traffic (and mobile traffic) with one, security stack solves security’s complexity problem.

Assuming offices are located near a PoP, and that is important to evaluate, you can eliminate the backhaul problem. Cato, for example, is available from more than 45 locations worldwide, covering nearly every major business center in the world.

Risks from outdated security infrastructure also become obsolete. Security engineers maintain the security infrastructure, ensuring security tools are always current.  They can leverage the rich insight from looking at the traffic metadata across the organization to identify new threats far faster and more effectively than most individual organizations.

### Security-as-a-Service Leads to Better Security Practice

With providers maintaining an always current security stack in security-as-a-service, organizations find they have the resources to devote elsewhere, adopting even more security best practices. Proactively hunting for threats is a case in point.

Current average dwell time – the time from first evidence of compromise to detection – exceeds three months (101 days). However, hunting for threats has required significant investment in expertise and technology. Managed detection and response (MDR) services try to fill this void, but they require the pain and complexity of installing agents on network-connected devices to gather the necessary information.

The lack of easy, effective approach often leads IT teams to wait on threat hunting. Prior to BioIVT switching to Cato, for example, Thomson and his team were so busy with other priorities that they lacked the time and budget to properly investigate endpoints for threats. “We never even got around to an MDR solution because of the complexity,” BioIVT’s Thomson.

[Security-as-a-service][7] makes MDR much accessible. With event information already collected, there’s **no** need to deploy agents or hardware. MDR just becomes one more function built into the service, making this best practice available to all.

“Cato MDR has already discovered several pieces of malware missed by our antivirus systems,” says Thomson.

### Cloud Security: The Answer to SD-WAN’s Security Problem

Cloud adoption is pushing enterprises to transform legacy MPLS networks to Internet-based SD-WANs. But in making this change, networking and security teams must operate hand-in-hand. Security is just too important with users living on an Internet infested with [Mirai][8] and [NotPetya][9] threats.

Appliance-based architectures, with their scaling and operational limitations, are ill suited to the goals of leaner, more agile WAN.

Ironically, the cloud can also be a solution. Shifting security into SD-WAN and to the cloud as security-as a-service delivers the lean, agile operation required by enterprises without interfering with the benefits sought after from SD-WAN.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3436793/moving-to-sd-wan-consider-security-carefully-say-experts-and-it-managers.html

作者：[Cato Networks][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Matt-Conran/
[b]: https://github.com/lujun9972
[1]: https://www.catonetworks.com/glossary-use-cases/sd-wan?utm_source=IDG&utm_campaign=IDG
[2]: https://go.catonetworks.com/VOD_The-6-Keys-to-Successful-WAN-Transformation?utm_source=IDG&utm_campaign=IDG
[3]: https://www.catonetworks.com/glossary-use-cases/sd-wan/?utm_source=IDG&utm_campaign=IDG
[4]: https://www.catonetworks.com/customers/standard-insurance-uses-cato-for-cloud-migration-and-digital-transformation/?utm_source=IDG&utm_campaign=IDG
[5]: https://www.catonetworks.com/customers/bioivt-connects-and-secures-global-network-with-cato-cloud-and-the-cato-managed-threat-detection-and-response-mdr-service/?utm_source=IDG&utm_campaign=IDG
[6]: https://www.catonetworks.com/customers/fisher-company-lowers-mpls-costs-improves-wan-performance/?utm_source=IDG&utm_campaign=IDG
[7]: https://www.catonetworks.com/cato-cloud#security-as-a-service
[8]: https://www.catonetworks.com/blog/mirai-malware-targeting-the-enterprise/?utm_source=IDG&utm_campaign=IDG
[9]: https://catonetworks-my.sharepoint.com/personal/dave_catonetworks_com/Documents/%253Futm_source=IDG&utm_campaign=IDG
