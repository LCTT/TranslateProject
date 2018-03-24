如何使用树莓派测定颗粒物
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bubblehands_fromRHT_520_0612LL.png?itok=_iQ2dO3S)
我们在东南亚的学校定期测定空气中的颗粒物。这里的测定值非常高，尤其是在二到五月之间，干燥炎热、土地干旱等各种因素都对空气质量产生了不利的影响。我将会在这篇文章中展示如何使用树莓派来测定颗粒物。

### 什么是颗粒物？

颗粒物就是粉尘或者空气中的微小颗粒。其中 PM10 和 PM2.5 之间的差别就是 PM10 指的是粒径小于10微米的颗粒，而 PM2.5 指的是粒径小于2.5微米的颗粒。在粒径小于2.5微米的的情况下，由于它们能被吸入肺泡中并且对呼吸系统造成影响，因此颗粒越小，对人的健康危害越大。

世界卫生组织的建议[颗粒物浓度][1]是：

  * 年均 PM10 不高于20 µg/m³
  * 年均 PM2.5 不高于10 µg/m³
  * 不允许超标时，日均 PM10 不高于50 µg/m³
  * 不允许超标时，日均 PM2.5 不高于25 µg/m³

以上数值实际上是低于大多数国家的标准的，例如欧盟对于 PM10 所允许的年均值是不高于40 µg/m³。

### 什么是空气质量指数（AQI, Air Quality Index）？

空气质量指数按照颗粒物的测定值来评价空气质量的好坏，然而由于各国之间的计算方式有所不同，这个指数并没有统一的标准。维基百科上关于[空气质量指数][2]的词条对此给出了一个概述。我们学校则以[美国环境保护协会][3]（EPA, Environment Protection Agency）建立的分类法来作为依据。

![空气质量指数][5]

空气质量指数

### 测定颗粒物需要哪些准备？

测定颗粒物只需要以下两种器材：
  * 树莓派（款式不限，最好带有 WiFi）
  * SDS011 颗粒物传感器



![颗粒物传感器][7]

颗粒物传感器

如果是只带有 Micro USB的树莓派Zero W，那还需要一根连接到标准 USB 端口的适配线，只需要20美元，而传感器则自带适配串行接口的 USB 适配器。

### 安装过程

对于树莓派，只需要下载对应的 Raspbian Lite 镜像并且[写入到 Micro SD 卡][8]上就可以了（网上很多教程都有介绍如何设置 WLAN 连接，我就不细说了）。

如果要使用 SSH，那还需要在启动分区建立一个名为 `ssh` 的空文件。树莓派的 IP 通过路由器或者 DHCP 服务器获取，随后就可以通过 SSH 登录到树莓派了（默认密码是 raspberry）：
```
$ ssh pi@192.168.1.5

```

首先我们需要在树莓派上安装一下这些包：
```
$ sudo apt install git-core python-serial python-enum lighttpd

```

在开始之前，我们可以用 `dmesg` 来获取 USB 适配器连接的串行接口：
```
$ dmesg

[ 5.559802] usbcore: registered new interface driver usbserial

[ 5.559930] usbcore: registered new interface driver usbserial_generic

[ 5.560049] usbserial: USB Serial support registered for generic

[ 5.569938] usbcore: registered new interface driver ch341

[ 5.570079] usbserial: USB Serial support registered for ch341-uart

[ 5.570217] ch341 1–1.4:1.0: ch341-uart converter detected

[ 5.575686] usb 1–1.4: ch341-uart converter now attached to ttyUSB0

```

在最后一行，可以看到接口 `ttyUSB0`。然后我们需要写一个 Python 脚本来读取传感器的数据并以 JSON 格式存储，在通过一个 HTML 页面就可以把数据展示出来了。

### 在树莓派上读取数据

首先创建一个传感器实例，每5分钟读取一次传感器的数据，持续30秒，这些数值后续都可以调整。在每两次测定的间隔，我们把传感器调到睡眠模式以延长它的使用寿命（厂商认为元件的寿命大约8000小时）。

我们可以使用以下命令来下载 Python 脚本：
```
$ wget -O /home/pi/aqi.py https://raw.githubusercontent.com/zefanja/aqi/master/python/aqi.py

```

另外还需要执行以下两条命令来保证脚本正常运行：
```
$ sudo chown pi:pi /var/wwww/html/

$ echo[] > /var/wwww/html/aqi.json

```

下面就可以执行脚本了：
```
$ chmod +x aqi.py

$ ./aqi.py

PM2.5:55.3, PM10:47.5

PM2.5:55.5, PM10:47.7

PM2.5:55.7, PM10:47.8

PM2.5:53.9, PM10:47.6

PM2.5:53.6, PM10:47.4

PM2.5:54.2, PM10:47.3

…

```

### 自动化执行脚本

只需要使用诸如 crontab 的服务，我们就不需要每次都手动启动脚本了。按照以下命令打开 crontab 文件：
```
$ crontab -e

```

在文件末尾添加这一行：
```
@reboot cd /home/pi/ && ./aqi.py

```

现在我们的脚本就会在树莓派每次重启后自动执行了。

### 展示颗粒物测定值和空气质量指数的 HTML 页面

我们在前面已经安装了一个轻量级的 web 服务器 `lighttpd`，所以我们需要把 HTML、JavaScript、CSS 文件放置在 `/var/www/html` 目录中，这样就能通过电脑和智能手机访问到相关数据了。执行下面的三条命令，可以下载到对应的文件：

```
$ wget -O /var/wwww/html/index.html https://raw.githubusercontent.com/zefanja/aqi/master/html/index.html

$ wget -O /var/wwww/html/aqi.js https://raw.githubusercontent.com/zefanja/aqi/master/html/aqi.js

$ wget -O /var/wwww/html/style.css https://raw.githubusercontent.com/zefanja/aqi/master/html/style.css

```

在 JavaScript 文件中，实现了打开 JSON 文件、提取数据、计算空气质量指数的过程，随后页面的背景颜色将会根据 EPA 的划分标准而变化。

你只需要用浏览器访问树莓派的地址，就可以看到当前颗粒物浓度值等数据了。[http://192.168.1.5:][9]

这个页面比较简单而且可扩展，比如可以添加一个展示过去数小时历史数据的表格等等。

这是[Github上的完整源代码][10]。

### 总结

在资金相对紧张的情况下，树莓派是一种选择。除此以外，还有很多可以用来测定颗粒物的应用，包括室外固定装置、移动测定设备等等。我们学校则同时采用了这两种：固定装置在室外测定全天颗粒物浓度，而移动测定设备在室内检测空调过滤器的效果。

[Luftdaten.info][12]提供了一个如何设计类似的传感器的介绍，其中的软件效果出众，而且因为它没有使用树莓派，所以硬件更是小巧。

对于学生来说，设计一个颗粒物传感器确实算得上是一个优秀的课外项目。

你又打算如何使用你的[树莓派][13]呢？

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/how-measure-particulate-matter-raspberry-pi

作者：[Stephan Tetzel][a]
译者：[HankChow](https://github.com/HankChow)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/stephan
[1]:https://en.wikipedia.org/wiki/Particulates
[2]:https://en.wikipedia.org/wiki/Air_quality_index
[3]:https://en.wikipedia.org/wiki/United_States_Environmental_Protection_Agency
[5]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/air_quality_index.png?itok=FwmGf1ZS (Air quality index)
[7]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/particulate_sensor.jpg?itok=ddH3bBwO (Particulate sensor)
[8]:https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[9]:http://192.168.1.5/
[10]:https://github.com/zefanja/aqi
[11]:https://opensource.com/article/18/3/raspberry-pi-week-giveaway
[12]:http://luftdaten.info/
[13]:https://openschoolsolutions.org/shutdown-servers-case-power-failure%e2%80%8a-%e2%80%8aups-nut-co/
