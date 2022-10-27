[#]: subject: "What is OpenRAN?"
[#]: via: "https://opensource.com/article/22/9/open-radio-access-networks"
[#]: author: "Stephan Avenwedde https://opensource.com/users/hansic99"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is OpenRAN?
======
Open Radio Access Network defines open standards between the various components of radio access networks.

![4 open music players compared: VLC, QMMP, Clementine, and Amarok][1]

Image by: Opensource.com

If you own and use a smartphone capable of connecting to arbitrary computers all over the world, then you are a user of Radio Access Networks (RAN). A RAN is provided by your cellular provider, and it handles wireless connections between your smartphone and your communication provider.

While your smartphone may be running an open source operating system (Android) and the server you try to access is probably running Linux, there's a lot of proprietary technology in between to make the connection happen. While you may have a basic understanding of how networking works locally, this knowledge stops when you plug a SIM card into your smartphone in order to make a connection with a cell tower possible. In fact, the majority of software and hardware components in and around a cell tower are still closed source, which of course has some drawbacks. This is where OpenRAN comes into play.

The OpenRAN initiative (shorthand for Open Radio Access Network) was started by the [O-Ran Alliance][2], a worldwide community of mobile operators, vendors, and research and academic institutions. The initiative aims to define open standards between the various components of radio access networks. Interoperability between components of different manufacturers was not possible. Until now.

### Radio Access Network

But what exactly is a RAN? In a nutshell, a RAN establishes a wireless connection to devices (smartphones, for example) and connects them to the core network of the communication company. In the context of a RAN, devices are denoted as User Equipment (UE).

The tasks of a RAN can be summarized as follows:

* Authentication of UE
* The handover of UE to another RAN (if the UE is moving)
* Forwarding the data between the UE and the core network
* Provision of the data for accounting functions (billing of services or the transmitted data)
* Control of access to the various services

### OpenRAN

RAN usually consists of proprietary components. OpenRAN defines functional units and interfaces between them:

* Radio Unit (RU): The RU is connected to the antenna and sends, receives, amplifies, and digitizes radio signals.
* Distributed Unit (DU): Handles the [PHY][3], [MAC][4] and [RLC][5] layer.
* Centralised Unit (CU): Handles the [RRC][6] and [PDCP][7] layer.
* RAN Intelligent Controller (RIC): Control and optimization of RAN elements and resources.

Units are connected to each other by standardized, open interfaces. Furthermore, if the units can be virtualized and deployed in the cloud or on an [edge device][8], then it's called a **vRAN** (virtual Radio Access Network). The basic principle of vRAN is to decouple the hardware from the software by using a software-based virtualization layer. Using a vRAN improves flexibility in terms of scalability and the underlying hardware.

### OpenRAN for everyone

By the definition of functional units and the interfaces between them, OpenRAN enables interoperability of components from different manufacturers. This reduces the dependency for cellular providers of specific vendors and makes communication infrastructure more flexible and resilient. As a side-effect, using clearly defined functional units and interfaces drives innovation and competition. With vRAN, the use of standard hardware is possible. With all these advantages, OpenRAN is a prime example of how open source benefits everyone.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/open-radio-access-networks

作者：[Stephan Avenwedde][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/osdc-lead-stereo-radio-music.png
[2]: https://www.o-ran.org/
[3]: https://en.wikipedia.org/wiki/Physical_layer#PHY
[4]: https://en.wikipedia.org/wiki/Medium_access_control
[5]: https://en.wikipedia.org/wiki/Radio_Link_Control
[6]: https://en.wikipedia.org/wiki/Radio_Resource_Control
[7]: https://en.wikipedia.org/wiki/Packet_Data_Convergence_Protocol
[8]: https://www.redhat.com/en/topics/edge-computing/what-is-edge-computing?intcmp=7013a000002qLH8AAM
