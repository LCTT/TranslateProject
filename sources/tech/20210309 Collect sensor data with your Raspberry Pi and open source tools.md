[#]: subject: (Collect sensor data with your Raspberry Pi and open source tools)
[#]: via: (https://opensource.com/article/21/3/sensor-data-raspberry-pi)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Collect sensor data with your Raspberry Pi and open source tools
======
Learning more about what is going on in your home is not just useful;
it's fun!
![Working from home at a laptop][1]

I have lived in 100-plus-year-old brick houses for most of my life. They look nice, they are comfortable, and usually, they are not too expensive. However, humidity is high in the winter in my climate, and mold is a recurring problem. A desktop thermometer that displays relative humidity is useful for measuring it, but it does not provide continuous monitoring.

In comes the Raspberry Pi: It is small, inexpensive, and has many sensor options, including temperature and relative humidity. It can collect data around the clock, do some alerting, and forward data for analysis.

Recently, I participated in an experiment by [miniNodes][2] to collect and process environmental data on an all-[Arm][3] network of computers. One of my network's nodes was a [Raspberry Pi][4] that collected environmental data above my desk. Once the project was over, I was allowed to keep the hardware and play with it. This became my winter holiday project. Learning [Python][5] or [Elasticsearch][6] just to know more about them is boring. Having a practical project that utilizes these technologies is not just useful but also makes learning fun.

Originally, I planned to utilize only these two technologies. Unfortunately, my good old Arm "server," an [OverDrive 1000][7] machine for developers, and my Xeon server are too loud for continuous use above my desk. I turn them on only when I need them, which means some kind of buffering is necessary when the servers are offline. Implementing buffering for Elasticsearch as a beginner Python coder looked a bit difficult. Luckily, I know a tool that can buffer data and send it to Elasticsearch: [syslog-ng][8].

### A note about licensing

Elastic, the maintainer of Elasticsearch, has recently changed the project's license from the Apache License, an extremely permissive license approved by the Open Source Initiative, to a more restrictive license "[to protect our products and brand from abuse][9]." The term "abuse" in this context refers to the tendency of companies using Elasticsearch and Kibana and providing them to customers directly as a service without collaborating with Elastic or the Elastic community (a common critique of permissive licenses). It's still unclear how this affects users, but it's an important discussion for the open source community to have, especially as cloud services become more and more common.

To keep your project open source, use Elasticsearch version 7.10 under the Apache License.

### Configure data collection

For data collection, I have a [Raspberry Pi Model 3B+][10] with the latest Raspberry Pi OS version and a set of sensors from [SparkFun][11] connected to a [Qwiic pHat][12] add-on board (this board has been discontinued, but there are more recent boards that provide the same functionality). Since monitoring GPS does not make much sense with a fixed location and there is no lightning to detect during the winter, I connected only the environmental sensor. You can collect data from the sensor using [Python scripts available on GitHub][13].

Install the Python modules locally as a user:


```
`pip3 install sparkfun-qwiic-bme280`
```

There are three example scripts you can use to check data collection. You can download them using your browser or Git:


```
`git clone https://github.com/sparkfun/Qwiic_BME280_Py/`
```

When you start the script, it will print data in a nice, human-readable format:


```
pi@raspberrypi:~/Documents/Qwiic_BME280_Py/examples $ python3 qwiic_bme280_ex1.py

SparkFun BME280 Sensor  Example 1

Humidity:       58.396
Pressure:       128911.984
Altitude:       -6818.388
Temperature:    70.43

Humidity:       58.390
Pressure:       128815.051
Altitude:       -6796.598
Temperature:    70.41

^C
Ending Example 1
```

I am from Europe, so the default temperature data did not make much sense to me. Luckily, you can easily rewrite the code to use the metric system: just replace `temperature_fahrenheit` with `temperature_celsius`. Pressure and altitude showed some crazy values, even when I changed to the metric system, but I did not debug them. The humidity and temperature values were pretty close to what I expected (based on my desktop thermometer).

Once I verified that the relevant sensors work as expected, I started to develop my own code. It is pretty simple. First, I made sure that it printed values every second to the terminal, then I added syslog support:


```
#!/usr/bin/python3

import qwiic_bme280
import time
import sys
import syslog

# initialize sensor
sensor = qwiic_bme280.QwiicBme280()
if sensor.connected == False:
  print("Sensor not connected. Exiting")
  sys.exit(1)
sensor.begin()

# collect and log time, humidity and temperature
while True:
  t = time.localtime()
  current_time = time.strftime("%H:%M:%S", t)
  current_humidity = sensor.humidity
  current_temperature = sensor.temperature_celsius
  print("time={} humidity={} temperature={}".format(current_time,current_humidity,current_temperature))
  message = "humidity=" + str(current_humidity) + " temperature=" + str(current_temperature)
  syslog.syslog(message)
  time.sleep(1)
```

As I start the Python script using the [screen][14] utility, I also print data to the terminal. Check if the collected data arrives into syslog-ng using the `tail` command:


```
pi@raspberrypi:~ $ tail -3 /var/log/messages
Jan  5 12:11:24 raspberrypi sensor2syslog_v2.py[6213]: humidity=58.294921875 temperature=21.4
Jan  5 12:11:25 raspberrypi sensor2syslog_v2.py[6213]: humidity=58.294921875 temperature=21.4
Jan  5 12:11:26 raspberrypi sensor2syslog_v2.py[6213]: humidity=58.294921875 temperature=21.39
```

### Configure Elasticsearch

The 1GB RAM in my Pi 3B+ is way too low to run Elasticsearch and [Kibana][15], so I host them on a second machine. [Installing Elasticsearch and Kibana][16] is different on every platform, so I will not cover that. What I will cover is mapping. By default, syslog-ng sends all data as text. If you want to prepare nice graphs in Kibana, you need temperature and humidity values as floating-point numbers.

You need to set up mapping before sending data from syslog-ng. The syslog-ng configuration expects that the Sensors index uses this mapping:


```
{
  "mappings": {
    "_doc": {
      "properties": {
        "@timestamp": {
          "type": "date"
        },
        "sensors": {
          "properties": {
            "humidity": {
              "type": "float"
            },
            "temperature": {
              "type": "float"
            }
          }
        }
      }
    }
  }
}
```

Elasticsearch is now ready to collect data from syslog-ng.

### Install and configure syslog-ng

Version 3.19 of syslog-ng is included in Raspberry Pi OS, but it does not yet have Elasticsearch support. Therefore, I installed the latest version of syslog-ng from an unofficial repository. First, I added the repository key:


```
`wget -qO - https://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Raspbian_10/Release.key | sudo apt-key add -`
```

Then I added the following line to `/etc/apt/sources.list.d/sng.list`:


```
`deb https://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/Raspbian_10/ ./`
```

Finally, I updated the repositories and installed the necessary syslog-ng packages (which also removed rsyslog from the system):


```
apt-get update
apt-get install syslog-ng-mod-json syslog-ng-mod-http
```

There are many other syslog-ng subpackages, but only these two are needed to forward sensor logs to Elasticsearch.

Syslog-ng's main configuration file is `/etc/syslog-ng/syslog-ng.conf`, and you do not need to modify it. You can extend the configuration by creating new text files with a `.conf` extension under the `/etc/syslog-ng/conf.d` directory.

I created a file called `sens2elastic.conf` with the following content:


```
filter f_sensors {program("sensor2syslog_v2.py")};
parser p_kv {kv-parser(prefix("sensors."));};
destination d_sensors {
  file("/var/log/sensors" template("$(format-json @timestamp=${ISODATE} --key sensors.*)\n\n"));
  elasticsearch-http(
      index("sensors")
      type("")
      url("<http://192.168.1.129:9200/\_bulk>")
      template("$(format-json @timestamp=${ISODATE} --key sensors.*)")
      disk-buffer(
        disk-buf-size(1G)
        reliable(no)
        dir("/tmp/disk-buffer")
      )
  );
};
log {
  source(s_src);
  filter(f_sensors);
  parser(p_kv);
  destination(d_sensors);
};
```

If you are new to syslog-ng, read my article about [syslog-ng's building blocks][17] to learn about syslog-ng's configuration. The configuration snippet above shows some of the possible building blocks, except for the source, as you need to use the local log source defined in `syslog-ng.conf` (`s_src`).

The first line is a filter: it matches the program name. Mine is `sensor2syslog_v2.py`. Make sure this value is the same as the name of your Python script.

The second line is a key-value parser. By default, syslog-ng treats the message part of incoming log messages as plain text. Using this parser, you can create name-value pairs within syslog-ng from data in the log messages that you can use later when sending logs to Elasticsearch.

The next block is a bit larger. It is a destination containing two different destination drivers. The first driver saves logs to a local file in JSON format. I use this for debugging. The second driver is the Elasticsearch destination. Make sure that the index name and the URL match your environment. Using this large disk buffer, you can ensure you don't lose any data even if your Elasticsearch server is offline for days.

The last block is a bit different. It is the log statement, the part of the configuration that connects the above building blocks. The name of the source comes from the main configuration.

Save the configuration and create the `/tmp/disk-buffer/` directory. Reload syslog-ng to make the configuration live:


```
`systemctl restart syslog-ng`
```

### Test the system

The next step is to test the system. Elasticsearch is already running and prepared to receive data. Syslog-ng is configured to forward data to Elasticsearch. So, start the script to make sure data is actually collected.

For a quick test, you can start it in a terminal window. For continuous data collection, I recommend starting it from the screen utility so that it keeps running even after you disconnect from the machine. Of course, this is not fail-safe, as it will not start "automagically" on a reboot. If you want to collect data 24/7, create an init script or a systemd service file for it.

Check that logs arrive in the `/var/log/sensors` file. If it is not empty, then the filter is working as expected. Next, open Kibana. I cannot give exact instructions here, as the menu structure seems to change with each release. Create an index pattern for Kibana from the Sensors index, then change to Kibana's Discover mode, and select the freshly defined index. You should already see incoming temperature and humidity data on the screen.

You are now ready to visualize data. I used Kibana's new [Lens][18] mode to visualize temperature and humidity values. While it is not very flexible, it is definitely easier to handle than the other visualization tools in Kibana. This diagram shows the data I collected, including how values change when I ventilate my room with fresh, cold air by opening my windows.

![Graph of sensor data in Kibana Lens][19]

(Peter Czanik, [CC BY-SA 4.0][20])

### What have I learned?

My original goal was to monitor my home's relative humidity while brushing up on my Python and Elasticsearch skills. Even staying at basic levels, I now feel more comfortable working with Python and Elasticsearch.

Best of all: Not only did I practice these tools, but I also learned about relative humidity from the graphs. Previously, I often ventilated my home by opening the windows for just one or two minutes. The Kibana graphs showed that humidity went back to the original levels quite quickly after I shut the windows. When I opened the windows for five to 10 minutes instead, humidity stayed low for many hours.

### What's next?

The more adventurous can use a Raspberry Pi and sensors not just to monitor but also to control their homes. I configured everything from the ground up, but there are ready-to-use tools available such as [Home Assistant][21]. You can also configure alerting in syslog-ng to do things like [sending an alert to your Slack channel][22] if the temperature drops below a set level. There are many sensors available for the Raspberry Pi, so there are countless possibilities on both the software and hardware side.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/sensor-data-raspberry-pi

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: https://www.mininodes.com/
[3]: https://www.arm.com/
[4]: https://opensource.com/resources/raspberry-pi
[5]: https://opensource.com/tags/python
[6]: https://www.elastic.co/elasticsearch/
[7]: https://softiron.com/blog/news_20160624/
[8]: https://www.syslog-ng.com/products/open-source-log-management/
[9]: https://www.elastic.co/pricing/faq/licensing
[10]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/
[11]: https://www.sparkfun.com/
[12]: https://www.sparkfun.com/products/retired/15351
[13]: https://github.com/sparkfun/Qwiic_BME280_Py/
[14]: https://www.gnu.org/software/screen/
[15]: https://www.elastic.co/kibana
[16]: https://opensource.com/article/19/7/install-elasticsearch-and-kibana-linux
[17]: https://www.syslog-ng.com/community/b/blog/posts/building-blocks-of-syslog-ng
[18]: https://www.elastic.co/kibana/kibana-lens
[19]: https://opensource.com/sites/default/files/uploads/kibanalens_data.png (Graph of sensor data in Kibana Lens)
[20]: https://creativecommons.org/licenses/by-sa/4.0/
[21]: https://www.home-assistant.io/
[22]: https://www.syslog-ng.com/community/b/blog/posts/send-your-log-messages-to-slack
