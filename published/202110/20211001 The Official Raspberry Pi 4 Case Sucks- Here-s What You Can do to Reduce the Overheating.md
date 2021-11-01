[#]: subject: "The Official Raspberry Pi 4 Case Sucks! Here’s What You Can do to Reduce the Overheating"
[#]: via: "https://itsfoss.com/raspberry-pi-case-overheating/"
[#]: author: "Avimanyu Bandyopadhyay https://itsfoss.com/author/avimanyu/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13851-1.html"

官方的树莓派 4 外壳很烂！怎么样减少过热？
======

![](https://img.linux.net.cn/data/attachment/album/202110/04/201826ghpecyb43cxehi4y.jpg)

[树莓派 4][1] 绝对是数百万人的最爱，特别是在极客社区里，我也不例外。但是你知道树莓派在没有适当冷却的情况下会限制性能吗？

在这里，我将介绍 [树莓派 4 官方外壳][2] 的一些严重缺点，同时也分享一些缓解这些缺点的方法。

![树莓派 4 官方外壳][3]

在第一次启动后，我的安装在 [树莓派 4 官方外壳][2] 内的树莓派 4（8GB 内存版），在无人值守的升级启动时，会高达 80℃。我在 Ubuntu 上进行了所有的 [固件更新][4]，显然是为了 [解决发热问题][5]。

就算在空闲时，这个烫手的香草和草莓蛋糕也绝不会低于 75℃。

我几乎无法使用它，直到我取下外壳顶部的白色盖子。它闲置时的温度降到只有 67℃ 左右 —— 你相信吗？即使是在我重新启动一段时间后再次检查也是这样。很明显，这仍然是不太可接受。如果我买了这个外壳并打算长期使用，我为什么要一直把盖子打开？

为什么会发生这样的事情？这都是因为官方的树莓派外壳的设计非常糟糕。

### 官方的树莓派 4 外壳是一个发热怪物！

简单地说，[热节流][6] 就是降低你的树莓派处理器（CPU）的性能，以使温度不超过极限高温（如 80℃）而 [导致损坏][7]。

这个外壳是由塑料制成的，它是热的不良导体（简单的 [传统物理学][8] 知识），因此无法将热量有效地散布到整个外壳和板子之外。因此，板上的处理器会发热，一旦温度达到惊人的程度，它的性能就会被降到一个极低的水平。我注意到，在第一次开机后，在**无人值守**的情况下进行升级时，CPU 的温度为 80℃，CPU 的使用率为 100%。

虽然这个官方的外壳看起来很美，但它对树莓派的性能造成了很大的影响。

如果你真的想让你的树莓派发挥最大的性能，你也必须负责它的冷却。这些发热问题不能被简单地忽视。

#### 热量被困在内部

一旦你把树莓派安装在这个外壳里，它甚至没有一个通风口可以让多余的热量排出。所以热量就一直在里面积累，直到达到那些疯狂的温度并触发了节流阀。

#### 没有风扇通风口（非常需要）

顶部的白色盖子上可以有一个圆形的通风口，至少可以把 [树莓派 4 的官方风扇][9] 放在上面使用。

#### 没有被动冷却

如果外壳是金属的，它就可以作为散热器，有效地将树莓派板上的处理器的热量散发出去。

#### 除了发热问题之外，还有其他的缺点

树莓派 4 官方外壳还有一些缺点：

  1. 不便于 SD 卡管理：将树莓派板子装入外壳内，并将 SD 卡端口放在正确的方向上，以便以后能够换卡，这不是很方便。
  2. 没有螺丝钉系统：没有提供螺丝，也许是因为它可能会破坏机箱底座上的假支架，这些假支架看起来就像你可以用四颗螺丝把板子牢牢地固定在底座上。

### 你可以做什么来控制树莓派 4 的过热？

在做了一些紧张的研究之后，我找到了市场上一些最好的冷却解决方案 —— 这一切都要归功于我们了不起的改装社区。

#### 使用冰塔式冷却器

我首先发现了 [Jeff Geerling's][10] 对各种树莓派散热器的深入性能评估，他在网上被称为 [geerlingguy][11]。在看完温度统计后，我直接选择了冰塔式散热器，并组装了它：

![树莓派 4 冰塔冷却器][12]

它空闲和低载时的温度下降到 30℃，现在保持在 45℃ 左右。我还没有为它改装一个合适的外壳。我准备找个给冷却器提供了足够的空间的现成外壳。也许可以在亚马逊或其他网上商店找到这种外壳。

但我没有找到这种产品。

#### 使用铝制散热器进行被动散热

网上也有一个关于 [被动冷却][17] 的出色视频，测评了一个用铝制散热片做的外壳。

它提供了一个热垫，它相当于台式机处理器上使用的散热膏。按照视频中显示的方式放置它，热量就会从树莓派板上的处理器散发到整个外壳内。这就是科学的神奇之处！

#### 改装官方的树莓派外壳

如果你仍然想买官方的外壳，建议你至少要做一个风扇的改装。

### 潜在的制造解决方案

这里有一些解决方案，通过应用 [DevOps][21] 启发的改进，可以使整个制造过程更容易。

  * 想一想，从外壳顶部切下的那块圆形塑料可以回收，用来制造更多的树莓派 4 外壳，不是吗？这显然会是一个双赢的局面，同时也降低了成本!
  * 铝是地球上最丰富的金属，但 [全球供应中断][22] 可能是一个挑战。即使如此，还有其他的 [导电性解决方案][23] 来探索用于设计案例的材料！

### 总结

希望这篇文章能帮助你从树莓派 4 中获得最大的收益。我很想知道你的想法、建议和经验，请在下面的评论中留言。请不要犹豫地分享。

--------------------------------------------------------------------------------

via: https://itsfoss.com/raspberry-pi-case-overheating/

作者：[Avimanyu Bandyopadhyay][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/avimanyu/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/raspberry-pi-4/
[2]: https://www.raspberrypi.org/products/raspberry-pi-4-case/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/raspberry-pi-4-official-case.webp?resize=800%2C533&ssl=1
[4]: https://www.einfochips.com/blog/understanding-firmware-updates-the-whats-whys-and-hows/
[5]: https://www.seeedstudio.com/blog/2019/11/29/raspberry-pi-4-firmware-update-pi-4-now-runs-cooler-than-ever/
[6]: https://www.pcmag.com/encyclopedia/term/thermal-throttling
[7]: https://www.pcgamer.com/cpu-temperature-overheat/
[8]: https://thermtest.com/stay-colder-for-longer-in-a-container-made-of-plastic-or-metal
[9]: https://www.raspberrypi.org/products/raspberry-pi-4-case-fan/
[10]: https://www.jeffgeerling.com/blog/2019/best-way-keep-your-cool-running-raspberry-pi-4
[11]: https://www.jeffgeerling.com/about
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/raspberry-pi-4-ice-tower-cooler.webp?resize=480%2C360&ssl=1
[13]: https://i0.wp.com/m.media-amazon.com/images/I/51g9gQC9k7L._SL160_.jpg?ssl=1
[14]: https://www.amazon.com/dp/B07V35SXMC?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (GeeekPi Raspberry Pi Cooling Fan, Raspberry Pi ICE Tower Cooler, RGB Cooling Fan with Raspberry Pi Heatsink for Raspberry Pi 4 Model B & Raspberry Pi 3B+ & Raspberry Pi 3 Model B)
[15]: https://www.amazon.com/gp/prime/?tag=chmod7mediate-20 (Amazon Prime)
[16]: https://www.amazon.com/dp/B07V35SXMC?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[17]: https://buildabroad.org/2016/11/05/passive-cooling/
[18]: https://i2.wp.com/m.media-amazon.com/images/I/41XGLQONCVS._SL160_.jpg?ssl=1
[19]: https://www.amazon.com/dp/B07VD568FB?tag=chmod7mediate-20&linkCode=osi&th=1&psc=1 (Geekworm Raspberry Pi 4 Armor Case, Raspberry Pi 4 Computer Model B Armor Aluminum Alloy Passive Cooling Case Compatible with Raspberry Pi 4 Model B Only)
[20]: https://www.amazon.com/dp/B07VD568FB?tag=chmod7mediate-20&linkCode=osi&th=1&psc=1 (Buy on Amazon)
[21]: https://linuxhandbook.com/what-is-devops/
[22]: https://www.reuters.com/article/global-metals-idUSL1N2Q90GA
[23]: https://news.mit.edu/2018/engineers-turn-plastic-insulator-heat-conductor-0330
