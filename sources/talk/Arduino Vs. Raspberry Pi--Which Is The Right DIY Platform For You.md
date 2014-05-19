Arduino Vs. Raspberry Pi: Which Is The Right DIY Platform For You?
================================================================================
![](http://readwrite.com/files/styles/1400_0/public/fields/arduinopi.jpg)

If you’re at all familiar with do-it-yourself (DIY) electronics, you’ve probably heard about the comparable merits of [Arduino][1] and [Raspberry Pi][2]. You may have even, [like I did][3], assumed they were competing hardware platforms solving similar problems.

Actually, Arduino and Raspberry Pi are quite different. For starters, Raspberry Pi is a fully functional computer, while Arduino is a microcontroller, which is just a single component of a computer. 

Here’s a primer to differentiating Arduino and Raspberry Pi, and to determining which of the two DIY hacking devices best fits your needs as a maker. 

### Overview ###

Raspberry Pi and Arduino were both originally designed to be teaching tools, which is why they’ve become so popular—both devices are very easy to learn to use. 

Raspberry Pi hails from the United Kingdom. Inventor Eben Upton and his colleagues at the University of Cambridge’s Computer Laboratory were frustrated by the dwindling number of students, and the poor skill levels of those students, entering the program. Raspberry Pi was designed to be a cheap, hackable computer for improving tinkering skills. While Upton worked on prototypes from 2006 onward, the first shipment of Pis became available in [April 2012][4].

Arduino, on the other hand, was born in Italy. It was named after the bar where inventor Massimo Banzi and his cofounders first forged the idea. Banzi, a teacher at the Interaction Design Institute Ivrea, wanted a simple hardware prototyping tool for his design students.

As teaching tools, both Arduino and Raspberry Pi suitable for beginners. It’s only when examining their hardware and software that it becomes apparent they’re used for very different types of projects. 

### Hardware And Software ###

Here’s an overview of some of the specs that show the biggest differences between the two:

<table cellspacing="0" cellpadding="0">
<tbody>
<tr>
<td>
<p>&nbsp;</p>
</td>
<td>
<p><strong>Arduino Uno</strong></p>
</td>
<td>
<p><strong>Raspberry Pi Model B</strong></p>
</td>
</tr>
<tr>
<td>
<p><strong>Price</strong></p>
</td>
<td>
<p>$30</p>
</td>
<td>
<p>$35</p>
</td>
</tr>
<tr>
<td>
<p><strong>Size</strong></p>
</td>
<td>
<p>7.6 x 1.9 x 6.4 cm</p>
</td>
<td>
<p>8.6cm x 5.4cm x 1.7cm</p>
</td>
</tr>
<tr>
<td>
<p><strong>Memory&nbsp;</strong></p>
</td>
<td>
<p>0.002MB</p>
</td>
<td>
<p>512MB</p>
</td>
</tr>
<tr>
<td>
<p><strong>Clock Speed</strong></p>
</td>
<td>
<p>16 MHz</p>
</td>
<td>
<p>700 MHz</p>
</td>
</tr>
<tr>
<td>
<p><strong>On Board Network</strong></p>
</td>
<td>
<p>None</p>
</td>
<td>
<p>10/100 wired Ethernet RJ45</p>
</td>
</tr>
<tr>
<td>
<p><strong>Multitasking</strong></p>
</td>
<td>
<p>No</p>
</td>
<td>
<p>Yes</p>
</td>
</tr>
<tr>
<td>
<p><strong>Input voltage</strong></p>
</td>
<td>
<p>7 to 12 V</p>
</td>
<td>
<p>5 V</p>
</td>
</tr>
<tr>
<td>
<p><strong>Flash</strong></p>
</td>
<td>
<p>32KB</p>
</td>
<td>
<p>SD Card (2 to 16G)&nbsp;</p>
</td>
</tr>
<tr>
<td>
<p><strong>USB&nbsp;</strong></p>
</td>
<td>
<p>One, input only</p>
</td>
<td>
<p>Two, peripherals OK</p>
</td>
</tr>
<tr>
<td>
<p><strong>Operating System</strong></p>
</td>
<td>
<p>None</p>
</td>
<td>
<p>Linux distributions</p>
</td>
</tr>
<tr>
<td>
<p><strong>Integrated Development Environment</strong></p>
</td>
<td>
<p>Arduino</p>
</td>
<td>
<p>Scratch, IDLE, anything with Linux support</p>
</td>
</tr>
</tbody>
</table>

The price and size of the two devices are comparable; we already knew Raspberry Pi and Arduino were tiny and cheap. It’s the stuff inside that sets them apart.

The Raspberry Pi is 40 times faster than an Arduino when it comes to clock speed. Even more seemingly damning for Arduino, Pi has 128,000 times more RAM. The Raspberry Pi is an independent computer that can run an actual operating system in Linux. It can multitask, support two USB ports, and connect wirelessly to the Internet. In short, it’s powerful enough to function as a personal computer (though not powerful enough to compete with your Mac or PC). 

It might sound like Raspberry Pi is superior to Arduino, but that's only when it comes to software applications. Arduino’s simplicity makes it a much better bet for pure hardware projects. 

I asked Limor Fried, the founder of [Adafruit][5], a DIY electronics store that offers parts and kits for both Arduino and Pi projects, about her expert opinion on their differences. An MIT educated engineer whose mission in life is to teach electronics to people of all skill levels, Fried knows both platforms better than most. 

“Arduino does have a 'real-time' and 'analog' capability that the Pi does not: This flexibility allows it to work with just about any kind of sensor or chips,” Fried said. “The Pi is not as flexible; for example, reading analog sensors requires extra hardware assistance. There are also thousands of tutorials on hooking an Arduino into just about every kind of part. On the other hand, the Pi benefits from decades of Linux software, so they're both great choices.”

The Arduino IDE is significantly easier to use than Linux. For example, if you wanted to write a program to blink an LED with Raspberry Pi, you’d need to install an operating system and some code libraries—and that’s just to start. On Arduino, you can get an LED light to blink in just eight lines of code. Since Arduino isn’t designed to run an OS or a lot of software, you can just plug it in and get started. 

Raspberry Pi can multitask processes—it can run multiple programs in the background while activated. For example, I have a Raspberry Pi that is serving as both a print server and a [VPN server][6] at the same time. 

On the other hand, you can leave an Arduino plugged in as it conducts a single process for a long time, and just unplug it when you’re not using it. This is why Fried would recommend the Arduino for beginners before she would the Pi:  

“The Arduino is simpler, harder to 'break' or 'damage' and has much more learning resources at this time for beginners,” Fried said. “With the Pi you have to learn some Linux as well as programming—such as Python. The Arduino works with any computer and can run off of a battery. You can also turn it on and off safely at any time. The Pi setup can be damaged by unplugging it without a proper shutdown.” 

While the Raspberry Pi shines in software application, the Arduino makes hardware projects very simple. It’s simply a matter of figuring out what you want to do. 

### Working Together ###

The ultimate answer when deciding between the Pi and Arduino is, “Why choose?” If you’re looking to learn about electronics, each one will teach you something different.  

According to Fried, Raspberry Pi and Arduino are complementary. She suggested a scenario where the Arduino is the sensory workhouse, while the Pi doles out directions:

“They work great together,” Fried said. “The Arduino is best for motor driving, sensor reading, LED driving, etc while you can have an Internet-connected Pi drive it, a mini computer that can play videos, music or send emails with ease.”

Author Simon Monk, who has written dozens of books on both Pi and Arduino, blogged a tutorial for [getting Raspberry Pi to talk to Arduino][7] in just a few lines of code. It makes use of a Python library, [PySerial][8], that the Arduino foundation recommends as the easiest way to get computers to talk to Arduino. 

Once you’ve got that down, the possibilities are infinite. You could [homebrew beer][9], with the Arduino controlling the sensors and the Pi managing the brains of the operation. You could also create a [platform for making robots][10] that are much more capable than plain Arduino or Raspberry Pi bots.

### Community ###

Both Raspberry Pi and Arduino have large, active communities surrounding them. Not only are they used in schools and universities, but also in hackerspaces worldwide. 

Here are some of the places you can visit to get Raspberry Pi support and project ideas:

- [The Raspberry Pi Foundation — FAQs][10]
- [The Raspberry Pi Foundation — Project Forums][11]
- [Learn Raspberry Pi with Adafruit][12]
- [Element 14 (Pi’s manufacturer) Raspberry Pi Community][13]
- [The Raspberry Pi Wiki][14]

Here are some of the places you can visit to get the same for Arduino:

- [Arduino’s Official Getting Started Guide][15]
- [Arduino Playground][16]
- [Arduino Official Forums][17]
- [Learn Arduino with Adafruit][18]
- [r/arduino on Reddit][19]

Photo by [Simon Monk][20]

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/05/07/arduino-vs-raspberry-pi-projects-diy-platform#feed=/hack&awesm=~oEFMq68riarQK2

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://readwrite.com/2014/04/21/easy-arduino-projects-basics-tutorials-diy-hardware
[2]:http://readwrite.com/2014/01/20/raspberry-pi-everything-you-need-to-know
[3]:http://readwrite.com/2014/04/16/arduino-raspberry-pi-connected-home-tutorials-projects
[4]:http://www.raspberrypi.org/archives/1081
[5]:http://www.adafruit.com/
[6]:http://readwrite.com/2014/04/10/raspberry-pi-vpn-tutorial-server-secure-web-browsing
[7]:http://www.doctormonk.com/2012/04/raspberry-pi-and-arduino.html
[8]:http://playground.arduino.cc/Interfacing/Python
[9]:http://www.brewpi.com/
[10]:http://www.raspberrypi.org/help/faqs/
[11]:http://www.raspberrypi.org/forums/viewforum.php?f=15
[12]:https://learn.adafruit.com/category/learn-raspberry-pi
[13]:http://www.element14.com/community/community/raspberry-pi
[14]:http://elinux.org/RPi_Hub
[15]:http://arduino.cc/en/Guide/HomePage
[16]:http://playground.arduino.cc/Projects/ArduinoUsers
[17]:http://forum.arduino.cc/
[18]:https://learn.adafruit.com/category/learn-arduino
[19]:http://www.reddit.com/r/Arduino
[20]:http://www.doctormonk.com/2012/04/raspberry-pi-and-arduino.html