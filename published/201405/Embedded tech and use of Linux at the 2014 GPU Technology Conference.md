2014 GPU技术大会上关于Linux的嵌入式技术和应用
================================================================================
![Image by opensource.com](http://opensource.com/sites/default/files/imagecache/image-full-size/images/life-uploads/gputechcon2.jpg)

今年我第一次参加了在加利福尼亚圣琼斯举办的[GPU技术大会][1]（就在[游戏开发者大会][2]之后的星期里）。在这次由NVIDIA主办的会议上，广泛讨论了包括自动化，动画，游戏，科研，云，系统集成，和新兴公司在内的各个领域的主题。活动议程主要由三大部分组成，500场技术会议，实地编程场所和展示，以及一个展示大厅可以让参与者展示他们最新的工作成果。

![](http://opensource.com/sites/default/files/resize/images/life-uploads/gputechconf1-520x385.jpg)

第一个活动在第二天，由NVIDIA CEO黄仁勋带来的演讲。他公布了应用于公司的下一代GPGPU产品的全新架构[Pascal][3]，以及被称为世界上第一台嵌入式超级电脑的[Jetson TK1][4]。Pascal将应用在下一代超级电脑或者工作站上，而Jetson主要针对嵌入式市场，这两个都普遍使用了Linux。活动中还展示了奥迪的应用了Jetson架构的无人驾驶汽车，最后以每位参与者都获赠一部应用了Android系统的NVIDIA Shield的通知结束。

![](http://opensource.com/sites/default/files/resize/images/life-uploads/jetson-350x466.jpg)

第二个活动重点是Pixar的实时渲染现场演示，展示了动画设计师们如何受益于最新的GPU技术，而更有效地在最终渲染之前获取反馈。最后的活动由Adam Gazzaley博士主持，来自加州大学三藩分校的神经学科学家，他在研究应用视频游戏来帮助增强认知。活动现场展示了使用Occulus Rift游戏头盔做的虚拟现实技术，实时电子测量/反馈数据到游戏中。

![](http://opensource.com/sites/default/files/resize/images/life-uploads/pixartech2-520x390.jpg)

我参加这次大会的主要原因之一是想更多地了解一下目前可视化领域的最新开发情况，活动中有很多会议关注这个领域以及GPGPU协同运算和可视化实时反馈。越来越多的超级电脑也开始应用GPGPU加速，例如橡树岭国家实验室的Titan。大部分会议由NVIDIA工程师和开发者主持，不过也有许多会议由研究实际问题的科学家带来（相对于渲染/可视化，大部分关注在GPGPU）。还有一场海报会议，展示大范围的各种应用，还提供了和开发之直接对话的机会。许多项目都是开源的，扩展应用了许多我们熟悉的库。

很明显OpenGL在这个领域很活跃，有大量令人激动的开发。有意思的是，它们之中大多数借助了游戏产业的持续增长，因为需要移植到新的基于Linux的平台比如[SteamOS][5]。在OpenGL未来会议上展示了运行在Jetson平台的现场演示，而且在之前游戏开发者大会上的[实现零驱动开销][6]的演讲在本次大会中被大量引用。一些二进制驱动的改善被提到，用来更好地支持采用nVidia的Optix平台的场景图形和实时光线跟踪技术，通过大会的一个获奖作品[HIV壳体展示][7]，展示了GPU技术在科研领域带来的促进作用。

--------------------------------------------------------------------------------

via: http://opensource.com/life/14/4/gpu-technology-conference-2014

译者：[zpl1025](https://github.com/zpl1025) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.gputechconf.com/
[2]:http://www.gdconf.com/
[3]:http://blogs.nvidia.com/blog/2014/03/25/gpu-roadmap-pascal/
[4]:http://www.nvidia.com/object/jetson-tk1-embedded-dev-kit.html
[5]:http://steamcommunity.com/linux
[6]:http://www.slideshare.net/CassEveritt/approaching-zero-driver-overhead
[7]:http://blogs.nvidia.com/blog/2014/03/27/researchers-win-third-annual-cuda-achievement-award-three-new-cuda-fellows-named/
