[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Role of Open Source Tools and Concepts in IoT Security)
[#]: via: (https://opensourceforu.com/2019/10/the-role-of-open-source-tools-and-concepts-in-iot-security/)
[#]: author: (Shashidhar Soppin https://opensourceforu.com/author/shashidhar-soppin/)

The Role of Open Source Tools and Concepts in IoT Security
======

[![][1]][2]

_With IoT devices permeating the commercial and personal space, their security becomes important. Hackers and malicious agents are always trying to exploit vulnerabilities in order to control these devices. The advantages of using open source rather than proprietary software needs no elaboration. Here is a selection of open source tools popular in the IoT field._

Security is one of the key factors to consider while choosing any IoT platform. The IoT market is very large and is growing constantly. Scary hacks and security breaches are happening to IoT related devices on a regular basis. These could be DoS (Denial of Service) attacks or may completely wipe out the firmware sitting on top of the device. Early detection and prevention of these attacks is a major concern for any enterprise or organisation. Many companies are adopting open source security tools and solutions and laying out predefined best practices for IoT security.

![Figure 1: The Mirai botnet][3]

**Recent security attacks**
As explained earlier, many attacks and threats targeting IoT systems have happened during the last few years. Let’s look at some of the major ones.

_**The Silex malware attack**_: In 2019, a 14-year-old hacker bricked at least around 4,000 IoT devices with a new strain of malware called Silex, which was used to abruptly shut down command and control servers. Larry Cashdollar, who is a senior security intelligence response engineer at Akamai, first discovered this malware on his honeypot. Like the BrickerBot malware in 2017, Silex too targeted insecure IoT devices and made them unusable.

Silex trashes an IoT device’s storage, dropping firewall rules, removing the network configuration and then halting the device completely. It is as destructive as it can get without actually frying the IoT device’s circuits. To recover, victims must manually reinstall the device’s firmware, a task too complicated for most device owners. (_<https://www.bleepingcomputer.com/news/security/new-silex-malware-trashes-iot-devices-using-default-passwords/>_)

_**The BrickerBot attack**_: The BrickerBot malware attack took place in 2017 and its author has claimed that 60,000 modems and routers across India lost Internet connectivity. The incident affected modems and routers belonging to two Indian state-owned telecommunications service providers, Bharat Sanchar Nigam Limited (BSNL) and Mahanagar Telephone Nigam Limited (MTNL). The attack was so intensive that from July 25 and up to July 29, users reported losing Internet connectivity as routers and modems became stuck with their red LED remaining always on. The main purpose of this bot is to brick devices so they will not be usable once attacked. (_<https://www.bleepingcomputer.com/news/security/brickerbot-author-retires-claiming-to-have-bricked-over-10-million-iot-devices/>_)

![Figure 2: Princeton IoT Icon][4]

**Note:** _Bricking is the process of changing the code of the device so that the hardware can no longer be used, thereby turning the device essentially into a brick (totally unusable)._

**The Mirai botnet attack:** The Mirai botnet attack took place in 2016. This was a major malware/virus attack. Mirai is a self-propagating botnet virus. The source code for it was made publicly available by the author after a successful and well-publicised attack on the Krebbs website. Since then, the source code has been built and used by many others to launch attacks on Internet infrastructure, causing major damage. The Mirai botnet code infects poorly protected Internet devices by using telnet to find those that are still using their factory default usernames and passwords. The effectiveness of Mirai is due to its ability to infect tens of thousands of these insecure devices and co-ordinate them to mount a DDoS attack against a chosen victim. (_<https://www.corero.com/resources/ddos-attack-types/mirai-botnet-ddos-attack>_)

**Detection and prevention of security attacks**
The major cause of concern in IoT devices is the use of the Linux OS by the device vendors instead of developing a custom OS, which is time consuming and expensive. Most of the attackers/hackers know this and so target these devices.

Some time back, Symantec came up with a solution for this by using a router called Norton Core (_<https://us.norton.com/core>_). This was not a success as it was expensive and had a monthly maintenance cost. In addition, people felt that it was too early to use such a router that came with a monthly subscription, since most homes still do not have enough IoT enabled devices to make such an investment worthwhile.

**Open source security tools**
Subsequently, many state-of-art security tools with multiple security features have been launched. Some of the most used and popular open source security tools are featured below.

**Princeton IoT-Inspector**
This is an open source desktop tool with a one-click, easy-to-install process. It has many built-in security validation features:

  * Automatically discovers IoT devices and analyses their network traffic.
  * Helps one to identify security and privacy issues with graphs and tables.
  * Requires minimal technical skills and no special hardware.



This tool can be configured on Linux/Mac (Windows support is still under discussion).

**What data does IoT Inspector collect?** For each IoT device in the network, IoT Inspector collects the following information and sends it to identified secure servers at the Princeton University:

  * Device manufacturers, based on the first six characters of the MAC address of each device on the network
  * DNS requests and responses
  * Destination IP addresses and ports contacted — but not the public-facing IP address (i.e., the one that your ISP assigns to you)
  * Scrambled MAC addresses (i.e., those with a salted hash)
  * Aggregate traffic statistics, i.e., the number of bytes sent and received over a period of time
  * The names of devices on the identified network



By collecting the above types of data, there are some risks involved, such as:

  * Performance degradation
  * Data breaches
  * Best-effort support



![Figure 3: OWASP IoT][5]

_**How the security validation is done:**_ Princeton releases its findings in a journal/conference publication. When consumers are unsure about whether to buy a new IoT device or not, they can read the relevant papers before making a decision, checking if the device of interest features in the Princeton data. Otherwise, the consumer can always buy the product, analyse it with IoT Inspector, and return it if the results are unsatisfactory.

**Open Web Application Security Project (OWASP) set of standards**
OWASP is an open community dedicated to enabling organisations to conceive, develop, acquire, operate and maintain applications that can be trusted.

_**Testing an IoT device for poor authentication/authorisation (OWASP I2):**_ When we think of weak authentication, we might think of passwords that are not changed on a regular basis, six-to-eight character passwords that are nonetheless easy to guess, or of systems without multi-factor authentication mechanisms. Unfortunately, with many smart devices, weak authentication causes major havoc.
Many of the IoT devices are secured with default passwords like ‘1234’, ‘password’, or ‘ABCD’. Users put their password checks in client-side Java code, send credentials without using HTTPS or other encrypted transport protocols, or require no passwords at all. This kind of mismanagement of passwords causes a lot of damage to devices.
Many OWASP l2 to I10 standards provide different levels of security, which are listed in Figure 3.

  * I1 – Insecure Web interface
  * I2 – Insufficient authentication/authorisation
  * I3 – Insecure network services
  * I4 – Lack of transport encryption
  * I5 – Privacy concerns
  * I6 – Insecure cloud interface
  * I7 – Insecure mobile interface
  * I8 – Insufficient security configurability
  * I9 – Insecure software/firmware
  * I10 – Poor physical security



**Mainflux platform: For authentication and authorisation**
Mainflux is an open source IoT platform providing features like edge computing and consulting services. Mainflux Labs is a technology company offering an end-to-end, open source patent-free IoT platform, an LF EdgeX Foundry compliant IoT edge gateway with an interoperable ecosystem of plug-and-play components, and consulting services for the software and hardware layers of the IoT technology. It provides enhanced and fine-grained security via the deployment-ready Mainflux authentication and authorisation server, with an access control scheme based on customisable API keys and scoped JWT. It also offers mutual TLS (mTLS) authentication using X.509 certificates, NGINX reverse proxy for security, load balancing and termination of TLS and DTLS connections, etc. Many of these features can be explored and used according to the need of the hour.

**Best practices for building a secure IoT framework**
To prevent/avoid attacks on any IoT device, environment or ecosystem, the following best practices need to be applied:

  * Always use strong passwords for device accounts and Wi-Fi networks.
  * It is a best practice to always change default passwords.
  * Use stronger and most recent encryption methods when setting up Wi-Fi networks such as WPA2.
  * Develop the habit of disabling or protecting the remote access to IoT devices when not needed.
  * Use wired connections instead of wireless, where possible.
  * Be careful when buying used IoT devices, as they could have been tampered with. It is better to consult a genuine authority and confirm the device’s validation or buy from a certified authority.
  * Research the vendor’s device security measures as well as the features that they support.
  * Modify the privacy and security settings of the device to meet your needs immediately after buying the device.
  * It is better to disable features that are not used frequently.
  * Install updates regularly, when they become available. It is a best practice to use the latest firmware updates.
  * Ensure that an outage due to jamming or a network failure does not result in an insecure state of the installation.
  * Verify if the smart features are required or if a normal device suffices for the purpose.



**Best practices for designers of IoT frameworks and device manufacturers**

  * Always use SSL/TLS-encrypted connections for communication purposes.
  * Check the SSL certificate and the certificate revocation list.
  * Allow and encourage the use of strong passwords and change default passwords immediately.
  * Provide a simple and secure update process with a chain of trust.
  * Provide a standalone option that works without Internet and cloud connections.
  * Prevent brute-force attacks at the login stage through account lockout measures or with multi-factor types of authentication mechanisms.
  * Implement a smart fail-safe mechanism when the connection or power is lost or jammed.
  * Remove unused tools and allow only trusted applications and software.
  * Where applicable, security analytics features should be provided in the device management strategy.



IoT developers and designers should include security at the start of the device development process, irrespective of whether the device is for the consumer market, the enterprise or industry. Incorporating security at the design phase always helps. Enabling security by default is very critical, as is providing the most recent operating systems and using secure hardware with the latest firmware versions.

**Enabling PKI and digital certificates**
Public key infrastructure (PKI) and 509 digital certificates play important and critical roles in the development of secure IoT devices. It is always a best practice to provide the trust and control needed to distribute and identify public encryption keys, secure data exchanges over networks and verify the identity.

**API (application performance indicator) security**
For any IoT environment, API security is essential to protect the integrity of data. As this data is being sent from IoT devices to back-end systems, we always have to make sure only authorised devices, developers and apps communicate with these APIs.

**Patch management/continuous software updates**
This is one crucial aspect in IoT security management. Providing the means of updating devices and software either over network connections or through automation is critical. Having a coordinated disclosure of vulnerabilities is also important to updating devices as soon as possible. Consider end-of-life strategies as well.

Always remember that hard coded credentials should never be used nor be part of the design process. If there are any default credentials, users should immediately update them using strong passwords as described earlier, or follow multi-factor or biometric authentication mechanisms.

**Hardware security**
It is absolutely essential to make devices tamper-proof or tamper-evident, and this can be achieved by endpoint hardening.

Strong encryption is critical to securing communication between devices. It is always a best practice to encrypt data at rest and in transit using cryptographic algorithms.

IoT and operating system security are new to many security teams. It is critical to keep security staff up to date with new or unknown systems, enabling them to learn new architectures and programming languages to be ready for new security challenges. C-level and cyber security teams should receive regular training to keep up with modern threats and security measures.

--------------------------------------------------------------------------------

via: https://opensourceforu.com/2019/10/the-role-of-open-source-tools-and-concepts-in-iot-security/

作者：[Shashidhar Soppin][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensourceforu.com/author/shashidhar-soppin/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Security-of-IoT-devices.jpg?resize=696%2C550&ssl=1 (Security of IoT devices)
[2]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Security-of-IoT-devices.jpg?fit=900%2C711&ssl=1
[3]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Figure-1-The-Mirai-botnet.jpg?resize=350%2C188&ssl=1
[4]: https://i2.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Figure-2-Princeton-IoT-Icon.jpg?resize=350%2C329&ssl=1
[5]: https://i0.wp.com/opensourceforu.com/wp-content/uploads/2019/10/Figure-3-OWASP-IoT.jpg?resize=350%2C147&ssl=1
