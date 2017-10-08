更快的机器学习即将来到 Linux 内核
============================================================

> Linux 内核新增的异构内存管理将解锁加速 GPU 的新途径，并挖掘其它的机器学习硬件的潜能


![更快的机器学习正在来到你身边的 Linux 内核](http://images.techhive.com/images/article/2015/12/machine_learning-100633721-primary.idge.jpg)

>Credit: Thinkstock

一项开发了很久的内存管理技术将会给机器学习和其它 GPU 驱动的程序很大幅度的提升，而它也将在接下来的几个版本中进入 Linux 内核。

异构内存管理（HMM）可以允许设备驱动为在其自身内存管理下的进程镜像地址空间。正如红帽的开发者 Jérôme Glisse [所解释的][10]，这让像 GPU 这样的硬件设备可以直接访问进程内存，而不用花费复制带来的额外开销。它还不违反现代操作系统提供的内存保护功能。

一类会从 HMM 中获益最多的应用是基于 GPU 的机器学习。像 OpenCL 和 CUDA 这样的库能够从 HMM 中获得速度的提升。HMM 实现这个的方式和[加速基于 GPU 的机器学习][11]相似，就是让数据留在原地，靠近 GPU 的地方，在那里直接操作数据，尽可能少地移动数据。

像这样的加速对于 CUDA（英伟达基于 GPU 的处理库）来说，只会有益于在英伟达 GPU 上的操作，这些 GPU 也是目前加速数据处理的主要硬件。但是，OpenCL 设计用来编写可以针对多种硬件的代码——CPU、GPU、FPGA 等等——随着这些硬件的成熟，HMM 能够提供更加广泛的益处。

要让 Linux 中的 HMM 处于可用状态还有一些阻碍。第一个是内核支持，在很长一段时间里都受到限制。[早在 2014][12]年，HMM 最初作为 Linux 内核补丁集提出，红帽和英伟达都是关键开发者。需要做的工作不少，但是开发者认为代码可以提交上去，也许接下来的几个内核版本就能把它包含进去。

第二个阻碍是显卡驱动支持，英伟达一直在自己单独做一些工作。据 Glisse 的说法，AMD 的 GPU 可能也会支持 HMM，所以这种特殊优化不会仅限于英伟达的 GPU。AMD 一直都在尝试提升它的 GPU 市场占有率，有可能会[将 GPU 和 CPU 整合][13]到同一模具。但是，软件生态系统依然更青睐英伟达；要使其兑现，还需要更多的像 HMM 这样的中立项目，以及让 OpenCL 提供和 CUDA 相当的性能。

第三个阻碍是硬件支持，因为 HMM 的工作需要一项称作可重现页面故障（replayable page faults）的硬件特性。只有英伟达的帕斯卡系列高端 GPU 才支持这项特性。从某些意义上来说这是个好消息，因为这意味着英伟达只需要提供单一硬件的驱动支持就能让 HMM 正常使用，工作量就少了。

一旦 HMM 到位，对于提供 GPU 实例的公有云提供商就会面临压力，他们需要[支持最新最好一代的 GPU][14]。这并不是仅仅将老款的开普勒架构显卡换成最新的帕斯卡架构显卡就行了，因为后续的每一代显卡都会更加优秀，像 HMM 这样的支持优化将提供战略优势。

--------------------------------------------------------------------------------

via: http://www.infoworld.com/article/3196884/linux/faster-machine-learning-is-coming-to-the-linux-kernel.html

作者：[Serdar Yegulalp][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

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
