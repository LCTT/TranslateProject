[#]: subject: "NVIDIA Takes a Big Step to Improve its GPU Experience on Linux"
[#]: via: "https://news.itsfoss.com/nvidia-open-source-linux/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "chunyang-wen"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14587-1.html"

英伟达在提升 Linux 上的 GPU 使用体验上迈出了一大步
=====

> 英伟达公司提升其 GPU 在 Linux 上的体验的重大开源计划终于来了。

![][1]

Linus Torvalds 听到这个消息一定会很高兴……

英伟达终于公布了提升 Linux 上的 GPU 使用体验的开源计划。

不过不幸的是，和你想象的可能不完全一样，你仍然会看到一些专有的驱动程序。

但是，它的意义不亚于甩掉专有驱动程序。

具体来说就是，**英伟达发布了开源的 GPU 内核模块，支持数据中心所用的 GPU 和消费级显卡（GeForce/RTX）**。

此外，它同时采用 GPL/MIT 两种许可证，听起来很棒，对吗？

### 此举对 Linux 桌面用户有什么帮助？

开源的 GPU 内核模块有助于改善内核和专有驱动程序之间的交互。

所以，此举对 **游戏玩家和开发者** 都有利，阻碍与英伟达专有驱动程序配合的问题最终会被消除。

发布公告中提到的技术收益包括：

> 开发者可以跟踪到具体的代码路径，并观察到内核事件调度是如何与他们的工作负载交互的，从而在调试时更快定位根本原因。此外，企业软件开发者可以将该驱动程序无缝地集成到他们为项目定制的 Linux 内核中。
>
> 来自 Linux 最终用户社区的投入和评价，将进一步提升英伟达 GPU 驱动程序的质量和安全性。

而从最终用户或者游戏玩家方面来看，你会发现安装将更便捷，整体会更安全。

Canonical 和 SUSE 会立即为他们的企业用户打包该开源内核模块，而其它厂商也会很快跟进。

当它可以用在桌面环境时，Canonical 应该会在未来几个月内把这个内核模块放到 Ubuntu 22.04 LTS 版本中。其它的 Linux 发行版应该也会做相应的升级。

### 现在可以试用吗？

![][2]

这个开源的 GPU 内核模块的第一个版本是 R515，它是作为 CUDA 工具集 11.7 一部分一起发布的开发驱动程序。

你可以从 [官方驱动下载页面][3] 或者从 [CUDA 下载页面][4] 找到。

虽然它被认为可用于数据中心生产环境，**但对于 GeForce 或者工作站 GPU 来说，还处于 alpha 阶段**。

事实上，在 Turing 和 Ampere 架构的 GPU 型号上可以使用这个驱动程序，以使用 Vulkan 和 Optix 中的 **多显示器、G-Sync、Nvidia RTX 光线追踪** 等功能。

然而，除非你想运行一些“实验性测试”，否则还是等几个月，以便直接从你的 Linux 发行版中获得为桌面用户发布的稳定版。

### 对 Nouveau 驱动程序开发也有益

不仅仅是提升了专有驱动程序的体验，公布的这个开源 GPU 内核代码也会改善 Nouveau 驱动。

正如发布公告所说：

> Nouveau 可以利用英伟达驱动程序所使用的同样固件，它公开了许多 GPU 功能，例如时钟管理、散热管理，可以为树内的 Nouveau 驱动程序带来新的特性。
> 
> 请关注未来的驱动更新以及在 Github 上的合作。

英伟达公司提到并可能合作改进开源的英伟达驱动程序（即 Nouveau），这真是太好了。

这也很好地表明了，他们确实希望为 Linux 提供一个更好的开源驱动程序版本。

### 开源 Nivida 驱动程序的未来？

毋容置疑，英伟达计划不断发布开源的 GPU 内核模块。

所以，尽管他们不会单独开源他们的驱动程序，但我们仍然可以寄希望于 Nouveau 释放所有的显卡特性。

想知道他们更多的计划，你可以参考 [官方的发布声明][5]。

*你如何看待这件事？英伟达最终会爱开源和 Linux 吗？嗯，至少这是一个好的开始。在下面的评论区分享你的想法吧。*


------
via: https://news.itsfoss.com/nvidia-open-source-linux/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[chunyang-wen](https://github.com/chunyang-wen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/linus-torvalds-nvidia.jpg
[2]: https://news.itsfoss.com/wp-content/uploads/2022/05/nvidia-opensource-linux-drivers-1024x576.jpg
[3]: https://www.nvidia.com/en-us/drivers/unix/
[4]: https://developer.nvidia.com/cuda-downloads
[5]: https://developer.nvidia.com/blog/nvidia-releases-open-source-gpu-kernel-modules/
