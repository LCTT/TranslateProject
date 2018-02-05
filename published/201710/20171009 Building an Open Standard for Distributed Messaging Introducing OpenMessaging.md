OpenMessaging：构建一个分布式消息分发开放标准 
============================================================


通过在云计算、大数据和标准 API 上的企业及社区的协作，我很高兴 OpenMessaging 项目进入 Linux 基金会。OpenMessaging 社区的目标是为分布式消息分发创建全球采用的、供应商中立的和开放标准，可以部署在云端、内部和混合云情景中。

阿里巴巴、雅虎、滴滴和 Streamlio 是该项目的创始贡献者。Linux 基金会已与这个初始项目社区合作来建立一个治理模式和结构，以实现运作在消息 API 标准上的生态系统的长期受益。

由于越来越多的公司和开发者迈向<ruby>云原生应用<rt>cloud native application</rt></ruby>，消息式应用和流式应用的扩展面临的挑战也在不断发展。这包括平台之间的互操作性问题，<ruby>[线路级协议](https://en.wikipedia.org/wiki/Wire_protocol)<rt>wire-level protocol</rt></ruby>之间缺乏兼容性以及系统间缺乏标准的基准测试。

特别是当数据跨不同的消息平台和流平台进行传输时会出现兼容性问题，这意味着额外的工作和维护成本。现有解决方案缺乏负载平衡、容错、管理、安全性和流功能的标准化指南。目前的系统不能满足现代面向云的消息应用和流应用的需求。这可能导致开发人员额外的工作，并且难以或不可能满足物联网、边缘计算、智能城市等方面的尖端业务需求。

OpenMessaging 的贡献者正在寻求通过以下方式改进分布式消息分发：

*   为分布式消息分发创建一个面向全球、面向云、供应商中立的行业标准
*   促进用于测试应用程序的标准基准发展
*   支持平台独立
*   以可伸缩性、灵活性、隔离和安全性为目标的云数据的流和消息分发要求
*   培育不断发展的开发贡献者社区

你可以在这了解有关新项目的更多信息以及如何参与： [http://openmessaging.cloud][1]。

这些是支持 OpenMessaging 的一些组织：

“我们多年来一直专注于消息分发和流领域，在此期间，我们探索了 Corba 通知、JMS 和其它标准，来试图解决我们最严格的业务需求。阿里巴巴在评估了可用的替代品后，选择创建一个新的面向云的消息分发标准 OpenMessaging，这是一个供应商中立，且语言无关的标准，并为金融、电​​子商务、物联网和大数据等领域提供了行业指南。此外，它目地在于跨异构系统和平台间开发消息分发和流应用。我们希望它可以是开放、简单、可扩展和可互操作的。另外，我们要根据这个标准建立一个生态系统，如基准测试、计算和各种连接器。我们希望有新的贡献，并希望大家能够共同努力，推动 OpenMessaging 标准的发展。” 

——阿里巴巴高级架构师 Von Gosling，Apache RocketMQ 的联合创始人，以及 OpenMessaging 的原始发起人

“随着应用程序消息的复杂性和规模的不断扩大，缺乏标准的接口为开发人员和组织带来了复杂性和灵活性的障碍。Streamlio 很高兴与其他领导者合作推出 OpenMessaging 标准倡议来给客户一个轻松使用高性能、低延迟的消息传递解决方案，如 Apache Pulsar，它提供了企业所需的耐用性、一致性和可用性。“

—— Streamlio 的软件工程师、Apache Pulsar 的联合创始人以及 Apache BookKeeper PMC 的成员 Matteo Merli

“Oath（Verizon 旗下领先的媒体和技术品牌，包括雅虎和 AOL）支持开放，协作的举措，并且很乐意加入 OpenMessaging 项目。”

—— Joe Francis，核心平台总监

“在滴滴中，我们定义了一组私有的生产者 API 和消费者 API 来隐藏开源的 MQ（如 Apache Kafka、Apache RocketMQ 等）之间的差异，并提供额外的自定义功能。我们计划将这些发布到开源社区。到目前为止，我们已经积累了很多关于 MQ 和 API 统一的经验，并愿意在 OpenMessaging 中与其它 API 一起构建 API 的共同标准。我们真诚地认为，统一和广泛接受的 API 标准可以使 MQ 技术和依赖于它的应用程序受益。”

—— 滴滴的架构师 Neil Qi_

“有许多不同的开源消息分发解决方案，包括 Apache ActiveMQ、Apache RocketMQ、Apache Pulsar 和 Apache Kafka。缺乏行业级的可扩展消息分发标准使得评估合适的解决方案变得困难。我们很高兴能够与多个开源项目共同努力，共同确定可扩展的开放消息规范。 Apache BookKeeper 已成功在雅虎（通过 Apache Pulsar）和 Twitter（通过 Apache DistributedLog）的生产环境中部署，它作为其企业级消息系统的持久化、高性能、低延迟存储基础。我们很高兴加入 OpenMessaging 帮助其它项目解决诸如低延迟持久化、一致性和可用性等在消息分发方案中的常见问题。” 

—— Streamlio 的联合创始人、Apache BookKeeper 的 PMC 主席、Apache DistributedLog 的联合创造者，Sijie Guo

--------------------------------------------------------------------------------

via: https://www.linuxfoundation.org/blog/building-open-standard-distributed-messaging-introducing-openmessaging/

作者：[Mike Dolan][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxfoundation.org/author/mdolan/
[1]:http://openmessaging.cloud/
[2]:https://www.linuxfoundation.org/author/mdolan/
[3]:https://www.linuxfoundation.org/category/blog/
