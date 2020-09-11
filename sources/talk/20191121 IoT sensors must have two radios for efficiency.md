[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (IoT sensors must have two radios for efficiency)
[#]: via: (https://www.networkworld.com/article/3454404/iot-sensors-must-have-two-radios-for-efficiency.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

IoT sensors must have two radios for efficiency
======
To extend battery life, IoT radios that send data should be powered only when there's data to send, and a second, power-sipper radio should just listen for a wake-up signal for the principal radio. Academics say they’re making progress getting that all to work.
Jorgen Norgaard / WhatAWin / Getty Images

For the [Internet of Things][1] to become ubiquitous, many believe that inefficiencies in the powering of sensors and radios has got to be eliminated. Battery chemistry just isn’t good enough, and it’s simply too expensive to continually perform truck-rolls, for example, whenever batteries need changing out. In many cases, solar battery-top-ups aren’t the solution because that, usually-fixed, technology isn’t particularly suited to mobile, or impromptu, ad hoc networks.

Consequently, there’s a dash going on to try to find either better chemistries that allow longer battery life or more efficient chips and electronics that just sip electricity. An angle of thought being followed is to wake-up network radios only when they need to transmit a burst of data. Universities say they are making significant progress in this area.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][2]

“The problem now is that these [existing] devices do not know exactly when to synchronize with the network, so they periodically wake up to do this even when there’s nothing to communicate,” explains Patrick Mercier, a professor of electrical and computer engineering at the University of California, San Diego, in a [media release][3]. “By adding a wake-up receiver, we could improve the battery life of small IoT devices from months to years,” he says.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

### Wake-up

The school says that the key to getting the wake-up receivers to be useful is to implement them at very high frequencies. The reason: everything gets smaller, including antennas the higher in spectrum one goes. It “allowed researchers to shrink everything, including the antenna, transformer and other off-chip components down into a much smaller package,” the school explains. The school’s solution is at 9 GHz, in X Band.

The device functions using specific radio signals, called a wake-up signature, being directed at an IoT sensor’s dedicated wake-up receiver chip. That radio can operate with less energy consumption than the data radio chip because its only purpose is to listen for the wake-up signature. UC San Diego’s device uses only 22.3 nanowatts. That’s around half-a-millionth of the power that an LED night light uses, the school claims. Another, more energy-consuming radio, then, which is switched on as necessary by the wake-up radio, performs the more heavy-duty tasks – like actually sending the data.

Stanford University has also been working on IoT wake-up solutions. [I wrote about its one nanowatt, ultrasound device in 2018][5]. That’s dog-whistle-like frequency. That school, too, is working on the premise that using higher frequencies means one can design smaller electronics packages. The university claimed then on its website that its chip used “about a billionth the power it takes to light a single old-fashioned Christmas bulb.”

Importantly, both universities’ solutions allow the actual power-hog data radio to be off while not in use, not just dormant or sleeping as is common now.

### High sensitivity

UC San Diego believes its X Band device has advantages over anything that has come before on two additional counts. It explains that its design performs well in varied ambient temperatures: It claims usability from 14 F to 104 F. That temperature range means wake-up could be used in implementations outside, such as in the maritime vertical, for example.

The university also says its sensitivity numbers are the best that have ever been [published in a study][6] at -69.5 dBm. Latency is a trade-off, though, as there’s a 540ms delay. But that’s likely not a problem for much IoT use, like short burst, periodic data sends, such as are used for environmental sensing, for example.

“These numbers are pretty impressive in the field of wireless communications. Power consumption that low, while still retaining temperature robustness, all in a small, highly sensitive system,” Mercier says. "This will enable all sorts of new IoT applications.”

Join the Network World communities on [Facebook][7] and [LinkedIn][8] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3454404/iot-sensors-must-have-two-radios-for-efficiency.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3207535/what-is-iot-how-the-internet-of-things-works.html
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: https://ucsdnews.ucsd.edu/pressrelease/new-chip-for-waking-up-small-wireless-devices-could-extend-battery-life
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.networkworld.com/article/3254200/small-wake-up-receivers-could-extend-iot-sensor-life.html
[6]: https://ieeexplore.ieee.org/document/8890666
[7]: https://www.facebook.com/NetworkWorld/
[8]: https://www.linkedin.com/company/network-world
