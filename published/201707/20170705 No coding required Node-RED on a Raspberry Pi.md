不需要编码：树莓派上的 Node-RED
============================================================

> 查看本教程，看看使用 Node-RED 的拖放界面设置硬件流程是多么容易。
 
![No coding required: Node-RED on a Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/hardware_hammer_sign.jpg?itok=vh76LBib "No coding required: Node-RED on a Raspberry Pi")

Node-RED 是一个编程工具，可让你使用基于浏览器的编辑器快速连接硬件设备。它具有大量的节点，可以以拖放的方式构建流程，这大大减少了开发时间。[Node-RED][14] 与树莓派的 Raspian Jessie 一起安装，你还可以独立下载 Node-RED。

为了向你展示它如何工作，我们将使用 Node-RED 构建一个简单的工具，与连接到树莓派的蜂窝调制解调器通信。使用蜂窝调制解调器，你可以通过蜂窝网络从你的树莓派发送/接收数据。你可以使用蜂窝网络提供商通常提供的 3G/4G USB 加密狗，也可以将开发板与 3G 或 4G 无线调制解调器连接。

无论你是连接 USB 加密狗还是开发板，树莓派的连接接口都是通过 USB 端口的。在本教程中，我将一块 [SIM900][15] 开发板通过一根 USB 转串行电缆连接到树莓派。

![Connecting SIM900 to Raspberry Pi through a USB-to-serial converter cable](https://opensource.com/sites/default/files/u128651/node_red1.png "Connecting SIM900 to Raspberry Pi through a USB-to-serial converter cable")

第一步是检查 SIM900 开发板是否连接到树莓派上。

![Checking that the SIM900 development board is connected](https://opensource.com/sites/default/files/u128651/node_red2a.png "Checking that the SIM900 development board is connected")

USB 转串行适配器在这里被显示为连接到树莓派的 USB 设备之一。

接下来，检查 SIM900 连接的 USB 端口号。

![Checking the SIM900 board's USB port number](https://opensource.com/sites/default/files/u128651/node_red3a.png "Checking the SIM900 board's USB port number")

在最后一行，你可以看到 SIM900 板（通过 USB 转串行转换器连接）连接到了树莓派上的 **ttyUSB0**。现在我们准备开始使用 Node-RED。

在树莓派上启动 Node-RED。

![​​​​Launching Node-RED in Raspberry Pi](https://opensource.com/sites/default/files/u128651/node_red4a.png "​​​​Launching Node-RED in Raspberry Pi")

下载[示例流图][16]并将其导入到 Node-RED 中。请注意，流文件是该图形 UI 的 JSON 表示形式。

在 Node-RED 中，导入的流图应该看上去像这样：

![The imported flow in Node-RED](https://opensource.com/sites/default/files/u128651/node_red5.png "The imported flow in Node-RED")

注入节点设置 [AT 命令][17]需要查询调制解调器。**添加换行** 功能节点会在注入节点传递过来的 AT 命令后面附加 **\r\n**。**添加换行** 的输出然后被连接到**串行输出**节点，它将数据写入串行端口。来自调制解调器的 AT 命令的响应通过 **串行输入** 节点读取，该节点将响应输出到 **调试** 窗口。确认串行端口号和端口速度在 **串行输入** 和 **串行输出** 节点中的配置。

Node-RED 是一种易于使用的编程工具，可用于快速集成和测试硬件设备。从本教程可以看出，使用 Node-RED 连接和测试使用树莓派的蜂窝模式不需要编码。

有关 Node-RED 和其他可以使用的方式的更多信息，请访问[项目网站][18]。

（题图： Thomas Hawk 的 [Flickr][12]. [CC BY-NC 2.0][13]. Opensource.com 修改）

--------------------------------------------------------------------------------

作者简介：

Surya G - 我的兴趣是为物联网项目尤其是使用蜂窝调制解调器的项目做软件开发。

---

via: https://opensource.com/article/17/7/nodered-raspberrypi-hardware

作者：[Surya G][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/gssm2m
[1]:https://opensource.com/tags/raspberry-pi?src=raspberry_pi_resource_menu1
[2]:https://opensource.com/resources/what-raspberry-pi?src=raspberry_pi_resource_menu2
[3]:https://opensource.com/article/16/12/getting-started-raspberry-pi?src=raspberry_pi_resource_menu3
[4]:https://opensource.com/article/17/2/raspberry-pi-submit-your-article?src=raspberry_pi_resource_menu4
[5]:https://opensource.com/file/359036
[6]:https://opensource.com/file/359086
[7]:https://opensource.com/file/359091
[8]:https://opensource.com/file/359716
[9]:https://opensource.com/file/359056
[10]:https://opensource.com/article/17/7/nodered-raspberrypi-hardware?rate=NjMvod1gAOI2Tf9t0YLr-4tbe_K1XWfHWNjVkTkPuzU
[11]:https://opensource.com/user/137861/feed
[12]:https://www.flickr.com/photos/thomashawk/3048157616/in/photolist-5DmB4E-BzrZ4-5aUXCN-nvBWYa-qbkwAq-fEFeDm-fuZxgC-dufA8D-oi8Npd-b6FiBp-7ChGA3-aSn7xK-7NXMyh-a9bQQr-5NG9W7-agCY7E-4QD9zm-7HLTtj-4uCiHy-bYUUtG
[13]:https://creativecommons.org/licenses/by-nc/2.0/
[14]:https://nodered.org/
[15]:http://m2msupport.net/m2msupport/simcom-sim900-gprs-2g-module/
[16]:http://m2msupport.net/m2msupport/wp-content/themes/admired/Node-RED/modem_commands
[17]:http://m2msupport.net/m2msupport/software-and-at-commands-for-m2m-modules/
[18]:https://nodered.org/
[19]:https://opensource.com/users/gssm2m
[20]:https://opensource.com/users/gssm2m
