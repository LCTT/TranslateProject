[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (This is how System76 does open hardware)
[#]: via: (https://opensource.com/article/19/4/system76-hardware)
[#]: author: (Don Watkins  https://opensource.com/users/don-watkins)

This is how System76 does open hardware
======
What sets the new Thelio line of desktops apart from the rest.
![metrics and data shown on a computer screen][1]

Most people know very little about the hardware in their computers. As a long-time Linux user, I've had my share of frustration while getting my wireless cards, video cards, displays, and other hardware working with my chosen distribution. Proprietary hardware often makes it difficult to determine why an Ethernet controller, wireless controller, or mouse performs differently than we expect. As Linux distributions have matured, this has become less of a problem, but we still see some quirks with touchpads and other peripherals, especially when we don't know much—if anything—about our underlying hardware.

Companies like [System76][2] aim to take these types of problems out of the Linux user experience. System76 manufactures a line of Linux laptops, desktops, and servers, and even offers its own Linux distro, [Pop! OS][3], as an option for buyers, Recently I had the privilege of visiting System76's plant in Denver for [the unveiling][4] of [Thelio][5], its new desktop product line.

### About Thelio

System76 says Thelio's open hardware daughterboard, named Thelio Io after the fifth moon of Jupiter, is one thing that makes the computer unique in the marketplace. Thelio Io is certified [OSHWA #us000145][6] and has four SATA ports for storage and an embedded controller for fan and power button control. Thelio Io SAS is certified [OSHWA #us000146][7] and has four U.2 ports for storage and no embedded controller. During a demonstration, System76 showed how these components adjust fans throughout the chassis to optimize the unit's performance.

The controller also runs the power button and the LED ring around the button, which glows at 100% brightness when it is pressed. This provides both tactile and visual confirmation that the unit is being powered on. While the computer is in use, the button is set to 35% brightness, and when it's in suspend mode, it pulses between 2.35% and 25%. When the computer is off, the LED remains dimly lit so that it's easy to find the power control in a dark room.

Thelio's embedded controller is a low-power [ATmega32U4][8] microchip, and the controller's setup can be prototyped with an Arduino Micro. The number of Thelio Io boards changes depending on which Thelio model you purchase.

Thelio is also perhaps the best-designed computer case and system I have ever seen. You'll probably agree if you have ever skinned your knuckles trying to operate inside a typical PC case. I have done this a number of times, and I have the scars to prove it.

### Why open hardware?

The boards were designed in [KiCAD][9], and you can access all of Thelio's design files under GPL on [GitHub][10]. So, why would a company that competes with other PC manufacturers design a unique interface then license it openly? It's because the company recognizes the value of open design and the ability to share and adjust an I/O board to your needs, even if you're a competitor in the marketplace.

![Don Watkins speaks with System76 CEO Carl Richell at the Thelio launch event.][11]

Don Watkins speaks with System76 CEO Carl Richell at the [Thelio launch event][12].

I asked [Carl Richell][13], System76's founder and CEO, whether the company is concerned that openly licensing its hardware designs means someone could take its unique design and use it to drive System76 out of business. He said:

> Open hardware benefits all of us. It's how we further advance technology and make it more available to everyone. We welcome anyone who wishes to improve on Thelio's design to do so. Opening the hardware not only helps advance improvements of our computers more quickly, but it also empowers our customers to truly own 100% of their device. Our goal is to remove as much proprietary functioning as we can, while still producing a competitive Linux computer for customers.
>
> We've been working with the Linux community for over 13 years to create a flawless and digestible experience on all of our laptops, desktops, and servers. Our long tenure serving the Linux community, providing our customers with a high level of service, and our personability are what makes System76 unique.

I also asked Carl why open hardware makes sense for System76 and the PC business in general. He replied:

> System76 was founded on the idea that technology should be open and accessible to everyone. We're not yet at the point where we can create a computer that is 100% open source, but with open hardware, we're one large, essential step closer to reaching that point.
>
> We live in an era where technology has become a utility. Computers are tools for people at every level of education and across many industries. With everyone's needs specific, each person has their own ideas on how they might improve the computer and its software as their primary tool. Having our computers open allows these ideas to come to fruition, which in turn makes the technology a more powerful tool. In an open environment, we constantly get to iterate a better PC. And that's kind of cool.

We wrapped up our conversation by talking about System76's roadmap, which includes open hardware mini PCs and, eventually, laptops. Existing mini PCs and laptops sold under the System76 brand are manufactured by other vendors and are not based on open hardware (although their Linux software is, of course, open source).

Designing and supporting open hardware is a game-changer in the PC business, and it is what sets System76's new Thelio line of desktop computers apart.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/system76-hardware

作者：[Don Watkins ][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://system76.com/
[3]: https://opensource.com/article/18/1/behind-scenes-popos-linux
[4]: /article/18/11/system76-thelio-desktop-computer
[5]: https://system76.com/desktops
[6]: https://certification.oshwa.org/us000145.html
[7]: https://certification.oshwa.org/us000146.html
[8]: https://www.microchip.com/wwwproducts/ATmega32u4
[9]: http://kicad-pcb.org/
[10]: https://github.com/system76/thelio-io
[11]: https://opensource.com/sites/default/files/uploads/don_system76_ceo.jpg (Don Watkins speaks with System76 CEO Carl Richell at the Thelio launch event.)
[12]: https://trevgstudios.smugmug.com/System76/121418-Thelio-Press-Event/i-FKWFxFv
[13]: https://www.linkedin.com/in/carl-richell-9435781
