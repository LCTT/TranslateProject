[#]: subject: "Build Your Own Handheld Linux PC with Raspberry Pi and this Open Source Project"
[#]: via: "https://news.itsfoss.com/penkesu-handheld-linux-pc/"
[#]: author: "John Paul https://news.itsfoss.com/author/john/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14408-1.html"

用树莓派打造你的手持 Linux 电脑
======

> Penkesu 电脑：一个自制的复古式手持 Linux 电脑。

![](https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/03/penkesu-handheld-linux-pc.jpg?w=1200&ssl=1)

你是否曾希望有一台适合你手持的、带有键盘的 Linux 笔记本电脑？如果是这样，那么你幸运了。一位硬件设计师创造了这样一个设备，并将其设计开源，让任何人都可以在家里制作它。

### 它是什么？

![][1]

Penkēsu 电脑（Penkēsu 是日语中“铅笔盒”的意思）是由 [Penk Chen][2] 设计的。如果这个名字听起来很熟悉，他就是 [CutiePi][3] 背后的设计师。

根据该网站称，Penk 创建这个项目是因为：

> 自从 CutiePi 平板电脑成功获得了资金并开始发货后，我觉得有必要干一个新的项目，一个我不需要太担心商业可行性、并提醒自己做手工的初衷的项目。可以说，这是一个“反弹”项目。

他还说，他目前没有任何大规模生产 Penkēsu 的计划，所以他把该规划开源了。“我想公布所有的设计和规划，这样就可以给任何有兴趣制作一个的人足够的信息。”

### 零件

![][5]

Penk 围绕一个 7.9 英寸的触摸屏和一个定制键盘设计了 Penkēsu。内部结构由树莓派 Zero 2 W 和锂聚合物电池供电。树莓派 Zero 2 W 有一个 1GHz 的 ARM 四核 ARM Cortex-A53 处理器和 512MB 的内存。花上 15 美元，这块树莓派应该可以运行大多数为它设计的 Linux 发行版。

有趣的是，Penk 说，“我的 3D 打印机不够精确，无法打印出一个功能齐全的铰链锁”。因此，他决定使用来自任天堂 GBA SP 的替换铰链。

看起来最困难的部分是键盘，这涉及到一个定制的 PCB。Penk 确实注意到，“如果希望使用其他 40% 键盘来制作，可以通过编辑 CAD 文件和调整机箱中的隔间大小来完成”。

以下是所需零件的完整清单：

* 显示器
  * 微雪 7.9 英寸电容式触摸屏
  * Adafruit DIY HDMI 电缆部件 - 直角适配器、Mini-HDMI 适配器和 20 厘米带状电缆
* 外壳
  * GBA SP 替代铰链
  * 3D 打印部件（STL 文件和 STEP 文件）
* 电子产品
  * 树莓派 Zero 2 W
  * 3.7V 606090（或类似尺寸）锂聚合物电池
  * Adafruit PowerBoost 1000C
* 键盘
  * 凯华 Choc 矮轴 V1 x 48
  * MBK Choc 矮轴键帽 x 48
  * 1N4148 二极管 x 48
  * Arduino Pro Micro x 1
  * PCB x 1（gerber 文件和 QMK 固件）

详见 [网站][4] 的完整细节。

你用树莓派做了什么项目？请在下面的评论中分享。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/penkesu-handheld-linux-pc/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/03/penkesu.computer-31.jpg?w=1000&ssl=1
[2]: https://github.com/penk
[3]: https://itsfoss.com/cutiepi-open-source-tab/
[4]: http://penkesu.computer/
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2022/03/penkesu.computer-parts.jpg?w=1000&ssl=1