Linux 容器能否弥补 IoT 的安全短板？
========

![](http://hackerboards.com/files/internet_of_things_wikimedia1-thm.jpg) 

> 在这个最后的物联网系列文章中，Canonical 和 Resin.io 向以 Linux 容器技术作为解决方案向物联网安全性和互操作性发起挑战。

![](http://hackerboards.com/files/samsung_artik710-thm.jpg) 

*Artik 7*

尽管受到日益增长的安全威胁，但对物联网（IoT）的炒作没有显示减弱的迹象。为了刷存在感，公司们正忙于重新规划它们的物联网方面的路线图。物联网大潮迅猛异常，比移动互联网革命渗透的更加深入和广泛。IoT 像黑洞一样，吞噬一切，包括智能手机，它通常是我们通向物联网世界的窗口，有时也作为我们的汇聚点或终端。

新的针对物联网的处理器和嵌入式主板继续重塑其技术版图。自从 9 月份推出 [面向物联网的 Linux 和开源硬件][5] 系列文章之后，我们看到了面向物联网网关的 “Apollo Lake]” SoC 芯片 [Intel Atom E3900][6] 以及[三星  新的 Artik 模块][7]，包括用于网关并由 Linux 驱动的 64 位 Artik 7 COM 及自带 RTOS 的 Cortex-M4  Artik。 ARM 为具有 ARMv8-M 和 TrustZone 安全性的 IoT 终端发布了 [Cortex-M23 和 Cortex-M33][8] 芯片。

讲道理，安全是这些产品的卖点。最近攻击 Dyn 服务并在一天内摧毁了美国大部分互联网的 Mirai 僵尸网络将基于 Linux 的物联网推到台前 - 当然这种方式似乎不太体面。就像 IoT 设备可以成为 DDoS 的帮凶一样，设备及其所有者同样可能直接遭受恶意攻击。

![](http://hackerboards.com/files/arm_cortexm33m23-thm.jpg) 

*Cortex-M33 和 -M23*

Dyn 攻击更加证明了这种观点，即物联网将更加蓬勃地在受控制和受保护的工业环境发展，而不是家用环境中。这不是因为没有消费级[物联网安全技术][9]，但除非产品设计之初就以安全为目标，否则如我们的[智能家居集线器系列][10]中的许多解决方案一样，后期再考虑安全就会增加成本和复杂性。

在物联网系列的最后这个未来展望的部分，我们将探讨两种基于 Linux 的面向 Docker 的容器技术，这些技术被提出作为物联网安全解决方案。容器还可以帮助解决我们在[物联网框架][11]中探讨的开发复杂性和互操作性障碍的问题。

我们与 Canonical 的 Ubuntu 客户平台工程副总裁 Oliver Ries 讨论了 Ubuntu Core 和适用于 Docker 的容器式 Snaps 包管理技术。我们还就新的基于 Docker 的物联网方案 ResinOS 采访了 Resin.io 首席执行官和联合创始人 Alexandros Marinos。

### Ubuntu Core Snaps

Canonical 面向物联网的 [Snappy Ubuntu Core][12] 版本的 Ubuntu 是围绕一个类似容器的快照包管理机制而构建的，并提供应用商店支持。 snaps 技术最近[自行发布了][13]用于其他 Linux 发行版的版本。去年 11 月 3 日，Canonical 发布了 [Ubuntu Core 16] [14]，该版本改进了白标应用商店和更新控制服务。

 

![](http://hackerboards.com/files/canonical_ubuntucore16_diagram.jpg) 


*传统 Ubuntu（左）架构 与 Ubuntu Core 16*

快照机制提供自动更新，并有助于阻止未经授权的更新。 使用事务系统管理，快照可确保更新按预期部署或根本不部署。 在 Ubuntu Core 中，使用 AppArmor 进一步加强了安全性，并且所有应用程序文件都是只读的且保存在隔离的孤岛中。

![](http://hackerboards.com/files/limesdr-thm.jpg) 

*LimeSDR*

Ubuntu Core 是我们最近展开的[开源物联网操作系统调查][16]的一部分，现在运行于 Gumstix 主板、Erle 机器人无人机、Dell Edge 网关、[Nextcloud Box][17]、LimeSDR、Mycroft 家庭集线器、英特尔的 Joule 和符合 Linaro 的 96Boards 规范的 SBC（单板计算机） 上。 Canonical 公司还与 Linaro 物联网和嵌入式（LITE）部门集团在其 [96Boards 物联网版（IE）][18] 上达成合作。最初，96Boards IE 专注于 Zephyr 驱动的 Cortex-M4 板卡，如 Seeed 的 [BLE Carbon] [19]，不过它将扩展到可以运行 Ubuntu Core 的网关板卡上。

“Ubuntu Core 和 snaps 具有从边缘到网关到云的相关性，”Canonical 的 Ries 说。 “能够在任何主要发行版（包括 Ubuntu Server 和 Ubuntu for Cloud）上运行快照包，使我们能够提供一致的体验。 snaps 可以使用事务更新以免故障方式升级，可用于安全性更新、错误修复或新功能的持续更新，这在物联网环境中非常重要。”

![](http://hackerboards.com/files/nextcloud_box3-thm.jpg) 

*Nextcloud盒子*

安全性和可靠性是关注的重点，Ries 说。 “snaps 应用可以完全独立于彼此和操作系统而运行，使得两个应用程序可以安全地在单个网关上运行，”他说。 “snaps 是只读的和经过认证的，可以保证代码的完整性。

Ries 还说这种技术减少开发时间。 “snap 软件包允许开发人员向支持它的任何平台提供相同的二进制包，从而降低开发和测试成本，减少部署时间和提高更新速度。 “使用 snap 软件包，开发人员完可以全控制开发生命周期，并可以立即更新。 snap 包提供了所有必需的依赖项，因此开发人员可以选择定制他们使用的组件。”

### ResinOS: 为 IoT 而生的 Docker

Resin.io 公司，与其商用的 IoT 框架同名，最近剥离了该框架的基于 Yocto Linux 的 [ResinOS 2.0][20]，ResinOS 2.0 将作为一个独立的开源项目运营。 Ubuntu Core 在 snap 包中运行 Docker 容器引擎，ResinOS 在主机上运行 Docker。 极致简约的 ResinOS 抽离了使用 Yocto 代码的复杂性，使开发人员能够快速部署 Docker 容器。

 

![](http://hackerboards.com/files/resinio_resinos_arch.jpg) 


*ResinOS 2.0 架构*

与基于 Linux 的 CoreOS 一样，ResinOS 集成了 systemd 控制服务和网络协议栈，可通过异构网络安全地部署更新的应用程序。 但是，它是为在资源受限的设备（如 ARM 黑客板）上运行而设计的，与之相反，CoreOS 和其他基于 Docker 的操作系统（例如基于 Red Hat 的 Project Atomic）目前仅能运行在 x86 上，并且更喜欢资源丰富的服务器平台。 ResinOS 可以在 20 中 Linux 设备上运行，并不断增长，包括 Raspberry Pi，BeagleBone 和Odroid-C1 等。

“我们认为 Linux 容器对嵌入式系统比对于云更重要，”Resin.io 的 Marinos 说。 “在云中，容器代表了对之前的进程的优化，但在嵌入式中，它们代表了姗姗来迟的通用虚拟化“

![](http://hackerboards.com/files/beaglebone-hand-thm.jpg) 

*BeagleBone Black*

当应用于物联网时，完整的企业级虚拟机有直接访问硬件的限制的性能缺陷，Marinos 说。像 OSGi 和 Android 的Dalvik 这样的移动设备虚拟机可以用于 IoT，但是它们依赖 Java 并有其他限制。

对于企业开发人员来说，使用 Docker 似乎很自然，但是你如何说服嵌入式黑客转向全新的范式呢？ “Marinos 解释说，”ResinOS 不是把云技术的实践经验照单全收，而是针对嵌入式进行了优化。”此外，他说，容器比典型的物联网技术更好地包容故障。 “如果有软件缺陷，主机操作系统可以继续正常工作，甚至保持连接。要恢复，您可以重新启动容器或推送更新。更新设备而不重新启动它的能力进一步消除了故障引发问题的机率。”

据 Marinos 所说，其他好处源自与云技术的一致性，例如拥有更广泛的开发人员。容器提供了“跨数据中心和边缘的统一范式，以及一种方便地将技术、工作流、基础设施，甚至应用程序转移到边缘（终端）的方式。”

Marinos 说，容器中的固有安全性优势正在被其他技术增强。 “随着 Docker 社区推动实现镜像签名和鉴证，这些自然会转移并应用到 ResinOS，”他说。 “当 Linux 内核被强化以提高容器安全性时，或者获得更好地管理容器所消耗的资源的能力时，会产生类似的好处。

容器也适合开源 IoT 框架，Marinos 说。 “Linux 容器很容易与几乎各种协议、应用程序、语言和库结合使用，”Marinos 说。 “Resin.io 参加了 AllSeen 联盟，我们与使用 IoTivity 和 Thread的 伙伴一起合作。”

### IoT的未来：智能网关与智能终端

Marinos 和 Canonical 的 Ries 对未来物联网的几个发展趋势具有一致的看法。 首先，物联网的最初概念（其中基于 MCU 的端点直接与云进行通信以进行处理）正在迅速被雾化计算架构所取代。 这需要更智能的网关，也需要比仅仅在 ZigBee 和 WiFi 之间聚合和转换数据更多的功能。

其次，网关和智能边缘设备越来越多地运行多个应用程序。 第三，许多这些设备将提供板载分析，这些在最新的[智能家居集线器][22]上都有体现。 最后，富媒体将很快成为物联网组合的一部分。


 ![](http://hackerboards.com/files/eurotech_reliagate2026.jpg) 


*最新设备网关: Eurotech 的 [ReliaGate 20-26][1]*

 ![](http://hackerboards.com/files/advantech_ubc221.jpg) 


*最新设备网关: Advantech 的 [UBC-221][2]*

“智能网关正在接管最初为云服务设计的许多处理和控制功能，”Marinos 说。 “因此，我们看到对容器化的推动力在增加，可以在 IoT 设备中使用类似云工作流程来部署与功能和安全相关的优化。去中心化是由移动数据紧缩、不断发展的法律框架和各种物理限制等因素驱动的。”

Ubuntu Core 等平台正在使“可用于网关的软件爆炸式增长”，Canonical 的 Ries 说。 “在单个设备上运行多个应用程序的能力吸引了众多单一功能设备的用户，以及现在可以产生持续的软件收入的设备所有者。”

![](http://hackerboards.com/files/myomega_mynxg-sm.jpg) 

*两种 IoT 网关: [MyOmega MYNXG IC2 Controller][3]*

![](http://hackerboards.com/files/technexion_ls1021aiot_front-sm.jpg) 

*两种 IoT 网关: TechNexion 的 [LS1021A-IoT Gateway][4]*

不仅是网关 - 终端也变得更聪明。 “阅读大量的物联网新闻报道，你得到的印象是所有终端都运行在微控制器上，”Marinos 说。 “但是我们对大量的 Linux 终端，如数字标牌，无人机和工业机械等直接执行任务，而不是作为操作中介（数据转发）感到惊讶。我们称之为影子 IoT。”

Canonical 的 Ries 同意，对简约技术的专注使他们忽视了新兴物联网领域。 “轻量化的概念在一个发展速度与物联网一样快的行业中初现端倪，”Ries 说。 “今天的高级消费硬件可以持续为终端供电数月。”

虽然大多数物联网设备将保持轻量和“无头”（一种配置方式，比如物联网设备缺少显示器，键盘等），它们装备有如加速度计和温度传感器这样的传感器并通过低速率的数据流通信，但是许多较新的物联网应用已经使用富媒体。 “媒体输入/输出只是另一种类型的外设，”Marinos 说。 “总是存在多个容器竞争有限资源的问题，但它与传感器或蓝牙竞争天线资源没有太大区别。”

Ries 看到了工业和家庭网关中“提高边缘智能”的趋势。 “我们看到人工智能、机器学习、计算机视觉和上下文意识的大幅上升，”Ries 说。 “为什么要在云中运行面部检测软件，如果相同的软件可以在边缘设备运行而又没有网络延迟和带宽及计算成本呢？“

当我们在这个物联网系列的[开篇故事][27]中探索时，我们发现存在与安全相关的物联网问题，例如隐私丧失和生活在监视文化中的权衡。还有一些问题如把个人决策交给可能由他人操控的 AI 裁定。这些不会被容器，快照或任何其他技术完全解决。

如果 AWS Alexa 可以处理生活琐事，而我们专注在要事上，也许我们会更快乐。或许有一个方法来平衡隐私和效用，现在，我们仍在探索，如此甚好。

--------------------------------------------------------------------------------

via: http://hackerboards.com/can-linux-containers-save-iot-from-a-security-meltdown/

作者：[Eric Brown][a]
译者：[firstadream](https://github.com/firstadream)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://hackerboards.com/can-linux-containers-save-iot-from-a-security-meltdown/
[1]:http://hackerboards.com/atom-based-gateway-taps-new-open-source-iot-cloud-platform/
[2]:http://hackerboards.com/compact-iot-gateway-runs-yocto-linux-on-quark/
[3]:http://hackerboards.com/wireless-crazed-customizable-iot-gateway-uses-arm-or-x86-coms/
[4]:http://hackerboards.com/iot-gateway-runs-linux-on-qoriq-accepts-arduino-shields/
[5]:http://hackerboards.com/linux-and-open-source-hardware-for-building-iot-devices/
[6]:http://hackerboards.com/intel-launches-14nm-atom-e3900-and-spins-an-automotive-version/
[7]:http://hackerboards.com/samsung-adds-first-64-bit-and-cortex-m4-based-artik-modules/
[8]:http://hackerboards.com/new-cortex-m-chips-add-armv8-and-trustzone/
[9]:http://hackerboards.com/exploring-security-challenges-in-linux-based-iot-devices/
[10]:http://hackerboards.com/linux-based-smart-home-hubs-advance-into-ai/
[11]:http://hackerboards.com/open-source-projects-for-the-internet-of-things-from-a-to-z/
[12]:http://hackerboards.com/lightweight-snappy-ubuntu-core-os-targets-iot/
[13]:http://hackerboards.com/canonical-pushes-snap-as-a-universal-linux-package-format/
[14]:http://hackerboards.com/ubuntu-core-16-gets-smaller-goes-all-snaps/
[15]:http://hackerboards.com/files/canonical_ubuntucore16_diagram.jpg
[16]:http://hackerboards.com/open-source-oses-for-the-internet-of-things/
[17]:http://hackerboards.com/private-cloud-server-and-iot-gateway-runs-ubuntu-snappy-on-rpi/
[18]:http://hackerboards.com/linaro-beams-lite-at-internet-of-things-devices/
[19]:http://hackerboards.com/96boards-goes-cortex-m4-with-iot-edition-and-carbon-sbc/
[20]:http://hackerboards.com/can-linux-containers-save-iot-from-a-security-meltdown/%3Ca%20href=
[21]:http://hackerboards.com/files/resinio_resinos_arch.jpg
[22]:http://hackerboards.com/linux-based-smart-home-hubs-advance-into-ai/
[23]:http://hackerboards.com/files/eurotech_reliagate2026.jpg
[24]:http://hackerboards.com/files/advantech_ubc221.jpg
[25]:http://hackerboards.com/files/myomega_mynxg.jpg
[26]:http://hackerboards.com/files/technexion_ls1021aiot_front.jpg
[27]:http://hackerboards.com/an-open-source-perspective-on-the-internet-of-things-part-1/
[28]:http://hackerboards.com/can-linux-containers-save-iot-from-a-security-meltdown/
