[#]: collector: (lujun9972)
[#]: translator: (MFGJT)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11978-1.html)
[#]: subject: (9 ways to save the planet)
[#]: via: (https://opensource.com/article/19/4/save-planet)
[#]: author: (Jen Wike Huger  https://opensource.com/users/jen-wike/users/alanfdoss/users/jmpearce)

九种用开源拯救地球的方法
======

> 这些主意都用到了有关的开源技巧。

![](https://img.linux.net.cn/data/attachment/album/202003/10/004034vbl5qb5lbij66zil.jpg)

人们可以做些什么来拯救地球？这个问题可能会让人感到压抑，因为有时我们感觉个人可以做的贡献太少了。但是作为地球公民，我们从来不是一个人。所以，我向我们的作家社区征集了一些开源软件或硬件可以帮助改变现状的方法。以下是他们的回复。

### 九种利用开源的方法来拯救地球的方式

#### 1、在你的终端禁用闪烁的光标

这听起来可能有点傻，但是那个无关紧要的闪烁的光标可能导致[每小时两瓦特的额外电力开销][2]。如果要禁用光标闪烁，可以通过更改终端设置：<ruby>编辑<rt>Edit</rt></ruby> > <ruby>偏好设置<rt>Preferences</rt></ruby> > <ruby>光标<rt>Cursor</rt></ruby> > <ruby>光标闪烁<rt>Cursor blinking</rt></ruby> > <ruby>禁用<rt>Disabled</rt></ruby>。

*由 Mars Toktonaliev 推荐*

#### 2、减少有关动物产品和加工食物的消费

这样做的一种方法是在你的手机中添加这些开源的 App：Daily Dozen、OpenFoodFacts、OpenVegeMap 和 Food Restrictions。这些 App 可以帮助你准备一份健康的素食饮食计划，为你找到素食主义者和严格素食主义者可以就餐的餐厅，还可以帮助你把你的饮食需求告诉别人，即使他们不和你讲同一种语言。如果想要了解更多有关这些的 App 的信息，你可以阅读《[4 款“吃草”的开源应用][3]》。

*由 Joshua Allen Holm 推荐*

#### 3、让旧电脑重焕新生

怎么做？当然是用 Linux。通过给那些自己得不到新电脑的人创造一台新电脑来传递爱心，同时也可以避免让这台电脑进到垃圾填埋场。可以在 [The Asian Penguins][4] 看看我们是怎么做的。

*由 Stu Keroff 推荐*

#### 4、在你不使用设备时关闭它们

你可以使用带有主插座和控制插座的“智能插座板”。把你的电脑连接到主插座上，这样的话当你打开电脑时所有你连接到控制插座上的设备如显示器，打印机等也都会打开。一个更简单的、技术含量更低的方法是使用一个带有计时器的插座板。我在家里就是用的这个。你可以用计时器上的开关设定一个定时开关电源的时间表。这样可以在没有人在家时自动关闭网络打印机。或者以我的用了六年的笔记本电脑为例，我通过一个交替使用外接电源（插座打开）和使用电脑电池（插座关闭）的电源计划延长了电脑电池的寿命。

*由 Jim Hall 推荐*

#### 5、减少供暖通风系统（HVAC）的使用

在夏天，透过窗户的阳光可以为室内提供很多热量。使用 Home Assistant 可以[基于一天中的时间的][6]，甚至是基于太阳高度角[自动调节][5]窗帘和遮阳棚。

*由 Michael Hrivnak 推荐*

#### 6、出门就把恒温器关闭或调低

如果你的家用恒温器具有“离开”功能，你很容易忘记在出门时启用它。借助自动化，任何连接到网络的恒温器都可以在你不在家时自动节省能量。[Stataway][7]  就是一个这样项目。它通过调用你的手机的 GPS 坐标来决定是将你的恒温器设置为“在家”还是“离开”。

*由 Michael Hrivnak 推荐*

#### 7、为未来储蓄算力

我有一个主意：创建一个可以读取可选的能量阵列（如风能或太阳能）的输出的脚本。这个脚本应该将计算集群中的服务器从睡眠模式更改为激活模式，直到过量的电能（超出可以储存的部分）被用尽。然后在高产能时段使用这些过量的电能来进行需要大量计算的项目，比如渲染。这个过程本质应该是免费的，因为使用的能量无法被储存起来挪作它用。我相信现有的监控、能量管理和服务器阵列工具一定可以实现这个功能。那么剩下的只是一些整合上的问题，就可以让整个系统工作起来。

*由 Terry Hancock 推荐*

#### 8、关掉你的灯

根据<ruby>[人工夜空亮度图集][8]<rt>World Atlas of Artificial Night Sky Brightness</rt></ruby>的说法，光污染影响了全世界超过 80% 的人口。这一结论在 2016 年（遵循 CC-NC 4.0 协议）发表在公开访问的期刊《<ruby>科学进展<rt>Science Advances</rt></ruby>》上。关闭外部照明是一个可以使野生生物、人类健康受益并让我们享受夜晚的天空的快速途径，而且可以减少能量消耗。访问 [darksky.org][9] 来查看更多减少外部照明影响的方法。

*由 Michael Hrivnak 推荐*

#### 9、减少你的 CPU 数量

就我个人而言，我记得我以前有很多在地下室运行的电脑作为我的 IT 游乐场/实验室。我现在对于能源消耗更加注意了，所以确实大大地减少了我的 CPU 数量。我现在更喜欢利用虚拟机、区域和容器等技术。另外，我很高兴有小型电脑和 SoC 电脑这种东西，比如树莓派，因为我可以用一台这样的电脑做很多事情，比如运行一个 DNS 或者 Web 服务器，而无需使整个屋子变热并积累昂贵的电费账单。

P.S. 这些电脑都运行于 Linux、FreeBSD，或者 Raspbian 系统！

*由 Alan Formy-Duvall 推荐*

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/save-planet

作者：[Jen Wike Huger][a]
选题：[lujun9972][b]
译者：[MFGJT](https://github.com/MFGJT)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jen-wike/users/alanfdoss/users/jmpearce
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pixelated-world.png?itok=fHjM6m53
[2]: https://www.redhat.com/archives/fedora-devel-list/2009-January/msg02406.html
[3]: https://linux.cn/article-10926-1.html
[4]: https://opensource.com/article/19/2/asian-penguins-close-digital-divide
[5]: https://www.home-assistant.io/docs/automation/trigger/#sun-trigger
[6]: https://www.home-assistant.io/components/cover/
[7]: https://github.com/mhrivnak/stataway
[8]: http://advances.sciencemag.org/content/2/6/e1600377
[9]: http://darksky.org/
