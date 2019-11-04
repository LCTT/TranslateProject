[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Big Four carriers want to rule IoT by simplifying it)
[#]: via: (https://www.networkworld.com/article/3449820/big-four-carriers-want-to-rule-iot-by-simplifying-it.html)
[#]: author: (Jon Gold https://www.networkworld.com/author/Jon-Gold/)

Big Four carriers want to rule IoT by simplifying it
======
A look at some of the pros and cons of IoT services from AT&T, Sprint, T-Mobile and Verizon
Natalya Burova / Getty Images

The [Internet of Things][1] promises a transformative impact on a wide range of industries, but along with that promise comes an enormous new level of complexity for the network and those in charge of maintaining it. For the major mobile data carriers in the U.S., that fact suggests an opportunity.

The core of the carriers’ appeal for IoT users is simplicity. Opting for Verizon or AT&amp;T instead of in-house connectivity removes a huge amount of the work involved in pulling an IoT implementation together.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][2]

Operationally, it’s the same story. The carrier is handling the network management and security functionality, and everything involved in the connectivity piece is available through a centralized management console.

[][3]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][3]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

The carriers’ approach to the IoT market is two-pronged, in that they sell connectivity services directly to end-users as well as selling connectivity wholesale to device makers. For example, one customer might buy a bunch of sensors directly from Verizon, while another might buy equipment from a specialist manufacturer that contracts with Verizon to provide connectivity.

There are, experts agree, numerous advantages to simply handing off the wireless networking of an IoT project to a major carrier. Licensed networks are largely free of interference – the carriers own the exclusive rights to the RF spectrum being used in a designated area, so no one else is allowed to use it without risking the wrath of the FCC. In contrast, a company using unlicensed technologies like Wi-Fi might be competing for the same spectrum area with half a dozen other organizations.

It’s also better-secured than most unlicensed technologies or at least easier to secure, according to former chair of the IEEE’s IoT [smart cities][4] working group Shawn Chandler. Buying connectivity services that will have to be managed and secured in-house can be a lot more work than letting one of the carriers take care of it.

“If you’re going to use mesh networks and RF networks,” he said, “then the enterprise is looking at [buying] a full security solution.”

There are, of course, downsides as well. Plenty of businesses with a lot of institutional experience on the networking side are going to have trust issues with handing over control of mission-critical networks to a third party, said 451 Research vice president Christian Renaud.

“For someone to come in over the top with, ‘Oh we’ll manage everything for you,’” he said, might draw a response along the lines of, “Wait, what?” from the networking staff. Carriers promise a lot of visibility into the logical relationships between endpoints, edge modules and the cloud – but the actual topology of the network itself may be abstracted out.

And despite a generally higher level of security, carrier networks aren’t completely bulletproof. Several research teams have demonstrated attack techniques that, although unlikely to be seen in the wild, at least have the potential to compromise modern LTE networks. An example: researchers at Ruhr-University Bochum in 2018 [published a paper detailing potential attack vectors][5] that could allow a bad actor to target unencrypted metadata, which details users connected to a given mobile node, in order to spoof DNS requests.

Nevertheless, carriers are set to play a crucially important part in the future evolution of enterprise IoT, and each of the big four U.S. carriers has a robust suite of offerings.

### T-Mobile

T-Mobile’s focus is on asset tracking, smart city technology, smart buildings and vehicular fleet management, which makes sense, given that those areas are a natural fit for carrier-based IoT. All except smart buildings require a large geographical coverage area, and the ability to bring a large number of diverse endpoints from diverse sources onto the network is a strength.

The company also runs the CONNECT partner program, aimed at makers of IoT solutions who want to use T-Mobile’s network for connectivity. It offers the option to sell hardware, software or specialist IoT platforms through the main T-Mobile for Business program, as well as, of course, close technical integration with T-Mobile’s network.

Finally, T-Mobile offers the option of using [narrow-band IoT technology, or NB-IoT][6]. This refers to the practice of using a small slice of the network’s spectrum to provide low-throughput connectivity to a large number of devices at the same time. It’s purpose-built for IoT, and although it won’t work for something like streaming video, where a lot of data has to be moved quickly, it’s well-suited to an asset tracking system that merely has to send brief status reports. The company even sells five-dollar systems-on-a-chip in bulk for organizations that want to integrate existing hardware or sensors into T-Mobile’s network.

### AT&amp;T

Like the rest of the big four, AT&amp;T does business both by selling their own IoT services – most of it under the umbrella of the Multi-Network Connect platform, a single pane of glass offering designed to streamline the management of many types of IoT product – and by partnering with an array of hardware and other product makers who want to use the company’s network.

Along with NB-IoT, AT&amp;T provides LTE-M connectivity, a similar but slightly more capable IoT-focused network technology that adds voice support and more throughput to the NB-IoT playbook. David Allen, director of advanced product development at AT&amp;T’s advanced mobility and enterprise solutions division, said that LTE-M and NB-IoT are powerful tools in the company’s IoT arsenal.

“These are small slivers of spectrum that offer an instant national footprint,” he said.

MNC is advertised as a broad-based platform that can bring together input from nearly any type of licensed network, from 2G up through satellite, and even integrate with other connectivity management platforms – so a company that uses multiple operators could bring trhem all under the roof of MNC.

### Verizon

Verizon’s IoT platform, and the focus of its efforts to do business in the IoT realm is Thingspace, which is similar to AT&amp;T’s MNC in many respects. The company also offers both NB-IoT and LTE-M for flexible IoT-specific connectivity options, as well as support for traditional SIM-based networking. As with the rest of the big four, Verizon also sells connectivity services to third parties.

While the company said that it doesn’t break down its IoT business into third-party/first-party sales, Verizon says it has had success in several verticals, including telematics for the energy and healthcare industries. The first use case involves using current sensors on the grid and smart meters at the home to study sustainability and track usage more closely. The second involves working on remote monitoring of patient data, and the company said it will hav announcements around that in the future.

While the focus is obviously on connectivity, Verizon also does something slightly unusual for the carrier IoT market by selling a one-size-fits-most sensor of its own creation, called the Critical Asset Sensor. This is a small sensor module that contains acceleration, temperature, pressure, light, humidity and shock sensors, along with GPS and network connectivity, so that it can fit a huge variety of IoT use cases. The idea is that they can be bought in bulk for an IoT implementation direct from Verizon, obviating the need to deal with a separate sensor vendor.

### Sprint

Sprint’s IoT offerings are partially provided under the umbrella of the company’s IoT Factory store, and the emphasis has been on various types of sensor-based service, including restaurant and food-service storage temperatures, smart building solutions for offices and other commercial property, as well as fleet management for terrestrial and marine vehicles.

Most of these are offered through Sprint via partnerships with vertical specialists in those areas, like Apptricity, CU Trak, M2M in Motion and Rently, among many others.

The company also has a dedicated IoT platform offering called Curiosity IoT, which leans on [Arm’s][7] platform security and connectivity management for basic functionality, but it promises most of the same functionality as the other Big Four vendors’ platforms. It provides a single pane of glass that integrates management and monitoring for every sensor on the network and shapes data into a standardized format for analysis on the back end.

Join the Network World communities on [Facebook][8] and [LinkedIn][9] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3449820/big-four-carriers-want-to-rule-iot-by-simplifying-it.html

作者：[Jon Gold][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Jon-Gold/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3207535/what-is-iot-how-the-internet-of-things-works.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[4]: https://www.networkworld.com/article/3411561/report-smart-city-iot-isnt-smart-enough-yet.html
[5]: https://alter-attack.net/media/breaking_lte_on_layer_two.pdf
[6]: https://www.networkworld.com/article/3227206/faq-what-is-nb-iot.html
[7]: https://www.networkworld.com/article/3294781/arm-flexes-flexibility-with-pelion-iot-announcement.html
[8]: https://www.facebook.com/NetworkWorld/
[9]: https://www.linkedin.com/company/network-world
