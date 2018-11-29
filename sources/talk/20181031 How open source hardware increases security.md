How open source hardware increases security
======
Want to boost cybersecurity at your organization? Switch to open source hardware.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/esp8266_board_hardware.jpg?itok=OTmNpKV1)

Hardware hacks are particularly scary because they trump any software security safeguards—for example, they can render all accounts on a server password-less.

Fortunately, we can benefit from what the software industry has learned from decades of fighting prolific software hackers: Using open source techniques can, perhaps counterintuitively, [make a system more secure][1]. Open source hardware and distributed manufacturing can provide protection from future attacks.

### Trust—but verify

Imagine you are a 007 agent holding classified documents. Would you feel more secure locking them in a safe whose manufacturer keeps the workings of the locks secret, or in a safe whose design is published openly so that everyone (including thieves) can judge its quality—thus enabling you to rely exclusively on technical complexity for protection?

The former approach might be perfectly secure—you simply don’t know. But why would you trust any manufacturer that could be compromised now or in the future? In contrast, the open system is almost certain to be secure, especially if enough time has passed for it to be tested by multiple companies, governments, and individuals.

To a large degree, the software world has seen the benefits of moving to free and open source software. That's why open source is run on all [supercomputers][2], [90% of the cloud, 82% of the smartphone market, and 62% of the embedded systems market][3]. Open source appears poised to dominate the future, with over [70% of the IoT][4].

In fact, security is one of the core benefits of [open source][5]. While open source is not inherently more secure, it allows you to verify security yourself (or pay someone more qualified to do so). With closed source programs, you must trust, without verification, that a program works properly. To quote President Reagan: "Trust—but verify." The bottom line is that open source allows users to make more informed choices about the security of a system—choices that are based on their own independent judgment.

### Open source hardware

This concept also holds true for electronic devices. Most electronics customers have no idea what is in their products, and even technically sophisticated companies like Amazon may not know exactly what is in the hardware that runs their servers because they use proprietary products that are made by other companies.

In the incident mentioned above, Chinese spies recently used a tiny microchip, not much bigger than a grain of rice, to infiltrate hardware made by SuperMicro (the Microsoft of the hardware world). These chips enabled outside infiltrators to access the core server functions of some of America’s leading companies and government operations, including DOD data centers, CIA drone operations, and the onboard networks of Navy warships. Operatives from the People’s Liberation Army or similar groups could have reverse-engineered or made identical or disguised modules (in this case, the chips looked like signal-conditioning couplers, a common motherboard component, rather than the spy devices they were).

Having the source available helps customers much more than hackers, as most customers do not have the resources to reverse-engineer the electronics they buy. Without the device's source, or design, it's difficult to determine whether or not hardware has been hacked.

Enter [open source hardware][6]: hardware design that is publicly available so that anyone can study, modify, test, distribute, make, or sell it, or hardware based on it. The hardware’s source is available to everyone.

### Distributed manufacturing for cybersecurity

Open source hardware and distributed manufacturing could have prevented the Chinese hack that rightfully terrified the security world. Organizations that require tight security, such as military groups, could then check the product's code and bring production in-house if necessary.

This open source future may not be far off. Recently I co-authored, with Shane Oberloier, an [article][7] that discusses a low-cost open source benchtop device that enables anyone to make a wide range of open source electronic products. The number of open source electronics designs is proliferating on websites like [Hackaday][8], [Open Electronics][9], and the [Open Circuit Institute][10], as are communities based on specific products like [Arduino][11] and around companies like [Adafruit Industries][12] and [SparkFun Electronics][13].

Every level of manufacturing that users can do themselves increases the security of the device. Not long ago, you had to be an expert to make even a simple breadboard design. Now, with open source mills for boards and electronics repositories, small companies and even individuals can make reasonably sophisticated electronic devices. While most builders are still using black-box chips on their devices, this is also changing as [open source chips gain traction][14].

![](https://opensource.com/sites/default/files/uploads/800px-oscircuitmill.png)

Creating electronics that are open source all the way down to the chip is certainly possible—and the more besieged we are by hardware hacks, perhaps it is even inevitable. Companies, governments, and other organizations that care about cybersecurity should strongly consider moving toward open source—perhaps first by establishing purchasing policies for software and hardware that makes the code accessible so they can test for security weaknesses.

Although every customer and every manufacturer of an open source hardware product will have different standards of quality and security, this does not necessarily mean weaker security. Customers should choose whatever version of an open source product best meets their needs, just as users can choose their flavor of Linux. For example, do you run [Fedora][15] for free, or do you, like [90% of Fortune Global 500 companies][16], pay Red Hat for its version and support?

Red Hat makes billions of dollars a year for the service it provides, on top of a product that can ostensibly be downloaded for free. Open source hardware can follow the [same business model][17]; it is just a less mature field, lagging [open source software by about 15 years][18].

The core source code for hardware devices would be controlled by their manufacturer, following the "[benevolent dictator for life][19]" model. Code of any kind (infected or not) is screened before it becomes part of the root. This is true for hardware, too. For example, Aleph Objects manufacturers the popular [open source LulzBot brand of 3D printer][20], a commercial 3D printer that's essentially designed to be hacked. Users have made [dozens of modifications][21] (mods) to the printer, and while they are available, Aleph uses only the ones that meet its QC standards in each subsequent version of the printer. Sure, downloading a mod could mess up your own machine, but infecting the source code of the next LulzBot that way would be nearly impossible. Customers are also able to more easily check the security of the machines themselves.

While [challenges certainly remain for the security of open source products][22], the open hardware model can help enhance cybersecurity—from the Pentagon to your living room.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/cybersecurity-demands-rapid-switch-open-source-hardware

作者：[Joshua Pearce][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jmpearce
[b]: https://github.com/lujun9972
[1]: https://dl.acm.org/citation.cfm?id=1188921
[2]: https://www.zdnet.com/article/supercomputers-all-linux-all-the-time/
[3]: https://www.serverwatch.com/server-news/linux-foundation-on-track-for-best-year-ever-as-open-source-dominates.html
[4]: https://www.itprotoday.com/iot/survey-shows-linux-top-operating-system-internet-things-devices
[5]: https://www.infoworld.com/article/2985242/linux/why-is-open-source-software-more-secure.html
[6]: https://www.oshwa.org/definition/
[7]: https://www.mdpi.com/2411-5134/3/3/64/htm
[8]: https://hackaday.io/
[9]: https://www.open-electronics.org/
[10]: http://opencircuitinstitute.org/
[11]: https://www.arduino.cc/
[12]: http://www.adafruit.com/
[13]: https://www.sparkfun.com/
[14]: https://www.wired.com/story/using-open-source-designs-to-create-more-specialized-chips/
[15]: https://getfedora.org/
[16]: https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[17]: https://openhardware.metajnl.com/articles/10.5334/joh.4/
[18]: https://www.mdpi.com/2411-5134/3/3/44/htm
[19]: https://www.theatlantic.com/technology/archive/2014/01/on-the-reign-of-benevolent-dictators-for-life-in-software/283139/
[20]: https://www.lulzbot.com/
[21]: https://forum.lulzbot.com/viewtopic.php?t=2378
[22]: https://ieeexplore.ieee.org/abstract/document/8250205
