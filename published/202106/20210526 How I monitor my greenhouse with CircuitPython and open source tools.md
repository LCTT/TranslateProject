[#]: subject: (How I monitor my greenhouse with CircuitPython and open source tools)
[#]: via: (https://opensource.com/article/21/5/monitor-greenhouse-open-source)
[#]: author: (Darin London https://opensource.com/users/dmlond)
[#]: collector: (lujun9972)
[#]: translator: (alim0x)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13504-1.html)

我如何用 CircuitPython 和开源工具监控温室
======

> 使用微控制器、传感器、Python 以及 MQTT 持续追踪温室的温度、湿度以及环境光。

![种有西红柿的温室花园][1]

CircuitPython 提供了一种和微控制器板进行交互的革命性方式。这篇文章介绍了如何使用 CircuitPython 来监测温室的温度、湿度以及环境光，并且使用 CircuitPython MQTT 客户端将结果发布到一个 [MQTT][2] <ruby>中介<rt>broker</rt></ruby>。你可以在若干个程序中订阅 MQTT 队列并进一步处理信息。

这个项目使用一个简单的 Python 程序来运行 Web 服务器，它发布一个 Prometheus 格式的采集端点，拉取监控指标到 [Prometheus][3] 进行不间断的监控。

### 关于 CircuitPython

[CircuitPython][4] 是一个由 [Adafruit][5] 创建的开源 Python 发行版，用于运行在低成本微控制器开发板上。CircuitPython 为与 [兼容的开发板][6] 的交互提供了简单的开发体验。你可以在连接你的开发板时挂载的 `CIRCUITPYTHON` 根驱动器上创建一个 `code.py` 文件来启动你的程序。CircuitPython 还为开发板提供了一个串行连接，包含一个交互式解释器（REPL）会话，你可以使用 Python 代码实时和开发板进行交互。

Adafruit 的网站提供了大量的文档，可以帮助你开始使用 CircuitPython。首先，参考下《[欢迎来到 CircuitPython][7]》指南。这份指南能够帮助你开始使用 CircuitPython 在开发板上运行代码以及和 REPL 交互。它还记录了如何安装 Adafruit 的 CircuitPython 库合集和范例，可以用在它出售的许多开发板和传感器上。接下来，阅读《[CircuitPython 基础][8]》指南来学习更多关于其功能的信息，里面还有链接指向在特定及兼容的开发板上使用 CircuitPython 的相关信息。最后，就如所有开源软件一样，你可以深入 [CircuitPython 的源码][9]，发布议题，以及做出贡献。

### 微控制器设置

微控制器系统非常简单。要完成这个示例项目，你会需要：

  * **树莓派 4**：你需要一台电脑来给微控制器系统编程，我用的是树莓派 4。
  * **CircuitPython 兼容的微控制器**：我用的是 [Adafruit Feather S2][10]，带有内置 WiFi，环境光传感器，Qwiic 线缆输入。
  * **微控制器 WiFi**：Feather S2 内置了 WiFi。如果你的微控制器没有，你需要给开发板找个 WiFi 扩展板。
  * **传感器**：Feather S2 有个内置的环境光传感器，所以我还需要一个温湿度传感器。有很多不同厂商的产品可以选择，包括 Adafruit、SparkFun、亚马逊。我用的是一个 [Adafruit 传感器][11]，带有 Feather S2 输入兼容的 Qwiic 线缆。尽管多数 SparkFun 传感器可以在 Adafruit 库下工作，但如果你不是从 Adafruit 购买的传感器，你可能还是需要自己去找到它兼容 CircuitPython 的 Python 库。
  * **跳线和线缆**：为了避免使用面包板或焊接，我使用 [Adafruit Qwiic 线缆][12]。SparkFun 销售的包含不同长度的[线缆套装][13]中也有它。

在将微控制器连接到你的电脑之前，将传感器连接到微控制器上。

![将传感器连接到微控制器上][14]

现在你可以将微控制器用 USB 数据线连接到你的电脑。

### MQTT 中介

你可以使用 [这份说明][16] 来在树莓派的系统上安装 [Mosquitto MQTT 中介][17] 和 Mosquitto 客户端。如果你想把树莓派做为长期服务器使用，在你的网络上给树莓派 4 设置一个静态 IP 地址。Mosquitto 中介运行起来之后，创建一份 [用户名/密码文件][18]，设置客户端向中介发布和订阅消息时用的认证信息。

你可以用树莓派上的 Mosquitto 客户端来测试 MQTT 中介。打开两个终端（如果你是无界面运行的话打开两个 SSH 会话）：

在终端一输入：

```
mosquitto_sub -h localhost -u $user -P $pass -t "mqtt/test"
```

这条命令会启动一个持续运行的进程，监听发布到 `mqtt/test` 队列的消息。

在终端二输入：

```
mosquitto_pub -h localhost -u $user -P $pass -t "mqtt/test" -m hello`
```

这条命令会向 `mqtt/test` 队列发布一条消息，它应该会显示在终端一的输出里。

现在你可以中止终端一运行的 `sub` 命令了。

Mosquitto 中介允许客户端发布消息到任何队列，甚至没有任何订阅的队列也可以。这些消息会永久丢失，但这不会阻止客户端继续发布消息。

打开第三个终端，订阅下列队列（你的控制器会发布消息到这些队列上）：

  * greenhouse/temperature
  * greenhouse/light
  * greenhouse/humidity

### 给微控制器编码

现在你已经准备好给微控制器编码，发布它的监测指标到树莓派 4 上运行的 MQTT 中介上了。

Adafruit 有 [出色的文档][19]，指导你使用 [CircuitPython 库合集][20] 的库来将你的微控制器连接到 WiFi 路由器，并发布监测指标到 MQTT 中介上。

安装下列库到 `CIRCUITPYTHON/lib` 目录，温室监控会用到它们。这些库在 Adafruit 的 CircuitPython 库合集中都有提供：

  * `adafruit_bus_device`：一个带有多个 .mpy 文件的 Python 包文件夹（.mpy 是经过压缩的 Python 文件，用以节省空间）
  * `adafruit_requests`：单个 .mpy 文件
  * `adafruit_register`：一个包文件夹
  * `adafruit_minimqtt`：一个包文件夹
  * `adafruit_si7021`：单个 .mpy 文件，用来支持温湿度传感器

库装好了之后，将以下代码写入 `CIRCUITPYTHON` 文件夹的 `code.py` 文件中：

```
import time
import ssl
import socketpool
import wifi
import adafruit_minimqtt.adafruit_minimqtt as MQTT
import board
from digitalio import DigitalInOut, Direction, Pull
from analogio import AnalogIn
import adafruit_si7021
 
# Add a secrets.py to your filesystem that has a dictionary called secrets with "ssid" and
# "password" keys with your WiFi credentials. DO NOT share that file or commit it into Git or other
# source control.
# pylint: disable=no-name-in-module,wrong-import-order
try:
        from secrets import secrets
except ImportError:
        print("WiFi secrets are kept in secrets.py, please add them there!")
        raise
 
print("Connecting to %s" % secrets["ssid"])
wifi.radio.connect(secrets["ssid"], secrets["password"])
print("Connected to %s!" % secrets["ssid"])
### Feeds ###
light_feed = "greenhouse/light"
temp_feed = "greenhouse/temperature"
humidity_feed = "greenhouse/humidity"
 
# Define callback methods which are called when events occur
# pylint: disable=unused-argument, redefined-outer-name
def connected(client, userdata, flags, rc):
        # This function will be called when the client is connected
        # successfully to the broker.
        print("Connected to MQTT!")
 
def disconnected(client, userdata, rc):
        # This method is called when the client is disconnected
        print("Disconnected from MQTT!")
 
 
def get_voltage(pin):
        return (pin.value * 3.3) / 65536
 
# Create a socket pool
pool = socketpool.SocketPool(wifi.radio)
 
# Set up a MiniMQTT Client
mqtt_client = MQTT.MQTT(
        broker=secrets["broker"],
        port=secrets["port"],
        username=secrets["aio_username"],
        password=secrets["aio_key"],
        socket_pool=pool,
        ssl_context=ssl.create_default_context(),
)
 
# Setup the callback methods above
mqtt_client.on_connect = connected
mqtt_client.on_disconnect = disconnected
 
# Connect the client to the MQTT broker.
print("Connecting to MQTT...")
mqtt_client.connect()
 
# Create library object using our Bus I2C port
sensor = adafruit_si7021.SI7021(board.I2C())
light_pin = AnalogIn(board.IO4)
 
while True:
        # Poll the message queue
        mqtt_client.loop()
 
        # get the current temperature
        light_val = get_voltage(light_pin)
        temp_val = ((sensor.temperature * 9)/5) + 32
        humidity_val = sensor.relative_humidity
 
        # Send a new messages
        mqtt_client.publish(light_feed, light_val)
        mqtt_client.publish(temp_feed, temp_val)
        mqtt_client.publish(humidity_feed, humidity_val)
        time.sleep(0.5)
```

保存你的代码。然后连接到串行监视器，看程序连接到你的 MQTT 中介。你还可以将树莓派 4 上的终端切换到订阅了它的发布队列的终端来查看输出。

### 处理监测指标

像 MQTT 这样的发布/订阅工作流给微控制器系统提供了诸多好处。你可以有多个微控制器 + 传感器来回报同一个系统的不同指标或并行回报相同指标的若干读数。你还可以有多个不同进程订阅各个队列，并行地对这些消息进行回应。甚至还可以有多个进程订阅相同的队列，对消息做出不同的动作，比如数值过高时发送通知邮件或将消息发送到另一个 MQTT 队列上去。

另一个选项是让一个微控制器订阅一个外部队列，可以发送信号告诉微控制器做出动作，比如关闭或开始一个新会话。最后，发布/订阅工作流对低功耗微控制器系统更佳（比如那些使用电池或太阳能的系统），因为这些设备可以在更长的延迟周期后批量发布监测指标，并在回报的间隔期间关闭大量消耗电量的 WiFi 广播。

要处理这些监测指标，我创建了一个 Python 客户端，使用 [Paho Python MQTT 客户端][21] 订阅监测指标队列。我还使用官方的 [Prometheus Python 客户端][22] 创建了一个 Web 服务器，它产生一个符合 Prometheus 标准的采集端点，使用这些监测指标作为面板信息。[Prometheus 服务器][23]和 Mosquitto MQTT 中介我都是运行在同一个树莓派 4 上的。

```
from prometheus_client import start_http_server, Gauge
import random
import time
import paho.mqtt.client as mqtt

gauge = {
  "greenhouse/light": Gauge('light','light in lumens'),
  "greenhouse/temperature": Gauge('temperature', 'temperature in fahrenheit'),
  "greenhouse/humidity": Gauge('humidity','relative % humidity')
}

try:
        from mqtt_secrets import mqtt_secrets
except ImportError:
        print("WiFi secrets are kept in secrets.py, please add them there!")
        raise

def on_connect(client, userdata, flags, rc):
        print("Connected with result code "+str(rc))
        # Subscribing in on_connect() means that if we lose the connection and
        # reconnect then subscriptions will be renewed.
        client.subscribe("greenhouse/light")
        client.subscribe('greenhouse/temperature')
        client.subscribe('greenhouse/humidity')

def on_message(client, userdata, msg):
        topic = msg.topic
        payload = msg.payload
        gauge[topic].set(payload)

client = mqtt.Client()
client.username_pw_set(mqtt_secrets["mqtt_user"],mqtt_secrets['mqtt_password'])
client.on_connect = on_connect
client.on_message = on_message
client.connect('localhost',1883,60)

if __name__ == '__main__':
        # Start up the server to expose the metrics.

        client = mqtt.Client()
        client.username_pw_set('london','abc123')
        client.on_connect = on_connect
        client.on_message = on_message
        client.connect('localhost',1883,60)

        start_http_server(8000)
        client.loop_forever()
```

然后我配置 Prometheus 服务器采集端点数据到 `localhost:8000`。

你可以在 Github 上访问 [温室 MQTT 微控制器][24] 这个项目的代码，项目采用 MIT 许可证授权。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/monitor-greenhouse-open-source

作者：[Darin London][a]
选题：[lujun9972][b]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dmlond
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/zanda-photography-unsplash-greenhouse.jpg?itok=ZMnZyNMM (Greenhouse garden with tomatoes)
[2]: https://mqtt.org/
[3]: https://prometheus.io/
[4]: https://circuitpython.io/
[5]: https://adafruit.com
[6]: https://circuitpython.org/downloads
[7]: https://learn.adafruit.com/welcome-to-circuitpython
[8]: https://learn.adafruit.com/circuitpython-essentials/circuitpython-essentials
[9]: https://github.com/adafruit/circuitpython
[10]: https://www.adafruit.com/product/4769
[11]: https://www.adafruit.com/product/3251
[12]: https://www.adafruit.com/product/4399
[13]: https://www.sparkfun.com/products/15081
[14]: https://opensource.com/sites/default/files/uploads/connectsensors-microcontroller.jpg (Connecting sensors to microcontroller)
[15]: https://creativecommons.org/licenses/by-sa/4.0/
[16]: https://pimylifeup.com/raspberry-pi-mosquitto-mqtt-server/
[17]: https://mosquitto.org/
[18]: https://mosquitto.org/documentation/authentication-methods/
[19]: https://learn.adafruit.com/mqtt-in-circuitpython
[20]: https://circuitpython.org/libraries
[21]: https://pypi.org/project/paho-mqtt/
[22]: https://pypi.org/project/prometheus-client
[23]: https://opensource.com/article/21/3/iot-measure-raspberry-pi
[24]: https://github.com/dmlond/greenhouse_mqtt_microcontroller
