[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to make an old computer useful again)
[#]: via: (https://opensource.com/article/19/7/how-make-old-computer-useful-again)
[#]: author: (Howard Fosdick https://opensource.com/users/howtechhttps://opensource.com/users/don-watkinshttps://opensource.com/users/suehlehttps://opensource.com/users/aseem-sharmahttps://opensource.com/users/sethhttps://opensource.com/users/marcobravohttps://opensource.com/users/dragonbitehttps://opensource.com/users/don-watkinshttps://opensource.com/users/jamesfhttps://opensource.com/users/seth)

How to make an old computer useful again
======
Refurbish an old machine with these step-by-step instructions.
![Person typing on a 1980's computer][1]

Have an old computer gathering dust in your basement? Why not put it to use? A backup machine could come in handy if your primary computer fails and you want to be online with a larger screen than your smartphone. Or it could act as a cheap secondary computer shared by the family. You could even make it into a retro gaming box.

You can take any computer up to a dozen years old and—with the right software—perform many of the same tasks you can with new machines. Open source software is the key.

I've refurbished computers for two decades, and in this article, I'll share how I do it. We're talking about dual-core laptops and desktops between five and 12 years old.

### Verify the hardware

Step one is to verify that your hardware all works. Overlooking a problem here could cause you big headaches later.

Dust kills electronics, so open up the box and clean out the dirt. [Compressed air][2] comes in handy. Be careful that you're [grounded][3] whenever you touch the machine. And _don't_ rub anything with a cleaning cloth. Even a static shock so small you won't feel it can destroy circuitry.

Then close the clean computer and verify that all the hardware works. Test:

  * Memory
  * Disk
  * Motherboard
  * Peripherals (DVD drive, USB ports, sound, etc.)



Run any diagnostic tests in the computer's boot panels (the [UEFI][4] or [BIOS][5] panels). [This list][6] tells you which program function (PF) key to press to access those panels for your computer.

Free resource kits like [Hirens BootCD][7] or [Ultimate Boot CD][8] enable you to test what your boot panels don't. They contain hundreds of testing programs; all are free, but not all are open source. You don't have to install anything to run these kits because they'll boot from a USB thumb drive or DVD drive.

Be thorough! Run the extended tests for memory and disk—not just the short tests. Let them run overnight. That's the only way to catch transient (sporadic) errors.

If you find problems, my [Quick guide to fixing hardware][9] will help you solve the most common hardware issues.

### Select the software

The key to refurbishing is to install software appropriate for the hardware resources you have. The three essential hardware resources are:

  1. Processor (number of cores and speed)
  2. Memory
  3. Video memory



You can identify your computer's resources in its boot-time UEFI/BIOS panels. Write down your findings so that you don't forget them. Then, look up your processor at [CPU Benchmark][10]. That website gives you background on your CPU plus a CPU Mark that indicates its performance.

Now that you know your hardware's power, you're ready to select software that it can efficiently run. Your software choices are divided into four critical areas:

  1. Operating system (OS)
  2. Desktop environment (DE)
  3. Browser
  4. Applications



A good Linux distribution covers all four. Don't be tempted to run an unsupported version of Windows like 8, Vista, or XP just because it's already on the computer! The [risk][11] of malware is too great. You're much better off with a more virus-resistant, up-to-date operating system.

How about Windows 7? [Extended support][12] ends January 14, 2020, meaning you get security fixes only until that date. After that, zilch. Now is the perfect time to migrate off Windows 7.

Linux's big benefit is that it offers [many distros][13] specifically designed for older hardware. Plus, its design decouples [DEs][14] from the OS, so you can mix and match the two. This is important because DEs heavily impact low-end system performance. (With Windows and MacOS, the OS version you run dictates the DE.)

Other Linux advantages: Its thousands of apps are free and open source, so you don't have to worry about activation and licensing. And Linux is portable. You can copy, move, or clone the OS and applications across partitions, disks, devices, or computers. (Windows binds itself to the computer it's installed on via its Registry.)

### What can your refurbished computer do?

We're talking dual-core machines dating from about 2006 to 2013, especially [Intel Core 2][15] CPUs and [AMD Athlon 64 X2][16] family processors. Most have a [CPU Mark][10] of between 1,000 and 4,000. You can often pick up these machines for a song, yet they're still powerful enough to run lightweight Linux software.

One caution: be sure your computer has at least 2GB of memory. Upgrade the RAM if you have to. End users on my refurbished machines typically use between 0.5 and 2GB of RAM (exclusive of data buffering); rarely do they go over 2 gig. So if you can bump memory to 2GB, your system won't be forced to _swap_, or substitute disk for memory. That's critical for good performance.

For example, I removed 1GB RAM from the decade-old rebuild I'm writing this article on, which dropped memory down to 1GB. The machine slowed to a crawl. Web surfing and other tasks became frustrating, even painful. I popped the memory stick back in and, with 2GB RAM, the desktop instantly reverted to its usable self.

With a 2 gig dual-core computer, most people can do whatever they want, so long as they run a lightweight distro and browser. You can web surf, email, edit documents, do spreadsheets, watch YouTube videos, bid on eBay auctions, post on social media, listen to podcasts, view photo collections, manage home finance and personal scheduling, play games, and more.

### Limitations

What can't these older computers do? Their concurrency is less than state-of-the-art machines. So run a fast browser and block ads, because that's what slows down web surfing. If your virtual private network (VPN) can block ads for you and offload that work from your processor, that's ideal. Disable autoplay of videos, Flash, and animation. Surf with a couple of tabs open rather than 20. Install a browser extension so you can toggle JavaScript.

Direct the processors to what you're working on; don't keep a ton of apps open or run lots of stuff in the background. High-end graphics and video editing may be slow. Virtual machine hosting is out.

How about games? The open source software repositories offer literally thousands of games. That's why I listed video memory as one of the three essential hardware resources. If your box doesn't have a video card, it likely has only 32 or 64MB of VRAM. Bump that to 256 or 512MB by adding a video card, and you'll find that processor-intensive games run much better. [Here's how][17] to see how much VRAM your computer has. Be sure to get a card that fits your computer's [video slot][18] (AGP, PCI-Express, or PCI) and has the right [cable connector][19] (VGA, DVI, or HDMI).

#### What about Windows compatibility?

People often ask about Windows compatibility. First, there's a [Linux equivalent][20] for every Windows program.

Second, if you really must run a specific Windows program, you can usually do that on Linux using [Wine][21]. Look up your application in the [Wine database][22] to verify it runs under Wine and learn any special install tricks. Then the auxiliary tools [Winetricks][23] or [PlayOnLinux][24] will help you with installation and setup.

Wine's other benefit is that it runs programs from old Windows versions like Vista, XP, ME/98/95, and 3.1. I know a guy who set up a fantastic game box running his old XP games. You can even run thousands of [free DOS programs][25] using [DOSBox.][26] One caution: if Windows programs can run, so can Windows [viruses][27]. You must protect your Wine environment inside Linux just as you would any other Windows environment.

How about compatibility with Microsoft Office? I use LibreOffice and routinely edit and exchange Word and Excel files without problems. You must, however, avoid using obscure or specialized features.

### Which distro?

Assuming Linux is the OS, you need to select a DE, browser, and applications. The easy way to do this is to install a distribution that bundles everything you need.

Remember that you can try out different distros without installing anything by booting from a [live USB][28] thumb drive or DVD. [Here's how to create a bootable Linux][29] from within Linux or Windows.

I rebuild computers for charity, so I can't assume any knowledge on the part of my users. I need a distro with these traits:

  * User-friendly
  * Lightweight interface
  * Bundles lightweight apps
  * Big repository
  * Solid track record
  * Large user community with an active forum
  * Stability through long-term support releases (not rolling releases)
  * Prioritizes reliability over cutting-edge features
  * Configurable by a GUI rather than by text files



Many distros fulfill these criteria. The three I've successfully deployed are [Mint/Xfce][30], [Xubuntu,][31] and [Lubuntu][32]. The first two use the Xfce desktop environment, while the latter runs LXQt. These DEs [use less][33] processor and memory resources than alternatives like GNOME, Unity, KDE, MATE, and Cinnamon.

Xfce and LXQt are very easy to use. My clients have never seen Linux before, yet they have no trouble using these simple, menu-driven interfaces.

It's vital to run the fastest, most efficient browser on older equipment. [Many feel][34] Chromium wins the browser race. I also install Firefox Quantum because people are familiar with it and [its performance][35] rivals [that of Chromium][36]. I toss in Opera because it's speedy and has some unique features, like integrated ad-blocking and a free [virtual private network][37]. Opera is free but not open source.

Whatever browser you use, block ads and trackers! Minimize browser overhead. And don't allow videos or Flash to run without your explicit say-so.

For applications, I rely on the lightweight apps bundled with Mint/Xfce, Xubuntu, and Lubuntu. They address every possible need.

### Go for it

Will you be happy with your rebuild? The computers I've been using lately are both over a decade old. One has an Intel dual-core processor ([eMachines T5274a][38]) while the other features an AMD Athlon 64 x2 processor ([HP dc5750][39]). Both have 2 gig memory. They're as effective for my office workload as my quad-core i5 with 16GB RAM. The only function I miss when using them is the ability to host virtual machines.

We live in an amazing era. You can take a five- to 12-year-old computer and, with a little effort, restore it to practical use. What could be more fun?

Having recently co-authored a book about building things with the Raspberry Pi ( Raspberry Pi Hacks...

I can see the brightness of curiosity in my six year old niece Shuchi's eyes when she explores a...

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/7/how-make-old-computer-useful-again

作者：[Howard Fosdick][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/howtechhttps://opensource.com/users/don-watkinshttps://opensource.com/users/suehlehttps://opensource.com/users/aseem-sharmahttps://opensource.com/users/sethhttps://opensource.com/users/marcobravohttps://opensource.com/users/dragonbitehttps://opensource.com/users/don-watkinshttps://opensource.com/users/jamesfhttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://www.amazon.com/s/ref=nb_sb_noss_1?url=search-alias%3Daps&field-keywords=compressed+air+for+computers&rh=i%3Aaps%2Ck%3Acompressed+air+for+computers
[3]: https://www.wikihow.com/Ground-Yourself-to-Avoid-Destroying-a-Computer-with-Electrostatic-Discharge
[4]: https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface
[5]: http://en.wikipedia.org/wiki/BIOS
[6]: http://www.disk-image.com/faq-bootmenu.htm
[7]: http://www.hirensbootcd.org/download/
[8]: http://www.ultimatebootcd.com/
[9]: http://www.rexxinfo.org/Quick_Guide/Quick_Guide_To_Fixing_Computer_Hardware
[10]: http://www.cpubenchmark.net/
[11]: https://askleo.com/unsupported-software-really-mean/
[12]: http://home.bt.com/tech-gadgets/computing/windows-7/windows-7-support-end-11364081315419
[13]: https://fossbytes.com/best-lightweight-linux-distros/
[14]: http://en.wikipedia.org/wiki/Desktop_environment
[15]: https://en.wikipedia.org/wiki/Intel_Core_2
[16]: https://en.wikipedia.org/wiki/Athlon_64_X2
[17]: http://www.cyberciti.biz/faq/howto-find-linux-vga-video-card-ram/
[18]: https://www.onlinecomputertips.com/support-categories/hardware/493-pci-vs-agp-vs-pci-express-video-cards/
[19]: https://silentpc.com/articles/video-connectors
[20]: http://wiki.linuxquestions.org/wiki/Linux_software_equivalent_to_Windows_software
[21]: https://en.wikipedia.org/wiki/Wine_%28software%29
[22]: https://appdb.winehq.org/
[23]: https://en.wikipedia.org/wiki/Winetricks
[24]: https://en.wikipedia.org/wiki/PlayOnLinux
[25]: https://archive.org/details/softwarelibrary_msdos
[26]: https://en.wikipedia.org/wiki/DOSBox
[27]: https://wiki.winehq.org/FAQ#Is_Wine_malware-compatible.3F
[28]: https://www.howtogeek.com/howto/linux/create-a-bootable-ubuntu-usb-flash-drive-the-easy-way/
[29]: https://unetbootin.github.io/
[30]: https://linuxmint.com/
[31]: https://xubuntu.org/
[32]: https://lubuntu.me/
[33]: https://www.makeuseof.com/tag/best-lean-linux-desktop-environment-lxde-vs-xfce-vs-mate/
[34]: https://www.zdnet.com/article/chrome-is-the-most-popular-web-browser-of-all/
[35]: https://www.laptopmag.com/articles/firefox-quantum-vs-chrome
[36]: https://www.zdnet.com/article/just-how-fast-is-firefox-quantum/
[37]: http://en.wikipedia.org/wiki/Virtual_private_network
[38]: https://www.cnet.com/products/emachines-t5274/specs/
[39]: https://community.spiceworks.com/products/7727-hewlett-packard-dc5750-microtower
