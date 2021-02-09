[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (As the networks evolve enterprises need to rethink network security)
[#]: via: (https://www.networkworld.com/article/3531929/as-the-network-evolves-enterprises-need-to-rethink-security.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

As the networks evolve enterprises need to rethink network security
======
Q&A: John Maddison, executive vice president of products for network security vendor Fortinet, discusses how to deal with network security in the digital era.
D3Damon / Getty Images

_Digital innovation is disrupting businesses. Data and applications are at the hub of new business models, and data needs to travel across the extended network at increasingly high speeds without interruption. To make this possible, organizations are radically redesigning their networks by adopting multi-cloud environments, building hyperscale data centers, retooling their campuses, and designing new connectivity systems for their next-gen branch offices. Networks are faster than ever before, more agile and software-driven. They're also increasingly difficult to secure. To understand the challenges and how security needs to change, I recently talked with John Maddison, executive vice president of products for network security vendor Fortinet._

**ZK: As the speed and scale of data escalate, how do the challenges to secure it change?**

JM: Security platforms were designed to provide things like enhanced visibility, control, and performance by monitoring and managing the perimeter. But the traditional perimeter has shifted from being a very closely monitored, single access point to a highly dynamic and flexible environment that has not only expanded outward but inward, into the core of the network as well.

**[ Also see [What to consider when deploying a next generation firewall][1]. | Get regularly scheduled insights by [signing up for Network World newsletters][2]. ]**

**READ MORE:** [The VPN is dying, long live zero trust][3]

Today's perimeter not only includes multiple access points, the campus, the WAN, and the cloud, but also IoT, mobile, and virtual devices that are generating data, communicating with data centers and manufacturing floors, and literally creating thousands of new edges inside an organization. And with this expanded perimeter, there are a lot more places for attacks to get in. To address this new attack surface, security has to move from being a standalone perimeter solution to being fully integrated into the network.

This convergence of security and networking needs to cover SD-WAN, VPN, Wi-Fi controllers, switching infrastructures, and data center environments – something we call security-driven networking. As we see it, security-driven networking is an essential approach for ensuring that security and networking are integrated together into a single system so that whenever the networking infrastructure evolves or expands, security automatically adapts as an integrated part of that environment. And it needs to do this by providing organizations with a new suite of security solutions, including network segmentation, dynamic multi-cloud controls, and [zero-trust network access][3]. And because of the speed of digital operations and the sophistication of today's attacks, this new network-centric security strategy also needs to be augmented with AI-driven security operations.

The perimeter security devices that have been on the market weren't really built to run as part of the internal network, and when you put them there, they become bottlenecks. Customers don't put these traditional security devices in the middle of their networks because they just can't run fast enough. But the result is an open network environment that can become a playground for criminals that manage to breach perimeter defenses. It's why the dwell time for network malware is over six months.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][4] ]**

As you combine networking applications, networking functionality, and security applications together to address this challenge, you absolutely need a different performance architecture. This can't be achieved using the traditional hardware most security platforms rely on.

**ZK: Why can't traditional security devices secure the internal network?**

JM: They simply aren't fast enough. And the ones that come close are prohibitively expensive… For example, internal segmentation not only enables organizations to see and separate all of the devices on their network but also dynamically create horizontal segments that support and secure applications and automated workflows that need to travel across the extended network. Inside the network, you're running at 100 gigs, 400 gigs, that sort of thing. But the interface for a lot of security systems today is just 10 gigs. Even with multiple ports, the device can't handle much more than that without having to spend a fortune… In order to handle today's capacity and performance demands, security needs to be done at network speeds that most security solutions cannot support without specialized content processors.

**ZK: Hyperscale data centers have been growing steadily. What sort of additional security challenges do these environments face?**

JM: Hyperscale architectures are being used to move and process massive amounts of data. A lot of the times, research centers will need to send a payload of over 10 gigabytes – one packet that's 10 gigabytes – to support advanced rendering and modeling projects. Most firewalls today cannot process these large payloads, also known as elephant flows. Instead, they often compromise on their security to let them flow through. Other hyperscale environment examples include financial organizations that need to process transactions with sub-second latency or online gaming providers that need to support massive numbers of connections per second while maintaining high user experience. … [Traditional security platforms] will never be able to secure hyperscale environments, or even worse, the next generation of ultra-fast converged networks that rely on hyperscale and hyperconnectivity to run things like smart cities or smart infrastructures, until they fundamentally change their hardware.

**ZK: Do these approaches introduce new risks or increase the existing risk for these organizations?**

JM: They do both. As the attack surface expands, existing risks often get multiplied across the network. We actually see more exploits in the wild targeting older vulnerabilities than new ones. But cybercriminals are also building new tools designed to exploit cloud environments and modern data centers. They are targeting mobile devices and exploiting IoT vulnerabilities. Some of these attacks are simply revisions of older, tried and true exploits. But many are new and highly sophisticated. We are also seeing new attacks that use machine learning and rely on AI enhancements to better bypass security and evade detection.

To address this challenge, security platforms need to be broad, integrated, and automated.

Broad security platforms come in a variety of form factors so they can be deployed everywhere across the expanding network. Physical hardware enhancements, such as our [security processing units], enable security platforms to be effectively deployed inside high-performance networks, including hyperscale data centers and SD-WAN environments. And virtualized versions need to support private cloud environments as well as all major cloud providers through thorough cloud-native integration.

Next, these security platforms need to be integrated. The security components built into a security platform need to work together as a single solution ­– not the sort of loose affiliation most platforms provide – to enable extremely fast threat intelligence collection, correlation, and response. That security platform also needs to support common standards and APIs so third-party tools can be added and supported. And finally, these platforms need to be able to work together, regardless of their location or form factor, to create a single, unified security fabric. It's important to note that many cloud providers have developed their own custom hardware, such as Google's TPU, Amazon's Inferentia, and Microsoft's Corsica, to accelerate cloud functions. As a result, hardware acceleration on physical security platforms is essential to ensure consistent performance for data moving between physical and cloud environments

And finally, security platforms need to be automated. Support for automated workflows and AI-enhanced security operations can significantly accelerate the speed of threat detection, analysis, and response. But like other processing-intensive functions, such as decrypting traffic for deep inspection, these functions also need specialized and purpose-built processors or they will become innovation-killing bottlenecks.

**ZK: What's next for network security?**

JM: This is just the start. As networking functions begin to converge even further, creating the next generation of smart environments – smart buildings, smart cities, and smart critical infrastructures – the lack of viable security tools capable of inspecting and protecting these hyperfast, hyperconnected, and hyper-scalable environments will seriously impact our digital economy and way of life.

Security vendors need to understand this challenge and begin investing now in developing advanced hardware and security-driven networking technologies. Organizations aren't waiting for vendors to catch up so they can secure their networks of tomorrow. Their networks are being left exposed right now because the software-based security solutions they have in place are just not adequate. And it's up to the security industry to step up and solve this challenge.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3531929/as-the-network-evolves-enterprises-need-to-rethink-security.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3236448/lan-wan/what-to-consider-when-deploying-a-next-generation-firewall.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://www.networkworld.com/article/3487720/the-vpn-is-dying-long-live-zero-trust.html
[4]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
