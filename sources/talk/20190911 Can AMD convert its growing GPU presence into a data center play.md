[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Can AMD convert its growing GPU presence into a data center play?)
[#]: via: (https://www.networkworld.com/article/3438098/can-amd-convert-its-growing-gpu-presence-into-a-data-center-play.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Can AMD convert its growing GPU presence into a data center play?
======
AMD has scored high-performance computing deals recently, but to truly compete with Nvidia it needs to develop an alternative to Nvidia’s CUDA language.
AMD

AMD's $5.4 billion purchase of ATI Technologies in 2006 seemed like an odd match. Not only were the companies in separate markets, but they were on separate coasts, with ATI in the Toronto, Canada, region and AMD in Sunnyvale, California.

They made it work, and arguably it saved AMD from extinction because it was the graphics business that kept the company afloat while the Athlon/Opteron business was going nowhere. There were many quarters where graphics brought in more revenue than CPUs and likely saved the company from bankruptcy.

But those days are over, and AMD is once again a highly competitive CPU company, and quarterly sales are getting very close to the $2 billion mark. While the CPU business is on fire, the GPU business continues to do well.

**Also read: [AI boosts data-center availability and efficiency][1]**

For the second quarter of 2019, AMD's GPU shipments increased 9.8% vs. Q1, while Nvidia's were flat and Intel's shipments decreased -1.4%, according to Jon Peddie Research. An increase over the first quarter is a very good showing because Q2 typically drops from Q1.

AMD and Nvidia don't break out market segments, nor do they say what percentage comes from enterprise/HPC/supercomputing sales. The challenge for AMD, then, is to translate its gaming popularity into enterprise sales.

### Competing in the high-performance computing space

In high-performance computing (HPC), which includes artificial intelligence (AI), Nvidia clearly dominates. AMD has no answer for Nvidia's RTX 270/280 or the Tesla T4, but that hasn't stopped AMD from racking up the occasional win. The Oak Ridge National Lab plans to build an exascale supercomputer called Frontier in 2021 using AMD Epyc processors and Radeon GPUs.

AMD CEO Lisa Su talked about it at the recent Hot Chips semiconductor conference, where she said Frontier would feature "highly optimized CPU, highly optimized GPU, highly optimized coherent interconnect between CPU and GPU, [and] working together with Cray on the node to node latency characteristics really enables us to put together a leadership system.”

AMD has also scored deals with Google to power its cloud-based Stadia game console, providing 10.7Tflops/sec., more than the Microsoft and Sony consoles combined. And AMD has had a deal with China's Baidu to provide GPU-based computing for two years.

The problem, according to Peddie, isn't so much the hardware as it is the software. Nvidia has a special language called CUDA, first developed by Stanford professor Ian Buck, who is now head of Nvidia's AI efforts. It allows developers to write apps that fully utilize the GPU with a familiar C++ syntax. Nvidia then went to hundreds of universities and set them up to teach CUDA to students.

"The net result is universities around the world are cranking out thousands of grads who know CUDA, and AMD has no equivalent," said Peddie.

The result is it's much harder to code for a Radeon than a Tesla/Volta. AMD supports the open-standard OpenCL library and the open-source project [HIP][2], which converts CUDA to portable C++ code.

The OpenCL standard was developed by Apple but is now maintained by the [Khronos Group][3], and if there is one way for a standard to go nowhere, it's to put it in the hands of a standards group. Look what it did for OpenGL. It had the lead decades ago, then Microsoft came out with DirectX and obliterated OpenGL. The unfortunate fact is standards always fare better when there is a company behind it with something to gain.

For AMD to gain ground in the data center and HPC/AI against Nvidia, it needs a competitor to CUDA. Up until two years ago, that simply wasn't possible because AMD was fighting for its life. But now, with hot new silicon, the time is right for the company to push into software and give Nvidia the same fits it is giving Intel.

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3438098/can-amd-convert-its-growing-gpu-presence-into-a-data-center-play.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3274654/ai-boosts-data-center-availability-efficiency.html
[2]: https://github.com/ROCm-Developer-Tools/HIP
[3]: https://www.khronos.org/opencl/
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
