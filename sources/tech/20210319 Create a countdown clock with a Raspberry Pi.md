[#]: subject: (Create a countdown clock with a Raspberry Pi)
[#]: via: (https://opensource.com/article/21/3/raspberry-pi-countdown-clock)
[#]: author: (Chris Collins https://opensource.com/users/clcollins)
[#]: collector: (lujun9972)
[#]: translator: ( Donkey-Hao )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Create a countdown clock with a Raspberry Pi
======
Start counting down the days to your next holiday with a Raspberry Pi
and an ePaper display.
![Alarm clocks with different time][1]

For 2021, [Pi Day][2] has come and gone, leaving fond memories and [plenty of Raspberry Pi projects][3] to try out. The days after any holiday can be hard when returning to work after high spirits and plenty of fun, and Pi Day is no exception. As we look into the face of the Ides of March, we can long for the joys of the previous, well, day. But fear no more, dear Pi Day celebrant! For today, we begin the long countdown to the next Pi Day!

OK, but seriously. I made a Pi Day countdown timer, and you can too!

A while back, I purchased a [Raspberry Pi Zero W][4] and recently used it to [figure out why my WiFi was so bad][5]. I was also intrigued by the idea of getting an ePaper display for the little Zero W. I didn't have a good use for one, but, dang it, it looked like fun! I purchased a little 2.13" [Waveshare display][6], which fit perfectly on top of the Raspberry Pi Zero W. It's easy to install: Just slip the display down onto the Raspberry Pi's GIPO headers and you're good to go.

I used [Raspberry Pi OS][7] for this project, and while it surely can be done with other operating systems, the `raspi-config` command, used below, is most easily available on Raspberry Pi OS.

### Set up the Raspberry Pi and the ePaper display

Setting up the Raspberry Pi to work with the ePaper display requires you to enable the Serial Peripheral Interface (SPI) in the Raspberry Pi software, install the BCM2835 C libraries (to access the GPIO functions for the Broadcom BCM 2835 chip on the Raspberry Pi), and install Python GPIO libraries to control the ePaper display. Finally, you need to install the Waveshare libraries for working with the 2.13" display using Python.

Here's a step-by-step walkthrough of how to do these tasks.

#### Enable SPI

The easiest way to enable SPI is with the Raspberry Pi `raspi-config` command. The SPI bus allows serial data communication to be used with devices—in this case, the ePaper display:


```
`$ sudo raspi-config`
```

From the menu that pops up, select **Interfacing Options** -&gt; **SPI** -&gt; **Yes** to enable the SPI interface, then reboot.

#### Install BCM2835 libraries

As mentioned above, the BCM2835 libraries are software for the Broadcom BCM2385 chip on the Raspberry Pi, which allows access to the GPIO pins and the ability to use them to control devices.

As I'm writing this, the latest version of the Broadcom BCM 2835 libraries for the Raspberry Pi is v1.68. To install the libraries, you need to download the software tarball and build and install the software with `make`:


```
# Download the BCM2853 libraries and extract them
$ curl -sSL <http://www.airspayce.com/mikem/bcm2835/bcm2835-1.68.tar.gz> -o - | tar -xzf -

# Change directories into the extracted code
$ pushd bcm2835-1.68/

# Configure, build, check and install the BCM2853 libraries
$ sudo ./configure
$ sudo make check
$ sudo make install

# Return to the original directory
$ popd
```

#### Install required Python libraries

You also need some Python libraries to use Python to control the ePaper display, the `RPi.GPIO` pip package. You also need the `python3-pil` package for drawing shapes. Apparently, the PIL package is all but dead, but there is an alternative, [Pillow][8]. I have not tested Pillow for this project, but it may work:


```
# Install the required Python libraries
$ sudo apt-get update
$ sudo apt-get install python3-pip python3-pil
$ sudo pip3 install RPi.GPIO
```

_Note: These instructions are for Python 3. You can find Python 2 instructions on Waveshare's website_

#### Download Waveshare examples and Python libraries

Waveshare maintains a Git repository with Python and C libraries for working with its ePaper displays and some examples that show how to use them. For this countdown clock project, you will clone this repository and use the libraries for the 2.13" display:


```
# Clone the WaveShare e-Paper git repository
$ git clone <https://github.com/waveshare/e-Paper.git>
```

If you're using a different display or a product from another company, you'll need to use the appropriate software for your display.

Waveshare provides instructions for most of the above on its website:

  * [WaveShare ePaper setup instructions][9]
  * [WaveShare ePaper libraries install instructions][10]



#### Get a fun font (optional)

You can display your timer however you want, but why not do it with a little style? Find a cool font to work with!

There's a ton of [Open Font License][11] fonts available out there. I am particularly fond of Bangers. You've seen this if you've ever watched YouTube—it's used _all over_. It can be downloaded and dropped into your user's local shared fonts directory to make it available for any application, including this project:


```
# The "Bangers" font is a Open Fonts License licensed font by Vernon Adams (<https://github.com/vernnobile>) from Google Fonts
$ mkdir -p ~/.local/share/fonts
$ curl -sSL <https://github.com/google/fonts/raw/master/ofl/bangers/Bangers-Regular.ttf> -o fonts/Bangers-Regular.ttf
```

### Create a Pi Day countdown timer

Now that you have installed the software to work with the ePaper display and a fun font to use, you can build something cool with it: a timer to count down to the next Pi Day!

If you want, you can just grab the [countdown.py][12] Python file from this project's [GitHub repo][13] and skip to the end of this article.

For the curious, I'll break down that file, section by section.

#### Import some libraries


```
#!/usr/bin/python3
# -*- coding:utf-8 -*-
import logging
import os
import sys
import time

from datetime import datetime
from pathlib import Path
from PIL import Image,ImageDraw,ImageFont

logging.basicConfig(level=logging.INFO)

basedir = Path(__file__).parent
waveshare_base = basedir.joinpath('e-Paper', 'RaspberryPi_JetsonNano', 'python')
libdir = waveshare_base.joinpath('lib')
```

At the start, the Python script imports some standard libraries used later in the script. You also need to add `Image`, `ImageDraw`, and `ImageFont` from the PIL package, which you'll use to draw some simple geometric shapes. Finally, set some variables for the local `lib` directory that contains the Waveshare Python libraries for working with the 2.13" display, and which you can use later to load the library from the local directory.

#### Font size helper function

The next part of the script has a helper function for setting the font size for your chosen font: Bangers-Regular.ttf. It takes an integer for the font size and returns an ImageFont object you can use with the display:


```
def set_font_size(font_size):
    logging.info("Loading font...")
    return ImageFont.truetype(f"{basedir.joinpath('Bangers-Regular.ttf').resolve()}", font_size)
```

#### Countdown logic

Next is a small function that calculates the meat of this project: how long it is until the next Pi Day. If it were, say, January, it would be relatively straightforward to count how many days are left, but you also need to consider whether Pi Day has already passed for the year (sadface), and if so, count how very, very many days are ahead until you can celebrate again:


```
def countdown(now):
    piday = datetime(now.year, 3, 14)

    # Add a year if we're past PiDay
    if piday &lt; now:
        piday = datetime((now.year + 1), 3, 14)

    days = (piday - now).days

    logging.info(f"Days till piday: {days}")
    return day
```

#### The main function

Finally, you get to the main function, which initializes the display and begins writing data to it. In this case, you'll write a welcome message and then begin the countdown to the next Pi Day. But first, you need to load the Waveshare library:


```
def main():

    if os.path.exists(libdir):
        sys.path.append(f"{libdir}")
        from waveshare_epd import epd2in13_V2
    else:
        logging.fatal(f"not found: {libdir}")
        sys.exit(1)
```

The snippet above checks to make sure the library has been downloaded to a directory alongside the countdown script, and then it loads the `epd2in13_V2` library. If you're using a different display, you will need to use a different library. You can also write your own if you are so inclined. I found it kind of interesting to read the Python code that Waveshare provides with the display. It's considerably less complicated than I would have imagined it to be, if somewhat tedious.

The next bit of code creates an EPD (ePaper Display) object to interact with the display and initializes the hardware:


```
    logging.info("Starting...")
    try:
        # Create an a display object
        epd = epd2in13_V2.EPD()

        # Initialize the displace, and make sure it's clear
        # ePaper keeps it's state unless updated!
        logging.info("Initialize and clear...")
        epd.init(epd.FULL_UPDATE)
        epd.Clear(0xFF)
```

An interesting aside about ePaper: It uses power only when it changes a pixel from white to black or vice-versa. This means when the power is removed from the device or the application stops for whatever reason, whatever was on the screen remains. That's great from a power-consumption perspective, but it also means you need to clear the display when starting up, or your script will just write over whatever is already on the screen. Hence, `epd.Clear(0xFF)` is used to clear the display when the script starts.

Next, create a "canvas" where you will draw the rest of your display output:


```
    # Create an image object
    # NOTE: The "epd.heigh" is the LONG side of the screen
    # NOTE: The "epd.width" is the SHORT side of the screen
    # Counter-intuitive...
    logging.info(f"Creating canvas - height: {epd.height}, width: {epd.width}")
    image = Image.new('1', (epd.height, epd.width), 255)  # 255: clear the frame
    draw = ImageDraw.Draw(image)
```

This matches the width and height of the display—but it is somewhat counterintuitive, in that the short side of the display is the width. I think of the long side as the width, so this is just something to note. Note that the `epd.height` and `epd.width` are set by the Waveshare library to correspond to the device you're using.

#### Welcome message

Next, you'll start to draw something. This involves setting data on the "canvas" object you created above. This doesn't draw it to the ePaper display yet—you're just building the image you want right now. Create a little welcome message celebrating Pi Day, with an image of a piece of pie, drawn by yours truly just for this project:

![drawing of a piece of pie][14]

(Chris Collins, [CC BY-SA 4.0][15])

Cute, huh?


```
    logging.info("Set text text...")
    bangers64 = set_font_size(64)
    draw.text((0, 30), 'PI DAY!', font = bangers64, fill = 0)

    logging.info("Set BMP...")
    bmp = Image.open(basedir.joinpath("img", "pie.bmp"))
    image.paste(bmp, (150,2))
```

Finally, _finally_, you get to display the canvas you drew, and it's a little bit anti-climactic:


```
    logging.info("Display text and BMP")
    epd.display(epd.getbuffer(image))
```

That bit above updates the display to show the image you drew.

Next, prepare another image to display your countdown timer.

#### Pi Day countdown timer

First, create a new image object that you can use to draw the display. Also, set some new font sizes to use for the image:


```
    logging.info("Pi Date countdown; press CTRL-C to exit")
    piday_image = Image.new('1', (epd.height, epd.width), 255)
    piday_draw = ImageDraw.Draw(piday_image)

    # Set some more fonts
    bangers36 = set_font_size(36)
    bangers64 = set_font_size(64)
```

To display a ticker like a countdown, it's more efficient to update part of the image, changing the display for only what has changed in the data you want to draw. The next bit of code prepares the display to function this way:


```
    # Prep for updating display
    epd.displayPartBaseImage(epd.getbuffer(piday_image))
    epd.init(epd.PART_UPDATE)
```

Finally, you get to the timer bit, starting an infinite loop that checks how long it is until the next Pi Day and displays the countdown on the ePaper display. If it actually _is_ Pi Day, you can handle that with a little celebration message:


```
    while (True):
        days = countdown(datetime.now())
        unit = get_days_unit(days)

        # Clear the bottom half of the screen by drawing a rectangle filld with white
        piday_draw.rectangle((0, 50, 250, 122), fill = 255)

        # Draw the Header
        piday_draw.text((10,10), "Days till Pi-day:", font = bangers36, fill = 0)

        if days == 0:
            # Draw the Pi Day celebration text!
            piday_draw.text((0, 50), f"It's Pi Day!", font = bangers64, fill = 0)
        else:
            # Draw how many days until Pi Day
            piday_draw.text((70, 50), f"{str(days)} {unit}", font = bangers64, fill = 0)

        # Render the screen
        epd.displayPartial(epd.getbuffer(piday_image))
        time.sleep(5)
```

The last bit of the script does some error handling, including some code to catch keyboard interrupts so that you can stop the infinite loop with **Ctrl**+**C** and a small function to print "day" or "days" depending on whether or not the output should be singular (for that one, single day each year when it's appropriate):


```
    except IOError as e:
        logging.info(e)

    except KeyboardInterrupt:
        logging.info("Exiting...")
        epd.init(epd.FULL_UPDATE)
        epd.Clear(0xFF)
        time.sleep(1)
        epd2in13_V2.epdconfig.module_exit()
        exit()

def get_days_unit(count):
    if count == 1:
        return "day"

    return "days"

if __name__ == "__main__":
    main()
```

And there you have it! A script to count down and display how many days are left until Pi Day! Here's an action shot on my Raspberry Pi (sped up by 86,400; I don't have nearly enough disk space to save a day-long video):

![Pi Day Countdown Timer In Action][16]

(Chris Collins, [CC BY-SA 4.0][15])

#### Install the systemd service (optional)

If you'd like the countdown display to run whenever the system is turned on and without you having to be logged in and run the script, you can install the optional systemd unit as a [systemd user service][17]).

Copy the [piday.service][18] file on GitHub to `${HOME}/.config/systemd/user`, first creating the directory if it doesn't exist. Then you can enable the service and start it:


```
$ mkdir -p ~/.config/systemd/user
$ cp piday.service ~/.config/systemd/user
$ systemctl --user enable piday.service
$ systemctl --user start piday.service

# Enable lingering, to create a user session at boot
# and allow services to run after logout
$ loginctl enable-linger $USER
```

The script will output to the systemd journal, and the output can be viewed with the `journalctl` command.

### It's beginning to look a lot like Pi Day!

And _there_ you have it! A Pi Day countdown timer, displayed on an ePaper display using a Raspberry Pi Zero W, and starting on system boot with a systemd unit file! Now there are just 350-something days until we can once again come together and celebrate the fantastic device that is the Raspberry Pi. And we can see exactly how many days at a glance with our tiny project.

But in truth, anyone can hold Pi Day in their hearts year-round, so enjoy creating some fun and educational projects with your own Raspberry Pi!

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/3/raspberry-pi-countdown-clock

作者：[Chris Collins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clcollins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/clocks_time.png?itok=_ID09GDk (Alarm clocks with different time)
[2]: https://en.wikipedia.org/wiki/Pi_Day
[3]: https://opensource.com/tags/raspberry-pi
[4]: https://www.raspberrypi.org/products/raspberry-pi-zero-w/
[5]: https://opensource.com/article/21/3/troubleshoot-wifi-go-raspberry-pi
[6]: https://www.waveshare.com/product/displays/e-paper.htm
[7]: https://www.raspberrypi.org/software/operating-systems/
[8]: https://pypi.org/project/Pillow/
[9]: https://www.waveshare.com/wiki/2.13inch_e-Paper_HAT
[10]: https://www.waveshare.com/wiki/Libraries_Installation_for_RPi
[11]: https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL
[12]: https://github.com/clcollins/epaper-pi-ex/blob/main/countdown.py
[13]: https://github.com/clcollins/epaper-pi-ex/
[14]: https://opensource.com/sites/default/files/uploads/pie.png (drawing of a piece of pie)
[15]: https://creativecommons.org/licenses/by-sa/4.0/
[16]: https://opensource.com/sites/default/files/uploads/piday_countdown.gif (Pi Day Countdown Timer In Action)
[17]: https://wiki.archlinux.org/index.php/systemd/User
[18]: https://github.com/clcollins/epaper-pi-ex/blob/main/piday.service
