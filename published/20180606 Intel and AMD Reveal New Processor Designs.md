Intel 和 AMD 透露新的处理器设计
======

> Whiskey Lake U 系列和 Amber Lake Y 系列的酷睿芯片将会在今年秋季开始出现在超过 70 款笔记本以及 2 合 1 机型中。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/whiskey-lake.jpg?itok=b1yuW71L)

根据最近的台北国际电脑展 (Computex 2018) 以及最近其它的消息，处理器成为科技新闻圈中最前沿的话题。Intel 发布了一些公告涉及从新的酷睿处理器到延长电池续航的尖端技术。与此同时，AMD 亮相了第二代 32 核心的高端游戏处理器线程撕裂者（Threadripper）以及一些适合嵌入式的新型号锐龙 Ryzen 处理器。

以上是对 Intel 和 AMD 主要公布产品的快速浏览，针对那些对嵌入式 Linux 开发者最感兴趣的处理器。

### Intel 最新的第八代 CPU 家族

在四月份，Intel 已经宣布量产 10nm 制程的 Cannon Lake 系列酷睿处理器将会延期到 2019 年，这件事引起了人们对摩尔定律最终走上正轨的议论。然而，在 Intel 的 [Computex 展区][1] 中有着众多让人欣慰的消息。Intel 展示了两款节能的第八代 14nm 酷睿家族产品，同时也是 Intel 首款 5GHz 的设计。

Whiskey Lake U 系列和 Amber Lake Y 系列的酷睿芯片将会在今年秋季开始出现在超过 70 款笔记本以及 2 合 1 机型中。Intel 表示，这些芯片相较于第七代的 Kaby Lake 酷睿系列处理器会带来两倍的性能提升。新的产品家族将会相比于目前出现的搭载 [Coffee Lake][2] 芯片的产品更加节能 。

Whiskey Lake 和 Amber Lake 两者将会配备 Intel 高性能千兆 WiFi (Intel 9560 AC)，该网卡同样出现在 [Gemini Lake][3] 架构的奔腾银牌和赛扬处理器，随之出现在 Apollo Lake 一代。千兆 WiFi 本质上就是 Intel 将 2×2 MU-MIMO 和 160MHz 信道技术与 802.11ac 结合。

Intel 的 Whiskey Lake 将作为第七代和第八代 Skylake U 系列处理器的继任者，它们现在已经流行于嵌入式设备。Intel 透漏了少量细节，但是 Whiskey Lake 想必将会提供同样的，相对较低的 15W TDP。这与 [Coffee Lake U 系列芯片][4] 也很像，它将会被用于四核以及 Kaby Lake 和 Skylake U 系列的双核芯片。

[PC World][6] 报导称，Amber Lake Y 系列芯片主要目标定位是 2 合 1 机型。就像双核的 [Kaby Lake Y 系列][5] 芯片，Amber Lake 将会支持 4.5W TDP。

为了庆祝 Intel 即将到来的 50 周年庆典， 同样也是作为世界上第一款 8086 处理器的 40 周年庆典，Intel 将启动一个限量版，带有一个时钟频率 4GHz 的第八代 [酷睿 i7-8086K][7] CPU。 这款 64 位限量版产品将会是第一块拥有 5GHz, 单核睿频加速，并且是首款带有集成显卡的 6 核，12 线程处理器。Intel 将会于 6 月 7 日开始 [赠送][8] 8086 块超频酷睿 i7-8086K 芯片。

Intel 也展示了计划于今年年底启动新的高端 Core X 系列拥有高核心和线程数。[AnandTech 预测][9] 可能会使用类似于 Xeon 的 Cascade Lake 架构。今年晚些时候，Intel 将会公布新的酷睿 S系列型号，AnandTech 预测它可能会是八核心的 Coffee Lake 芯片。

Intel 也表示第一款疾速傲腾 SSD —— 一个 M.2 接口产品被称作 [905P][10] —— 终于可用了。今年来迟的是 Intel XMM 800 系列调制解调器，它支持 Sprint 的 5G 蜂窝技术。Intel 表示 可用于 PC 的 5G 将会在 2019 年出现。

### Intel 承诺笔记本全天候的电池寿命

另一则消息，Intel 表示将会尽快启动一项 Intel 低功耗显示技术，它将会为笔记本设备提供一整天的电池续航。合作开发伙伴 Sharp 和 Innolux 正在使用这项技术在 2018 年晚期开始生产 1W 显示面板，这能节省 LCD 一半的电量消耗。

### AMD 继续翻身

在展会中，AMD 亮相了第二代拥有 32 核 64 线程的线程撕裂者（Threadripper） CPU。为了走在 Intel 尚未命名的 28 核怪兽之前，这款高端游戏处理器将会在第三季度推出。根据 [Engadget][11] 的消息，新的线程撕裂者同样采用了被用在锐龙 Ryzen 芯片的 12nm Zen+ 架构。 

[WCCFTech][12] 报导，AMD 也表示它选自 7nm Vega Instinct GPU（为拥有 32GB 昂贵的 HBM2 显存而不是 GDDR5X 或 GDDR6 的显卡而设计）。这款 Vega Instinct 将提供相比现今 14nm Vega GPU 高出 35% 的性能和两倍的功效效率。新的渲染能力将会帮助它同 Nvidia 启用 CUDA 技术的 GPU 在光线追踪中竞争。

一些新的 Ryzen 2000 系列处理器近期出现在一个 ASRock CPU 聊天室，它将拥有比主流的 Ryzen 芯片更低的功耗。[AnandTech][13] 详细介绍了，2.8GHz，8 核心，16 线程的 Ryzen 7 2700E 和 3.4GHz/3.9GHz，六核，12 线程 Ryzen 5 2600E 都将拥有 45W TDP。这比 12-54W TDP 的 [Ryzen Embedded V1000][2] 处理器更高，但低于 65W 甚至更高的主流 Ryzen 芯片。新的 Ryzen-E 型号是针对 SFF (外形小巧，small form factor) 和无风扇系统。

在 [开源峰会 + 欧洲嵌入式 Linux 会议][14] 加入我们，关于 Linux，云，容器，AI，社区等 100 多场会议，爱丁堡，英国，2018 年 10 月 22-24 日。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/6/intel-amd-and-arm-reveal-new-processor-designs

作者：[Eric Brown][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[softpaopao](https://github.com/softpaopao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/ericstephenbrown
[1]:https://newsroom.intel.com/editorials/pc-personal-contribution-platform-pushing-boundaries-modern-computers-computex/
[2]:https://www.linux.com/news/elc-openiot/2018/3/hot-chips-face-mwc-and-embedded-world
[3]:http://linuxgizmos.com/intel-launches-gemini-lake-socs-with-gigabit-wifi/
[4]:http://linuxgizmos.com/intel-coffee-lake-h-series-debuts-in-congatec-and-seco-modules
[5]:http://linuxgizmos.com/more-kaby-lake-chips-arrive-plus-four-nuc-mini-pcs/
[6]:https://www.pcworld.com/article/3278091/components-processors/intel-computex-news-a-28-core-chip-a-5ghz-8086-two-new-architectures-and-more.html
[7]:https://newsroom.intel.com/wp-content/uploads/sites/11/2018/06/intel-i7-8086k-launch-fact-sheet.pdf
[8]:https://game.intel.com/8086sweepstakes/
[9]:https://www.anandtech.com/show/12878/intel-discuss-whiskey-lake-amber-lake-and-cascade-lake
[10]:https://www.intel.com/content/www/us/en/products/memory-storage/solid-state-drives/gaming-enthusiast-ssds/optane-905p-series.htm
[11]:https://www.engadget.com/2018/06/05/amd-threadripper-32-cores/
[12]:https://wccftech.com/amd-demos-worlds-first-7nm-gpu/
[13]:https://www.anandtech.com/show/12841/amd-preps-new-ryzen-2000series-cpus-45w-ryzen-7-2700e-ryzen-5-2600e
[14]:https://events.linuxfoundation.org/events/elc-openiot-europe-2018/
