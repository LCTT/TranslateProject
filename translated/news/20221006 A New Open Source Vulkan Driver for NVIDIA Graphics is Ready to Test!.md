[#]: subject: "A New Open Source Vulkan Driver for NVIDIA Graphics is Ready to Test!"
[#]: via: "https://news.itsfoss.com/nvidia-nvk/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lkxed"
[#]: translator: "Cubik65536"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

一个全新的用于 NVIDIA 显卡的开源 Vulkan 驱动已经准备好测试了！
======
为 NVIDIA 显卡开发的一个全新的开源驱动正在开发中！这里有一些好的进展……

![一个全新的用于 NVIDIA 显卡的开源 Vulkan 驱动已经准备好测试了！][1]

**NVK** 是一个全新的用于 NVIDIA 显卡的开源 Vulkan 驱动，它的目标是成为新的主流显卡驱动。

这成为可能的部分原因是因为 Nvidia 开源了数据中心 GPU 和消费级 GPU（GTX/RTX）的 GPU 内核模块。

[NVIDIA 在改善其 GPU 在 Linux 上的体验方面迈出了重要的一步][2]

它使开发人员能够改进开源驱动程序并启用比以前更多的功能。

让我们来看看 NVK 可以提供什么。

### 适用于 NVIDIA GPU 的新 NVK 开源驱动程序

**Jason Ekstrand**（Collabora 的工程师）和 Red Hat 的其他人已经在过去几个月里编写了 NVK 的代码。

他们可以利用 Turing 显卡提供的统一固件 BLOB，然后在其上构建 Vulkan 支持。

**但是，nouveau 开源驱动程序已经存在了，对吗？**

NVK 与其他的 nouveau 驱动非常不同，因为它是从头开始编写的。

noiveau，一个重要的 Nvidia 显卡的开源驱动程序，已经年久失修了，试图在它的基础上构建是一个很多人都无法承担的任务。

当然，它是由有很多才华的工程师开发的，但是缺乏公司的支持和贡献者的影响了它的发展。

**NVK 旨在克服这些问题，同时专注于对 Turing 系列及更高版本 GPU 的支持。**

由于内核的开发方式，对于 Kepler、Maxwell 和 Pascal 等较旧的 GPU 的支持可能不会很容易地加入 NVK。它可能会对新内核有一个很大的依赖，从而只支持较新的 GPU。

同时，nouveau 内核接口与 Vulkan 不兼容，阻碍了对较旧 GPU 的支持。

但是，仍然有进一步测试的空间，这可能会让 NVK 可以支持较旧的 GPU。

当然，随着更多的社区贡献，NVK 可以通过增加额外的功能和 GPU 支持来改进。

### 如何尝试它？

NVK 目前处于非常初级的状态，有很多功能缺失，并且正在不断开发中。

**所以，它还不适合让所有类型的用户尝试。**

你还是可以通过拉取 freedesktop.org 上的 [nouveau/mesa 项目][4] 的 nvk/main 分支并构建它来尝试它。

如果你想的话，你也可以通过贡献到同一个 [nvk/main 分支][5] 来帮助 NVK 的开发。

对于更多的技术信息，你可以参考 [官方公告][6]。

### 未来潜力

NVK 有很多潜力，尤其是与老化的 [nouveau][7] 图形驱动套件相比。

这可以为 nouveau 带来一个合适的继承者，同时为 Linux 提供一个带有很多功能的，主流的开源 Nvidia 图形驱动套件。

💬 *你对此有什么看法？你认为这最终能够实现 nouveau 驱动程序所未能实现的吗？*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/nvidia-nvk/

作者：[Sourav Rudra][a]
选题：[lkxed][b]
译者：[Cubik65536](https://github.com/Cubik65536)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/content/images/size/w1200/2022/10/opensource-native-vulkan-gpu-driver-for-nvidia.png
[2]: https://news.itsfoss.com/nvidia-open-source-linux/
[4]: https://gitlab.freedesktop.org/nouveau/mesa
[5]: https://gitlab.freedesktop.org/nouveau/mesa/-/tree/nvk/main/
[6]: https://www.collabora.com/news-and-blog/news-and-events/introducing-nvk.html
[7]: https://nouveau.freedesktop.org/
