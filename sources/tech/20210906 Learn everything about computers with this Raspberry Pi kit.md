[#]: subject: "Learn everything about computers with this Raspberry Pi kit"
[#]: via: "https://opensource.com/article/21/9/raspberry-pi-crowpi2"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "XiaotingHuang22"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Learn everything about computers with this Raspberry Pi kit
======
The CrowPi is an amazing Raspberry Pi project system housed in a
laptop-like body.
![Teacher or learner?][1]

I like history, and I like computers, so I enjoy hearing stories about computing before computers were an everyday household appliance, much less a personal accessory. [One tale I hear often][2] is about how the computers of long ago (in computer years, anyway) were pleasantly basic. They were so basic, in fact, that it was relatively trivial for a curious user to figure out how to program one. Looking at modern computers, with object-oriented programming languages, complex GUI frameworks, network APIs, containers, and more, there's genuine concern that the tools of the computing trade have become essentially inaccessible to anyone without specialized training.

From the day the Raspberry Pi was released in 2012, it has always been intended as an educational platform. Several third-party vendors support the Pi with add-ons and training kits to help learners of all ages explore programming, physical computing, and open source. However, until recently, it's largely been up to the user to figure out how all the pieces on the market fit together. And then I got a CrowPi.

![CrowPi more than a laptop][3]

The CrowPi is not a laptop.
(Seth Kenlon, [CC BY-SA 4.0][4])

### Introducing the CrowPi2

Crows are surprisingly intelligent birds. They recognize and remember faces, mimic sounds they've heard, solve complex puzzles, and even use tools to accomplish a task. It's fitting that the CrowPi uses the crow as its logo and namesake because this device is packed with opportunities for exploration, experimentation, education, and, best of all, fun.

The design itself is clever: It looks like a laptop, but it's much more than that. When you lift the Bluetooth keyboard from the case, it reveals a hidden electronics workshop, complete with an LCD screen, 16 buttons, dials, RFID sensor, proximity sensor, breadboard, speakers, GPIO connections, a LED array, and much more. _And it's all programmable._

As its name implies, the unit itself is powered entirely by a Raspberry Pi, securely fastened within the underside of the case.

![crowpi pi board][5]

The CrowPi Pi board.
(Seth Kenlon, [CC BY-SA 4.0][4])

By default, you're meant to power the unit with a power adapter, and it ships with a wall adapter that you can plug into the case rather than powering the Pi directly. You can also use a battery supply plugged into an external micro-USB port. There's even a drawer built into the case so you can store your battery pack. When you do this, there's a USB cable popping out of the battery drawer and into the case power port, so there's no illusion that this is a "normal" laptop. However, with a device like this, that's pretty much the desired aesthetic!

### First boot

The CrowPi2 ships with Raspbian installed on a microSD card labeled **System**, although it includes a second microSD card loaded with [RetroPie][6], too. Being a responsible adult, I booted RetroPie first, naturally.

RetroPie is always fun, and the CrowPi2 ships with two SNES-style game controllers to ensure you have the optimal retro gaming experience.

Booting to the actual system is, amazingly, just as fun and arguably more so. The login manager is a custom project hub with quick links to sample coding projects, the Python and Arduino IDEs, Scratch, sample Python games, Minecraft, and more. You can also choose to exit the project hub and just use the desktop.

![CrowPi hub][7]

The CrowPi Hub.
(Seth Kenlon, [CC BY-SA 4.0][4])

The desktop is familiar to anyone used to the Raspberry Pi or Linux in general, but it's basic enough that it's easy to learn, too. There's an application menu in the top left, shortcut icons on the desktop, a system tray for network selection and volume control in the top right, and so on.

![CrowPi Desktop][8]

The CrowPi Desktop.
(Seth Kenlon, [CC BY-SA 4.0][4])

There's so much available on the CrowPi that it might be difficult to decide where to start. For me, there were four broad categories: Programming, physical electronics, Linux, and gaming.

There's an instruction manual in the box, so you know what you need to connect (for instance, the keyboard is battery-powered, so it does need charging sometimes, and it and the mouse always require a USB dongle). It's a quick read, though, and just one of the many examples of how seriously the CrowPi team takes documentation.

![CrowPi Docs][9]

The CrowPi Docs.
(Seth Kenlon, [CC BY-SA 4.0][4])

### Programming

If you're keen to learn how to code, there are many paths to success on the CrowPi. You should take the path that you find the most satisfying.

#### 1\. Scratch

[Scratch][10] is a simple visual coding application that lets you make games and interactive stories using code blocks that fit together like [Lego pieces][11]. It's the easiest way to begin coding, and I've seen kids as young as eight spend hours puzzling over the optimal algorithm for a game of their own design. Of course, it's not only great for kids! Adults can have a lot of fun with it, too. Not sure where to start? There's a 99-page booklet (printed on actual paper) in the box with Scratch lessons and projects for you to try.

#### 2\. Java and Minecraft

Minecraft is not open source (although there are [several open source projects][12] that reimplement it), but there's enough source available that it's often used to teach programming. Minecraft was written in Java, and the CrowPi ships with both [Minecraft Pi Edition][13] and the [BlueJ Java IDE][14] to make learning Java easier and more fun than ever.

#### 3\. Python and PyGame

There are several really fun games on the CrowPi that were written in Python and the [PyGame game engine][15]. You can play the games and then look at the source code to find out how the game works. The Geany, Thonny, and [Mu][16] editors are included on the CrowPi, so you can start programming in Python right away. As with Scratch, there's a booklet in the box with lessons so you can learn Python basics.

### Electronics

The physical electronics workshop concealed under the keyboard is essentially an array of Pi Hats. The whole thing is mapped out on a fold-out diagram in both English and Chinese so that you can identify all the components. There are plenty of sample projects to get you started. Here's a small list:

  * **Hello** prints "hello" on the LCD screen when you speak to the CrowPi.
  * **Intrusion alarm** sounds an alarm using the proximity sensor.
  * **Remote controller** enables you to use a remote control (yes, this too is included in the box) to trigger events on the CrowPi.
  * **RGB Tetris** lets you play a game of Tetris on an LED display.
  * **Voice recognition** demonstrates natural language processing.
  * **Ultrasonic music** creates a rudimentary Theramin using distance sensors and a speaker.



Those projects are just the beginning because you can build upon what exists. There's more to explore, of course. Patch cables, resistors, LEDs, and all sorts of components are included in the box so that you can learn all about the Pi's GPIO capabilities at your leisure.

One problem: The location of the sample projects is a little difficult to find. It's easy to find the demos (they're on the CrowPi hub screen), but the location of the source code isn't immediately obvious. It turns out that most of the sample projects are in `/usr/share/code`, which you can reach either through the file manager or a terminal.

![CrowPi Peripherals][17]

The CrowPi Peripherals
(Seth Kenlon, [CC BY-SA 4.0][4])

### Linux

The Raspberry Pi runs Linux. If you've been meaning to learn more about Linux, the CrowPi is a great platform for that, too. You can explore the desktop, the terminal, and nearly any Linux or open source application you can find. If you've been reading about open source for years and are ready to dive into an open source OS, this could be a platform for that (and much more, obviously).

### Gaming

The **RetroPie** SD card included in the box means you can reboot into a retro game console and play any number of old-school arcade games. It's not exactly a Steam Deck, but it's a fun and inspiring little gaming platform. Because it comes with not one but two game controllers, it's ideal for couch co-op. And best of all, you not only can play games on the CrowPi, but you can make your own games, too.

### Screwdriver included

I got to sit down with the CrowPi2 for about two weeks, and I've barely been able to get through all of the projects. There have been many nights when I've had to force myself to step away from it because even after I've tired of one project, I inevitably find something else to explore. To sum it up, I found one component in particular in the box, and I immediately knew that the CrowPi and I were well suited to one another: It was a small, humble screwdriver. There's no voiding of warranty stickers here. The CrowPi wants you to tinker, to take things apart, explore, and learn. This isn't a laptop or even just a Pi; this is a portable, low-powered, diverse, and open source learner's toolkit.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/raspberry-pi-crowpi2

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[XiaotingHuang22](https://github.com/XiaotingHuang22)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-lead-teacher-learner.png?itok=rMJqBN5G (Teacher or learner?)
[2]: https://opensource.com/article/21/8/my-first-programming-language
[3]: https://opensource.com/sites/default/files/crowpi-not-laptop.jpeg (CrowPi more than a laptop)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/crowpi-pi.jpeg (crowpi pi board)
[6]: https://opensource.com/article/19/1/retropie
[7]: https://opensource.com/sites/default/files/crowpi-hub.png (CrowPi hub)
[8]: https://opensource.com/sites/default/files/crowpi-desktop.png (CrowPi desktop)
[9]: https://opensource.com/sites/default/files/crowpi-docs.jpeg (CrowPi docs)
[10]: https://opensource.com/article/20/9/scratch
[11]: https://opensource.com/article/20/6/open-source-virtual-lego
[12]: https://opensource.com/alternatives/minecraft
[13]: https://www.minecraft.net/en-us/edition/pi
[14]: https://opensource.com/article/20/7/ide-java#bluej
[15]: https://opensource.com/downloads/python-gaming-ebook
[16]: https://opensource.com/article/18/8/getting-started-mu-python-editor-beginners
[17]: https://opensource.com/sites/default/files/crowpi-peripherals.jpeg (CrowPi peripherals)
