hankchow translating

How to measure particulate matter with a Raspberry Pi
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bubblehands_fromRHT_520_0612LL.png?itok=_iQ2dO3S)
We regularly measure particulate matter in the air at our school in Southeast Asia. The values here are very high, particularly between February and May, when weather conditions are very dry and hot, and many fields burn. These factors negatively affect the quality of the air. In this article, I will show you how to measure particulate matter using a Raspberry Pi.

### What is particulate matter?

Particulate matter is fine dust or very small particles in the air. A distinction is made between PM10 and PM2.5: PM10 refers to particles that are smaller than 10µm; PM2.5 refers to particles that are smaller than 2.5µm. The smaller the particles—i.e., anything smaller than 2.5µm—the more dangerous they are to one's health, as they can penetrate into the alveoli and impact the respiratory system.

The World Health Organization recommends [limiting particulate matter][1] to the following values:

  * Annual average PM10 20 µg/m³
  * Annual average PM2,5 10 µg/m³ per year
  * Daily average PM10 50 µg/m³ without permitted days on which exceeding is possible.
  * Daily average PM2,5 25 µg/m³ without permitted days on which exceeding is possible.



These values are below the limits set in most countries. In the European Union, an annual average of 40 µg/m³ for PM10 is allowed.

### What is the Air Quality Index (AQI)?

The Air Quality Index indicates how “good” or “bad” air is based on its particulate measurement. Unfortunately, there is no uniform standard for AQI because not all countries calculate it the same way. The Wikipedia article on the [Air Quality Index][2] offers a helpful overview. At our school, we are guided by the classification established by the United States' [Environmental Protection Agency][3].


![Air quality index][5]

Air quality index

### What do we need to measure particulate matter?

Measuring particulate matter requires only two things:

  * A Raspberry Pi (every model works; a model with WiFi is best)
  * A particulates sensor SDS011



![Particulate sensor][7]

Particulate sensor

If you are using a Raspberry Pi Zero W, you will also need an adapter cable to a standard USB port because the Zero has only a Micro USB. These are available for about $20. The sensor comes with a USB adapter for the serial interface.

### Installation

For our Raspberry Pi we download the corresponding Raspbian Lite Image and [write it on the Micro SD card][8]. (I will not go into the details of setting up the WLAN connection; many tutorials are available online).

If you want to have SSH enabled after booting, you need to create an empty file named `ssh` in the boot partition. The IP of the Raspberry Pi can best be obtained via your own router/DHCP server. You can then log in via SSH (the default password is raspberry):
```
$ ssh pi@192.168.1.5

```

First we need to install some packages on the Pi:
```
$ sudo apt install git-core python-serial python-enum lighttpd

```

Before we can start, we need to know which serial port the USB adapter is connected to. `dmesg` helps us:
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

In the last line, you can see our interface: `ttyUSB0`. We now need a small Python script that reads the data and saves it in a JSON file, and then we will create a small HTML page that reads and displays the data.

### Reading data on the Raspberry Pi

We first create an instance of the sensor and then read the sensor every 5 minutes, for 30 seconds. These values can, of course, be adjusted. Between the measuring intervals, we put the sensor into a sleep mode to increase its lifespan (according to the manufacturer, the lifespan totals approximately 8000 hours).

We can download the script with this command:
```
$ wget -O /home/pi/aqi.py https://raw.githubusercontent.com/zefanja/aqi/master/python/aqi.py

```

For the script to run without errors, two small things are still needed:
```
$ sudo chown pi:pi /var/wwww/html/

$ echo[] > /var/wwww/html/aqi.json

```

Now you can start the script:
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

### Run the script automatically

So that we don’t have to start the script manually every time, we can let it start with a cronjob, e.g., with every restart of the Raspberry Pi. To do this, open the crontab file:
```
$ crontab -e

```

and add the following line at the end:
```
@reboot cd /home/pi/ && ./aqi.py

```

Now our script starts automatically with every restart.

### HTML page for displaying measured values and AQI

We have already installed a lightweight webserver, `lighttpd`. So we need to save our HTML, JavaScript, and CSS files in the directory `/var/www/html/` so that we can access the data from another computer or smartphone. With the next three commands, we simply download the corresponding files:
```
$ wget -O /var/wwww/html/index.html https://raw.githubusercontent.com/zefanja/aqi/master/html/index.html

$ wget -O /var/wwww/html/aqi.js https://raw.githubusercontent.com/zefanja/aqi/master/html/aqi.js

$ wget -O /var/wwww/html/style.css https://raw.githubusercontent.com/zefanja/aqi/master/html/style.css

```

The main work is done in the JavaScript file, which opens our JSON file, takes the last value, and calculates the AQI based on this value. Then the background colors are adjusted according to the scale of the EPA.

Now you simply open the address of the Raspberry Pi in your browser and look at the current particulates values, e.g., [http://192.168.1.5:][9]

The page is very simple and can be extended, for example, with a chart showing the history of the last hours, etc. Pull requests are welcome.

The complete [source code is available on Github][10].

**[Enter our[Raspberry Pi week giveaway][11] for a chance at this arcade gaming kit.]**

### Wrapping up

For relatively little money, we can measure particulate matter with a Raspberry Pi. There are many possible applications, from a permanent outdoor installation to a mobile measuring device. At our school, we use both: There is a sensor that measures outdoor values day and night, and a mobile sensor that checks the effectiveness of the air conditioning filters in our classrooms.

[Luftdaten.info][12] offers guidance to build a similar sensor. The software is delivered ready to use, and the measuring device is even more compact because it does not use a Raspberry Pi. Great project!

Creating a particulates sensor is an excellent project to do with students in computer science classes or a workshop.

What do you use a [Raspberry Pi][13] for?

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/how-measure-particulate-matter-raspberry-pi

作者：[Stephan Tetzel][a]
译者：[译者ID](https://github.com/译者ID)
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
