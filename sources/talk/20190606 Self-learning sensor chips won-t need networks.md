[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Self-learning sensor chips won’t need networks)
[#]: via: (https://www.networkworld.com/article/3400659/self-learning-sensor-chips-wont-need-networks.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

Self-learning sensor chips won’t need networks
======
Scientists working on new, machine-learning networks aim to embed everything needed for artificial intelligence (AI) onto a processor, eliminating the need to transfer data to the cloud or computers.
![Jiraroj Praditcharoenkul / Getty Images][1]

Tiny, intelligent microelectronics should be used to perform as much sensor processing as possible on-chip rather than wasting resources by sending often un-needed, duplicated raw data to the cloud or computers. So say scientists behind new, machine-learning networks that aim to embed everything needed for artificial intelligence (AI) onto a processor.

“This opens the door for many new applications, starting from real-time evaluation of sensor data,” says [Fraunhofer Institute for Microelectronic Circuits and Systems][2] on its website. No delays sending unnecessary data onwards, along with speedy processing, means theoretically there is zero latency.

Plus, on-microprocessor, self-learning means the embedded, or sensor, devices can self-calibrate. They can even be “completely reconfigured to perform a totally different task afterwards,” the institute says. “An embedded system with different tasks is possible.”

**[ Also read:[What is edge computing?][3] and [How edge networking and IoT will reshape data centers][4] ]**

Much internet of things (IoT) data sent through networks is redundant and wastes resources: a temperature reading taken every 10 minutes, say, when the ambient temperature hasn’t changed, is one example. In fact, one only needs to know when the temperature has changed, and maybe then only when thresholds have been met.

### Neural network-on-sensor chip

The commercial German research organization says it’s developing a specific RISC-V microprocessor with a special hardware accelerator designed for a [brain-copying, artificial neural network (ANN) it has developed][5]. The architecture could ultimately be suitable for the condition-monitoring or predictive sensors of the kind we will likely see more of in the industrial internet of things (IIoT).

Key to Fraunhofer IMS’s [Artificial Intelligence for Embedded Systems (AIfES)][6] is that the self-learning takes place at chip level rather than in the cloud or on a computer, and that it is independent of “connectivity towards a cloud or a powerful and resource-hungry processing entity.” But it still offers a “full AI mechanism, like independent learning,”

It’s “decentralized AI,” says Fraunhofer IMS. "It’s not focused towards big-data processing.”

Indeed, with these kinds of systems, no connection is actually required for the raw data, just for the post-analytical results, if indeed needed. Swarming can even replace that. Swarming lets sensors talk to one another, sharing relevant information without even getting a host network involved.

“It is possible to build a network from small and adaptive systems that share tasks among themselves,” Fraunhofer IMS says.

Other benefits in decentralized neural networks include that they can be more secure than the cloud. Because all processing takes place on the microprocessor, “no sensitive data needs to be transferred,” Fraunhofer IMS explains.

### Other edge computing research

The Fraunhofer researchers aren’t the only academics who believe entire networks become redundant with neuristor, brain-like AI chips. Binghamton University and Georgia Tech are working together on similar edge-oriented tech.

“The idea is we want to have these chips that can do all the functioning in the chip, rather than messages back and forth with some sort of large server,” Binghamton said on its website when [I wrote about the university's work last year][7].

One of the advantages of no major communications linking: Not only don't you have to worry about internet resilience, but also that energy is saved creating the link. Energy efficiency is an ambition in the sensor world — replacing batteries is time consuming, expensive, and sometimes, in the case of remote locations, extremely difficult.

Memory or storage for swaths of raw data awaiting transfer to be processed at a data center, or similar, doesn’t have to be provided either — it’s been processed at the source, so it can be discarded.

**More about edge networking:**

  * [How edge networking and IoT will reshape data centers][4]
  * [Edge computing best practices][8]
  * [How edge computing can help secure the IoT][9]



Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3400659/self-learning-sensor-chips-wont-need-networks.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/02/industry_4-0_industrial_iot_smart_factory_automation_by_jiraroj_praditcharoenkul_gettyimages-902668940_2400x1600-100788458-large.jpg
[2]: https://www.ims.fraunhofer.de/en.html
[3]: https://www.networkworld.com/article/3224893/internet-of-things/what-is-edge-computing-and-how-it-s-changing-the-network.html
[4]: https://www.networkworld.com/article/3291790/data-center/how-edge-networking-and-iot-will-reshape-data-centers.html
[5]: https://www.ims.fraunhofer.de/en/Business_Units_and_Core_Competencies/Electronic_Assistance_Systems/News/AIfES-Artificial_Intelligence_for_Embedded_Systems.html
[6]: https://www.ims.fraunhofer.de/en/Business_Units_and_Core_Competencies/Electronic_Assistance_Systems/technologies/Artificial-Intelligence-for-Embedded-Systems-AIfES.html
[7]: https://www.networkworld.com/article/3326557/edge-chips-could-render-some-networks-useless.html
[8]: https://www.networkworld.com/article/3331978/lan-wan/edge-computing-best-practices.html
[9]: https://www.networkworld.com/article/3331905/internet-of-things/how-edge-computing-can-help-secure-the-iot.html
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
