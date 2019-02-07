[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (The Evil-Twin Framework: A tool for improving WiFi security)
[#]: via: (https://opensource.com/article/19/1/evil-twin-framework)
[#]: author: (André Esser https://opensource.com/users/andreesser)

The Evil-Twin Framework: A tool for improving WiFi security
======
Learn about a pen-testing tool intended to test the security of WiFi access points for all types of threats.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security-lock-cloud-safe.png?itok=yj2TFPzq)

The increasing number of devices that connect over-the-air to the internet over-the-air and the wide availability of WiFi access points provide many opportunities for attackers to exploit users. By tricking users to connect to [rogue access points][1], hackers gain full control over the users' network connection, which allows them to sniff and alter traffic, redirect users to malicious sites, and launch other attacks over the network..

To protect users and teach them to avoid risky online behaviors, security auditors and researchers must evaluate users' security practices and understand the reasons they connect to WiFi access points without being confident they are safe. There are a significant number of tools that can conduct WiFi audits, but no single tool can test the many different attack scenarios and none of the tools integrate well with one another.

The **Evil-Twin Framework** (ETF) aims to fix these problems in the WiFi auditing process by enabling auditors to examine multiple scenarios and integrate multiple tools. This article describes the framework and its functionalities, then provides some examples to show how it can be used.

### The ETF architecture

The ETF framework was written in [Python][2] because the development language is very easy to read and make contributions to. In addition, many of the ETF's libraries, such as **[Scapy][3]** , were already developed for Python, making it easy to use them for ETF.

The ETF architecture (Figure 1) is divided into different modules that interact with each other. The framework's settings are all written in a single configuration file. The user can verify and edit the settings through the user interface via the **ConfigurationManager** class. Other modules can only read these settings and run according to them.

![Evil-Twin Framework Architecture][5]

Figure 1: Evil-Twin framework architecture

The ETF supports multiple user interfaces that interact with the framework. The current default interface is an interactive console, similar to the one on [Metasploit][6]. A graphical user interface (GUI) and a command line interface (CLI) are under development for desktop/browser use, and mobile interfaces may be an option in the future. The user can edit the settings in the configuration file using the interactive console (and eventually with the GUI). The user interface can interact with every other module that exists in the framework.

The WiFi module ( **AirCommunicator** ) was built to support a wide range of WiFi capabilities and attacks. The framework identifies three basic pillars of Wi-Fi communication: **packet sniffing** , **custom packet injection** , and **access point creation**. The three main WiFi communication modules are **AirScanner** , **AirInjector** , and **AirHost** , which are responsible for packet sniffing, packet injection, and access point creation, respectively. The three classes are wrapped inside the main WiFi module, AirCommunicator, which reads the configuration file before starting the services. Any type of WiFi attack can be built using one or more of these core features.

To enable man-in-the-middle (MITM) attacks, which are a common way to attack WiFi clients, the framework has an integrated module called ETFITM (Evil-Twin Framework-in-the-Middle). This module is responsible for the creation of a web proxy used to intercept and manipulate HTTP/HTTPS traffic.

There are many other tools that can leverage the MITM position created by the ETF. Through its extensibility, ETF can support them—and, instead of having to call them separately, you can add the tools to the framework just by extending the Spawner class. This enables a developer or security auditor to call the program with a preconfigured argument string from within the framework.

The other way to extend the framework is through plugins. There are two categories of plugins: **WiFi plugins** and **MITM plugins**. MITM plugins are scripts that can run while the MITM proxy is active. The proxy passes the HTTP(S) requests and responses through to the plugins where they can be logged or manipulated. WiFi plugins follow a more complex flow of execution but still expose a fairly simple API to contributors who wish to develop and use their own plugins. WiFi plugins can be further divided into three categories, one for each of the core WiFi communication modules.

Each of the core modules has certain events that trigger the execution of a plugin. For instance, AirScanner has three defined events to which a response can be programmed. The events usually correspond to a setup phase before the service starts running, a mid-execution phase while the service is running, and a teardown or cleanup phase after a service finishes. Since Python allows multiple inheritance, one plugin can subclass more than one plugin class.

Figure 1 above is a summary of the framework's architecture. Lines pointing away from the ConfigurationManager mean that the module reads information from it and lines pointing towards it mean that the module can write/edit configurations.

### Examples of using the Evil-Twin Framework

There are a variety of ways ETF can conduct penetration testing on WiFi network security or work on end users' awareness of WiFi security. The following examples describe some of the framework's pen-testing functionalities, such as access point and client detection, WPA and WEP access point attacks, and evil twin access point creation.

These examples were devised using ETF with WiFi cards that allow WiFi traffic capture. They also utilize the following abbreviations for ETF setup commands:

  * **APS** access point SSID
  * **APB** access point BSSID
  * **APC** access point channel
  * **CM** client MAC address



In a real testing scenario, make sure to replace these abbreviations with the correct information.

#### Capturing a WPA 4-way handshake after a de-authentication attack

This scenario (Figure 2) takes two aspects into consideration: the de-authentication attack and the possibility of catching a 4-way WPA handshake. The scenario starts with a running WPA/WPA2-enabled access point with one connected client device (in this case, a smartphone). The goal is to de-authenticate the client with a general de-authentication attack then capture the WPA handshake once it tries to reconnect. The reconnection will be done manually immediately after being de-authenticated.

![Scenario for capturing a WPA handshake after a de-authentication attack][8]

Figure 2: Scenario for capturing a WPA handshake after a de-authentication attack

The consideration in this example is the ETF's reliability. The goal is to find out if the tools can consistently capture the WPA handshake. The scenario will be performed multiple times with each tool to check its reliability when capturing the WPA handshake.

There is more than one way to capture a WPA handshake using the ETF. One way is to use a combination of the AirScanner and AirInjector modules; another way is to just use the AirInjector. The following scenario uses a combination of both modules.

The ETF launches the AirScanner module and analyzes the IEEE 802.11 frames to find a WPA handshake. Then the AirInjector can launch a de-authentication attack to force a reconnection. The following steps must be done to accomplish this on the ETF:

  1. Enter the AirScanner configuration mode: **config airscanner**
  2. Configure the AirScanner to not hop channels: **config airscanner**
  3. Set the channel to sniff the traffic on the access point channel (APC): **set fixed_sniffing_channel = <APC>**
  4. Start the AirScanner module with the CredentialSniffer plugin: **start airscanner with credentialsniffer**
  5. Add a target access point BSSID (APS) from the sniffed access points list: **add aps where ssid = <APS>**
  6. Start the AirInjector, which by default lauches the de-authentication attack: **start airinjector**



This simple set of commands enables the ETF to perform an efficient and successful de-authentication attack on every test run. The ETF can also capture the WPA handshake on every test run. The following code makes it possible to observe the ETF's successful execution.

```
███████╗████████╗███████╗
██╔════╝╚══██╔══╝██╔════╝
█████╗     ██║   █████╗  
██╔══╝     ██║   ██╔══╝  
███████╗   ██║   ██║    
╚══════╝   ╚═╝   ╚═╝    
                                       

[+] Do you want to load an older session? [Y/n]: n
[+] Creating new temporary session on 02/08/2018
[+] Enter the desired session name:
ETF[etf/aircommunicator/]::> config airscanner
ETF[etf/aircommunicator/airscanner]::> listargs
  sniffing_interface =               wlan1; (var)
              probes =                True; (var)
             beacons =                True; (var)
        hop_channels =               false; (var)
fixed_sniffing_channel =                  11; (var)
ETF[etf/aircommunicator/airscanner]::> start airscanner with
arpreplayer        caffelatte         credentialsniffer  packetlogger       selfishwifi        
ETF[etf/aircommunicator/airscanner]::> start airscanner with credentialsniffer
[+] Successfully added credentialsniffer plugin.
[+] Starting packet sniffer on interface 'wlan1'
[+] Set fixed channel to 11
ETF[etf/aircommunicator/airscanner]::> add aps where ssid = CrackWPA
ETF[etf/aircommunicator/airscanner]::> start airinjector
ETF[etf/aircommunicator/airscanner]::> [+] Starting deauthentication attack
                    - 1000 bursts of 1 packets
                    - 1 different packets
[+] Injection attacks finished executing.
[+] Starting post injection methods
[+] Post injection methods finished
[+] WPA Handshake found for client '70:3e:ac:bb:78:64' and network 'CrackWPA'
```

#### Launching an ARP replay attack and cracking a WEP network

The next scenario (Figure 3) will also focus on the [Address Resolution Protocol][9] (ARP) replay attack's efficiency and the speed of capturing the WEP data packets containing the initialization vectors (IVs). The same network may require a different number of caught IVs to be cracked, so the limit for this scenario is 50,000 IVs. If the network is cracked during the first test with less than 50,000 IVs, that number will be the new limit for the following tests on the network. The cracking tool to be used will be **aircrack-ng**.

The test scenario starts with an access point using WEP encryption and an offline client that knows the key—the key for testing purposes is 12345, but it can be a larger and more complex key. Once the client connects to the WEP access point, it will send out a gratuitous ARP packet; this is the packet that's meant to be captured and replayed. The test ends once the limit of packets containing IVs is captured.

![Scenario for capturing a WPA handshake after a de-authentication attack][11]

Figure 3: Scenario for capturing a WPA handshake after a de-authentication attack

ETF uses Python's Scapy library for packet sniffing and injection. To minimize known performance problems in Scapy, ETF tweaks some of its low-level libraries to significantly speed packet injection. For this specific scenario, the ETF uses **tcpdump** as a background process instead of Scapy for more efficient packet sniffing, while Scapy is used to identify the encrypted ARP packet.

This scenario requires the following commands and operations to be performed on the ETF:

  1. Enter the AirScanner configuration mode: **config airscanner**
  2. Configure the AirScanner to not hop channels: **set hop_channels = false**
  3. Set the channel to sniff the traffic on the access point channel (APC): **set fixed_sniffing_channel = <APC>**
  4. Enter the ARPReplayer plugin configuration mode: **config arpreplayer**
  5. Set the target access point BSSID (APB) of the WEP network: **set target_ap_bssid <APB>**
  6. Start the AirScanner module with the ARPReplayer plugin: **start airscanner with arpreplayer**



After executing these commands, ETF correctly identifies the encrypted ARP packet, then successfully performs an ARP replay attack, which cracks the network.

#### Launching a catch-all honeypot

The scenario in Figure 4 creates multiple access points with the same SSID. This technique discovers the encryption type of a network that was probed for but out of reach. By launching multiple access points with all security settings, the client will automatically connect to the one that matches the security settings of the locally cached access point information.

![Scenario for capturing a WPA handshake after a de-authentication attack][13]

Figure 4: Scenario for capturing a WPA handshake after a de-authentication attack

Using the ETF, it is possible to configure the **hostapd** configuration file then launch the program in the background. Hostapd supports launching multiple access points on the same wireless card by configuring virtual interfaces, and since it supports all types of security configurations, a complete catch-all honeypot can be set up. For the WEP and WPA(2)-PSK networks, a default password is used, and for the WPA(2)-EAP, an "accept all" policy is configured.

For this scenario, the following commands and operations must be performed on the ETF:

  1. Enter the APLauncher configuration mode: **config aplauncher**
  2. Set the desired access point SSID (APS): **set ssid = <APS>**
  3. Configure the APLauncher as a catch-all honeypot: **set catch_all_honeypot = true**
  4. Start the AirHost module: **start airhost**



With these commands, the ETF can launch a complete catch-all honeypot with all types of security configurations. ETF also automatically launches the DHCP and DNS servers that allow clients to stay connected to the internet. ETF offers a better, faster, and more complete solution to create catch-all honeypots. The following code enables the successful execution of the ETF to be observed.

```
███████╗████████╗███████╗
██╔════╝╚══██╔══╝██╔════╝
█████╗     ██║   █████╗  
██╔══╝     ██║   ██╔══╝  
███████╗   ██║   ██║    
╚══════╝   ╚═╝   ╚═╝    
                                       

[+] Do you want to load an older session? [Y/n]: n
[+] Creating ne´,cxzw temporary session on 03/08/2018
[+] Enter the desired session name:
ETF[etf/aircommunicator/]::> config aplauncher
ETF[etf/aircommunicator/airhost/aplauncher]::> setconf ssid CatchMe
ssid = CatchMe
ETF[etf/aircommunicator/airhost/aplauncher]::> setconf catch_all_honeypot true
catch_all_honeypot = true
ETF[etf/aircommunicator/airhost/aplauncher]::> start airhost
[+] Killing already started processes and restarting network services
[+] Stopping dnsmasq and hostapd services
[+] Access Point stopped...
[+] Running airhost plugins pre_start
[+] Starting hostapd background process
[+] Starting dnsmasq service
[+] Running airhost plugins post_start
[+] Access Point launched successfully
[+] Starting dnsmasq service
```

### Conclusions and future work

These scenarios use common and well-known attacks to help validate the ETF's capabilities for testing WiFi networks and clients. The results also validate that the framework's architecture enables new attack vectors and features to be developed on top of it while taking advantage of the platform's existing capabilities. This should accelerate development of new WiFi penetration-testing tools, since a lot of the code is already written. Furthermore, the fact that complementary WiFi technologies are all integrated in a single tool will make WiFi pen-testing simpler and more efficient.

The ETF's goal is not to replace existing tools but to complement them and offer a broader choice to security auditors when conducting WiFi pen-testing and improving user awareness.

The ETF is an open source project [available on GitHub][14] and community contributions to its development are welcomed. Following are some of the ways you can help.

One of the limitations of current WiFi pen-testing is the inability to log important events during tests. This makes reporting identified vulnerabilities both more difficult and less accurate. The framework could implement a logger that can be accessed by every class to create a pen-testing session report.

The ETF tool's capabilities cover many aspects of WiFi pen-testing. On one hand, it facilitates the phases of WiFi reconnaissance, vulnerability discovery, and attack. On the other hand, it doesn't offer a feature that facilitates the reporting phase. Adding the concept of a session and a session reporting feature, such as the logging of important events during a session, would greatly increase the value of the tool for real pen-testing scenarios.

Another valuable contribution would be extending the framework to facilitate WiFi fuzzing. The IEEE 802.11 protocol is very complex, and considering there are multiple implementations of it, both on the client and access point side, it's safe to assume these implementations contain bugs and even security flaws. These bugs could be discovered by fuzzing IEEE 802.11 protocol frames. Since Scapy allows custom packet creation and injection, a fuzzer can be implemented through it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/evil-twin-framework

作者：[André Esser][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/andreesser
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Rogue_access_point
[2]: https://www.python.org/
[3]: https://scapy.net
[4]: /file/417776
[5]: https://opensource.com/sites/default/files/uploads/pic1.png (Evil-Twin Framework Architecture)
[6]: https://www.metasploit.com
[7]: /file/417781
[8]: https://opensource.com/sites/default/files/uploads/pic2.png (Scenario for capturing a WPA handshake after a de-authentication attack)
[9]: https://en.wikipedia.org/wiki/Address_Resolution_Protocol
[10]: /file/417786
[11]: https://opensource.com/sites/default/files/uploads/pic3.png (Scenario for capturing a WPA handshake after a de-authentication attack)
[12]: /file/417791
[13]: https://opensource.com/sites/default/files/uploads/pic4.png (Scenario for capturing a WPA handshake after a de-authentication attack)
[14]: https://github.com/Esser420/EvilTwinFramework
