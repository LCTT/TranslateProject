[#]: subject: "Tools You Can Use for the Security Audit of IoT Devices"
[#]: via: "https://www.opensourceforu.com/2022/05/tools-you-can-use-for-the-security-audit-of-iot-devices/"
[#]: author: "Dr Kumar Gaurav https://www.opensourceforu.com/author/dr-gaurav-kumar/"
[#]: collector: "lkxed"
[#]: translator: "tendertime "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

物联网安全认证工具集锦
======

数字化转型涉及数据驱动的决策与人工智能（AI）的结合。物联网（IoT）设备和小工具传播了重要的数据。由于物联网设备常常处于不安全的环境，而且由于缺乏内生安全机制的脆弱性，很难免于潜在的网络攻击。以下是一些用于实现安全认证的开源工具，可以降低此类攻击风险。

![Screenshot 2022-05-02 154427][1]

网络攻击者和嗅探器可以访问物联网设备的敏感数据，并利用这些信息对其他相关系统发起攻击。反病毒和计算机安全服务公司卡巴斯基（Kaspersky）表示，在 2021，物联网黑客数量同比增长了两倍多。

在很大程度上，黑客通过使用 Telnet 协议访问物联网网络，该协议为通过互联网与设备或服务器进行通信提供了命令行接口。根据研究报告，超过 58% 的物联网入侵使用各种协议以求实现挖掘加密货币、通过分布式拒绝服务（DDoS）攻击关闭系统、窃取机密数据的目的。
由于人们在疫情期间居家使用物联网设备的时间增加，安全风险也随之上升。这些物联网小工具中的大部分无论是个人用还是商用，都缺乏基本的安全措施。人工智能和边缘计算等新技术也使网络和数据安全形势复杂化。卡巴斯基的一位安全专家 Dan Kaspersky 表示：智能小工具变得流行，攻击的数量也随之上升了。

![Key components in PENIOT][2]

### 物联网小工具的安全需要

网络攻击一直在进化，商业公司和政府部门都在采用越来越复杂的网络安全设施以防止他们的应用和架构免于在线攻击。全球渗透测试市场预计将从 2021 的 16 亿美元增长到 2026 年的 30 亿美元，2021 至 2026 年的复合年增长率为 13.8%。
物联网设备的渗透测试是一个热门话题，在这一领域有大量研究。即使采用“设计安全”的方法，渗透对于识别真正的安全危险并采取适当的预防措施也是至关重要的。
物联网部署中需要安全和隐私的关键部分和协议包括：

* 受限应用协议 (Constraint application protocol,CoAP)
* 蓝牙低功耗(Bluetooth low energy，BLE)
* 高级消息队列协议(Advanced message queuing protocol，AMQP)
* 消息队列遥测传输(Message queuing telemetry transport，MQTT)

攻击者有多种可能的入口访问到联网设备。在物联网渗透测试（或安全审计）时，测试完整的物联网场景和生态。测试内容包括从单个层和嵌入式软件到通信协议和服务器的所有内容。服务器、在线接口和移动应用的测试并非物联网独有，但至关重要，因为它们涵盖了故障可能性很高的领域。物联网漏洞是电气、嵌入式软件和通信协议测试的重点。
以下测试在评估联网设备的安全性时使用。这些测试都是使用不同的针对漏洞的高性能渗透测试和安全审计工具完成的：

* 通信端口中的攻击和操纵测试
* 基于无线电信号捕获和分析的 IoT 嗅探
* 接口和后门测试
* 缓存溢出测试
* 密码破解测试
* 调试
* 密码学分析
* 固件操纵测试
* 逆向工程
* 内存泄漏

![][3]

### 物联网安全认证使用的开源工具

物联网设备在我们的日常生活中变得越来越普遍。智能自行车、健身跟踪器、医疗传感器、智能锁和相关工厂就是此类设备的几个例子。所有这些设备和小工具都可以使用开源工具来抵御网络攻击，本文将简要介绍其中一些工具。

#### PENIOT

https://github.com/yakuza8/peniot

PENIOT 是一种物联网渗透测试工具，使安全审计团队能够通过利用设备的连接来测试和破坏具有各种安全威胁的设备。测试主动和被动安全威胁都可以被测试。在确定目标设备和相关信息（或参数）后，可以进行主动安全攻击，例如改变系统资源、重放合法通信单元等。还可以分析被动安全威胁，例如破坏敏感数据的机密性或访问网络流量分析。

#### Objection

https://github.com/sensepost/objection
Objective 是一个对物联网环境中使用的Android和iOS应用程序进行详细分析和安全审计的工具。目前许多智能小工具和设备都在使用安卓和 iOS 平台，使用该工具可以通过详细的日志和安全审计报告对这些平台进行分析。

#### Routersploit

https://github.com/threat9/routersploit

这个针对嵌入式设备的开源开发框架具有多个用于渗透测试和安全审计的功能和模块：
* Exploits——漏洞评估
* Creds–网络服务和证书的测试
* Scanners——对目标进行详细的安全审计
* Payloads–有效载荷和注入关键点的生成
* Generic-执行和测试攻击

#### Wireshark

https://www.wireshark.org

Wireshark 是一款功能丰富的、免费的网络协议分析器。MQTT 等多种物联网协议可通过该工具实现有效分析。为了发现弱点，可以根据协议配置安全规则并检查流量。可以使用 tcpdump 通过命令行访问网络数据包分析器。此类工具用于检查物联网设备和网络之间交换的数据包。

#### Binwalk

https://www.kali.org/tools/binwalk

Binwalk是一种逆向硬件设计的工具。它是Kali Linux的关键组件之一，用于渗透测试、服务器指纹识别、安全审计和取证应用。


#### Firmwalker

https://github.com/craigz28/firmwalker

Firmwalker是一款免费的开源工具，用于搜索和扫描固件文件系统，无论是解压缩还是挂载。可以使用此工具进行详细的安全审计。

在物联网和万物互联的时代，有必要设计并使用高性能工具包进行渗透测试和安全审计。随着物联网设备数量的增加，安全风险也在增加。

为了物联网和万物互联部署有更高级别的安全和隐私，有必要根据最新的协议和动态的流量定制化免费、开源的工具箱和软件包。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/05/tools-you-can-use-for-the-security-audit-of-iot-devices/

作者：[Dr Kumar Gaurav][a]
选题：[lkxed][b]
译者：[tendertime](https://github.com/tendertime)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/dr-gaurav-kumar/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/03/Screenshot-2022-05-02-154427-696x422.png
[2]: https://www.opensourceforu.com/wp-content/uploads/2022/03/Figure-1-Key-components-in-PENIOT.jpg
[3]: https://www.opensourceforu.com/wp-content/uploads/2022/03/Screenshot-2022-05-02-153653-590x282.png
