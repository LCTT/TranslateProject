[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IoT security essentials: Physical, network, software)
[#]: via: (https://www.networkworld.com/article/3435108/iot-security-essentials-physical-network-software.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

IoT security essentials: Physical, network, software
======
Internet of things devices present unique security problems due to being spread out, exposed to physical attacks and often lacking processor power.
Thinkstock

Even in the planning stages of a deployment, IoT security is one of the chief stumbling blocks to successful adoption of the technology.

And while the problem is vastly complicated, there are three key angles to think about when laying out how IoT sensors will be deployed in any given setup: How secure are the device themselves, how many are there and can they receive security patches.

### Physical access

Physical access is an important but, generally, straightforward consideration for traditional IT security. Data centers can be carefully secured, and routers and switches are often located in places where they’re either difficult to fiddle with discreetly or difficult to access in the first place.

Where IoT is concerned, however, best security practices aren’t as fleshed out. Some types of IoT implementation could be relatively simple to secure – a bad actor could find it comparatively difficult to tinker with a piece of complex diagnostic equipment in a well-secured hospital, or a big piece of sophisticated robotic manufacturing equipment on an access-controlled factory floor. Compromises can happen, certainly, but a bad actor trying to get into a secure area is still a well-understood security threat.

By contrast, smart city equipment scattered across a metropolis – traffic cameras, smart parking meters, noise sensors and the like – is readily accessible by the general public, to say nothing of anybody able to look convincing in a hard hat and hazard vest. The same issue applies to soil sensors in rural areas and any other technology deployed to a sufficiently remote location.

The solutions to this problem vary. Cases and enclosures could deter some attackers, but they might not be practical in some instances. The same goes for video surveillance of the devices, which could become a target itself. The IoT Security Foundation recommends disabling all ports on a device that aren’t strictly necessary for it perform its function, implementing tamper-proofing on circuit boards, and even embedding those circuits entirely in resin.

### Discovery and networking

Securing the connections between IoT sensors and the backend is arguably the toughest part to solve, in part because an alarming number of organizations aren’t even aware of all the devices on their network at any given time. Hence, device discovery remains a critically important part of network security for IoT.

**[ [Prepare to become a Certified Information Security Systems Professional with this comprehensive online course from PluralSight. Now offering a 10-day free trial!][1] ]**

The main reason for this lack of visibility is that the nature of IoT as an operational technology, rather than one that’s solely administered by IT staff, means that line-of-business personnel will sometimes connect helpful devices to the network without telling the people in charge of keeping the network secure. For network **operations** people, used to having a clear sense of the entire network’s topology, this can be an unaccustomed headache.

Beyond IT personnel working closely with the operational side of the business to ensure all devices connected to the network are properly provisioned and monitored, network scanners can discover connected devices on a network automatically, whether that’s via network traffic analysis, device profiles, whitelists or other techniques.

### Software patching

Many IoT sensors don’t have a lot of built-in computing capability, so some of those devices aren’t able to run a security-software agent nor accept updates and patches remotely.

That is a huge worry, because there are software vulnerabilities being discovered every day that target the IoT. An inability to patch those holes when they’re discovered is a serious problem.

Moreover, certain devices simply won’t be able to be properly secured and made patchable. The only solution might be to find a different product that accomplishes the functional task yet has better security.

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3435108/iot-security-essentials-physical-network-software.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
