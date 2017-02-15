
如何获取并运行Orange Pi
===========================

 ![如何获取并运行Orange Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/the_orange_pi_zero.jpg?itok=00T8KODN "How to get up and running with sweet Orange Pi") 

图片来源：Dave Egts, CC BY-SA 4.0

由开源驱动的硬件比如[Arduino][2]和[Raspberry Pi][3]变得越来越流行了，这些开源硬件的成本不断下降，给那些全新且具有创新性的[物联网][4]和[STEM][5](译者注：STEM代表科学Science，技术Technology，工程Engineering，数学Mathematics)类软件降低了使用门槛。由于我对这些比较感兴趣，总是持续关注以便能找到一些可以应用到教育产业的创新点，比如课堂教育和我女儿的[机器人小组][6]。当听说[Orange Pi比Raspberry Pi更优秀][7]时，我便开始关注Orange Pi了。

尽管Orange Pi是个略带酸味儿的名字，但是我仍然被Orange Pi Zero迷住了。我最近刚购买了一个Orange Pi Zero并将在本文中分享我的第一体验。真情提示：我是真的着迷了。

### 为什么是Orange Pi?

Orange Pi 是由Linux驱动的单板计算机家族的一员，由[深圳迅龙软件有限公司][8]研发并在[AliExpress][9]上售卖。在AliExpress上买东西需要有耐心，提前计划并预留2到4周的运输时间，因为这些产品都是从中国大陆直接发往全世界其它地方的。

与Raspberry Pi不同，Raspberry Pi家族本身型号比较少，虽然为单板计算机家族添加了几个具有不同价位及功能特色的型号，但是相对而已Orange Pi的型号更丰富。还有个好消息就是你可以在巨大的软件库中选择你需要的东西，但是坏消息就是需要你选择的数量太大了。以我的经验来看，可以使用[Orange Pi Zero][10]的512MB版本足矣，因为该版本价格公道且具备了适合高校教育及工作组实验用的所有功能。

可以到[Orange Pi Zero website][11]看到各个版本的更多高清图像信息。

很明确的问题是，我希望这种设备的价格越便宜越好，但是要能做到开箱即用，并且能够直接联网以便SSH及物联网相关应用能正常使用。Orange Pi Zero拥有板载的10/100M以太网及802.11 b/g/n Wi-Fi模块可以连接网络以满足需求。并且它还有26个与Raspberry Pi兼容的[GPIO端口][12]，以便物联网应用连接传感器。我使用的是512MB版本的Orange Pi Zero而不是256MB版本，因为内存大带来的好处很多，并且这两个版本只相差了$2。除此之外，运费还需要$12.30，这笔花费对于那些鼓励积极实验及创造魔法烟雾的课堂特别划算。

与价值$5的[Raspberry Pi Zero][14]相比，Orange Pi Zero只贵了一点点，但是这个开箱后更容易上手使用，因为它拥有板载的Internet连接模块及4核CPU。这个板载的网络连接投使得Orange Pi Zero比Raspberry Pi Zero更容易使用，因为Raspberry Pi Zero还需要一个Micro-USB-to-USB转换器及一个USB Wi-Fi才能连上网。当你赠送别人一个物联网设备作为礼物时，你当然希望对方能够更快更好的使用该产品，如果你送了一个不能开箱即用的完整产品那么这个礼物就只能躺在阁楼吃灰了。

### 开箱经验

起初对于Orange Pi比较担心的问题是供应商及社区支持没有Raspberry Pi基金会和Raspberry Pi社区的好，使用户在投入更多的努力把设备跑起来又把用户抛弃了。当然如果出现了这种情况，我会很后悔推荐Orange Pi作为课堂使用及礼物赠送。然而好消息是Orange Pi Zero工作得非常好且比Raspberry更容易获得。

在两周的煎熬等待后Orange Pi终于邮寄到家了。我拆开后在几分钟内就把设备运行起来了。其实这大部分时间都是在下载操作系统。Orange Pi能够运行多种操作系统，从Android到Debian系列都可以。我使用了Orange Pi粉丝推崇的[Armbian][15]运行。由于Armbian支持多种基于ARM的单板计算机，因此你需要从中[网站][16]上选择适合Orange Pi Zero的系统版本。跟着Armbian用户指南[Getting Started section][17]操作即可以很容易做一个microSD镜像，然后插入microSD卡并接上网线，将我在Raspberry Pi中用的3A Micro-USB电源适配器插上供电，最后SSH登录上去即可使用了。

 ![Orange Pi interface](https://opensource.com/sites/default/files/orange_pi_screen_shot.png "Orange Pi interface") 

<sup style="box-sizing: border-box; font-size: 13.5px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em;">上图是SSH登录进Orange Pi Zero后.</sup>

当通过SSHed连上后，我可以使用[nmtui-connect][18]轻松连上我的无线接入点。然后执行 **apt-get update && apt-get upgrade**命令，这个命令执行速度比Raspberry Pi Zero快，基本接近[Raspberry Pi 3][19]的表现了，执行其它命令也能[观察到类似的结果][20]。虽然Orange Pi Zero执行速度比不过Raspberry Pi 3，但是我也没有打算用它来计算基因排序或者挖比特币矿。Armbian会自动调整root分区来使用整个microSD卡空间，当使用Raspbian的时候很容易忽略该环节。最后，和价值$35的Raspberry Pi 3相比购买$12的Orange Pi Zero可以使得三倍多的学生有自己的学习工具，你也可以将Orange Pi Zero作为礼物分享给更多的朋友。

 ![Orange Pi Form Factor](https://opensource.com/sites/default/files/the_orange_pi_zero_form_factor.jpg "Orange Pi Form Factor") 

<sup style="box-sizing: border-box; font-size: 13.5px; line-height: 0; position: relative; vertical-align: baseline; top: -0.5em;">Orange Pi Zero与Raspberry Pi 3在尺寸上的比较</sup>

### 最后的想法

Orange Pi无疑是解决问题的很好解决方案。鉴于它的低成本、能够更快上手且运行迅速、相对更快速的表现及GPIO针脚兼容Raspberry Pi的特性，Orange Pi和Orange Pi Zero特别需要列在你工作室、教室或者机器人组的实验器材清单里面。

当然如果你已经厌烦了使用Orange Pi，希望能够将你不喜欢的原因分享在下面。

--------------------------------------------------------------------------------

作者简介：

David Egts - David Egts | 红帽公司北美公共部门首席技术官. 喜欢玩打鼓, 骑摩托车, 电脑极客,是一名丈夫, 父亲, 以及传教士.关注我的推特@davidegts并查看我正在主持的播客。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/1/how-to-orange-pi

作者：[David Egts][a]
译者：[beyondworld](https://github.com/beyondworld)
校对：[校对者ID](https://github.com/校对者ID)

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
