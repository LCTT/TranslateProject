#IoT边缘计算框架的新进展
---
![](http://i.imgur.com/sZvQOVz.png)

开源项目 EdgeX Foundry 旨在开发一个标准化的互操作物联网边缘计算框架.[使用权限获取](https://www.linux.com/licenses/category/used-permission).

在4月, Linux 基金组织[启动](http://linuxgizmos.com/open-source-group-focuses-on-industrial-iot-gateway-middleware/)了开发一个标准化互操作物联网边缘计算框架的开源项目[EdgeX Foundry](https://www.edgexfoundry.org/). 就在最近, EdgeX Foundry 又[宣布](https://www.edgexfoundry.org/announcement/2017/07/17/edgex-foundry-builds-momentum-for-a-iot-interoperability-and-a-unified-marketplace-with-eight-new-members/)新增 8 个成员,  其总成员达到 58.

这些新成员是 Absolute, IoT Impact LABS, inwinStack, Parallel Machines, Queen's University Belfast, RIOT, Toshiba Digital Solutions Corporation, 和 Tulip Interfaces. 其原有成员包括 AMD, Analog Devices, Canonical/Ubuntu, Cloud Foundry, Dell, Linaro, Mocana, NetFoundry, Opto 22, RFMicron 和 VMWare 等其他公司或组织.

戴尔贡献出其基于 Apache2.0 协议的[FUSE](https://medium.com/@gigastacey/dell-plans-an-open-source-iot-stack-3dde43f24feb)框架源码作为 EdgeX Foundry 项目的种子，其中包括十几个微服务和超过 12.5 万行代码. Linux 基金会和 Dell 将合并 FUSE 和 AllJoyn-compliant IoTX 项目, 后者是由现有 EdgeX Foundry 成员 Two Bulls 和 Beechwood 发起的与 FUSE 相似的一个项目. 待合并完成 Linux 基金组织将正式宣布启动 EdgeX Foundry 项目.

EdgeX Foundry 将创造一个互操作性的, 即插即用的物联网边缘计算组件生态系统. 开源 EdgeX 栈将协调多样的传感器网络与后台数据处理云平台间的消息协议. 该框架旨在充分挖掘横跨边缘计算, 安全, 系统管理和微服务等模块间的通用代码.

对于项目成员及其客户来说, 其关注焦点在于借助于 IoT 网关和智能边缘设备,预认证的软件可方便集成的可能性. 在 Linux.com 的一次采访中, [IoT Impact LABS](https://iotimpactlabs.com/) 的首席工程师, Dan Mahoney 说:"现实中, EdgeX Foundry 降低我们在部署囊括多供应商解决方案时所面对的挑战."

Linux 基金组织,在将 AllSeen Alliance 的 AllJoyn 项目合并到 [IoTivity](https://www.linux.com/news/how-iotivity-and-alljoyn-could-combine) 的情况下, 为什么Linux基金组织发起了另外一个物联网标准化项目 (EdgeX Foundry)? 原因之一, EdgeX Foundry 不同于 IoTivity, IoTivity 主要解决工业物联网问题, 而 EdgeX Foundry 旨在一站解决消费级和工业级物联网全部的问题. 更具体来说, EdgeX Foundry 旨在成为网关和智能终端的通用中间件. EdgeX Foundry 与 IoTivity 的另一个不同在于, 前者希望借助预连接的终端塑造一种新产品, 后者更多解决现存产品之间的互操作性.

Linux 基金会 IoT 高级总监 Philip DesAutels 说:"IoTivity 提供实现设备之间无缝连接的协议, 而 EdgeX Foundry 提供了一个边缘计算框架. EdgeX Foundry 能够兼容如 IoTivity, BacNet, EtherCat 等任何协议设备, 从而实现集成多协议通信系统的通用边缘计算框架, 该项目的目标是为构建互操作组件的生态系统的过程中, 降低不确定性, 缩短市场化时间, 更好地产生规模效应."

上个月, 由 [Open Connectivity Foundation](https://openconnectivity.org/developer/specifications/international-standards) (OCF) 和 Linux 基金组织共同发起的 IoTivity项目发布了 [IoTivity 1.3](https://wiki.iotivity.org/release_note_1.3.0), 该版本增加 了与其曾经的对手 AllJoyn spec 的纽带, 也增加了对于 OCF 的 UPnP 设备的接口. 预计在 [IoTivity 2.0](https://www.linux.com/news/iotivity-20-whats-store) 中, IoTivity 和 AllJoyn 将会更进一步深入集成.

DesAutels 告诉 linux.com, IoTivity 和 EdgeX 是高度互补的, 其原因是 EdgeX 项目和IoTivity 项目有好几个共同成员, 如此更强化了 IoTivity 和 EdgeX 的互补关系.

尽管 IoTivity 和 EdgeX 都宣称是跨平台,包括 CPU 架构和 OS, 但是二者还是存在一定区别.  IoTivity 最初是基于 Linux 平台设计, 兼容 Ubuntu, Tizen 和 Android 等 Linux 系列 OS, 后来逐步扩展到 Windows 和 IOS 操作系统. 与之对应的 EdgeX 设计之初就是基于跨平台的理念, 其完美兼容于各种 CPU 架构, 以及 Linux, Windows 和 Mac OS 等操作系统. 未来还将兼容于实时操作系统(RTOSes).

EdgeX 的新成员 [RIOT](https://riot-os.org/) 提供了一个开源项目 RIOT RTOS. RIOT 的主要维护者 Thomas Eichinger 在一次重要报告时说:"由于 RIOT 初衷就是致力于解决 linux 不太适应的问题, 故对于 RIOT 社区来说,参加和支持类似于 EdgeX Foundry 等与 Linux 互补性社区的积极性是自然而然的."

##传感器集成的简化
IoT Impact LABS (也叫aka impact LABS 或直接称为 LABS) 是另一个 EdgeX 新成员. 该公司推出了一个独特的业务, 旨在帮助中小企业度过物联网解决方案的试用阶段. 该公司的大部分客户, 其中包括几个 EdgeX Foundry 的项目成员, 是致力于建设智慧城市, 基础设施再利用, 提高食品安全, 以及解决会社面临的自然资源缺乏的挑战. 
 
Dan Mahoney 说:"在 LABS 我们花费了很多时间来调和试点客户的解决方案之间的差异性. EdgeX Foundry 可以最小化部署边缘软件系统的工作量,从而使我们能够更快更好地部署高质量的解决方案."

该框架在涉及多个供应商, 多种类型传感器的场景尤其凸显优势. "Edgex Foundry 将为我们提供快速构建网关的能力, 以及快速部署传感器的能力." Mahoney 补充说到. 传感器制造商将借助 EdgeX SDK 烧写应用层协议驱动到边缘设备, 该协议能够兼容多供应商和解决方案.

##边缘分析能力的构建
当我们问到, Mahoney 的公司想要见到 EdgeX Foundry 怎样的发展时, 他说:"我们喜见乐闻的一个目标是有更多有效的工业协议作为设备服务出现, 一个更清晰的边缘计算实现路径."

在工业物联网和消费级物联网中边缘计算都呈现增长趋势. 在后者, 我们已经看到如 Alexa 的智能声控以及录像分析等几个智能家居系统集成了边缘计算分析技术. 这减轻了云服务平台的计算负荷, 但同时也带来了安全, 隐私, 以及由于政策和供应商中断引起的服务中断问题.

对于工业物联网网关, 隐私问题成为首要的问题. 因此, 在物联网网关方面出现了一些类似于云服务功能的扩展. 其中一个解决方案是, 为了安全将一些云服务上的安全保障应用借助容器如 [RIOS 与 Ubuntu 内核快照机制](https://www.linux.com/news/future-iot-containers-aim-solve-security-crisis)等方式集成到嵌入式设备. 另一种方案是, 开发 IoT 系统迁移云功能到边缘. 上个月, Amazon 为基于 linux 的网关发布了实现 [AWS Greengrass](http://linuxgizmos.com/amazon-releases-aws-greengrass-for-local-iot-processing-on-linux-devices/) 物联网协议栈的 AWS lambda. 该软件能够使计算, 消息路由, 数据收集和同步能力在边缘设备上完成,如物联网网关.

分析能力是 EdgeX Foundry 的一个关键功能要点. 发起成员 Cloud Foundry 是旨在集成其主要的工业应用平台到边缘设备. 另一个新成员 [Parallel Machines](https://www.parallelmachines.com/) 计划利用EdgeX将AI带到边缘设备.

EdgeX Foundry 仍然在项目早期, 软件仍然在 α 阶段, 其成员在上个月才刚刚进行了第一次全体成员大会. 同时项目已经为新开发者准备了一些初始训练课程, 另外从[这里](https://wiki.edgexfoundry.org/)也能获取更多的信息.

原文连接: [https://www.linux.com/blog/2017/7/iot-framework-edge-computing-gains-ground](https://www.linux.com/blog/2017/7/iot-framework-edge-computing-gains-ground)

作者： [ERIC BROWN](https://www.linux.com/users/ericstephenbrown) 译者：penghuster 校对：校对者ID

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出