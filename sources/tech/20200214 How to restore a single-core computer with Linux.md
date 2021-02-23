[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to restore a single-core computer with Linux)
[#]: via: (https://opensource.com/article/20/2/restore-old-computer-linux)
[#]: author: (Howard Fosdick https://opensource.com/users/howtech)

How to restore a single-core computer with Linux
======
Let's have some geeky fun refurbishing your prehistoric Pentium with
Linux and open source.
![Two animated computers waving one missing an arm][1]

In a [previous article][2], I explained how I refurbish old dual-core computers ranging from roughly five to 15 years old. Properly restored, these machines can host a fully capable lightweight Linux distribution like [Mint/Xfce][3], [Xubuntu][4], or [Lubuntu][5] and perform everyday tasks. But what if you have a really old computer gathering dust in your attic or basement? Like a Pentium 4 desktop or Pentium M laptop? Yikes! Can you even do anything with a relic like that?

### Why restore a relic?

For starters, you might learn a bit about hardware and open source software by refurbishing it. And you could have some fun along the way. Whether you can make much use of it depends on your expectations.

A single-core computer can perform well for a specific purpose. For example, my friend created a dandy retro gaming box (like I describe below) that runs hundreds of Linux and old Windows and DOS games. His kids love it!

Another friend uses his Pentium 4 for running design spreadsheets in his workshop. He finds it convenient to have a dedicated machine tucked into a corner of his shop. He likes that he doesn't have to worry about heat or dust ruining an expensive modern computer.

My romance author acquaintance employs her Pentium M as a "novelist's workstation" lodged in her cozy attic hideaway. The laptop functions as her private word processor.

I've used old computers to teach beginners how to build and repair hardware. Old equipment makes the best testbed because it's expendable. If someone makes a mistake and fries a board, it doesn't much matter. (Contrast this to how you would feel if you wrecked your main computer!)

The web suggests many [other potential uses][6] for old Pentiums: security cam monitors, network-attached storage (NAS) servers, [SETI][7] boxes, torrent servers, anonymous [Tails][8] servers, Bitcoin miners, programming workstations, thin clients, terminal emulators, routers, file servers, and more. To me, many of these applications sound more like fun projects than practical uses for single-core computers. That doesn't mean they aren't worth your while; it's just that you want to be clear-eyed about any project you take on.

By current standards, P-4s and Ms are terribly [weak processors][9]. For example, using them for web surfing is problematic because webpage size and programming complexity have [grown exponentially][10]. And the open web is closing—increasingly, sites won't allow you access unless you let them run all those ads that can overwhelm old processors. (I'll discuss web surfing performance tricks later in this article.) Another shortcoming of old computers is their energy consumption. Better electricity-to-performance ratios often make newer computers more sensible. This especially true when a [tablet or smartphone][11] can fulfill your needs.

Nevertheless, you can still have fun and learn a lot by tinkering with an old P-4 or M. They're great educational tools, they're expendable, and they can be useful in dedicated roles. Best of all, you can get them for free. I'll tell you how.

Still reading? Okay, let's have some geeky fun refurbishing your prehistoric Pentium.

### Understand hardware evolution

As a quick level-set, here are the common names for the P-4 and M class processors and their rough dates of manufacture:

**Desktops (2000-2008)**

  * Pentium 4
  * Pentium 4 HT (Hyper-Threading)
  * Pentium 4 EE (Extreme Edition)



**Desktops (2005-2008)**

  * Pentium D (early dual-core)



**Mobile (2002-2008)**

  * Pentium M
  * Pentium 4-M
  * Mobile Pentium 4
  * Mobile Pentium 4 HT



Sources: Wikipedia (for the [P-4][12], [P-M][13], and [processor][14] lists), [CPU World,][15] [Revolvy][16].

Machines hosting these processors typically use either DDR2 or DDR memory. Dual-core processors entered the market in 2005 and displaced single-core CPUs within a few years. I'll assume you have some version of what's in the above table. Or you might have an equivalent [AMD][17] or [Celeron][18] processor from the same era.

The big draw of this old hardware is that you can get it for free. People consider it junk. They'll be only too glad to give you their castoffs. If you don't have a machine on hand, just ask your friends or family. Or drop by the local recycling center. Unless they have strict rules, they'll be happy to give you this old equipment. You can even advertise on [Craigslist][19], [Freecycle,][20] or [other reuse websites][21].

**A quick tip:** Grab more than one machine. With old hardware, you often need to cannibalize parts from several computers to build one good working one.

### Prepare the hardware

Before you can use your old computer, you must refurbish it. The steps to fixing it up are:

  1. Clean it
  2. Identify what hardware you have
  3. Verify the hardware works



Start by opening up the box and cleaning out the dirt. Dust causes the heat that kills electronics. A can of compressed air helps.

Always keep yourself grounded when touching things so that you don't harm the electronics. And don't rub anything with a cleaning rag! Even a shock you can't feel can damage computer circuitry.

While you've got the box open, learn everything you can about your hardware. Write it all down, so you remember it later:

  * Count the open memory slots, if any. Is the RAM DDR or DDR2 (or something else)?
  * Read the hard drive label to learn its capacity and age. (It'll probably be an old IDE drive. You can identify IDE drives by their wide connector ribbons.)
  * Check the optical drive label to see what kinds of discs it reads and/or writes, at what speed, and to what standard(s).
  * Note other peripherals, add-in cards, or anything unusual.



Close and boot the machine into its boot-time [BIOS][22] panels. [This list][23] tells you what program function (PF) key to press to access those startup panels for your specific computer. Now you can complete your hardware identification by rounding out the details on your processor, memory, video memory, and more.

### Verify the hardware

Once you know what you've got, verify that it all works. Test:

  * Memory
  * Disk
  * Motherboard
  * Peripherals (optical drive, USB ports, sound, etc.)



Run any diagnostic tests in the computer's boot or BIOS panels. Free resource kits like [Hiren's BootCD][24] or the [Ultimate Boot CD][25] can round out your testing with any diagnostics your boot panels lack. These kits offer dozens of testing programs: all are free, but not all are open source. You can boot them off a live USB or DVD so that you don't have to install anything on the computer.

Be sure to run the "extended" or long tests for the memory and disk drive. Run tests overnight if you have to. Do this job right! If you miss a problem now, it could cause you big headaches later.

If you find a problem, refer to my _[Quick guide to fixing hardware][26]_ to solve common issues.

### Essential hardware upgrades

You'll want to make two key hardware upgrades. First, increase memory to the computer's maximum. (You can find the maximum for your computer with a quick web search for its specs.) The practical minimum to run many lightweight Linux distros is 1GB RAM; 2GB or more is ideal. While the maximum allowable memory varies by the machine, the great majority of these computers will upgrade to at least 2GB.

Second—if the desktop doesn't already have one—add a video card. This offloads graphics processing from the motherboard to the video card and increases the computer's video memory. Bumping up the VRAM from 32 or 64MB to 256GB or more greatly increases the range of applications an old computer can run. Especially if you want to run games.

Be sure the video card fits your computer's [video slot][27] (AGP, PCI, or PCI-Express) and has the right [cable connector][28] (VGA or DVI). You can issue a couple of [Linux line commands][29] to see how much VRAM your system has, or look in the BIOS boot panels.

These two simple upgrade hacks—increasing memory and video power—take a marginal machine and make it _way_ more functional. Your goal is to build the most powerful P-4 or M ever. That way, you can squeeze the most performance from this aging design.

The good news is that with the old computers we're talking about, you can get any parts you need for free. Just cannibalize them from other discarded PC's.

### Select the software

Choosing the right software for a P-4 or M is critical. [Don't][30] use an [unsupported][31] Windows version just because it's already on the PC; malware might plague you if you do. A fresh install is mandatory.

Open source software is the way to go. [Many][32] Linux [distributions][33] are specifically designed for older computers. And with Linux, you can install, move, copy, and clone the operating system and its apps at will. This makes your job easier: You won't run into activation or licensing issues, and it's all free.

Which distribution should you pick? Assuming you have at least 2GB of memory, start your search by trying a _lightweight distribution_—these feature resource-stingy [desktop environments][34]. Xfce or LXQt are excellent desktop environment choices. Products that [consume more resources][35] or produce fancier graphics—like Unity, GNOME, KDE, MATE, and Cinnamon—won't perform well.

The lightweight Linux distros I've enjoyed success with are Mint/Xfce, Xubuntu, and Lubuntu. The first two use Xfce while Lubuntu employs LXQt. You can find [many other][36] excellent candidate distros beyond these three choices that I can vouch for.

Be sure to download the 32-bit versions of the operating systems; 64-bit versions don't make much sense unless a computer has at least 4GB of memory.

The lightweight Linux distros I've cited offer friendly menus and feature huge software repositories backed by active forums. They'll enable your old computer to do everything it's capable of. However, they won't run on every computer from the P-4 era. If one of these products runs on your computer and you like it, great! You've found your distro.

If your computer doesn't perform well with these selections, won't boot, or you have less than 2GB of memory, try an _ultralight distribution_. Ultralights reduce resource use by replacing desktop environments with [window managers][37] like Fluxbox, FLWM, IceWM, JWM, or Openbox. Window managers use fewer resources than desktop environments. The trade-off is that they're less flexible. As an example, you may have to dip into code to alter your desktop or taskbar icons.

My go-to ultralight distro is [Puppy Linux][38]. It comes in several variants that run well on Pentium 4's and M's with only 1GB of memory. Puppy's big draw is that it has versions designed specifically for older computers. This means you'll avoid the hassles you might run into with other distros. For example, Puppy versions run on old CPUs that don't support features like PAE or SSE3. They'll even help you run an older kernel or obsolete bootstrap program if your hardware requires it.

And Puppy runs _fast_ on limited-resource computers! It optimizes performance by loading the operating system entirely into memory to avoid slow disk access. It bundles a full range of apps that have been carefully selected to use minimal hardware resources.

Puppy is also user-friendly. Even a naive end user can use its simple menus and attractive desktop. But be advised—it takes expertise to install and configure the product. You might have to spend some time on Puppy's [forum][39] to get oriented. The forum is especially useful because many who post there work with old computers.

A fun alternative to Puppy is [Tiny Core][40] Linux. With Tiny Core, you install only the software components you want. So you build up your environment from the absolute minimum. This takes time but results in a lean, mean system. Tiny Core is perfect for creating a dedicated server. It's a great learning tool, too, so check out its [free eBook][41].

If you want a quick, no-hassles install, you might try [antiX][42]. It's Debian-based, offers a selection of lightweight interfaces, and runs well on machines with only a gigabyte of memory. I've had excellent results installing antiX on a variety of old PCs.

_**Caution:**_ Many distros casually claim that they run on "old computers" when they really mean that they run on _limited-resource computers_. There's a big difference. Old computers sometimes do not support all the CPU features required by newer operating systems. Avoid problems by selecting a Linux proven to run on your hardware.

Don't know if a distro will run on your box? Save yourself some time by posting a message on the distro's forum and asking for responses from folks using hardware like yours. You should receive some success stories. If nobody can say they've done what you're trying to do, I'd avoid that product.

### How to use your refurbished computer

Will you be happy using your restored PC? It depends on what you expect.

People who use aging systems learn to leverage minimal resources. For example, they run resource-stingy programs like GNOME Office in place of LibreOffice. They forgo CPU-intense programs like emulators, graphics-heavy apps, video processing, and virtual machine hosting. They focus on one task at a time and don't expect much concurrency. And they know how to manage machine resources proactively.

Old hardware can perform well in dedicated situations. Earlier, I mentioned my friends who use their old computers for design spreadsheets and as a writer's workbench. And I wrote this article on my personal retro box—a Dell GX280 desktop with a Pentium 4 at 3.2GHz, with 2GB DDR-2 RAM and two 40GB IDE disks, dual-booting Puppy and antiX.

#### Create a retro game box

You can also create a fantastic retro game box. First, install an appropriate distro. Then install [Wine][43], a program designed to run Windows software on Linux. Now you'll be able to run nearly all your old Windows XP, ME/98/95, and 3.1 games. [DOSBox][44] supports tons more [free DOS games][45]. And Linux offers over a thousand more.

I've enjoyed nostalgic fun on a P-4 running antiX and all the old games I remember from years ago. Just be sure you've maxed out system memory and added a good video card for the best results.

#### Access the web

The big challenge with old computers is web surfing. [This study][46] claims that average website size has increased 100% over a three-year period, while [this article][47] tells how bloated news sites have become. Videos, animation, images, trackers, ad requests—they all make websites slower than just a few years ago.

Worse, websites increasingly refuse you access unless you allow them to run their ads. This is a problem because the ads can overwhelm old CPUs. In fact, for most websites, the resources required to run ads and trackers are _way_ greater than that required for the actual website content.

Here are the performance tricks you need to know if you web surf with an older computer:

  * Run the fastest, lightest browser possible. Chrome, Firefox, and Opera are probably the top mainstream offerings.
  * Try alternative [minimalist browsers][48] to see if they can meet your needs: [Dillo][49], [NetSurf][50], [Dooble][51], [Lynx][52], [Links][53], or others.
  * Actively manage your browser.
  * Don't open many browser tabs.
  * Manually start and stop processing in specific tabs.
  * Block ads and trackers:
    * Offload this chore to your virtual private network (VPN) if at all possible.
    * Otherwise, use a browser extension.
  * Don't slow down your browser by installing add-ons or extensions beyond the minimum required.
  * Disable autoplay for videos and Flash.
  * Toggle JavaScript off and on.
  * Ensure the browser renders text before graphics.
  * Don't run background tasks while web surfing.
  * Manually clear cookies to avoid page-access limits on some websites.
  * Linux means you don't have to run real-time anti-malware (which consumes a CPU core on many Windows PCs).



Employing some of these tricks, I happily use refurbished dual-core computers for all my web surfing. But with today's internet, I find single-core processors inadequate for anything beyond the occasional web lookup. In other words, they're acceptable for _web access_ but insufficient for _web surfing_. That's just my opinion. Yours may vary depending on your expectations and the nature of your web activity.

### Enjoy free educational fun

However you use your refurbished P-4 or M, you'll know a lot more about computer hardware and open source software than when you started. It won't cost you a penny, and you'll have some fun along the way!

Please share your own refurbishing experiences in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/restore-old-computer-linux

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtech
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003499_01_other11x_cc.png?itok=I_kCDYj0 (Two animated computers waving one missing an arm)
[2]: http://opensource.com/article/19/7/how-make-old-computer-useful-again
[3]: http://linuxmint.com/
[4]: https://xubuntu.org/
[5]: http://lubuntu.me/
[6]: http://www.google.com/search?q=uses+for+a+pentium+IV
[7]: https://en.wikipedia.org/wiki/Search_for_extraterrestrial_intelligence
[8]: https://en.wikipedia.org/wiki/Tails_(operating_system)
[9]: http://www.cpubenchmark.net/low_end_cpus.html
[10]: http://www.digitaltrends.com/web/internet-is-getting-slower/
[11]: https://www.forbes.com/sites/christopherhelman/2013/09/07/how-much-energy-does-your-iphone-and-other-devices-use-and-what-to-do-about-it/#ba4918e2f702
[12]: https://en.wikipedia.org/wiki/Pentium_4
[13]: https://en.wikipedia.org/wiki/Pentium_M
[14]: https://en.wikipedia.org/wiki/List_of_Intel_Pentium_4_microprocessors
[15]: http://www.cpu-world.com/CPUs/Pentium_4/index.html
[16]: https://www.revolvy.com/page/List-of-Intel-Pentium-4-microprocessors?cr=1
[17]: https://en.wikipedia.org/wiki/List_of_AMD_microprocessors
[18]: https://en.wikipedia.org/wiki/Celeron
[19]: https://www.craigslist.org/about/sites
[20]: https://www.freecycle.org/
[21]: https://alternativeto.net/software/freecycle/
[22]: http://en.wikipedia.org/wiki/BIOS
[23]: http://www.disk-image.com/faq-bootmenu.htm
[24]: http://www.hirensbootcd.org/download/
[25]: http://www.ultimatebootcd.com/
[26]: http://www.rexxinfo.org/Quick_Guide/Quick_Guide_To_Fixing_Computer_Hardware
[27]: http://www.playtool.com/pages/vidslots/slots.html
[28]: https://silentpc.com/articles/video-connectors
[29]: https://www.cyberciti.biz/faq/howto-find-linux-vga-video-card-ram/
[30]: https://fusetg.com/dangers-running-unsupported-operating-system/
[31]: http://home.bt.com/tech-gadgets/computing/windows-7/windows-7-support-end-11364081315419
[32]: https://itsfoss.com/lightweight-linux-beginners/
[33]: https://fossbytes.com/best-lightweight-linux-distros/
[34]: https://en.wikipedia.org/wiki/Desktop_environment
[35]: http://www.phoronix.com/scan.php?page=article&item=ubu-1704-desktops&num=3
[36]: https://www.google.com/search?ei=TfIoXtG5OYmytAbl04z4Cw&q=best+lightweight+linux+distros+for+old+computers&oq=best+lightweight+linux+distros+for+old&gs_l=psy-ab.1.0.0i22i30l8j0i333.6806.8527..10541...2.2..0.159.1119.2j8......0....1..gws-wiz.......0i71j0.a6LTmaIXan0
[37]: https://en.wikipedia.org/wiki/X_window_manager
[38]: http://puppylinux.com/
[39]: http://murga-linux.com/puppy/
[40]: http://tinycorelinux.net/
[41]: http://tinycorelinux.net/book.html
[42]: http://antixlinux.com/
[43]: https://www.winehq.org/
[44]: https://en.wikipedia.org/wiki/DOSBox
[45]: https://www.dosgamesarchive.com/
[46]: https://www.digitaltrends.com/web/internet-is-getting-slower/
[47]: https://www.forbes.com/sites/kalevleetaru/2016/02/06/why-the-web-is-so-slow-and-what-it-tells-us-about-the-future-of-online-journalism/#34475c2072f4
[48]: http://en.wikipedia.org/wiki/Comparison_of_lightweight_web_browsers
[49]: http://www.dillo.org/
[50]: http://www.netsurf-browser.org/
[51]: http://textbrowser.github.io/dooble/
[52]: http://lynx.browser.org/
[53]: http://en.wikipedia.org/wiki/Links_%28web_browser%29
