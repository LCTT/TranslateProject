[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a programmable light display on Raspberry Pi)
[#]: via: (https://opensource.com/article/21/1/light-display-raspberry-pi)
[#]: author: (Darin London https://opensource.com/users/dmlond)

Build a programmable light display on Raspberry Pi
======
Celebrate the holidays or any special occasion with a DIY light display
using a Raspberry Pi, Python, and programmable LED lights.
![Lightbulb][1]

This past holiday season, I decided to add some extra joy to our house by setting up a DIY light display. I used a Raspberry Pi, a programmable light string, and Python.

<https://lh3.googleusercontent.com/pw/ACtC-3cPcJ_Lvnb-2jnZYydDOfAgovRmE5sPWoGDgw0nhHkfScmYKuebjHs7meF1-xGZZM6D92SpIQkygwg7zuM9IYi9b0AOOzwmEc1RaYzaAGcPp7YPptkntNKSGwoplQeyEcNwvqbCA6G1Ip8HVnqpLsEj=w640-h480-no?authuser=0>

You can set up your own light display for any occasion, thanks to the flexibility of the WS12911/2 (or NeoPixel) system, by following these directions.

### Prerequisites

You will need:

  * 1 – Raspberry Pi with headers and an Ethernet or WiFi connection. I used a Raspberry Pi Zero W with headers.
  * 1 – WS12811/2 light string. I used the [Alitove WS2811 Addressable LED Pixel Light 50][2], but many other types are available. Adafruit brands these as [NeoPixel][3].
  * 1 – [5v/10A AC-DC power supply for WS12811][4] if you use the Alitove. Other lights may come with a power supply.
  * 1 – Breadboard
  * 2 – Breadboard-to-Pi-header jumper wires. I used blue for the Pi GPIO pin 18 and black for the Pi ground.
  * 1 – 74AHCT125 level converter chip to safely transmit Pi GPIO wire signals to 5v/10A power without feeding back to the Pi.
  * 8 – Breadboard-to-breadboard jumper wires or solid-core 24 AWG wires. I used red/orange for 5v power, black for ground, and yellow for data.
  * 1 – SD card with Raspberry Pi OS installed. I used [Raspberry Pi OS Lite][5] and set it up in a headless mode with SSH enabled.



### What are WS2811/2 programmable LEDs?

The [WS2811/2 class of programmable lights][6] integrates red, green, and blue LED lights with a driver chip into a tiny surface-mounted package controlled through a single wire.

![Programmable LED light][7]

(Darin London, [CC BY-SA 4.0][8])

Each light can be individually programmed using an RGB set of integers or hex equivalents. These lights can be packaged together into matrices, strings, and other form factors, and they can be programmatically accessed using a data structure that makes sense for the form factor. The light strings I use are addressed using a standard Python list. Adafruit has a great [tutorial on wiring and controlling your lights][9].

### Control NeoPixel LEDs with Python

Adafruit has created a full suite of Python libraries for most of the parts it sells. These are designed to work with [CircuitPython][10], Adafruit's port of Python designed for low-cost microcontroller boards. You do not need to install CircuitPython on the Raspberry Pi OS because the preinstalled Python 2 and Python 3 are compatible.

You will need to `pip3` to install libraries for Python 3. Install it with:


```
`sudo apt-get install python3-pip`
```

Then install the following libraries:

  * [rpi_ws281x][11]
  * [Adafruit-circuitpython-neopixel][12]
  * [Adafruit-blinka][13]



Once these libraries and their dependencies are installed, you can write code like the following to program one or more lights wired to your Raspberry Pi using `sudo python3` (sudo is required):


```
import board
import neopixel
num_lights = 50
# program 50 lights with the default brightness 1.0, and autoWrite true
pixels = neopixel.NeoPixel(board.D18, num_lights)
# light 20 bright green
pixels[19] = (0,255,0)
# light all pixels red
pixels.fill((255.0,0))
# turn off neopixels
pixels.fill((0,0,0))
```

### Set up your lighting system

  1. Install the SD card into the Raspberry Pi and secure it, the breadboard, and lights [where they need to be][14] (velcro works for the Pi and breadboard).

  2. Install the 74AHCT125 level converter chip, light, power supply, and Pi according to this schematic:

![Wiring schematic][15]

([Kattni Rembor][16], [CC BY-SA 4.0][8])

  3. String additional lights to the first light using their connectors. Note the total number of lights.

  4. Plug the power supply into the wall.

  5. Plug the Raspberry Pi power supply into the wall, and wait for it to boot.




 

![Lighting hardware wiring][17]

(Darin London, [CC BY-SA 4.0][8])

![Lighting hardware wiring][18]

(Darin London, [CC BY-SA 4.0][8])

![Lighting hardware wiring][19]

(Darin London, [CC BY-SA 4.0][8])

### Install the light controller and Flask web application

I wrote a Python application and library to interact with the lights and a Flask web application that runs on the Pi. See my [Raspberry Pi Neopixel Controller][20] GitHub repository for more information about the code.

#### The lib.neopixc library

The [`lib.neopixc` library][21] extends the `neopixel.NeoPixC` class to work with two 50-light Alitove light strands connected in serial, using a programmable list of RGB colors lists. It adds the following functions: 

  * `set_color`: Takes a new list of lists of RGB colors
  * `walk`: Walks through each light and sets them to the colors in order
  * `rotate`: Pushes the last color in the list of lists to the beginning of the list of lists for blinking the lights



If you have a different number of lights, you will need to edit this library to change the `self._num_lights` value. Also, some lights require a different argument in the order constructor attribute. The Alitove is compatible with the default order attribute `neopixel.GRBW`.

#### The run_lights.py script

The [`run_lights.py` script][22] uses `lib.neopixc` to support a colors file and a state file to dynamically set how the lights behave at any time. The colors file is a JSON array of arrays of RGB (or RGBW) integers that is fed as the colors to the `lib.neopixc` object using its `set_colors` method. The state file can hold one of three words:

  * `static`: Does not rotate the lights with each iteration of the while loop
  * `blink`: Rotates the lights with each iteration of the main while loop
  * `down`: Turns all the lights off



If the state file does not exist, the default state is `static`.

The script also has HUP and INT signal handlers, which will turn off the lights when those signals are received.

Note: Because the GPIO 18 pin requires sudo on the Raspberry Pi to work, the `run_lights.py` script must be run with sudo.

#### The neopixel_controller application

The `neopixel_controller` Flask application, in the neopix_controller directory of the github repository (see below), offers a front-end browser graphical user interface (GUI) to control the lights. My raspberry pi connects to my wifi, and is accessible at raspberrypi.local. To access the GUI in a browser, go to <http://raspberrypi.local:5000>. Alternatively, you can use ping to find the IP address of raspberrypi.local, and use it as the hostname, which is useful if you have multiple raspberry pi devices connected to your wifi.

![Flask app UI][23]

(Darin London, [CC BY-SA 4.0][8])

The current state and three front-end buttons use JavaScript to interact with a set of REST API endpoints presented by the Flask application:

  * `/api/v1/state`: Returns the current state of the shared state file, which defaults to `static` if the state file does not exist
  * `/api/v1/blink`: Sets the state file to blink
  * `/api/v1/static`: Sets the state file to static
  * `/api/v1/down`: Sets the state file to down



I wrote two scripts and corresponding JSON definition files that launch `run_lights.py` and the Flask application:

  * `launch_christmas.sh`
  * `launch_new_years.sh`



These can be launched from a command-line session (terminal or SSH) on the Pi after it is set up (they do not require sudo, but use sudo internally):


```
`./launch_christmas.sh`
```

You can turn off the lights and stop `run_lights.sh` and the Flask application by using `lights_down.sh`.

The code for the library and the flask application are in the [Raspberry Pi Neopixel Controller][20] GitHub repository.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/light-display-raspberry-pi

作者：[Darin London][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dmlond
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lightbulb-idea-think-yearbook-lead.png?itok=5ZpCm0Jh (Lightbulb)
[2]: https://www.amazon.com/gp/product/B06XD72LYM
[3]: https://www.adafruit.com/category/168
[4]: https://www.amazon.com/gp/product/B01M0KLECZ
[5]: https://opensource.com/article/20/6/custom-raspberry-pi
[6]: https://learn.adafruit.com/adafruit-neopixel-uberguide
[7]: https://opensource.com/sites/default/files/uploads/led_1.jpg (Programmable LED light)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://learn.adafruit.com/neopixels-on-raspberry-pi
[10]: https://circuitpython.org/
[11]: https://pypi.org/project/rpi-ws281x/
[12]: https://circuitpython.readthedocs.io/projects/neopixel/en/latest/api.html
[13]: https://pypi.org/project/Adafruit-Blinka/
[14]: https://gpiozero.readthedocs.io/en/stable/recipes.html#pin-numbering
[15]: https://opensource.com/sites/default/files/uploads/schematic.png (Wiring schematic)
[16]: https://learn.adafruit.com/assets/64121
[17]: https://opensource.com/sites/default/files/uploads/wiring.jpg (Lighting hardware wiring)
[18]: https://opensource.com/sites/default/files/uploads/wiring2.jpg (Lighting hardware wiring)
[19]: https://opensource.com/sites/default/files/uploads/wiring3.jpg (Lighting hardware wiring)
[20]: https://github.com/dmlond/raspberry_pi_neopixel
[21]: https://github.com/dmlond/raspberry_pi_neopixel/blob/main/lib/neopixc.py
[22]: https://github.com/dmlond/raspberry_pi_neopixel/blob/main/run_lights.py
[23]: https://opensource.com/sites/default/files/uploads/neopixelui.png (Flask app UI)
