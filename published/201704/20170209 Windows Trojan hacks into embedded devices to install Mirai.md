Windows 木马攻破嵌入式设备来安装 Mirai 恶意软件
============================================================

> 木马尝试使用出厂默认凭证对不同协议进行身份验证，如果成功则会部署 Mirai 僵尸程序。

 ![Windows Trojan uses brute-force attacks against IoT devices.](http://images.techhive.com/images/idgnsImport/2015/08/id-2956907-matrix-434036-100606417-large.jpg) 

*图片来源: Gerd Altmann / Pixabay*

攻击者已经开始使用 Windows 和 Android 恶意软件入侵嵌入式设备，这消除了人们广泛持有的想法，认为如果设备不直接暴露在互联网上，那么它们就不那么脆弱。

来自俄罗斯防病毒供应商 Doctor Web 的研究人员最近[遇到了一个 Windows 木马程序][21]，它使用暴力方法访问嵌入式设备，并在其上安装 Mirai 恶意软件。

Mirai 是一种用在基于 Linux 的物联网设备的恶意程序，例如路由器、IP 摄像机、数字录像机等。它主要通过使用出厂设备凭据来发动分布式拒绝服务 （DDoS） 攻击并通过 Telnet 传播。

Mirai 的僵尸网络在过去六个月里一直被用来发起最大型的 DDoS 攻击。[它的源代码泄漏][22]之后，恶意软件被用来感染超过 50 万台设备。

Doctor Web 发现，一旦在一台 Windows 上安装之后，该新木马会从命令控制服务器下载配置文件。该文件包含一系列 IP 地址，通过多个端口，包括 22（SSH）和 23（Telnet），尝试进行身份验证。

如果身份验证成功，恶意软件将会根据受害系统的类型。执行配置文件中指定的某些命令。在通过 Telnet 访问的 Linux 系统中，木马会下载并执行一个二进制包，然后安装 Mirai 僵尸程序。

如果按照设计或配置，受影响的设备不会从 Internet 直接访问，那么许多物联网供应商会降低漏洞的严重性。这种思维方式假定局域网是信任和安全的环境。

然而事实并非如此，其他威胁如跨站点请求伪造已经出现了多年。但 Doctor Web 发现的新木马似乎是第一个专门设计用于劫持嵌入式或物联网设备的 Windows 恶意软件。

Doctor Web 发现的新木马被称为 [Trojan.Mirai.1][23]，从它可以看到，攻击者还可以使用受害的计算机来攻击不能从互联网直接访问的物联网设备。

受感染的智能手机可以以类似的方式使用。卡巴斯基实验室的研究人员已经[发现了一个 Android 程序][24]，通过本地网络对路由器执行暴力密码猜测攻击。

--------------------------------------------------------------------------------

via: http://www.csoonline.com/article/3168357/security/windows-trojan-hacks-into-embedded-devices-to-install-mirai.html

作者：[Lucian Constantin][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

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
