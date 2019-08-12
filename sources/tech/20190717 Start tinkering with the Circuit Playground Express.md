[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Start tinkering with the Circuit Playground Express)
[#]: via: (https://opensource.com/article/19/7/circuit-playground-express)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Start tinkering with the Circuit Playground Express
======
Learn what you can do with these tiny gadgets and a bit of Python code.
![Tools in a cloud][1]

I've been a gadget person as long as I can remember, so I was delighted when I discovered an Adafruit [Circuit Playground Express][2] (CPX) in the swag bag I got at [PyConUS][3] in May. I became fascinated with these little devices last year, when Nina Zakharenko highlighted them in her All Things Open presentation, [Five Things You Didn't Know Python Could Do][4], with Python-powered earrings.

After finding one in my PyCon bag, I set out to learn more about these mesmerizing little devices. First, I attended a "how-to" session at one of the Open Spaces meetups at PyCon. But learning always requires hands-on practice, and that's what I did when I got home. I connected the CPX device to my Linux laptop with a USB-to-MicroUSB cable. The unit mounts just like any standard USB drive, listed as CIRCUITPY.

![Circuit Playground Express mounted as USB drive][5]

The CPX works on MacOS, [Windows][6], and Linux (including [Chromebooks][7]). The device comes pre-loaded with code and some sound files. [Adafruit][8]'s extremely well-written documentation answered most of my questions. I discovered the unit can be programmed on Linux three different ways: [MakeCode][9], the [Arduino IDE][10], and the Python-based [CircuitPython][11], which I chose.

Adafruit provides excellent documentation for [creating and editing CircuitPython code][12], which I found helpful. You can use a variety of editors (e.g., Emacs, Visual Studio Code, gedit), but Adafruit recommends the [Mu Python editor][13], which I [wrote about][14] last year. I [installed Mu][15] on my system with **pip3 install --user mu-editor**. Then I opened a terminal and entered **mu-editor**. It asked me how to run Mu, and I chose Adafruit Circuit Python. Then I was able to look at the code that powers the CPX.

![Selecting CircuitPython mode to run Mu][16]

To open a connection between Mu and the CPX connected to your computer, press the Serial button in Mu. Then you can see any serial data from the CPX and edit it using Python's REPL shell.

Adafruit's programmers have written a library called **adafruit_circuitplayground.express** that enables CircuitPython to interact with the CPX board. To use it, add **import adafruit.circuitplayground.express** to your code. Or, to make it simpler, you can use the acronym **cpx**, shortening the code (as shown below) to **from adafruit_circuitplayground.express import cpx**.

![Importing Adafruit's CPX library][17]

The way you name your file is essential. The four options are code.txt, code.py, main.txt, and main.py. CircuitPython looks for the code files in that order and runs the first one it finds. Save the code to your CIRCUITPY drive each time you change it.

The main.py code included with a new CPX offers an example of the device's capabilities.

![CPX's default main.py][18]

When you execute this code, the CPX displays beautiful, brightly colored LEDs whirling in a rainbow of colors. With my rudimentary knowledge, I could tweak a few settings, like increasing the brightness and turning on the TOUCH_PIANO capability, but other modifications were beyond my coding ability at this point.

Eager to do more, I wanted to find code snippets I could use as building blocks to learn. First, I reached out to [Nina Zakharenko][19] on Twitter and asked for some help. She recommended I contact [Kattni Rembor][20], who pointed me to her GitHub repo and some [code examples][21] she wrote for the Chicago Linux User Group.

Each of these simple building blocks left me more confident in my Python journey. In addition to making lights blink, the CPX can also function as a sensor, and I wanted to try that. Here is code for a simple light sensor:

![CPX code for a blinking LED][22]

And here is the CPX with the D13 LED blinking:

![CPX with a blinking LED][23]

I also discovered a way to create some fun for my grandson by making the CPX "come to life." I recorded a couple of .wav files with Audacity and saved them to the device. Then I wrote some simple code that utilized the A and B buttons on the device to make the CPX "talk" to him:

![Code to play a sound when a button is pressed on CPX][24]

I've really enjoyed tinkering with the code to explore the CPX's capabilities. I am always looking for ways to make Python code come alive for students I teach. The CPX is a great way to help new users learn and enjoy coding and digital making. Another excellent resource for new users is Mike Barela's book _[Getting Started with Adafruit Circuit Playground Express][25]_. I found its information and examples very helpful as I was learning.

Get a [Circuit Playground Express][2] and start writing your own code. And then please share how you are using it in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/circuit-playground-express

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT (Tools in a cloud)
[2]: https://www.adafruit.com/product/3333
[3]: https://us.pycon.org/2019/
[4]: https://youtu.be/WlGkBqBRsik
[5]: https://opensource.com/sites/default/files/uploads/circuitplaygroundexpress_mounted.png (Circuit Playground Express mounted as USB drive)
[6]: https://learn.adafruit.com/adafruit-circuit-playground-express/adafruit2-windows-driver-installation
[7]: https://learn.adafruit.com/using-circuit-playground-express-makecode-circuitpython-on-a-chromebook/overview
[8]: https://learn.adafruit.com/adafruit-circuit-playground-express
[9]: https://makecode.adafruit.com/
[10]: https://learn.adafruit.com/adafruit-circuit-playground-express/arduino
[11]: https://circuitpython.org/
[12]: https://learn.adafruit.com/adafruit-circuit-playground-express/creating-and-editing-code
[13]: https://codewith.mu/en/
[14]: https://opensource.com/article/18/8/getting-started-mu-python-editor-beginners
[15]: https://codewith.mu/en/howto/1.0/install_with_python
[16]: https://opensource.com/sites/default/files/uploads/circuitplaygroundexpress_mu.png (Selecting CircuitPython mode to run Mu)
[17]: https://opensource.com/sites/default/files/uploads/circuitplaygroundexpress_import-cpx.png (Importing Adafruit's CPX library)
[18]: https://opensource.com/sites/default/files/uploads/circuitplaygroundexpress_main-py.png (CPX's default main.py)
[19]: https://twitter.com/nnja
[20]: https://learn.adafruit.com/users/kattni
[21]: https://github.com/kattni/ChiPy_2018
[22]: https://opensource.com/sites/default/files/uploads/circuitplaygroundexpress_simpleblinkingled.png (CPX code for a blinking LED)
[23]: https://opensource.com/sites/default/files/uploads/circuitplaygroundexpress_d13blinking.jpg (CPX with a blinking LED)
[24]: https://opensource.com/sites/default/files/uploads/circuitplaygroundexpress_talking.png (Code to play a sound when a button is pressed on CPX)
[25]: https://www.adafruit.com/product/3944
