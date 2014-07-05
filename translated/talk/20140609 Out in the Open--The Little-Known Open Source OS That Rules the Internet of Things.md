Contiki：深藏不露，主宰物联网
================================================================================
![](http://www.wired.com/wp-content/uploads/2014/06/Contiki-ipv6-rpl-cooja-simulation.png)
Image: Adnk/[Wikipedia][1]

可以毫不夸张地说几乎任何东西都可以连接到网络上，比如电灯、恒温器、咖啡壶，甚至是獾。
 
獾很多时间都在地下，这给生物学家和动物学家跟踪獾的行踪和活动带来了困难，因为我们常用的 GPS 在地下或封闭环境中不起作用。但就在大概五年前，牛津大学的 Andrew Markham 和 Niki Trigoni 发明了一种可以在地下工作的无线追踪系统，[成功地解决了这个问题][2]。这个灵巧的系统并不是独自开发的结果。像其他科学家一样，他们求助于开源从而避免从头构建基本组件，其中使用了一个叫做 [Contiki][3] 的开源操作系统。

“Contiki使快速原型设计和硬件平台移植变得很容易”，现在任牛津大学副教授的 Markham 表示。

虽然 Contiki 不像 Windows、OS X 和 Linux 那么有名，但十几年来，它一直被黑客、专业学者和公司用于构建传感器、追踪器和基于网络的自动化系统等网络互联设备。它轻量，免费，成熟，深受开发者的喜爱。它为开发者和创业者提供了一个平台，让他们可以开发物联网上负责网络连接的小插件或者小工具，而不用再去构建这些工具需要的底层操作系统。

也许 Contiki 受欢迎的最大原因是它真的非常小巧。举个例子，如果运行 Linux 需要 1MB RAM，运行 Contiki只要几 KB 就够了。它的发明者 Adam Dunkels 成功地将包括图形用户界面、网络软件和一个 web 浏览器的整个操作系统集成到 30KB 空间里。这使得它适合在小型低能耗芯片上运行。同时它也被移植到一些老的操作系统，比如 Apple IIe、Commodore 64。


![Adam Dunkels. Photo: Sara Arnald](http://www.wired.com/wp-content/uploads/2014/06/Adam_Dunkels.jpg)
Adam Dunkels. Photo: Sara Arnald

微软最近[公布了物联网 Windows 系统][4]，Contiki 很快将面临这些大公司的竞争。虽然微软的新操作系统将对9英寸以下设备免费，但并不开源，而 Contiki 在这方面超前了11年。

Contiki 成型于2003年，但它的起源可以追溯到 Dunkels 的大学时代。那个时候他正在做一个项目，用无线传感器跟踪冰球运动员的重要生理体征。“当时，我们说服他们把传感器固定在鼻子上以便监测呼吸率，”Dunkels 回忆道。

为了使传感器正常工作，Dunkels 得给它们写软件连接网络。他把最终代码叫做[LwIP][5](light weight internet protocol)。虽然 LwIP 仍然用在微控制器和其他产品上，但 Dunkels 觉得它还不够轻巧。于是2003年，他又开发了 microIP，并在此基础上开发出 Contiki。Contiki 迅速受到研究者和业余爱好者的青睐，最近几年也吸引了一些商业用户，并被应用在 [Rad-DX][6] 辐射探测器和 [Zolertia][7] 噪音监测系统上。

一月份， [Nest 被 Google 以32亿美元收购][8]时，Dunkels 强调网络互联设备在工业和建筑自动化等领域已应用多年。“在CES上能看到只是这些应用的一小部分，” Dunkels 说。

不少消费类科技公司也开始和 Contiki 合作，如智能电灯 [LiFX][9]，还有 Nest 的竞争者 [Tado][10]。


为了支持 Contiki 迅速发展的商业应用，Dunkels 辞去了在大学研究所的工作成立了 [Thingsquare][11]，一家致力于为 Contiki 设备提供云服务后台支持的初创公司。目的是为了方便开发者将他们的硬件设备跟智能手机和网络连接起来。Thingsquare 管理服务器，同时提供管理网络上设备所需的所有软件。

--------------------------------------------------------------------------------

via: http://www.wired.com/2014/06/contiki/

译者：[toknow-gh](https://github.com/toknow-gh) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://en.wikipedia.org/wiki/File:Contiki-ipv6-rpl-cooja-simulation.png
[2]:http://www.cs.ox.ac.uk/projects/WILDSENSING/
[3]:http://www.contiki-os.org/
[4]:http://www.wired.com/2014/04/free-windows/
[5]:https://savannah.nongnu.org/projects/lwip/
[6]:http://www.dtectsystems.com/rad-DX_page.html
[7]:http://zolertia.com/home
[8]:http://www.wired.com/2014/01/googles-3-billion-nest-buy-finally-make-internet-things-real-us/
[9]:http://lifx.co/
[10]:http://www.tado.com/de-en/
[11]:http://www.thingsquare.com/
