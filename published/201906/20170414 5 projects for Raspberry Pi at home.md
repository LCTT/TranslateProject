[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10936-1.html)
[#]: subject: (5 projects for Raspberry Pi at home)
[#]: via: (https://opensource.com/article/17/4/5-projects-raspberry-pi-home)
[#]: author: (Ben Nuttall  https://opensource.com/users/bennuttall)

5 个可在家中使用的树莓派项目
======================================

![5 projects for Raspberry Pi at home][1]

[树莓派][2] 电脑可被用来进行多种设置用于不同的目的。显然它在教育市场帮助学生在教室和创客空间中学习编程与创客技巧方面占有一席之地，它在工作场所和工厂中有大量行业应用。我打算介绍五个你可能想要在你的家中构建的项目。

### 媒体中心

在家中人们常用树莓派作为媒体中心来服务多媒体文件。它很容易搭建，树莓派提供了大量的 GPU（图形处理单元）运算能力来在大屏电视上渲染你的高清电视节目和电影。将 [Kodi][3]（从前的 XBMC）运行在树莓派上是一个很棒的方式，它可以播放你的硬盘或网络存储上的任何媒体。你同样可以安装一个插件来播放 YouTube 视频。

还有几个略微不同的选择，最常见的是 [OSMC][4]（开源媒体中心）和 [LibreELEC][5]，都是基于 Kodi 的。它们在放映媒体内容方面表现的都非常好，但是 OSMC 有一个更酷炫的用户界面，而 LibreElec 更轻量级。你要做的只是选择一个发行版，下载镜像并安装到一个 SD 卡中（或者仅仅使用 [NOOBS][6]），启动，然后就准备好了。

![LibreElec ][7]

*LibreElec;树莓派基金会, CC BY-SA*

![OSMC][8]

*OSMC.tv, 版权所有, 授权使用*

在往下走之前，你需要决定[使用哪种树莓派][9]。这些发行版在任何树莓派（1、2、3 或 Zero）上都能运行，视频播放在这些树莓派中的任何一个上都能胜任。除了 Pi 3（和 Zero W）有内置 Wi-Fi，唯一可察觉的不同是用户界面的反应速度，在 Pi 3 上更快。Pi 2 也不会慢太多，所以如果你不需要 Wi-Fi 它也是可以的，但是当切换菜单时，你会注意到 Pi 3 比 Pi 1 和 Zero 表现的更好。

### SSH 网关

如果你想从外部网络访问你的家庭局域网的电脑和设备，你必须打开这些设备的端口来允许外部访问。在互联网中开放这些端口有安全风险，意味着你总是你总是处于被攻击、滥用或者其他各种未授权访问的风险中。然而，如果你在你的网络中安装一个树莓派，并且设置端口映射来仅允许通过 SSH 访问树莓派，你可以这么用来作为一个安全的网关来跳到网络中的其他树莓派和 PC。

大多数路由允许你配置端口映射规则。你需要给你的树莓派一个固定的内网 IP 地址来设置你的路由器端口 22 映射到你的树莓派端口 22。如果你的网络服务提供商给你提供了一个静态 IP 地址，你能够通过 SSH 和主机的 IP 地址访问（例如，`ssh pi@123.45.56.78`）。如果你有一个域名，你可以配置一个子域名指向这个 IP 地址，所以你没必要记住它（例如，`ssh pi@home.mydomain.com`）。

![][11]

然而，如果你不想将树莓派暴露在互联网上，你应该非常小心，不要让你的网络处于危险之中。如果你遵循一些简单的步骤来使它更安全：

1. 大多数人建议你更换你的登录密码（有道理，默认密码 “raspberry” 是众所周知的），但是这不能阻挡暴力攻击。你可以改变你的密码并添加一个双重验证（所以你需要你的密码*和*一个手机生成的与时间相关的密码），这么做更安全。但是，我相信最好的方法阻止入侵者访问你的树莓派是在你的 SSH 配置中[禁止密码认证][12]，这样只能通过 SSH 密匙进入。这意味着任何试图猜测你的密码尝试登录的人都不会成功。只有你的私有密匙可以访问。简单来说，很多人建议将 SSH 端口从默认的 22 换成其他的，但是通过简单的 [Nmap][13] 扫描你的 IP 地址，你信任的 SSH 端口就会暴露。
2. 最好，不要在这个树莓派上运行其他的软件，这样你不会意外暴露其他东西。如果你想要运行其他软件，你最好在网络中的其他树莓派上运行，它们没有暴露在互联网上。确保你经常升级来保证你的包是最新的，尤其是 `openssh-server` 包，这样你的安全缺陷就被打补丁了。
3. 安装 [sshblack][14] 或 [fail2ban][15] 来将任何表露出恶意的用户加入黑名单，例如试图暴力破解你的 SSH 密码。

使树莓派安全后，让它在线，你将可以在世界的任何地方登录你的网络。一旦你登录到你的树莓派，你可以用 SSH 访问本地网络上的局域网地址（例如，192.168.1.31）访问其他设备。如果你在这些设备上有密码，用密码就好了。如果它们同样只允许 SSH 密匙，你需要确保你的密匙通过 SSH 转发，使用 `-A` 参数：`ssh -A pi@123.45.67.89`。

### CCTV / 宠物相机

另一个很棒的家庭项目是安装一个相机模块来拍照和录视频，录制并保存文件，在内网或者外网中进行流式传输。你想这么做有很多原因，但两个常见的情况是一个家庭安防相机或监控你的宠物。

[树莓派相机模块][16] 是一个优秀的配件。它提供全高清的相片和视频，包括很多高级配置，很[容易编程][17]。[红外线相机][18]用于这种目的是非常理想的，通过一个红外线 LED（树莓派可以控制的），你就能够在黑暗中看见东西。

如果你想通过一定频率拍摄静态图片来留意某件事，你可以仅仅写一个简短的 [Python][19] 脚本或者使用命令行工具 [raspistill][20], 在 [Cron][21] 中规划它多次运行。你可能想将它们保存到 [Dropbox][22] 或另一个网络服务，上传到一个网络服务器，你甚至可以创建一个[web 应用][23]来显示他们。

如果你想要在内网或外网中流式传输视频，那也相当简单。在 [picamera 文档][24]中（在 “web streaming” 章节）有一个简单的 MJPEG（Motion JPEG）例子。简单下载或者拷贝代码到文件中，运行并访问树莓派的 IP 地址的 8000 端口，你会看见你的相机的直播输出。

有一个更高级的流式传输项目 [pistreaming][25] 也可以，它通过在网络服务器中用 [JSMpeg][26] （一个 JavaScript 视频播放器）和一个用于相机流的单独运行的 websocket。这种方法性能更好，并且和之前的例子一样简单，但是如果要在互联网中流式传输，则需要包含更多代码，并且需要你开放两个端口。

一旦你的网络流建立起来，你可以将你的相机放在你想要的地方。我用一个来观察我的宠物龟：

![Tortoise ][27]

*Ben Nuttall, CC BY-SA*

如果你想控制相机位置，你可以用一个舵机。一个优雅的方案是用 Pimoroni 的 [Pan-Tilt HAT][28]，它可以让你简单的在二维方向上移动相机。为了与 pistreaming 集成，可以看看该项目的 [pantilthat 分支][29].

![Pan-tilt][30]

*Pimoroni.com, Copyright, 授权使用*

如果你想将你的树莓派放到户外，你将需要一个防水的外围附件，并且需要一种给树莓派供电的方式。POE（通过以太网提供电力）电缆是一个不错的实现方式。

### 家庭自动化或物联网

现在是 2017 年（LCTT 译注：此文发表时间），到处都有很多物联网设备，尤其是家中。我们的电灯有 Wi-Fi，我们的面包烤箱比过去更智能，我们的茶壶处于俄国攻击的风险中，除非你确保你的设备安全，不然别将没有必要的设备连接到互联网，之后你可以在家中充分的利用物联网设备来完成自动化任务。

市场上有大量你可以购买或订阅的服务，像 Nest Thermostat 或 Philips Hue 电灯泡，允许你通过你的手机控制你的温度或者你的亮度，无论你是否在家。你可以用一个树莓派来催动这些设备的电源，通过一系列规则包括时间甚至是传感器来完成自动交互。用 Philips Hue，你做不到的当你进房间时打开灯光，但是有一个树莓派和一个运动传感器，你可以用 Python API 来打开灯光。类似地，当你在家的时候你可以通过配置你的 Nest 打开加热系统，但是如果你想在房间里至少有两个人时才打开呢？写一些 Python 代码来检查网络中有哪些手机，如果至少有两个，告诉 Nest 来打开加热器。

不用选择集成已存在的物联网设备，你可以用简单的组件来做的更多。一个自制的窃贼警报器，一个自动化的鸡笼门开关，一个夜灯，一个音乐盒，一个定时的加热灯，一个自动化的备份服务器，一个打印服务器，或者任何你能想到的。

### Tor 协议和屏蔽广告

Adafruit 的 [Onion Pi][31] 是一个 [Tor][32] 协议来使你的网络通讯匿名，允许你使用互联网而不用担心窥探者和各种形式的监视。跟随 Adafruit 的指南来设置 Onion Pi，你会找到一个舒服的匿名的浏览体验。

![Onion-Pi][33]

*Onion-pi from Adafruit, Copyright, 授权使用*

![Pi-hole][34] 

可以在你的网络中安装一个树莓派来拦截所有的网络交通并过滤所有广告。简单下载 [Pi-hole][35] 软件到 Pi 中，你的网络中的所有设备都将没有广告（甚至屏蔽你的移动设备应用内的广告）。

树莓派在家中有很多用法。你在家里用树莓派来干什么？你想用它干什么？

在下方评论让我们知道。

--------------------------------------------------------------------------------

via: https://opensource.com/article/17/4/5-projects-raspberry-pi-home

作者：[Ben Nuttall][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberry_pi_home_automation.png?itok=2TnmJpD8 (5 projects for Raspberry Pi at home)
[2]: https://www.raspberrypi.org/
[3]: https://kodi.tv/
[4]: https://osmc.tv/
[5]: https://libreelec.tv/
[6]: https://www.raspberrypi.org/downloads/noobs/
[7]: https://opensource.com/sites/default/files/libreelec_0.png (LibreElec )
[8]: https://opensource.com/sites/default/files/osmc.png (OSMC)
[9]: https://opensource.com/life/16/10/which-raspberry-pi-should-you-choose-your-project
[10]: mailto:pi@home.mydomain.com
[11]: https://opensource.com/sites/default/files/resize/screenshot_from_2017-04-07_15-13-01-700x380.png
[12]: http://stackoverflow.com/questions/20898384/ssh-disable-password-authentication
[13]: https://nmap.org/
[14]: http://www.pettingers.org/code/sshblack.html
[15]: https://www.fail2ban.org/wiki/index.php/Main_Page
[16]: https://www.raspberrypi.org/products/camera-module-v2/
[17]: https://opensource.com/life/15/6/raspberry-pi-camera-projects
[18]: https://www.raspberrypi.org/products/pi-noir-camera-v2/
[19]: http://picamera.readthedocs.io/
[20]: https://www.raspberrypi.org/documentation/usage/camera/raspicam/raspistill.md
[21]: https://www.raspberrypi.org/documentation/linux/usage/cron.md
[22]: https://github.com/RZRZR/plant-cam
[23]: https://github.com/bennuttall/bett-bot
[24]: http://picamera.readthedocs.io/en/release-1.13/recipes2.html#web-streaming
[25]: https://github.com/waveform80/pistreaming
[26]: http://jsmpeg.com/
[27]: https://opensource.com/sites/default/files/tortoise.jpg (Tortoise)
[28]: https://shop.pimoroni.com/products/pan-tilt-hat
[29]: https://github.com/waveform80/pistreaming/tree/pantilthat
[30]: https://opensource.com/sites/default/files/pan-tilt.gif (Pan-tilt)
[31]: https://learn.adafruit.com/onion-pi/overview
[32]: https://www.torproject.org/
[33]: https://opensource.com/sites/default/files/onion-pi.jpg (Onion-Pi)
[34]: https://opensource.com/sites/default/files/resize/pi-hole-250x250.png (Pi-hole)
[35]: https://pi-hole.net/



