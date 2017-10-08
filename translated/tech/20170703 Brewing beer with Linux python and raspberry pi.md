用Linux，Python和树莓派酿制啤酒
============================================================

### 怎样在家用python和树莓派搭建一个家用便携的自制酿啤酒装置

 
![Brewing beer with Linux, Python, and Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/beer-drink-sample-sampler.png?itok=20jJLB8V "Brewing beer with Linux, Python, and Raspberry Pi")
Image by : 

[Quinn Dombrowski][21]. Modified by Opensource.com. [CC BY-SA 4.0][22].

大约十年前我开始酿制自制啤酒，和许多自己酿酒的人一样，我开始在厨房制造提纯啤酒。这需要一些设备并且做出来后确实是好的啤酒，最终，我用一个大的贮藏罐放入了所有大麦作为我的麦芽浆桶。几年之后我曾酿制了5加仑啤酒，但是酿制10加仑时会花费同样的时间和效用（只是容器比之前大些），之前我是这么做的。容量提升到10加仑之后，我偶然发现并意识到我真正需要的是将整个酿酒过程转换成全电子化的，用树莓派来运行它。

建造自己的家用电动化酿酒系统需要大量这方面的技术信息，许多学习酿酒的是在TheElectricBrewery.com这个网站起步的，只不过将那些控制版搭建在一起是十分复杂的，尽管最简单的办法在这个网站上总结的很好。当然你也能用一个小成本的方法并且依旧可以用相同的结果得到-用一个热水壶和热酒容器通过一个PID控制器来加热你的酿酒原料。但是我认为这有点太无聊（这也意味着你不能get到完成酿酒过程）

关于树莓派更多信息

*   [关于树莓派最新消息[1]

*   [树莓派是什么?][2]

*   [树莓派如何开始使用][3]

*   [发送给我们你的树莓派项目和教程][4]

### 需要用到的硬件

在我开始我得这个项目之前, 我决定开始买零件，我最基础的设计是一个可以将液体加热到5500w的热酒容器和开水壶，加一个活底的麦芽浆桶，我通过一个50的不锈钢线圈在热酒容器里让泵来再循环麦芽浆(a ["热量交换再循环麦芽浆系统, 也叫 HERMS][27]).同时我需要另一个泵来在热酒容器里循环水，并且把水传输到麦芽浆桶里，整个电子部件全部是用树莓派来控制的。


建立我得电子酿酒系统并且尽可能的自动化意味着我需要以下的东东：


*   一个5500瓦的电子加热酒精容器

*   能够放入加热酒精容器里的一英尺（0.5英寸）长的不锈钢线圈（热量交换再循环麦芽浆系统）

*   一个5500瓦的电子加热水壶

*   多个固态继电器加热开关

*   2个高温食品级泵

*   泵的开关用继电器

*   可拆除装置和一个硅管

*   不锈钢球阀

*   一个测量温度的探针

*   很多线

*   一个来容纳这些配件的电路盒子

### [aedo-f1.png][11]

![Brew system](https://opensource.com/sites/default/files/aedo-f1.png "Brew system")

酿酒系统 (photo by Christopher Aedo. [CC BY-SA 4.0)][5]

建立酿酒系统的电气化方面的细节The Electric Brewery这个网站概括的很好，这里我不再重复，当你计划用树莓派代替这个PID控制器的话，你可以读以下的建议。

一个重要的事情需要注意，固态继电器信号电压，许多教程建议使用一个12伏的固态继电器来关闭电路，树莓派的GPIO针插口只支持输出电压3伏，然而，必须购买继电器将电压变为3伏。

### [aedo-f2.png][12]

![Inkbird SSR](https://opensource.com/sites/default/files/aedo-f2.png "Inkbird SSR")

Inkbird SSR (photo by Christopher Aedo. [CC BY-SA 4.0)][6]

要运行酿酒系统，你的树莓派必须做两个关键事情：来自不同位置的敏感温度，用继电器开关来控制加热元件，树莓派很容易来处理这些任务。

这里有一些不同的方法来将温度传感器连到树莓派上，但是我找到了最方便的方法用单总线。这就可以让多个传感器分享相同的线路（实际上三根线），这三根线可以使酿酒系统的多个设备更方便的工作，如果你要从网上找一个DS18B20 防水的温度传感器，你将会找到更多的选择。我用的是日立DS18B20防水温度传感器。

要控制加热元件，树莓派包括几个用来软件寻址的总线扩展器（GPIO），它会通过在某个文件写入0或者1让你发送3.3v的电压到一个继电器，在我第一次了解树莓派是怎样工作的时候，这个用GPIO驱动继电器的树莓派教程对我来说是最有帮助的，总线控制器控制多个固态继电器，通过酿酒软件来直接控制加热元件的开关。

我第一次将所有部件放到这个电路盒子，因为这将成为一个滚动的小车，我要让他方便移动，而不是固定不动的，如果我有一个店（比如说在车库，工具房，或者地下室），我需要要用一个更大的电路盒挂到墙上，而现在我找到一个大小正好的防水工程盒子，能放进每件东西，最后它成为紧密的结合工具盒，并且能够工作。在左下角是和树莓派连接的为总线控制器到单总线温度探针和固态继电器的扩展板。

要保持240v的固态继电器温度不高，我在盒子上切了个洞，在盒子的外面用降温凝胶安装铜片散热片冷却cpu的温度。它工作的很好，盒子里没有温度上的问题了，在盒子盖上我放了两个开关为120v的插座，加两个240v的led来显示加热元件是否通电。我用干燥器的插座和插头很容易的开关电热水壶的连接。第一次尝试每件事情都弄好了。(决定第一次手画电路图.)


照片是从“概念”版的最终生产系统应该有两个固态继电器，以至于240v的电路两个针脚能够切换，另外我将通过软件来切换泵的开关，。现在他们通过盒子前面的物理开关控制，但是他们很容易用继电器控制。 


### [aedo-f3.png][13]

![Control box](https://opensource.com/sites/default/files/aedo-f3.png "Control box")

控制盒子 (photo by Christopher Aedo. [CC BY-SA 4.0)][7]

The only other thing I needed that was a little tricky to find was a compression fitting for the temperature probes. The probes were mounted in T fittings before the valve on the lowest bulkhead in both the HLT and the mash tun. As long as the liquid is flowing past the temp sensor, it's going to be accurate. I thought about adding a thermowell into the kettles as well, but realized that's not going to be useful for me based on my brewing process. Anyway, I purchased [1/4" compression fittings][34] and they worked out perfectly.

### Software

Once the hardware was sorted out, I had time to play with the software. I ran the latest [Raspbian distribution][35] on the Pi; nothing special was required on the operating-system side.

I started with [Strangebrew Elsinore][36] brewing software, which I had discovered when a friend asked whether I had heard of [Hosehead][37], a Raspberry Pi-based brewing controller. I thought Hosehead looked great, but rather than buying a brewing controller, I wanted the challenge of building my own.

Setting up Strangebrew Elsinore was straightforward—the [documentation][38] was thorough and I did not encounter any problems. Even though Strangebrew Elsinore was working fine, Java seemed to be taxing my first-generation Pi sometimes, and it crashed on me more than once. I also was sad to see development stall and there did not seem to be a big community of additional contributors (although there were—and still are—plenty of people using it).

### CraftBeerPi

Then I stumbled across [CraftBeerPI][39], which is written in Python and supported by a development community of active contributors. The original author (and current maintainer) Manuel Fritsch is great about handling contributions and giving feedback on issues that folks open. Cloning [the repo][40] and getting started only took me a few minutes. The README also has a good example of connecting DS1820 temp sensors, along with notes on interfacing hardware to a Pi or a [C.H.I.P. computer][41].

On startup, CraftBeerPi walks users through a configuration process that discovers the temperature probes available and lets you specify which GPIO pins are managing which pieces of equipment.

### [aedo-f4.png][14]

![CraftBeerPi](https://opensource.com/sites/default/files/images/life/aedo-f4.png "CraftBeerPi")

CraftBeerPi (photo by Christopher Aedo. [CC BY-SA 4.0)][8]

Running a brew with this system is easy. I can count on it holding temperatures reliably, and I can input steps for a multi-temp step mash. Using CraftBeerPi has made my brew days a little bit boring, but I'm happy to trade off the "excitement" of traditional manually managed propane burners for the efficiency and consistency of this system.

CraftBeerPI's user-friendliness inspired me to set up another controller to run a "fermentation chamber." In my case, that was a second-hand refrigerator I found for US$ 50 plus a $25 heater) on the inside. CraftBeerPI easily can control the cooling and heating elements, and you can set up multiple temperature steps. For instance, this graph shows the fermentation temperatures for a session IPA I made recently. The fermentation chamber held the fermenting wort at 67F for four days, then ramped up one degree every 12 hours until it was at 72F. That temp was held for a two-day diacetyl rest. After that it was set to drop down to 65F for five days, during which time I "dry hopped" the beer. Finally, the beer was cold-crashed down to 38F. CraftBeerPI made adding each step and letting the software manage the fermentation easy.

### [aedo-f5.png][15]

![SIPA fermentation profile](https://opensource.com/sites/default/files/aedo-f5.png "SIPA fermentation profile")

SIPA fermentation profile (photo by Christopher Aedo. [CC BY-SA 4.0)][9]

I have also been experimenting with the [TILT hydrometer][42] to monitor the gravity of the fermenting beer via a Bluetooth-connected floating sensor. There are integration plans for this to get it working with CraftBeerPI, but for now it logs the gravity to a Google spreadsheet. Once this hydrometer can talk to the fermentation controller, setting automated fermentation profiles that take action directly based on the yeast activity would be easy—rather than banking on primary fermentation completing in four days, you can set the temperature ramp to kick off after the gravity is stable for 24 hours.

As with any project like this, imaging and planning improvements and additional components is easy. Still, I'm happy with where things stand today. I've brewed a lot of beer with this setup and am hitting the expected mash efficiency every time, and the beer has been consistently tasty. My most important customer—me!—is pleased with what I've been putting on tap in my kitchen.

### [aedo-f6.png][16]

![Homebrew on tap](https://opensource.com/sites/default/files/aedo-f6.png "Homebrew on tap")

Homebrew on tap (photo by Christopher Aedo. [CC BY-SA 4.0)][10]

 _This article is based on Christopher's OpenWest talk, [Brewing Beer with Linux, Python and a RaspberryPi][18]. [OpenWest][19] will be held July 12-15, 2017 in Salt Lake City, Utah._

--------------------------------------------------------------------------------

作者简介：

Christopher Aedo - Christopher Aedo has been working with and contributing to open source software since his college days. Most recently he can be found leading an amazing team of upstream developers at IBM who are also developer advocates. When he’s not at work or speaking at a conference, he’s probably using a RaspberryPi to brew and ferment a tasty homebrew in Portland OR.


via: https://opensource.com/article/17/7/brewing-beer-python-and-raspberry-pi

作者：[  Christopher Aedo][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
