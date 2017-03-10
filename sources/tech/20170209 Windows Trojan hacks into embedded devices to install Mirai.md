Windows Trojan hacks into embedded devices to install Mirai
============================================================

> The Trojan tries to authenticate over different protocols with factory default credentials and, if successful, deploys the Mirai bot


 ![Windows Trojan uses brute-force attacks against IoT devices.](http://images.techhive.com/images/idgnsImport/2015/08/id-2956907-matrix-434036-100606417-large.jpg) 


Attackers have started to use Windows and Android malware to hack into embedded devices, dispelling the widely held belief that if such devices are not directly exposed to the Internet they're less vulnerable.

Researchers from Russian antivirus vendor Doctor Web have recently [come across a Windows Trojan program][21] that was designed to gain access to embedded devices using brute-force methods and to install the Mirai malware on them.

Mirai is a malware program for Linux-based internet-of-things devices, such as routers, IP cameras, digital video recorders and others. It's used primarily to launch distributed denial-of-service (DDoS) attacks and spreads over Telnet by using factory device credentials.

The Mirai botnet has been used to launch some of the largest DDoS attacks over the past six months. After [its source code was leaked][22], the malware was used to infect more than 500,000 devices.

Once installed on a Windows computer, the new Trojan discovered by Doctor Web downloads a configuration file from a command-and-control server. That file contains a range of IP addresses to attempt authentication over several ports including 22 (SSH) and 23 (Telnet).

#### [■ GET YOUR DAILY SECURITY NEWS: Sign up for CSO's security newsletters][11]


If authentication is successful, the malware executes certain commands specified in the configuration file, depending on the type of compromised system. In the case of Linux systems accessed via Telnet, the Trojan downloads and executes a binary package that then installs the Mirai bot.

Many IoT vendors downplay the severity of vulnerabilities if the affected devices are not intended or configured for direct access from the Internet. This way of thinking assumes that LANs are trusted and secure environments.

This was never really the case, with other threats like cross-site request forgery attacks going around for years. But the new Trojan that Doctor Web discovered appears to be the first Windows malware specifically designed to hijack embedded or IoT devices.

This new Trojan found by Doctor Web, dubbed [Trojan.Mirai.1][23], shows that attackers can also use compromised computers to target IoT devices that are not directly accessible from the internet.

Infected smartphones can be used in a similar way. Researchers from Kaspersky Lab have already [found an Android app][24] designed to perform brute-force password guessing attacks against routers over the local network.

--------------------------------------------------------------------------------

via: http://www.csoonline.com/article/3168357/security/windows-trojan-hacks-into-embedded-devices-to-install-mirai.html

作者：[ Lucian Constantin][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.csoonline.com/author/Lucian-Constantin/
[1]:http://www.csoonline.com/article/3133744/internet-of-things/fasten-your-seatbelt-in-the-iot-cybersecurity-race.html
[2]:http://www.csoonline.com/article/3150881/internet-of-things/data-breaches-through-wearables-put-target-squarely-on-iot-in-2017.html
[3]:http://www.csoonline.com/article/3144197/security/upgraded-mirai-botnet-disrupts-deutsche-telekom-by-infecting-routers.html
[4]:http://www.csoonline.com/video/73795/security-sessions-the-csos-role-in-active-shooter-planning
[5]:http://www.idgnews.net/
[6]:http://www.csoonline.com/article/3133744/internet-of-things/fasten-your-seatbelt-in-the-iot-cybersecurity-race.html
[7]:http://www.csoonline.com/article/3150881/internet-of-things/data-breaches-through-wearables-put-target-squarely-on-iot-in-2017.html
[8]:http://www.csoonline.com/article/3144197/security/upgraded-mirai-botnet-disrupts-deutsche-telekom-by-infecting-routers.html
[9]:http://www.csoonline.com/video/73795/security-sessions-the-csos-role-in-active-shooter-planning
[10]:http://www.csoonline.com/video/73795/security-sessions-the-csos-role-in-active-shooter-planning
[11]:http://csoonline.com/newsletters/signup.html#tk.cso-infsb
[12]:http://www.csoonline.com/author/Lucian-Constantin/
[13]:https://twitter.com/intent/tweet?url=http%3A%2F%2Fwww.csoonline.com%2Farticle%2F3168357%2Fsecurity%2Fwindows-trojan-hacks-into-embedded-devices-to-install-mirai.html&via=csoonline&text=Windows+Trojan+hacks+into+embedded+devices+to+install+Mirai
[14]:https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.csoonline.com%2Farticle%2F3168357%2Fsecurity%2Fwindows-trojan-hacks-into-embedded-devices-to-install-mirai.html
[15]:http://www.linkedin.com/shareArticle?url=http%3A%2F%2Fwww.csoonline.com%2Farticle%2F3168357%2Fsecurity%2Fwindows-trojan-hacks-into-embedded-devices-to-install-mirai.html&title=Windows+Trojan+hacks+into+embedded+devices+to+install+Mirai
[16]:https://plus.google.com/share?url=http%3A%2F%2Fwww.csoonline.com%2Farticle%2F3168357%2Fsecurity%2Fwindows-trojan-hacks-into-embedded-devices-to-install-mirai.html
[17]:http://reddit.com/submit?url=http%3A%2F%2Fwww.csoonline.com%2Farticle%2F3168357%2Fsecurity%2Fwindows-trojan-hacks-into-embedded-devices-to-install-mirai.html&title=Windows+Trojan+hacks+into+embedded+devices+to+install+Mirai
[18]:http://www.stumbleupon.com/submit?url=http%3A%2F%2Fwww.csoonline.com%2Farticle%2F3168357%2Fsecurity%2Fwindows-trojan-hacks-into-embedded-devices-to-install-mirai.html
[19]:http://www.csoonline.com/article/3168357/security/windows-trojan-hacks-into-embedded-devices-to-install-mirai.html#email
[20]:http://www.csoonline.com/author/Lucian-Constantin/
[21]:https://news.drweb.com/news/?i=11140&lng=en
[22]:http://www.computerworld.com/article/3132359/security/hackers-create-more-iot-botnets-with-mirai-source-code.html
[23]:https://vms.drweb.com/virus/?_is=1&i=14934685
[24]:https://securelist.com/blog/mobile/76969/switcher-android-joins-the-attack-the-router-club/
[25]:http://www.csoonline.com/author/Lucian-Constantin/
