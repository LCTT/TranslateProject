[#]: subject: "A New Open Source Vulkan Driver for NVIDIA Graphics is Ready to Test!"
[#]: via: "https://news.itsfoss.com/nvidia-nvk/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

A New Open Source Vulkan Driver for NVIDIA Graphics is Ready to Test!
======
A new open-source driver is in the making for NVIDIA graphics! Some good progress here...

![A New Open Source Vulkan Driver for NVIDIA Graphics is Ready to Test!][1]

**NVK** is a new open-source Vulkan driver for NVIDIA Graphics hardware and aims to be the new go-to graphics driver.

This was made possible in part due to Nvidia releasing open-source GPU kernel modules for its data center GPUs and consumer cards (GTX/RTX).

[NVIDIA Takes a Big Step to Improve its GPU Experience on Linux][2]

It has enabled developers to improve open-source drivers and enable more features than what was possible before.

Let's take a look at what NVK has to offer.

### New NVK Open-Source Driver for NVIDIA GPU

**Jason Ekstrand** (engineer at Collabora) and a few others from Red Hat have been writing the code for NVK for the past few months.

They could take advantage of the unified firmware BLOBs that Turing GPUs offer, and built on top of it with Vulkan support.

**But, open-source nouveau drivers exist, right?**

NVK is very different from the nouveau drivers, as it has been written from scratch.

Nouveau, a major open-source driver suite for Nvidia GPUs has fallen into disrepair, and trying to build on it is a task not many can take up.

Of course, skillful engineers worked on it, but lack of corporate backing and contributors affected its evolution.

**NVK aims to get over those while focusing on support for GPUs of the Turing series and later to start with.**

Support for older GPUs such as Kepler, Maxwell, and Pascal might not come to NVK that easily, because of how the kernel is being developed. It might have a hard dependency on the new kernel, resulting in support for newer GPUs only.

Also, the nouveau kernel interface not playing nice with Vulkan and hindering support for older GPUs.

But, there is still scope for further testing, which can result in support for older GPUs with NVK.

Of course, with more community contributions, NVK can be improved with additional features and GPU support.

### How To Try It Out?

NVK is currently available in a very alpha-build state, with many features missing and under constant development.

**So, it is not yet ready for all kinds of users to get a hands on it.**

You can still try it out by pulling and building it from the nvk/main branch from the [nouveau/mesa project][4] on freedesktop.org.

If you want, you can also contribute to the development of NVK by heading over to the [nvk/main branch][5] of the same.

For more technical info, you can refer to the [official announcement][6].

### Future Potential

NVK has a lot of potential, especially compared to the aging [nouveau][7] graphics driver suite.

This can lead to a proper successor of nouveau and a mainstream open-source Nvidia graphics driver suite for Linux with a lot of functionality on offer.

💬 *What are your thoughts on this? Do you think this will finally achieve what nouveau drivers failed to?*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/nvidia-nvk/

作者：[Sourav Rudra][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
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
