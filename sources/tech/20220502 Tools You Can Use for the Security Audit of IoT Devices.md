[#]: subject: "Tools You Can Use for the Security Audit of IoT Devices"
[#]: via: "https://www.opensourceforu.com/2022/05/tools-you-can-use-for-the-security-audit-of-iot-devices/"
[#]: author: "Dr Kumar Gaurav https://www.opensourceforu.com/author/dr-gaurav-kumar/"
[#]: collector: "lkxed"
[#]: translator: "tendertime "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Tools You Can Use for the Security Audit of IoT Devices
======
Digital transformation involves data-driven decision making with the integration of artificial intelligence (AI). Important data is broadcast through Internet of Things (IoT) devices and smart gadgets. These IoT devices are very often insecure and have vulnerabilities as they lack built-in security mechanisms that can protect them from potential cyber attacks. There are quite a few open source tools that can be used to carry out security audits, lowering the risk of such attacks.

![Screenshot 2022-05-02 154427][1]

cyber attackers and sniffers can access sensitive data from IoT devices and use that information to launch attacks on other linked systems. According to anti-virus and computer security service company Kaspersky, the number of IoT hacks more than quadrupled year-on-year in 2021.

For the most part, hackers gained access to Internet of Things (IoT) networks by using the Telnet protocol, which provides a command-line interface for communicating with devices or servers over the Internet. More than 58 per cent of IoT intrusions, as per research reports, used assorted protocols that aimed to mine cryptocurrencies, shut down systems via distributed denial-of-service (DDoS) attacks, or steal confidential data.

Because of the increased time spent using IoT devices at home during the pandemic, the security risks have increased. Many of these gadgets, whether used for personal or business purposes, lack basic security measures. New technologies like artificial intelligence and edge computing have also complicated the landscape of cyber and data security. As the popularity of smart gadgets grew, so did the number of attacks, according to Dan Demeter, a Kaspersky security analyst.

![Key components in PENIOT][2]

### The need for security audit in IoT gadgets

Cyber attacks are evolving all the time, and businesses and government agencies are employing ever more sophisticated cyber security measures to guard their applications and infrastructure from online attacks. The global penetration testing market is expected to grow from US$ 1.6 billion in 2021 to US$ 3.0 billion by 2026, at a CAGR of 13.8 per cent between 2021 and 2026.

Penetration testing on IoT devices is a hot topic and there is huge research in this segment. Even with a ‘security by design’ approach, pen testing is vital to identify true security dangers and take the appropriate precautions.

Key segments and protocols in IoT deployment where security and privacy is required are:

* Constraint application protocol (CoAP)
* Bluetooth low energy (BLE)
* Advanced message queuing protocol (AMQP)
* Message queuing telemetry transport (MQTT)

For an attacker to get access to a connected device, there are several possible entry points. At the time of an IoT pen test (or security audit), the complete IoT scenario and ecosystem is tested. This encompasses everything from the individual layer and the embedded software, to the communication protocols and the server. Tests of servers, online interfaces, and mobile apps are not unique to IoT, but are crucial since they cover areas with a high potential for failure. Vulnerabilities in IoT are the focus of electrical, embedded software, and communication protocol testing.

The following tests are run during a connected device’s security assessment. These are done using different high performance penetration testing and security audit tools against vulnerabilities:

* Tests for exploitation and manipulation in the communication ports
* IoT sniffing by capture and analysis of radio signals
* Detection of interfaces or backdoors
* Tests for buffer overflow
* Tests for breaking of passwords
* Debugging
* Cryptographic analysis
* Manipulation in firmware tests
* Reverse engineering
* Memory dumps

![][3]

### Open source tools for the security audit of IoT devices

IoT devices are becoming more and more commonplace in our daily lives. A few examples of such devices are smart bicycles, fitness trackers, medical sensors, smart locks, and linked factories. All of these devices and gadgets can be secured against cyber attacks using open source tools, some of which are briefly discussed here.

#### PENIOT

https://github.com/yakuza8/peniot

PENIOT is an IoT penetration testing tool that enables security audit teams to test and breach the devices with various security threats by exploiting their connectivity. There are both active and passive security threats that can be tested. It is possible to carry out active security attacks, such as altering system resources, replaying legitimate communication units and so on, after determining the target device and the relevant information (or parameters). Passive security threats, such as breaking the confidentiality of sensitive data or gaining access to network traffic analysis, can also be analysed.

#### Objection

https://github.com/sensepost/objection

Objection is a tool for the detailed analysis and security audit of the Android and iOS apps used in the IoT environment.

Nowadays, a number of smart gadgets and devices are using Android and iOS platforms which can be analysed with detailed logs and security audit reports, using this tool.

#### Routersploit

https://github.com/threat9/routersploit

This powerful open source exploitation framework for embedded devices has multiple features and modules for penetration testing and security audit:

* Exploits – vulnerabilities evaluation
* Creds – testing of network services and credentials
* Scanners – detailed security audit of target
* Payloads – generation of payloads and injection key points
* Generic – performing and testing of assaults

#### Wireshark

https://www.wireshark.org

Wireshark is a free network protocol analyser with a lot of features. Various protocols, including MQTT, are used by IoT devices to communicate and these can be analysed effectively. Security rules are configured according to the protocol and the traffic is examined in order to discover any weaknesses. A network packet analyser is accessible through the command line using tcpdump. Such tools are used to examine data packets exchanged between IoT devices and networks.

#### Binwalk

https://www.kali.org/tools/binwalk

Binwalk is a tool for reversing the design of hardware. It is one of the key components in Kali Linux that is used for penetration testing, server fingerprinting, security audit and forensic applications.

#### Firmwalker

https://github.com/craigz28/firmwalker

Firmwalker is a free and open source tool for searching and scanning the firmware file system, irrespective of whether it is extracted or mounted. A detailed security audit can be done using this tool.

In the era of Internet of Things (IoT) and Internet of Everything (IoE), there is a need to devise and use high performance toolkits for penetration testing and security audits. As the number of IoT devices grows, so do the security risks. Free and open source toolkits and software suites should be customised according to recent protocols and dynamic traffic so that higher levels of security and privacy can be enforced in IoT and IoE deployments.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/tools-you-can-use-for-the-security-audit-of-iot-devices/

作者：[Dr Kumar Gaurav][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/dr-gaurav-kumar/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/03/Screenshot-2022-05-02-154427-696x422.png
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/03/Figure-1-Key-components-in-PENIOT.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/03/Screenshot-2022-05-02-153653-590x282.png
