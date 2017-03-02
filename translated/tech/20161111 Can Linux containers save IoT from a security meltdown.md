
###[Linux容器能否弥补IoT的安全短板？][28]

 ![](http://hackerboards.com/files/internet_of_things_wikimedia1-thm.jpg) 
在这个最后的物联网系列文章中，Canonical和Resin.io向以Linux容器技术作为物联网安全性和互操作性的解决方案发起挑战。

 ![](http://hackerboards.com/files/samsung_artik710-thm.jpg) 

**Artik 7** |

尽管受到日益增长的安全威胁，物联网炒作没有显示减弱的迹象。为了刷存在感，公司正忙于重新安排物联网的路线图。物联网大潮迅猛异常，比移动互联网革命渗透地更加深入和广泛。IoT像黑洞一样，吞噬一切，包括智能手机，它通常是我们在物联网世界中的窗口，有时作为我们的集线器或传感器端点。

新的物联网处理器和嵌入式主板继续重塑技术版图。自从9月份推出[Linux和开源硬件IoT] [5]系列文章之后，我们看到了面向物联网网关的“Apollo Lake]”SoC [Intel Atom E3900] [6]以及[新三星Artik模块][7]，包括用于网关并由Linux驱动的64位Artik 7 COM及自带RTOS的Cortex-M4 Artik。 ARM为具有ARMv8-M和TrustZone安全性的IoT终端发布了[Cortex-M23和Cortex-M33] [8]内核。

安全是这些产品的卖点。最近攻击Dyn服务并在一天内摧毁了美国大部分互联网的未来僵尸网络将基于Linux的物联网推到台前 - 当然这种方式似乎不太体面。通过DDoS攻击可以黑掉物联网设备，其设备所有者同样可能直接遭受恶意攻击。

 ![](http://hackerboards.com/files/arm_cortexm33m23-thm.jpg) 

**Cortex-M33 和 -M23** 

Dyn攻击让我们更加笃定，物联网将更加自信地在受控制和受保护的工业环境而不是家用环境中向前发展。这不是因为消费者[物联网安全技术] [9]不可用，但除非产品设计之初就以安全为目标，否则如我们的[智能家居集线器系列] [10]中的许多解决方案，后期再考虑安全就会增加成本和复杂性。

在物联网系列的最后一个未来展望的部分，我们将探讨两种基于Linux的面向Docker的容器技术，这些技术被提出作为物联网安全解决方案。容器还可以帮助解决在[物联网框架] [11]中探讨的开发复杂性和互操作性障碍的问题。

我们与Canonical的Ubuntu客户平台工程副总裁Oliver Ries讨论了Ubuntu Core和Docker友好的容器式Snaps包管理技术。我们还就新的基于Docker的物联网方案ResinO采访了Resin.io首席执行官和联合创始人Alexandros Marinos。

**Ubuntu Core 与快照管理**

Canonical面向物联网的[Snappy Ubuntu Core] [12]版本的Ubuntu是围绕一个类似容器的快照包管理机制构建，并提供应用商店支持。 snap技术最近[自行发布] [13]用于其他Linux发行版。 11月3日，Canonical发布了[Ubuntu Core 16] [14]，该版本改进了白标应用商店和更新控制服务。

<center>
[
 ![](http://hackerboards.com/files/canonical_ubuntucore16_diagram-sm.jpg) 
][15]
**传统Ubuntu（左）架构 与 Ubuntu Core 16**
(点击图片放大)
</center>

快照机制提供自动更新，并有助于阻止未经授权的更新。 使用事务系统管理，快照可确保更新按预期部署或根本不部署。 在Ubuntu Core中，使用AppArmor进一步加强了安全性，并且所有应用程序文件都只读且保存在隔离的孤岛中。
 ![](http://hackerboards.com/files/limesdr-thm.jpg) 

**LimeSDR** |

Ubuntu Core是我们最近展开的[开源物联网操作系统调查] [16]的一部分，现在运行在Gumstix主板，Erle机器人无人机，Dell Edge网关，[Nextcloud Box] [17]，LimeSDR，Mycroft家庭集线器 ，英特尔的Joule和符合Linaro的96Boards规范的SBC上。 Canonical公司还与Linaro物联网和嵌入式（LITE）部门集团[96Boards物联网版] [18]合作。最初，96Boards IE专注于Zephyr驱动的Cortex-M4板卡，如Seeed的[BLE Carbon] [19] 它将扩展到可以运行Ubuntu Core的网关板卡。

“Ubuntu Core和快照具有从边缘到网关到云的相关性，”Canonical的Ries说。 “能够在任何主要发行版（包括Ubuntu Server和Ubuntu for Cloud）上运行快照包，使我们能够提供一致的体验。 Snaps可以使用事务更新以故障安全方式升级，可用于安全性，错误修复或新功能的持续更新，这在物联网环境中非常重要。

 ![](http://hackerboards.com/files/nextcloud_box3-thm.jpg) 

**Nextcloud盒子** |

安全性和可靠性是关注的重点，Ries说。 “Snaps可以完全独立于彼此和操作系统运行，使得两个应用程序可以安全地在单个网关上运行，”他说。 “Snaps是只读的和经过认证的，可以保证代码的完整性。

Ries还采用了减少开发时间的技术。 “Snap软件包允许开发人员向支持它的任何平台提供相同的二进制包，从而降低开发和测试成本，减少部署时间和提高更新速度。 “使用snap包，开发人员完全控制开发生命周期，并可以立即更新。 Snap包提供所有必需的依赖项，因此开发人员可以选择定制他们使用的组件。

**ResinOS: 为IoT而生的Docker**

Resin.io公司，与其商用IoT框架同名，最近剥离了该框架的Yocto Linux [ResinOS 2.0] [20]，ResinOS 2.0将作为一个独立的开源项目运营。 Ubuntu Core在snap包中运行Docker容器引擎，ResinOS在主机上运行Docker。 极致简约的ResinOS抽离了使用Yocto代码的复杂性，使开发人员能够快速部署Docker容器。

<center>
[
 ![](http://hackerboards.com/files/resinio_resinos_arch-sm.jpg) 
][21]
**ResinOS 2.0 架构**
(点击图片放大)
</center>

与基于Linux的CoreOS一样，ResinOS集成了系统控制服务和网络协议栈，可通过异构网络安全地部署更新的应用程序。 但是，它为在资源受限的设备（如ARM黑客板）上运行而设计，与之相反，CoreOS和其他基于Docker的操作系统（例如基于Red Hat的Project Atomic）目前仅能运行在x86上，并且更喜欢资源丰富的服务器平台。 ResinOS可以在20个Linux设备上运行，包括Raspberry Pi，BeagleBone和Odroid-C1等。

“我们认为Linux容器对嵌入式系统比对于云更重要，”Resin.io的Marinos说。 “在云中，容器代表了对之前进程的优化，但在嵌入式中，它们代表了姗姗来迟的通用虚拟化“

 ![](http://hackerboards.com/files/beaglebone-hand-thm.jpg) 

**BeagleBone Black** |

当应用于物联网时，完整的企业虚拟机有直接硬件访问的性能问题和限制，Marinos说。像OSGi和Android的Dalvik这样的移动虚拟机可以用于IoT，但是它们依赖Java并有其他限制。

对于企业开发人员来说，使用Docker似乎很自然，但是你如何说服嵌入式黑客转向全新的范式呢？ “Marinos解释说，”ResinOS不是把云技术的实践经验照单全收，而是针对嵌入式进行了优化。”此外，他说，容器比典型的物联网技术更好地包容故障。 “如果有软件缺陷，主机操作系统可以继续正常工作，甚至保持连接。要恢复，您可以重新启动容器或推送更新。更新设备而不重新启动它的能力进一步消除了故障引发问题的机率。”

根据Marinos，其他好处源自与云技术的一致性，例如拥有更广泛的开发人员。容器提供了“跨数据中心和边缘的统一范式，以及一种方便地将技术，工作流，基础设施，甚至应用程序转移到边缘（终端）的方式。

Marinos说，容器中的固有安全性优势正在被其他技术增强。 “随着Docker社区推动实现签名的图像和证据，这些自然转移并应用到ResinOS，”他说。 “当Linux内核被强化以提高容器安全性时，或者获得更好地管理容器所消耗的资源的能力时，会产生类似的好处。

容器也适合开源IoT框架，Marinos说。 “Linux容器很容易与几乎各种协议，应用程序，语言和库结合使用，”Marinos说。 “Resin.io参加了AllSeen联盟，我们与使用IoTivity和Thread的伙伴合作。

**IoT的未来：智能网关与智能终端**

Marinos和Canonical的Ries对未来物联网的几个发展趋势具有一致的看法。 首先，物联网的最初概念（其中基于MCU的端点直接与云进行通信以进行处理）正在迅速被雾化计算架构取代。 这需要更智能的网关，也需要比仅仅在ZigBee和WiFi之间聚合和转换数据更多的功能。

第二，网关和智能边缘设备越来越多地运行多个应用程序。 第三，许多这些设备将提供板载分析，这些在最新的[智能家居集线器] [22]上都有体现。 最后，富媒体将很快成为物联网组合的一部分。

<center>
[
 ![](http://hackerboards.com/files/eurotech_reliagate2026-sm.jpg) 
][23] [
 ![](http://hackerboards.com/files/advantech_ubc221-sm.jpg) 
][24]
**最新设备网关: Eurotech’s [ReliaGate 20-26][1] 和 Advantech’s [UBC-221][2]**
(点击图片放大)
</center>

“智能网关正在接管最初为云服务设计的许多处理和控制功能，”Marinos说。 “因此，我们看到对容器化的推动力在增加，可以在IoT设备中使用类似云工作流程来部署与功能和安全相关的优化。 去中心化是由移动数据紧缩，不断发展的法律框架和各种物理限制等因素驱动的。

Ubuntu Core等平台正在使“可用于网关的软件爆炸式增长”，Canonical的Ries说。 “在单个设备上运行多个应用程序的能力吸引了众多单一功能设备的用户，以及现在可以产生持续的软件收入的设备所有者。

<center>
[
 ![](http://hackerboards.com/files/myomega_mynxg-sm.jpg) 
][25] [
 ![](http://hackerboards.com/files/technexion_ls1021aiot_front-sm.jpg) 
][26]
**两种IoT网关: [MyOmega MYNXG IC2 Controller (左) 和TechNexion’s ][3][LS1021A-IoT Gateway][4]**
(点击图片放大)
</center>

不仅是网关 - 终端也变得更聪明。 “阅读大量的物联网新闻报道，你得到的印象是所有终端都运行在微控制器上，”Marinos说。 “但是我们对大量的Linux终端，如数字标牌，无人机和工业机械等直接执行任务，而不是作为操作中介（数据转发）感到惊讶。我们称之为影子IoT。

Canonical的Ries同意，对简约技术的专注使他们忽视了新兴物联网领域。 “轻量化的概念在一个发展速度与物联网一样快的行业中初现端倪，”Ries说。 “今天的高级消费硬件可以持续为终端供电数月。“

虽然大多数物联网设备将保持轻量和“无头”（一种配置方式，比如物联网设备缺少显示器，键盘等），它们装备有传感器如加速度计和温度传感器并通过低速率的数据流通信，但是许多较新的物联网应用已经使用富媒体。 “媒体输入/输出只是另一种类型的外设，”Marinos说。 “总是存在多个容器竞争有限资源的问题，但它与传感器或蓝牙竞争天线资源没有太大区别。”

Ries看到了工业和家庭网关中“提高边缘智能”的趋势。 “我们看到人工智能，机器学习，计算机视觉和上下文意识的大幅上升，”Ries说。 “为什么要在云中运行面部检测软件，如果相同的软件可以在边缘设备运行而又没有网络延迟和带宽及计算成本？“

当我们在这个物联网系列的[开篇故事] [27]中探索时，我们发现存在与安全相关的物联网问题，例如隐私丧失和生活在监视文化中的权衡。还有一些问题如把个人决策交给可能由他人操控的AI裁定。这些不会被容器，快照或任何其他技术完全解决。

Perhaps we’d be happier if Alexa handled the details of our lives while we sweat the big stuff, and maybe there’s a way to balance privacy and utility. For now, we’re still exploring, and that’s all for the good.
如果Alexa可以处理生活琐碎，而我们专注在要事上，也许我们会更快乐。或许有一个方法来平衡隐私和效用，现在，我们仍在探索，如此甚好。

--------------------------------------------------------------------------------

via: http://hackerboards.com/can-linux-containers-save-iot-from-a-security-meltdown/

作者：[Eric Brown][a]
译者：[firstadream](https://github.com/firstadream)
校对：[校对者ID](https://github.com/校对者ID)

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
