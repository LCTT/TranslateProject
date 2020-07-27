[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to tailor SASE to your enterprise)
[#]: via: (https://www.networkworld.com/article/3568630/how-to-tailor-sase-to-your-enterprise.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

How to tailor SASE to your enterprise
======
Secure access service edge is a well-defined model, but there are variations that achieve the same ends and give businesses flexibility to meet their larger goals.
Natali Mis / Getty Images

Businesses considering the secure access service edge (SASE) model need to understand that there are numerous ways to implement it that can be tailored to their future needs and the realities of their legacy networks.

As defined by Gartner, which coined the term, SASE calls for security to be built in as part of the network and delivered as a cloud service, but that might not fit the circumstances faced by all enterprises.

**READ about SD-WAN**: [How to buy SD-WAN technology: Key questions to consider when selecting a supplier][1] • [How to pick an off-site data-backup method][2] •  [SD-Branch: What it is and why you’ll need it][3] • [What are the options for security SD-WAN?][4]

Depending on their needs, it may make more sense to have SASE delivered as a managed service package or even in an architecture that includes privately owned security infrastructure that is managed from the cloud – alternatives that can achieve the same goals.

### Understanding SASE options

SASE is the next step for [wide area network (WAN)][5] transformation. Current WAN architecture has largely remained the same for the better part of four decades. [SD-WANs][6] were a big leap forward and made the network more efficient but did not transform it. SASE optimizes it for current trends such as cloud, mobility and even the rise in work from home induced by COVID-19.

One issue with SD-WAN is that it creates new security challenges. For example, SD-WANs make it simple to configure a [split tunnel][7] from a branch office so workers can have direct access to the cloud instead of having to go over the corporate WAN and out to the [data center][8].  This improves user experience and uses the network more efficiently, but it also creates a huge security hole.

One way to fix it would be to put a firewall in every branch office, but that’s expensive and creates an operational headache because keeping dozens or even hundreds of firewalls in sync is difficult, if not impossible. 

SASE addresses this by integrating security capabilities into the network so they become a network service. Management of security and networking is done via the cloud so administrators can make a change once and push it to every location at once. 

Integrating security and networking doesn’t just evolve the WAN but transforms it. Traditional WANs, SD-WANs included, connect and secure branch offices and company locations. SASE enables businesses to connect remote workers, IoT endpoints and anything else that needs to connect.

For businesses considering SASE, it’s important to understand that there are numerous ways of consuming it. Here are a few.

### Cloud-native SASE

Following the Gartner definition, cloud-native SASE is where all network and security services are made available via the cloud. The only on-premises infrastructure is a lightweight hardware device similar to a home router that directs the connection to the cloud node.

Recently, a few SASE vendors have released software clients enabling a computer or IoT endpoint to connect directly to the cloud, obviating the need for additional hardware.

The benefit of this approach is that any location as small as a single device can have enterprise-grade security and network services. The downside is that for large locations, SASE generates a significant amount of network traffic as all security inspection is done in the cloud. Cloud-native SASE is best suited for highly distributed organizations with many small locations. Insurance companies and retailers are good examples.

### Cloud-managed on-premises SASE

The world may have gone cloud crazy, but there is still a role for on-premises infrastructure. With SASE managed from the cloud, each location would have its own router, firewall, unified threat management (UTM) and other security appliances. Managing them from the cloud is critical to success because it provides the ease of use of cloud-native SASE.

The big benefit is that all security inspection is done locally, improving the performance of large sites. A big downside is obviously the cost of supplying each location with hardware.

Another benefit is that this approach offers some level of investment protection. If the organization recently purchased on-premises infrastructure, it may not be ready to toss it out. Shifting to a cloud-managed approach enables companies to keep using their relatively new routers, firewalls and other devices.

Cloud managed on-premises SASE should be used for organizations that have hundreds or thousands of workers in a single location. Manufacturing organizations and healthcare institutions are examples.  Also, companies that prefer a do-it-yourself model should choose this approach.

### Managed SASE

While SASE offers many benefits, it does increase the complexity of the WAN.  Network engineers need to consider things like where to use split tunnels, level of meshing between offices, how to provision security, creating user profiles and other factors. Legacy WANs were inefficient but had fewer considerations.

SASE lets businesses do much more with the network but also rachets up complexity to a level that many organizations may not have the skills to address. Managed SASE has the benefit of allowing a third party that’s well experienced in best practices to configure and run the network. 

The downside is a loss of control.  A recent trend has been for managed service providers to offer co-managed services where the organizations can perform tasks it’s comfortable with and offload other functions to the MSP.  Businesses looking to move quickly to SASE but are highly risk tolerant should look at a managed service.

### Hybrid is an option

Ultimately, most organizations of any significant size will likely take a hybrid approach where a combination of cloud-native and on-premises SASE is used. Consider a global law firm with one or two offices per country, but each location having hundreds of employees. The firm could use on-premises infrastructure for the physical offices but connect home workers with a cloud-native service. Another example is manufacturing organizations that use local infrastructure for large facilities and connects its autonomous vehicles using cloud services.

### Strategies for SASE adoption

A fast path toward SASE may be to shift current infrastructure to being managed by equipment vendors’ cloud-management tools. It’s likely that products madeduring the past couple of years offer such an option, even though customers might not use it today. Using these tools can ensure that policies and configuration parameters easily be ported from a traditional WAN to SASE.

If a cloud-native approach is being considered, see if the vendor offers a path to cloud-managed on-premises infrastructure. This becomes important as the number of corporate locations grows.

At deployment time, businesses may have a number of small locations and prefer a cloud approach.  Over time, if one or more of the locations grows to the point where network overhead is causing problems, the business will want to shift to a cloud-managed on-premises model. Ideally, the vendor would offer a transition plan so that can happen without disruption.

Another key consideration is security. Some of the smaller SASE vendors have their own security stacks, but the customer organization may prefer the comfort of using a name-brand vendor. Many SD-WAN vendors have partnered with the top security companies to round out their SASE capabilities so potential customers should find out what security vendor is involved to make sure they are working with the security vendor of their choice.

Enterprises should ensure their SASE provider has a rich dashboard that provides visibility and analytic capabilities. Although this isn’t part of the Gartner definition, it should be. Networks aren’t static and need to evolve as businesses do. This requires having end-to-end visibility of network traffic patterns, density of users, security policies and other factors

SASE vendors need to provide this so customers can be informed and make changes when needed. Even if a managed service is used, the MSP needs to provide visibility into the environment.  As the axiom goes, you can’t manage or secure what you can’t see, and with SASE it’s critical you see everything.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3568630/how-to-tailor-sase-to-your-enterprise.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3323407/sd-wan/how-to-buy-sd-wan-technology-key-questions-to-consider-when-selecting-a-supplier.html
[2]: https://www.networkworld.com/article/3328488/backup-systems-and-services/how-to-pick-an-off-site-data-backup-method.html
[3]: https://www.networkworld.com/article/3250664/lan-wan/sd-branch-what-it-is-and-why-youll-need-it.html
[4]: https://www.networkworld.com/article/3285728/sd-wan/what-are-the-options-for-securing-sd-wan.html
[5]: https://www.networkworld.com/article/3248989/what-is-a-wan-wide-area-network-definition-and-examples.html
[6]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[7]: https://www.networkworld.com/article/3543298/cisco-others-shine-a-light-on-vpn-split-tunneling.html
[8]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
