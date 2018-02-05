用 Linux、Python 和树莓派酿制啤酒
============================================================

> 怎样在家用 Python 和树莓派搭建一个家用便携的自制酿啤酒装置
 
![Brewing beer with Linux, Python, and Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/beer-drink-sample-sampler.png?itok=JV4E4iVY "Brewing beer with Linux, Python, and Raspberry Pi")

大约十年前我开始酿制自制啤酒，和许多自己酿酒的人一样，我开始在厨房制造提纯啤酒。这需要一些设备并且做出来后确实是好的啤酒，最终，我用一个放入了所有大麦的大贮藏罐作为我的麦芽浆桶。几年之后我一次酿制过 5 加仑啤酒，但是酿制 10 加仑时也会花费同样的时间和效用（只是容器比之前大些），之前我就是这么做的。容量提升到 10 加仑之后，我偶然看到了 [StrangeBrew Elsinore][38] ，我意识到我真正需要的是将整个酿酒过程转换成全电子化的，用树莓派来运行它。

建造自己的家用电动化酿酒系统需要大量这方面的技术信息，许多学习酿酒的人是在 [TheElectricBrewery.com][28] 这个网站起步的，只不过将那些控制版搭建在一起是十分复杂的，尽管最简单的办法在这个网站上总结的很好。当然你也能用[一个小成本的方法][26]并且依旧可以得到相同的结果 —— 用一个热水壶和热酒容器通过一个 PID 控制器来加热你的酿酒原料。但是我认为这有点太无聊（这也意味着你不能体验到完整的酿酒过程）。

### 需要用到的硬件

在我开始我的这个项目之前, 我决定开始买零件，我最基础的设计是一个可以将液体加热到 5500 瓦的热酒容器（HLT）和开水壶，加一个活底的麦芽浆桶，我通过一个 50 英尺的不锈钢线圈在热酒容器里让泵来再循环麦芽浆（["热量交换再循环麦芽浆系统, 也叫 HERMS][27]）。同时我需要另一个泵来在热酒容器里循环水，并且把水传输到麦芽浆桶里，整个电子部件全部是用树莓派来控制的。

建立我的电子酿酒系统并且尽可能的自动化意味着我需要以下的组件：

*   一个 5500 瓦的电子加热酒精容器（HLT）
*   能够放入加热酒精容器里的 50 英尺（0.5 英寸）的不锈钢线圈（热量交换再循环麦芽浆系统）
*   一个 5500 瓦的电子加热水壶
*   多个固态继电器加热开关
*   2 个高温食品级泵
*   泵的开关用继电器
*   可拆除装置和一个硅管
*   不锈钢球阀
*   一个测量温度的探针
*   很多线
*   一个来容纳这些配件的电路盒子

![Brew system](https://opensource.com/sites/default/files/aedo-f1.png "Brew system")

*酿酒系统 (photo by Christopher Aedo. [CC BY-SA 4.0)][5]*

建立酿酒系统的电气化方面的细节 [The Electric Brewery][28] 这个网站概括的很好，这里我不再重复，当你计划用树莓派代替这个 PID 控制器的话，你可以读以下的建议。

一个重要的事情需要注意，固态继电器（SSR）信号电压，许多教程建议使用一个 12 伏的固态继电器来关闭电路，树莓派的 GPIO 针插口只支持 3 伏输出电压，然而，必须购买继电器将电压变为 3 伏。

![Inkbird SSR](https://opensource.com/sites/default/files/aedo-f2.png "Inkbird SSR")

*Inkbird SSR (photo by Christopher Aedo. [CC BY-SA 4.0)][6]*

要运行酿酒系统，你的树莓派必须做两个关键事情：测量来自几个不同位置的温度，用继电器开关来控制加热元件，树莓派很容易来处理这些任务。

这里有一些不同的方法来将温度传感器连到树莓派上，但是我找到了最方便的方法用[单总线][29]。这就可以让多个传感器分享相同的线路（实际上是三根线），这三根线可以使酿酒系统的多个设备更方便的工作，如果你要从网上找一个防水的 DS18B20 温度传感器，你可以会找到很多选择。我用的是[日立 DS18B20 防水温度传感器][30]。

要控制加热元件，树莓派包括了几个用来软件寻址的总线扩展器（GPIO），它会通过在某个文件写入 0 或者 1 让你发送3.3v 的电压到一个继电器，在我第一次了解树莓派是怎样工作的时候，这个[用 GPIO 驱动继电器的树莓派教程][46]对我来说是最有帮助的，总线扩展器控制着多个固态继电器，通过酿酒软件来直接控制加热元件的开关。

我首先将所有部件放到这个电路盒子，因为这将成为一个滚动的小车，我要让它便于移动，而不是固定不动的，如果我有一个店（比如说在车库、工具房、或者地下室），我需要要用一个装在墙上的更大的电路盒，而现在我找到一个大小正好的[防水工程盒子][31]，能放进每件东西，最后它成为小巧紧凑工具盒，并且能够工作。在左下角是和树莓派连接的为总线扩展器到单总线温度探针和[固态继电器][32]的扩展板。

要保持 240v 的固态继电器温度不高，我在盒子上切了个洞，在盒子的外面用 CPU 降温凝胶把[铜片散热片][33]安装到盒子外面的热槽之间。它工作的很好，盒子里没有温度上的问题了，在盒子盖上我放了两个开关为 120v 的插座，加两个240v 的 led 来显示加热元件是否通电。我用干燥器的插座和插头，所以可以很容易的断开电热水壶的连接。首次尝试每件事情都工作正常。（第一次绘制电路图必有回报）

这个照片来自“概念”版，最终生产系统应该有两个以上的固态继电器，以便 240v 的电路两个针脚能够切换，另外我将通过软件来切换泵的开关。现在通过盒子前面的物理开关控制它们，但是也很容易用继电器控制它们。 

![Control box](https://opensource.com/sites/default/files/aedo-f3.png "Control box")

*控制盒子 (photo by Christopher Aedo. [CC BY-SA 4.0)][7]*

唯一剩下有点棘手的事情是温度探针的压合接头，这个探针安装在加热酒精容器和麦芽浆桶球形的最底部阀门前的 T 字型接头上。当液体流过温度传感器，温度可以准确显示。我考虑加一个套管到热水壶里，但是对于我的酿造工艺没有什么用。最后，我买到了[四分之一英寸的压合接头][34]，它们工作完美。

### 软件

一旦硬件整理好，我就有时间来处理软件了，我在树莓派上跑了最新的 [Raspbian 发行版][35]，操作系统方面没有什么特别的。

我开始使用 [Strangebrew Elsinore][36] 酿酒软件，当我的朋友问我是否我听说过 [Hosehead][37]（一个基于树莓派的酿酒控制器），我找到了 [Strangebrew Elsinore][36] 。我认为 [Hosehead][37] 很棒，但我并不是要买一个酿酒控制器，而是要挑战自己，搭建一个自己的。

设置 [Strangebrew Elsinore][36] 很简单，其[文档][38]直白，没有遇到任何的问题。尽管 Strangebrew Elsinore 工作的很好，但在我的一代树莓派上运行 java 有时是费力的，不止崩溃一次。我看到这个软件开发停顿也很伤心，似乎他们也没有更多贡献者的大型社区（尽管有很多人还在用它）。

#### CraftBeerPi

之后我偶然遇到了一个用 Python 写的 [CraftbeerPI][39]，它有活跃的贡献者支持的开发社区。原作者（也是当前维护者） Manuel Fritsch 在贡献和反馈问题处理方面做的很好。克隆[这个仓库][40]然后开始只用了我一点时间。其 README 文档也是一个连接 DS1820 温度传感器的好例子，同时也有关于硬件接口到树莓派或者[芯片电脑][41] 的注意事项。

在启动的时候，CraftbeerPI 引导用户通过一个设置过程来发现温度探针是否可用，并且让你指定哪个 GPIO 总线扩展器指针来管理树莓派上哪个配件。

![CraftBeerPi](https://opensource.com/sites/default/files/images/life/aedo-f4.png "CraftBeerPi")

*CraftBeerPi (photo by Christopher Aedo. [CC BY-SA 4.0)][8]*

用这个系统进行自制酿酒是容易的，我能够依靠它掌握可靠的温度，我能输入多个温度段来控制麦芽浆温度，用CraftbeerPi 酿酒的日子有一点点累，但是我很高兴用传统的手工管理丙烷燃烧器的“兴奋”来换取这个系统的有效性和持续性。

CraftBeerPI 的用户友好性鼓舞我设置了另一个控制器来运行“发酵室”。就我来说，那是一个二手冰箱，我用了 50 美元加上放在里面的 25 美元的加热器。CraftBeerPI 很容易控制电器元件的冷热，你也能够设置多个温度阶段。举个例子，这个图表显示我最近做的 IPA 进程的发酵温度。发酵室发酵麦芽汁在 67F° 的温度下需要 4 天，然后每 12 小时上升一度直到温度到达 72F°。剩下两天温度保持不变是为了双乙酰生成。之后 5 天温度降到 65F°，这段时间是让啤酒变“干”，最后啤酒发酵温度直接降到 38F°。CraftBeerPI 可以加入各个阶段，让软件管理发酵更加容易。

![SIPA fermentation profile](https://opensource.com/sites/default/files/aedo-f5.png "SIPA fermentation profile")

*SIPA 发酵设置 (photo by Christopher Aedo. [CC BY-SA 4.0)][9]*

我也试验过用[液体比重计][42]来对酵啤酒的比重进行监测，通过蓝牙连接的浮动传感器可以达到。有一个整合的计划能让 CraftbeerPi 很好工作，现在它记录这些比重数据到谷歌的电子表格里。一旦这个液体比重计能连接到发酵控制器，设置的自动发酵设置会基于酵母的活动性直接运行且更加容易，而不是在 4 天内完成主要发酵，可以在比重稳定 24 小时后设定温度。

像这样的一些项目，构想并计划改进和增加组件是很容易，不过，我很高兴今天经历过的事情。我用这种装置酿造了很多啤酒，每次都能达到预期的麦芽汁比率，而且啤酒一直都很美味。我的最重要的消费者 —— 就是我！很高兴我可以随时饮用。

![Homebrew on tap](https://opensource.com/sites/default/files/aedo-f6.png "Homebrew on tap")

*随时饮用 (photo by Christopher Aedo. [CC BY-SA 4.0)][10]*

这篇文章基于 Christopher 的开放的西部的讲话《用Linux、Python 和树莓派酿制啤酒》。 

（题图：[Quinn Dombrowski][21]. Modified by Opensource.com. [CC BY-SA 4.0][22]）

--------------------------------------------------------------------------------

作者简介：

Christopher Aedo 从他的学生时代就从事并且贡献于开源软件事业。最近他在 IBM 领导一个极棒的上游开发者团队，同时他也是开发者拥护者。当他不再工作或者实在会议室演讲的时候，他可能在波特兰市俄勒冈州用树莓派酿制和发酵一杯美味的啤酒。

----
via: https://opensource.com/article/17/7/brewing-beer-python-and-raspberry-pi

作者：[Christopher Aedo][a]
译者：[hwlife](https://github.com/hwlife)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/docaedo
[1]:https://opensource.com/tags/raspberry-pi?src=raspberry_pi_resource_menu1
[2]:https://opensource.com/resources/what-raspberry-pi?src=raspberry_pi_resource_menu2
[3]:https://opensource.com/article/16/12/getting-started-raspberry-pi?src=raspberry_pi_resource_menu3
[4]:https://opensource.com/article/17/2/raspberry-pi-submit-your-article?src=raspberry_pi_resource_menu4
[5]:https://creativecommons.org/licenses/by-sa/4.0/
[6]:https://creativecommons.org/licenses/by-sa/4.0/
[7]:https://creativecommons.org/licenses/by-sa/4.0/
[8]:https://creativecommons.org/licenses/by-sa/4.0/
[9]:https://creativecommons.org/licenses/by-sa/4.0/
[10]:https://creativecommons.org/licenses/by-sa/4.0/
[11]:https://opensource.com/file/358661
[12]:https://opensource.com/file/358666
[13]:https://opensource.com/file/358676
[14]:https://opensource.com/file/359061
[15]:https://opensource.com/file/358681
[16]:https://opensource.com/file/359071
[17]:https://opensource.com/article/17/7/brewing-beer-python-and-raspberry-pi?rate=fbKzT1V9gqGsmNCTuQIashC1xaHT5P_2LUaeTn6Kz1Y
[18]:https://www.openwest.org/custom/description.php?id=139
[19]:https://www.openwest.org/
[20]:https://opensource.com/user/145976/feed
[21]:https://www.flickr.com/photos/quinndombrowski/
[22]:https://creativecommons.org/licenses/by-sa/4.0/
[23]:https://github.com/DougEdey/SB_Elsinore_Server
[24]:https://opensource.com/tags/raspberry-pi
[25]:http://www.theelectricbrewery.com/
[26]:http://www.instructables.com/id/Electric-Brewery-Control-Panel-on-the-Cheap/
[27]:https://byo.com/hops/item/1325-rims-and-herms-brewing-advanced-homebrewing
[28]:http://theelectricbrewery.com/
[29]:https://en.wikipedia.org/wiki/1-Wire
[30]:https://smile.amazon.com/gp/product/B018KFX5X0/
[31]:http://amzn.to/2hupFCr
[32]:http://amzn.to/2hL8JDS
[33]:http://amzn.to/2i4DYwy
[34]:https://www.brewershardware.com/CF1412.html
[35]:https://www.raspberrypi.org/downloads/raspbian/
[36]:https://github.com/DougEdey/SB_Elsinore_Server
[37]:https://brewtronix.com/
[38]:http://dougedey.github.io/SB_Elsinore_Server/
[39]:http://www.craftbeerpi.com/
[40]:https://github.com/manuel83/craftbeerpi
[41]:https://www.nextthing.co/pages/chip
[42]:https://tilthydrometer.com/
[43]:https://opensource.com/users/docaedo
[44]:https://opensource.com/users/docaedo
[45]:https://opensource.com/article/17/7/brewing-beer-python-and-raspberry-pi#comments
[46]:http://www.susa.net/wordpress/2012/06/raspberry-pi-relay-using-gpio/