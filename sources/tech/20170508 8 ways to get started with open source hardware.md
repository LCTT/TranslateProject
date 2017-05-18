8 ways to get started with open source hardware
============================================================

### Making your own hardware is easier and less expensive than ever. Here's what you need to design, build, and test your first board.


![8 ways to get started with open source hardware](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/hardware_hammer_sign.jpg?itok=vh76LBib "8 ways to get started with open source hardware")
>Image by : Thomas Hawk on [Flickr][11]. [CC BY-NC 2.0][12]. Modified by Opensource.com

Alan Kay, famed computer scientist, once said, "People who are really serious about software should make their own hardware." I'd argue that's as true today as it was in 1982 when he said it. However, what's changed between then and now is that hardware has gotten faster, smaller, and most importantly: cheaper. it's now possible to buy a full computer for $5.

With big companies driving down prices for their own products, it's grown a manufacturing ecosystem capable of producing production-grade hardware that's cheap enough and accessible enough that it is now within reach of normal individuals. This accessibility and affordability are helping drive things like crowdfunding and the maker movement, but they're also giving way to more individuals being able to participate in open source through open source hardware.

Explore open hardware

*   [What is open hardware?][1]

*   [What is Raspberry Pi?][2]

*   [What is an Arduino?][3]

*   [Our latest open hardware articles][4]

There's some pretty big differences in what is or isn't open source hardware, but the Open Source Hardware Association (OSHWA) has a definition that most folks agree with, and if you're familiar with open source software this shouldn't sound too weird:

> "Open source hardware (OSHW) is a term for tangible artifacts—machines, devices, or other physical things—whose design has been released to the public in such a way that anyone can make, modify, distribute, and use those things."

There's lots of open source hardware around; you may not have noticed the boards you already use may, in fact, be open hardware. From the humble but ever versatile [Arduino][13] and all the way up through full computers like the [BeagleBone][14] family and the [C.H.I.P.][15] computer, there are lots of examples of open hardware around, and more designs are being made all the time.

Hardware can be complicated, and sometimes non-obvious to beginners why a design needs something. But open source hardware gives you the ability to not only see working examples, but also the ability to change those designs or strike off and replicate the pieces you need in your own designs, and it might be as simple as copy and paste.

### How can I get started?

Let's start off by pointing out that hardware is hard, it's complicated, sometimes esoteric, and the tools you may be using are not always the most user-friendly. It's also more than likely, as anyone who's played around with a microcontroller long enough can attest: you are going to fry something and let the magic smoke out at some point. It's ok, we've all done it, some of us repeatedly because we didn't learn the lesson the first 100 times we did something, but don't let this discourage you: Lessons are learned when things go wrong, and you usually get an interesting story to tell later.

### Modeling

The first thing to do is to start modeling what you want to do with an existing board, jumper wires, a breadboard, and whatever devices you want to hook up. In many cases, the simplest thing to play with is just adding more LEDs to a board and getting them to blink in novel ways. This is a great way to prototype something, and it's a fairly common thing to do. It won't look pretty, and you may find that you wire something wrong, but these are prototypes—you just want to prove things work. When things don't work, always double check everything, and don't be afraid to ask for help—sometimes a second pair of eyes will find your oddball ground short.

### Design

When you've figured out what you want to build, it's time to start taking your idea from jumper wires and breadboards to an actual design. This is where things can get a bit daunting, but start small—in fact, it's worth starting really small just to get used to the tooling and process, so why not make a printed circuit board that has a LED and a battery on it? Seriously, this might sound overly simplistic but there's a lot of new ground to cover here.

1.  **Find an electronic design automation (EDA) tool to use.** There are some good open source software options out there, but they aren't always the most user-friendly. [Fritzing][5], [gEDA][6], and [KiCad ][7]are all open source in ascending order of approachability. There are also some options if you want to try more commercial offerings; Eagle has a free version available with some restrictions and a lot of open source hardware designs are done in it.

1.  **Design your board in your EDA tool.** Depending on the tool you choose, this could be fairly quick, or it could be quite the exercise in learning how things work. This is one of the reasons I suggest starting small; a circuit with an LEDaan be as simple as a battery, a resistor, and an LED. The schematic capture is pretty simple, and the layout can be small and very simple.

1.  **Export your design for manufacturing.** This goes hand-in-hand with the next thing on the list, but it can also be a confusing process if you haven't done it before. There's a lot of knobs and dials to twist and adjust when you do the export, and things need to be exported in certain ways to make it easier on board houses to actually figure out what you want them to make.

1.  **Find a board house.** There are lots of board houses out there that can make your design, and some are more friendly and helpful than others. One place that's particularly awesome to work with is [OSH Park][8], these guys are very friendly and supportive of open source hardware. They also have a very solid process for confirming that what you are sending them is what will get built, so they are worth checking out. There are lots of other options though; take a look at [PCB Shopper][9], which lets you compare pricing, turnaround times, etc. of a number of solid PCB manufacturers.

1.  **Wait.** This might be the hardest part of building your own board, as it takes time to make something digital into a physical product. Plan on two weeks from when you hit "go" to getting your boards back. This is a great time to work on your next project, ensure or acquire all the parts for your current build, or generally try not to worry. On your first board it's hard—you really want it now, but be patient.

1.  **Solder up and bring up.** Once you've got your board, it's time to make it up and then test it. If you've gone with the LED option to start, it should be fairly easy to debug, and you'll have something that works. If you went more complex, be methodical and patient; sometimes things don't work and you'll need all your debugging skills to track things down.

1.  **Last, if you are doing open source hardware, release it.** We are talking about open source hardware, so make sure you include a license, but release it, share it, put it somewhere people can see what you've done. You may even want to write a blog post and submit it to someplace like Hackaday.

1.  **Above all, have fun.** Frankly if you are doing something and you aren't having fun, you should stop doing it. Open source hardware can be a lot of fun, though sometimes hard and complicated. Not everything may work; heck, I've had designs where half the board wasn't working or where I (accidentally) caused 12 shorts between power and ground. Were those boards bunked boards: yup. Did I learn something in the process: A LOT, and I won't make those same mistakes again. I'll make new ones, sure, but not THOSE. (I'd point and glare at those boards and their mistakes, but they wouldn't feel bad for me glaring at them, sadly).

There's a lot of open source hardware out there and lots of good examples to look at, copy, and derive from and lots of information to help make building hardware easier. That's what open source hardware is: A community of people making things and sharing them so that everyone can make their own things and build the hardware that they want—not the hardware they can get.

--------------------------------------------------------------------------------



作者简介：

John 'Warthog9' Hawley - John works for VMware in the Open Source Program Office on upstream open source projects. In a previous life he's worked on the MinnowBoard open source hardware project, led the system administration team on kernel.org, and built desktop clusters before they were cool. For fun he's built multiple star ship bridges, a replica of K-9 from a popular British TV show, done in flight computer vision processing from UAVs, designed and built a pile of his own hardware.

-------------------------------------

via: https://opensource.com/article/17/5/8-ways-get-started-open-source-hardware

作者：[John 'Warthog9' Hawley ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/article/17/5/8-ways-get-started-open-source-hardware
[1]:https://opensource.com/resources/what-open-hardware?src=open_hardware_resources_menu
[2]:https://opensource.com/resources/what-raspberry-pi?src=open_hardware_resources_menu
[3]:https://opensource.com/resources/what-arduino?src=open_hardware_resources_menu
[4]:https://opensource.com/tags/hardware?src=open_hardware_resources_menu
[5]:http://fritzing.org/home/
[6]:http://www.geda-project.org/
[7]:http://kicad-pcb.org/
[8]:https://oshpark.com/
[9]:http://pcbshopper.com/
[10]:https://opensource.com/article/17/5/8-ways-get-started-open-source-hardware?rate=jPBGDIa2vBXW6kb837X8JWdjI2V47hZ4KecI8-GJBjQ
[11]:https://www.flickr.com/photos/thomashawk/3048157616/in/photolist-5DmB4E-BzrZ4-5aUXCN-nvBWYa-qbkwAq-fEFeDm-fuZxgC-dufA8D-oi8Npd-b6FiBp-7ChGA3-aSn7xK-7NXMyh-a9bQQr-5NG9W7-agCY7E-4QD9zm-7HLTtj-4uCiHy-bYUUtG
[12]:https://creativecommons.org/licenses/by-nc/2.0/
[13]:https://opensource.com/node/20751
[14]:https://opensource.com/node/35211
[15]:https://opensource.com/node/24891
[16]:https://opensource.com/user/130046/feed
[17]:https://opensource.com/users/warthog9
