6 个开源的家庭自动化工具
======

> 用这些开源软件解决方案构建一个更智能的家庭。
 
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc_520x292_openlightbulbs.png?itok=nrv9hgnH)

[物联网][13] 不仅是一个时髦词，在现实中，自 2016 年我们发布了一篇关于家庭自动化工具的评论文章以来，它也在迅速占领着我们的生活。在 2017，[26.5% 的美国家庭][14]  已经使用了一些智能家居技术；预计五年内，这一数字还将翻倍。

随着这些数量持续增加的各种设备的使用，可以帮助你实现对家庭的自动化管理、安保、和监视，在家庭自动化方面，从来没有像现在这样容易和更加吸引人过。不论你是要远程控制你的 HVAC 系统，集成一个家庭影院，保护你的家免受盗窃、火灾、或是其它威胁，还是节省能源或只是控制几盏灯，现在都有无数的设备可以帮到你。

但同时，还有许多用户担心安装在他们家庭中的新设备带来的安全和隐私问题 —— 这是一个很现实也很 [严肃的问题][15]。他们想要去控制有谁可以接触到这个重要的系统，这个系统管理着他们的应用程序，记录了他们生活中的点点滴滴。这种想法是可以理解的：毕竟在一个连你的冰箱都是智能设备的今天，你不想要一个基本的保证吗？甚至是如果你授权了设备可以与外界通讯，它是否是仅被授权的人访问它呢？

[对安全的担心][16] 是为什么开源对我们将来使用的互联设备至关重要的众多理由之一。由于源代码运行在他们自己的设备上，完全可以去搞明白控制你的家庭的程序，也就是说你可以查看它的代码，如果必要的话甚至可以去修改它。

虽然联网设备通常都包含它们专有的组件，但是将开源引入家庭自动化的第一步是确保你的设备和这些设备可以共同工作 —— 它们为你提供一个接口 —— 并且是开源的。幸运的是，现在有许多解决方案可供选择，从 PC 到树莓派，你可以在它们上做任何事情。

这里有几个我比较喜欢的。

### Calaos

[Calaos][17] 是一个设计为全栈的家庭自动化平台，包含一个服务器应用程序、触摸屏界面、Web 应用程序、支持 iOS 和 Android 的原生移动应用、以及一个运行在底层的预配置好的 Linux 操作系统。Calaos 项目出自一个法国公司，因此它的支持论坛以法语为主，不过大量的介绍资料和文档都已经翻译为英语了。

Calaos 使用的是 [GPL][18] v3 的许可证，你可以在 [GitHub][19] 上查看它的源代码。

### Domoticz

[Domoticz][20] 是一个有大量设备库支持的家庭自动化系统，在它的项目网站上有大量的文档，从气象站到远程控制的烟雾探测器，以及大量的第三方 [集成软件][21] 。它使用一个 HTML5 前端，可以从桌面浏览器或者大多数现代的智能手机上访问它，它是一个轻量级的应用，可以运行在像树莓派这样的低功耗设备上。

Domoticz 是用 C++ 写的，使用 [GPLv3][22] 许可证。它的 [源代码][23] 在 GitHub 上。

### Home Assistant

[Home Assistant][24] 是一个开源的家庭自动化平台，它可以轻松部署在任何能运行 Python 3 的机器上，从树莓派到网络存储（NAS），甚至可以使用 Docker 容器轻松地部署到其它系统上。它集成了大量的开源和商业的产品，允许你去连接它们，比如，IFTTT、天气信息、或者你的 Amazon Echo 设备，去控制从锁到灯的各种硬件。

Home Assistant 以 [MIT 许可证][25] 发布，它的源代码可以从 [GitHub][26] 上下载。

### MisterHouse

从 2016 年起，[MisterHouse][27] 取得了很多的进展，我们把它作为一个“可以考虑的另外选择”列在这个清单上。它使用 Perl 脚本去监视任何东西，它可以通过一台计算机来查询或者控制任何可以远程控制的东西。它可以响应语音命令，查询当前时间、天气、位置、以及其它事件，比如去打开灯、唤醒你、记下你喜欢的电视节目、通报呼入的来电、开门报警、记录你儿子上了多长时间的网、如果你女儿汽车超速它也可以告诉你等等。它可以运行在 Linux、macOS、以及 Windows 计算机上，它可以读/写很多的设备，包括安全系统、气象站、来电显示、路由器、机动车位置系统等等。

MisterHouse 使用 [GPLv2][28] 许可证，你可以在 [GitHub][29] 上查看它的源代码。

### OpenHAB

[OpenHAB][30]（开放家庭自动化总线的简称）是在开源爱好者中所熟知的家庭自动化工具，它拥有大量用户的社区以及支持和集成了大量的设备。它是用 Java 写的，OpenHAB 非常轻便，可以跨大多数主流操作系统使用，它甚至在树莓派上也运行的很好。支持成百上千的设备，OpenHAB 被设计为与设备无关的，这使开发者在系统中添加他们的设备或者插件很容易。OpenHAB 也支持通过 iOS 和 Android 应用来控制设备以及设计工具，因此，你可以为你的家庭系统创建你自己的 UI。

你可以在 GitHub 上找到 OpenHAB 的 [源代码][31]，它使用 [Eclipse 公共许可证][32]。

### OpenMotics

[OpenMotics][33] 是一个开源的硬件和软件家庭自动化系统。它的设计目标是为控制设备提供一个综合的系统，而不是从不同的供应商处将各种设备拼接在一起。不像其它的系统主要是为了方便改装而设计的，OpenMotics 专注于硬件解决方案。更多资料请查阅来自 OpenMotics 的后端开发者 Frederick Ryckbosch的 [完整文章][34] 。

OpenMotics 使用 [GPLv2][35] 许可证，它的源代码可以从 [GitHub][36] 上下载。

当然了，我们的选择不仅有这些。许多家庭自动化爱好者使用不同的解决方案，甚至是他们自己动手做。其它用户选择使用单独的智能家庭设备而无需集成它们到一个单一的综合系统中。

如果上面的解决方案并不能满足你的需求，下面还有一些潜在的替代者可以去考虑：

*   [EventGhost][1] 是一个开源的（[GPL v2][2]）家庭影院自动化工具，它只能运行在 Microsoft Windows PC 上。它允许用户去控制多媒体电脑和连接的硬件，它通过触发宏指令的插件或者定制的 Python 脚本来使用。 
*   [ioBroker][3] 是一个基于 JavaScript 的物联网平台，它能够控制灯、锁、空调、多媒体、网络摄像头等等。它可以运行在任何可以运行 Node.js 的硬件上，包括 Windows、Linux、以及 macOS，它使用 [MIT 许可证][4]。 
*   [Jeedom][5] 是一个由开源软件（[GPL v2][6]）构成的家庭自动化平台，它可以控制灯、锁、多媒体等等。它包含一个移动应用程序（Android 和 iOS），并且可以运行在 Linux PC 上；该公司也销售 hub，它为配置家庭自动化提供一个现成的解决方案。
*   [LinuxMCE][7] 标称它是你的多媒体与电子设备之间的“数字粘合剂”。它运行在 Linux（包括树莓派）上，它基于 Pluto 开源 [许可证][8] 发布，它可以用于家庭安全、电话（VoIP 和语音信箱）、A/V 设备、家庭自动化、以及玩视频游戏。 
*   [OpenNetHome][9]，和这一类中的其它解决方案一样，是一个控制灯、报警、应用程序等等的一个开源软件。它基于 Java 和 Apache Maven，可以运行在 Windows、macOS、以及 Linux —— 包括树莓派，它以 [GPLv3][10] 许可证发布。
*   [Smarthomatic][11] 是一个专注于硬件设备和软件的开源家庭自动化框架，而不仅是用户界面。它基于 [GPLv3][12] 许可证，它可用于控制灯、电器、以及空调、检测温度、提醒给植物浇水。

现在该轮到你了：你已经准备好家庭自动化系统了吗？或者正在研究去设计一个。你对家庭自动化的新手有什么建议，你会推荐什么样的系统？

--------------------------------------------------------------------------------

via: https://opensource.com/life/17/12/home-automation-tools

作者：[Jason Baker][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jason-baker
[1]:http://www.eventghost.net/
[2]:http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
[3]:http://iobroker.net/
[4]:https://github.com/ioBroker/ioBroker#license
[5]:https://www.jeedom.com/site/en/index.html
[6]:http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
[7]:http://www.linuxmce.com/
[8]:http://wiki.linuxmce.org/index.php/License
[9]:http://opennethome.org/
[10]:https://github.com/NetHome/NetHomeServer/blob/master/LICENSE
[11]:https://www.smarthomatic.org/
[12]:https://github.com/breaker27/smarthomatic/blob/develop/GPL3.txt
[13]:https://opensource.com/resources/internet-of-things
[14]:https://www.statista.com/outlook/279/109/smart-home/united-states
[15]:http://www.crn.com/slide-shows/internet-of-things/300089496/black-hat-2017-9-iot-security-threats-to-watch.htm
[16]:https://opensource.com/business/15/5/why-open-source-means-stronger-security
[17]:https://calaos.fr/en/
[18]:https://github.com/calaos/calaos-os/blob/master/LICENSE
[19]:https://github.com/calaos
[20]:https://domoticz.com/
[21]:https://www.domoticz.com/wiki/Integrations_and_Protocols
[22]:https://github.com/domoticz/domoticz/blob/master/License.txt
[23]:https://github.com/domoticz/domoticz
[24]:https://home-assistant.io/
[25]:https://github.com/home-assistant/home-assistant/blob/dev/LICENSE.md
[26]:https://github.com/balloob/home-assistant
[27]:http://misterhouse.sourceforge.net/
[28]:http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[29]:https://github.com/hollie/misterhouse
[30]:http://www.openhab.org/
[31]:https://github.com/openhab/openhab
[32]:https://github.com/openhab/openhab/blob/master/LICENSE.TXT
[33]:https://www.openmotics.com/
[34]:https://opensource.com/life/14/12/open-source-home-automation-system-opemmotics
[35]:http://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[36]:https://github.com/openmotics
