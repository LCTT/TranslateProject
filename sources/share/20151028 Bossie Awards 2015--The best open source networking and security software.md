Bossie Awards 2015: The best open source networking and security software
================================================================================
InfoWorld's top picks of the year among open source tools for building, operating, and securing networks 

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-net-sec-100614459-orig.jpg)

### The best open source networking and security software ###

BIND, Sendmail, OpenSSH, Cacti, Nagios, Snort -- open source software seems to have been invented for networks, and many of the oldies and goodies are still going strong. Among our top picks in the category this year, you'll find a mix of stalwarts, mainstays, newcomers, and upstarts perfecting the arts of network management, security monitoring, vulnerability assessment, rootkit detection, and much more.

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-icinga-100614482-orig.jpg)

### Icinga 2 ###

Icinga began life as a fork of system monitoring application Nagios. [Icinga 2][1] was completely rewritten to give users a modern interface, support for multiple databases, and an API to integrate numerous extensions. With out-of-the-box load balancing, notifications, and configuration, Icinga 2 shortens the time to installation for complex environments. Icinga 2 supports Graphite natively, giving administrators real-time performance graphing without any fuss. But what puts Icinga back on the radar this year is its release of Icinga Web 2, a graphical front end with drag-and-drop customizable dashboards and streamlined monitoring tools.

Administrators can view, filter, and prioritize problems, while keeping track of which actions have already been taken. A new matrix view lets administrators view hosts and services on one page. You can view events over a particular time period or filter incidents to understand which ones need immediate attention. Icinga Web 2 may boast a new interface and zippier performance, but all the usual commands from Icinga Classic and Icinga Web are still available. That means there is no downtime trying to learn a new version of the tool.

-- Fahmida Rashid

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-zenoss-100614465-orig.jpg)

### Zenoss Core ###

Another open source stalwart, [Zenoss Core][2] gives network administrators a complete, one-stop solution for tracking and managing all of the applications, servers, storage, networking components, virtualization tools, and other elements of an enterprise infrastructure. Administrators can make sure the hardware is running efficiently and take advantage of the modular design to plug in ZenPacks for extended functionality.

Zenoss Core 5, released in February of this year, takes the already powerful tool and improves it further, with an enhanced user interface and expanded dashboard. The Web-based console and dashboards were already highly customizable and dynamic, and the new version now lets administrators mash up multiple component charts onto a single chart. Think of it as the tool for better root cause and cause/effect analysis.

Portlets give additional insights for network mapping, device issues, daemon processes, production states, watch lists, and event views, to name a few. And new HTML5 charts can be exported outside the tool. The Zenoss Control Center allows out-of-band management and monitoring of all Zenoss components. Zenoss Core has new tools for online backup and restore, snapshots and rollbacks, and multihost deployment. Even more important, deployments are faster with full Docker support. 

-- Fahmida Rashid

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-opennms-100614461-orig.jpg)

### OpenNMS ###

An extremely flexible network management solution, [OpenNMS][3] can handle any network management task, whether it's device management, application performance monitoring, inventory control, or events management. With IPv6 support, a robust alerts system, and the ability to record user scripts to test Web applications, OpenNMS has everything network administrators and testers need. OpenNMS has become, as now a mobile dashboard, called OpenNMS Compass, lets networking pros keep an eye on their network even when they're out and about.

The iOS version of the app, which is available on the [iTunes App Store][4], displays outages, nodes, and alarms. The next version will offer additional event details, resource graphs, and information about IP and SNMP interfaces. The Android version, available on [Google Play][5], displays network availability, outages, and alarms on the dashboard, as well as the ability to acknowledge, escalate, or clear alarms. The mobile clients are compatible with OpenNMS Horizon 1.12 or greater and OpenNMS Meridian 2015.1.0 or greater.

-- Fahmida Rashid

![](http://images.techhive.com/images/article/2015/09/bossies-2015-onion-100614460-orig.jpg)

### Security Onion ###

Like an onion, network security monitoring is made of many layers. No single tool will give you visibility into every attack or show you every reconnaissance or foot-printing session on your company network. [Security Onion][6] bundles scores of proven tools into one handy Ubuntu distro that will allow you to see who's inside your network and help keep the bad guys out.

Whether you're taking a proactive approach to network security monitoring or following up on a potential attack, Security Onion can assist. Consisting of sensor, server, and display layers, the Onion combines full network packet capture with network-based and host-based intrusion detection, and it serves up all of the various logs for inspection and analysis.

The star-studded network security toolchain includes Netsniff-NG for packet capture, Snort and Suricata for rules-based network intrusion detection, Bro for analysis-based network monitoring, OSSEC for host intrusion detection, and Sguil, Squert, Snorby, and ELSA (Enterprise Log Search and Archive) for display, analysis, and log management. It’s a carefully vetted collection of tools, all wrapped in a wizard-driven installer and backed by thorough documentation, that can help you get from zero to monitoring as fast as possible.

-- Victor R. Garza

![](http://images.techhive.com/images/article/2015/09/bossies-2015-kali-100614458-orig.jpg)

Kali Linux

The team behind [Kali Linux][7] revamped the popular security Linux distribution this year to make it faster and even more versatile. Kali sports a new 4.0 kernel, improved hardware and wireless driver support, and a snappier interface. The most popular tools are easily accessible from a dock on the side of the screen. The biggest change? Kali Linux is now a rolling distribution, with a continuous stream of software updates. Kali's core system is based on Debian Jessie, and the team will pull packages continuously from Debian Testing, while continuing to add new Kali-flavored features on top.

The distribution still comes jam-packed with tools for penetration testing, vulnerability analysis, security forensics, Web application analysis, wireless networking and assessment, reverse engineering, and exploitation tools. Now the distribution has an upstream version checking system that will automatically notify users when updates are available for the individual tools. The distribution also features ARM images for a range of devices, including Raspberry Pi, Chromebook, and Odroids, as well as updates to the NetHunter penetration testing platform that runs on Android devices. There are other changes too: Metasploit Community/Pro is no longer included, because Kali 2.0 is not yet [officially supported by Rapid7][8]. 

-- Fahmida Rashid

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-openvas-100614462-orig.jpg)

### OpenVAS ###

[OpenVAS][9], the Open Vulnerability Assessment System, is a framework that combines multiple services and tools to offer vulnerability scanning and vulnerability management. The scanner is coupled with a weekly feed of network vulnerability tests, or you can use a feed from a commercial service. The framework includes a command-line interface (so it can be scripted) and an SSL-secured, browser-based interface via the [Greenbone Security Assistant][10]. OpenVAS accommodates various plug-ins for additional functionality. Scans can be scheduled or run on-demand.

Multiple OpenVAS installations can be controlled through a single master, which makes this a scalable vulnerability assessment tool for enterprises. The project is as compatible with standards as can be: Scan results and configurations are stored in a SQL database, where they can be accessed easily by external reporting tools. Client tools access the OpenVAS Manager via the XML-based stateless OpenVAS Management Protocol, so security administrators can extend the functionality of the framework. The software can be installed from packages or source code to run on Windows or Linux, or downloaded as a virtual appliance.

-- Matt Sarrel

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-owasp-100614463-orig.jpg)

### OWASP ###

[OWASP][11], the Open Web Application Security Project, is a nonprofit organization with worldwide chapters focused on improving software security. The community-driven organization provides test tools, documentation, training, and almost anything you could imagine that’s related to assessing software security and best practices for developing secure software. Several OWASP projects have become valuable components of many a security practitioner's toolkit:

[ZAP][12], the Zed Attack Proxy Project, is a penetration test tool for finding vulnerabilities in Web applications. One of the design goals of ZAP was to make it easy to use so that developers and functional testers who aren't security experts can benefit from using it. ZAP provides automated scanners and a set of manual test tools.

The [Xenotix XSS Exploit Framework][13] is an advanced cross-site scripting vulnerability detection and exploitation framework that runs scans within browser engines to get real-world results. The Xenotix Scanner Module uses three intelligent fuzzers, and it can run through nearly 5,000 distinct XSS payloads. An API lets security administrators extend and customize the exploit toolkit.

[O-Saft][14], or the OWASP SSL advanced forensic tool, is an SSL auditing tool that shows detailed information about SSL certificates and tests SSL connections. This command-line tool can run online or offline to assess SSL security such as ciphers and configurations. O-Saft provides built-in checks for common vulnerabilities, and you can easily extend these through scripting. In May 2015 a simple GUI was added as an optional download.

[OWTF][15], the Offensive Web Testing Framework, is an automated test tool that follows OWASP testing guidelines and the NIST and PTES standards. The framework uses both a Web UI and a CLI, and it probes Web and application servers for common vulnerabilities such as improper configuration and unpatched software.

-- Matt Sarrel

![](http://core0.staticworld.net/images/article/2015/09/bossies-2015-beef-100614456-orig.jpg)

### BeEF ###

The Web browser has become the most common vector for attacks against clients. [BeEF][15], the Browser Exploitation Framework Project, is a widely used penetration tool to assess Web browser security. BeEF helps you expose the security weaknesses of client systems using client-side attacks launched through the browser. BeEF sets up a malicious website, which security administrators visit from the browser they want to test. BeEF then sends commands to attack the Web browser and use it to plant software on the client machine. Administrators can then launch attacks on the client machine as if they were zombies.

BeEF comes with commonly used modules like a key logger, a port scanner, and a Web proxy, plus you can write your own modules or send commands directly to the zombified test machine. BeEF comes with a handful of demo Web pages to help you get started and makes it very easy to write additional Web pages and attack modules so you can customize testing to your environment. BeEF is a valuable test tool for assessing browser and endpoint security and for learning how browser-based attacks are launched. Use it to put together a demo to show your users how malware typically infects client devices.

-- Matt Sarrel

![](http://images.techhive.com/images/article/2015/09/bossies-2015-unhide-100614464-orig.jpg)

### Unhide ###

[Unhide][16] is a forensic tool that locates open TCP/UDP ports and hidden process on UNIX, Linux, and Windows. Hidden ports and processes can be the result of rootkit or LKM (loadable kernel module) activity. Rootkits can be difficult to find and remove because they are designed to be stealthy, hiding themselves from the OS and user. A rootkit can use LKMs to hide its processes or impersonate other processes, allowing it to run on machines undiscovered for a long time. Unhide can provide the assurance that administrators need to know their systems are clean.

Unhide is really two separate scripts: one for processes and one for ports. The tool interrogates running processes, threads, and open ports and compares this info to what's registered with the system as active, reporting discrepancies. Unhide and WinUnhide are extremely lightweight scripts that run from the command line to produce text output. They're not pretty, but they are extremely useful. Unhide is also included in the [Rootkit Hunter][17] project.

-- Matt Sarrel

![](http://images.techhive.com/images/article/2015/09/bossies-2015-main-100614457-orig.jpg)

Read about more open source winners

InfoWorld's Best of Open Source Awards for 2014 celebrate more than 100 open source projects, from the bottom of the stack to the top. Follow these links to more open source winners:

[Bossie Awards 2015: The best open source applications][18]

[Bossie Awards 2015: The best open source application development tools][19]

[Bossie Awards 2015: The best open source big data tools][20]

[Bossie Awards 2015: The best open source data center and cloud software][21]

[Bossie Awards 2015: The best open source desktop and mobile software][22]

[Bossie Awards 2015: The best open source networking and security software][23]

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/2982962/open-source-tools/bossie-awards-2015-the-best-open-source-networking-and-security-software.html

作者：[InfoWorld staff][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/InfoWorld-staff/
[1]:https://www.icinga.org/icinga/icinga-2/
[2]:http://www.zenoss.com/
[3]:http://www.opennms.org/
[4]:https://itunes.apple.com/us/app/opennms-compass/id968875097?mt=8
[5]:https://play.google.com/store/apps/details?id=com.opennms.compass&hl=en
[6]:http://blog.securityonion.net/p/securityonion.html
[7]:https://www.kali.org/
[8]:https://community.rapid7.com/community/metasploit/blog/2015/08/12/metasploit-on-kali-linux-20
[9]:http://www.openvas.org/
[10]:http://www.greenbone.net/
[11]:https://www.owasp.org/index.php/Main_Page
[12]:https://www.owasp.org/index.php/OWASP_Zed_Attack_Proxy_Project
[13]:https://www.owasp.org/index.php/O-Saft
[14]:https://www.owasp.org/index.php/OWASP_OWTF
[15]:http://www.beefproject.com/
[16]:http://www.unhide-forensics.info/
[17]:http://www.rootkit.nl/projects/rootkit_hunter.html
[18]:http://www.infoworld.com/article/2982622/bossie-awards-2015-the-best-open-source-applications.html
[19]:http://www.infoworld.com/article/2982920/bossie-awards-2015-the-best-open-source-application-development-tools.html
[20]:http://www.infoworld.com/article/2982429/bossie-awards-2015-the-best-open-source-big-data-tools.html
[21]:http://www.infoworld.com/article/2982923/bossie-awards-2015-the-best-open-source-data-center-and-cloud-software.html
[22]:http://www.infoworld.com/article/2982630/bossie-awards-2015-the-best-open-source-desktop-and-mobile-software.html
[23]:http://www.infoworld.com/article/2982962/bossie-awards-2015-the-best-open-source-networking-and-security-software.html