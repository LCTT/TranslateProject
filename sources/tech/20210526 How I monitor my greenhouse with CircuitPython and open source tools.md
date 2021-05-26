[#]: subject: (How I monitor my greenhouse with CircuitPython and open source tools)
[#]: via: (https://opensource.com/article/21/5/monitor-greenhouse-open-source)
[#]: author: (Darin London https://opensource.com/users/dmlond)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

How I monitor my greenhouse with CircuitPython and open source tools
======
Keep track of your greenhouse's temperature, humidity, and ambient light
using a microcontroller, sensors, Python, and MQTT.
![Greenhouse garden with tomatoes][1]

CircuitPython provides a revolutionary way to interact with microcontroller boards. This article explains how to use CircuitPython to measure a greenhouse's temperature, humidity, and ambient light and publish the results to an [MQTT][2] broker using a CircuitPython MQTT client. You can subscribe any number of programs to the MQTT queues to process the information further.

This project uses a simple Python program that runs a web server that publishes a Prometheus-formatted scrape endpoint and pulls these metrics into [Prometheus][3] for ongoing monitoring.

### About CircuitPython

[CircuitPython][4] is an open source Python distribution created by [Adafruit][5] to run on low-cost microcontroller boards. CircuitPython provides a simple development experience for interacting with [compatible boards][6]. You can start a program on the board by creating a `code.py` file in the `CIRCUITPYTHON` root drive that mounts when you connect your board. CircuitPython also provides a serial connection from your board that includes an interactive read-evaluate-print loop (REPL) session that you can use to interact with your board in real time using Python code.

Adafruit's website offers extensive documentation to help you get started with CircuitPython. First, consult the [Welcome to CircuitPython][7] guide. This will get you started running code on your microcontroller with CircuitPython and interacting with the REPL. It also documents how to install Adafruit's bundle of CircuitPython libraries and examples for many of the boards and sensors it sells. Next, read the [CircuitPython Essentials][8] guide to learn more about its capabilities and link to information about using CircuitPython with specific, compatible boards. Finally, as with all open source software, you can dig into [CircuitPython's code][9], post issues, and contribute.

### Microcontroller setup

The microcontroller system is very simple. To follow along with this demo, you will need:

  * **Raspberry Pi 4:** You need a computer to program the microcontroller system, and this is what I used. 
  * **A CircuitPython-compatible microcontroller:** I used the [Adafruit FeatherS2][10] with built-in WiFi, ambient light sensor, and Qwiic cable input.
  * **Microcontroller WiFi:** The FeatherS2 has a built-in WiFi radio. If your microcontroller does not, you will need to find a WiFi expansion board for it.
  * **Sensors:** The Feather S2 has a built-in ambient light sensor, so I needed to get a temperature and humidity sensor. A variety is available from vendors, including Adafruit, SparkFun, and Amazon. I used an [Adafruit sensor][11] with a Qwiic cable connection compatible with the Feather S2 input. You may have to find CircuitPython-compatible Python libraries for sensors not purchased from Adafruit, although many SparkFun sensors work with Adafruit libraries.
  * **Jumpers and cables:** To avoid using a breadboard or soldering, I used an [Adafruit Qwiic cable][12]. SparkFun also sells them in a [bundle of cables][13] of different lengths.



Before plugging the microcontroller into your computer, connect the sensors to the microcontroller.

![Connecting sensors to microcontroller][14]

(Darin London, [CC BY-SA 4.0][15])

Now you can plug the microcontroller into your computer using a USB data cable.

### The MQTT Broker

You can use [these instructions][16] to install the [Mosquitto MQTT broker][17] and Mosquitto clients on a Raspberry Pi 4 running Raspberry Pi OS. If you want to use the Raspberry Pi as a long-term server, set a static IP address for the Raspberry Pi 4 on your network. Once the Mosquitto broker is running, create a [user/password file][18] that sets the authentication parameters for clients to use when publishing and subscribing to the broker.

You can test the MQTT broker using the Mosquitto clients on the Raspberry Pi. Open two terminals (or SSH sessions if you are running headless):

On Terminal 1, enter:


```
`mosquitto_sub -h localhost -u $user -P $pass -t "mqtt/test"`
```

This will start a long-running process that listens for messages published to the `mqtt/test` queue.

On Terminal 2, enter:


```
`mosquitto_pub -h localhost -u $user -P $pass -t "mqtt/test" -m hello`
```

This will publish a message to the `mqtt/test` queue, which should show up in Terminal 1's output.

You can then kill the `sub` command running on Terminal 1.

The Mosquitto broker allows clients to publish messages to any queue, even if it has no subscribers. These messages will be lost forever, but they will not stop the client from publishing.

Start a third terminal and subscribe to the following queues (the queues your microcontroller will publish messages to):

  * greenhouse/temperature
  * greenhouse/light
  * greenhouse/humidity



### Code the microcontroller

You are now ready to code your microcontroller to publish its metrics to the MQTT broker running on your Raspberry Pi 4.

Adafruit has [excellent documentation][19] on using the [CircuitPython Library Bundle][20]'s libraries to connect your microcontroller to your WiFi router and get it publishing metrics to your MQTT broker.

Install the following libraries, which the greenhouse monitor will use, into the `CIRCUITPYTHON/lib` directory. These are all available in the Adafruit CircuitPython Library Bundle:

  * **adafruit_bus_device:** A Python package directory with multiple .mpy files (.mpy is a compressed Python file that saves space on your microcontroller)
  * **adafruit_requests:** A single .mpy file
  * **adafruit_register:** Another package directory
  * **adafruit_minimqtt:** Another package directory
  * **adafruit_si7021:** A single .mpy file that works with the temperature and humidity sensors



Once these libraries are installed, write the following into `code.py` in the `CIRCUITPYTHON` directory:


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

Save your code. Then attach to the serial monitor and watch it connect to your MQTT broker. You can also see the output by switching to the terminals on your Raspberry Pi 4 subscribed to the queues where this publishes.

### Process the metrics

Publish/subscribe workflows like MQTT offer many advantages for microcontroller systems. You can have multiple microcontroller + sensor installations reporting different metrics about the same system or reporting many readings of the same metric in parallel. You can also have many different processes that subscribe to each queue to respond to these messages in parallel. It is even possible to have multiple different processes subscribed to the same queue for different actions, such as sending an email when a value gets too high or publishing a message to another MQTT queue.

Another option is to have a microcontroller subscribe to an external queue that sends signals to tell the microcontroller to perform an action, such as turning off or starting a new session. Finally, pub/sub workflows can be better for low-power microcontroller installations (such as those using battery or solar power) because these devices can send metrics in batches separated by long delays and turn off the power-hungry WiFi radio during the intervals between reports.

To process these metrics, I created a Python client that uses the [Paho Python MQTT client][21] to subscribe to the metrics queues. I also use the official [Prometheus Python client][22] to create a web server that produces a Prometheus-compliant scrape endpoint with these metrics as gauges. I run this, a [Prometheus server][23], and the Mosquitto MQTT broker on the same Raspberry Pi 4.


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

Then I configure the Prometheus server to scrape that endpoint on localhost:8000.

You can access all the code for this project in my MIT-licensed [Greenhouse MQTT Microcontroller][24] repository on GitHub.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/5/monitor-greenhouse-open-source

作者：[Darin London][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
