Eclipse 如何助力 IoT 发展
============================================================


> 开源组织的模块化开发方式非常适合物联网。

![How Eclipse is advancing IoT development](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/OSDC_BUS_ArchitectureOfParticipation_520x292.png?itok=FA0Uuwzv "How Eclipse is advancing IoT development")

图片来源： opensource.com

[Eclipse][3] 可能不是第一个去研究物联网的开源组织。但是，远在 IoT 家喻户晓之前，该基金会在 2001 年左右就开始支持开源软件发展商业化。

九月份的 Eclipse 物联网日和 RedMonk 的 [ThingMonk 2017][4] 一块举行，着重强调了 Eclipse 在 [物联网发展][5] 中的重要作用。它现在已经包含了 28 个项目，覆盖了大部分物联网项目需求。会议过程中，我和负责 Eclipse 市场化运作的 [Ian Skerritt][6] 讨论了 Eclipse 的物联网项目以及如何拓展它。

### 物联网的最新进展？

我问 Ian 物联网同传统工业自动化，也就是前几十年通过传感器和相应工具来实现工厂互联的方式有什么不同。 Ian 指出很多工厂是还没有互联的。

另外，他说 “SCADA [<ruby>监控和数据分析<rt>supervisory control and data analysis</rt></ruby>] 系统以及工厂底层技术都是非常私有的、独立性的。我们很难去改变它，也很难去适配它们 …… 现在，如果你想运行一套生产系统，你需要设计成百上千的单元。生产线想要的是满足用户需求，使制造过程更灵活，从而可以不断产出。” 这也就是物联网会带给制造业的一个很大的帮助。

### Eclipse 物联网方面的研究

Ian 对于 Eclipse 在物联网的研究是这样描述的：“满足任何物联网解决方案的核心基础技术” ，通过使用开源技术，“每个人都可以使用，从而可以获得更好的适配性。” 他说，Eclipse 将物联网视为包括三层互联的软件栈。从更高的层面上看，这些软件栈（按照大家常见的说法）将物联网描述为跨越三个层面的网络。特定的实现方式可能含有更多的层，但是它们一般都可以映射到这个三层模型的功能上：

* 一种可以装载设备（例如设备、终端、微控制器、传感器）用软件的堆栈。
* 将不同的传感器采集到的数据信息聚合起来并传输到网上的一类网关。这一层也可能会针对传感器数据检测做出实时反应。
* 物联网平台后端的一个软件栈。这个后端云存储数据并能根据采集的数据比如历史趋势、预测分析提供服务。

这三个软件栈在 Eclipse 的白皮书 “[The Three Software Stacks Required for IoT Architectures][7] ”中有更详细的描述。

Ian 说在这些架构中开发一种解决方案时，“需要开发一些特殊的东西，但是很多底层的技术是可以借用的，像通信协议、网关服务。需要一种模块化的方式来满足不同的需求场合。” Eclipse 关于物联网方面的研究可以概括为：开发模块化开源组件，从而可以被用于开发大量的特定性商业服务和解决方案。

### Eclipse 的物联网项目

在众多已被应用的 Eclipse 物联网应用中， Ian 举了两个和 [MQTT][8] 有关联的突出应用，一个设备与设备互联（M2M）的物联网协议。 Ian 把它描述成“一个专为重视电源管理工作的油气传输线监控系统的信息发布/订阅协议。MQTT 已经是众多物联网广泛应用标准中很成功的一个。” [Eclipse Mosquitto][9] 是 MQTT 的代理，[Eclipse Paho][10] 是他的客户端。

[Eclipse Kura][11] 是一个物联网网关，引用 Ian 的话，“它连接了很多不同的协议间的联系”，包括蓝牙、Modbus、CANbus 和 OPC 统一架构协议，以及一直在不断添加的各种协议。他说，一个优势就是，取代了你自己写你自己的协议， Kura 提供了这个功能并将你通过卫星、网络或其他设备连接到网络。”另外它也提供了防火墙配置、网络延时以及其它功能。Ian 也指出“如果网络不通时，它会存储信息直到网络恢复。”

最新的一个项目中，[Eclipse Kapua][12] 正尝试通过微服务来为物联网云平台提供不同的服务。比如，它集成了通信、汇聚、管理、存储和分析功能。Ian 说“它正在不断前进，虽然还没被完全开发出来，但是 Eurotech 和 RedHat 在这个项目上非常积极。”

Ian 说 [Eclipse hawkBit][13] ，一个软件更新管理的软件，是一项“非常有趣的项目。从安全的角度说，如果你不能更新你的设备，你将会面临巨大的安全漏洞。”很多物联网安全事故都和无法更新的设备有关，他说，“HawkBit 可以基本负责通过物联网系统来完成扩展性更新的后端管理。”

物联网设备软件升级的难度一直被看作是难度最高的安全挑战之一。物联网设备不是一直连接的，而且数目众多，再加上首先设备的更新程序很难完全正常。正因为这个原因，关于 IoT 软件升级的项目一直是被当作重要内容往前推进。

### 为什么物联网这么适合 Eclipse

在物联网发展趋势中的一个方面就是关于构建模块来解决商业问题，而不是跨越行业和公司的大物联网平台。 Eclipse 关于物联网的研究放在一系列模块栈、提供特定和大众化需求功能的项目上，还有就是指定目标所需的可捆绑式中间件、网关和协议组件上。


--------------------------------------------------------------------------------



作者简介：

Gordon Haff - Gordon Haff 是红帽公司的云专家，经常在消费者和行业会议上讲话，并且帮助发展红帽全面云化解决方案。他是《计算机前沿：云如何如何打开众多出版社未来之门》的作者。在红帽之前， Gordon 写了成百上千的研究报告，经常被引用到公众刊物上，像纽约时报关于 IT 的议题和产品建议等……

--------------------------------------------------------------------------------

via： https://opensource.com/article/17/10/eclipse-and-iot

作者：[Gordon Haff][a]
译者：[smartgrids](https://github.com/smartgrids)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ghaff
[1]:https://opensource.com/article/17/10/eclipse-and-iot?rate=u1Wr-MCMFCF4C45IMoSPUacCatoqzhdKz7NePxHOvwg
[2]:https://opensource.com/user/21220/feed
[3]:https://www.eclipse.org/home/
[4]:http://thingmonk.com/
[5]:https://iot.eclipse.org/
[6]:https://twitter.com/ianskerrett
[7]:https://iot.eclipse.org/resources/white-papers/Eclipse%20IoT%20White%20Paper%20-%20The%20Three%20Software%20Stacks%20Required%20for%20IoT%20Architectures.pdf
[8]:http://mqtt.org/
[9]:https://projects.eclipse.org/projects/technology.mosquitto
[10]:https://projects.eclipse.org/projects/technology.paho
[11]:https://www.eclipse.org/kura/
[12]:https://www.eclipse.org/kapua/
[13]:https://eclipse.org/hawkbit/
[14]:https://opensource.com/users/ghaff
[15]:https://opensource.com/users/ghaff
[16]:https://opensource.com/article/17/10/eclipse-and-iot#comments
