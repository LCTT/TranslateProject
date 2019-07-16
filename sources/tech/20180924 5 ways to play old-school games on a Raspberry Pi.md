5 ways to play old-school games on a Raspberry Pi
======

Relive the golden age of gaming with these open source platforms for Raspberry Pi.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/arcade_game_gaming.jpg?itok=84Rjk_32)

They don't make 'em like they used to, do they? Video games, I mean.

Sure, there's a bit more grunt in the gear now. Princess Zelda used to be 16 pixels in each direction; there's now enough graphics power for every hair on her head. Today's processors could beat up 1988's processors in a cage-fight deathmatch without breaking a sweat.

But you know what's missing? The fun.

You've got a squillion and one buttons to learn just to get past the tutorial mission. There's probably a storyline, too. You shouldn't need a backstory to kill bad guys. All you need is jump and shoot. So, it's little wonder that one of the most enduring popular uses for a Raspberry Pi is to relive the 8- and 16-bit golden age of gaming in the '80s and early '90s. But where to start?

There are a few ways to play old-school games on the Pi. Each has its strengths and weaknesses, which I'll discuss here.

### Retropie

[Retropie][1] is probably the most popular retro-gaming platform for the Raspberry Pi. It's a solid all-rounder and a great default option for emulating classic desktop and console gaming systems.

#### What is it?

Retropie is built to run on [Raspbian][2]. It can also be installed over an existing Raspbian image if you'd prefer. It uses [EmulationStation][3] as a graphical front-end for a library of open source emulators, including the [Libretro][4] emulators.

You don't need to understand a word of that to play your games, though.

#### What's great about it

It's very easy to get started. All you need to do is burn the image to an SD card, configure your controllers, copy your games over, and start killing bad guys.

The huge user base means that there is a wealth of support and information out there, and active online communities to turn to for questions.

In addition to the emulators that come installed with the Retropie image, there's a huge library of emulators you can install from the package manager, and it's growing all the time. Retropie also offers a user-friendly menu system to manage this, saving you time.

From the Retropie menu, it's easy to add Kodi and the Raspbian desktop, which comes with the Chromium web browser. This means your retro-gaming rig is also good for home theatre, [YouTube][5], [SoundCloud][6], and all those other “lounge room computer” goodies.

Retropie also has a number of other customization options: You can change the graphics in the menus, set up different control pad configurations for different emulators, make your Raspberry Pi file system visible to your local Windows network—all sorts of stuff.

Retropie is built on Raspbian, which means you have the Raspberry Pi's most popular operating system to explore. Most Raspberry Pi projects and tutorials you find floating around are written for Raspbian, making it easy to customize and install new things on it. I've used my Retropie rig as a wireless bridge, installed MIDI synthesizers on it, taught myself a bit of Python, and more—all without compromising its use as a gaming machine.

#### What's not so great about it

Retropie's simple installation and ease of use is, in a way, a double-edged sword. You can go for a long time with Retropie without ever learning simple stuff like `sudo apt-get`, which means you're missing out on a lot of the Raspberry Pi experience.

It doesn't have to be this way; the command line is still there under the hood when you want it, but perhaps users are a bit too insulated from a Bash shell that's ultimately a lot less scary than it looks. Retropie's main menu is operable only with a control pad, which can be annoying when you don't have one plugged in because you've been using the system for things other than gaming.

#### Who's it for?

Anyone who wants to get straight into some gaming, anyone who wants the biggest and best library of emulators, and anyone who wants a great way to start exploring Linux when they're not playing games.

### Recalbox

[Recalbox][7] is a newer open source suite of emulators for the Raspberry Pi. It also supports other ARM-based small-board computers.

#### What is it?

Like Retropie, Recalbox is built on EmulationStation and Libretro. Where it differs is that it's not built on Raspbian, but on its own flavor of Linux: RecalboxOS.

#### What's great about it

The setup for Recalbox is even easier than for Retropie. You don't even need to image an SD card; simply copy some files over and go. It also has out-of-the-box support for some game controllers, getting you to Level 1 that little bit faster. Kodi comes preinstalled. This is a ready-to-go gaming and media rig.

#### What's not so great about it

Recalbox has fewer emulators than Retropie, fewer customization options, and a smaller user community.

Your Recalbox rig is probably always just going to be for emulators and Kodi, the same as when you installed it. If you feel like getting deeper into Linux, you'll probably want a new SD card for Raspbian.

#### Who's it for?

Recalbox is great if you want the absolute easiest retro gaming experience and can happily go without some of the more obscure gaming platforms, or if you are intimidated by the idea of doing anything a bit technical (and have no interest in growing out of that).

For most opensource.com readers, Recalbox will probably come in most handy to recommend to your not-so-technical friend or relative. Its super-simple setup and overall lack of options might even help you avoid having to help them with it.

### Roll your own

Ok, if you've been paying attention, you might have noticed that both Retropie and Recalbox are built from many of the same open source components. So what's to stop you from putting them together yourself?

#### What is it?

Whatever you want it to be, baby. The nature of open source software means you could use an existing emulator suite as a starting point, or pilfer from them at will.

#### What's great about it

If you have your own custom interface in mind, I guess there's nothing to do but roll your sleeves up and get to it. This is also a way to install emulators that haven't quite found their way into Retropie yet, such as [BeebEm][8] or [ArcEm][9].

#### What's not so great about it

Well, it's a bit of work, isn't it?

#### Who's it for?

Hackers, tinkerers, builders, seasoned hobbyists, and such.

### Native RISC OS gaming

Now here's a dark horse: [RISC OS][10], the original operating system for ARM devices.

#### What is it?

Before ARM went on to become the world's most popular CPU architecture, it was originally built to be the heart of the Acorn Archimedes. That's kind of a forgotten beast nowadays, but for a few years it was light years ahead as the most powerful desktop computer in the world, and it attracted a lot of games development.

Because the ARM processor in the Pi is the great-grandchild of the one in the Archimedes, we can still install RISC OS on it, and with a little bit of work, get these games running. This is different to the emulator options we've covered so far because we're playing our games on the operating system and CPU architecture for which they were written.

#### What's great about it

It's the perfect introduction to RISC OS. This is an absolute gem of an operating system and well worth checking out in its own right.

The fact that you're using much the same operating system as back in the day to load and play your games makes your retro gaming rig just that little bit more of a time machine. This definitely adds some charm and retro value to the project.

There are a few superb games that were released only on the Archimedes. The massive hardware advantage of the Archimedes also means that it often had the best graphics and smoothest gameplay of a lot of multi-platform titles. The rights holders to many of these games have been generous enough to make them legally available for free download.

#### What's not so great about it

Once you have installed RISC OS, it still takes a bit of elbow grease to get the games working. Here's a [guide to getting started][11].

This is definitely not a great all-rounder for the lounge room. There's nothing like [Kodi][12]. There's a web browser, [NetSurf][13], but it's struggling to catch up to the modern web. You won't get the range of titles to play as you would with an emulator suite. RISC OS Open is free for hobbyists to download and use and much of the source code has been made open. But despite the name, it's not a 100% open source operating system.

#### Who's it for?

This one's for novelty seekers, absolute retro heads, people who want to explore an interesting operating system from the '80s, people who are nostalgic for Acorn machines from back in the day, and people who want a totally different retro gaming project.

### Command line gaming

Do you really need to install an emulator or an exotic operating system just to relive the glory days? Why not just install some native linux games from the command line?

#### What is it?

There's a whole range of native Linux games tested to work on the [Raspberry Pi][14].

#### What's great about it

You can install most of these from packages using the command line and start playing. Easy. If you've already got Raspbian up and running, it's probably your fastest path to getting a game running.

#### What's not so great about it

This isn't, strictly speaking, actual retro gaming. Linux was born in 1991 and took a while longer to come together as a gaming platform. This isn't quite gaming from the classic 8- and 16-bit era; these are ports and retro-influenced games that were built later.

#### Who's it for?

If you're just after a bucket of fun, no problem. But if you're trying to relive the actual era, this isn't quite it.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/retro-gaming-raspberry-pi

作者：[James Mawson][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dxmjames
[1]: https://retropie.org.uk/
[2]: https://www.raspbian.org/
[3]: https://emulationstation.org/
[4]: https://www.libretro.com/
[5]: https://www.youtube.com/
[6]: https://soundcloud.com/
[7]: https://www.recalbox.com/
[8]: http://www.mkw.me.uk/beebem/
[9]: http://arcem.sourceforge.net/
[10]: https://opensource.com/article/18/7/gentle-intro-risc-os
[11]: https://blog.dxmtechsupport.com.au/playing-badass-acorn-archimedes-games-on-a-raspberry-pi/
[12]: https://kodi.tv/
[13]: https://www.netsurf-browser.org/
[14]: https://www.raspberrypi.org/forums/viewtopic.php?f=78&t=51794
