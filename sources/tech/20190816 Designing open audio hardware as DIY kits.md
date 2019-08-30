[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Designing open audio hardware as DIY kits)
[#]: via: (https://opensource.com/article/19/8/open-audio-kit-developer)
[#]: author: (Chris Hermansen https://opensource.com/users/clhermansenhttps://opensource.com/users/alanfdosshttps://opensource.com/users/clhermansen)

Designing open audio hardware as DIY kits
======
Did you know you can build your own speaker systems? Muffsy creator
shares how he got into making open audio hardware and why he started
selling his designs to other DIYers.
![Colorful sound wave graph][1]

Previously in this series about people who are developing audio technology in the open, I interviewed [Juan Rios, developer and maintainer of Guayadeque][2] and [Sander Jansen, developer and maintainer of Goggles Music Manager][3]. These conversations have broadened my thinking and helped me enjoy their software even more than before.

For this article, I contacted Håvard Skrödahl, founder of [Muffsy][4]. His hobby is designing open source audio hardware, and he offers his designs as kits for those of us who can't wait to wind up the soldering iron for another adventure.

I've built two of Håvard's kits: a [moving coil (MC) cartridge preamp][5] and a [moving magnet (MM) cartridge phono preamp][6]. Both were a lot of fun to build and sound great. They were also a bit of a stroll down memory lane for me. In my 20s, I built some other audio kits, including a [Hafler DH-200 power amplifier][7] and a [DH-110 preamplifier][8]. Before that, I built a power amplifier using a Motorola circuit design; both the design and the amplifier were lost along the way, but they were a lot of fun!

### Meet Håvard Skrödahl, open audio hardware maker

**Q: How did you get started designing music playback hardware?**

**A:** I was a teenager in the mid-'80, and listening to records and cassettes were the only options we had. Vinyl was, of course, the best quality, while cassettes were more portable. About five years ago, I was getting back into vinyl and found myself lacking the equipment I needed. So, I decided to make my own phono stage (also called a phono preamp). The first iteration was bulky and had a relatively bad [RIAA filter][9], but I improved it during the first few months.

The first version was completely homemade. I was messing about with toner transfer and chemicals and constantly breaking drill bits to create this board. 

![Phono stage board top][10]

Top of the phono stage board

![Bottom of the phono stage board][11]

Bottom of the phono stage board

I was over the moon with this phono stage. It worked perfectly, even though the RIAA curve was out by quite a bit. It also had variable input impedance (greatly inspired by the [Audiokarma CNC phono stage][12]).

When I moved on to getting boards professionally made, I found that the impedance settings could be improved quite a bit. My setup needed adjustable gain, so I added it. The RIAA filter was completely redesigned, and it is (to my knowledge) the only accurate RIAA filter circuit that uses [standard E24 component values][13].

![Muffsy audio hardware boards][14]

Various iterations of boards in development.

**Q: How did you decide to offer your work as kits? And how did you go from kits to open source?**

**A:** The component values being E24 came from a lack of decent, component providers in my area (or so I thought, as it turned out I have a great provider nearby), so I had to go for standard values. This meant my circuit was well suited for DIY, and I started selling blank printed circuit boards on [Tindie][15].

What really made the phono stage suitable as a kit was a power supply that didn't require messing about with [mains electricity][16]. It's basically an AC adapter, a voltage doubler, and a couple of three-pin voltage regulators.

So there I was; I had a phono stage, a power supply, and the right (and relatively easy to source) components. The boards fit straight into the enclosure I'd selected, and I made a suitable back panel. I could now sell a DIY kit that turns into a working device once it is assembled. This is pretty unique; you won't see many kit suppliers provide everything that's needed to make a functional product.

![Phono stage kit with the power supply and back panel][17]

The assembled current phono stage kit with the power supply and back panel.

As a bonus, since this is just my hobby, I'm not even aiming for profit. This is also partly why my designs are open source. Not revealing who is using the designs, but you'll find them in more than one professional vinyl mastering studio, in governmental digitization projects, and even at a vinyl player manufacturer that you will have heard of.

**Q: Tell us a bit about your educational background. Are you an electrical engineer? Where did your interest in circuits come from?**

**A:** I went to a military school of electrical engineering (EE). My career has been pretty void of EE though, apart from a few years as a telephony switch technician. The music interest has stayed with me, though, and I've been dreaming of making something all my life. I would rather avoid mains electricity though, so signal level and below is where I'm happy.

**Q: In your day job, do you do hardware stuff as well? Or software? What about open source—does it matter to your day job?**

**A:** My profession is IT management, system architecture, and security. So I'm not doing any hardware designs at work. I wouldn't be where I am today without open source, so that is the other part of the reason why my designs are openly available.

**Q: Can you tell us a bit about what it takes to go from a design, to a circuit board, to producing a kit?**

**A:** I am motivated by my own needs when it comes to starting a new project. Or if I get inspired, like I was when I made a constant current [LED][18] tester. The LED tester required a very specific sub-milliampere meter, and it was kind of hard to find an enclosure for it. So the LED tester wasn't suited for a kit.

![LED tester][19]

LED tester

I made a [notch filter][20] that requires matched precision capacitors, and the potentiometers are quite hard to fine-tune. Besides, I don't see people lining up to buy this product, so it's not suited to be a kit.

![Notch filter][21]

Notch filter

I made an inverse RIAA filter using only surface-mount device [(SMD) components][22]—not something I would offer as a kit. I built an SMD vacuum pickup tool for this project, so it wasn't all for nothing.

![SMD vacuum pickup tool][23]

SMD vacuum pickup tool

I've made various PSU/transformer breakout boards, which are not suitable as kits because they require mains electricity.

![PSU/transformer breakout board][24]

PSU/transformer breakout boards

I designed and built the [MC Head Amp][25] without even owning an [MC cartridge][26]. I even built the [O2 headphone amp][27] without owning a pair of headphones, although people much smarter than me suspect it was a clever excuse for buying a pair of Sennheisers.

Kits need to be something I think people need, they must be easy to assemble (or rather difficult to assemble incorrectly), not too expensive nor require exotic components, and can't weigh too much because of the very expensive postage from Sweden.

Most importantly, I need to have time and space for another kit. This picture shows pretty much all the space I have available for my kits, two boxes deep, IKEA all the way.

![A shelf filled with boxed of Muffsy kits][28]

**Q: Are you a musician or audiophile? What kind of equipment do you have?**

**A:** I'm not a musician, and I am not an audiophile in the way most people would define such a person. I do know, from education and experience, that good sound doesn't have to cost a whole lot. It can be quite cheap, actually. A lot of the cost is in transformers, enclosures, and licenses (the stickers on the front of your gear). Stay away from those, and you're back at signal level audio that can be really affordable.

Don't get me wrong; there are a lot of gifted designers who spend an awful lot of time and creativity making the next great piece of equipment. They deserve to get paid for their work. What I mean is that the components that go into this equipment can be bought for not much money at all.

My equipment is a simple [op-amp][29]-based preamp with a rotational input-switch and a sub-$25 class-D amp based on the TPA3116 chip (which I will be upgrading to an IcePower 125ASX2). I'm using both the Muffsy Phono Preamp and the Muffsy MC Head Amp. Then I've got some really nice Dynaco A25 loudspeakers that I managed to refurbish through nothing more than good old dumb luck. I went for the cheapest Pro-Ject turntable that's still a "real" turntable. That's it. No surround, no remote control (yet), unless you count the Chromecast Audio that's connected to the back of my amp.

![Håvard Skrödahl's A/V setup][30]

Håvard's A/V setup

I'll happily shell out for quality components, good connectors, and shielded signal cables. But, to be diplomatic, I'd rather use the correct component for the job instead of the most expensive one. I do get questions about specific resistors and expensive "boutique" components now and then. I keep my answer short and remind people that my own builds are identical to what I sell on Tindie.

My preamp uses my MC Head Amp as a building block.

![Preamp internals][31]

Preamp internals

**Q: What kind of software do you use for hardware design?**

**A:** I've been using [Eagle][32] for many years. Getting into a different workflow takes a lot of time and requires a whole lot of mistakes, so no [KiCad][33] yet.

**Q: Can you tell us a bit about where your kits are going? Is there a new head amplifier? A new phono amplifier? What about a line-level pre-amp or power amp?**

**A:** If I were to do a power amp, I wouldn't dream of selling it because of what I said about mains electricity. Chip amps and [Class-D][34] seem to have taken over the DIY segment anyway, and I'm really happy with Class-D.

My latest kit is an input selector. It's something that's a cross between hardware and software as it uses an [ESP32][35] system on a chip microcontroller. And it's something that I want for myself.

The kit includes everything you need. It's got a rotational encoder, an infrared receiver, and I'm even adding a remote control to the kit. The software and hardware are available on GitHub, also under a permissive open source license, and will soon include Alexa voice support and [MQTT][36] for app or command line remote control.

![Input selector][37]

Input selector kit

My lineup now consists of preamps for MC and MM cartridges, a power supply and a back panel for them, and the input selector. I'm even selling bare circuit boards for a tube preamp and accompanying power supply.

These components make up pretty much all the internals of a complete preamplifier, which has become one of my main motivational factors.

I have nothing new or significantly better to provide in terms of an ordinary preamplifier, so I'm using a modified version of a well-known circuit. I cannot, and would not, sell this circuit, as it's proprietary.

Anyhow, here's my personal goal. It's still a work in progress, using an S3207 enclosure and a front panel made at Frontpanel Express.

![Muffsy preamp][38]

New Muffsy preamp prototype

* * *

Thanks, Håvard, that looks pretty great! I'd be happy to have something like that sitting on my Hi-Fi shelf.

I hope there are people out there just waiting to try their hand at audio kit building or even board layout from proven open source schematics, and they find Håvard's story motivating. As for me, I think my next project could be an [active crossover][39].

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/open-audio-kit-developer

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansenhttps://opensource.com/users/alanfdosshttps://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/colorful_sound_wave.png?itok=jlUJG0bM (Colorful sound wave graph)
[2]: https://opensource.com/article/19/6/creator-guayadeque-music-player
[3]: https://opensource.com/article/19/6/gogglesmm-developer-sander-jansen
[4]: https://www.muffsy.com/
[5]: https://opensource.com/article/18/5/building-muffsy-phono-head-amplifier-kit
[6]: https://opensource.com/article/18/7/diy-amplifier-vinyl-records
[7]: https://kenrockwell.com/audio/hafler/dh-200.htm
[8]: https://www.hifiengine.com/manual_library/hafler/dh-110.shtml
[9]: https://en.wikipedia.org/wiki/RIAA_equalization
[10]: https://opensource.com/sites/default/files/uploads/phono-stagetop.png (Phono stage board top)
[11]: https://opensource.com/sites/default/files/uploads/phono-stagebottom.png (Bottom of the phono stage board)
[12]: https://forum.psaudio.com/t/the-cnc-phono-stage-diy/3613
[13]: https://en.wikipedia.org/wiki/E_series_of_preferred_numbers
[14]: https://opensource.com/sites/default/files/uploads/boards.png (Muffsy audio hardware boards)
[15]: https://www.tindie.com/stores/skrodahl/
[16]: https://en.wikipedia.org/wiki/Mains_electricity
[17]: https://opensource.com/sites/default/files/uploads/phonostage-kit.png (Phono stage kit with the power supply and back panel)
[18]: https://en.wikipedia.org/wiki/Light-emitting_diode
[19]: https://opensource.com/sites/default/files/uploads/led-tester.png (LED tester)
[20]: https://en.wikipedia.org/wiki/Band-stop_filter
[21]: https://opensource.com/sites/default/files/uploads/notch-filter.png (Notch filter)
[22]: https://en.wikipedia.org/wiki/Surface-mount_technology
[23]: https://opensource.com/sites/default/files/uploads/smd-vacuum-pick-tool.png (SMD vacuum pickup tool)
[24]: https://opensource.com/sites/default/files/uploads/psu-transformer-breakout-board.png (PSU/transformer breakout board)
[25]: https://leachlegacy.ece.gatech.edu/headamp/
[26]: https://blog.audio-technica.com/audio-solutions-question-week-differences-moving-magnet-moving-coil-phono-cartridges/
[27]: http://nwavguy.blogspot.com/2011/07/o2-headphone-amp.html
[28]: https://opensource.com/sites/default/files/uploads/kit-shelves.png (Muffsy kits on shelves)
[29]: https://en.wikipedia.org/wiki/Operational_amplifier
[30]: https://opensource.com/sites/default/files/uploads/av-setup.png (Håvard Skrödahl's A/V setup)
[31]: https://opensource.com/sites/default/files/uploads/preamp-internals.png (Preamp internals)
[32]: https://en.wikipedia.org/wiki/EAGLE_(program)
[33]: https://en.wikipedia.org/wiki/KiCad
[34]: https://en.wikipedia.org/wiki/Class-D_amplifier
[35]: https://en.wikipedia.org/wiki/ESP32
[36]: http://mqtt.org/
[37]: https://opensource.com/sites/default/files/uploads/input-selector.png (Input selector)
[38]: https://opensource.com/sites/default/files/uploads/muffsy-preamp.png (Muffsy preamp)
[39]: https://www.youtube.com/watch?v=7u9OKPL1ezA&feature=youtu.be
