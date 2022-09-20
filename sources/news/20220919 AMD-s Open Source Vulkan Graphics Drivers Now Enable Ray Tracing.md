[#]: subject: "AMD’s Open Source Vulkan Graphics Drivers Now Enable Ray Tracing"
[#]: via: "https://www.opensourceforu.com/2022/09/amds-open-source-vulkan-graphics-drivers-now-enable-ray-tracing/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

AMD’s Open Source Vulkan Graphics Drivers Now Enable Ray Tracing
======
*Linux users of RDNA 2 GPUs can use the AMDVLK GPUOpen open source Vulkan driver from AMD.*

The AMDVLK GPUOpen graphics driver for its Radeon RX 6000 GPUs has improved support for 64-bit ray tracing over the past week. This covers RDNA 2 graphics-enabled APUs as well as desktop/mobility GPUs. Hardware ray tracing is now supported by all AMD Vulkan drivers on all platforms, including Mesa3D RADV, AMDVLK GPUOpen, and AMDGPU-PRO.

The foundation of the GPURT library is a C++ interface. Depending on its usage and dependencies, the public interface is split up into various header files. Users can learn more on the official GitHub website, which also includes a breakdown of the structure, about the RDNA 2 GPU Ray Tracing Library (GPURT). The most recent AMDVLK GPUOpen v-2022.Q3.4 information is provided below:

**Updates and new features**

* Expand Navi2x’s capability for 64-bit ray tracing.
* Upgrade Vulkan Headers to version 1.3.225
* Game performance optimization, including For Honor and Ashes of the Singularity

**Issues resolved so far**

* The dEQP-VK.api.copy and blit..resolve image.whole copy before resolving transfer has a new version CTS failure.
* dEQP-VK.pipeline.creation cache control has a CTS warning.
* Firefox corruption on Ubuntu 22.04
* VulkanInfo crash with pipeline cache deactivated
* RGP test kit failure on RX 6800

The new improvements include the GPU Ray Tracing Library, or GPURT, which will include the construct and sort processing for the Bounding Volume Hierarchy (BVH) seen in ray tracing utilising shaders like HLSL. This library will provide a standard library to improve graphics rendering and introduce more uniformity. DirectX 12 DXR will also work with the new library.

The description of the GPU Ray Tracing (GPURT) library reads as  “a static library (source deliverable) that provides ray tracing-related functionalities for AMD drivers supporting DXR (DirectX 12) and the Vulkan® RT API.” The company’s Platform Abstraction Library is used to build the library (PAL).

The installation instructions for the most recent AMDVLK GPUOpen v-2022.Q3.4 upgrade are available here for users. Users should back up any relevant data before updating any software, hardware, or drivers in order to avoid losing crucial files. A lot of work has been put into getting the most recent Linux driver ready for AMD, Intel, and NVIDIA technologies, which were all launched in the first quarter of this year.

A lot of work has been put into getting the most recent Linux driver ready for AMD, Intel, and NVIDIA technologies, which were all launched in the first quarter of this year.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/09/amds-open-source-vulkan-graphics-drivers-now-enable-ray-tracing/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
