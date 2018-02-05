运行在树莓派和 Arduino 上的开源社交机器人套件
============

![](http://linuxgizmos.com/files/thecorpora_qboone-thm.jpg)

*Thecorpora 的发布的 “Q.bo One” 机器人基于 RPi 3 和 Arduino，并提供立体相机、麦克风、扬声器，以及视觉和语言识别。*

2010 年，作为一个开源概念验证和用于探索 AI 在多传感器、交互式机器人的能力的研究项目，机器人开发商 Francisco Paz 及它在巴塞罗那的 Thecorpora 公司推出了首款 [Qbo][6] “Cue-be-oh” 机器人。在今年 2 月移动世界大会上的预览之后，Thecorpora 把它放到了 Indiegogo 上，与 Arrow 合作推出了第一个批量生产的社交机器人版本。

[![](http://linuxgizmos.com/files/thecorpora_qboone-sm.jpg)][7]   

*Q.bo One 的左侧*

[![](http://linuxgizmos.com/files/thecorpora_qboone2-sm.jpg)][8] 

*Q.bo One 的顶部*

像原来一样，新的 Q.bo One 有一个带眼睛的球形头（双立体相机）、耳朵（3 个麦克风）和嘴（扬声器），并由 WiFi 和蓝牙控制。 Q.bo One 也同样采用开源 Linux 软件和开放规格硬件。然而，它不是使用基于 Intel Atom 的 Mini-ITX 板，而是在与 Arduino 兼容的主板相连的 Raspberry Pi 3 上运行 Raspbian。

[![](http://linuxgizmos.com/files/thecorpora_qboone_side-sm.jpg)][9] 

*Q.bo One 侧视图**

Q.bo One 于 7 月中旬在 Indiegogo 上架，起价为 369 美元（早期买家）或 399 美元，有包括内置的树莓派 3 和基于 Arduino 的 “Qboard” 控制器板。它还有售价 $499 的完整套装。目前，Indiegogo 上的众筹目标是 $100,000，现在大概达成了 15%，并且它 12 月出货。

更专业的机器人工程师和嵌入式开发人员可能会想要使用价值 $99 的只有树莓派和 Qboard PCB 和软件的版本，或者提供没有电路板的机器人套件的 $249 版本。使用此版本，你可以用自己的 Arduino 控制器替换 Qboard，并将树莓派 3 替换为另一个 Linux SBC。该公司列出了 Banana Pi、BeagleBone、Tinker Board 以及[即将退市的 Intel Edison][10]，作为兼容替代品的示例。

[![](http://linuxgizmos.com/files/thecorpora_qboone_kit-sm.jpg)][11] 

*Q.bo One 套件*

与 2010 年的 Qbo 不同，Q.bo One 除了球面头部之外无法移动，它可以在双重伺服系统的帮助下在底座上旋转，以便跟踪声音和动作。Robotis Dynamixel 舵机同样开源，树莓派基于 [TurtleBot 3][23] 机器人工具包，除了左右之外，还可以上下移动。

[![](http://linuxgizmos.com/files/thecorpora_qboone_detail-sm.jpg)][12]   

*Q.bo One 细节*

[![](http://linuxgizmos.com/files/thecorpora_qboone_qboard-sm.jpg)][13] 

*Qboard 细节*

Q.bo One 类似于基于 Linux 的 [Jibo][24] “社交机器人”，它于 2014 年在 Indiegogo 众筹，最后达到 360 万美元。然而，Jibo 还没有出货，[最近的推迟][25]迫使它在今年的某个时候发布一个版本。

![](http://linuxgizmos.com/files/thecorpora_qboone_mouth.jpg)

*Q.bo One*

我们大胆预测 Q.bo One 将会在 2017 年接近 12 月出货。核心技术和 AI 软件已被证明，而树莓派和 Arduino 技术也是如此。Qboard 主板已经由 Arrow 制造和认证。 

开源设计表明，即使是移动版本也不会有问题。这使它更像是滚动的人形生物 [Pepper][14]，这是一个来自 Softbank 和 Aldeberan 类似的人工智能对话机器人。

Q.bo One 自原始版以来添加了一些技巧，例如由 20 个 LED 组成的“嘴巴”， 它以不同的、可编程的方式在语音中模仿嘴唇开合。如果你想点击机器人获得关注，那么它的头上还有三个触摸传感器。但是，你其实只需要说话就行，而 Q.bo One 会像一个可卡犬一样转身并凝视着你。

接口和你在树莓派 3 上的一样，它在我们的 [2017 黑客电路板调查][15]中消灭了其他对手。为树莓派 3 的 WiFi 和蓝牙安装了天线。

[![](http://linuxgizmos.com/files/thecorpora_qboone_arch-sm.jpg)][16]   

*Q.bo One 软件架构*

[![](http://linuxgizmos.com/files/thecorpora_qboone_scratch-sm.jpg)][17] 

*Q.bo One 及 Scratch 编程*

Qboard（也称为 Q.board）在 Atmel ATSAMD21 MCU 上运行 Arduino 代码，并有三个麦克风、扬声器、触摸传感器、Dynamixel 控制器和用于嘴巴的 LED 矩阵。其他功能包括 GPIO、I2C接口和可连接到台式机的 micro-USB 口。

Q.bo One 可以识别脸部和追踪移动，机器人甚至可以在镜子中识别自己。在云连接的帮助下，机器人可以识别并与其他 Q.bo One 机器人交谈。机器人可以在自然语言处理的帮助下回答问题，并通过文字转语音朗读。

可以使用 Scratch 编程，它是机器人的主要功能，可以教孩子关于机器人和编程。机器人也是为教育者和制造者设计的，可以作为老年人的伴侣。

基于 Raspbian 的软件使用 OpenCV 进行视觉处理，并可以使用各种语言（包括 C++）进行编程。该软件还提供了 IBM Bluemix、NodeRED 和 ROS 的钩子。大概你也可以整合 [Alexa][18] 或 [Google Assistant][19]语音代理，虽然 Thecorpora 没有提及这一点。


**更多信息**

Q.bo One 在 7 月中旬在 Indiegogo 上架，起价为完整套件  $369 和完整组合  $499 。出货预计在 2017 年 12 月。更多信息请参见 [Q.bo One 的 Indiegogo 页面][20] 和[Thecorpora 网站][21]。

--------------------------------------------------------------------------------

via: http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/

作者：[Eric Brown][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/
[1]:http://twitter.com/share?url=http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/&text=Open+source+social+robot+kit+runs+on+Raspberry+Pi+and+Arduino+
[2]:https://plus.google.com/share?url=http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/
[3]:http://www.facebook.com/sharer.php?u=http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/
[4]:http://www.linkedin.com/shareArticle?mini=true&url=http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/
[5]:http://reddit.com/submit?url=http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/&title=Open%20source%20social%20robot%20kit%20runs%20on%20Raspberry%20Pi%20and%20Arduino
[6]:http://linuxdevices.linuxgizmos.com/open-source-robot-is-all-eyes/
[7]:http://linuxgizmos.com/files/thecorpora_qboone.jpg
[8]:http://linuxgizmos.com/files/thecorpora_qboone2.jpg
[9]:http://linuxgizmos.com/files/thecorpora_qboone_side.jpg
[10]:http://linuxgizmos.com/intel-pulls-the-plug-on-its-joule-edison-and-galileo-boards/
[11]:http://linuxgizmos.com/files/thecorpora_qboone_kit.jpg
[12]:http://linuxgizmos.com/files/thecorpora_qboone_detail.jpg
[13]:http://linuxgizmos.com/files/thecorpora_qboone_qboard.jpg
[14]:http://linuxgizmos.com/worlds-first-emotional-robot-runs-linux/
[15]:http://linuxgizmos.com/2017-hacker-board-survey-raspberry-pi-still-rules-but-x86-sbcs-make-gains/
[16]:http://linuxgizmos.com/files/thecorpora_qboone_arch.jpg
[17]:http://linuxgizmos.com/files/thecorpora_qboone_scratch.jpg
[18]:http://linuxgizmos.com/how-to-add-alexa-to-your-raspberry-pi-3-gizmo/
[19]:http://linuxgizmos.com/free-raspberry-pi-voice-kit-taps-google-assistant-sdk/
[20]:https://www.indiegogo.com/projects/q-bo-one-an-open-source-robot-for-everyone#/
[21]:http://thecorpora.com/
[22]:http://linuxgizmos.com/open-source-social-robot-kit-runs-on-raspberry-pi-and-arduino/
[23]:http://linuxgizmos.com/ubuntu-driven-turtlebot-gets-a-major-rev-with-a-pi-or-joule-in-the-drivers-seat/
[24]:http://linuxgizmos.com/cheery-social-robot-owes-it-all-to-its-inner-linux/
[25]:https://www.slashgear.com/jibo-delayed-to-2017-as-social-robot-hits-more-hurdles-20464725/
