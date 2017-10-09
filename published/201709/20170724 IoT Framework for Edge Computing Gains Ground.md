IoT 边缘计算框架的新进展
---

![](http://i.imgur.com/sZvQOVz.png)

> 开源项目 EdgeX Foundry 旨在开发一个标准化的互操作物联网边缘计算框架。

4 月份时， Linux 基金组织[启动](http://linuxgizmos.com/open-source-group-focuses-on-industrial-iot-gateway-middleware/)了一个开源项目 [EdgeX Foundry](https://www.edgexfoundry.org/) ，用于为物联网边缘计算开发一个标准化互操作框架。 就在最近， EdgeX Foundry 又[宣布](https://www.edgexfoundry.org/announcement/2017/07/17/edgex-foundry-builds-momentum-for-a-iot-interoperability-and-a-unified-marketplace-with-eight-new-members/)新增了 8 个成员，其总成员达到 58 位。

这些新成员是 Absolute、IoT Impact LABS、inwinStack、Parallel Machines、Queen's University Belfast、RIOT、Toshiba Digital Solutions Corporation 和 Tulip Interfaces。 其原有成员包括 AMD、Analog Devices、Canonical/Ubuntu、Cloud Foundry、Dell、Linaro、Mocana、NetFoundry、 Opto 22、RFMicron 和 VMWare 等其他公司或组织。

EdgeX Foundry 项目构建于戴尔早期的基于 Apache2.0 协议的 [FUSE](https://medium.com/@gigastacey/dell-plans-an-open-source-iot-stack-3dde43f24feb) 物联网中间件框架之上，其中包括十几个微服务和超过 12.5 万行代码。在 FUSE 合并了类同项目 AllJoyn-compliant IoTX 之后，Linux 基金会协同 Dell 创立了 EdgeX Foundry ，后者是由 EdgeX Foundry 现有成员 Two Bulls 和 Beechwood 发起的项目。

EdgeX Foundry 将创造一个互操作性的、即插即用组件的物联网边缘计算的生态系统。开源的 EdgeX 栈将协调各种传感器网络协议与多种云平台及分析平台。该框架旨在充分挖掘横跨边缘计算、安全、系统管理和服务等模块间的互操作性代码。

对于项目成员及其客户来说，其关键的好处是在于能将各种预先认证的软件集成到许多 IoT 网关和智能边缘设备上。 在 Linux.com 的一次采访中，[IoT Impact LABS](https://iotimpactlabs.com/) 的首席工程师 Dan Mahoney 说：“现实中，EdgeX Foundry 降低了我们在部署多供应商解决方案时所面对的挑战。”

在 Linux 基金会仍然将其 AllSeen Alliance 项目下的 AllJoyn 规范合并到 [IoTivity](https://www.linux.com/news/how-iotivity-and-alljoyn-could-combine) 标准的情况下，为什么会发起了另外一个物联网标准化项目（EdgeX Foundry） 呢？ 原因之一，EdgeX Foundry 不同于 IoTivity，IoTivity 主要解决工业物联网问题，而 EdgeX Foundry 旨在解决消费级和工业级物联网全部的问题。 更具体来说， EdgeX Foundry 旨在成为网关和智能终端的通用中间件。 EdgeX Foundry 与 IoTivity 的另一个不同在于，前者希望借助预认证的终端塑造一种新产品，后者更多解决现存产品之间的互操作性。

Linux 基金会 IoT 高级总监 Philip DesAutels 说：“IoTivity 提供实现设备之间无缝连接的协议， 而 EdgeX Foundry 提供了一个边缘计算框架。EdgeX Foundry 能够兼容如 IoTivity、 BacNet、 EtherCat 等任何协议设备，从而实现集成多协议通信系统的通用边缘计算框架，该项目的目标是为构建互操作组件的生态系统的过程中，降低不确定性，缩短市场化时间，更好地产生规模效应。”

上个月, 由 [Open Connectivity Foundation](https://openconnectivity.org/developer/specifications/international-standards) （OCF）和 Linux 基金组织共同发起的 IoTivity 项目发布了 [IoTivity 1.3](https://wiki.iotivity.org/release_note_1.3.0)，该版本增加了与其曾经的对手 AllJoyn spec 的纽带，也增加了对于 OCF 的 UPnP 设备发现标准的接口。 预计在 [IoTivity 2.0](https://www.linux.com/news/iotivity-20-whats-store) 中， IoTivity 和 AllJoyn 将会更进一步深入集成。

DesAutels 告诉 linux.com，IoTivity 和 EdgeX 是“高度互补的”，其“原因是 EdgeX Foundry 项目的几个成员也是 IoTivity 或 OCF 的成员，如此更强化了 IoTivity 和 EdgeX 的合作关系。”

尽管 IoTivity 和 EdgeX 都宣称是跨平台的，包括在 CPU 架构和 OS 方面，但是二者还是存在一定区别。  IoTivity 最初是基于 Linux 平台设计，兼容 Ubuntu、Tizen 和 Android 等 Linux 系列 OS，后来逐步扩展到 Windows 和 iOS 操作系统。与之对应的 EdgeX 设计之初就是基于跨平台的理念，其完美兼容于各种 CPU 架构，支持 Linux, Windows 和 Mac OS 等操作系统， 未来还将兼容于实时操作系统（RTOS）。”

EdgeX 的新成员 [RIOT](https://riot-os.org/) 提供了一个开源的面向物联网的项目 RIOT RTOS。RIOT 的主要维护者 Thomas Eichinger 在一次表彰讲话中说：“由于 RIOT 初衷就是致力于解决 linux 不太适应的问题， 故对于 RIOT 社区来说，参加和支持类似于 EdgeX Foundry 等边缘计算的开源组织的积极性是自然而然的。”

### 传感器集成的简化

IoT Impact LABS （即 Impact LABS 或直接称为 LABS）是另一个 EdgeX 新成员。 该公司推出了一个独特的业务模式，旨在帮助中小企业度过物联网解决方案的试用阶段。该公司的大部分客户，其中包括几个 EdgeX Foundry 的项目成员，是致力于建设智慧城市、基础设施再利用、提高食品安全，以及解决社会面临的自然资源缺乏的挑战。
 
Dan Mahoney 说：“在 LABS 我们花费了很多时间来调和试点客户的解决方案之间的差异性。 EdgeX Foundry 可以最小化部署边缘软件系统的工作量，从而使我们能够更快更好地部署高质量的解决方案。”

该框架在涉及多个供应商、多种类型传感器的场景尤其凸显优势。“Edgex Foundry 将为我们提供快速构建可以控制所有部署的传感器的网关的能力。” Mahoney 补充说到。传感器制造商将借助 EdgeX SDK 烧写应用层协议驱动到边缘设备，该协议能够兼容多供应商和解决方案。

### 边缘分析能力的构建

当我们问到， Mahoney 的公司希望见到 EdgeX Foundry 怎样的发展时，他说：“我们喜见乐闻的一个目标是有更多有效的工业协议成为设备服务，这是一个更清晰的边缘计算实现之路。”

在工业物联网和消费级物联网中边缘计算都呈现增长趋势。 在后者，我们已经看到如 Alexa 的智能声控以及录像分析等几个智能家居系统[集成了边缘计算分析](https://www.linux.com/news/smart-linux-home-hubs-mix-iot-ai)技术。 这减轻了云服务平台的计算负荷，但同时也带来了安全、隐私，以及由于供应商中断或延迟问题引起的服务中断问题。

对于工业物联网网关，延迟问题成为首要的问题。因此，在物联网网关方面出现了一些类似于云服务功能的扩展。 其中一个解决方案是，为了安全将一些云服务上的安全保障应用借助容器如 [RIOS 与 Ubuntu 内核快照机制](https://www.linux.com/news/future-iot-containers-aim-solve-security-crisis)等方式集成到嵌入式设备。 另一种方案是，开发 IoT 生态系统，迁移云功能到边缘计算上。上个月，Amazon 为基于 linux 的网关发布了实现 [AWS Greengrass](http://linuxgizmos.com/amazon-releases-aws-greengrass-for-local-iot-processing-on-linux-devices/) 物联网协议栈的 AWS lambda。 该软件能够使 AWS 计算、消息路由、数据缓存和同步能力在诸如物联网网关等联网设备上完成。

分析能力是 EdgeX Foundry 发展路线上的一个关键功能要点。 发起成员之一 Cloud Foundry 其旨在集成其主要的工业应用平台到边缘设备。 另一个新成员 [Parallel Machines](https://www.parallelmachines.com/) 则计划利用 EdgeX 将 AI 带到边缘设备。

EdgeX Foundry 仍然在项目早期， 软件仍然在 α 阶段，其成员在上个月（六月份）才刚刚进行了第一次全体成员大会。同时该项目已经为新开发者准备了一些初始训练课程，另外从[这里](https://wiki.edgexfoundry.org/)也能获取更多的信息。

----

via: [https://www.linux.com/blog/2017/7/iot-framework-edge-computing-gains-ground](https://www.linux.com/blog/2017/7/iot-framework-edge-computing-gains-ground)

作者： [ERIC BROWN](https://www.linux.com/users/ericstephenbrown) 
译者：[penghuster](https://github.com/penghuster)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
