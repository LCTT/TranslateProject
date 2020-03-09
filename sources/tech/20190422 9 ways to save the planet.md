[#]: collector: (lujun9972)
[#]: translator: (MFGJT)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (9 ways to save the planet)
[#]: via: (https://opensource.com/article/19/4/save-planet)
[#]: author: (Jen Wike Huger  https://opensource.com/users/jen-wike/users/alanfdoss/users/jmpearce)

九种拯救地球的方法
======
这些主意都用到了有关开源的内容的技巧
![][1]

人们可以做些什么来拯救地球？这个问题可能会让人感到压抑，因为有时我们感觉个人可以做的贡献太少了。但是作为地球公民，我们从来不是一个人。所以，我向我们的作家社区征集了一些开源软件或硬件可以帮助改变现状的方法。以下是他们的回复。

### 9种利用开源的内容来拯救地球的方法

**1.** **在你的终端禁用闪烁的光标。**

这听起来可能有点傻，但是那个无关紧要的闪烁的光标可能导致It might sound silly, but the trivial, blinking cursor can cause up to [额外的每小时两瓦特的额外电力开销][2]。如果要禁用光标闪烁，可以通过更改终端设置：编辑（edit）>偏好设置（preferences）>光标>光标闪烁>禁用。

_由Mars Toktonaliev推荐_

**2\. 减少有关动物产品和加工食物的消费。**

一种拯救地球的方法是在你的手机中添加这些开源的APP：Daily Dozen，OpenFoodFacts，OpenVegeMap，和Food Restrictions。这些APP可以帮助你准备一份健康的素食饮食计划，为你找到素食主义者和严格素食主义者可以就餐的餐厅，还可以帮助你把你的饮食需求告诉别人，即使他们不和你讲同一种语言。如果想要了解更多有关这些的APP的信息，你可以阅读[_4款帮助你准备素食饮食的开源APP_][3].

_由Joshua Allen Holm推荐_

**3\. 回收旧电脑。**

怎么回收？当然是用Linux。通过给一个没办法自己获得一台电脑的人一台新电脑的方式传递爱心，你可以避免让这台电脑进到垃圾填埋场。可以在 [The Asian Penguins][4]看看我们是怎么做的。

_由Stu Keroff推荐_

**4\. 在你不使用设备时关闭它们**

你可以使用带有主插座和控制插座的“智能插座板”。把你的电脑连接到主插座上，这样的话当你打开电脑时所有你连接到控制插座上的设备如显示器，打印机等也都会打开。一个更简单的不那么先进的方法是使用一个带有计时器的插座板。我在家里就是用的这个。你可以用计时器上的开关设定一个定时开关电源的时间表。这样可以在没有人在家时自动关闭网络打印机。或者以我的用了六年的笔记本电脑为例，我通过一个在使用外接电源（外接电源打开）和使用电脑电池（外接电源关闭）的电源计划延长了电脑电池的寿命。

_由Jim Hall推荐_

**5\. 减少供暖通风系统的使用。**

在夏天，通过窗户的阳光可以为室内提供很多热量。使用Home Assistant[自动调节][5]窗帘和遮阳棚，这可以是[基于一天中的时间的][6]，甚至是基于太阳高度角的。

_由Michael Hrivnak推荐_

**6\. 当你不在家时，把你的温度调节器调到一个低一些的温度。**

如果你的家用温度调节器有“离开”功能，你很容易忘记在出门时启用它。通过一点自动化，任何连接到网络的温度调节器都可以在你不在家时自动节省能量。[Stataway][7]就是一个这样项目。它通过调用你的手机的GPS坐标来决定是将你的温度调节器设置为“在家”还是“离开”。

_由Michael Hrivnak推荐_

**7\. Save computing power for later.**

我有一个主意：创建一个可以读取可选的能量阵列（如风能或太阳能）的输出的脚本。这个脚本应该将计算集群中的服务器从睡眠模式更改为激活模式直到过量的电能（超出可以储存的部分）被用尽。然后在高产能时段使用这些过量的电能来进行需要大量计算的项目，比如渲染。这个过程本质应该是免费的，因为使用的能量无法被储存起来挪作他用。我相信现有的监控、能量管理和服务器阵列工具一定可以实现这个功能。那么剩下的只是一些整合上的问题，好让整个系统工作。

_由Terry Hancock推荐_

**8\. 关掉你的灯**

根据[World Atlas of Artificial Night Sky Brightness][8]的说法，光污染影响全世界超过80%的污染。这一结论在2016年被发表（遵循Creative Commons Attribution-NonCommercial 4.0协议）在公开权限的期刊_Science Advances_上。关闭外部的灯是一个可以快速使野生生物、人类健康受益并让我们享受夜晚的天空的方法，而且可以减少能量消耗。访问[darksky.org][9]来查看更多减少你的外部灯光的影响的方法。

_由Michael Hrivnak推荐_

**9\. 减少你的CPU数量**

就我个人而言，我记得我以前有很多在地下室运行的电脑作为我的IT游乐场/实验室。我现在对于能量消耗更加注意了，所以真的大量地减少了我的CPU数量。我现在更喜欢利用虚拟机、区域和容器等科技。另外，我很高兴有小型电脑和SoC电脑这种东西，比如Raspberry Pi。因为我可以用一台这样的电脑做很多事情，比如运行一个DNS或者网络服务器，而无需使整个屋子变热并积累昂贵的电费账单。

P.S.所有这些电脑都运行于Linux，FreeBSD，或者Raspbian系统！

_由Alan Formy-Duvall推荐_

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/save-planet

作者：[Jen Wike Huger ][a]
选题：[lujun9972][b]
译者：[MFGJT](https://github.com/MFGJT)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jen-wike/users/alanfdoss/users/jmpearce
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pixelated-world.png?itok=fHjM6m53
[2]: https://www.redhat.com/archives/fedora-devel-list/2009-January/msg02406.html
[3]: https://opensource.com/article/19/4/apps-plant-based-diets
[4]: https://opensource.com/article/19/2/asian-penguins-close-digital-divide
[5]: https://www.home-assistant.io/docs/automation/trigger/#sun-trigger
[6]: https://www.home-assistant.io/components/cover/
[7]: https://github.com/mhrivnak/stataway
[8]: http://advances.sciencemag.org/content/2/6/e1600377
[9]: http://darksky.org/
