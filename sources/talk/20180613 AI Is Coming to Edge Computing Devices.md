AI Is Coming to Edge Computing Devices
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/ai-edge.jpg?itok=nuNfRbW8)

Very few non-server systems run software that could be called machine learning (ML) and artificial intelligence (AI). Yet, server-class “AI on the Edge” applications are coming to embedded devices, and Arm intends to fight with Intel and AMD over every last one of them.

Arm recently [announced][1] a new [Cortex-A76][2] architecture that is claimed to boost the processing of AI and ML algorithms on edge computing devices by a factor of four. This does not include ML performance gains promised by the new Mali-G76 GPU. There’s also a Mali-V76 VPU designed for high-res video. The Cortex-A76 and two Mali designs are designed to “complement” Arm’s Project Trillium Machine Learning processors (see below).

### Improved performance

The Cortex-A76 differs from the [Cortex-A73][3] and [Cortex-A75][4] IP designs in that it’s designed as much for laptops as for smartphones and high-end embedded devices. Cortex-A76 provides “35 percent more performance year-over-year,” compared to Cortex-A75, claims Arm. The IP, which is expected to arrive in products a year from now, is also said to provide 40 percent improved efficiency.

Like Cortex-A75, which is equivalent to the latest Kyro cores available on Qualcomm’s [Snapdragon 845][5], the Cortex-A76 supports [DynamIQ][6], Arm’s more flexible version of its Big.Little multi-core scheme. Unlike Cortex-A75, which was announced with a Cortex-A55 companion chip, Arm had no new DynamIQ companion for the Cortex-A76.

Cortex-A76 enhancements are said to include decoupled branch prediction and instruction fetch, as well as Arm’s first 4-wide decode core, which boosts the maximum instruction per cycle capability. There’s also higher integer and vector execution throughput, including support for dual-issue native 16B (128-bit) vector and floating-point units. Finally, the new full-cache memory hierarchy is “co-optimized for latency and bandwidth,” says Arm.

Unlike the latest high-end Cortex-A releases, Cortex-A76 represents “a brand new microarchitecture,” says Arm. This is confirmed by [AnandTech’s][7] usual deep-dive analysis. Cortex-A73 and -A75 debuted elements of the new “Artemis” architecture, but the Cortex-A76 is built from scratch with Artemis.

The Cortex-A76 should arrive on 7nm-fabricated TSMC products running at 3GHz, says AnandTech. The 4x improvements in ML workloads are primarily due to new optimizations in the ASIMD pipelines “and how dot products are handled,” says the story.

Meanwhile, [The Register][8] noted that Cortex-A76 is Arm’s first design that will exclusively run 64-bit kernel-level code. The cores will support 32-bit code, but only at non-privileged levels, says the story..

### Mali-G76 GPU and Mali-G72 VPU

The new Mali-G76 GPU announced with Cortex-A76 targets gaming, VR, AR, and on-device ML. The Mali-G76 is said to provide 30 percent more efficiency and performance density and 1.5x improved performance for mobile gaming. The Bifrost architecture GPU also provides 2.7x ML performance improvements compared to the Mali-G72, which was announced last year with the Cortex-A75.

The Mali-V76 VPU supports UHD 8K viewing experiences. It’s aimed at 4x4 video walls, which are especially popular in China and is designed to support the 8K video coverage, which Japan is promising for the 2020 Olympics. 8K@60 streams require four times the bandwidth of 4K@60 streams. To achieve this, Arm added an extra AXI bus and doubled the line buffers throughout the video pipeline. The VPU also supports 8K@30 decode.

### Project Trillium’s ML chip detailed

Arm previously revealed other details about the [Machine Learning][9] (ML) processor, also referred to as MLP. The ML chip will accelerate AI applications including machine translation and face recognition.

The new processor architecture is part of the Project Trillium initiative for AI, and follows Arm’s second-gen Object Detection (OD) Processor for optimizing visual processing and people/object detection. The ML design will initially debut as a co-processor in mobile phones by late 2019.

Numerous block diagrams for the MLP were published by [AnandTech][10], which was briefed on the design. While stating that any judgment about the performance of the still unfinished ML IP will require next year’s silicon release, the publication says that the ML chip appears to check off all the requirements of a neural network accelerator, including providing efficient convolutional computations and data movement while also enabling sufficient programmability.

Arm claims the chips will provide >3TOPs per Watt performance in 7nm designs with absolute throughputs of 4.6TOPs, deriving a target power of approximately 1.5W. For programmability, MLP will initially target Android’s [Neural Networks API][11] and [Arm’s NN SDK][12].

Join us at [Open Source Summit + Embedded Linux Conference Europe][13] in Edinburgh, UK on October 22-24, 2018, for 100+ sessions on Linux, Cloud, Containers, AI, Community, and more.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/6/ai-coming-edge-computing-devices

作者：[Eric Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/ericstephenbrown
[1]:https://www.arm.com/news/2018/05/arm-announces-new-suite-of-ip-for-premium-mobile-experiences
[2]:https://community.arm.com/processors/b/blog/posts/cortex-a76-laptop-class-performance-with-mobile-efficiency
[3]:https://www.linux.com/news/mediateks-10nm-mobile-focused-soc-will-tap-cortex-a73-and-a32
[4]:http://linuxgizmos.com/arm-debuts-cortex-a75-and-cortex-a55-with-ai-in-mind/
[5]:http://linuxgizmos.com/hot-chips-on-parade-at-mwc-and-embedded-world/
[6]:http://linuxgizmos.com/arm-boosts-big-little-with-dynamiq-and-launches-linux-dev-kit/
[7]:https://www.anandtech.com/show/12785/arm-cortex-a76-cpu-unveiled-7nm-powerhouse
[8]:https://www.theregister.co.uk/2018/05/31/arm_cortex_a76/
[9]:https://developer.arm.com/products/processors/machine-learning/arm-ml-processor
[10]:https://www.anandtech.com/show/12791/arm-details-project-trillium-mlp-architecture
[11]:https://developer.android.com/ndk/guides/neuralnetworks/
[12]:https://developer.arm.com/products/processors/machine-learning/arm-nn
[13]:https://events.linuxfoundation.org/events/elc-openiot-europe-2018/
