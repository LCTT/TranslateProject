[#]: subject: "NVIDIA Takes a Big Step to Improve its GPU Experience on Linux"
[#]: via: "https://news.itsfoss.com/nvidia-open-source-linux/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "chunyang.wen"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

英伟达 (Nvidia) 在提升 Linux 上的 GPU 使用体验上迈出了一大步
=====

英伟达公司提升 Nvidia GPU 在 Linux 上的体验开源计划终于来了。

![][1]

Linus Torvalds 会乐意听到此消息。

Nvidia 终于公布提升 Linux 上的 GPU 使用体验的计划。

不过不幸地是，和你想象的可能不完全一样，你仍然会看到很多有专有的驱动。

但是这和放弃专有的驱动一样重要。

它是：** Nvidia 发布支持数据中心和消费级（GeForce/RTX) 显卡开源 GPU 内核**。

此外，它同时支持 GPL/MIT 两种授权，听起来很酷对不对？

### 此举如何帮助到 Linux 桌面用户？

开源的 GPU 内核模块会提升内核和专有驱动之间的交互。

所以，这个动作对 **游戏玩家和开发者** 都有利，和 Nvidia 专有驱动之间麻烦事最终会被消除。

发布公告中提到的技术收益包括

> 开发者可以跟踪到具体的代码路径，并且观察内核事件调度和他们的工作之间的交互机制，从而在调试时更快定位根本原因。除此之外，企业软件开发者可以根据他们项目配置无缝地将驱动集成进入他们的内核

> 来自 Linux 终端社区输入和评价会进一步提升 Nvidia GPU 驱动的质量和安全性

当面对一个终端用户或者游戏玩家，我们想得越清楚，安装会更便捷，整体会更安全。

Canonical 和 SUSE 会立即为他们的企业用户打包开源的内核模块，其它厂商很快会跟进。

Canonical 应该在未来几月到来的 Ubuntu 22.04 LTS 桌面版本中让这些内核模块可用。其它的 Linux 发行版也会做相应的升级。

### 现在可以试用吗？

![][2]

第一个发布的开源 GPU 内核模块版本是 R515，是作为 CUDA 工具集 11.7 一部分一起发布的开发版本的驱动。

你可以从[官方驱动下载页面][3]或者从[CUDA 下载页面][4]找到。

对于数据中心是生产可用，**对于 GeForce 或者工作站 GPU 还是 alpha 阶段**。

事实上，在 Turing 和 Ampere GPu 型号上可以使用 Vulkan 和 Optix 中的 **多显示，G-Sync，Nvidia RTX 光线追踪** 功能。

然而除非你想运行一些实验性测试，你可能想等待几个月，从而直接获取你的 Linux 发行版为终端用户发行的稳定版。

### 对 Nouveau 驱动开发也有益

不仅仅是提升专有驱动的体验，公布的开源 GPU 内核代码也会改善 Nouveau 驱动。

正如发布新闻所说：

> Nouveau 可以像 Nvidia 驱动一样充分利用硬件，暴露更多 GPU 功能，例如时钟管理，散热管理，为 Nouveau 驱动带来新的特性。为未来的驱动更新保持关注，在 Github 上合作。

NVIDIA 真是出奇的好，它提到并且有可能和改善 NVIDIA 开源驱动的团队合作，例如 Nouveau。

这也更好地表示他们希望 Linux 的开源驱动有一个更好的版本。

### 开源 Nivida 驱动的未来？

毋容置疑，NVIDIA 计划持续发布开源的 GPU 内核模块。

所以，尽管他们不会单独开源它们的驱动，我们仍然可以寄希望于 Nouveau 释放所有的图形卡特性。

想知道他们更多的计划，你可以参考[官方的发布声明][5]。

*你如何看待这件事？Nivida 最终会爱开源和 Linux？嗯，至少这是一个好的开始。在下面的评论区分享你的想法吧。*

via: https://news.itsfoss.com/nvidia-open-source-linux/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/chunyang-wen)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/linus-torvalds-nvidia.jpg
[2]: https://news.itsfoss.com/wp-content/uploads/2022/05/nvidia-opensource-linux-drivers-1024x576.jpg
[3]: https://www.nvidia.com/en-us/drivers/unix/
[4]: https://developer.nvidia.com/cuda-downloads
[5]: https://developer.nvidia.com/blog/nvidia-releases-open-source-gpu-kernel-modules/
