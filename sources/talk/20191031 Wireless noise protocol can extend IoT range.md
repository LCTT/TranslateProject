[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Wireless noise protocol can extend IoT range)
[#]: via: (https://www.networkworld.com/article/3449819/wireless-noise-protocol-can-extend-iot-range.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

Wireless noise protocol can extend IoT range
======
On-off noise power communication (ONPC) protocol creates a long-distance carrier of noise energy in Wi-Fi to ping IoT devices.
Thinkstock

The effective range of [Wi-Fi][1], and other wireless communications used in [Internet of Things][2] networks could be increased significantly by adding wireless noise, say scientists.

This counter-intuitive solution could extend the range of an off-the-shelf Wi-Fi radio by 73 yards, a group led by Brigham Young University says. Wireless noise, a disturbance in the signal, is usually unwanted.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

The remarkably simple concept sends wireless noise-energy over-the-top of Wi-Fi data traffic in an additional, unrelated channel. That second channel, or carrier, which is albeit at a much lower data rate than the native Wi-Fi, travels further, and when encoded can be used to ping a sensor, say, to find out if the device is alive when the Wi-Fi link itself may have lost association through distance-caused, poor handshaking.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

The independent, additional noise channel travels further than the native Wi-Fi. “It works beyond the range of Wi-Fi,” [the scientists say in their paper][5].

Applications could be found in hard-to-reach sensor locations where the sensor might still be usefully collecting data, just be offline on the network through an iffy Wi-Fi link. Ones-and-zeroes can be encoded in the add-on channel to switch sensors on and off too.

### How it works

The on-off noise power communication (ONPC) protocol, as it’s called, works via a software hack on commodity Wi-Fi access points. Through software, part of the transmitter is converted to an RF power source, and then elements in the receiver are turned into a power measuring device. Noise energy, created by the power source is encoded, emitted and picked up by the measuring setup at the other end.

“If the access point, [or] router hears this code, it says, ‘OK, I know the sensor is still alive and trying to reach me, it’s just out of range,’” Neal Patwari of Washington University says in a Brigham Young University (BYU) [press release][6]. “It’s basically sending one bit of information that says it’s alive.”

The noise channel is much leaner than the Wi-Fi one, BYU explains. “While Wi-Fi requires speeds of at least one megabit per second to maintain a signal, ONPC can maintain a signal on as low as one bit per second—one millionth of the data speed required by Wi-Fi.” That’s enough for IoT sensor housekeeping, conceivably. Additionally, “one bit of information is sufficient for many Wi-Fi enabled devices that simply need an on [and] off message,” the school says. It uses the example of an irrigation system.

Assuring up-time, though, in hard-to-reach, dynamic environments, is where the school got the idea from. Researchers found that they were continually implementing sensors for environmental IoT experiments in hard to reach spots.

The team use an example of a sensor placed in a student’s bedroom where the occupant had placed a laundry basket in front of the important device. It had blocked the native Wi-Fi signal. The scientists, then, couldn’t get a site appointment for some weeks due to the vagaries of the subject student’s life, and they didn’t know if the trouble issue was sensor or link during that crucial time. ONPC would have allowed them to be reassured that data was still being collected and stored—or not—without the tricky-to-obtain site visit.

The researchers reckon cellular, [Bluetooth][7] and also [LoRa][8] could use ONPC, too. “We can send and receive data regardless of what Wi-Fi is doing; all we need is the ability to transmit energy and then receive noise measurements,” Phil Lundrigan of BYU says.

Join the Network World communities on [Facebook][9] and [LinkedIn][10] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3449819/wireless-noise-protocol-can-extend-iot-range.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/article/3258807/what-is-802-11ax-wi-fi-and-what-will-it-mean-for-802-11ac.html
[2]: https://www.networkworld.com/article/3207535/what-is-iot-how-the-internet-of-things-works.html
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://dl.acm.org/citation.cfm?id=3345436
[6]: https://news.byu.edu/byu-created-software-could-significantly-extend-wi-fi-range-for-smart-home-devices
[7]: https://www.networkworld.com/article/3434526/bluetooth-finds-a-role-in-the-industrial-internet-of-things.html
[8]: https://www.networkworld.com/article/3211390/lorawan-key-to-building-full-stack-production-iot-networks.html
[9]: https://www.facebook.com/NetworkWorld/
[10]: https://www.linkedin.com/company/network-world
