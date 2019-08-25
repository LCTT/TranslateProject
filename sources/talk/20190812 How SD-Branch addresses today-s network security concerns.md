[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How SD-Branch addresses today’s network security concerns)
[#]: via: (https://www.networkworld.com/article/3431166/how-sd-branch-addresses-todays-network-security-concerns.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

How SD-Branch addresses today’s network security concerns
======
New digital technologies such as IoT at remote locations increase the need to identify devices and monitor network activity. That’s where SD-Branch can help, says Fortinet’s John Maddison.
![KontekBrothers / Getty Images][1]

Secure software-defined WAN (SD-WAN) has become one of the hottest new technologies, with some reports claiming that 85% of companies are actively considering [SD-WAN][2] to improve cloud-based application performance, replace expensive and inflexible fixed WAN connections, and increase security.

But now the industry is shifting to software-defined branch ([SD-Branch][3]), which is broader than SD-WAN but introduced several new things for organizations to consider, including better security for new digital technologies. To understand what's required in this new solution set, I recently sat down with John Maddison, Fortinet’s executive vice president of products and solutions.

**[ Learn more: [SD-Branch: What it is, and why you'll need it][3] | Get regularly scheduled insights: [Sign up for Network World newsletters][4] ]**

### Zeus Kerravala: To get started, what exactly is SD-Branch?

**John Maddison:** To answer that question, let’s step back and look at the need for a secure SD-WAN solution. Organizations need to expand their digital transformation efforts out to their remote locations, such as branch offices, remote school campuses, and retail locations. The challenge is that today’s networks and applications are highly elastic and constantly changing, which means that the traditional fixed and static WAN connections to their remote offices, such as [MPLS][5], can’t support this new digital business model.

That’s where SD-WAN comes in. It replaces those legacy, and sometimes quite expensive, connections with flexible and intelligent connectivity designed to optimize bandwidth, maximize application performance, secure direct internet connections, and ensure that traffic, applications, workflows, and data are secure.

However, most branch offices and retail stores have a local LAN behind that connection that is undergoing rapid transformation. Internet of things (IoT) devices, for example, are being adopted at remote locations at an unprecedented rate. Retail shops now include a wide array of connected devices, from cash registers and scanners to refrigeration units and thermostats, to security cameras and inventory control devices. Hotels monitor room access, security and safety devices, elevators, HVAC systems, and even minibar purchases. The same sort of transformation is happening at schools, branch and field offices, and remote production facilities.

![John Maddison, executive vice president, Fortinet][6]

The challenge is that many of these environments, especially these new IoT and mobile end-user devices, lack adequate safeguards. SD-Branch extends the benefits of the secure SD-WAN’s security and control functions into the local network by securing wired and wireless access points, monitoring and inspecting internal traffic and applications, and leveraging network access control (NAC) to identify the devices being deployed at the branch and then dynamically assigning them to network segments where they can be more easily controlled.

### What unique challenges do remote locations, such as branch offices, schools, and retail locations, face? 

Many of the devices being deployed at these remote locations need access to the internal network, to cloud services, or to internet resources to operate. The challenge is that IoT devices, in particular, are notoriously insecure and vulnerable to a host of threats and exploits. In addition, end users are connecting a growing number of unauthorized devices to the office. While these are usually some sort of personal smart device, they can also include anything from a connected coffee maker to a wireless access point.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][7] ]**

Any of these, if connected to the network and then exploited, not only represent a threat to that remote location, but they can also be used as a door into the larger core network. There are numerous examples of vulnerable point-of-sale devices or HVAC systems being used to tunnel back into the organization’s data center to steal account and financial information.

Of course, these issues might be solved by adding a number of additional networking and security technologies to the branch, but most IT teams can’t afford to put IT resources onsite to deploy and manage these solutions, even temporarily. What’s needed is a security solution that combines traffic scanning and security enforcement, access control for both wired and wireless connections, device recognition, dynamic segmentation, and integrated management in a single low-touch/no-touch device. That’s where SD-Branch comes in.

### Why aren't traditional branch solutions, such as integrated routers, solving these challenges? 

Most of the solutions designed for branch and retail locations predate SD-WAN and digital transformation. As a result, most do not provide support for the sort of flexible SD-WAN functionality that today’s remote locations require. In addition, while they may claim to provide low-touch deployment and management, the experience of most organizations tells a different story. Complicating things further, these solutions provide little more than a superficial integration between their various services.

For example, few if any of these integrated devices can manage or secure the wired and wireless access points deployed as part of the larger branch LAN, provide device recognition and network access control, scan network traffic, or deliver the sort of robust security that today’s networks require. Instead, many of these solutions are little more than a collection of separate limited networking, connectivity, and security elements wrapped in a piece of sheet metal that all require separate management systems, providing little to no control for those extended LAN environments with their own access points and switches – which adds to IT overhead rather than reducing it.

### What role does security play in an SD-Branch? 

Security is a critical element of any branch or retail location, especially as the ongoing deployment of IoT and end-user devices continues to expand the potential attack surface. As I explained before, IoT devices are a particular concern, as they are generally quite insecure, and as a result, they need to be automatically identified, segmented, and continuously monitored for malware and unusual behaviors.

But that is just part of the equation. Security tools need to be integrated into the switch and wireless infrastructure so that networking protocols, security policies, and network access controls can work together as a single system. This allows the SD-Branch solution to identify devices and dynamically match them to security policies, inspect applications and workflows, and dynamically assign devices and traffic to their appropriate network segment based on their function and role.

The challenge is that there is often no IT staff on site to set up, manage, and fine-tune a system like this. SD-Branch provides these advanced security, access control, and network management services in a zero-touch model so they can be deployed across multiple locations and then be remotely managed through a common interface.

### Security teams often face challenges with a lack of visibility and control at their branch offices. How does SD-Branch address this? 

An SD-Branch solution seamlessly extends an organization's core security into the local branch network. For organizations with multiple branch or retail locations, this enables the creation of an integrated security fabric operating through a single pane of glass management system that can see all devices and orchestrate all security policies and configurations. This approach allows all remote locations to be dynamically coordinated and updated, supports the collection and correlation of threat intelligence from every corner of the network – from the core to the branch to the cloud – and enables a coordinated response to cyber events that can automatically raise defenses everywhere while identifying and eliminating all threads of an attack.

Combining security with switches, access points, and network access control systems means that every connected device can not only be identified and monitored, but every application and workflow can also be seen and tracked, even if they travel across or between the different branch and cloud environments.

### How is SD-Branch related to secure SD-WAN?

SD-Branch is a natural extension of secure SD-WAN. We are finding that once an organization deploys a secure SD-WAN solution, they quickly discover that the infrastructure behind that connection is often not ready to support their digital transformation efforts. Every new threat vector adds additional risk to their organization.

While secure SD-WAN can see and secure applications running to or between remote locations, the applications and workflows running inside those branch offices, schools, or retail stores are not being recognized or properly inspected. Shadow IT instances are not being identified. Wired and wireless access points are not secured. End-user devices have open access to network resources. And IoT devices are expanding the potential attack surface without corresponding protections in place. That requires an SD-Branch solution.

Of course, this is about much more than the emergence of the next-gen branch. These new remote network environments are just another example of the new edge model that is extending and replacing the traditional network perimeter. Cloud and multi-cloud, mobile workers, 5G networks, and the next-gen branch – including offices, retail locations, and extended school campuses – are all emerging simultaneously. That means they all need to be addressed by IT and security teams at the same time. However, the traditional model of building a separate security strategy for each edge environment is a recipe for an overwhelmed IT staff. Instead, every edge needs to be seen as part of a larger, integrated security strategy where every component contributes to the overall health of the entire distributed network.

With that in mind, adding SD-Branch solutions to SD-WAN deployments not only extends security deep into branch office and other remote locations, but they are also a critical component of a broader strategy that ensures consistent security across all edge environments, while providing a mechanism for controlling operational expenses across the entire distributed network through central management, visibility, and control.

**[ For more on IoT security, see [our corporate guide to addressing IoT security concerns][8]. ]**

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3431166/how-sd-branch-addresses-todays-network-security-concerns.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/07/cio_cw_distributed_decentralized_global_network_africa_by_kontekbrothers_gettyimages-1004007018_2400x1600-100802403-large.jpg
[2]: https://www.networkworld.com/article/3031279/sd-wan-what-it-is-and-why-you-ll-use-it-one-day.html
[3]: https://www.networkworld.com/article/3250664/sd-branch-what-it-is-and-why-youll-need-it.html
[4]: https://www.networkworld.com/newsletters/signup.html
[5]: https://www.networkworld.com/article/2297171/network-security-mpls-explained.html
[6]: https://images.idgesg.net/images/article/2019/08/john-maddison-_fortinet-square-100808017-small.jpg
[7]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[8]: https://www.networkworld.com/article/3269165/internet-of-things/a-corporate-guide-to-addressing-iot-security-concerns.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
