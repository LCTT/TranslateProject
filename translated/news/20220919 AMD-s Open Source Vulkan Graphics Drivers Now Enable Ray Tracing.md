[#]: subject: "AMD’s Open Source Vulkan Graphics Drivers Now Enable Ray Tracing"
[#]: via: "https://www.opensourceforu.com/2022/09/amds-open-source-vulkan-graphics-drivers-now-enable-ray-tracing/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: "littlebirdnest"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

AMD 的开源图形驱动程序 Vulkan现在支持光线追踪
======
*RDNA 2 GPU 的 Linux 用户可以使用 AMD 的 AMDVLK GPUOpen 开源 Vulkan 驱动程序。*

用于 Radeon RX 6000 GPU 的 AMDVLK GPUOpen 图形驱动程序在过去一周改进了对 64 位光线追踪的支持。这涵盖了支持 RDNA 2 图形的 APU 以及桌面/移动 GPU。所有平台上的所有 AMD Vulkan 驱动程序现在都支持硬件光线追踪，包括 Mesa3D RADV、AMDVLK GPUOpen 和 AMDGPU-PRO。

GPURT 库的基础是 C++ 接口。根据其用法和依赖关系，公共接口被拆分为各种头文件。用户可以在官方 GitHub 网站上了解更多信息，该网站还包括结构细分，关于 RDNA 2 GPU 光线追踪库 (GPURT)。最新的 AMDVLK GPUOpen v-2022.Q3.4 信息如下：

**更新和新功能**

- 扩展 Navi2x 的 64 位光线追踪功能。
- 将 Vulkan 标头升级到版本 1.3.225
- 游戏性能优化，包括《荣耀战魂》和《奇点灰烬》

**目前解决的问题**

- 解析传输前的dEQP-VK.api.copy和blit..resolve image.whole copy有新版本CTS失败。
- dEQP-VK.pipeline.creation 缓存控件有一个 CTS 警告。
- Ubuntu 22.04 上的 Firefox 损坏
- VulkanInfo 崩溃，管道缓存已停用
- RX 6800 上的 RGP 测试套件故障

新的改进包括 GPU 光线追踪库或 GPURT，它将包括使用 HLSL 等着色器在光线追踪中看到的边界体积层次 (BVH) 的构造和排序处理。这个库将提供一个标准库来改进图形渲染并引入更多的统一性。DirectX 12 DXR 也将与新库一起使用。

GPU 光线追踪 (GPURT) 库的描述为“一个静态库（可交付源代码），为支持 DXR (DirectX 12) 和 Vulkan® RT API 的 AMD 驱动程序提供与光线追踪相关的功能。” 该公司的平台抽象库用于构建库（PAL）。

用户可在此处获得最新 AMDVLK GPUOpen v-2022.Q3.4 升级的安装说明。用户在更新任何软件、硬件或驱动程序之前应备份所有相关数据，以免丢失重要文件。为了让最新的 Linux 驱动程序为 AMD、Intel 和 NVIDIA 技术做好准备，已经投入了大量工作，这些技术都是在今年第一季度推出的。

为了让最新的 Linux 驱动程序为 AMD、Intel 和 NVIDIA 技术做好准备，已经投入了大量工作，这些技术都是在今年第一季度推出的。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/amds-open-source-vulkan-graphics-drivers-now-enable-ray-tracing/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[littlebirdnest](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
