# [Discovering my inner curmudgeon: A Linux laptop review][1]

Quick refresher: I'm a life-long Mac user, but I was [disappointed by Apple's latest MacBook Pro release][2]. I researched [a set of alternative computers][3] to consider. And, as a surprise even to myself, I decided to leave the Mac platform.

I chose the HP Spectre x360 13" laptop that was released after CES 2017, the new version with a 4K display. I bought the machine [from BestBuy][4] (not an affiliate link) because that was the only retailer selling this configuration. My goal was to run Ubuntu Linux instead of Windows.

Here are my impressions from using this computer over the past month, followed by some realizations about myself.

Ubuntu

Installing Ubuntu was easy. The machine came with Windows 10 preinstalled. I used Windows' built-in Disk Management app to [shrink the main partition][5] and free up space for Linux. I [loaded the Ubuntu image on a USB drive][6], which conveniently fit in the machine's USB-A port (missing on new Macs). Then I followed [Ubuntu's simple install instructions][7], which required some BIOS changes to [enable booting from USB][8].

Screen

The 4K screen on the Spectre x360 is gorgeous. The latest Ubuntu handles High DPI screens well, which surprised me. With a combination of the built-in settings app and additional packages like [gnome-tweak-tool][9], you can get UI controls rendering on the 4K display at 2x native size, so they look right. You can also boost the default font size to make it proportional. There are even settings to adjust icon sizes in the window titlebar and task manager. It's fiddly, but I got everything set up relatively quickly.

Trackpad

The trackpad hardware rattles a little, but it follows your fingers well and supports multi-touch input in Ubuntu by default. However, you immediately realize that something is wrong when you try to type and the mouse starts jumping around. The default Synaptics driver for Linux doesn't properly ignore palm presses on this machine. The solution is to switch to the [new libinput system][10]. By adjusting the [xinput settings][11] you can get it to work decently well. 

But the gestures I'm used to, like two finger swipe to go back in Chrome, or four-finger swipe to switch workspaces, don't work by default in Ubuntu. You have to use a tool like [libinput-gestures][12] to enable them. Even then, the gestures are only recognized about 50% of the time, which is frustrating. The "clickpad" functionality is also problematic: When you press your thumb on the dual-purpose trackpad/button surface in order to click, the system will often think you meant to move the mouse or you're trying to multi-touch resize. Again: It's frustrating.

Keyboard

Physically the keyboard is good. The keys have a lot of travel and I can type fast. The left control key is in the far bottom left so it's usable (unlike Macs that put the function key there). The arrow keys work well. One peculiarity is the keyboard has an extra column of keys on the right side, which includes Delete, Home, Page Up, Page Down, and End. This caused my muscle memory for switching from arrow keys to home row keys to be off by one column. This also puts your hands off center while typing, which can make you feel like you're slightly reaching on your right side.

At first I thought that the extra column of keys (Home, Page Up, etc) was superfluous. But after struggling to use Sublime Text while writing some code, I realized that the text input controls on Linux and Windows rely on these keys. It makes sense that HP decided to include them. As a Mac user I'm used to Command-Right going to the end of line, where a Windows or Linux user would reach for the End key. Remapping every key to match the Mac setup is possible, but hard to make consistent across all programs. The right thing to do is to relearn how to do text input with these new keys. I spent some time trying to retrain my muscle memory, but it was frustrating, like that summer when I tried [Dvorak][13].

Sound

The machine comes with four speakers: two fancy Bang & Olufsen speakers on top, and two normal ones on the bottom. The top speakers don't work on Linux and there's a [kernel bug open][14] to figure it out. The bottom speakers do work, but they're too quiet. The headphone jack worked correctly, and it would even mute the speakers automatically when you plugged in headphones. I believe this only happened because I had upgraded my kernel to the bleeding edge [4.10 version][15] in my attempts to make other hardware functional. I figure the community will eventually resolve the kernel bug, so the top speaker issue is likely temporary. But this situation emphasizes why HP needs to ship their own custom distribution of Windows with a bunch of extra magical drivers.

Battery & power

Initially the battery life was terrible. The 4K screen burns a lot of power. I also noticed that the CPU fan would turn on frequently and blow warm air out the left side of the machine. It's hot enough that it's very uncomfortable if it's on your lap. I figured out that this was mostly the result of a lack of power management in Ubuntu's default configuration. You can enable a variety of powersaving tools, including [powertop][16] and [pm-powersave][17]. Intel also provides [Linux firmware support][18] to make the GPU idle properly. With all of these changes applied, my battery life got up to nearly 5 hours: a disappointment compared to the 9+ hours advertised. On a positive note, the USB-C charger works great and fills the battery quickly. It was also nice to be able to charge my Nexus X phone with the same plug.

Two-in-one

The Spectre x360 gets its name from the fact that its special hinges let the laptop's screen rotate completely around, turning it into a tablet. Without any special configuration, touching the screen in Ubuntu works properly for clicking, scrolling, and zooming. Touch even works for forward/back gestures that don't work on the trackpad. The keyboard and trackpad also automatically disable themselves when you rotate into tablet mode. You can set up [Onboard][19], Gnome's on-screen keyboard, and it's decent. Screen auto-rotation doesn't work, but I was able to cobble something together using [iio-sensor-proxy][20] and [this one-off script][21]. Once I did this, though, I realized that the 16:9 aspect ratio of the screen is too much: It hurts my eyeballs to scan down so far vertically in tablet mode.

Window manager and programs

I haven't used Linux regularly on a desktop machine since RedHat 5.0 in 1998\. It's come a long way. Ubuntu boots very quickly. The default UI uses their Unity window manager, a Gnome variant, and it's decent. I tried plain Gnome and it felt clunky in comparison. I ended up liking KDE the most, and would choose the KDE [Kubuntu variant][22] if I were to start again. Overall the KDE window manager felt nice and did everything I needed.

On this journey back into Linux I realized that most of the time I only use eight programs: a web browser (Chrome), a terminal (no preference), a text editor (Sublime Text 3), a settings configurator, a GUI file manager, an automatic backup process (Arq), a Flux-like screen dimmer, and an image editor (the Gimp). My requirements beyond that are also simple. I rely on four widgets: clock, wifi status, battery level, and volume level. I need a task manager (like the Dock) and virtual work spaces (like Mission Control / Expose). I don't use desktop icons, notifications, recent apps, search, or an applications menu. I was able to accommodate all of these preferences on Linux.

Conclusion

If you're in the market for a new laptop, by all means check this one out. However, I'll be selling my Spectre x360 and going back to my mid-2012 MacBook Air. It's not HP's fault or because of the Linux desktop. The problem is how I value my time.

I'm so accustomed to the UX of a Mac that it's extremely difficult for me to use anything else as efficiently. My brain is tuned to a Mac's trackpad, its keyboard layout, its behaviors of text editing, etc. Using the HP machine and Linux slows me down so much that it feels like I'm starting over. When I'm using my computer I want to spend my time improving my (programming, writing, etc) skills. I want to invest all of my "retraining" energy into understanding unfamiliar topics, like [new functional languages][23] and [homomorphic encryption][24]. I don't want to waste my time relearning the fundamentals.

In contrast, I've spent the past two years learning how to play the piano. It's required rote memorization and repeated physical exercises. By spending time practicing piano, I've opened myself up to ideas that I couldn't appreciate before. I've learned things about music that I couldn't comprehend in the past. My retraining efforts have expanded my horizons. I'm skeptical that adopting HP hardware and the Linux desktop could have a similar effect on me.

I'm stubborn. There will come a time when I need to master a new way of working to stay relevant, much like how telegraph operators had to switch from Morse code to [teletypes][25]. I hope that I will have the patience and foresight to make such a transition smoothly in the future. Choosing to retrain only when it would create new possibilities seems like a good litmus test for achieving that goal. In the meantime, I'll keep using a Mac.

--------------------------------------------------------------------------------

作者简介：

I'm the author of the book Effective Python. I'm a software engineer and I've worked at Google for the past 11 years. My current focus is survey statistics. I formerly worked on Cloud infrastructure and open protocols.

Follow @haxor if you'd like to read posts from me in the future. You can also email me here if you have questions, or leave a comment below. If you enjoyed this post, look here for some of my other favorites.

-----------------

via: http://www.onebigfluke.com/2017/04/discovering-my-inner-curmudgeon-linux.html

作者：[Brett Slatkin ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.onebigfluke.com/
[1]:http://www.onebigfluke.com/2017/04/discovering-my-inner-curmudgeon-linux.html
[2]:http://www.onebigfluke.com/2016/10/lamenting-progress.html
[3]:http://www.onebigfluke.com/2016/10/alternatives-to-apple-computers.html
[4]:http://www.bestbuy.com/site/hp-spectre-x360-2-in-1-13-3-4k-ultra-hd-touch-screen-laptop-intel-core-i7-16gb-memory-512gb-solid-state-drive-dark-ash-silver/5713178.p?skuId=5713178
[5]:https://www.howtogeek.com/101862/how-to-manage-partitions-on-windows-without-downloading-any-other-software/
[6]:https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows
[7]:https://www.ubuntu.com/download/desktop/install-ubuntu-desktop
[8]:http://support.hp.com/us-en/document/c00364979
[9]:https://launchpad.net/gnome-tweak-tool
[10]:https://launchpad.net/xserver-xorg-input-libinput
[11]:https://wiki.archlinux.org/index.php/Libinput#Configuration
[12]:https://github.com/bulletmark/libinput-gestures
[13]:https://en.wikipedia.org/wiki/Dvorak_Simplified_Keyboard
[14]:https://bugzilla.kernel.org/show_bug.cgi?id=189331
[15]:http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/
[16]:https://blog.sleeplessbeastie.eu/2015/08/10/how-to-set-all-tunable-powertop-options-at-system-boot/
[17]:http://askubuntu.com/questions/765840/does-pm-powersave-start-automatically-when-running-on-battery
[18]:https://01.org/linuxgraphics/downloads/firmware
[19]:https://launchpad.net/onboard
[20]:https://github.com/hadess/iio-sensor-proxy
[21]:http://askubuntu.com/questions/634151/auto-rotate-screen-on-dell-13-7000-with-15-04-gnome/889591#889591
[22]:https://www.kubuntu.org/
[23]:http://docs.idris-lang.org/en/latest/tutorial/index.html#tutorial-index
[24]:https://arxiv.org/abs/1702.07588
[25]:https://en.wikipedia.org/wiki/Teleprinter
