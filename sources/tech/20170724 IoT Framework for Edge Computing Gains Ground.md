IoT Framework for Edge Computing Gains Ground
============================================================

![EdgeX](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/edgex_0.png?itok=DUnFipVf "EdgeX")
The open source EdgeX Foundry project is developing a standardized interoperability framework for Internet of Things (IoT) edge computing.[Used with permission][1]

In April, The Linux Foundation [launched][3] the open source [EdgeX Foundry][4] project to develop a standardized interoperability framework for Internet of Things (IoT) edge computing. Recently, EdgeX Foundry [announced][5] eight new members, bringing the total membership to 58.

The new members are Absolute, IoT Impact LABS, inwinSTACK, Parallel Machines, Queen’s University Belfast, RIOT, Toshiba Digital Solutions Corporation, and Tulip Interfaces. They join a roster that includes AMD, Analog Devices, Canonical/Ubuntu, Cloud Foundry, Dell, Linaro, Mocana, NetFoundry, Opto 22, RFMicron, and VMWare, among others.

EdgeX Foundry is built around Dell’s early stage, Apache 2.0 licensed [FUSE][6] IoT middleware framework, which offers more than a dozen microservices comprising over 125,000 lines of code. The Linux Foundation worked with Dell to launch the EdgeX Foundry after the FUSE project merged with a similar AllJoyn-compliant IoTX project led by current EdgeX members Two Bulls and Beechwood.

EdgeX Foundry will create and certify an ecosystem of interoperable, plug-and-play components. The open source EdgeX stack will mediate between a variety of sensor network messaging protocols and multiple cloud and analytics platforms. The framework is designed to help facilitate interoperability code that spans edge analytics, security, system management, and services.

The key benefit for members and their customers is the potential to more easily integrating pre-certified software for IoT gateways and smart edge devices. “EdgeX Foundry reduces the challenges that we face in deploying multi-vendor solutions in the real world,” said Dan Mahoney, Lead Engineer for [IoT Impact LABS][7], in an interview with Linux.com.

Why would The Linux Foundation launch another IoT standardization group while it’s still consolidating its AllSeen Alliance project’s AllJoyn spec into its [IoTivity standard][8]? For one thing, EdgeX Foundry differs from IoTivity in that for now it’s focused exclusively on industrial rather than both consumer and industrial IoT. Even more specifically, it targets middleware for gateways and smart endpoints. The projects also differ in that IoTivity is more about interoperability of existing products while EdgeX hopes to shape new products with pre-certified building blocks.

“IoTivity provides a device protocol enabling seamless device-to-device connectivity, while EdgeX Foundry provides a framework for edge computing,” said Philip DesAutels, PhD Senior Director of IoT at The Linux Foundation. “With EdgeX Foundry, any protocol -- IoTivity, BacNet, EtherCat, etc. -- can be integrated to enable multi-protocol communications between devices implementing a variety of protocols and a common edge framework. The goal is to create an ecosystem of interoperable components to reduce uncertainty, accelerate time to market, and facilitate scale.”

Last month, the IoTivity project, which is backed by the [Open Connectivity Foundation][9] (OCF), as well as The Linux Foundation, released [IoTivity 1.3][10], which adds bridges to the once rival AllJoyn spec backed by the Allseen Alliance, and also adds hooks to the OCF’s UPnP device discovery standard. The IoTivity and AllJoyn standards should achieve even greater integration in [IoTivity 2.0][11].

IoTivity and EdgeX are “highly complementary,” DesAutels told Linux.com. “Since there are several members of EdgeX Foundry that are also involved in either IoTivity or OCF, the project anticipates strong partnerships between IoTivity and EdgeX.”

Although both EdgeX and IoTivity are billed as being cross-platform in both CPU architecture and OS, IoTivity is still primarily a Linux driven effort -- spanning Ubuntu, Tizen, and Android -- that is now expanding to Windows and iOS. By comparison, EdgeX Foundry is designed from the start to be fully cross-platform, regardless of CPU architecture or OS, including Linux, Windows, and Mac OS, and potentially real-time operating systems (RTOSes).

One of the new EdgeX members is the [RIOT][12] project, which offers an open source, IoT-oriented RIOT RTOS. “RIOT starts where Linux doesn’t fit so it is natural for the RIOT community to participate and support complementary open-source initiatives like EdgeX Foundry for edge computing,” stated RIOT’s Thomas Eichinger in a testimonial quote.

### Easing sensor integration

IoT Impact LABS (aka Impact LABS or just plain LABS) is another new EdgeX member. The company has a novel business model of helping small-to-medium sized businesses live pilot IoT solutions. Most of its clients, which include several EdgeX Foundry members, are working on projects for enabling smart cities, resilient infrastructure, improved food security, as well as solutions designed for communities facing natural resource challenges.

“At LABS we spend a lot of time troubleshooting new solutions for our pilot hosts,” said Dan Mahoney. “EdgeX Foundry will let us deploy faster with high-quality solutions by keeping the edge software development efforts to a minimum.”

The framework will be especially helpful in projects that involve many types of sensors from multiple vendors. “EdgeX Foundry gives us the ability to rapidly build gateway software to handle all the sensors being deployed,” added Mahoney. Sensor manufacturers will be able to use the EdgeX SDK to write a single application-level device driver for a given protocol that can then be used by multiple vendors and solutions.

### Bringing analytics to the edge

When asked how his company would like to see the EdgeX framework evolve, Mahoney said: “A goal we would like to encourage is to have multiple industrial protocols available as device services -- and a clear path for implementing edge analytics.”

Edge computing analytics is a growing trend in both industrial and consumer IoT. In the latter, we’ve already seen several smart home [hubs integrating analytics][13] technology such as Alexa voice activated AI support or video analytics. This typically requires offloading processing to cloud services, which poses challenges in security and privacy, potential service loss due to provider outages, and latency issues.

With industrial IoT gateways, latency is the most important issue. As a result, there’s growing interest in adding more cloud-like intelligence to IoT gateways. One solution is to securely bring cloud-like applications to embedded devices via containers, as with [ResinOS and Ubuntu Core’s snap mechanisms][14]. Another approach is to develop IoT ecosystems that shift more cloud intelligence to the edge. Last month, Amazon released its AWS Lambda based [AWS Greengrass][15]IoT stack for Linux based gateways. The software enables AWS compute, messaging, data caching, and sync capabilities to run on connected devices such as IoT gateways. 

Analytics is a key element of the EdgeX Foundry roadmap. One founding member is Cloud Foundry, which is aiming to integrate its industry leading cloud application platform with edge devices. Another new member -- [Parallel Machines][16] -- plans to leverage EdgeX to help it bring AI to the edge.

It’s still early days at EdgeX Foundry. The software is still in alpha stage, and the company had its first big meeting only last month. The project has initiated a series of “Tech Talks” training sessions for new developers. More information may be found [here][17].

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2017/7/iot-framework-edge-computing-gains-ground

作者：[ ERIC BROWN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/ericstephenbrown
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/files/images/edgexpng-0
[3]:http://linuxgizmos.com/open-source-group-focuses-on-industrial-iot-gateway-middleware/
[4]:https://www.edgexfoundry.org/
[5]:https://www.edgexfoundry.org/announcement/2017/07/17/edgex-foundry-builds-momentum-for-a-iot-interoperability-and-a-unified-marketplace-with-eight-new-members/
[6]:https://medium.com/@gigastacey/dell-plans-an-open-source-iot-stack-3dde43f24feb
[7]:https://iotimpactlabs.com/
[8]:https://www.linux.com/news/how-iotivity-and-alljoyn-could-combine
[9]:https://openconnectivity.org/developer/specifications/international-standards
[10]:https://wiki.iotivity.org/release_note_1.3.0
[11]:https://www.linux.com/news/iotivity-20-whats-store
[12]:https://riot-os.org/
[13]:https://www.linux.com/news/smart-linux-home-hubs-mix-iot-ai
[14]:https://www.linux.com/news/future-iot-containers-aim-solve-security-crisis
[15]:http://linuxgizmos.com/amazon-releases-aws-greengrass-for-local-iot-processing-on-linux-devices/
[16]:https://www.parallelmachines.com/
[17]:https://wiki.edgexfoundry.org/
