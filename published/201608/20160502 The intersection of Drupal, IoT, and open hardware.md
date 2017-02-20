Drupal、IoT 和开源硬件之间的交集
=======================================================

![](https://opensource.com/sites/default/files/styles/image-full-size/public/images/business/drupal_blue_gray_lead.jpeg?itok=t7W_KD-D)


来认识一下 [Amber Matz][1]，她是来自 Lullabot Education 旗下的 [Drupalize.Me][3] 的产品经理以及培训师。当她没有倒腾 Arduino、Raspberry Pi 以及电子穿戴设备时，通常会在波特兰 Drupal 用户组里担任辩论主持人。

在即将举行的 [DrupalCon NOLA][3] 大会上，Amber 将主持一个关于 Drupal 和 IoT 的主题。如果你会去参加，也想了解下开源硬件，IoT 和 Drupal 之间的交集，那这个将很合适。如果你去不了新奥尔良的现场也没关系，Amber 还分享了许多很酷的事情。在这次采访中，她讲述了自己参与 Drupal 的原因，一些她自己喜欢的开源硬件项目，以及 IoT 和 Drupal 的未来。

![](https://opensource.com/sites/default/files/images/life/Interview%20banner%20Q%26A.png)

**你是怎么加入 Drupal 社区的？**

在这之前，我在一家大型非盈利性机构市场部的“网站管理部”工作，飞快地批量生产出各种定制 PHP/MySQL 表单。最终我厌烦了这一切，并开始在网上寻找更好的方式。然后我找到了 Drupal 6 并开始沉迷进去。过了几年，在一次跳槽之后，我发现了波特兰 Drupal 用户组，然后在里面找了一份全职的 Drupal 开发者工作。我一直经常参加在波特兰的聚会，在那里我找到了大量的社区、朋友和专业方面的发展。一个偶然的机会，我在 Lullabot 找了一份培训师的工作，为 Drupalize.Me 提供内容。现在，我管理着 Drupalize.Me 的内容输出，负责编撰 Drupal 8 相关的内容，还很大程度地参与到波特兰 Drupal 社区中。我是今年的协调员，寻找并安排演讲者们。

**我们想知道：什么是 Arduino 原型，你是怎么找到它的，以及你用 Arduino 做过的最酷的事是什么？**

Arduino，Raspberry Pi，以及可穿戴电子设备，这些年到处都能听到这些术语。我在几年前通过 Becky Stern 的 YouTube 秀（最近由 Becky 继续主持，每周三播出）发现了 [Adafruit 的可穿戴电子设备][4]。我被那些可穿戴设备迷住了，还订了一套 LED 缝制工具，不过没做出任何东西。我不太适合它。我没有任何电子相关的背景，而且在我被那些项目吸引的时候，我根本不知道怎么做出那样的东西，它似乎看上去太遥远了。

后来，我在 Coursera 上找到了一个“物联网”专题。（很时髦，对吧？）我很快就喜欢上了。我最终找到了 Arduino 是什么的解释，以及所有这些其他的重要术语和概念。我订了一套推荐的 Arduino 初学者套件，还附带了一本如何上手的小册子。当我第一次让 LED 闪烁的时候，开心极了。我在圣诞节以及之后有两个星期的假期，然而我什么都没干，就一直根据初学者小册子给 Arduino 电路编程。很奇怪我觉得很放松！我太喜欢了。

在一月份的时候，我开始构思我自己的原型设备。在知道我需要主持公司培训的开场白时，我用五个 LED 灯和 Arduino 搭建了一个开场白视觉计时器的原型。

![](https://opensource.com/sites/default/files/resize/amber-arduino-lightning-talk-timer-400x400.jpg)

这是一次巨大的成功。我还做了我的第一个可穿戴项目，一件会发光的连帽衫，使用了和 Arduino IDE 兼容的 Gemma 微控制器，一个小的圆形可缝制部件，然后用可导电的线缝起来，将一个滑动可变电阻和衣服帽口的收缩绳连在一起，用来控制缝到帽子里的五个 NeoPixel 灯的颜色。这就是我对原型设计的看法：做一些很好玩也可能会有点实际用途的疯狂项目。

**Drupal 和 IoT 带来的最大机遇是什么？?**

IoT 与 Web Service 以及 Drupal 分层趋势实际并没有太大差别。就是将数据从一个东西传送到另一个东西，然后将数据转换成一些有用的东西。但数据是如何送达？能用来做点什么？你觉得现在就有一大堆现成的解决方案、应用、中间层，以及 API 吗？采用 IoT，这只会继续成几何指数级的增长。我觉得，给我任何一个设备或“东西”，总有办法来将它连接到互联网上，有很多办法。而且有大量现成的代码库来帮助创客们将他们的数据从一个东西传到另一个东西。

那么 Drupal 在这里处于什么位置？首先，Web services 将是第一个明显的地方。但作为一个创客，我不希望将时间花在编写 Drupal 的订制模块上。我想要的是即插即用！所以我很高兴出现这样的模块能连接 IoT 云端 API 和服务，比如 ThingSpeak，Adafruit.io，IFTTT，以及其他的。我觉得也有一个很好的商业机会，在 Drupal 里构建一套 IoT 云服务，允许用户发送和存储他们的传感器数据，并可以制成表格和图像，还可以写一些插件可以响应特定数据或阙值。每一个 IoT 云 API 服务都是一个细分的机会，所以能留下很大空间给其他人。

**这次 DrupalCon 你有哪些期待？**

我喜欢与 Drupal 上的朋友重逢，认识一些新的人，还能见到 Lullabot 和 Drupalize.Me 的同事（我们是分布式的公司）！Drupal 8 有太多东西可以去探索了，我们给我们的客户们提供了海量的培训资料。所以，我很期待参与一些 Drupal 8 相关的主题，以及跟上最新的开发进度。最后，我对新奥尔良也很感兴趣！我曾经在 2004 年去过，很期待将这次将看到哪些改变。

**谈一谈你这次 DrupalCon 上的演讲：“超越闪烁：将 Drupal 加到你的 IoT 游乐场中”。别人为什么要参加？他们最重要的收获会是什么？**

我的主题的标题是，“超越闪烁：将 Drupal 加到你的 IoT 游乐场中”，假设我们所有人都处在同一进度和层次，你不需要了解任何关于 Arduino、物联网、甚至是 Drupal，都能跟上。我将从用 Arduino 让 LED 灯闪烁开始，然后我会谈一下我自己在这里面的最大收获：玩、学、教和做。我会列出一些曾经激励过我的例子，它们也很有希望能激发和鼓励其他听众去尝试一下。然后，就是展示时间！

首先，第一个东西。它是一个建筑提醒信号灯。在这个展示里，我会说明如何将信号灯连到互联网上，以及如何响应从云 API 服务收到的数据。然后，第二个东西。它是一个蒸汽朋克风格 iPhone 外壳形式的“天气手表”。有一个小型 LED 矩阵用来显示我的天气的图标，一个气压和温度传感器，一个 GPS 模块，以及一个 Bluetooth LE 模块，都连接到一个 Adafruit Flora 微控制器上。第二个东西能通过蓝牙连接到我的 iPhone 上的一个应用，并将天气和位置数据通过 MQTT 协议发到 Adafruit.io 的服务器！然后，在 Drupal 这边，我会从云端下载这些数据，更新天气信息，然后更新地图。所以大家也能体验一下通过web service、地图和 Drupal 8 的功能块所能做的事情。

学习和制作这些展示原型是一次烧脑的探险，我也希望有人能参与这个主题并感染一点我对这种技术交叉的传染性热情！我很兴奋能分享一些我的发现。

------------------------------------------------------------------------------

via: https://opensource.com/business/16/5/drupalcon-interview-amber-matz

作者：[Jason Hibbets][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jhibbets
[1]: https://www.drupal.org/u/amber-himes-matz
[2]: https://drupalize.me/
[3]: https://events.drupal.org/neworleans2016/
[4]: https://www.adafruit.com/beckystern
