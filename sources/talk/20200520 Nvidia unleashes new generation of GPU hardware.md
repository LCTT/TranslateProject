[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Nvidia unleashes new generation of GPU hardware)
[#]: via: (https://www.networkworld.com/article/3543958/nvidia-unleashes-new-generation-of-gpu-hardware.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Nvidia unleashes new generation of GPU hardware
======
Nvidia used to design chips for gamers but with its latest hardware has now fully become an HPC and AI developer.
Nvidia

Nvidia, whose heritage lies in making chips for gamers, has announced its first new GPU architecture in three years, and it’s clearly designed to efficiently support the various computing needs of artificial intelligence and machine learning.

The architecture, called Ampere, and its first iteration, the A100 processor, supplant the performance of Nvidia’s current Volta architecture, whose V100 chip was in 94 of the top 500 supercomputers last November. The A100 has an incredible 54 billion transistors, 2.5 times as many as the V100.

[10 of the world's fastest supercomputers][1]

Tensor performance, so vital in AI and machine learning, has been significantly improved. FP16 floating point calculations are almost 2.5x as fast as V100 and Nvidia introduced a new math mode called [TF32][2]. Nvidia claims TF32 can provide up to 10-fold speedups compared to single-precision floating-point math on Volta GPUs.

This is significant because FP16 is useful for training, the compute-intensive part of machine learning, but overkill for inference, where the trained models are used to infer an outcome or result. So Nvidia added INT8 and INT4 to the A100 chip to handle the simpler inference part, and draw less power in the process. This means best performance cases for both training and inference from a single chip.

Memory performance is also significantly improved thanks to 40GB of HBM2 memory on the die delivering a total of 1.6TB/second of bandwidth. And from the looks of the A100 die, Nvidia did what Fujitsu has done with its [A64FX processor][3] and put the HBM2 right next to the processor.

The A100 also sports a new feature called Multi-Instance GPU (MIG), where a single A100 can be partitioned into up to seven virtual GPUs, each of which gets its own dedicated allocation of cores, L2 cache, and memory controllers. Think of it as virtualization for a GPU.

Finally, Ampere comes with a new version of Nvidia’s high-speed interconnect, NVLink. The third generation of NVLink nearly doubles the signaling rate for NVLink from 25.78Gbps on NVLink 2 to 50Gbps on NVLink 3. Nvidia has also cut the number of lanes needed by half to achieve the same speed. This in turn allows it to double the amount of throughput through the same number of lanes.

Nvidia CEO Jensen Huang made the Ampere announcement via video from his kitchen during the virtual GPU Technology Conference (GTC).

### New cards and Servers are ready

Nvidia is wasting no time bringing the A100 to market. It says the A100 is in production and announced the DGX A100 system. The box comes with eight A100 accelerators, as well as 15 TB of storage, a pair of AMD Epyc 7742 CPUs with 64 cores each (you didn’t think they were going to use Intel processors, did you?), 1TB of RAM, and HDR InfiniBand Mellanox controllers.

The DGX A100 will set you back $199,000 but it also packs 5 petaflops in a box the size of a small refrigerator, all dedicated to AI and machine learning.

Also, Nvidia’s $7 billion [merger with Mellanox][4] is already bearing fruit in the form of the EGX A100 card, a combination of an A100 Ampere-based GPU package along with a [Mellanox ConnectX-6 Dx][5] NIC on one card.

That provides the A100 with 200Gbps of networking without requiring any CPU processing and will allow A100 GPUs to talk directly rather than go through the CPU. All of this means greater speed since GPU-to-CPU communication adds steps and thus latency. The card can also connect to either Infiniband or Ethernet fabrics. GPU-to-GPU communication over Infiniband means HPC is about to see a major jump in performance.

Join the Network World communities on [Facebook][6] and [LinkedIn][7] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3543958/nvidia-unleashes-new-generation-of-gpu-hardware.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3236875/embargo-10-of-the-worlds-fastest-supercomputers.html
[2]: https://blogs.nvidia.com/blog/2020/05/14/tensorfloat-32-precision-format/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+nvidiablog+%28The+NVIDIA+Blog%29
[3]: https://www.networkworld.com/article/3535812/can-fujitsu-beat-nvidia-in-the-hpc-race.html
[4]: https://www.networkworld.com/article/3356444/nvidia-grabs-mellanox-out-from-under-intels-nose.html
[5]: https://www.networkworld.com/article/3433924/mellanox-introduces-smartnics-to-eliminate-network-load-on-cpus.html
[6]: https://www.facebook.com/NetworkWorld/
[7]: https://www.linkedin.com/company/network-world
