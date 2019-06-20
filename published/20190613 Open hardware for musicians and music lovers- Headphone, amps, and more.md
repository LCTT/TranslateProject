[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10998-1.html)
[#]: subject: (Open hardware for musicians and music lovers: Headphone, amps, and more)
[#]: via: (https://opensource.com/article/19/6/hardware-music)
[#]: author: (Michael Weinberg https://opensource.com/users/mweinberg)

音乐家和音乐爱好者的开放硬件：耳机、放大器等
======

> 从 3D 打印乐器到无线播放声音的设备，有很多通过开放硬件项目来奏乐的方法。

![][1]

这个世界到处都是很棒的[开源音乐播放器][2]，但为什么只是将开源用在播放音乐上呢？你还可以使用开源硬件奏乐。本文中描述的所有工具都是经过了[开源硬件协会][3]（OSHWA）认证的。这意味着你可以自由地构建它们，重新组合它们，或者用它们做任何其他事情。

### 开源乐器

当你想奏乐时使用乐器总是最好的方式之一。如果你喜欢传统的的乐器，那么 [F-F-Fiddle][4] 可能适合你。

![F-f-fiddle][5]

F-F-Fiddle 是一款全尺寸电子小提琴，你可以使用标准的桌面 3D 打印机制作（采用[熔丝制造][6]）。如果你想眼见为真，那么这里有一个 F-F-Fiddle 的视频： https://img.linux.net.cn/static/video/The%20F-F-Fiddle-8NDWVcJJS2Y.mp4

如果你精通小提琴，但还对一些更具异国情调的东西感兴趣？<ruby>[开源的特雷门琴][7]<rt>Open Theremin</rt></ruby>怎么样？

![Open Theremin][8]

与所有特雷门琴一样，开源特雷门琴可让你在不触碰乐器的情况下播放音乐。当然，它特别擅长为你的下一个科幻视频或空间主题派对制作[令人毛骨悚然的空间声音][9]。

[Waft][10] 的操作类似，也可以远程控制声音。它使用[激光雷达][11]来测量手与传感器的距离。看看这个： https://img.linux.net.cn/static/video/Waft%20Prototype%2012-Feb-2017-203705197.mp4

Waft 是特雷门琴吗？我不确定算不算，特雷门琴高手可以在下面的评论里发表一下看法。

如果特雷门琴对你来说太熟悉了，[SIGNUM][12] 可能就是你想要的。用其开发人员的话说，SIGNUM 通过将不可见的无线通信转换为可听信号来“揭示加密的信息代码和人/机通信的语言”。

![SIGNUM][13]

这是演示： https://img.linux.net.cn/static/video/SIGNUM_Portable%20Analog%20Instrumentation%20Amplifier-142831757.mp4

### 输入

无论你使用什么乐器，都需要将其接到某些东西上。如果你想要连接到树莓派，请尝试 [AudioSense-Pi][14]，它允许你一次将多个输入和输出连接到你的树莓派。

![AudioSense-Pi][15]

### 合成器

合成器怎么样？SparkFun 的 [SparkPunk Sound Kit][16] 是一个简单的合成器，为你提供了很多音色。

![SparkFun SparkPunk Sound Kit][17]

### 耳机

制作所有这些音乐很棒，但你还需要考虑如何听它。幸运的是，[EQ-1耳机][18]是开源，支持 3D 打印。

![EQ-1 headphones][19]

你用开源硬件制作音乐吗？让我们在评论中知道！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/hardware-music

作者：[Michael Weinberg][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mweinberg
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/LIFE_musicinfinity.png?itok=7LkfjcS9
[2]: https://opensource.com/article/19/2/audio-players-linux
[3]: https://certification.oshwa.org/
[4]: https://certification.oshwa.org/us000010.html
[5]: https://opensource.com/sites/default/files/uploads/f-f-fiddle.png (F-f-fiddle)
[6]: https://en.wikipedia.org/wiki/Fused_filament_fabrication
[7]: https://certification.oshwa.org/ch000001.html
[8]: https://opensource.com/sites/default/files/uploads/open-theremin.png (Open Theremin)
[9]: https://youtu.be/p05ZSHRYXVA?t=771
[10]: https://certification.oshwa.org/uk000005.html
[11]: https://en.wikipedia.org/wiki/Lidar
[12]: https://certification.oshwa.org/es000003.html
[13]: https://opensource.com/sites/default/files/uploads/signum.png (SIGNUM)
[14]: https://certification.oshwa.org/in000007.html
[15]: https://opensource.com/sites/default/files/uploads/audiosense-pi.png (AudioSense-Pi)
[16]: https://certification.oshwa.org/us000016.html
[17]: https://opensource.com/sites/default/files/uploads/sparkpunksoundkit.png (SparkFun SparkPunk Sound Kit)
[18]: https://certification.oshwa.org/us000038.html
[19]: https://opensource.com/sites/default/files/uploads/eq-1-headphones.png (EQ-1 headphones)
