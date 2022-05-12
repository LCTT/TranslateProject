[#]: subject: "NVIDIA Takes a Big Step to Improve its GPU Experience on Linux"
[#]: via: "https://news.itsfoss.com/nvidia-open-source-linux/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "chunyang.wen"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

NVIDIA Takes a Big Step to Improve its GPU Experience on Linux
======
Nvidia’s big open-source decision to help improve the Linux experience on NVIDIA GPUs. It’s finally here!

![][1]

Linus Torvalds will be happy to hear this…

NVIDIA finally announced an open-source initiative to improve the GPU experience on Linux.

Unfortunately, it isn’t exactly what you think, you will still find proprietary drivers around.

But, it’s as significant as ditching the proprietary drivers.

Here it is: **NVIDIA released open-source GPU kernel modules with support for data center GPUs and consumer (GeForce/RTX) cards**.

And, it is licensed under a dual GPL/MIT license, sounds awesome, right?

### How does this help Linux Desktop Users?

Open-Source GPU kernel modules will help improve the interaction between the kernel and the proprietary driver.

So, this move is beneficial for both **gamers, and developers**, where the hassles to work with a proprietary Nvidia driver will eventually be eliminated.

The release announcement mentions the technical benefit that includes:

> Developers can trace into code paths and see how kernel event scheduling is interacting with their workload for faster root cause debugging. In addition, enterprise software developers can now integrate the driver seamlessly into the customized Linux kernel configured for their project.

> This will further help improve NVIDIA GPU driver quality and security with input and reviews from the Linux end-user community.

When thinking this through for an end-user (or a gamer), you will notice easier installations and improved security overall.

Canonical and SUSE will immediately package the open kernel modules for enterprise users, and others should follow soon.

Canonical should make the kernel modules available in Ubuntu 22.04 LTS in the coming months when it comes to the Linux desktop. You can expect other Linux distributions to follow the suit.

### Can You Try it Now?

![][2]

The first release of the open GPU kernel modules is R515. It is a development driver released as part of CUDA Toolkit 11.7.

You can get it from the [official download page for drivers][3] or find it on the [CUDA downloads][4] page.

While it is considered production-ready for data centers, it is still in its **alpha stage for GeForce and Workstation GPUs**.

It is true that you can use this driver on Turing and Ampere architecture GPUs to use features like **multiple displays, G-Sync, and Nvidia RTX ray tracing** in Vulkan and OptiX.

But, unless you want to run “experimental tests”, you might want to wait for a few months to get a stable release for desktop users directly from your Linux distribution.

### It Also Helps Nouveau Driver…

Not just limited to improving the experience with proprietary drivers. But, the published source code of open-source GPU kernels should also help improve the Nouveau driver.

As the release announcement mentions:

> Nouveau can leverage the same firmware used by the NVIDIA driver, exposing many GPU functionalities, such as clock management and thermal management, bringing new features to the in-tree Nouveau driver.Stay tuned for more developments in future driver releases and collaboration on GitHub.

It is surprisingly nice of NVIDIA to mention and potentially aim to collaborate to improve the open-source Nvidia driver i.e. Nouveau.

This also gives a good indication that they do want a better version of an open-source driver for Linux.

### Future of Open-Source Nvidia Drivers?

Undoubtedly, NVIDIA plans to continue releasing the open-source GPU kernel modules.

So, even if they do not separately open-source their drivers, we can always rely on an improved Nouveau driver unlocking all the graphics card features.

To know more about their plans, you can refer to the [official release announcement][5].

*What do you think about it? Does Nvidia finally love open-source and Linux? Well, it is a solid start, to say the least. Share your thoughts in the comments down below.*

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/nvidia-open-source-linux/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/linus-torvalds-nvidia.jpg
[2]: https://news.itsfoss.com/wp-content/uploads/2022/05/nvidia-opensource-linux-drivers-1024x576.jpg
[3]: https://www.nvidia.com/en-us/drivers/unix/
[4]: https://developer.nvidia.com/cuda-downloads
[5]: https://developer.nvidia.com/blog/nvidia-releases-open-source-gpu-kernel-modules/
