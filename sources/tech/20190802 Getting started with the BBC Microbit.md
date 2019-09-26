[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Getting started with the BBC Microbit)
[#]: via: (https://opensource.com/article/19/8/getting-started-bbc-microbit)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Getting started with the BBC Microbit
======
Tiny open hardware board makes it easy for anyone to learn to code with
fun projects.
![BBC Microbit board][1]

Whether you are a maker, a teacher, or someone looking to expand your Python skillset, the [BBC:Microbit][2] has something for you. It was designed by the British Broadcasting Corporation to support computer education in the United Kingdom.

The [open hardware board][3] is half the size of a credit card and packed with an ARM processor, a three-axis accelerometer, a three-axis magnetometer, a Micro USB port, a 25-pin edge connector, and 25 LEDs in a 5x5 array.

I purchased my Microbit online for $19.99. It came in a small box and included a battery pack and a USB-to-Micro USB cable. It connects to my Linux laptop very easily and shows up as a USB drive.

![BBC Microbit board][4]

### Start coding

Microbit's website offers several ways to start exploring and [coding][5] quickly, including links to [third-party code editors][6] and its two official editors: [Microsoft MakeCode][7] and [MicroPython][8], which both operate in any browser using any computer (including a Chromebook). MakeCode is a block coding editor, like the popular Scratch interface, and MicroPython is a Python 3 implementation that includes a small subset of the Python library and is designed to work on microcontrollers. Both save your created code as a HEX file, which you can download and copy to the device, just as you would with any other file you are writing to a USB drive.

The [documentation][9] suggests using the [Mu Python editor][10], which I [wrote about][11] last year, because it's designed to work with the Microbit. One advantage of the Mu editor is it uses the Python REPL (read–evaluate–print loop) to enter code directly to the device, rather than having to download and copy it over.

When you're writing code for the Microbit, it's important to begin each program with **From microbit import ***. This is true even when you're using the REPL in Mu because it imports all the objects and functions in the Microbit library.

![Beginning a Microbit project][12]

### Example projects

The documentation provides a wealth of code examples and [projects][13] that got me started hacking these incredible devices right away.

You can start out easy by getting the Microbit to say "Hello." Load your new code using the **Flash** button at the top of the Mu editor.

![Flash button loads new code][14]

There are many built-in [images][15] you can load, and you can make your own, too. To display an image, enter the code **display.show(Image.IMAGE)** where IMAGE is the name of the image you want to use. For example, **display.show(Image.HEART)** shows the built-in heart image.

The **sleep** command adds time between display commands, which I found useful for making the display work a little slower.

Here is a simple **for** loop with images and a scrolling banner for my favorite NFL football team, the Buffalo Bills. In the code, **display** is a Python object that controls the 25 LEDs on the front of the Microbit. The **show** method within the **display** object indicates which image to show. The **scroll** within the **display** object scrolls the string _"The Buffalo Bills are my team"_ across the LED array.

![Code for Microbit to display Buffalo Bills tribute][16]

The Microbit also has two buttons, Button A and Button B, that can be programmed to perform many tasks. Here is a simple example.

![Code to program Microbit buttons][17]

By attaching a speaker, the device can speak, beep, and play music. You can also program it to function as a compass and accelerometer and to respond to gestures and movement. Check the documentation for more information about these and other capabilities.

### Get involved

Research studies have found that 90% of [teachers in Denmark][18] and [students in the United Kingdom][19] learned to code by using the Microbit. As pressure mounts for programming to become a larger part of the K-12 school curriculum, inexpensive devices like the Microbit can play an important role in achieving that goal. If you want to get involved with the Microbit, be sure to join its [developer community][20].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/getting-started-bbc-microbit

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/bbc_microbit_board_hardware.jpg?itok=3HiIupG- (BBC Microbit board)
[2]: https://microbit.org/
[3]: https://tech.microbit.org/hardware/
[4]: https://opensource.com/sites/default/files/uploads/image-1.jpg (BBC Microbit board)
[5]: https://microbit.org/code/
[6]: https://microbit.org/code-alternative-editors/
[7]: https://makecode.microbit.org/
[8]: https://python.microbit.org/v/1.1
[9]: https://microbit-micropython.readthedocs.io/en/latest/tutorials/introduction.html
[10]: https://codewith.mu/en/
[11]: https://opensource.com/article/18/8/getting-started-mu-python-editor-beginners
[12]: https://opensource.com/sites/default/files/uploads/microbit1_frommicrobitimport.png (Beginning a Microbit project)
[13]: https://microbit.org/ideas/
[14]: https://opensource.com/sites/default/files/uploads/microbit2_hello.png (Flash button loads new code)
[15]: https://microbit-micropython.readthedocs.io/en/latest/tutorials/images.html
[16]: https://opensource.com/sites/default/files/uploads/microbit3_bills.png (Code for Microbit to display Buffalo Bills tribute)
[17]: https://opensource.com/sites/default/files/uploads/microbit4_buttons.png (Code to program Microbit buttons)
[18]: https://microbit.org/assets/2019-03-05-ultrabit.pdf
[19]: https://www.bbc.co.uk/mediacentre/latestnews/2017/microbit-first-year
[20]: https://tech.microbit.org/get-involved/where-to-find/
