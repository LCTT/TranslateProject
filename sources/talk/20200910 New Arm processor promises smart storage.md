[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (New Arm processor promises smart storage)
[#]: via: (https://www.networkworld.com/article/3574087/new-arm-processor-promises-smart-storage.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

New Arm processor promises smart storage
======
Arm's Cortex-R82 can do both storage and data processing at the same time.
monsitj / Getty Images

Arm Ltd. last week announced the Cortex-R82, a chip that is both storage and data processing-capable, which could enable a whole new generation of storage devices that help process the data they store.

Storage processor chips, such as those made by Marvell but also storage device makers like EMC, handle the I/O and disk management, but if you want to process the data, that job falls to the CPU. This means data has to be moved in and out of the drive to be processed, a job that falls to two separate devices.

But there is an emerging hardware category known as computational storage where the processing is done where the data resides, rather than moving it into memory. Data is processed through various methods, like indexing and schema, eliminating the latency of data movement and freeing up the CPU. Obviously this can only be done on SSDs.

Arm has made similar chips in the past, the R5 and R8 lines, but they were 32-bit processors and thus limited to 4GB of memory. The R82 is the first 64-bit processor and thus able to access a much larger memory space. In this case, the R82 can access 1TB of memory.

Arm does not make chips; it makes designs that licensees develop into chips. It says the Cortex-R82 may be implemented with up to eight processing cores. More significant is chip coherency so the cores all see the same memory. Arm says the R82 offers as much as twice the performance of its previous R8 product.

The R82 also supports machine learning models with Arm’s Neon machine learning technology, an advanced Single Instruction Multiple Data (SIMD) architecture extension that can accelerate signal-processing algorithms and functions to speed up applications, such as machine learning. Arm claims Neon speeds up neural network performance by up to 14 times compared with the previous-generation R8.

This is a pretty big deal. The optional Memory Management Unit (MMU) enables rich OSes, such as Linux, to run on the chip separately from the main OS. So a storage array can have its own multicore processor, memory space, and OS to perform both storage processing and data processing completely independent of the main system. So you have two operating environments on the chip and can allocate cores to both tasks.

This particularly important for machine learning because the size of data sets are increasing at an astonishing rate, so as that data is stored as well as processed in can overwhelm the main processors. The fewer calls made to main memory and the CPU or GPU the better.

The R82 is not doing speculative execution, so it’s not processing on par with a Xeon or Ampere. But it can do real-time processing that could be really good for cleaning up data sets, to help process raw data and offload initial data processing so the CPU is only doing workloads on relevant info.

Arm has not said when the Cortex-R82 will be available.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3574087/new-arm-processor-promises-smart-storage.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
