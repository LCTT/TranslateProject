[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Why Comcast open sourced its DNS management tool)
[#]: via: (https://opensource.com/article/20/9/open-source-dns)
[#]: author: (Paul Cleary https://opensource.com/users/pauljamescleary)

Why Comcast open sourced its DNS management tool
======
This open source DNS management tool was built by and for the telcom
giant, but is establishing itself in its own right and welcoming more
contributors.
![An intersection of pipes.][1]

Adoption of [DevOps][2] practices at Comcast led to increased automation and configuration of infrastructure that supports applications, back-office, data centers, and our network. These practices require teams to move fast and be self-reliant. Infrastructure is constantly turned upside down, with network traffic moved around it constantly. Good DNS record management is critical to support this level of autonomy and automation, but how can a large, diverse enterprise move quickly while safely governing its DNS assets?

### Challenge

Prior to 2016, DNS record management was mostly done through an online ticketing system—users would submit tickets for DNS changes that were manually reviewed and implemented by a separate team of DNS technicians. This system frequently required manual intervention for many of the DNS requests, which was time-consuming.

Turnaround times for DNS changes were in hours, which is not suitable for infrastructure automation. Large Internet companies can manage millions of DNS records, making it practically impossible for DNS technicians to certify the correctness of the thousands of DNS updates being requested daily. This increased the possibility of an inadvertent errant update to a critical DNS record that ultimately would lead to a downtime event.

In addition, engineering teams are intimately familiar with their DNS needs—much more so than a single group of DNS technicians serving an entire enterprise. So, we needed to enable engineering teams to self-service their own DNS records, implement changes quickly (in seconds), and at the same time, make sure all changes are done safely.

### Solution

VinylDNS was built at Comcast and subsequently opened to empower engineering teams to automate as they please while providing the safety and administrative controls demanded by DNS operators and the Comcast Security team.

### Security as a way of life

VinylDNS is all about automation and enhanced security. At Comcast, the VinylDNS team worked in close coordination with both the DNS and engineering teams at Comcast, as well as the security team, to meet stringent engineering and security requirements. An incredible array of access controls was implemented that give extreme flexibility to both DNS operators and engineering teams to control their DNS assets.

Access controls implemented at the DNS zone level allow any team to control who can make updates to their DNS zones. When a DNS zone is registered and authorized to a VinylDNS group, only members of that group can make changes to DNS records in that DNS zone. In addition, access-list (ACL) rules provide extreme flexibility to allow other VinylDNS users to manage records in that zone. These ACL rules can be defined using regular expression masks or classless inter-domain routing (CIDR) rules and DNS record types that lock down access to specific users and groups to certain records in specific DNS zones.

### Meeting the demands of automation

A [representational state transfer (REST) API][3] was built along with the system. This uses request signing to help eliminate man-in-the-middle attacks. Once the engineering teams at Comcast caught wind of the kind of automation afforded by VinylDNS, many began building out tooling to integrate directly with VinylDNS via its API. It wasn't long before most of them were using organically developed tooling integrated with the VinylDNS API to support their DNS needs.

### Performing at large enterprise scale

Very quickly, VinylDNS was managing a million DNS records and thousands of DNS zones, and supporting hundreds of engineers. As we sought to expand VinylDNS to support the rest of Comcast, we recognized some challenges.

  1. Certain DNS records were off-limits, deemed too critical to manage in any way other than by hand.
  2. The ACL rule model, while flexible, would be impossible to set up and maintain across the entirety of Comcast's DNS footprint (which has millions of DNS zones, and hundreds of millions of DNS records).
  3. Many DNS domains are considered "universal" and not locked down to a single group. This holds true for reverse zones, as IP space can often be freely assigned to anyone.
  4. Certain DNS change requests still require a manual review and approval, i.e., you cannot truly automate everything.
  5. Some teams that provision a DNS record are not the same engineers responsible for its lifecycle. The engineers that ultimately decommission a DNS record might be unknown at the time of creation.
  6. Certain teams require DNS changes to be scheduled at some point in the future. For example, maintenance may be done off-hours, and the employee doing the maintenance may not have access to VinylDNS.



To address these issues, VinylDNS added more access controls and features. Shared zones allow universal access while maintaining security via record ownership. Record ownership ensures that the party who creates a DNS record is the only one that can manage that record. This feature alone allowed us to move much of the DNS reverse space into VinylDNS.

Manual review was added to support tighter governance on certain DNS zones and records. For example, a sensitive DNS zone might demand review before implementing changes, as opposed to having all changes immediately applied.

High-value domains support was added to block VinylDNS from ever being able to update certain DNS records. High-value DNS records like [www.comcast.com][4], for example, are impossible to manage via VinylDNS and require extreme governance that can't be accomplished via an automation platform.

Global ACLs were added to support situations where teams that created DNS records were not responsible for the maintenance and decommissioning of those DNS records. This allowed overrides for certain groups by fully qualified domain name (FQDN) and IP address for certain DNS domains.

Finally, scheduled changes allow users to schedule a DNS change for a future time.

### Results

VinylDNS now governs most of Comcast's internal DNS space, managing millions of DNS records across thousands of DNS zones, and supporting thousands of engineers. In addition, we leverage integration with a wide array of tools and programming languages, including Java, Python, Go, and Ruby (most of which are open source).

### Toward the future

There are several opportunities for additional feature development, which Comcast has planned as part of its ongoing evolution of the platform. The same level of access controls and governance is needed for DNS assets managed in public cloud settings. In addition, we are looking into the ability to manage DNS zones (create and delete), which is required for IPv6 reverse zones. Finally, we are looking to create a powerful admin experience for our DNS operators who are looking to take advantage of the data that lives in the VinylDNS database.

### Opening up

[VinylDNS][5] is an open source project released and managed by [Comcast Open Source][6]. VinylDNS and its accompanying ecosystem were built by engineers in several organizations across Comcast, leveraging our inner source program. It is free for use, licensed under Apache License 2.0. We welcome all contributors, from code to bugs to feature requests, from new projects to project ideas. You can [contact our team on Gitter][7].

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/open-source-dns

作者：[Paul Cleary][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/pauljamescleary
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LAW-Internet_construction_9401467_520x292_0512_dc.png?itok=RPkPPtDe (An intersection of pipes.)
[2]: https://opensource.com/resources/devops
[3]: https://www.redhat.com/en/topics/api/what-is-a-rest-api
[4]: http://www.comcast.com
[5]: https://www.vinyldns.io
[6]: https://comcast.github.io/
[7]: https://gitter.im/vinyldns/vinyldns
