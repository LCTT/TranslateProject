[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a retro gaming console with RetroPie)
[#]: via: (https://opensource.com/article/19/1/retropie)
[#]: author: (Jay LaCroix https://opensource.com/users/jlacroix)

Build a retro gaming console with RetroPie
======
Play your favorite classic Nintendo, Sega, and Sony console games on Linux.
![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/open_gaming_games_roundup_news.png?itok=KM0ViL0f)

The most common question I get on [my YouTube channel][1] and in person is what my favorite Linux distribution is. If I limit the answer to what I run on my desktops and laptops, my answer will typically be some form of an Ubuntu-based Linux distro. My honest answer to this question may surprise many. My favorite Linux distribution is actually [RetroPie][2].

As passionate as I am about Linux and open source software, I'm equally passionate about classic gaming, specifically video games produced in the '90s and earlier. I spend most of my surplus income on older games, and I now have a collection of close to a thousand games for over 20 gaming consoles. In my spare time, I raid flea markets, yard sales, estate sales, and eBay buying games for various consoles, including almost every iteration made by Nintendo, Sega, and Sony. There's something about classic games that I adore, a charm that seems lost in games released nowadays.

Unfortunately, collecting retro games has its fair share of challenges. Cartridges with memory for save files will lose their charge over time, requiring the battery to be replaced. While it's not hard to replace save batteries (if you know how), it's still time-consuming. Games on CD-ROMs are subject to disc rot, which means that even if you take good care of them, they'll still lose data over time and become unplayable. Also, sometimes it's difficult to find replacement parts for some consoles. This wouldn't be so much of an issue if the majority of classic games were available digitally, but the vast majority are never re-released on a digital platform.

### Gaming on RetroPie

RetroPie is a great project and an asset to retro gaming enthusiasts like me. RetroPie is a Raspbian-based distribution designed for use on the Raspberry Pi (though it is possible to get it working on other platforms, such as a PC). RetroPie boots into a graphical interface that is completely controllable via a gamepad or joystick and allows you to easily manage digital copies (ROMs) of your favorite games. You can scrape information from the internet to organize your collection better and manage lists of favorite games, and the entire interface is very user-friendly and efficient. From the interface, you can launch directly into a game, then exit the game by pressing a combination of buttons on your gamepad. You rarely need a keyboard, unless you have to enter your WiFi password or manually edit configuration files.

I use RetroPie to host a digital copy of every physical game I own in my collection. When I purchase a game from a local store or eBay, I also download the ROM. As a collector, this is very convenient. If I don't have a particular physical console within arms reach, I can boot up RetroPie and enjoy a game quickly without having to connect cables or clean cartridge contacts. There's still something to be said about playing a game on the original hardware, but if I'm pressed for time, RetroPie is very convenient. I also don't have to worry about dead save batteries, dirty cartridge contacts, disc rot, or any of the other issues collectors like me have to regularly deal with. I simply play the game.

Also, RetroPie allows me to be very clever and utilize my technical know-how to achieve additional functionality that's not normally available. For example, I have three RetroPies set up, each of them synchronizing their files between each other by leveraging [Syncthing][3], a popular open source file synchronization tool. The synchronization happens automatically, and it means I can start a game on one television and continue in the same place on another unit since the save files are included in the synchronization. To take it a step further, I also back up my save and configuration files to [Backblaze B2][4], so I'm protected if an SD card becomes defective.

### Setting up RetroPie

Setting up RetroPie is very easy, and if you've ever set up a Raspberry Pi Linux distribution before (such as Raspbian) the process is essentially the same—you simply download the IMG file and flash it to your SD card by utilizing another tool, such as [Etcher][5], and insert it into your RetroPie. Then plug in an AC adapter and gamepad and hook it up to your television via HDMI. Optionally, you can buy a case to protect your RetroPie from outside elements and add visual appeal. Here is a listing of things you'll need to get started:

  * Raspberry Pi board (Model 3B+ or higher recommended)
  * SD card (16GB or larger recommended)
  * A USB gamepad
  * UL-listed micro USB power adapter, at least 2.5 amp



If you choose to add the optional Raspberry Pi case, I recommend the Super NES and Super Famicom themed cases from [RetroFlag][6]. Not only do these cases look cool, but they also have fully functioning power and reset buttons. This means you can configure the reset and power buttons to directly trigger the operating system's halt process, rather than abruptly terminating power. This definitely makes for a more professional experience, but it does require the installation of a special script. The instructions are on [RetroFlag's GitHub page][7]. Be wary: there are many cases available on Amazon and eBay of varying quality. Some of them are cheap knock-offs of RetroFlag cases, and others are just a lower quality overall. In fact, even cases by RetroFlag vary in quality—I had some power-distribution issues with the NES-themed case that made for an unstable experience. If in doubt, I've found that RetroFlag's Super NES and Super Famicom themed cases work very well.

### Adding games

When you boot RetroPie for the first time, it will resize the filesystem to ensure you have full access to the available space on your SD card and allow you to set up your gamepad. I can't give you links for game ROMs, so I'll leave that part up to you to figure out. When you've found them, simply add them to the RetroPie SD card in the designated folder, which would be located under **/home/pi/RetroPie/roms/ <console_name>**. You can use your favorite tool for transferring the ROMs to the Pi, such as [SCP][8] in a terminal, [WinSCP][9], [Samba][10], etc. Once you've added the games, you can rescan them by pressing start and choosing the option to restart EmulationStation. When it restarts, it should automatically add menu entries for the ROMs you've added. That's basically all there is to it.

(The rescan updates EmulationStation’s game inventory. If you don’t do that, it won’t list any newly added games you copy over.)

Regarding the games' performance, your mileage will vary depending on which consoles you're emulating. For example, I've noticed that Sega Dreamcast games barely run at all, and most Nintendo 64 games will run sluggishly with a bad framerate. Many PlayStation Portable (PSP) games also perform inconsistently. However, all of the 8-bit and 16-bit consoles emulate seemingly perfectly—I haven't run into a single 8-bit or 16-bit game that doesn't run well. Surprisingly, games designed for the original PlayStation run great for me, which is a great feat considering the lower-performance potential of the Raspberry Pi.

Overall, RetroPie's performance is great, but the Raspberry Pi is not as powerful as a gaming PC, so adjust your expectations accordingly.

### Conclusion

RetroPie is a fantastic open source project dedicated to preserving classic games and an asset to game collectors everywhere. Having a digital copy of my physical game collection is extremely convenient. If I were to tell my childhood self that one day I could have an entire game collection on one device, I probably wouldn't believe it. But RetroPie has become a staple in my household and provides hours of fun and enjoyment.

If you want to see the parts I mentioned as well as a quick installation overview, I have [a video][11] on [my YouTube channel][12] that goes over the process and shows off some gameplay at the end.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/retropie

作者：[Jay LaCroix][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jlacroix
[b]: https://github.com/lujun9972
[1]: https://www.youtube.com/channel/UCxQKHvKbmSzGMvUrVtJYnUA
[2]: https://retropie.org.uk/
[3]: https://syncthing.net/
[4]: https://www.backblaze.com/b2/cloud-storage.html
[5]: https://www.balena.io/etcher/
[6]: https://www.amazon.com/shop/learnlinux.tv?listId=1N9V89LEH5S8K
[7]: https://github.com/RetroFlag/retroflag-picase
[8]: https://en.wikipedia.org/wiki/Secure_copy
[9]: https://winscp.net/eng/index.php
[10]: https://www.samba.org/
[11]: https://www.youtube.com/watch?v=D8V-KaQzsWM
[12]: http://www.youtube.com/c/LearnLinuxtv
