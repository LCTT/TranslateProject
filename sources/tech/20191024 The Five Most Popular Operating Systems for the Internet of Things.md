[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Five Most Popular Operating Systems for the Internet of Things)
[#]: via: (https://opensourceforu.com/2019/10/the-five-most-popular-operating-systems-for-the-internet-of-things/)
[#]: author: (K S Kuppusamy https://opensourceforu.com/author/ks-kuppusamy/)

The Five Most Popular Operating Systems for the Internet of Things
======

[![][1]][2]

_Connecting every ‘thing’ that we see around us to the Internet is the fundamental idea of the Internet of Things (IoT). There are many operating systems to get the best out of the things that are connected to the Internet. This article explores four popular operating systems for IoT — Ubuntu Core, RIOT, Contiki and TinyOS._

To say that life is running on the Internet these days is not an exaggeration due to the number and variety of services that we consume on the Net. These services span multiple domains such as information, financial services, social networking and entertainment. As this list grows longer, it becomes imperative that we do not restrict the types of devices that can connect to the Internet. The Internet of Things (IoT) facilitates connecting various types of ‘things’ to the Internet infrastructure. By connecting a device or thing to the Internet, these things get the ability to not only interact with the user but also between themselves. This feature of a variety of things interacting among themselves to assist users in a pervasive manner constitutes an interesting phenomenon called ambient intelligence.

![Figure 1: IoT application domains][3]

IoT is becoming increasingly popular as the types of devices that can be connected to it are becoming more diverse. The nature of applications is also evolving. Some of the popular domains in which IoT is getting used increasingly are listed below (Figure 1):

  * Smart homes
  * Smart cities
  * Smart agriculture
  * Connected automobiles
  * Smart shopping
  * Connected health



![Figure 2: IoT operating system features][4]

As the application domains become diverse, the need to manage the IoT infrastructure efficiently is also becoming more important. The operating systems in normal computers perform the primary functions such as resource management, user interaction, etc. The requirements of IoT operating systems are specialised due to the nature and size of the devices involved in the process. Some of the important characteristics/requirements of IoT operating systems are listed below (Figure 2):

  * A tiny memory footprint
  * Energy efficiency
  * Connectivity features
  * Hardware-agnostic operations
  * Real-time processing requirements
  * Security requirements
  * Application development ecosystem



As of 2019, there is a spectrum of choices for selecting the operating system (OS) for the Internet of Things. Some of these OSs are shown in Figure 3.

![Figure 3: IoT operating systems][5]

**Ubuntu Core**
As Ubuntu is a popular Linux distribution, the Ubuntu Core IoT offering has also become popular. Ubuntu Core is a secure and lightweight OS for IoT, and is designed with a ‘security first’ philosophy. According to the official documentation, the entire system has been redesigned to focus on security from the first boot. There is a detailed white paper available on Ubuntu Core’s security features. It can be accessed at _<https://assets.ubuntu.com/v1/66fcd858> -ubuntu-core-security-whitepaper.pdf?_ga=2.74563154.1977628533. 1565098475-2022264852.1565098475_.

Ubuntu Core has been made tamper-resistant. As the applications may be from diverse sources, they are given privileges for only their own data. This has been done so that one poorly designed app does not make the entire system vulnerable. Ubuntu Core is ‘built for business’, which means that the developers can focus directly on the application at hand, while the other requirements are supported by the default operating system.

Another important feature of Ubuntu Core is the availability of a secure app store, which you can learn more about at _<https://ubuntu.com/internet-of-things/appstore>_. There is a ready-to-go software ecosystem that makes using Ubuntu Core simple.

The official documentation lists various successful case studies about how Ubuntu Core has been successfully used.

**RIOT**
RIOT is a user-friendly OS for the Internet of Things. This FOSS OS has been developed by a number of people from around the world.
RIOT supports many low-power IoT devices. It has support for various microcontroller architectures. The official documentation lists the following reasons for using the RIOT OS.

  * _**It is developer friendly:**_ It supports the standard environments and tools so that developers need not go through a steep learning curve. Standard programming languages such as C or C++ are supported. The hardware dependent code is very minimal. Developers can code once and then run their code on 8-bit, 16-bit and 32-bit platforms.
  * _**RIOT is resource friendly:**_ One of the important features of RIOT is its ability to support lightweight devices. It enables maximum energy efficiency. It supports multi-threading with very little overhead for threading.
  * _**RIOT is IoT friendly:**_ The common system support provided by RIOT makes it a very important choice for IoT. It has support for CoAP, CBOR, high resolution and long-term timers.



**Contiki**
Contiki is an important OS for IoT. It facilitates connecting tiny, low-cost and low-energy devices to the Internet.
The prominent reasons for choosing the Contiki OS are as follows.

  * _**Internet standards:**_ The Contiki OS supports the IPv6 and IPv4 standards, in addition to the low-power 6lowpan, RPL and CoAP standards.
  * _**Support for a variety of hardware:**_ Contiki can be run on a variety of low-power devices, which are easily available online.
  * _**Large community support:**_ One of the important advantages of using Contiki is the availability of an active community of developers. So when you have some technical issues to be solved, these community members make the problem solving process simple and effective.



The major features of Contiki are listed below.

  * _**Memory allocation:**_ Even the tiny systems with only a few kilobytes of memory can also use Contiki. Its memory efficiency is an important feature.
  * _**Full IP networking:**_ The Contiki OS offers a full IP network stack. This includes major standard protocols such as UDP, TCP, HTTP, 6lowpan, RPL, CoAP, etc.
  * _**Power awareness:**_ The ability to assess the power requirements and to use them in an optimal minimal manner is an important feature of Contiki.
  * The Cooja network simulator makes the process of developing and debugging software easier.
  * The availability of the Coffee Flash file system and the Contiki shell makes the file handling and command execution simpler and more effective.



**TinyOS**
TinyOS is an open source operating system designed for low-power wireless devices. It has a vibrant community of users spread across the world from both academia and industry. The popularity of TinyOS can be understood from the fact that it gets downloaded more than 35,000 times in a year.
TinyOS is very effectively used in various scenarios such as sensor networks, smart buildings, smart meters, etc. The main repository of TinyOS is available at <https://github.com/tinyos/tinyos-main>.
TinyOS is written in nesC which is a dialect of C. A sample code snippet is shown below:

```
configuration Led {
provides {
interface LedControl;
}
uses {
interface Gpio;
}
}
implementation {

command void LedControl.turnOn() {
call Gpio.set();
}

command void LedControl.turnOff() {
call Gpio.clear();
}

}
```

**Zephyr**
Zephyr is a real-time OS that supports multiple architectures and is optimised for resource-constrained environments. Security is also given importance in the Zephyr design.

The prominent features of Zephyr are listed below:

  * Support for 150+ boards.
  * Complete flexibility and freedom of choice.
  * Can handle small footprint IoT devices.
  * Can develop products with built-in security features.



This article has introduced readers to a list of four OSs for the IoT, from which they can select the ideal one, based on individual requirements.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/the-five-most-popular-operating-systems-for-the-internet-of-things/

作者：[K S Kuppusamy][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/ks-kuppusamy/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/OS-for-IoT.jpg?resize=696%2C647&ssl=1 (OS for IoT)
[2]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/OS-for-IoT.jpg?fit=800%2C744&ssl=1
[3]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Figure-1-IoT-application-domains.jpg?resize=350%2C107&ssl=1
[4]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Figure-2-IoT-operating-system-features.jpg?resize=350%2C93&ssl=1
[5]: https://i1.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Figure-3-IoT-operating-systems.jpg?resize=350%2C155&ssl=1
