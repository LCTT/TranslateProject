Orange Pi 新手起步指南
===========================

![如何获取并运行 Orange Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/the_orange_pi_zero.jpg?itok=00T8KODN "How to get up and running with sweet Orange Pi") 

图片来源：Dave Egts, CC BY-SA 4.0

随着开源驱动的硬件越来越成为主流，比如 [Arduino][2] 和 [Raspberry Pi][3]，这些开源硬件的成本不断下降，给那些全新且具有创新性的[物联网][4]和[STEM][5]（LCTT译注：STEM 代表科学 Science，技术 Technology，工程 Engineering，数学 Mathematics）类软件打开了大门。我对两者都比较感兴趣，始终保持关注，以便能找到一些可以应用到教育产业的创新点，比如课堂教育和我女儿的[机器人小组][6]。当听说 [Orange Pi 比 Raspberry Pi 更优秀][7]时，我便开始关注 Orange Pi了。

尽管 Orange Pi 是个略带酸味儿的名字，但是我仍然被 Orange Pi Zero 迷住了。我最近刚购买了一个 Orange Pi Zero 并将在本文中分享我的第一体验。真情提示：我是真的着迷了。

### 为什么是 Orange Pi?

Orange Pi 是由 Linux 驱动的单板计算机家族的一员，由[深圳迅龙软件有限公司][8]生产并在 [全球速卖通（AliExpress）][9] 上售卖。在全球速卖通（AliExpress）上买东西需要有耐心，提前计划预留出 2 到 4 周的运输时间，因为这些产品都是从中国大陆直接发往全世界其它地方的。

与 Raspberry Pi 不同，Raspberry Pi 家族型号比较少，不过在逐步增加，为单板计算机家族添加了几个具有不同价位及功能特色的型号，但是相对而言 Orange Pi 的型号更丰富。好消息是可以在巨大的软件库中选择你需要的东西，但是坏消息就是选择范围实在太大了。以我的经验来看，使用 [Orange Pi Zero][10] 的 512 MB 版本足矣，因为该版本很好的平衡了功能与价格，适合中学及学术环境使用。

可以到 [Orange Pi Zero 网站][11] ，查看高清图及所有规格。

很明确的问题是，我希望这种设备的价格越便宜越好，但是要能做到开箱即用，并且能够直接联网以便 SSH 及物联网应用能正常使用。Orange Pi Zero 拥有板载的10/100 M 以太网及 802.11 b/g/n Wi-Fi 模块可以连接网络以满足需求。它还有 26 个与 Raspberry Pi 兼容的 [GPIO 端口][12]，用于连接物联网应用传感器。我使用的是 512 MB 版本的 Orange Pi Zero 而不是 256MB 版本，因为内存大带来的好处很多，并且这两个版本只相差了 2 美元。除此之外，运费还需要 $12.30，这笔花费对于那些鼓励积极实验及创造魔法烟雾的课堂特别划算。(LCTT 译注：“创造魔法烟雾”是幽默的说法，意即因未知原因设备停止工作，原多用于电气工程师和技术员，最近常被程序员们采用）。

与 $5 的 [Raspberry Pi Zero][14] 相比，Orange Pi Zero 只贵了几元钱，但是这个开箱后更容易上手使用，因为它拥有板载的 Internet 连接模块及 4 核 CPU，而不是单核。这个板载网口使得 Orange Pi Zero 比 Raspberry Pi Zero 更容易使用，因为 Raspberry Pi Zero 还需要一个 Micro-USB 转 USB 的转换器及一个 USB Wi-Fi 才能连上网。当赠送别人一个物联网设备作为礼物时，你当然希望对方能够尽快且容易的使用该产品，而不是送一个不完整的产品，那么这个礼物就只能躺在阁楼吃灰了。

### 开箱经验

起初对于 Orange Pi，我比较担心的问题是供应商及社区支持没有 Raspberry Pi 基金会和 Raspberry Pi 社区的好，用户不得不自己花费额外的精力把设备跑起来。如果这样的话，我是不会推荐 Orange Pi 作为课堂使用及礼物赠送的。然而好消息是 Orange Pi Zero 工作得非常好，且比 Raspberry 更容易跑起来。

订购两周后，Orange Pi 终于邮寄到家了。我拆开后在几分钟内就把设备运行起来了。其实这大部分时间都是在下载操作系统。Orange Pi 能够运行多种操作系统，从Android 到 Debian 系列都可以。我使用了 Orange Pi 粉丝推崇的 [Armbian][15]。由于 Armbian 支持多种基于 ARM 的单板计算机，你需要选择[适合 Orange Pi Zero 的 Armbian 版本][16]。按照 Armbian 用户指南[开始部分][17]操作即可以很容易做一个 microSD 镜像，然后插入 microSD 卡并接上网线，将我在 Raspberry Pi 中用的 3A Micro-USB 电源适配器插上供电，最后 SSH 登录上去即可使用了。

 ![Orange Pi interface](https://opensource.com/sites/default/files/orange_pi_screen_shot.png "Orange Pi interface") 

*SSH 登录进 Orange Pi Zero*

通过以太网 SSH 连上后，我可以使用 [nmtui-connect][18] 轻松连上我的无线接入点。然后执行 `apt-get update && apt-get upgrade` 命令，这个命令执行速度比 Raspberry Pi Zero 快，基本接近 [Raspberry Pi 3][19] 的表现了，其他人也[观察到类似的结果][20]。虽然 Orange Pi Zero 执行速度可能比不过Raspberry Pi 3，但是我也没有打算用它来计算基因排序或者挖比特币矿。Armbian 会自动调整 root 分区来使用整个 microSD 卡空间，而使用 Raspbian 的时候这是手动且很容易忘记的步骤。最后，和价值 $35 的 Raspberry Pi 3 相比，购买 $12 的 Orange Pi Zero 可以使得三倍多的学生有自己的学习工具，也可以将 Orange Pi Zero 作为礼物分享给三倍数量的朋友。

 ![Orange Pi Form Factor](https://opensource.com/sites/default/files/the_orange_pi_zero_form_factor.jpg "Orange Pi Form Factor") 

*Orange Pi Zero与 Raspberry Pi 3 尺寸外形的比较*

### 最后的想法

Orange Pi 无疑是解决问题的很好解决方案。鉴于它的低成本、能够更快上手且运行迅速、相对更快速的表现及 GPIO 针脚兼容 Raspberry Pi 的特性，Orange Pi，特别是 Orange Pi Zero，绝对应该列在你工作室、教室或者机器人组的实验器材清单里面。

当然如果你已经厌烦了使用 Orange Pi，希望能够将你不喜欢的原因分享在下面。

--------------------------------------------------------------------------------

作者简介：

David Egts - David Egts | 红帽公司北美公共部门首席技术专家。 喜欢玩打鼓，骑摩托车，电脑极客，是一名丈夫，父亲，传授教义者。关注我的推特 @davidegts并查看我正在主持的播客。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/how-to-orange-pi

作者：[David Egts][a]
译者：[beyondworld](https://github.com/beyondworld)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/daveegts
[1]:https://opensource.com/article/17/1/how-to-orange-pi?rate=ZJsifrA90bn7TAU6NWgsxdYtRQjRhq5n7NiPZD8876M
[2]:https://en.wikipedia.org/wiki/Arduino
[3]:https://en.wikipedia.org/wiki/Raspberry_Pi
[4]:https://en.wikipedia.org/wiki/Internet_of_things
[5]:https://en.wikipedia.org/wiki/Science,_technology,_engineering,_and_mathematics
[6]:https://opensource.com/education/14/3/fighting-unicorns-robotics-team
[7]:http://sprtechuk.blogspot.com/2015/09/15-computer-orange-pi-pc-is-powerful.html
[8]:http://www.xunlong.tv/
[9]:https://www.aliexpress.com/store/1553371
[10]:http://www.orangepi.org/orangepizero/
[11]:http://www.orangepi.org/orangepizero/
[12]:http://linux-sunxi.org/Xunlong_Orange_Pi_Zero#Expansion_Port
[13]:https://en.wikipedia.org/wiki/Magic_smoke
[14]:https://www.raspberrypi.org/products/pi-zero/
[15]:https://www.armbian.com/
[16]:https://www.armbian.com/orange-pi-zero/
[17]:https://docs.armbian.com/User-Guide_Getting-Started/
[18]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Networking_Guide/sec-Networking_Config_Using_nmtui.html
[19]:https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[20]:https://openbenchmarking.org/result/1612154-TA-1603058GA04,1612151-MICK-MICKMAK70,1612095-TA-1603058GA97,1612095-TA-1603058GA50
[21]:https://opensource.com/user/24799/feed
[22]:https://opensource.com/article/17/1/how-to-orange-pi#comments
[23]:https://opensource.com/users/daveegts
