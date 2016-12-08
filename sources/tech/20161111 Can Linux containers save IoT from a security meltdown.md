### [Can Linux containers save IoT from a security meltdown?][28]

 ![](http://hackerboards.com/files/internet_of_things_wikimedia1-thm.jpg) 
In this final IoT series post, Canonical and Resin.io champion Linux container technology as a solution to IoT security and interoperability challenges.

| 
 ![](http://hackerboards.com/files/samsung_artik710-thm.jpg) 

**Artik 7** |

Despite growing security threats, the Internet of Things hype shows no sign of abating. Feeling the FoMo, companies are busily rearranging their roadmaps for IoT. The transition to IoT runs even deeper and broader than the mobile revolution. Everything gets swallowed in the IoT maw, including smartphones, which are often our windows on the IoT world, and sometimes our hubs or sensor endpoints.

New IoT focused processors and embedded boards continue to reshape the tech landscape. Since our [Linux and Open Source Hardware for IoT][5] story in September, we’ve seen [Intel Atom E3900][6] “Apollo Lake” SoCs aimed at IoT gateways, as well as [new Samsung Artik modules][7], including a Linux-driven, 64-bit Artik 7 COM for gateways and an RTOS-ready, Cortex-M4 Artik 0\. ARM announced [Cortex-M23 and Cortex-M33][8] cores for IoT endpoints featuring ARMv8-M and TrustZone security.

Security is a selling point for these products, and for good reason. The Mirai botnet that recently attacked the Dyn service and blacked out much of the U.S. Internet for a day brought Linux-based IoT into the forefront — and not in a good way. Just as IoT devices can be turned to the dark side via DDoS, the devices and their owners can also be the victimized directly by malicious attacks.

| 
 ![](http://hackerboards.com/files/arm_cortexm33m23-thm.jpg) 

**Cortex-M33 and -M23** |

The Dyn attack reinforced the view that IoT will more confidently move forward in more controlled and protected industrial environments rather than the home. It’s not that consumer [IoT security technology][9] is unavailable, but unless products are designed for security from scratch, as are many of the solutions in our [smart home hub story][10], security adds cost and complexity.

In this final, future-looking segment of our IoT series, we look at two Linux-based, Docker-oriented container technologies that are being proposed as solutions to IoT security. Containers might also help solve the ongoing issues of development complexity and barriers to interoperability that we explored in our story on [IoT frameworks][11].

We spoke with Canonical’s Oliver Ries, VP Engineering Ubuntu Client Platform about his company’s Ubuntu Core and its Docker-friendly, container-like Snaps package management technology. We also interviewed Resin.io CEO and co-founder Alexandros Marinos about his company’s new Docker-based ResinOS for IoT.

**Ubuntu Core Snaps to**

Canonical’s IoT-oriented [Snappy Ubuntu Core][12] version of Ubuntu is built around a container-like snap package management mechanism, and offers app store support. The snaps technology was recently [released on its own][13] for other Linux distributions. On November 3, Canonical released [Ubuntu Core 16][14], which improves white label app store and update control services.

<center>
[
 ![](http://hackerboards.com/files/canonical_ubuntucore16_diagram-sm.jpg) 
][15]
**Classic Ubuntu (left) architecture vs. Ubuntu Core 16**
(click image to enlarge)
</center>

The snap mechanism offers automatic updates, and helps block unauthorized updates. Using transactional systems management, snaps ensure that updates either deploy as intended or not at all. In Ubuntu Core, security is further strengthened with AppArmor, and the fact that all application files are kept in separate silos, and are read-only.

| 
 ![](http://hackerboards.com/files/limesdr-thm.jpg) 

**LimeSDR** |

Ubuntu Core, which was part of our recent [survey of open source IoT OSes][16], now runs on Gumstix boards, Erle Robotics drones, Dell Edge Gateways, the [Nextcloud Box][17], LimeSDR, the Mycroft home hub, Intel’s Joule, and SBCs compliant with Linaro’s 96Boards spec. Canonical is also collaborating with the Linaro IoT and Embedded (LITE) Segment Group on its [96Boards IoT Edition][18]Initially, 96Boards IE is focused on Zephyr-driven Cortex-M4 boards like Seeed’s [BLE Carbon][19], but it will expand to gateway boards that can run Ubuntu Core.

“Ubuntu Core and snaps have relevance from edge to gateway to the cloud,” says Canonical’s Ries. “The ability to run snap packages on any major distribution, including Ubuntu Server and Ubuntu for Cloud, allows us to provide a coherent experience. Snaps can be upgraded in a failsafe manner using transactional updates, which is important in an IoT world moving to continuous updates for security, bug fixes, or new features.”

| 
 ![](http://hackerboards.com/files/nextcloud_box3-thm.jpg) 

**Nextcloud Box** |

Security and reliability are key points of emphasis, says Ries. “Snaps can run completely isolated from one another and from the OS, making it possible for two applications to securely run on a single gateway,” he says. “Snaps are read-only and authenticated, guaranteeing the integrity of the code.”

Ries also touts the technology for reducing development time. “Snap packages allow a developer to deliver the same binary package to any platform that supports it, thereby cutting down on development and testing costs, deployment time, and update speed,” says Ries. “With snap packages, the developer is in full control of the lifecycle, and can update immediately. Snap packages provide all required dependencies, so developers can choose which components they use.”

**ResinOS: Docker for IoT**

Resin.io, which makes the commercial IoT framework of the same name, recently spun off the framework’s Yocto Linux based [ResinOS 2.0][20]” target=”new”>ResinOS 2.0 as an open source project. Whereas Ubuntu Core runs Docker container engines within snap packages, ResinOS runs Docker on the host. The minimalist ResinOS abstracts the complexity of working with Yocto code, enabling developers to quickly deploy Docker containers.

<center>
[
 ![](http://hackerboards.com/files/resinio_resinos_arch-sm.jpg) 
][21]
**ResinOS 2.0 architecture**
(click image to enlarge)
</center>

Like the Linux-based CoreOS, ResinOS integrates systemd control services and a networking stack, enabling secure rollouts of updated applications over a heterogeneous network. However, it’s designed to run on resource constrained devices such as ARM hacker boards, whereas CoreOS and other Docker-oriented OSes like the Red Hat based Project Atomic are currently x86 only and prefer a resource-rich server platform. ResinOS can run on 20 Linux devices and counting, including the Raspberry Pi, BeagleBone, and Odroid-C1.

“We believe that Linux containers are even more important for embedded than for the cloud,” says Resin.io’s Marinos. “In the cloud, containers represent an optimization over previous processes, but in embedded they represent the long-delayed arrival of generic virtualization.”

| 
 ![](http://hackerboards.com/files/beaglebone-hand-thm.jpg) 

**BeagleBone
Black** |

When applied to IoT, full enterprise virtual machines have performance issues and restrictions on direct hardware access, says Marinos. Mobile VMs like OSGi and Android’s Dalvik can been used for IoT, but they require Java among other limitations.

Using Docker may seem natural for enterprise developers, but how do you convince embedded hackers to move to an entirely new paradigm? “Rather than transferring practices from the cloud wholesale, ResinOS is optimized for embedded,” answers Marinos. In addition, he says, containers are better than typical IoT technologies at containing failure. “If there’s a software defect, the host OS can remain functional and even connected. To recover, you can either restart the container or push an update. The ability to update a device without rebooting it further removes failure opportunities.”

According to Marinos, other benefits accrue from better alignment with the cloud, such as access to a broader set of developers. Containers provide “a uniform paradigm across data center and edge, and a way to easily transfer technology, workflows, infrastructure, and even applications to the edge,” he adds.

The inherent security benefits in containers are being augmented with other technologies, says Marinos. “As the Docker community pushes to implement signed images and attestation, these naturally transfer to ResinOS,” he says. “Similar benefits accrue when the Linux kernel is hardened to improve container security, or gains the ability to better manage resources consumed by a container.”

Containers also fit in well with open source IoT frameworks, says Marinos. “Linux containers are easy to use in combination with an almost endless variety of protocols, applications, languages and libraries,” says Marinos. “Resin.io has participated in the AllSeen Alliance, and we have worked with partners who use IoTivity and Thread.”

**Future IoT: Smarter Gateways and Endpoints**

Marinos and Canonical’s Ries agree on several future trends in IoT. First, the original conception of IoT, in which MCU-based endpoints communicate directly with the cloud for processing, is quickly being replaced with a fog computing architecture. That calls for more intelligent gateways that do a lot more than aggregate data and translate between ZigBee and WiFi.

Second, gateways and smart edge devices are increasingly running multiple apps. Third, many of these devices will provide onboard analytics, which we’re seeing in the latest [smart home hubs][22]. Finally, rich media will soon become part of the IoT mix.

<center>
[
 ![](http://hackerboards.com/files/eurotech_reliagate2026-sm.jpg) 
][23] [
 ![](http://hackerboards.com/files/advantech_ubc221-sm.jpg) 
][24]
**Some recent IoT gateways: Eurotech’s [ReliaGate 20-26][1] and Advantech’s [UBC-221][2]**
(click images to enlarge)
</center>

“Intelligent gateways are taking over a lot of the processing and control functions that were originally envisioned for the cloud,” says Marinos. “Accordingly, we’re seeing an increased push for containerization, so feature- and security-related improvements can be deployed with a cloud-like workflow. The decentralization is driven by factors such as the mobile data crunch, an evolving legal framework, and various physical limitations.”

Platforms like Ubuntu Core are enabling an “explosion of software becoming available for gateways,” says Canonical’s Ries. “The ability to run multiple applications on a single device is appealing both for users annoyed with the multitude of single-function devices, and for device owners, who can now generate ongoing software revenues.”

<center>
[
 ![](http://hackerboards.com/files/myomega_mynxg-sm.jpg) 
][25] [
 ![](http://hackerboards.com/files/technexion_ls1021aiot_front-sm.jpg) 
][26]
**Two more IoT gateways: [MyOmega MYNXG IC2 Controller (left) and TechNexion’s ][3][LS1021A-IoT Gateway][4]**
(click images to enlarge)
</center>

It’s not only gateways — endpoints are getting smarter, too. “Reading a lot of IoT coverage, you get the impression that all endpoints run on microcontrollers,” says Marinos. “But we were surprised by the large amount of Linux endpoints out there like digital signage, drones, and industrial machinery, that perform tasks rather than operate as an intermediary. We call this the shadow IoT.”

Canonical’s Ries agrees that a single-minded focus on minimalist technology misses out on the emerging IoT landscape. “The notion of ‘lightweight’ is very short lived in an industry that’s developing as fast as IoT,” says Ries. “Today’s premium consumer hardware will be powering endpoints in a matter of months.”

While much of the IoT world will remain lightweight and “headless,” with sensors like accelerometers and temperature sensors communicating in whisper thin data streams, many of the newer IoT applications use rich media. “Media input/output is simply another type of peripheral,” says Marinos. “There’s always the issue of multiple containers competing for a limited resource, but it’s not much different than with sensor or Bluetooth antenna access.”

Ries sees a trend of “increasing smartness at the edge” in both industrial and home gateways. “We are seeing a large uptick in AI, machine learning, computer vision, and context awareness,” says Ries. “Why run face detection software in the cloud and incur delays and bandwidth and computing costs, when the same software could run at the edge?”

As we explored in our [opening story][27] of this IoT series, there are IoT issues related to security such as loss of privacy and the tradeoffs from living in a surveillance culture. There are also questions about the wisdom of relinquishing one’s decisions to AI agents that may be controlled by someone else. These won’t be fully solved by containers, snaps, or any other technology.

Perhaps we’d be happier if Alexa handled the details of our lives while we sweat the big stuff, and maybe there’s a way to balance privacy and utility. For now, we’re still exploring, and that’s all for the good.

--------------------------------------------------------------------------------

via: http://hackerboards.com/can-linux-containers-save-iot-from-a-security-meltdown/

作者：[Eric Brown][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://hackerboards.com/can-linux-containers-save-iot-from-a-security-meltdown/
[1]:http://hackerboards.com/atom-based-gateway-taps-new-open-source-iot-cloud-platform/
[2]:http://hackerboards.com/compact-iot-gateway-runs-yocto-linux-on-quark/
[3]:http://hackerboards.com/wireless-crazed-customizable-iot-gateway-uses-arm-or-x86-coms/
[4]:http://hackerboards.com/iot-gateway-runs-linux-on-qoriq-accepts-arduino-shields/
[5]:http://hackerboards.com/linux-and-open-source-hardware-for-building-iot-devices/
[6]:http://hackerboards.com/intel-launches-14nm-atom-e3900-and-spins-an-automotive-version/
[7]:http://hackerboards.com/samsung-adds-first-64-bit-and-cortex-m4-based-artik-modules/
[8]:http://hackerboards.com/new-cortex-m-chips-add-armv8-and-trustzone/
[9]:http://hackerboards.com/exploring-security-challenges-in-linux-based-iot-devices/
[10]:http://hackerboards.com/linux-based-smart-home-hubs-advance-into-ai/
[11]:http://hackerboards.com/open-source-projects-for-the-internet-of-things-from-a-to-z/
[12]:http://hackerboards.com/lightweight-snappy-ubuntu-core-os-targets-iot/
[13]:http://hackerboards.com/canonical-pushes-snap-as-a-universal-linux-package-format/
[14]:http://hackerboards.com/ubuntu-core-16-gets-smaller-goes-all-snaps/
[15]:http://hackerboards.com/files/canonical_ubuntucore16_diagram.jpg
[16]:http://hackerboards.com/open-source-oses-for-the-internet-of-things/
[17]:http://hackerboards.com/private-cloud-server-and-iot-gateway-runs-ubuntu-snappy-on-rpi/
[18]:http://hackerboards.com/linaro-beams-lite-at-internet-of-things-devices/
[19]:http://hackerboards.com/96boards-goes-cortex-m4-with-iot-edition-and-carbon-sbc/
[20]:http://hackerboards.com/can-linux-containers-save-iot-from-a-security-meltdown/%3Ca%20href=
[21]:http://hackerboards.com/files/resinio_resinos_arch.jpg
[22]:http://hackerboards.com/linux-based-smart-home-hubs-advance-into-ai/
[23]:http://hackerboards.com/files/eurotech_reliagate2026.jpg
[24]:http://hackerboards.com/files/advantech_ubc221.jpg
[25]:http://hackerboards.com/files/myomega_mynxg.jpg
[26]:http://hackerboards.com/files/technexion_ls1021aiot_front.jpg
[27]:http://hackerboards.com/an-open-source-perspective-on-the-internet-of-things-part-1/
[28]:http://hackerboards.com/can-linux-containers-save-iot-from-a-security-meltdown/
