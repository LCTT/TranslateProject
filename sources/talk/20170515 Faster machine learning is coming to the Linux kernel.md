alim0x translating

Faster machine learning is coming to the Linux kernel
============================================================

### The addition of heterogenous memory management to the Linux kernel will unlock new ways to speed up GPUs, and potentially other kinds of machine learning hardware


![Faster machine learning is coming to a Linux kernel near you](http://images.techhive.com/images/article/2015/12/machine_learning-100633721-primary.idge.jpg)
>Credit: Thinkstock

It's been a long time in the works, but a memory management feature intended to give machine learning or other GPU-powered applications a major performance boost is close to making it into one of the next revisions of the kernel.

Heterogenous memory management (HMM) allows a device’s driver to mirror the address space for a process under its own memory management. As Red Hat developer Jérôme Glisse [explains][10], this makes it easier for hardware devices like GPUs to directly access the memory of a process without the extra overhead of copying anything. It also doesn't violate the memory protection features afforded by modern OSes.


One class of application that stands to benefit most from HMM is GPU-based machine learning. Libraries like OpenCL and CUDA would be able to get a speed boost from HMM. HMM does this in much the same way as [speedups being done to GPU-based machine learning][11], namely by leaving data in place near the GPU, operating directly on it there, and moving it around as little as possible.

These kinds of speed-ups for CUDA, Nvidia’s library for GPU-based processing, would only benefit operations on Nvidia GPUs, but those GPUs currently constitute the vast majority of the hardware used to accelerate number crunching. However, OpenCL was devised to write code that could target multiple kinds of hardware—CPUs, GPUs, FPGAs, and so on—so HMM could provide much broader benefits as that hardware matures.


There are a few obstacles to getting HMM into a usable state in Linux. First is kernel support, which has been under wraps for quite some time. HMM was first proposed as a Linux kernel patchset [back in 2014][12], with Red Hat and Nvidia both involved as key developers. The amount of work involved wasn’t trivial, but the developers believe code could be submitted for potential inclusion within the next couple of kernel releases.

The second obstacle is video driver support, which Nvidia has been working on separately. According to Glisse’s notes, AMD GPUs are likely to support HMM as well, so this particular optimization won’t be limited to Nvidia GPUs. AMD has been trying to ramp up its presence in the GPU market, potentially by [merging GPU and CPU processing][13] on the same die. However, the software ecosystem still plainly favors Nvidia; there would need to be a few more vendor-neutral projects like HMM, and OpenCL performance on a par with what CUDA can provide, to make real choice possible.

The third obstacle is hardware support, since HMM requires the presence of a replayable page faults hardware feature to work. Only Nvidia’s Pascal line of high-end GPUs supports this feature. In a way that’s good news, since it means Nvidia will only need to provide driver support for one piece of hardware—requiring less work on its part—to get HMM up and running.

Once HMM is in place, there will be pressure on public cloud providers with GPU instances to [support the latest-and-greatest generation of GPU][14]. Not just by swapping old-school Nvidia Kepler cards for bleeding-edge Pascal GPUs; as each succeeding generation of GPU pulls further away from the pack, support optimizations like HMM will provide strategic advantages.

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/3196884/linux/faster-machine-learning-is-coming-to-the-linux-kernel.html

作者：[Serdar Yegulalp][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.infoworld.com/author/Serdar-Yegulalp/
[1]:https://twitter.com/intent/tweet?url=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3196884%2Flinux%2Ffaster-machine-learning-is-coming-to-the-linux-kernel.html&via=infoworld&text=Faster+machine+learning+is+coming+to+the+Linux+kernel
[2]:https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3196884%2Flinux%2Ffaster-machine-learning-is-coming-to-the-linux-kernel.html
[3]:http://www.linkedin.com/shareArticle?url=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3196884%2Flinux%2Ffaster-machine-learning-is-coming-to-the-linux-kernel.html&title=Faster+machine+learning+is+coming+to+the+Linux+kernel
[4]:https://plus.google.com/share?url=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3196884%2Flinux%2Ffaster-machine-learning-is-coming-to-the-linux-kernel.html
[5]:http://reddit.com/submit?url=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3196884%2Flinux%2Ffaster-machine-learning-is-coming-to-the-linux-kernel.html&title=Faster+machine+learning+is+coming+to+the+Linux+kernel
[6]:http://www.stumbleupon.com/submit?url=http%3A%2F%2Fwww.infoworld.com%2Farticle%2F3196884%2Flinux%2Ffaster-machine-learning-is-coming-to-the-linux-kernel.html
[7]:http://www.infoworld.com/article/3196884/linux/faster-machine-learning-is-coming-to-the-linux-kernel.html#email
[8]:http://www.infoworld.com/article/3152565/linux/5-rock-solid-linux-distros-for-developers.html#tk.ifw-infsb
[9]:http://www.infoworld.com/newsletters/signup.html#tk.ifw-infsb
[10]:https://lkml.org/lkml/2017/4/21/872
[11]:http://www.infoworld.com/article/3195437/machine-learning-analytics-get-a-boost-from-gpu-data-frame-project.html
[12]:https://lwn.net/Articles/597289/
[13]:http://www.infoworld.com/article/3099204/hardware/amd-mulls-a-cpugpu-super-chip-in-a-server-reboot.html
[14]:http://www.infoworld.com/article/3126076/artificial-intelligence/aws-machine-learning-vms-go-faster-but-not-forward.html
