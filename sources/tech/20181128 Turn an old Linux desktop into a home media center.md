[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (Turn an old Linux desktop into a home media center)
[#]: via: (https://opensource.com/article/18/11/old-linux-desktop-new-home-media-center)
[#]: author: ([Alan Formy-Duval](https://opensource.com/users/alanfdoss))
[#]: url: ( )

Turn an old Linux desktop into a home media center
======
Repurpose an outdated computer to browse the internet and watch videos on your big screen TV.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q)

My first attempt to set up an "entertainment PC" was back in the late 1990s, using a plain old desktop computer with a Trident ProVidia 9685 PCI graphics card. I used what was known as a "TV-out" card, which had an extra output to connect to a standard television set. The onscreen result didn't look very nice and there was no audio output. And it was ugly: I had an S-Video cable running across my living room floor to my 19" Sony Trinitron CRT TV set.

I had the same sad result from Linux and Windows 98. After struggling with systems that never looked right, I gave up for a few years. Thankfully, today we have HDMI with its vastly better performance and standardized resolution, which makes an inexpensive home media center a reality.

My new media center entertainment computer is actually my old Ubuntu Linux desktop, which I recently replaced with something faster. The computer became too slow for work, but its AMD Phenom II X4 965 processor at 3.4GHz and 8GB of RAM are good enough for general browsing and video streaming.

Here are the steps I took to get the best possible performance out of this old system for its new role.

### Hardware

First, I removed unnecessary devices including a card reader, hard drives, DVD drive, and a rear-mounted USB card, and I added a PCI-Express WiFi card. I installed Ubuntu to a single solid-state drive (SSD), which can really improve the performance of any older system.

### BIOS

In the BIOS, I disabled all unused devices, such as floppy and IDE drive controllers. I disabled onboard video because I installed an NVidia GeForce GTX 650 PCI Express graphics card with an HDMI output. I also disabled onboard audio because the NVidia graphics card chipset provides audio.

### Audio

The Nvidia GeForce GTX audio device is listed in the GNOME Control Center's sound settings as a GK107 HDMI Audio Controller, so a single HDMI cable handles both audio and video. There's no need for an audio cable connected to the onboard audio output jack.

![Sound settings screenshot][2]

HDMI audio controller shown in GNOME sound settings.

### Keyboard and mouse

I have a wireless keyboard and mouse, both from Logitech. When I installed them, I plugged in both peripherals' USB receivers; they worked, but I often had signal-response problems. Then I discovered one was labeled a Unifying Receiver, which meant it can handle multiple Logitech input devices on its own. Logitech doesn't provide software to configure Unifying Receivers in Linux; fortunately, the open source utility [Solaar][3] does. Using a single receiver solved my input performance issues.

![Solaar][5]

Solaar Unifying Receiver interface.

### Video

It was initially hard to read fonts on my 47" flat-panel TV, so I enabled "Large Text" under Universal Access. I downloaded some wallpapers matching the TV's 1920x1080 resolution that look fantastic!

### Final touches

I needed to balance the computer's cooling needs with my desire for unimpeded entertainment. Since this is a standard ATX mini-tower computer, I made sure I had just enough fans with carefully configured temperature settings in the BIOS to reduce fan noise. I also placed the computer behind my entertainment console to further block fan noise but positioned so I can reach the power button.

The result is a simple machine that is not overly loud and uses only two cables—AC power and HDMI. It should be able to run any mainstream or specialized media center Linux distribution. I don't expect to do too much high-end gaming because that may require more processing horsepower.

![Showing Ubuntu Linux About page onscreen][7]

Ubuntu Linux About page.

![YouTube on the big screen][9]

Testing a YouTube video on the big screen.

I haven't yet installed a dedicated media center distribution of Linux like [Kodi][10]. For now, it is running Ubuntu Linux 18.04.1 LTS and is very stable.

This was a fun challenge to make the best of what I already had rather than buying new hardware. This is just one benefit of open source software. Eventually, I will probably replace it with a smaller, quieter system with a media-center case or another small box, but for now, it meets my needs quite well.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/old-linux-desktop-new-home-media-center

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[2]: https://opensource.com/sites/default/files/uploads/soundsettings.png (Sound settings screenshot)
[3]: https://pwr.github.io/Solaar/
[5]: https://opensource.com/sites/default/files/uploads/solaar_interface.png (Solaar)
[7]: https://opensource.com/sites/default/files/uploads/finalresult1.png (Showing Ubuntu Linux About page onscreen)
[9]: https://opensource.com/sites/default/files/uploads/finalresult2.png (YouTube on the big screen)
[10]: https://kodi.tv/
