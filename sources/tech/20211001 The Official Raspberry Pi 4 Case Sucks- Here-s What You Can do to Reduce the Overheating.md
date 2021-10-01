[#]: subject: "The Official Raspberry Pi 4 Case Sucks! Here’s What You Can do to Reduce the Overheating"
[#]: via: "https://itsfoss.com/raspberry-pi-case-overheating/"
[#]: author: "Avimanyu Bandyopadhyay https://itsfoss.com/author/avimanyu/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

The Official Raspberry Pi 4 Case Sucks! Here’s What You Can do to Reduce the Overheating
======

The [Raspberry Pi 4][1] is an absolute favorite among millions of people, especially in the nerd community, and I’m no exception. But did you know that the Pi throttles without proper cooling?

Here, I’m going to describe some serious drawbacks in the [Official Raspberry Pi 4 Case][2] and also share some ways to mitigate them.

![Raspberry Pi 4 official case][3]

After the first boot, my Raspberry Pi 4 (8 GB RAM version) mounted inside the [Official Raspberry Pi 4 case][2], would shoot to 80 °C when the unattended upgrades kicked in. I was on Ubuntu with all [firmware updates][4] that are apparently supposed to [fix heating issues][5].

On idle, this hot vanilla and strawberry cake would never go less than 75°C.

I could hardly use it until I removed the top white cover of the case. The temperature dropped to only around 67 °C on idle — Can you believe that? Even after I double-checked after a while with a reboot. This, obviously, still isn’t also quite acceptable. If I got the case and plan to use it for long-term purpose, why would I want to keep the case lid open all the time?

And why is something like this happening? It’s all because of a very poor design of the official Raspberry Pi case.

### The Official Raspberry Pi 4 Case is a Heat Monster!

[Thermal throttling][6] in simple terms, is a reduction in the performance of your Pi processor (CPU) so that the temperature does not exceed extremely high temperatures (such as 80 °C) and [cause damage][7].

The case is built out of plastic — a poor conductor of heat (simple [old school physics][8]), and hence is unable to dissipate it effectively throughout the case and out of the Pi board. Therefore, the processor on the Pi board heats up and gets throttled down to an extremely inferior level of performance, once it literally reaches a temperature of an alarming degree. I noticed a 100% CPU usage during _**unattended upgrades**_ right after first boot with the CPU’s temperature at 80 °C.

Beautiful though it may look, the official case delivers a big blow to the Pi’s performance.

If you really want to get the most out of your Pi’s performance, you must take care of its cooling too. These heating issues cannot simply be ignored:

#### Heat gets trapped

Once you set up the Pi inside this case there is not even a single vent for that excess heat to escape. So it keeps getting accumulated inside until it reaches those crazy temps and triggers the throttle.

#### No fan outlet (badly needed)

The top white cover could have had a circular vent on top of the case for at least the [Official Raspberry Pi 4 Fan][9].

#### No passive cooling

If the case had been of metal, it could have doubled up as heat-sink and dissipate the heat efficiently out of the processor residing on the Pi board.

#### Other drawbacks apart from heating issues

The official Pi 4 case has a few more drawbacks:

  1. Inconvenient SD Card Management: It is not very convenient to assemble the Pi board inside the case and get the SD card port in the correct orientation to be able to switch cards later on.
  2. No Screwing System: No screws are provided, maybe because it could break the dummy holders on the base of the case that almost look like you could use four screws to fix the board securely onto the base.



### What can you do to control the overheating in Raspberry Pi 4?

After doing some intense research, I found some of the best cooling solutions available in the market – all thanks to our amazing modding community!

#### Use an ice tower cooler

I first found [an in-depth performance review of various Pi coolers at Jeff Geerling’s][10], who is known online as **[geerlingguy][11]**. I straightaway went for the ICE tower cooler after going through the temperature stats and assembled it:

![Raspberry Pi 4 ice tower cooler][12]

Preview | Product | Price |
---|---|---|---
![GeeekPi Raspberry Pi Cooling Fan, Raspberry Pi ICE Tower Cooler, RGB Cooling Fan with Raspberry Pi Heatsink for Raspberry Pi 4 Model B & Raspberry Pi 3B+ & Raspberry Pi 3 Model B][13] ![GeeekPi Raspberry Pi Cooling Fan, Raspberry Pi ICE Tower Cooler, RGB Cooling Fan with Raspberry Pi Heatsink for Raspberry Pi 4 Model B & Raspberry Pi 3B+ & Raspberry Pi 3 Model B][13] | [GeeekPi Raspberry Pi Cooling Fan, Raspberry Pi ICE Tower Cooler, RGB Cooling Fan with Raspberry Pi...][14] | $19.99[][15] | [Buy on Amazon][16]

Temperatures dropped to 30 °C on idle and under load, it now stays at around 45 °C. I’m yet to mod a proper case for it. There are ready to purchase cases with enough space for the cooler. You may find such cases on Amazon or other online stores.

No products found.

#### Use an aluminum heat sink for passive cooling

There is also a remarkable video online on [passive cooling][17], reviewing an aluminum heat-sink-as-a-case.

A thermal pad is provided, which is equivalent to the thermal paste used on Desktop processors. On placing it in the manner shown in the video, the heat is dissipated out of the processor on the Pi board throughout the whole case. A wonderful magic of science!

Preview | Product | Price |
---|---|---|---
![Geekworm Raspberry Pi 4 Armor Case, Raspberry Pi 4 Computer Model B Armor Aluminum Alloy Passive Cooling Case Compatible with Raspberry Pi 4 Model B Only][18] ![Geekworm Raspberry Pi 4 Armor Case, Raspberry Pi 4 Computer Model B Armor Aluminum Alloy Passive Cooling Case Compatible with Raspberry Pi 4 Model B Only][18] | [Geekworm Raspberry Pi 4 Armor Case, Raspberry Pi 4 Computer Model B Armor Aluminum Alloy Passive...][19] | $12.99[][15] | [Buy on Amazon][20]

#### Modding the official Pi case

If you still want to get the official case, it is advisable to at-least go for a fan mod:

### Potential Manufacturing Solutions

Here are some solutions that can make the whole process of manufacturing easier, by applying [DevOps][21] inspired improvements:

  * Think about it, that circular piece of plastic cut out from the top of the cover could be recycled to manufacture so many more Pi 4 cases in production. Isn’t it? It would clearly be a win-win scenario and also lowers costs as well!


  * Aluminium is the most abundant metal on earth, but [global supply disruptions][22] can be challenging. Even then, there are other [conductivity solutions][23] to explore materials used for the designing the case.



**Personal Notes**

Hope this write-up helps you in getting the most out of your Raspberry Pi 4. It’s been a quite a while since I used to write here on _**It’s FOSS**_. Feels good to be back. I’d love to know your thoughts, suggestions, and experiences down in the comments below. Please do not hesitate to share.

--------------------------------------------------------------------------------

via: https://itsfoss.com/raspberry-pi-case-overheating/

作者：[Avimanyu Bandyopadhyay][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/avimanyu/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/raspberry-pi-4/
[2]: https://www.raspberrypi.org/products/raspberry-pi-4-case/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/raspberry-pi-4-official-case.webp?resize=800%2C533&ssl=1
[4]: https://www.einfochips.com/blog/understanding-firmware-updates-the-whats-whys-and-hows/
[5]: https://www.seeedstudio.com/blog/2019/11/29/raspberry-pi-4-firmware-update-pi-4-now-runs-cooler-than-ever/
[6]: https://www.pcmag.com/encyclopedia/term/thermal-throttling
[7]: https://www.pcgamer.com/cpu-temperature-overheat/
[8]: https://thermtest.com/stay-colder-for-longer-in-a-container-made-of-plastic-or-metal
[9]: https://www.raspberrypi.org/products/raspberry-pi-4-case-fan/
[10]: https://www.jeffgeerling.com/blog/2019/best-way-keep-your-cool-running-raspberry-pi-4
[11]: https://www.jeffgeerling.com/about
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/raspberry-pi-4-ice-tower-cooler.webp?resize=480%2C360&ssl=1
[13]: https://i0.wp.com/m.media-amazon.com/images/I/51g9gQC9k7L._SL160_.jpg?ssl=1
[14]: https://www.amazon.com/dp/B07V35SXMC?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (GeeekPi Raspberry Pi Cooling Fan, Raspberry Pi ICE Tower Cooler, RGB Cooling Fan with Raspberry Pi Heatsink for Raspberry Pi 4 Model B & Raspberry Pi 3B+ & Raspberry Pi 3 Model B)
[15]: https://www.amazon.com/gp/prime/?tag=chmod7mediate-20 (Amazon Prime)
[16]: https://www.amazon.com/dp/B07V35SXMC?tag=chmod7mediate-20&linkCode=ogi&th=1&psc=1 (Buy on Amazon)
[17]: https://buildabroad.org/2016/11/05/passive-cooling/
[18]: https://i2.wp.com/m.media-amazon.com/images/I/41XGLQONCVS._SL160_.jpg?ssl=1
[19]: https://www.amazon.com/dp/B07VD568FB?tag=chmod7mediate-20&linkCode=osi&th=1&psc=1 (Geekworm Raspberry Pi 4 Armor Case, Raspberry Pi 4 Computer Model B Armor Aluminum Alloy Passive Cooling Case Compatible with Raspberry Pi 4 Model B Only)
[20]: https://www.amazon.com/dp/B07VD568FB?tag=chmod7mediate-20&linkCode=osi&th=1&psc=1 (Buy on Amazon)
[21]: https://linuxhandbook.com/what-is-devops/
[22]: https://www.reuters.com/article/global-metals-idUSL1N2Q90GA
[23]: https://news.mit.edu/2018/engineers-turn-plastic-insulator-heat-conductor-0330
