Out in the Open: The Little-Known Open Source OS That Rules the Internet of Things
================================================================================
![](http://www.wired.com/wp-content/uploads/2014/06/Contiki-ipv6-rpl-cooja-simulation.png)
Image: Adnk/[Wikipedia][1]

You can connect almost anything to a computer network. Light bulbs. Thermostats. Coffee makers. Even badgers. Yes, badgers.

Badgers spend a lot of time underground, which make it difficult for biologists and zoologists to track their whereabouts and activities. GPS, for example, doesn’t work well underground or in enclosed areas. But about five years ago, University of Oxford researchers Andrew Markham and Niki Trigoni [solved that problem][2] by inventing a wireless tracking system that can work underground. Their system is clever, but they didn’t do it alone. Like many other scientists, they turned to open source to avoid having to rebuild fundamental components from scratch. One building block they used is an open source operating system called [Contiki][3].

“Contiki was a real enabler as it allowed us to do rapid prototyping and easily shift between different hardware platforms,” says Markham, now an associate professor at the University of Oxford.

Contiki isn’t nearly so well-known as Windows or OS X or even Linux, but for more than a decade, it has been the go-to operating system for hackers, academics, and companies building network-connected devices like sensors, trackers, and web-based automation systems. Developers love it because it’s lightweight, it’s free, and it’s mature. It provides a foundation for developers and entrepreneurs eager to bring us all the internet-connected gadgets the internet of things promises, without having to develop the underlying operating system those gadgets will need.

Perhaps the biggest thing Contiki has going for it is that it’s small. Really small. While Linux requires one megabyte of RAM, Contiki needs just a few kilobytes to run. Its inventor, Adam Dunkels, has managed to fit an entire operating system, including a graphical user interface, networking software, and a web browser into less than 30 kilobytes of space. That makes it much easier to run on small, low powered chips–exactly the sort of things used for connected devices–but it’s also been ported to many older systems like the Apple IIe and the Commodore 64.

![Adam Dunkels. Photo: Sara Arnald](http://www.wired.com/wp-content/uploads/2014/06/Adam_Dunkels.jpg)
Adam Dunkels. Photo: Sara Arnald

Contiki will soon face competition from the likes of Microsoft, which recently [announced Windows for the Internet of Things][4]. But while Microsoft’s new operating system will be free for devices less than 9 inches in size, it won’t be open source. And Contiki has an 11-year head start.

Contiki started in 2003, but its roots stretch to Dunkels’ days as a computer science student at Mälardalen University in Sweden. In 2000, he was working on a project to use wireless sensors to track hockey players’ vital signs and display them on a screen the crowd could see. “We convinced them to have this thing up their nose so we could measure their breathing rates,” Dunkels recalls.

To make the sensors work correctly, Dunkels had to write software would enable them to interact with a computer network. He called the resulting code [LwIP][5], for “light weight internet protocol.” Although LwIP is still used in many microcontrollers and other products today, Dunkels decided it wasn’t quite lightweight enough. In 2003, he created microIP, which evolved into Contiki. The OS was an immediate hit with researchers and hobbyists, and has in recent years attracted commercial users including [Rad-DX][6] radiation detection devices and [Zolertia][7] noise monitoring system.

While Nest, the web connected thermostat company [Google acquired for $3.2 billion][8] in January, has come to define the Internet of Things, Dunkels notes that many companies have been using network-connected devices for years in applications including industrial and building automation. “With something like CES you see all the consumer stuff, but there are just so many different aspects of this,” Dunkel says.

But consumer technology companies are beginning to embrace Contiki as well. The [LiFX][9] “smart light bulb” is using the operating system, for example, as is the Nest competitor [Tado][10].

To help support the burgeoning commercial usage of Contiki, Dunkels left his job as a professor at the Swedish Institute of Computer Science and founded [Thingsquare][11], a startup focused on providing a cloud-based back-end for Contiki devices. The idea is to make it easy for developers to connect their hardware devices with smartphones and the web. Thingsquare manages the servers, and provides all the software necessary to manage a device over the web.

--------------------------------------------------------------------------------

via: http://www.wired.com/2014/06/contiki/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://en.wikipedia.org/wiki/File:Contiki-ipv6-rpl-cooja-simulation.png
[2]:http://www.cs.ox.ac.uk/projects/WILDSENSING/
[3]:http://www.contiki-os.org/
[4]:http://www.wired.com/2014/04/free-windows/
[5]:https://savannah.nongnu.org/projects/lwip/
[6]:http://www.dtectsystems.com/rad-DX_page.html
[7]:http://zolertia.com/home
[8]:http://www.wired.com/2014/01/googles-3-billion-nest-buy-finally-make-internet-things-real-us/
[9]:http://lifx.co/
[10]:http://www.tado.com/de-en/
[11]:http://www.thingsquare.com/