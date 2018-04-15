使用树莓派构建一个婴儿监视器
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/baby-chick-egg.png?itok=RcFfqdbA)
香港很湿热，即便是晚上，许多人为了更舒适，在家里也使用空调。当我的大儿子还是一个小婴儿的时候，他卧室的空调还是需要手动控制的，没有温度自动调节的功能。它的控制器只有开或者关，让空调整个晚上持续运行会导致房间过冷，并且也浪费能源和钱。

我决定使用一个基于 [树莓派][2] 的 [物联网][1] 解决方案去修复这个问题。后来我进一步为它添加了一个[婴儿监视器][3]插件。在这篇文章中，我将解释我是如何做的，它的代码在 [我的 GitHub][4] 页面上。

### 设计空调控制器

解决我的问题的第一个部分是使用了一个 Orvibo S20 [可通过 WiFi 连接的智能插头][5]和智能手机应用程序。虽然这样可以让我通过远程来控制空调，但是它还是手动处理的，而我希望尝试让它自动化。我在 [Instructables][6] 上找到了一个满足我的需求的项目：他使用树莓派从一个 [AM2302 传感器][7] 上测量附近的温度和湿度，并将它们记录到一个 MySQL 数据库中。

使用圧接头将温度/湿度传感器连接到树莓派的相应 GPIO 针脚上。幸运的是，AM2302 传感器有一个用于读取的 [开源软件][8]，并且同时提供了 [Python][9] 示例。

与我的项目放在一起的用于 [AM2302 传感器][10] 接口的软件已经更新了，并且我使用的原始代码现在已经被认为是过时的而停止维护了。这个代码是由一个小的二进制组成，用于连接到传感器以及解释阅读和返回正确值的 Python 脚本。

![Raspberry Pi, sensor, and Python code][12]

树莓派、传感器、以及用于构建温度/湿度监视器的 Python 代码。

将传感器连接到树莓派，这些 Python 代码能够正确地返回温度和湿度读数。将 Python 连接到 MySQL 数据库很简单，并且也有大量的使用 `python-``mysql`  绑定的代码示例。因为我需要持续地监视温度和湿度，所以我写软件来实现这些。

事实上，最终我用了两个解决方案，一是作为一个持续运行的进程，周期性（一般是间隔一分钟）地获取传感器数据，另一种是让 Python 脚本运行一次然后退出。我决定使用第二种方法，并使用 cron 去每分钟调用一次这个脚本。之所以选择这种方法的主要原因是，（通过循环实现的）持续的脚本偶尔会不返回读数，这将导致尝试读取传感器的进程出现聚集，最终可能会导致系统挂起而缺乏可用资源。

我也找到了可以用程序来控制我的智能插头的一个 [Perl 脚本][13]。它是解决这种问题所需的一部分，因此当某些温度/湿度达到触发条件，将触发这个 Perl 脚本。在做了一些测试之后，我决定去设计一个独立的 `checking` 脚本，从 MySQL 去拉取最新的数据，然后根据返回的值去设置智能开关为开或关。将插头控制逻辑与传感器读取脚本分开，意味着它们是各自独立运行的，就算是传感器读取脚本写的有问题也没事。

配置一个打开/关闭空调的温度值是很有意义的，因此，我将这些值转移到控制脚本读取的配置文件中。我也发现，虽然传感器的值一般都很准确，但是，偶尔也会出现返回不正确读数的情况。这个传感器脚本被修改为不向 MySQL 数据库中写入与前值差异非常大的值。同样也在配置文件中写入了连续读取的温度/湿度之间允许的最大差异值，如果读取的值处于这些限制值以外，这些值写不会提交到数据库中。

虽然，做这个自动调节器似乎花费了很多努力，但是，这意味着，记录到 MySQL 数据库的数据是有效的、可用于进一步去分析识别用户使用模式的有用数据。可以用多种图形方式去展示来自 MySQL 数据库中的数据，而我决定使用 [Google Chart][14] 在一个 Web 页面上显示数据。

![Temperature and humidity chart][16]

过去六小时内测量到的温度和湿度

### 添加一个婴儿监视摄像头

树莓派开放的性能意味着我可以不断地为它增加功能 —— 并且我有大量的未使用的可用 GPIO 针脚。我的下一个创意是去添加一个摄像头模块，将它放在孩子的卧室中，配置它去监视婴儿。

我需要一个能够在黑暗环境中工作的摄像头，而 [Pi Noir][17] 摄像头模块是非常适合这种条件的。Pi Noir 除了没有红外过滤之外，同样也是树莓派常用的摄像头模块。这意味着它在白天时的图像可能有点偏紫色，但是它可以在黑暗中借助红外灯来显示图像。

现在我需要一个红外光源。由于树莓派非常流行，并且进入门槛很低，因此它有大量的外围配件和插件。也有适合它的各种红外光源，我注意到的其中一个是 [Bright Pi][18]。它可以从树莓派上供电，并且它很适合为树莓派的摄像头模块提供红外光和普通光。它唯一的缺点是太考验我的焊接技能了。

我的焊接技能还是不错的，但是可能花费的时间比其他人更长。我成功地连接了外壳上所有的红外 LEDs，并将它们连接到树莓派的 GPIO 针脚上。这意味着树莓派能够编程控制红外 LED 是否点亮，以及它的亮度。

通过一个 Web 流去公开捕获的视频也很有意义，因为这样我就可以从 Web 页面上查看温度和湿度的读数图表。进一步研究之后，我选择了一个使用 M-JPEG 捕获器的 [流软件][19]。通过 Web 页面公开 JPG 源，我可以在我的智能手机上去连接摄像头查看程序，去查看摄像头的输出。

### 做最后的修饰

没有哪个树莓派项目都已经完成了还没有为它选择一个合适的外壳，并且它有各种零件。在大量搜索和比较之后，有了一个明确的 [赢家][20]：SmartPi 的乐高积木式外壳。乐高的兼容性可以让我去安装温度/湿度传感器和摄像头。下面是最终的成果图：

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pibabymonitor_case.png?itok=_ofyN73a)

在这以后，我对我的这个作品作了一些改变和更新：

  * 我将它从树莓派 2 Model B 升级到了 [树莓派 3][21]，这意味着我可以使用 USB WiFi 模块。
  * 我用一个 [TP-Link HS110][22] 智能插头替换了 Orvibo S20。
  * 我也将树莓派插到了一个智能插头上，这样我就可以远程重启/重置它了。
  * 我从树莓派上将 MySQL 数据库移走了，它现在运行在一个 NAS 设备上的容器中。
  * 我增加了一个非常 [灵活的三角夹][23]，这样我就可以调整到最佳角度。
  * 我重新编译了 USB WiFi 模块，禁用了板载 LED 指示灯，这就是升级到树莓派 3 的其中一个好处。
  * 我因此为我的第二个孩子设计了另外一个监视器。
  * 因为没有时间去折腾，我为我的第三个孩子购买了夜用摄像头。



想学习更多的东西吗？所有的代码都在 [我的 GitHub][4] 页面上。

想分享你的树莓派项目吗？[将你的故事和创意发送给我们][24]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/build-baby-monitor-raspberry-pi

作者：[Jonathan Ervine][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jervine
[1]:https://opensource.com/tags/internet-things
[2]:https://opensource.com/tags/raspberry-pi
[3]:https://opensource.com/article/17/9/gonimo
[4]:https://github.com/jervine/rpi-temp-humid-monitor
[5]:https://www.amazon.co.uk/marsboy-S20-Automation-Control-Smartphone/dp/B01LXKPUDK/ref=sr_1_1/258-6082934-2585109?ie=UTF8&amp;qid=1520578769&amp;sr=8-1&amp;keywords=orvibo+s20
[6]:http://www.instructables.com/id/Raspberry-Pi-Temperature-Humidity-Network-Monitor/
[7]:https://www.adafruit.com/product/393
[8]:https://github.com/adafruit/Adafruit_Python_DHT
[9]:https://opensource.com/tags/python
[10]:https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code/tree/legacy/Adafruit_DHT_Driver_Python
[11]:/file/390916
[12]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pibabymonitor_materials.png?itok=2w03CdKM "Raspberry Pi, sensor, and Python code"
[13]:https://github.com/franc-carter/bauhn-wifi
[14]:https://developers.google.com/chart/
[15]:/file/390876
[16]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/u128651/pibabymonitor_temp-humidity.png?itok=2jqtQU0x "Temperature and humidity chart"
[17]:https://www.raspberrypi.org/products/pi-noir-camera-v2/
[18]:https://www.pi-supply.com/product/bright-pi-bright-white-ir-camera-light-raspberry-pi/
[19]:https://elinux.org/RPi-Cam-Web-Interface
[20]:https://smarticase.com/collections/all/products/smartipi-kit-3
[21]:https://opensource.com/article/18/3/raspberry-pi-3b-model-news
[22]:https://www.tp-link.com/uk/products/details/cat-5258_HS110.html
[23]:https://www.amazon.com/Flexpod-Flexible-Tripod-Discontinued-Manufacturer/dp/B000JC8WYA
[24]:http://opensource.com/story
