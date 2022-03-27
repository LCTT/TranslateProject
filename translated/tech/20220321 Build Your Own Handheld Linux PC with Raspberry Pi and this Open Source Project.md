[#]: subject: "Build Your Own Handheld Linux PC with Raspberry Pi and this Open Source Project"
[#]: via: "https://news.itsfoss.com/penkesu-handheld-linux-pc/"
[#]: author: "John Paul https://news.itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

用树莓派和这个开源项目打造你自己的手持 Linux 电脑
======

你是否曾希望有一台适合你手持的、带有键盘的 Linux 笔记本电脑？如果你说有，那么你就很幸运了。一位硬件设计师创造了这样一个设备，并将其设计开源，这样任何人都可以在家里制作它。

### 它是什么？

![][1]

Penkēsu 电脑（Penkēsu 是日语中铅笔盒的意思）是由 [Penk Chen][2] 设计。如果这个名字听起来很熟悉，他就是 [CutiePi][3] 背后的设计师。

根据该网站，Penk创建这个项目是因为：

> 自从 CutiePi 平板电脑成功获得资金并开始发货后，我觉得有必要从事一个新的项目，一个我不需要太担心商业可行性的项目，并提醒自己为什么开始修补。可以说是一个“反弹”项目。

他还说，他目前没有任何大规模生产 Penkēsu 的计划，所以他把计划开源了。“我想公布所有的设计和计划，这样就有足够的信息给任何有兴趣制作的人。”

### 零件

![][1]

Penk 围绕一个 7.9 英寸的触摸屏和一个定制键盘设计了 Penkēsu。内部结构由树莓派 Zero 2 W 和 Li-Po 电池供电。树莓派 Zero 2 W 有一个 1GHz 的 ARM 四核 ARM Cortex-A53 处理器和 512MB 的内存。花 15 美元，应该可以运行大多数为 Pi 设计的 Linux 发行版。

有趣的是，Penk 说，“我的 3D 打印机不够精确，无法打印出一个功能齐全的铰链锁”。因此，他决定使用来自 Game Boy Advance SP 的替换铰链。

看起来最困难的部分是键盘，这涉及到一个定制的 PCB。Penk 确实注意到，“如果希望使用其他 40% 的键盘来制作，可以通过编辑 CAD 文件和调整机箱中的隔间大小来完成”。

以下是所需零件的完整清单：

* 显示器
* Waveshare 7.9 英寸电容式触摸屏
* Adafruit DIY HDMI 电缆部件 - 直角适配器，迷你 HDMI 适配器和 20 厘米带状电缆
* 外壳
* Game Boy Advance SP 替代铰链
* 3D 打印部件（STL 文件和 STEP 文件）
* 电子产品
* 树莓派 Zero 2 W
* 3.7V 606090（或类似尺寸）Li-Po 电池
* Adafruit PowerBoost 1000C
* 键盘
* Kailh Low Profile Choc V1 开关 x 48
* MBK Choc Low Profile 键帽 x 48
* 1N4148 二极管 x 48
* Arduino Pro Micro x 1
* PCB x 1 (gerber 文件和 QMK 固件)



详见[网站][4]的完整细节。

你用树莓派做了什么项目？请在下面的评论中分享。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/penkesu-handheld-linux-pc/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU4NSIgd2lkdGg9Ijc4MCIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB2ZXJzaW9uPSIxLjEiLz4=
[2]: https://github.com/penk
[3]: https://itsfoss.com/cutiepi-open-source-tab/
[4]: http://penkesu.computer/