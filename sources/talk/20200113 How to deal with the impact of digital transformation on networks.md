[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to deal with the impact of digital transformation on networks)
[#]: via: (https://www.networkworld.com/article/3512830/how-to-deal-with-the-impact-of-digital-transformation-on-networks.html)
[#]: author: (Zeus Kerravala https://www.networkworld.com/author/Zeus-Kerravala/)

How to deal with the impact of digital transformation on networks
======
To unleash the promise of digital transformation, businesses need to embrace automation and software-defined networking as well as improve security.
Metamorworks / Getty Images

Digital transformation has increased the importance of the network, particularly the edge, where customers, employees, cloud applications and [IoT][1] devices connect to the enterprise. The legacy static and non-differentiated network edge of years past is no longer sufficient for many reasons, so as companies embark on digital-transformation plans, their networks must evolve.

Networking pros should be looking at, among other things, improving security and embracing [software-defined networking][2] (SDN) that supports propagating changes quickly across the network in order to accommodate the many challenges digital transformation creates.

### Digital-transformation hurdles

#### Also in this series:

  * [The state of digital transformation in 2020][3] (CIO)
  * [6 digital transformation success stories][4] (CIO)
  * [What is security's role in digital transformation?][5] (CSO)
  * [How to deal with the impact of digital transformation on networks][6] (Network World)
  * [How to get started with CI/CD][7] (Infoworld)
  * [Making the connection: The role of collaboration apps in digital transformation][8] (Computerworld)



Applications have been reengineered and are moving to public and [private clouds][9], and at the same time applications now rely on services located across clouds. These cloud services are tied together by the network, which must be always available because any disruption of the network means applications won’t perform as expected.

[][10]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][10]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

The internet of things (IoT) has moved out of the operational-technology shadows and has become a core component of most businesses’ digital-transformation strategies. As IoT adoption increases, so will the number of connected endpoints.

Almost all of these devices connect at the network edge, so problems at the edge could significantly impair IoT applications. Historically, network value was considered highest in the [data center][11] and lowest at the edge because the data center is where applications and data resided. IoT changes that and evenly distributes the value of the network.

Wireless advances also have an impact. With [Wi-Fi 6][12] access speeds at parity with wired connections, Wi-Fi is shifting from a convenience to an essential method of connecting to the network. In addition, many mobile and IoT devices are wireless-only – they have no wired interface. The combination of these trends has made Wi-Fi the primary access method, with the edge being where all these devices connect with the company network.

Mobile devices, IoT endpoints and cloud computing have created many new entry points and shifted them to the network edge, which creates new security issues. Legacy networks had a single ingress/egress point, which meant putting a massive [firewall][13] there and scanning all traffic coming and going. Now network security must shift to the network to maximize its effectiveness.

Here’s what to do.

### Automate

Manual processes have been the norm as long as there have been networks, but they will be the death knell for companies if they aren’t replaced by faster, forward-looking automation. First, automation removes a time-consuming burden and enables network engineers to focus on more strategic initiatives.  Also, automating repetitive tasks involved in running a network is the first step in evolving to an [intent-based network][14] where the network responds automatically to admins’ requests.

Many things could be automated, but a good first step would be to automate tasks that are most time consuming, including firmware updates, operating-system upgrades, applying patches and implementing policy changes.

### Embrace SDN for agility

Today’s networks need to be highly agile so changes can be propagated across the network in near real-time, enabling it to keep up with the demands of the business. Network agility comes from having centralized control where configuration changes can be made once and propagated across the network instantly. Ideally, network changes could be coordinated with application changes so the lagging performance doesn’t slow the business down.

Achieving a higher level of agility will likely require a refresh of the infrastructure if the network is more than five years old, and that means adopting SDN. Traditional infrastructure had an integrated control and data plane, so changes had to be made on a box-by-box basis. This is why networks took so long to configure and lacked agility.

With an SDN model, the control plane is separated from the data plane, centralizing control so network engineers define a change and push it out across the entire network at once.

Older equipment isn’t designed to be software-first, so look for infrastructure that is built on a modernized operating system like [Linux][15] and that can be programmed using current languages such as Python and Ruby. 

### Learn the APIs on networking gear

As the network moves to software, it needs to take on software characteristics. One of these is exposed APIs that let the network talk directly to applications, which can create a higher level of automation. For example, a videoconferencing application could signal to the network to reserve bandwidth while a call is taking place and then remove the reserve when the call ends.

Network engineers should seek out infrastructure with a rich set of APIs and, importantly, learn the necessary skills to take advantage of them. Most network engineers have never made an API call and have relied on home-grown scripts. It’s critical to learn modern software skills in order to leverage the simplicity and speed of APIs.

### Intrinsic security

Rather than being implemented as an overlay, intrinsic security is tightly coupled with the network. With this type of security, the network itself acts as a security platform that incorporates a broad ecosystem of best-of-breed tools that can deliver integrated and automated compliance checks, threat detection, and mitigation. Intrinsic security protects networks from the moment a new device is onboarded until its session is terminated.

While the network will never take the place of a next-generation firewall, there is a tremendous amount of security that the network can provide. Because network infrastructure sees all traffic flows, it can gather enough data to determine when traffic deviates from the norm, which could indicate a breach.

For example, if an IoT device communicates with the same cloud service daily and then one day tries to interface with an accounting server, that could signal a malicious intrusion. A network with intrinsic security could quarantine the device and direct a security tool to further diagnose the issue.

### Refresh for success

Success in the digital world requires investment in many new technologies, all of which are highly dependent on the network. Networks currently in place were never designed for the rigors of digital business, and they need to be refreshed but also operated and managed differently. Businesses willing to invest in the network and re-train engineers will maximize their success with digital transformation. Those that don’t will struggle because application performance and user experience will suffer, and the likelihood of a breaches will grow exponentially. 

Join the Network World communities on [Facebook][16] and [LinkedIn][17] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3512830/how-to-deal-with-the-impact-of-digital-transformation-on-networks.html

作者：[Zeus Kerravala][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Zeus-Kerravala/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3207535/what-is-iot-the-internet-of-things-explained.html
[2]: https://www.networkworld.com/article/3209131/what-sdn-is-and-where-its-going.html
[3]: https://www.cio.com/article/3513849/the-state-of-digital-transformation-in-2020.html
[4]: https://www.cio.com/article/3149977/digital-transformation-examples.html
[5]: https://www.csoonline.com/article/3512578/what-is-securitys-role-in-digital-transformation.html
[6]: tmp.QxgkHnwo5h
[7]: https://www.infoworld.com/article/3513499/how-to-get-started-with-ci-cd.html
[8]: https://www.computerworld.com/article/3513363/making-the-connection-the-role-of-collaboration-apps-in-digital-transformation.html
[9]: https://www.networkworld.com/article/2159885/cloud-computing-gartner-5-things-a-private-cloud-is-not.html
[10]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[11]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[12]: https://www.networkworld.com/article/3356838/how-to-determine-if-wi-fi-6-is-right-for-you.html
[13]: https://www.networkworld.com/article/3230457/what-is-a-firewall-perimeter-stateful-inspection-next-generation.html
[14]: https://www.networkworld.com/article/3202699/what-is-intent-based-networking.html
[15]: https://www.networkworld.com/article/3215226/what-is-linux-uses-featres-products-operating-systems.html
[16]: https://www.facebook.com/NetworkWorld/
[17]: https://www.linkedin.com/company/network-world
