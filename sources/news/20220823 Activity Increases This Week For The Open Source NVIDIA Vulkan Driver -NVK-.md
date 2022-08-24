[#]: subject: "Activity Increases This Week For The Open Source NVIDIA Vulkan Driver (NVK)"
[#]: via: "https://www.opensourceforu.com/2022/08/activity-increases-this-week-for-the-open-source-nvidia-vulkan-driver-nvk/"
[#]: author: "Laveesh Kocher https://www.opensourceforu.com/author/laveesh-kocher/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Activity Increases This Week For The Open Source NVIDIA Vulkan Driver (NVK)
======
The open source NVIDIA Vulkan driver “NVK,” which is being created for Mesa, has experienced a busy week of fresh development activity. NVK was developed by Nouveau developers at Red Hat, including Karol Herbst, as an open-source NVIDIA Vulkan driver. It will probably take some time before this Vulkan driver is prepared for Linux gamers and other users because it is still very much a work in progress and has not yet been added to mainline Mesa.

The lack of re-clocking support for GeForce GTX 900 “Maxwell” GPUs and newer, which results in the NVIDIA GPUs being constrained to operating at their low boot-clock speeds, continues to be the major Nouveau barrier on the kernel driver side. For GTX 900 series graphics cards and newer, the Nouveau performance is in terrible shape. The GTX 600/700 series are getting on in years and may be manually re-clocked to their ideal clock frequencies by interested users using the command-line. Both the OpenGL and Vulkan Nouveau performance will continue to suffer significantly until this is resolved, and ultimately the PMU firmware issue complicating these efforts.

Anyone interested in following the development of the Nouveau NVK project can do so by visiting Nouveau’s Mesa NVK branch, where it is now centralised. This week, Jason Ekstrand with Collabora has been particularly busy in bringing up this Vulkan driver. Ekstrand will be a great contributor to NVK because he was one of the first developers when Intel started their ANV open source Vulkan driver and sustained that effort for years while still employed by the firm.

This week, NVK saw the inclusion of more format capabilities, Maxwell fixes, zeroing of client memory objects, support for creating linear images, numerous bug patches, and a number of other improvements. We can only hope that NVK development keeps moving forward at full-speed so that it will be prepared for Linux gamers by the time the Nouveau DRM re-clocking issue is resolved, most likely through NVIDIA GSP (GPU System Processor) integration.

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/08/activity-increases-this-week-for-the-open-source-nvidia-vulkan-driver-nvk/

作者：[Laveesh Kocher][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/laveesh-kocher/
[b]: https://github.com/lkxed
