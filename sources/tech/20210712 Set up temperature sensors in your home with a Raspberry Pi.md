[#]: subject: (Set up temperature sensors in your home with a Raspberry Pi)
[#]: via: (https://opensource.com/article/21/7/temperature-sensors-pi)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Set up temperature sensors in your home with a Raspberry Pi
======
Find out how hot your house is with a simple home Internet of Things
project.
![Orange home vintage thermostat][1]

It's HOT! I suppose I can't complain too much about living in paradise, but when my wife and I moved to Hawaii last fall, I didn't really think too much about the weather. Don't get me wrong, the weather is lovely pretty much all the time, and we keep our windows open 24/7, but that means it is pretty warm in the house right now in the middle of summer.

So, where does all this humble bragging intersect with open source? Well, we're planning to get a whole-house fan—one of those big ones that suck all the air out of your house and force it into the attic, pushing all the hot air out of the attic in the process. I am _sure_ this will make the house way cooler, but the geek in me wants to know just how much cooler.

So today, I'm playing with temperature sensors, [Raspberry Pis][2], and [Python][3].

Play along at home! Nothing like a little #CitizenScience!

![DHT22 sensor and Raspberry Pi Zero W][4]

 Charming little development environment, isn't it? (Chris Collins, [CC BY-SA 4.0][5])

Yes, OK, I could just buy a thermometer or two, check them each day, and see what happens. But why do that when you can totally overengineer a solution, automate the data collection, and graph it all over time, amirite?

Here's what I need:

  * Raspberry Pi Zero W (or, really, any Raspberry Pi)
  * DHT22 digital sensor
  * SD card



### Connect the DHT22 sensor to the Raspberry Pi

You can find a bunch of inexpensive DHT22 temperature and humidity sensors with a quick web search. The DHT22 is a digital sensor, making it easy to interact with. If you purchase a raw sensor, you'll need a resistor and some soldering skills to get it working (check out Pi My Life Up's DHT22 article for [great instructions on working with the raw sensor][6]), but you can also purchase one with a small PCB that includes all that, which is what I did.

The DHT22 with the PCB attached has three pins: a Positive pin (marked with **+**), a Data pin, and a Ground pin (marked with **-**). You can wire the DHT22 directly to the Raspberry Pi Zero W. I used Raspberry Pi Spy's [Raspberry Pi GPIO guide][7] to make sure I connected everything correctly.

The Positive pin provides power from the Pi to the DHT22. The DHT22 runs on 3v-6v, so I selected one of the 5v pins on the Raspberry Pi to provide the power. I connected the Data pin on the DHT22 to one of the Raspberry Pi GPIO pins. I am using GPIO4 for this, but any would work; just make a note of the one you choose, as the Python code that reads the data from the sensor will need to know which pin to read from. Finally, I connected the Ground pin on the DHT22 to a ground pin on the Raspberry Pi header.

This is how I wired it up:

  * DHT22 Positive pin &lt;-&gt; Raspberry Pi GPIO v5 pin (#2)
  * DHT22 Data pin &lt;-&gt; Raspberry Pi GPIO4 pin (#7)
  * DHT22 Ground pin &lt;-&gt; Raspberry Pi Group pin (#6)



This diagram from Raspberry Pi Spy shows the pin layout for the Raspberry Pi Zero W (among others).

![Raspberry Pi GPIO header diagram][8]

(Copyright 2021, [Matt Hawkins][7])

### Install the DHT sensor software

Before proceeding, make sure you have an operating system installed on the Raspberry Pi Zero W and can connect to it remotely or with a keyboard. If not, consult my article about [customizing different operating system images][9] for Raspberry Pi. I am using [Raspberry Pi OS Lite][10], released May 7, 2021, as the image for the Raspberry Pi Zero W.

Once you've installed the operating system on an SD card and booted the Raspberry Pi from the card, there are only a couple of other software packages to install to interact with the DHT22.

First, install the Python Preferred Installer Program (pip) with `apt-get`, and then use pip to install the [Adafruit DHT sensor library for Python][11] to interact with the DHT22 sensor.


```
# Install pip3
sudo apt-get install python3-pip

# Install the Adafruit DHT sensor library
sudo pip3 install Adafruit_DHT
```

### Get sensor data with Python

With the DHT libraries installed, you can connect to the sensor and retrieve temperature and humidity data.

Create a file with:


```
#!/usr/bin/env python3

import sys
import argparse
import time

# This imports the Adafruit DHT software installed via pip
import Adafruit_DHT

# Initialize the DHT22 sensor
SENSOR = Adafruit_DHT.DHT22

# GPIO4 on the Raspberry Pi
SENSOR_PIN = 4

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-f", "--fahrenheit", help="output temperature in Fahrenheit", action="store_true")

    return parser.parse_args()

def celsius_to_fahrenheit(degrees_celsius):
        return (degrees_celsius * 9/5) + 32

def main():
    args = parse_args()

    while True:
        try:
            # Gather the humidity and temperature
            # data from the sensor; GPIO Pin 4
            humidity, temperature = Adafruit_DHT.read_retry(SENSOR, SENSOR_PIN)

        except RuntimeError as e:
            # GPIO access may require sudo permissions
            # Other RuntimeError exceptions may occur, but
            # are common.  Just try again.
            print(f"RuntimeError: {e}")
            print("GPIO Access may need sudo permissions.")

            time.sleep(2.0)
            continue

        if args.fahrenheit:
            print("Temp: {0:0.1f}*F, Humidity: {1:0.1f}%".format(celsius_to_fahrenheit(temperature), humidity))
        else:
            print("Temp:{0:0.1f}*C, Humidity: {1:0.1f}%".format(temperature, humidity))

        time.sleep(2.0)

if __name__ == "__main__":
    main()
```

The important bits here are initializing the sensor and setting the correct GPIO pin to use on the Raspberry Pi:


```
# Initialize the DHT22 sensor
SENSOR = Adafruit_DHT.DHT22

# GPIO4 on the Raspberry Pi
SENSOR_PIN = 4
```

Another important bit is reading the data from the sensor with the variables set above for the sensor and pin:


```
# This connects to the sensor "SENSOR"
# Using the Raspberry Pi GPIO Pin 4, "SENSOR_PIN"
    humidity, temperature = Adafruit_DHT.read_retry(SENSOR, SENSOR_PIN)
```

Finally, run the script! You should end up with something like this:

![Output of the sensor script][12]

84 degrees and 50% humidity. Oof! Hot and humid in here! (Chris Collins, [CC BY-SA 4.0][5])

Success!

### Where to go from here

I have three of these DHT22 sensors and three Raspberry Pi Zero Ws connected to my WiFi. I've installed them into some small project boxes, hot-glued the sensors to the outside, and set them up in my living room, office, and bedroom. With this setup, I can collect sensor data from them whenever I want by SSHing into the Raspberry Pi and running this script.

But why stop there? Manually SSHing into them each time is tedious and too much work. I can do better!

In a future article, I'll explain how to set up this script to run automatically at startup with a [systemd service][13], set up a web server to display the data, and instrument this script to export data in a format that can be read by [Prometheus][14], a monitoring system and time series database. I use Prometheus at work to collect data about OpenShift/Kubernetes clusters, plot trends, and create alerts based on the data. Why not go totally overboard and do the same thing with temperature and humidity data at home? This way, I can get baseline data and then see how well the whole-house fan changes things!

#CitizenScience!

Jeff Geerling is a father concered with his kid's cold room and their sleep because of it. To...

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/temperature-sensors-pi

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/home-thermostat.jpg?itok=wuV1XL7t (Orange home vintage thermostat)
[2]: https://www.raspberrypi.org/
[3]: https://www.python.org/
[4]: https://opensource.com/sites/default/files/uploads/dht22.png (DHT22 sensor and Raspberry Pi Zero W)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://pimylifeup.com/raspberry-pi-humidity-sensor-dht22/
[7]: https://www.raspberrypi-spy.co.uk/2012/06/simple-guide-to-the-rpi-gpio-header-and-pins/
[8]: https://opensource.com/sites/default/files/uploads/raspberry_pi_gpio_layout_model_b_plus.png (Raspberry Pi GPIO header diagram)
[9]: https://opensource.com/article/20/5/disk-image-raspberry-pi
[10]: https://www.raspberrypi.org/software/operating-systems/
[11]: https://github.com/adafruit/Adafruit_Python_DHT
[12]: https://opensource.com/sites/default/files/uploads/temperature_sensor.png (Output of the sensor script)
[13]: https://www.freedesktop.org/software/systemd/man/systemd.service.html
[14]: https://prometheus.io/
