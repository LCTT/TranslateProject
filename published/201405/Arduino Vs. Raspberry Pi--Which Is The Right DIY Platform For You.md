Arduino 与 Raspberry Pi: 哪个是更适合你的DIY平台？
================================================================================
![](http://readwrite.com/files/styles/1400_0/public/fields/arduinopi.jpg)
你想做硬件DIY吗？它们哪个更适合你？

如果你很熟悉电子DIY，那么应该听过[Arduino][1]和[Raspberry Pi（树莓派）][2]的特点对比。你也许甚至会猜测到，[像我之前认为的][3]，它们两个是处理相似问题的相互竞争的硬件平台。

实际上，Arduino和树莓派非常不一样。对于初学者来说，树莓派是一台完整功能的计算机，而Arduino只是一个微控制器，它仅仅是组成计算机的一个模块。

这里有一些指引来帮助你区分Arduino和树莓派，然后确定这两个DIY设备中的哪个更适合你的需求。

### 概述 ###

树莓派和Arduino最开始都被设计成教育工具，这也是它们现在这么流行的原因，它们两个都非常容易学习使用。

树莓派来自英国。开始的时候，发明者Eben Upton和他在剑桥大学计算机实验室的同事对学生数量的逐渐减少和差劲的技能感到非常懊恼，于是想办法解决这个问题。他们设计的树莓派是一台便宜的方便修改的计算机，目的是提高动手能力。Upton在2006年设计了树莓派的原型，在[2012年4月][4]的时候第一次可以在市场上买到。

另一个，Arduino诞生于意大利。它是根据发明者Massimo Banzi和合伙人想到这个点子的一个酒吧的名字命名的。Banzi是伊夫雷亚互动设计学院的一名教师，他想为他学设计的学生做一个简单的硬件原型制作工具。

作为教育工具，Arduino和树莓派都适合初学者。而在了解了它们的硬件和软件特点之后，很明显它们会应用到完全不同的项目中。

### 硬件和软件 ###

这里大概列出了两者规格上的最大差异

<table cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td>
<p>&nbsp;</p>
</td>
<td>
<p><strong>Arduino Uno</strong></p>
</td>
<td>
<p><strong>树莓派Model B</strong></p>
</td>
</tr>
<tr>
<td>
<p><strong>价格</strong></p>
</td>
<td>
<p>$30</p>
</td>
<td>
<p>$35</p>
</td>
</tr>
<tr>
<td>
<p><strong>体积</strong></p>
</td>
<td>
<p>7.6 x 1.9 x 6.4 cm</p>
</td>
<td>
<p>8.6cm x 5.4cm x 1.7cm</p>
</td>
</tr>
<tr>
<td>
<p><strong>内存&nbsp;</strong></p>
</td>
<td>
<p>0.002MB</p>
</td>
<td>
<p>512MB</p>
</td>
</tr>
<tr>
<td>
<p><strong>主频</strong></p>
</td>
<td>
<p>16 MHz</p>
</td>
<td>
<p>700 MHz</p>
</td>
</tr>
<tr>
<td>
<p><strong>集成网络接口</strong></p>
</td>
<td>
<p>没有</p>
</td>
<td>
<p>10/100M以太网RJ45</p>
</td>
</tr>
<tr>
<td>
<p><strong>多任务支持</strong></p>
</td>
<td>
<p>没有</p>
</td>
<td>
<p>有</p>
</td>
</tr>
<tr>
<td>
<p><strong>输入电压</strong></p>
</td>
<td>
<p>7到12伏</p>
</td>
<td>
<p>5伏</p>
</td>
</tr>
<tr>
<td>
<p><strong>Flash存储</strong></p>
</td>
<td>
<p>32KB</p>
</td>
<td>
<p>SD卡(2到16G)&nbsp;</p>
</td>
</tr>
<tr>
<td>
<p><strong>USB&nbsp;</strong></p>
</td>
<td>
<p>一个，仅做为输入</p>
</td>
<td>
<p>两个，可扩展外围设备</p>
</td>
</tr>
<tr>
<td>
<p><strong>操作系统</strong></p>
</td>
<td>
<p>没有</p>
</td>
<td>
<p>Linux发行版</p>
</td>
</tr>
<tr>
<td>
<p><strong>集成开发环境</strong></p>
</td>
<td>
<p>Arduino</p>
</td>
<td>
<p>Scratch, IDLE, Linux支持的任何环境</p>
</td>
</tr>
</tbody>
</table>

它们两个的价格和体积都差不多，我们已经知道树莓派和Arduino都很小巧很便宜，只是它们所包含的东西决定了它们的不同。树莓派在时钟速度上比Arduino快40倍。而更打击Arduino的是，树莓派拥有其128,000倍的内存。树莓派是一台独立的计算机，可以运行实际的Linux操作系统，支持多任务，支持两个USB端口，还可以无线连接到因特网。总之，它足够强劲，完全可以作为个人电脑（但是还不足以与Mac或PC比较）。

也许看起来树莓派比Arduino高级，但那仅仅是软件应用。Arduino的简单让它在单纯的硬件项目中表现更好。

我采访了Limor Fried，她是[Adafruit][5]的创办者，Adafruit是一个DIY电子商店，提供Arduino和树莓派的部件和工具，询问了她关于这两者之间不同的专业意见。作为一个从MIT毕业的工程师，立志要教所有级别的电子技术的高手，Fried比其他人更懂这两个平台。

“Arduino有处理'实时'和'模拟电路'的能力，这是树莓派没有的，这种灵活性让它可以匹配各种传感器或芯片”Fried这样说，“树莓派就没有这样灵活，比如，要读取模拟传感器就需要额外的硬件协助。有成千上万的教程教你把Arduino挂到几乎所有的设备上。另一方面，树莓派可以受益于多年的Linux软件积累，所以它们两个都是很棒的选择！”

Arduino的集成开发环境明显比Linux容易太多了。比如，如果你在树莓派上想写个程序让LED闪烁，你需要安装一个操作系统以及各种代码库，而这还仅仅只是开始。而在Arduino上，你可以用仅仅8行代码来让LED闪烁。而且，Arduino并没有设计成运行操作系统或是大量软件，你可以仅仅把它插到板子上，它就开始工作了。

树莓派可以支持多个任务进程，它可以在后台运行多个程序。比如，我有一台树莓派同时用作打印服务器和[VPN服务器][6]。

另一方面，你可以让Arduino插在板子上去长时间执行单一的任务，而当你想停止的时候把它拔出来就好了。这也是为什么Fried建议初学者在玩树莓派之前先玩Arduino：

“Arduino更简单，更难'变砖'或'损坏'，而且有更多的适合初学者的学习资源。”Fried这样说，“而要玩树莓派，你不但要学习编程比如Python，还要学习Linux。Arduino可以在任意电脑上工作，而且可以用电池供电，你可以任意时候随时开关都很安全。而树莓派在没有合适关机的情况下断电可能会损坏。”

树莓派在软件应用上大放光芒，而Arduino让硬件项目变得更简单。所以问题变成你先确定你想做什么。

### 一起使用 ###

选择树莓派或是Arduino的终极答案是：“为什么要选择？”如果你想学习一些电子知识，它们中任意一个可以教你不同的内容。

按照Fried的意见，树莓派和Arduino是互补的。她提供了一种场景，Arduino是传感器工场，而树莓派负责分发指令：

“它们在一起工作会更好”Fried说，“Arduino非常适合驱动马达，读取传感器数据，控制LED，等等。而同时你可以用一个连接到因特网的树莓派来驱动Arduino，一台迷你电脑可以轻松地用来播放视频，音乐或是发送邮件。”

作者Simon Monk，他曾经写过大量关于树莓派和Arduino的书，在博客里写了篇教程用一点点代码就可以[连接树莓派和Arduino][7]。它用到了Python的库，[PySerial][8]，这也是Arduino基地推荐的连接电脑和Arduino的最容易的方式。

只要你做到了这个，那几乎就有无限可能了。你可以[自制啤酒][9]，用Arduino控制传感器，而用树莓派来处理主要流程。你还可以建立一个[制造机器人的平台][10]，比单独的Arduino或是树莓派机器人强大多了。

### 社区 ###

不管树莓派还是Arduino，都有很多大型的、活跃的社区。这些论坛不仅仅是在学校和大学里使用，世界范围的极客们也都在里面。

下面这些地方你可以去看看，里面会有树莓派的支持和一些项目创意：

- [The Raspberry Pi Foundation — FAQs][10]
- [The Raspberry Pi Foundation — Project Forums][11]
- [Learn Raspberry Pi with Adafruit][12]
- [Element 14 (Pi’s manufacturer) Raspberry Pi Community][13]
- [The Raspberry Pi Wiki][14]

下面是关于Arduino的：

- [Arduino’s Official Getting Started Guide][15]
- [Arduino Playground][16]
- [Arduino Official Forums][17]
- [Learn Arduino with Adafruit][18]
- [r/arduino on Reddit][19]

图片来源：[Simon Monk][20]

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/05/07/arduino-vs-raspberry-pi-projects-diy-platform#feed=/hack&awesm=~oEFMq68riarQK2

译者：[zpl1025](https://github.com/zpl1025) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://readwrite.com/2014/04/21/easy-arduino-projects-basics-tutorials-diy-hardware
[2]:http://readwrite.com/2014/01/20/raspberry-pi-everything-you-need-to-know
[3]:http://readwrite.com/2014/04/16/arduino-raspberry-pi-connected-home-tutorials-projects
[4]:http://www.raspberrypi.org/archives/1081
[5]:http://www.adafruit.com/
[6]:http://readwrite.com/2014/04/10/raspberry-pi-vpn-tutorial-server-secure-web-browsing
[7]:http://www.doctormonk.com/2012/04/raspberry-pi-and-arduino.html
[8]:http://playground.arduino.cc/Interfacing/Python
[9]:http://www.brewpi.com/
[10]:http://www.raspberrypi.org/help/faqs/
[11]:http://www.raspberrypi.org/forums/viewforum.php?f=15
[12]:https://learn.adafruit.com/category/learn-raspberry-pi
[13]:http://www.element14.com/community/community/raspberry-pi
[14]:http://elinux.org/RPi_Hub
[15]:http://arduino.cc/en/Guide/HomePage
[16]:http://playground.arduino.cc/Projects/ArduinoUsers
[17]:http://forum.arduino.cc/
[18]:https://learn.adafruit.com/category/learn-arduino
[19]:http://www.reddit.com/r/Arduino
[20]:http://www.doctormonk.com/2012/04/raspberry-pi-and-arduino.html
