COOVA：硬件，软件和标准
--------------------------------------------
Coova背后的理念非常简单：给你提供可以用来管理与访问自己WiFi网络的开源并免费的工具与服务，你可以有最大的自由度去使用它们。我们的哲学就是：你不需要使用任何特别的硬件（如[FON][1]或者[Meraki][2]）或软件（如[Whisher][3]）。从本质上来说，Coova是开放并且基于标准的，也就是说它可以兼容尽可能广泛的硬件，协议与服务。Coova将“[Carrier][4]”的grade特色与服务带向了开源界与服务界。它也让笨拙的router更智能了一点--废物利用很不错，不是吗？

在Coova中，你可以根据你要构建的网络的种类与你访问这些网络的方式来挑选你需要的软件与服务。下面是一些Coova技术的典型应用：

#### 使用[CoovaAP][5]来简化[CoovaChilli][6]（或[WiFiDog][7]）的配置：

* 使用或者不适用CoovaAAA服务，
* 使用RADIUS或者本机定义的用户，
* 使用定制的“内部”入网门户，或者
* 配置使用你自己的门户或者使用RADIUS服务。

#### 在[CoovaAP][5]或者你自己的固件或者服务器中使用[CoovaChilli][6]，以实现如下功能：

* 使用CoovaAAA或者其他门户/RADIUS服务，加强入网门户和身份认证，
* 与多种商业服务协调工作（具体询问供应商），
* 与802.1X身份认证整合以提供账号与访问限制。

#### 使用[CoovaAAA][8]管理你的网络的访问：

* 使用CoovaChilli/AP入网门户，
* 使用打过补丁的WiFiDog入网门户，
* 使用[你自己的入网门户][9]（不需要高级编程），
* 使用我们的Facebook或者标准入网门户应用，
* 使用商业访问控制器（如Colubris），或者
* 使用任何支持WPA Enterprise/802.1X（如AirPort Extreme）的router.

#### 使用和共享你的[CoovaAAA][8]控制下的网络：

* 使用一个账户既登陆你的入网门户也登陆你的安全WPA Enterprise网络（使用任何支持802.1X的设备，如你的笔记本电脑或者Nokia手机）
* 在任何与你共享过的[CoovaAAA][8]地点使用你的账号，
* 选择性给你要共享的个人或者全体共享你的网络，或者
* 依照[OpenID][10]登陆或者Facebook粉丝/朋友共享网络。

#### 在Firefox或者你的手机上各自使用[CoovaFX][11]与[CoovaSX][12]，来通过WISPr标准登陆一个入网门户和一个预先配置好的账号。WISPr被CoovaAAA，绝大部分的商业访问控制器和服务供应商支持。

#### 使用[JRadius][13]为你的网络编写你自己的RADIUS设置逻辑。

如果你正在构建一个WiFi网络，但在本网站上未找到任何可以帮助你的信息，那你可能看得不够用心。虽然已经说过，我们确实承认我们需要更多的文档。正因为如此，我们呼吁研发与用户社区在wiki，[论坛][14]和[mailing lists][15]上给我们提供帮助。注意：我们确实关闭了一些页面来阻止SPAM（垃圾邮件）来创建新的页面或者在mailing lists中请求获得更多的权限。

我们也希望听到更多的关于你如何使用或者在何处使用Coova的消息。实际上，我的一个朋友最近正在多米尼亚共和国度假，他很惊奇地发现在宾馆中可以找到Coova的信号。他们为他们的WiFi采用了CoovaAP技术。像这样的故事非常棒，请让他们出现在论坛中！

__________________________________________________________________________
via: http://coova.org/node/133
译者： [Hao-Ding](https://github.com/Hao-Ding) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]: https://corp.fon.com/en
[2]: https://meraki.cisco.com/
[3]: http://www.whisher.com/
[4]: https://meraki.cisco.com/blog/2008/04/new-carrier-services/
[5]: http://coova.org/CoovaAP
[6]: http://coova.org/CoovaChilli
[7]: http://dev.wifidog.org/
[8]: http://coova.org/CoovaAAA
[9]: http://coova.org/node/80
[10]: http://coova.org/node/71
[11]: http://www.coova.com/CoovaFX
[12]: http://www.coova.com/CoovaSX
[13]: http://coova.org/JRadius
[14]: http://coova.org/forum/
[15]: http://coova.org/MailingLists