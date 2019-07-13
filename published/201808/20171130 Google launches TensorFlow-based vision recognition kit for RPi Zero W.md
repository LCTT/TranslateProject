Google 为树莓派 Zero W 发布了基于TensorFlow 的视觉识别套件
===============

![](http://linuxgizmos.com/files/google_aiyvisionkit-thm.jpg)

Google 发行了一个 45 美元的 “AIY Vision Kit”，它是运行在树莓派 Zero W 上的基于 TensorFlow 的视觉识别开发套件，它使用了一个带 Movidius 芯片的 “VisionBonnet” 板。

为加速该设备上的神经网络，Google 的 AIY 视频套件继承了早期树莓派上运行的 [AIY 项目][7] 的语音/AI 套件，这个型号的树莓派随五月份的 MagPi 杂志一起赠送。与语音套件和老的 Google 硬纸板 VR 查看器一样，这个新的 AIY 视觉套件也使用一个硬纸板包装。这个套件和 [Cloud Vision API][8] 是不一样的，它使用了一个在 2015 年演示过的基于树莓派的 GoPiGo 机器人，它完全在本地的处理能力上运行，而不需要使用一个云端连接。这个 AIY 视觉套件现在可以 45 美元的价格去预订，将在 12 月份发货。

[![](http://linuxgizmos.com/files/google_aiyvisionkit-sm.jpg)][9]   [![](http://linuxgizmos.com/files/rpi_zerow-sm.jpg)][10] 

*AIY 视觉套件，完整包装（左）和树莓派 Zero W*

这个套件的主要处理部分除了所需要的 [树莓派 Zero W][21] 单片机之外 —— 一个基于 ARM11 的 1 GHz 的 Broadcom BCM2836 片上系统，另外的就是 Google 最新的 VisionBonnet RPi 附件板。这个 VisionBonnet pHAT 附件板使用了一个 Movidius MA2450，它是 [Movidius Myriad 2 VPU][22] 版的处理器。在 VisionBonnet 上，处理器为神经网络运行了 Google 的开源机器学习库 [TensorFlow][23]。因为这个芯片，使得视觉处理的速度最高达每秒 30 帧。

这个 AIY 视觉套件要求用户提供一个树莓派 Zero W、一个 [树莓派摄像机 v2][11]、以及一个 16GB 的 micro SD 卡，它用来下载基于 Linux 的 OS 镜像。这个套件包含了 VisionBonnet、一个 RGB 街机风格的按钮、一个压电扬声器、一个广角镜头套件、以及一个包裹它们的硬纸板。还有一些就是线缆、支架、安装螺母，以及连接部件。


 [![](http://linuxgizmos.com/files/google_aiyvisionkit_pieces-sm.jpg)][12]   [![](http://linuxgizmos.com/files/google_visionbonnet-sm.jpg)][13] 

*AIY 视觉套件组件（左）和 VisonBonnet 附件板*

有三个可用的神经网络模型。一个是通用的模型，它可以识别常见的 1000 个东西，一个是面部检测模型，它可以对 “快乐程度” 进行评分，从 “悲伤” 到 “大笑”，还有一个模型可以用来辨别图像内容是狗、猫、还是人。这个 1000 个图片模型源自 Google 的开源 [MobileNets][24]，它是基于 TensorFlow 家族的计算机视觉模型，它设计用于资源受限的移动或者嵌入式设备。

MobileNet 模型是低延时、低功耗，和参数化的，以满足资源受限的不同使用情景。Google 说，这个模型可以用于构建分类、检测、嵌入、以及分隔。在本月的早些时候，Google 发布了一个开发者预览版，它是一个对 Android 和 iOS 移动设备友好的 [TensorFlow Lite][14] 库，它与 MobileNets 和 Android 神经网络 API 是兼容的。

 [![](http://linuxgizmos.com/files/google_aiyvisionkit_assembly-sm.jpg)][15] 

*AIY 视觉套件包装图*

除了提供这三个模型之外，AIY 视觉套件还提供了基本的 TensorFlow 代码和一个编译器，因此用户可以去开发自己的模型。另外，Python 开发者可以写一些新软件去定制 RGB 按钮颜色、压电元素声音、以及在 VisionBonnet 上的 4x GPIO 针脚，它可以添加另外的指示灯、按钮、或者伺服机构。Potential 模型包括识别食物、基于可视化输入来打开一个狗门、当你的汽车偏离车道时发出文本信息、或者根据识别到的人的面部表情来播放特定的音乐。

 [![](http://linuxgizmos.com/files/movidius_myriad2vpu_block-sm.jpg)][16]   [![](http://linuxgizmos.com/files/movidius_myriad2_reference_board-sm.jpg)][17] 

*Myriad 2 VPU 结构图（左）和参考板*

Movidius Myriad 2 处理器在一个标称 1W 的功耗下提供每秒万亿次浮点运算的性能。在被 Intel 收购之前，这个芯片最早出现在 Tango 项目的参考平台上，并内置在 2016 年 5 月由 Movidius 首次亮相的、Ubuntu 驱动的 USB 的 [Fathom][25] 神经网络处理棒中。根据 Movidius 的说法，Myriad 2 目前已经在 “市场上数百万的设备上使用”。

**更多信息**

AIY 视觉套件可以在 Micro Center 上预订，价格为 $44.99，预计在（2017 年） 12 月初发货。更多信息请参考 AIY 视觉套件的 [公告][18]、[Google 博客][19]、以及 [Micro Center 购物页面][20]。

--------------------------------------------------------------------------------

via: http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/

作者：[Eric Brown][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
[1]:http://twitter.com/share?url=http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/&amp;text=Google%20launches%20TensorFlow-based%20vision%20recognition%20kit%20for%20RPi%20Zero%20W%20
[2]:https://plus.google.com/share?url=http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
[3]:http://www.facebook.com/sharer.php?u=http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
[4]:http://www.linkedin.com/shareArticle?mini=true&amp;url=http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
[5]:http://reddit.com/submit?url=http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/&amp;title=Google%20launches%20TensorFlow-based%20vision%20recognition%20kit%20for%20RPi%20Zero%20W
[6]:mailto:?subject=Google%20launches%20TensorFlow-based%20vision%20recognition%20kit%20for%20RPi%20Zero%20W&amp;body=%20http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
[7]:http://linuxgizmos.com/free-raspberry-pi-voice-kit-taps-google-assistant-sdk/
[8]:http://linuxgizmos.com/google-releases-cloud-vision-api-with-demo-for-pi-based-robot/
[9]:http://linuxgizmos.com/files/google_aiyvisionkit.jpg
[10]:http://linuxgizmos.com/files/rpi_zerow.jpg
[11]:http://linuxgizmos.com/raspberry-pi-cameras-jump-to-8mp-keep-25-dollar-price/
[12]:http://linuxgizmos.com/files/google_aiyvisionkit_pieces.jpg
[13]:http://linuxgizmos.com/files/google_visionbonnet.jpg
[14]:https://developers.googleblog.com/2017/11/announcing-tensorflow-lite.html
[15]:http://linuxgizmos.com/files/google_aiyvisionkit_assembly.jpg
[16]:http://linuxgizmos.com/files/movidius_myriad2vpu_block.jpg
[17]:http://linuxgizmos.com/files/movidius_myriad2_reference_board.jpg
[18]:https://blog.google/topics/machine-learning/introducing-aiy-vision-kit-make-devices-see/
[19]:https://developers.googleblog.com/2017/11/introducing-aiy-vision-kit-add-computer.html
[20]:http://www.microcenter.com/site/content/Google_AIY.aspx?ekw=aiy&amp;rd=1
[21]:http://linuxgizmos.com/raspberry-pi-zero-w-adds-wifi-and-bluetooth-for-only-5-more/
[22]:https://www.movidius.com/solutions/vision-processing-unit
[23]:https://www.tensorflow.org/
[24]:https://research.googleblog.com/2017/06/mobilenets-open-source-models-for.html
[25]:http://linuxgizmos.com/usb-stick-brings-neural-computing-functions-to-devices/
[26]:http://linuxgizmos.com/google-launches-tensorflow-based-vision-recognition-kit-for-rpi-zero-w/
