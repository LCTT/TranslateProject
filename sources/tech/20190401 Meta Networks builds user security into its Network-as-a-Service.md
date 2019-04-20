[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Meta Networks builds user security into its Network-as-a-Service)
[#]: via: (https://www.networkworld.com/article/3385531/meta-networks-builds-user-security-into-its-network-as-a-service.html#tk.rss_all)
[#]: author: (Linda Musthaler https://www.networkworld.com/author/Linda-Musthaler/)

Meta Networks builds user security into its Network-as-a-Service
======

### Meta Networks has a unique approach to the security of its Network-as-a-Service. A tight security perimeter is built around every user and the specific resources each person needs to access.

![MF3d / Getty Images][1]

Network-as-a-Service (NaaS) is growing in popularity and availability for those organizations that don’t want to host their own LAN or WAN, or that want to complement or replace their traditional network with something far easier to manage.

With NaaS, a service provider creates a multi-tenant wide area network comprised of geographically dispersed points of presence (PoPs) connected via high-speed Tier 1 carrier links that create the network backbone. The PoPs peer with cloud services to facilitate customer access to cloud applications such as SaaS offerings, as well as to infrastructure services from the likes of Amazon, Google and Microsoft. User organizations connect to the network from whatever facilities they have — data centers, branch offices, or even individual client devices — typically via SD-WAN appliances and/or VPNs.

Numerous service providers now offer Network-as-a-Service. As the network backbone and the PoPs become more of a commodity, the providers are distinguishing themselves on other value-added services, such as integrated security or WAN optimization.

**[ Also read:[What to consider when deploying a next generation firewall][2] | Get regularly scheduled insights: [Sign up for Network World newsletters][3]. ]**

Ever since its launch about a year ago, [Meta Networks][4] has staked security as its primary value-add. What’s different about the Meta NaaS is the philosophy that the network is built around users, not around specific sites or offices. Meta Networks does this by building a software-defined perimeter (SDP) for each user, giving workers micro-segmented access to only the applications and network resources they need. The vendor was a little ahead of its time with SDP, but the market is starting to catch up. Companies are beginning to show interest in SDP as a VPN replacement or VPN alternative.

Meta NaaS has a zero-trust architecture where each user is bound by an SDP. Each user has a unique, fixed identity no matter from where they connect to this network. The SDP security framework allows one-to-one network connections that are dynamically created on demand between the user and the specific resources they need to access. Everything else on the NaaS is invisible to the user. No access is possible unless it is explicitly granted, and it’s continuously verified at the packet level. This model effectively provides dynamically provisioned secure network segmentation.

## SDP tightly controls access to specific resources

This approach works very well when a company wants to securely connect employees, contractors, and external partners to specific resources on the network. For example, one of Meta Networks’ customers is Via Transportation, a New York-based company that has a ride-sharing platform. The company operates its own ride-sharing services in various cities in North America and Europe, and it licenses its technology to other transit systems around the world.

Via’s operations are completely cloud-native, and so it has no legacy-style site-based WAN to connect its 400-plus employees and contractors to their cloud-based applications. Via’s partners, primarily transportation operators in different cities and countries, also need controlled access to specific portions of Via’s software platform to manage rideshares. Giving each group of users access to the applications they need — and _only_ to the ones they specifically need – was a challenge using a VPN. Using the Meta NaaS instead gives Via more granular control over who has what access.

**[[Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][5] ]**

Via’s employees with managed devices connect to the Meta NaaS using client software on the device, and they are authenticated using Okta and a certificate. Contractors and customers with unmanaged devices use a browser-based access solution from Meta that doesn’t require installation or setup. New users can be on-boarded quickly and assigned granular access policies based on their role. Integration with Okta provides information that facilitates identity-based access policies. Once users connect to the network, they can see only the applications and network resources that their policy allows; everything else is invisible to them under the SDP architecture.

For Via, there are several benefits to the Meta NaaS approach. First and foremost, the company doesn’t have to own or operate its own WAN infrastructure. Everything is a managed service located in the cloud — the same business model that Via itself espouses. Next, this solution scales easily to support the company’s growth. Meta’s security integrates with Via’s existing identity management system, so identities and access policies can be centrally managed. And finally, the software-defined perimeter hides resources from unauthorized users, creating security by obscurity.

## Tightening security even further

Meta Networks further tightens the security around the user by doing device posture checks — “NAC lite,” if you will. A customer can define the criteria that devices have to meet before they are allowed to connect to the NaaS. For example, the check could be whether a security certificate is installed, if a registry key is set to a specific value, or if anti-virus software is installed and running. It’s one more way to enforce company policies on network access.

When end users use the browser-based method to connect to the Meta NaaS, all activity is recorded in a rich log so that everything can be audited, but also to set alerts and look for anomalies. This data can be exported to a SIEM if desired, but Meta has its own notification and alert system for security incidents.

Meta Networks recently implemented some new features around management, including smart groups and support for the System for Cross-Domain Identity Management (SCIM) protocol. The smart groups feature provides the means to add an extra notation or tag to elements such as devices, services, network subnets or segments, and basically everything that’s in the system. These tags can then be applied to policy. For example, a customer could label some of their services as a production, staging, or development environment. Then a policy could be implemented to say that only sales people can access the production environment. Smart groups are just one more way to get even more granular about policy.

The SCIM support makes on-boarding new users simple. SCIM is a protocol that is used to synchronize and provision users and identities from a third-party identity provider such as Okta, Azure AD, or OneLogin. A customer can use SCIM to provision all the users from the IdP into the Meta system, synchronize in real time the groups and attributes, and then use that information to build the access policies inside Meta NaaS.

These and other security features fit into Meta Networks’ vision that the security perimeter goes with you no matter where you are, and the perimeter includes everything that was formerly delivered through the data center. It is delivered through the cloud to your client device with always-on security. It’s a broad approach to SDP and a unique approach to NaaS.

**Reviews: 4 free, open-source network monitoring tools**

  * [Icinga: Enterprise-grade, open-source network-monitoring that scales][6]
  * [Nagios Core: Network-monitoring software with lots of plugins, steep learning curve][7]
  * [Observium open-source network monitoring tool: Won’t run on Windows but has a great user interface][8]
  * [Zabbix delivers effective no-frills network monitoring][9]



Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3385531/meta-networks-builds-user-security-into-its-network-as-a-service.html#tk.rss_all

作者：[Linda Musthaler][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Linda-Musthaler/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/10/firewall_network-security_lock_padlock_cyber-security-100776989-large.jpg
[2]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.metanetworks.com/
[5]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[6]: https://www.networkworld.com/article/3273439/review-icinga-enterprise-grade-open-source-network-monitoring-that-scales.html?nsdr=true#nww-fsb
[7]: https://www.networkworld.com/article/3304307/nagios-core-monitoring-software-lots-of-plugins-steep-learning-curve.html
[8]: https://www.networkworld.com/article/3269279/review-observium-open-source-network-monitoring-won-t-run-on-windows-but-has-a-great-user-interface.html?nsdr=true#nww-fsb
[9]: https://www.networkworld.com/article/3304253/zabbix-delivers-effective-no-frills-network-monitoring.html
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
