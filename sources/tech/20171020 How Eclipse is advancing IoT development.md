How Eclipse is advancing IoT development
============================================================

### Open source organization's modular approach to development is a good match for the Internet of Things.

![How Eclipse is advancing IoT development](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_BUS_ArchitectureOfParticipation_520x292.png?itok=FA0Uuwzv "How Eclipse is advancing IoT development")
Image by : opensource.com

[Eclipse][3] may not be the first open source organization that pops to mind when thinking about Internet of Things (IoT) projects. After all, the foundation has been around since 2001, long before IoT was a household word, supporting a community for commercially viable open source software development.

September's Eclipse IoT Day, held in conjunction with RedMonk's [ThingMonk 2017][4] event, emphasized the big role Eclipse is taking in [IoT development][5]. It currently hosts 28 projects that touch a wide range of IoT needs and projects. While at the conference, I talked with [Ian Skerritt][6], who heads marketing for Eclipse, about Eclipse's IoT projects and how Eclipse thinks about IoT more broadly.

### What's new about IoT?

I asked Ian how IoT is different from traditional industrial automation, given that sensors and tools have been connected in factories for the past several decades. Ian notes that many factories still are not connected.

Additionally, he says, "SCADA [supervisory control and data analysis] systems and even the factory floor technology are very proprietary, very siloed. It's hard to change it. It's hard to adapt to it… Right now, when you set up a manufacturing run, you need to manufacture hundreds of thousands of that piece, of that unit. What [manufacturers] want to do is to meet customer demand, to have manufacturing processes that are very flexible, that you can actually do a lot size of one." That's a big piece of what IoT is bringing to manufacturing.

### Eclipse's approach to IoT

He describes Eclipse's involvement in IoT by saying: "There's core fundamental technology that every IoT solution needs," and by using open source, "everyone can use it so they can get broader adoption." He says Eclipse see IoT as consisting of three connected software stacks. At a high level, these stacks mirror the (by now familiar) view that IoT can usually be described as spanning three layers. A given implementation may have even more layers, but they still generally map to the functions of this three-layer model:

*   A stack of software for constrained devices (e.g., the device, endpoint, microcontroller unit (MCU), sensor hardware).

*   Some type of gateway that aggregates information and data from the different sensors and sends it to the network. This layer also may take real-time actions based on what the sensors are observing.

*   A software stack for the IoT platform on the backend. This backend cloud stores the data and can provide services based on collected data, such as analysis of historical trends and predictive analytics.

The three stacks are described in greater detail in Eclipse's whitepaper "[The Three Software Stacks Required for IoT Architectures][7]."

Ian says that, when developing a solution within those architectures, "there's very specific things that need to be built, but there's a lot of underlying technology that can be used, like messaging protocols, like gateway services. It needs to be a modular approach to scale up to the different use cases that are up there." This encapsulates Eclipse's activities around IoT: Developing modular open source components that can be used to build a range of business-specific services and solutions.

### Eclipse's IoT projects

Of Eclipse's many IoT projects currently in use, Ian says two of the most prominent relate to [MQTT][8], a machine-to-machine (M2M) messaging protocol for IoT. Ian describes it as "a publish‑subscribe messaging protocol that was designed specifically for oil and gas pipeline monitoring where power-management network latency is really important. MQTT has been a great success in terms of being a standard that's being widely adopted in IoT." [Eclipse Mosquitto][9] is MQTT's broker and [Eclipse Paho][10] its client.

[Eclipse Kura][11] is an IoT gateway that, in Ian's words, "provides northbound and southbound connectivity [for] a lot of different protocols" including Bluetooth, Modbus, controller-area network (CAN) bus, and OPC Unified Architecture, with more being added all the time. One benefit, he says, is "instead of you writing your own connectivity, Kura provides that and then connects you to the network via satellite, via Ethernet, or anything." In addition, it handles firewall configuration, network latency, and other functions. "If the network goes down, it will store messages until it comes back up," Ian says.

A newer project, [Eclipse Kapua][12], is taking a microservices approach to providing different services for an IoT cloud platform. For example, it handles aspects of connectivity, integration, management, storage, and analysis. Ian describes it as "up and coming. It's not being deployed yet, but Eurotech and Red Hat are very active in that."

Ian says [Eclipse hawkBit][13], which manages software updates, is one of the "most intriguing projects. From a security perspective, if you can't update your device, you've got a huge security hole." Most IoT security disasters are related to non-updated devices, he says. "HawkBit basically manages the backend of how you do scalable updates across your IoT system."

Indeed, the difficulty of updating software in IoT devices is regularly cited as one of its biggest security challenges. IoT devices aren't always connected and may be numerous, plus update processes for constrained devices can be hard to consistently get right. For this reason, projects relating to updating IoT software are likely to be important going forward.

### Why IoT is a good fit for Eclipse

One of the trends we've seen in IoT development has been around building blocks that are integrated and applied to solve particular business problems, rather than monolithic IoT platforms that apply across industries and companies. This is a good fit with Eclipse's approach to IoT, which focuses on a number of modular stacks; projects that provide specific and commonly needed functions; and brokers, gateways, and protocols that can tie together the components needed for a given implementation.

--------------------------------------------------------------------------------

作者简介：

Gordon Haff - Gordon Haff is Red Hat’s cloud evangelist, is a frequent and highly acclaimed speaker at customer and industry events, and helps develop strategy across Red Hat’s full portfolio of cloud solutions. He is the author of Computing Next: How the Cloud Opens the Future in addition to numerous other publications. Prior to Red Hat, Gordon wrote hundreds of research notes, was frequently quoted in publications like The New York Times on a wide range of IT topics, and advised clients on product and...

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/10/eclipse-and-iot

作者：[Gordon Haff ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ghaff
[1]:https://opensource.com/article/17/10/eclipse-and-iot?rate=u1Wr-MCMFCF4C45IMoSPUacCatoqzhdKz7NePxHOvwg
[2]:https://opensource.com/user/21220/feed
[3]:https://www.eclipse.org/home/
[4]:http://thingmonk.com/
[5]:https://iot.eclipse.org/
[6]:https://twitter.com/ianskerrett
[7]:https://iot.eclipse.org/resources/white-papers/Eclipse%20IoT%20White%20Paper%20-%20The%20Three%20Software%20Stacks%20Required%20for%20IoT%20Architectures.pdf
[8]:http://mqtt.org/
[9]:https://projects.eclipse.org/projects/technology.mosquitto
[10]:https://projects.eclipse.org/projects/technology.paho
[11]:https://www.eclipse.org/kura/
[12]:https://www.eclipse.org/kapua/
[13]:https://eclipse.org/hawkbit/
[14]:https://opensource.com/users/ghaff
[15]:https://opensource.com/users/ghaff
[16]:https://opensource.com/article/17/10/eclipse-and-iot#comments
