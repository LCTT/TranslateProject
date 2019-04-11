[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to build a mobile particulate matter sensor with a Raspberry Pi)
[#]: via: (https://opensource.com/article/19/3/mobile-particulate-matter-sensor)
[#]: author: (Stephan Tetzel https://opensource.com/users/stephan)

How to build a mobile particulate matter sensor with a Raspberry Pi
======

Monitor your air quality with a Raspberry Pi, a cheap sensor, and an inexpensive display.

![Team communication, chat][1]

About a year ago, I wrote about [measuring air quality][2] using a Raspberry Pi and a cheap sensor. We've been using this project in our school and privately for a few years now. However, it has one disadvantage: It is not portable because it depends on a WLAN network or a wired network connection to work. You can't even access the sensor's measurements if the Raspberry Pi and the smartphone or computer are not on the same network.

To overcome this limitation, we added a small screen to the Raspberry Pi so we can read the values directly from the device. Here's how we set up and configured a screen for our mobile fine particulate matter sensor.

### Setting up the screen for the Raspberry Pi

There is a wide range of Raspberry Pi displays available from [Amazon][3], AliExpress, and other sources. They range from ePaper screens to LCDs with touch function. We chose an inexpensive [3.5″ LCD][4] with touch and a resolution of 320×480 pixels that can be plugged directly into the Raspberry Pi's GPIO pins. It's also nice that a 3.5″ display is about the same size as a Raspberry Pi.

The first time you turn on the screen and start the Raspberry Pi, the screen will remain white because the driver is missing. You have to install [the appropriate drivers][5] for the display first. Log in with SSH and execute the following commands:

```
$ rm -rf LCD-show
$ git clone <https://github.com/goodtft/LCD-show.git>
$ chmod -R 755 LCD-show
$ cd LCD-show/
```

Execute the appropriate command for your screen to install the drivers. For example, this is the command for our model MPI3501 screen:

```
$ sudo ./LCD35-show
```

This command installs the appropriate drivers and restarts the Raspberry Pi.

### Installing PIXEL desktop and setting up autostart

Here is what we want our project to do: If the Raspberry Pi boots up, we want to display a small website with our air quality measurements.

First, install the Raspberry Pi's [PIXEL desktop environment][6]:

```
$ sudo apt install raspberrypi-ui-mods
```

Then install the Chromium browser to display the website:

```
$ sudo apt install chromium-browser
```

Autologin is required for the measured values to be displayed directly after startup; otherwise, you will just see the login screen. However, autologin is not configured for the "pi" user by default. You can configure autologin with the **raspi-config** tool:

```
$ sudo raspi-config
```

In the menu, select: **3 Boot Options → B1 Desktop / CLI → B4 Desktop Autologin**.

There is a step missing to start Chromium with our website right after boot. Create the folder **/home/pi/.config/lxsession/LXDE-pi/** :

```
$ mkdir -p /home/pi/config/lxsession/LXDE-pi/
```

Then create the **autostart** file in this folder:

```
$ nano /home/pi/.config/lxsession/LXDE-pi/autostart
```

and paste the following code:

```
#@unclutter
@xset s off
@xset -dpms
@xset s noblank

# Open Chromium in Full Screen Mode
@chromium-browser --incognito --kiosk <http://localhost>
```

If you want to hide the mouse pointer, you have to install the package **unclutter** and remove the comment character at the beginning of the **autostart** file:

```
$ sudo apt install unclutter
```

![Mobile particulate matter sensor][7]

I've made a few small changes to the code in the last year. So, if you set up the air quality project before, make sure to re-download the script and files for the AQI website using the instructions in the [original article][2].

By adding the touch screen, you now have a mobile particulate matter sensor! We use it at our school to check the quality of the air in the classrooms or to do comparative measurements. With this setup, you are no longer dependent on a network connection or WLAN. You can use the small measuring station everywhere—you can even use it with a power bank to be independent of the power grid.

* * *

_This article originally appeared on[Open School Solutions][8] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/mobile-particulate-matter-sensor

作者：[Stephan Tetzel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stephan
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_team_mobile_desktop.png?itok=d7sRtKfQ (Team communication, chat)
[2]: https://opensource.com/article/18/3/how-measure-particulate-matter-raspberry-pi
[3]: https://www.amazon.com/gp/search/ref=as_li_qf_sp_sr_tl?ie=UTF8&tag=openschoolsol-20&keywords=lcd%20raspberry&index=aps&camp=1789&creative=9325&linkCode=ur2&linkId=51d6d7676e10d6c7db203c4a8b3b529a
[4]: https://amzn.to/2CcvgpC
[5]: https://github.com/goodtft/LCD-show
[6]: https://opensource.com/article/17/1/try-raspberry-pis-pixel-os-your-pc
[7]: https://opensource.com/sites/default/files/uploads/mobile-aqi-sensor.jpg (Mobile particulate matter sensor)
[8]: https://openschoolsolutions.org/mobile-particulate-matter-sensor/
