[#]: subject: "Red Hat Tests The “NVK” Nouveau Open Source Vulkan Driver"
[#]: via: "https://www.opensourceforu.com/2022/06/red-hat-tests-the-nvk-nouveau-open-source-vulkan-driver/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Red Hat Tests The “NVK” Nouveau Open Source Vulkan Driver
======
![red-hat][1]

Following the recent news about Nouveau reorganising code to allow their shader compiler to be used outside of Nouveau Gallium3D, Red Hat’s Karol Herbst, a longtime Nouveau developer, has been posting patches for his new “NVK” Nouveau Vulkan driver effort.

NVK is a brand-new, yet-to-be-merged open source Vulkan driver for NVIDIA graphics hardware. This is a Mesa-based driver that is currently being worked on primarily by Karol Herbst, who joined Red Hat several years ago and has since continued to work heavily on Mesa, including in the areas of OpenCL compute and other features. Aside from NVK, he has recently begun working on Rusticl, a Rust-based OpenCL implementation for Mesa.

Jason Ekstrand of Collabora, as well as David Airlie of Red Hat, have been making early contributions to NVK. NVK can at least run vulkaninfo, but it is still a work in progress, with the initial code only being committed two weeks ago.

Aside from performance issues with newer generations of NVIDIA graphics cards, the lack of an open source NVIDIA Vulkan driver has been a major roadblock, given that most Linux games these days are Vulkan-native, and even Steam Play is mostly Vulkan with VKD3D-Proton/DXVK.

This NVK driver will most likely be updated in the future to support the open source NVIDIA kernel driver as an alternative to the Nouveau DRM driver. The original NVK open source Vulkan driver code is available on [Nouveau’s GitLab repository][2].

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/06/red-hat-tests-the-nvk-nouveau-open-source-vulkan-driver/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/06/red-hat-e1654256924226.jpg
[2]: https://gitlab.freedesktop.org/nouveau/mesa/-/commits/nouveau/vk/
