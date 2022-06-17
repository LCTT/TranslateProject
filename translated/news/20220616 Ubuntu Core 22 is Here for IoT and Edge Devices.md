[#]: subject: "Ubuntu Core 22 is Here for IoT and Edge Devices"
[#]: via: "https://news.itsfoss.com/ubuntu-core-22-release/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu Core 22 来了，适用于物联网和边缘设备
======
Ubuntu Core 22 基于 Ubuntu 22.04 LTS，为物联网和嵌入式设备带来了最佳的安全性和性能。

![Ubuntu][1]

Ubuntu Core 22 是一个容器化的 Ubuntu 22.04 LTS 变体，针对嵌入式和物联网设备进行了优化。

对于希望在边缘设备上运行 Canonical 的最新操作系统的开发者来说，这会是一个很棒的产品。

在发布 Ubuntu Core 22 时，Canonical 的 CEO **Mark Shuttleworth** 说：

> “Canonical 的目标是在任何地方提供安全、可靠的开源技术，从开发环境到云，再到边缘和设备。”

### Ubuntu Core 22 更新介绍

![什么是 Ubuntu Core 22？][2]

Ubuntu Core 22 版本带来了针对安全性和可靠性的改进。其中包括了以下几个改进。

#### 实时计算

正如公告中提到的，Ubuntu 22.04 LTS 提供了一个实时内核（测试版可用），它能为那些时间敏感的工业、汽车和机器人用例，提供高性能、超低延迟和工作负载可预测性。

此外，如果你有 Ubuntu 认证的硬件，你还能充分利用高级的实时功能。

#### Snapcraft 框架

整个 Ubuntu 映像分解为许多个包（快照），使得内核、操作系统和应用程序隔离在一个沙箱中。

这可以让你轻松地安装应用程序，而无需担心来自专用 <ruby>物联网应用商店<rt>IoT App Store</rt></ruby> 的依赖。对于企业而言，通过软件商店进行的软件管理解决方案，应该能够带来一系列内部部署的机会。

该框架还可帮助系统确保 OTA 更新按预期工作，即使由于某种原因失败，也不会破坏任何内容。

#### 安全

Ubuntu Core 提供了高级安全功能，包括安全启动、全盘加密以及一些更适合任务关键型环境的功能。

注意，此版本还提供了 10 年的安全更新承诺。

#### 其他关键改进

* 支持从 Ubuntu Core 20 轻松迁移并确保向后兼容性。
* 性能改进。
* 新的“恢复出厂设置”启动模式，以便在“运行/恢复模式”中恢复出厂设置。

如果你想了解更多信息，可以查看 [官方公告][3]。

如果你对 Ubuntu Core 感兴趣，可以访问它的 [主​​页][4] 以了解更多关于它的信息。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/ubuntu-core-22-release/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/06/ubuntu-22-core.jpg
[2]: https://youtu.be/6NDWqH1SrGs
[3]: https://ubuntu.com/blog/canonical-ubuntu-core-22-is-now-available-optimised-for-iot-and-embedded-devices
[4]: https://ubuntu.com/core
