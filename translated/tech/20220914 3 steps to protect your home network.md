[#]: subject: "3 steps to protect your home network"
[#]: via: "https://opensource.com/article/22/9/protect-home-network"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "PeterPan0106"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

保护家庭网络三部曲
======
都有谁可以访问你的家庭网络？随着物联网（IoT）的普及，有时在运行在你家庭网络上的服务比你想象的更多。我们应当设法保护它免受不需要的访问。

今天，互联网连接的典型结构是家里有一个**路由器**，通常是一个位于你家某个地方的小盒子，它充当了通往互联网世界的网关。路由器创建了一个本地网络，你将你的设备连接到这个本地网络，包括你的电脑、手机、电视、游戏机，以及其他任何需要连接到互联网或相互连接的设备。我们很容易将路由器当作一个分界线，一边是互联网而另一边是你的设备。但这是一个可怕的误解，因为在现实中，你的路由器的一边是整个*计算机网络世界*，另一边是你的数字生活。当你直接使用互联网时，你是在访问别人的计算机网络的共享区域。当你不使用互联网时，它却并没有消失，有很多脚本和程序被设计用以访问数以百万计的路由器，试图找到开放的端口或服务。随着物联网（IoT）的普及，有时在运行在你家庭网络上的服务比你想象的更多。通过以下三个步骤，你可以审计并保护你的家庭网络免受不必要的访问和攻击。

### 1. 协议先行

路由器的部分工作是将互联网与你的家庭网络分开。但当你访问互联网时，你邀请互联网的某些部分进入你的家庭。这意味着你创建了一个例外规则，绕过了阻止互联网进入你的本地网络的一般规则。

在许多网站上，你的路由器仅允许文本内容的访问。例如，当你访问你最喜欢的博客网站，阅读最新的科技新闻时，你下载了几页文字。你阅读文本，然后继续前进。这是一个简单的一对一的连接。

然而，HTTPS协议是强大的，在互联网上运行的应用程序也充满了多样性。例如，当你访问Opensource.com时，你不只是在下载文本。你会得到图形，也许还有脚本或电子书。你还在后台下载cookies，这有助于网站管理员了解谁在访问网站、加强对移动设备的支持、为更好的可访问性提供新设计并了解读者喜欢的内容。当你网上冲浪时，你可能不会想到cookies或流量分析是与你交互的东西，它是被“藏入”页面交互的东西，因为HTTPS协议的设计是广泛而通用的，在多数场景被高度信任。当你通过HTTPS访问一个网站时（或者说，在一个网络浏览器中），你可能在不知情的情况下默认同意自动下载文件，但你认为这些文件是有用的和不引人注目的。对于一种旨在减少信任的文件共享模式，你可以尝试[Gemini][3]或[Gopher][4]协议。

当你加入一个视频会议时，你也使用了类似的协议。你不仅要下载页面上的文字、用于流量监控的cookies，还要下载视频和音频材料。

有些网站的设计甚至更进一步，它们被设计成允许用户分享其电脑屏幕，有时甚至是对他们电脑的控制。这样设计的初衷是有助于远程技术人员修复电脑上的问题，但在现实中，用户可能被欺骗访问这一网站，导致财务凭证和个人数据被盗。

如果一个提供文字文章的网站要求你允许它在你阅读时调用网络摄像头，你理应高度警惕。当一个设备需要访问互联网时，你也应当保持同样的谨慎和警惕。当你把一个设备连接到网络时，重要的是要关注你同意了何种隐性协议。一个旨在控制你房子里的照明的设备不应该*要求*互联网接入，但事实上许多设备需要并且没有明确说明你授予该设备什么权限。许多物联网设备都*希望*接入互联网，这样你就可以在离家时通过互联网访问该设备。这也是"智慧家庭"的部分吸引力。然而，我们不可能知道所有设备运行的是什么代码。在可能的情况下，使用开放源码和值得信赖的软件，如[Home Assistant][5]来与你的物联网设备对接。

### 2. 创建访客网络

许多现代路由器可以为你的家庭创建第二个网络（通常在配置面板中称为 "访客网络"）。你可能觉得你不需要访客网络，但实际上，访客网络是十分有意义的。它旨在为访问你房子的人提供互联网访问，而你不需要告诉他们你的私人网络密码。例如在我家的门厅里，我有一个牌子标明了访客网络的名称和密码。任何来访的人都可以加入该网络以访问互联网。

另一方面可以用于物联网、边缘设备和家庭实验室的应用。当我去年购买 "可编程 "的圣诞灯时，我惊讶地发现，为了连接这些灯，它们必须连接到互联网。当然，这些来自无名工厂的50美元的灯没有附带源代码，也没有任何方法可以与嵌入在适配器中的固件进行交互或检查，所以我对我同意将它们连接到我的本地网络有一定的顾虑。它们已经被永久地归入了我的访客网络。

每个路由器供应商都是不同的，所以没有关于如何在你的路由器上创建一个 "沙盒 "访客网络的通用指令。一般来说，你通过一个网络浏览器访问你的家庭路由器。你的路由器的地址有时印在路由器的底部，它以192.168或10开头。

访问路由器地址，用你配置互联网服务时使用的凭证登录。这通常是简单的 "admin "和一个数字密码（有时，这个密码也印在路由器上）。如果你不知道登录方式，请致电给你的互联网供应商或者制造商咨询。

在图形界面中，找到 "访客网络 "的面板。这个选项在我的路由器的**高级**配置中，但它可能在你的路由器的其他地方，它甚至可能不叫 "访客网络"（或者它甚至可能不是一个选项）。具体情况因厂商而异。

![创建访客网络][7]

Image by: (Opensource.com, CC BY-SA 4.0)

这可能需要耐心的寻找。如果你发现你的设备有这个选择，那么你可以为访客建立一个访客网络，包括在不受信任的灯泡上运行的应用程序。

### 3. 配置防火墙

你的路由器可能已经存在一个默认运行的防火墙。防火墙将不需要的流量挡在你的网络之外，通常是将传入的数据包限制在HTTP和HTTPS（网络浏览器流量）以及其他一些常用的协议上，并拒绝不是你发起的请求。你可以通过登录你的路由器并寻找 "防火墙 "或 "安全 "设置来检查防火墙是否正在运行。

然而，许多设备可以运行它们自己的防火墙。网络之所以被称为*网络*是因为在网络上的设备互相能进行连接。在设备之间设置防火墙，就像在你的房子里锁上一扇门。客人可以在大厅里游荡，但如果没有合适的钥匙，他们就不会被邀请进入你的私人办公室。

在Linux上，你可以使用[firewalld][8]接口和[firewall-cmd][9]命令来配置你的防火墙。在其他操作系统上，防火墙有时在一个标有 "安全 "或 "共享 "的控制面板中（有时两者都有）。 大多数默认的防火墙设置只允许出站流量（即你通过打开浏览器并导航到一个网站而启动的流量）和响应你的请求的入站流量（即响应你的导航的网络数据）。不是由你发起的传入流量会被阻止。

你可以根据需要配置相关规则以允许特定的流量，例如[SSH连接][10]，[VNC连接][11]，或[游戏服务器][12]主机。

### 监控你的网络

These techniques help build up your awareness of what's happening around you. The next step is to [monitor your network][13]. You can start simple, for instance by running [Fail2ban][14] on a test server on your guest network. Take a look at logs, if your router provides them. You don't have to know everything about TCP/IP and packets and other advanced subjects to see that the Internet is a busy and noisy place, and seeing that for yourself is great inspiration to take precautions when you set up a new device, whether it's IoT, mobile, a desktop or laptop, a game console, or a [Raspberry Pi][15], in your home.
这些技巧有助于建立起你对周围发生的事情的认识。下一步是[监控你的网络][13]。你可以从简单的开始，例如在你的访客网络的测试服务器上运行[Fail2ban][14]。看一下日志，如果你的路由器提供日志的话。你不必对TCP/IP和数据包以及其他进阶知识了如指掌，就可以看到互联网是一个繁忙而嘈杂的地方，当你在家里安装一个新设备时，无论是物联网、移动设备、台式机或笔记本电脑、游戏机，甚至是[树莓派][15]，而亲身体会到这一点对你采取预防措施有很大启发。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/protect-home-network

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[PeterPan0106](https://github.com/PeterPan0106)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/wfh_work_home_laptop_work.png
[2]: https://opensource.com/article/20/1/open-source-networking
[3]: https://opensource.com/article/20/10/gemini-internet-protocol
[4]: https://opensource.com/article/16/12/yearbook-compute-its-1989#gopher
[5]: https://opensource.com/article/20/12/home-assistant
[6]: https://opensource.com/article/20/11/wireless-protocol-home-automation
[7]: https://opensource.com/sites/default/files/2022-08/router-guest-network.jpg
[8]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[9]: https://www.redhat.com/sysadmin/secure-linux-network-firewall-cmd
[10]: https://www.redhat.com/sysadmin/access-remote-systems-ssh
[11]: https://www.redhat.com/sysadmin/accessing-remote-desktops
[12]: https://opensource.com/article/18/5/maptool
[13]: https://opensource.com/article/19/2/network-monitoring-tools
[14]: https://www.redhat.com/sysadmin/protect-systems-fail2ban
[15]: https://opensource.com/article/22/3/raspberry-pi-projects-2022
