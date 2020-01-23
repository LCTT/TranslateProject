[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11640-1.html)
[#]: subject: (Nvidia quietly unveils faster, lower power Tesla GPU accelerator)
[#]: via: (https://www.networkworld.com/article/3482097/nvidia-quietly-unveils-faster-lower-power-tesla-gpu-accelerator.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Nvidia 悄悄推出更快、更低功耗的 Tesla GPU 加速器
======

> Nvidia 升级了其 Volta 系列的 Tesla GPU 加速卡，使其能够以旧型号的相同功率更快地工作。

![](https://images.idgesg.net/images/article/2019/01/nvidia_logo-2-100785663-large.jpg)

Nvidia 上周举行了 Supercomputing 19 大会，不出意外的是公布了很多新闻，这些我们将稍后提到。但被忽略的一条或许是其中最有趣的：一张更快、功耗更低的新一代图形加速卡。

多名与会者与多个新闻站点发现了这点，Nvidia 向我证实这确实是一张新卡。Nvidia 的 “Volta” 这代 Tesla GPU 加速卡在 2017 年就已淘汰，因此升级工作应该早已过期。

V100S 目前仅提供 PCI Express 3 接口，但有望最终支持 Nvidia 的 SXM2 接口。SXM 是 Nvidia 的双插槽卡设计，与 PCIe 卡不同，它不需要连接电源。SXM2 允许 GPU 通过 Nvidia 的 NVLink（一种高带宽、节能的互连）相互之间或与 CPU 进行通信，其数据传输速度比 PCIe 快十倍。

借助此卡，Nvidia 声称拥有单精度 16.4 TFLOPS，双精度 8.2 TFLOPS 并且 Tensor Core 性能高达 130 TFLOPS。这仅比 V100 SXM2 设计提高了 4％ 至 5％，但比 PCIe V100 变体提高了 16％ 至 17％。

内存容量保持在 32 GB，但 Nvidia 添加了 High Bandwidth Memory 2（HBM2），以将内存性能提高到 1,134 GB/s，这比 PCIe 和 SXM2 都提高了 26％。

通常情况下，性能提升将同时导致功率增加，但在这里，PCIe 卡的总体功率为 250 瓦，与上一代 PCIe 卡相同。因此，在相同功耗下，该卡可额外提供 16-17％ 的计算性能，并增加 26％ 的内存带宽。

### 其他新闻

Nvidia 在会上还发布了其他新闻：

* 其 GPU 加速的基于 Arm 的高性能计算参考服务器的新参考设计和生态系统支持。该公司表示，它得到了 HPE/Cray、Marvell、富士通和 Ampere 的支持，Ampere 是 Intel 前高管勒尼·詹姆斯（Renee James）领导的一家初创公司，它希望建立基于 Arm 的服务器处理器。
* 这些公司将使用 Nvidia 的参考设计（包括硬件和软件组件）来使用 GPU 构建从超大规模云提供商到高性能存储和百亿亿次超级计算等。该设计还带来了 CUDA-X，这是 Nvidia 用于 Arm 处理器的 CUDA GPU 的特殊版本开发语言。
* 推出 Nvidia Magnum IO 套件，旨在帮助数据科学家和 AI 以及高性能计算研究人员在几分钟而不是几小时内处理大量数据。它经过优化，消除了存储和 I/O 瓶颈，可为多服务器、多 GPU 计算节点提供高达 20 倍的数据处理速度。
* Nvidia 和 DDN （AI 以及多云数据管理开发商）宣布将 DDN 的 A3ITM 数据管理系统与 Nvidia 的 DGX SuperPOD 系统捆绑在一起，以便客户能够以最小的复杂性和更短的时限部署 HPC 基础架构。SuperPOD 还带有新的 NVIDIA Magnum IO 软件栈。
* DDN 表示，SuperPOD 能够在数小时内部署，并且单个设备可扩展至 80 个节点。不同的深度学习模型的基准测试表明，DDN 系统可以使 DGXSuperPOD 系统完全保持数据饱和。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3482097/nvidia-quietly-unveils-faster-lower-power-tesla-gpu-accelerator.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
