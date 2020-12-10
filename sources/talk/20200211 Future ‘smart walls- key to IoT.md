[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Future ‘smart walls’ key to IoT)
[#]: via: (https://www.networkworld.com/article/3519440/future-smart-walls-key-to-iot.html)
[#]: author: (Patrick Nelson https://www.networkworld.com/author/Patrick-Nelson/)

Future ‘smart walls’ key to IoT
======
MIT researchers are developing a wallpaper-like material that’s made up of simple RF switch elements and can be applied to building surfaces. Using beamforming, the antenna array could potentially improve wireless signal strength nearly tenfold.
Jason Dorfman, MIT CSAIL

IoT equipment designers shooting for efficiency should explore the potential for using buildings as antennas, researchers say.

Environmental surfaces such as walls can be used to intercept and beam signals, which can increase reliability and data throughput for devices, according to MIT's Computer Science and Artificial Intelligence Laboratory ([CSAIL][1]).

Researchers at CSAIL have been working on a smart-surface repeating antenna array called RFocus. The antennas, which could be applied in sheets like wallpaper, are designed to be incorporated into office spaces and factories. Radios that broadcast signals could then become smaller and less power intensive.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][2]

“Tests showed that RFocus could improve the average signal strength by a factor of almost 10,” CSAIL's Adam Conner-Simons [writes in MIT News][3]. “The platform is also very cost-effective, with each antenna costing only a few cents.”

The prototype system CSAIL developed uses more than 3,000 antennas embedded into sheets, which are then hung on walls. In future applications, the antennas could adhere directly to the wall or be integrated during building construction.

“People have had things completely backwards this whole time,” the article claims. “Rather than focusing on the transmitters and receivers, what if we could amplify the signal by adding antennas to an external surface in the environment itself?”

RFocus relies on [beamforming][4]; multiple antennas broadcast the same signal at slightly different times, and as a result, some of the signals cancel each other and some strengthen each other. When properly executed, beamforming can focus a stronger signal in a particular direction.

[][5]

"The surface does not emit any power of its own," the developers explain in their paper ([PDF][6]). The antennas, or RF switch elements, as the group describes them, either let a signal pass through or reflect it through software. Signal measurements allow the apparatus to define exactly what gets through and how it’s directed.

Importantly, the RFocus surface functions with no additional power requirements. The “RFocus surface can be manufactured as an inexpensive thin ‘wallpaper’ requiring no wiring,” the group says.

### Antenna design

Antenna engineering is turning into a vital part of IoT development. It's one of the principal reasons data throughput and reliability keeps improving in wireless networks.

Arrays where multiple, active panel components make up antennas, rather than a simple passive wire, as is the case in traditional radio, is an example of advancements in antenna engineering.

[Spray-on antennas][7] (unrelated to the CSAIL work) is another in-the-works technology I've written about. In that case, flexible substrates create the antenna, which is applied in a manner that's similar to spray paint. Another future direction could be anti-laser antennas: [Reversing a laser][8], where the laser becomes an absorber of light rather than the sender of it, could allow all data-carrying energy to be absorbed, making it the perfect light-based antenna.

Development of 6G wireless, which is projected to supersede 5G sometime around 2030, includes efforts to figure out how to directly [couple antennas to fiber][9]—the radio ends up being part of the cable, in other words.

"We can’t get faster internet speeds without more efficient ways of delivering wireless signals," CSAIL’s Conner-Simons says.

Join the Network World communities on [Facebook][10] and [LinkedIn][11] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3519440/future-smart-walls-key-to-iot.html

作者：[Patrick Nelson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Patrick-Nelson/
[b]: https://github.com/lujun9972
[1]: https://www.csail.mit.edu/
[2]: https://www.networkworld.com/newsletters/signup.html
[3]: http://news.mit.edu/2020/smart-surface-smart-devices-mit-csail-0203
[4]: https://www.networkworld.com/article/3445039/beamforming-explained-how-it-makes-wireless-communication-faster.html
[5]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[6]: https://drive.google.com/file/d/1TLfH-r2w1zlGBbeeM6us2sg0yq6Lm2wF/view
[7]: https://www.networkworld.com/article/3309449/spray-on-antennas-will-revolutionize-the-internet-of-things.html
[8]: https://www.networkworld.com/article/3386879/anti-lasers-could-give-us-perfect-antennas-greater-data-capacity.html
[9]: https://www.networkworld.com/article/3438337/how-6g-will-work-terahertz-to-fiber-conversion.html
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
