[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Nvidia launches edge computing platform for AI processing)
[#]: via: (https://www.networkworld.com/article/3397841/nvidia-launches-edge-computing-platform-for-ai-processing.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

Nvidia launches edge computing platform for AI processing
======
EGX platform goes to the edge to do as much processing there as possible before sending data upstream to major data centers.
![Leo Wolfert / Getty Images][1]

Nvidia is launching a new platform called EGX Platform designed to bring real-time artificial intelligence (AI) to edge networks. The idea is to put AI computing closer to where sensors collect data before it is sent to larger data centers.

The edge serves as a buffer to data sent to data centers. It whittles down the data collected and only sends what is relevant up to major data centers for processing. This can mean discarding more than 90% of data collected, but the trick is knowing which data to keep and which to discard.

“AI is required in this data-driven world,” said Justin Boitano, senior director for enterprise and edge computing at Nvidia, on a press call last Friday. “We analyze data near the source, capture anomalies and report anomalies back to the mothership for analysis.”

**[ Now read[20 hot jobs ambitious IT pros should shoot for][2]. ]**

Boitano said we are hitting crossover where there is more compute at edge than cloud because more work needs to be done there.

EGX comes from 14 server vendors in a range of form factors, combining AI with network, security and storage from Mellanox. Boitano said that the racks will fit in any industry-standard rack, so they will fit into edge containers from the likes of Vapor IO and Schneider Electric.

EGX uses Nvidia’s low-power Jetson Nano processor, but also all the way up to Nvidia T4 processors that can deliver more than 10,000 trillion operations per second (TOPS) for real-time speech recognition and other real-time AI tasks.

Nvdia is working on software stack called Nvidia Edge Stack that can be updated constantly, and the software runs in containers, so no reboots are required, just a restart of the container. EGX runs enterprise-grade Kubernetes container platforms like Red Hat Openshift.

Edge Stack is optimized software that includes Nvidia drivers, a CUDA Kubernetes plugin, a CUDA container runtime, CUDA-X libraries and containerized AI frameworks and applications, including TensorRT, TensorRT Inference Server and DeepStream.

The company is boasting more than 40 early adopters, including BMW Group Logistics, which uses EGX and its own Isaac robotic platforms to handle increasingly complex logistics with real-time efficiency.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3397841/nvidia-launches-edge-computing-platform-for-ai-processing.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/industry_4-0_industrial_iot_smart_factory_by_leowolfert_gettyimages-689799380_2400x1600-100788464-large.jpg
[2]: https://www.networkworld.com/article/3276025/careers/20-hot-jobs-ambitious-it-pros-should-shoot-for.html
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
