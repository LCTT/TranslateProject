[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Intel targets Nvidia (again) with GPU and cross-processor API)
[#]: via: (https://www.networkworld.com/article/3454497/intel-targets-nvidia-again-with-gpu-and-cross-processor-api.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Intel targets Nvidia (again) with GPU and cross-processor API
======
Intel is looking to offer a unified CPU, GPU, and platform architecture that Nvidia doesn’t have but AMD does.
Martyn Williams/IDG

Third time’s the charm? Intel is hoping so. It released details of its Xe Graphics Architecture, with which it plans to span use cases from mobility to high-performance computing (HPC) servers – and which it hopes will succeed where its [Larrabee][1] GPU and [Xeon Phi][2] manycore processors failed.

It’s no secret Intel wants a piece of the high-performance computing HPC action, given that it introduced the chip and other products at it Intel HPC Developer Conference in Denver, Colo., this week just ahead of the Supercomputing ’19 tradeshow.

**Don't miss** [**10 of the world's fastest supercomputers**][3]

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

Intel bills the Xe Graphics Architecture card as its first "exascale graphics card," based on a new 7nm architecture called “Ponte Vecchio.” Intel is splitting the Xe Architecture into three designs for different segments: [data center][5], consumer graphics cards, and AI use-cases; integrated graphics for processors; and the high-tier Xe HPC for high performance computing.

Rather than use the large die for its graphics chips the way Nvidia and AMD do it, Intel is using the Multi-Chip Module (MCM) design that breaks up one big chip into smaller “chiplets” that are connected via a high speed fabric. This is how AMD designed the [Ryzen and EPYC CPUs][6], something Intel initially pooh-poohed but is since [adopting][7] for its Xeons.

These modules also use other packaging technology advancements such as Foveros 3D chip-packaging technology, which allows for 3D stacking of dies and mixing of CPU, AI, and GPU processors, High Bandwidth Memory (HMB) and Embedded Multi-Die Bridge (EMIB) technology to tie the HBM packages to the compute die.

Xe Architecture cards will also come with a new scalable fabric called XE Memory Fabric (XEMF), which ties compute and memory together with a coherent memory interface that Intel claims will allow Xe to scale to thousands of nodes.

Kevin Krewell, principal analyst with Tirias Research, noted that this is not a brand-new graphic architecture, it’s an evolution from Intel’s integrated GPU technology that has been a part of its consumer Core CPUs for several years and has been steadily maturing.

“This is a design that is more like traditional graphics. [Intel is starting] with their traditional integrated graphics cores and building on top of that. Larrabee tried a GPU built on a CPU. In this case they are building a ground up GPU with GPU-like features and not trying to do anything too weird. And now they've got a real GPU guy running the group,” he said.

Krewell is referring to Raja Koduri, senior vice president of the company's Core and Visual Computing Group. Koduri has one hell of a resume. He was the brains behind AMD integrating CPU and GPU cores on one die (yet another example of AMD leading) and then went to Apple where he pioneered the [Retina display][8]. So if Intel can’t get graphics right with this guy there is no hope.

### Taking Aim At CUDA

One thing that has been a huge boon to Nvidia is its CUDA language for programming GPUs. Intel is taking aim and then some at CUDA with its new OneAPI programming model, which Intel designed to simplify programming across not only its GPU but CPU, FPGA, and AI accelerators as well.

This means applications can move seamlessly between Intel's different types of compute architectures. If an application is best processed on an FPGA, then it will be processed there. Same for CPUs, GPUs, and AI accelerators. If that’s not enough, Intel has the Data Parallel C++ Conversion Tool to take CUDA code and port it to OneAPI. If they pull this off, it would be a huge advantage over Nvidia, since CUDA is only for its GPUs.

Interestingly, Intel said OneAPI will be open-source and will also work with other vendors' hardware, although they didn’t say whose. If it ends up ported to AMD’s platform, well, that would be entertaining.

“It’s more than a shot at CUDA because they want to replace CUDA,” said Krewell. “OneAPI is a very ambitious program, trying to combine all of the different processor elements under one umbrella API. So it’s a very aggressive program and they are building it out piece by piece.  But right now it’s at version 0.5. CUDA is at version ten. So they've got a ways to catch up.”

[[Get regularly scheduled insights by signing up for Network World newsletters.]][9]

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3454497/intel-targets-nvidia-again-with-gpu-and-cross-processor-api.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/2239992/intel-nurses--black-eye--on-larrabee--as-amd--nvidia-get-to-work.html
[2]: https://www.networkworld.com/article/3296004/intel-ends-the-xeon-phi-product-line.html
[3]: https://www.networkworld.com/article/3236875/embargo-10-of-the-worlds-fastest-supercomputers.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.networkworld.com/article/3223692/what-is-a-data-centerhow-its-changed-and-what-you-need-to-know.html
[6]: https://www.networkworld.com/article/3321943/amd-s-road-to-the-data-center-and-hpc-isn-t-as-long-as-you-think.html
[7]: https://www.networkworld.com/article/3408177/intel-unveils-new-3d-chip-packaging-design.html
[8]: https://www.networkworld.com/article/2211314/iphone-4-s-retina-display-explained.html
[9]: https://www.networkworld.com/newsletters/signup.html
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
