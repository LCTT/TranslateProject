[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Turn your Raspberry Pi into a HiFi music system)
[#]: via: (https://opensource.com/article/21/1/raspberry-pi-hifi)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)

Turn your Raspberry Pi into a HiFi music system
======
Play music for your friends, family, co-workers, or anyone else with an
inexpensive audiophile setup.
![HiFi vintage stereo][1]

For the past 10 years, I've worked remotely most of the time, but when I go into the office, I sit in a room full of fellow introverts who are easily disturbed by ambient noise and talking. We discovered that listening to music can suppress office noise, make voices less distracting, and provide a pleasant working environment with enjoyable music.

Initially, one of our colleagues brought in some old powered computer speakers, connected them to his desktop, and asked us what we wanted to listen to. It did its job, but the sound quality wasn't great, and it only worked when he was in the office. Next, we bought a pair of Altec Lansing speakers. The sound quality improved, but flexibility did not.

Not much later, we got a generic Arm single-board computer (SBC). This meant anyone could control the playlist and the speakers over the network using a web interface. But a random Arm developer board meant we could not use popular music appliance software. Updating the operating system was a pain due to a non-standard kernel, and the web interface broke frequently.

When the team grew and moved into a larger room, we started dreaming about better speakers and an easier way to handle the software and hardware combo.

To solve our issue in a way that is relatively inexpensive, flexible, and has good sound quality, we developed an office HiFi with a Raspberry Pi, speakers, and open source software.

### HiFi hardware

Having a dedicated PC for background music is overkill. It's expensive, noisy (unless it's silent, but then it's even more expensive), and not environmentally friendly. Even the cheapest Arm boards are up to the job, but they're often problematic from the software point of view. The Raspberry Pi is still on the cheap end and, while not standards-compliant, is well-supported on the hardware and the software side.

The next question was: what speakers to use. Good-quality, powered speakers are expensive. Passive speakers cost less but need an amplifier, and that would add another box to the setup. They would also have to use the Pi's audio output; while it works, it's not exactly the best, especially when you're already spending money on quality speakers and an amplifier.

Luckily, among the thousands of Raspberry Pi hardware extensions are amplifiers with built-in digital-analog converters (DAC). We selected [HiFiBerry's Amp][2]. It was discontinued soon after we bought it (replaced by an Amp+ model with a better sample rate), but it's good enough for our purposes. With air conditioning on, I don't think you can hear the difference between a DAC capable of 48kHz or 192kHz anyway.

For speakers, we chose the [Audioengine P4][3], which we bought when a shop had a clearance sale with extra-low prices. It easily fills our office room with sound without distortion (and fills much more than our room with some distortion, but neighboring engineers tend to dislike that).

### HiFi software

Maintaining Ubuntu on our old generic Arm SBC with a fixed, ancient, out-of-packaging system kernel was problematic. The Raspberry Pi OS includes a well-maintained kernel package, making it a stable and easily updated base system, but it still required us to regularly update a Python script to access Spotify and YouTube. That was a little too high-maintenance for our purposes.

Luckily, using the Raspberry Pi as a base means there are many ready-to-use software appliances available.

We settled on [Volumio][4], an open source project that turns a Pi into a music-playing appliance. Installation is a simple _next-next-finish_ process. Instead of painstakingly installing and maintaining an operating system and regularly debugging broken Python code, installation and upgrades are completely pain-free. Configuring the HiFiBerry amplifier doesn't require editing any configuration files; you can just select it from a list. Of course, getting used to a new user interface takes some time, but the stability and ease of maintenance made this change worthwhile.

![Volumio interface][5]

Screenshot courtesy of [Volumeio][4] (© Michelangelo Guarise)

### Playing music and experimenting

While we're all working from home during the pandemic, the office HiFi is installed in my home office, which means I have free reign over what it runs. A constantly changing user interface would be a pain for a team, but for someone with an R&amp;D background, playing with a device on my own, change is fun.

I'm not a programmer, but I have a strong Linux and Unix sysadmin background. That means that while I find fixing broken Python code tiresome, Volumio is just perfect enough to be boring for me (a great "problem" to have). Luckily, there are many other possibilities to play music on a Raspberry Pi.

As a terminal maniac (I even start LibreOffice from a terminal window), I mostly use Music on Console ([MOC][6]) to play music from my network-attached storage (NAS). I have hundreds of CDs, all turned into [FLAC][7] files. And I've also bought many digital albums from sources like [BandCamp][8] or [Society of Sound][9].

Another option is the [Music Player Daemon (MPD)][10]. With it running on the Raspberry Pi, I can interact with my music remotely over the network using any of the many clients available for Linux and Android.

### Can't stop the music

As you can see, the possibilities for creating an inexpensive HiFi system are almost endless on both the software and the hardware side. Our solution is just one of many, and I hope it inspires you to build something that fits your environment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/raspberry-pi-hifi

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/hi-fi-stereo-vintage.png?itok=KYY3YQwE (HiFi vintage stereo)
[2]: https://www.hifiberry.com/products/amp/
[3]: https://audioengineusa.com/shop/passivespeakers/p4-passive-speakers/
[4]: https://volumio.org/
[5]: https://opensource.com/sites/default/files/uploads/volumeio.png (Volumio interface)
[6]: https://en.wikipedia.org/wiki/Music_on_Console
[7]: https://xiph.org/flac/
[8]: https://bandcamp.com/
[9]: https://realworldrecords.com/news/society-of-sound-statement/
[10]: https://www.musicpd.org/
