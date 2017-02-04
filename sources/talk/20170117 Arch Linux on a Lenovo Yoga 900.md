#rusking translating 
# Arch Linux on a Lenovo Yoga 900

_Warning: this is about 5,500 words with plenty of interesting links, so wait till you’ve got something to drink and some time._

After 3 years running Arch Linux on a [Lenovo Yoga 2][2], I decided to upgrade to a Yoga 900:
 ![](http://keithcu.com/wordpress/wp-content/uploads/2017/01/Yoga900-1.jpg) 

_Lenovo Yoga 900 [Amazon special][1] for $925 – 8GB RAM, 256GB SSD, 3200×1800, Intel Skylake 3.2GHz + Iris Graphics_

Dell charges $1650 for a [similar XPS 13][3] albeit with the next generation of Intel chip. The current model of Yoga is the 910, and that laptop costs $1300\. However, I didn’t even consider it because they screwed the pooch on the keyboard. Lots of reviews start with the color and feel of the materials on the outside, but I’m going to start on the keyboard layout.

### Keyboard


The Yoga 2 Pro and the Yoga 900 have the same design. It is inferior in several ways compared to the traditional and well-regarded IBM Thinkpad keyboards, but not the worst keyboard out there and I got used to it over the 3 years. Unfortunately, Lenovo made things worse in the 910.

 ![](http://keithcu.com/wordpress/wp-content/uploads/2017/01/Yoga900-2.png) 
_Yoga 2 and Yoga 900 keyboard layout _

 ![](http://keithcu.com/wordpress/wp-content/uploads/2017/01/Yoga900-3.png) 
_Yoga 910 keyboard_

The problem with the 910 keyboard is that the right-shift key is in the wrong place, and impossible to reach without moving your hand. It is in a different position than every keyboard I’ve ever used going back to 9<sup>th</sup> grade typing class on the IBM Selectric. I’d expect such a mistake from a company like Asus or Dell, not a company with the legacy of building typewriters that generations of Americans learned and worked on.

Every year the Yoga team has made changes to the layout. Imagine if every year in the 20<sup>th</sup> century, IBM had changed the layout of their typewriters, and then bragged about the “[efficiency][4]” gains. The company wouldn’t even be around today!

I probably could get used to the Yoga 910 page up / page down overloaded with arrow keys, and some of the other changes, but the shift-key is a deal breaker and I’d rather not bother with the others.

There are many ways for Lenovo to truly improve their keyboard, such as making the volume-up key not so close to application-close. And re-thinking whether they really need an easy way to (accidentally) turn off the screen given there is already a way to dim it. And figuring out how to put in an overloaded number pad. Does Lenovo think only businesses deal with numbers?

The 910 keyboard has so many changes, they might not ever go back to their old layouts again. I’m hoping this hardware will last me years. I’d rather have a great keyboard than a computer 10 times faster.

I see in the Yoga 910 reviews on the Lenovo website that some people are returning the computer because of the keyboard. Lenovo should have a policy: if an employee wanted to make an alteration to the keyboard, they should have to write down a **very ****good** reason, and then sacrifice one of their fingers in solidarity with the pain it will cause customers. A rule like that would decrease this needless churn. Lenovo went through a lot of work make the Yoga 910, but f*cked it up with the input mechanism.

### Overall

The Yoga 2 was generally fast enough for everything I needed to do. An SSD is nice for various reasons, but it is almost overkill on Arch. People who only use Windows might not realize how bloated it is:

 ![](http://keithcu.com/wordpress/wp-content/uploads/2017/01/Yoga900-4.png) 

In the late 90’s, you’d get a new computer every few years because the processors were doubling in speed every 18 months, and the software was doubling in size frequently as well. Things are very different now. The new Yoga is 30% faster than my Yoga 2 running integer benchmarks. This is a 3.2 GHz machine whereas the old one maxed out at 2.6 GHz so most of the difference is the faster frequency.

Haswell was introduced in 2013, and Skylake was introduced in 2015 so two years of advancement is the other part of the improvements. The big benefit of the new processor is that it is built in 14nm instead of 22nm which means less heat and longer battery life. My old Yoga 2 battery was still giving me about 3.5 hours of battery life with moderate brightness, but this should give me 7.

The Yoga 2 hinge is starting to weaken and fall apart, and there is no way to tighten it, only to try to find one on the Internet or mail it to Lenovo:

 ![](http://keithcu.com/wordpress/wp-content/uploads/2017/01/Yoga900-5.png) 

The hinge on Yogas is designed to let you lay the device flat, and even fold it back as a tablet, but I found it a heavy and awkward and so never bothered. I’m just happy if I’ll be able to open and close it daily for years.

The Yoga 900 hinge is a more solid watchband design and should last longer:

 ![](http://keithcu.com/wordpress/wp-content/uploads/2017/01/Yoga900-6-1.jpg) 

The only very minor downside is that if you shake it, it sounds like you’ve got broken parts rattling around inside, which usually is something to be worried about for electronics! However, it’s just a false alarm of the 800 pieces sliding.

The Yoga 2 Pro was overall a quite well-built device, but if I hold it in one hand with the screen open, it sags a bit, and sometimes the keyboard backlight goes out. Both Yogas are thin and light, but the 900 feels more solid.

### Clickpad

The biggest problem with the Yoga 2 was the Synaptics Clickpad it used. It actually wasn’t the hardware, it was the driver, which is basically unmaintained, and of course had some bugs. It’s a shame because Synaptics could easily afford one engineer to help maintain a few thousand lines of code. They actually wrote another driver, they just never released it freely so it could be included with the kernel.

However, a new library called [Libinput][5] was created, and they support Clickpads and things work well out of the box now. The best thing about Libinput is that they fixed the bug where if you have your left finger touching in the mouse-click area, it will now register pointer movements by your right finger. It’s hard to believe, but that basic functionality was broken for many years with Synaptics hardware on Linux.

The Clickpad hardware was still working fine, but it didn’t give any audible click sound anymore. That actually isn’t a problem, but it did make me wonder if it was going to wear out at some point. The old Thinkpads had multiple left and right mouse buttons, so if one broke, you could use the other while you ordered a new part, but since there’s only one button here, there is no backup except to plug a mouse in. (Lenovo expects you to mail in the computer to get a new mouse.)

### Kernel Support

When I bought the Haswell laptop, the hardware design was brand new, so I ran into a lot of Linux driver problems initially that took months to resolve. In this generation, Skylake crashing bugs were still being fixed [8 months after the architecture was introduced,][6] but now it appears they’ve all been resolved. And even when those were fixed, there were still problems with [power management support,][7] but today these also appear to be improved. The laptop will settle into the lower power C6-C10 states if nothing is going on. (This is verifiable with **powertop**.)

The power management features are important not only for battery life, but because these very small circuits eventually wear out because of something known as [electromigration][8]. Intel even warns that: “Long term reliability cannot be assured unless all the Low-Power Idle States are enabled.” By running in lower power mode, and therefore using the circuits less, they will last longer.

Linux’s Haswell support is very reliable now, but it was definitely flakey for a long time. I wrote about some of the issues at the beginning and after the first year, but I can say finally that things are great for Haswell and Skylake.

### Lenovo BIOS Linux Incompatibility

Before I could install Linux on the Yoga 900, I had to flash a new BIOS in Windows. In fact, I had to install 2 BIOSes. The latest Yoga 900 BIOS didn’t [include][9] the necessary fix I needed, so after scratching my head for a while I eventually discovered and [installed][10] a separate “Linux-only” BIOS update, which also says that Windows is no longer supported by Lenovo: “Are we not [merciful][11]?”

As people who followed the Linux news are aware, the Yoga 900 and certain other recent models of Lenovo laptops were impossible to install Linux on, because it couldn’t even [detect the hard drive][12]. Lenovo’s first reply was that the laptops didn’t work on Linux because it uses a [new RAID controller mode][13]. However, RAID is meant for multiple disks, and this laptop only has one hard drive, and there isn’t even room to install another.

Here’s some more of Lenovo’s [official explanation][14]:

> “To support our Yoga products and our industry-leading 360-hinge design in the best way possible we have used a storage controller mode that is unfortunately not supported by Linux and as a result, does not allow Linux to be installed.”

I found it funny that the reason for their different storage controller is because of their hinge! It would be like a car company saying they had to change their rims because of their new radio.

This turned into a controversy thanks to the efforts of [Baron][15][H][16][K][17] on Reddit who wrote about it, provided information to the media, and contacted his local Attorney General in Illinois. Searching for “[Lenovo Yoga ][18][L][19][inux compatibility][20]” turns up 300,000 results. Lenovo could be criminally liable for selling a “general purpose” PC that didn’t let you install your own operating system. The default OS is meaningless on a machine that is truly mine.

Hackers got involved, and they eventually discovered via playing with the UEFI settings, that the machine still supported the AHCI controller mode, it was just disabled. In short, Lenovo took away Linux compatibility for no good purpose. Because of all the information people learned, if this case had ever gone to court, Lenovo would have gotten their ass handed to them.

Fortunately, all the news got their attention, and they eventually updated the BIOS. I type this on a Yoga 900 running Linux, so we should celebrate this victory. Let’s hope they learn a lesson, but I’m not optimistic. They ought to offer you an option to choose the operating system for your machine. They would have found this bug long before any customers did. I’d wait an extra week to get a custom computer. They could also do a better job setting up the partitions and letting people customize lots of things, and grabbing all the latest software, rather than using a generic old image which needs lots of updates.

Some people like Lenovo said it was Linux’s fault for not supporting this new RAID driver mode. However, AHCI is a very popular standard, and the Linux kernel team rejected Intel’s code for this hardware as “[too ugly to live][21]”! The team also asked Intel for a specification describing the device’s behavior, but wasn’t given this information.

### Heat Dissipation

The Yoga 2 could get hot when pushing the CPUs hard. I charred the bottom of the plastic case while compiling LibreOffice on a blanket, which was an eyesore and made me look like a homeless programmer. I tried a metal brush and some turpentine to get the worst of it off, but it didn’t really improve the situation:

 ![](http://keithcu.com/wordpress/wp-content/uploads/2015/04/20150327_135649-2.jpg) 

This new computer has a metal case which shouldn’t get discolored, and Skylake definitely runs cooler than Haswell. It also seems to do better job of pushing heat out sideways through the hinge, instead of down which could easily be obstructed.

One of the annoying things about the Yoga 2 over time is that the fan blades had collected dust over the years, but it sounded like sand! It was uneven and distracting and made it much louder. I did take the laptop apart and vacuum everything, but the blades are hidden. I’d have to replace the fans. They don’t run on the Yoga 2 for typical tasks of word processing and web browsing, but when they do spin up it’s annoying if I’m not wearing headphones.

The Yoga 900 fans are higher pitch, but it is just a smooth whir and not distracting. The Yoga 900 fans seem to run all the time, but at a low speed that is quiet. The sound of my refrigerator and air filter are louder unless the fans crank up under load, and even then it is not a big deal.

### Graphics

The Yoga 2 had a great screen, but it also had widely reported issues because the yellow looked like orange. However, everything looked so crisp and all the other colors looked fine. The Yoga 900 screen has fixed the yellow issue. It’s not true 4K, being only 3200×1800, but the pixels are smaller than 4K on a 15.6” monitor, so that it looks very sharp.

When I first got the Yoga 2, Haswell was still a new chipset, so I saw various Intel graphics display glitches which went away within a couple of months. However, I eventually discovered a memory leak that could crash Linux, and this bug was in there for years.

My computer ran out of RAM a number of times skipping through video in VLC (shift + arrow). The memory didn’t show up as in use by VLC, but my computer ran out of RAM, so clearly it was kernel memory. Eventually I setup a swap file which gave more time, but even then a couple of times it filled up when I wasn’t keeping track. Eventually the bug disappeared, and Linux is very stable right now, but it was there for years.

Everyone says Intel has the best Linux drivers, but they seem like a skunkworks project inside Microsoft. The driver developers working on Linux at Intel are good, there just aren’t enough of them. They should be perfecting the drivers before they release the hardware! Intel produced [1][22][13][23] [processors][24] as part of Skylake, with subtle feature differences. That sounds like a lot, but they released 256 chips during the [Haswell generation][25], so maybe things are getting more focused. I was told 10 years ago by an Intel employee that they invested 1% into Linux compared to Windows, and today that still seems to be true.

The only performance issue I ran into with the Yoga 2 was that it couldn’t play 4K video reliably. It would often show screen glitches, or just do around 5 frames per second:

 ![](http://keithcu.com/wordpress/wp-content/uploads/2017/01/VlcGlitch.jpg) 

The Yoga 2 would even sometimes struggle playing 1920×1080 video, which it was supposed to be able to handle at 60fps. Part of this is probably because I always have other applications like Firefox and LibreOffice running.

The Skylake processor is spec’ed to do 4K video at 60 fps for H.264, VP9, and other codecs. In fact, the processor has a lot of hardware accelerated [multimedia][26][capabilities][27]. I tried out hardware encoding of H264 with **ffmpeg** and found it was 4 times faster while using just 1 CPU. It’s cool to see this feature. Unfortunately, it is a little annoying to setup because you have to use a number of additional command line parameters:

“**-threads 1 -vaapi_device /dev/dri/renderD128 -vcodec h264_vaapi -vf format=’nv12|vaapi,hwupload’**”

I tried to find a way to have **ffmpeg** remember these for me so I wouldn’t have to type it in every time, but couldn’t. I can’t just pass those in automatically either, as other things need to go before and after. I also discovered that it won’t resize video while using the hardware, and will just ignore the request, so only sometimes can it be used. It would be really great if **ffmpeg** could figure this out automatically. There is a lot of unused hardware because users don’t know or can’t be bothered. Unfortunately [it’s kind of a mess][28] for video encoding and decoding as there are multiple APIs for Linux and Windows.

Skylake does a much better job playing 4K video, but it will still glitch sometimes and briefly drop down to 10 fps. I think part of it is X. I tried playing 4K videos in Wayland, and it was smoother, so I’m hopeful. It is great to see that the OpenGL support has improved. On this hardware, Intel supports version 4.5 which is the latest version from 2014.

My Yoga 900 (-13ISK2) is actually a revised version of the original offering with an Iris 540 graphics co-processor which is supposed to be [faster][29] than the stock 520 because of 24 more shader units. However, it can only play SuperTuxKart with moderate settings running 1600×900 at 20 fps, so I wouldn’t say it’s anything to brag about yet. Speaking of which, the game has improved tremendously over the years and is beautiful now:

 ![](http://keithcu.com/wordpress/wp-content/uploads/2017/01/Screenshot-from-2017-01-10-17-03-57.png) 

There is an Intel team in China working on [enabling][30] support OpenCL using the graphics card. However, I don’t see any mention of people using it in Blender yet, so I wonder the status and whether it is just demoware. Intel’s OpenCL support has been missing for so long, people doing serious work with Blender already use NVidia or AMD cards, and even when Intel finally writes the code, there’s not much testing or interest.

One thing that was surprising to me is that I did some experiments on another machine, and found that a quad-core processor is faster than the NVidia 960M for ray-tracing with the Cycles engine. Apparently the 640 CUDA cores aren’t enough to beat 4 Intel CPUs on that task. Newer processors have 2000+ cores and those provide faster performance.

### HiDPI

The situation has gotten better for Linux on these high-res screens over the last 3 years, but it still has a ways to go. The good news is that Gnome is almost perfect with HiDPI in current versions. Firefox generally looks great if you set the **layout.css.devPixelsPerPx** to 2\. However because this 13.3” screen’s pixels are so small, I also install a No-Squint Plus plugin and have it render everything at 120% to make it a bit easier to read.

I was happy to help LibreOffice look better on these screens with [some patches][31] that were shipped in April, 2014, and the work has continued since. The biggest issue remaining is that LibreOffice is still doubling toolbar icons. A number of themes have SVG icons, but they aren’t packaged and shipped with the product. SVGs are much slower to load compared to PNGs and need to be cached. [Tomaž Vajngerl has done some more work][32] in this area, but it hasn’t released yet. Even so, LibreOffice looks better than many other Linux apps which don’t have recognizable icons.

Applications are generally improving with regards to detecting and being usable on high-res screens, but even some of the most popular such as Gimp and Audacity and Inkscape are still hard to use. I installed a large custom theme for Gimp, but all the icons are different so even though they are bigger, it takes time to recognize them.

The unfortunate thing about Linux’s 1.5% marketshare is that these sorts of issues don’t get much priority. Many codebases are moving to GTK 3, but in Audacity’s case, it seems to be [stalled][33]. I talked in my first review about a long tail of applications that will need improvements but 3 years later, even some of the most popular apps still need work.

### SSD

The old hard drive was doing fine because of the various optimizations I did, especially to Firefox. I also kept in mind that the **/tmp** directory had automatically been setup as a RAM drive, and so I would usually save downloads there first. Sometimes I’d find a 500 MB video I want to grab a short 20 MB clip from, or convert to another format, so by doing it in /tmp I saved a lot of writes. It is more work, and possibly unnecessary, but it’s faster to work in RAM.

I had written to each cell 25 times over the 3 years, which meant the drive could last for 350 years. The vast majority of the writes were for Arch updates. It gets new LibreOffice builds every month, and a new “stable” kernel release every week. It was great to be up to date all the time, but it did cost 100 times more writes compared to running Debian stable. However, given that each component has their own release cycle, it was necessary.

The new Samsung drive diagnostics don’t tell the number of times it has written to each cell. In fact, I can’t even find out what cell type it is and how many writes it is specified to handle. I believe the “Percentage Used” value will me the age of the drive, but perhaps it relates only to the number of spare cells. I haven’t found any documentation so I can only guess:

|||
|--|--|
| **Model Number:** | **SAMSUNG MZVLV256HCHP-000L2** |
| **Firmware Updates (0x06):** | **3 Slots** |
| **Available Spare:** | **100%** |
| **Available Spare Threshold:** | **10%** |
| **Percentage Used:** | **0%** |
| ****Data Units Written:**** | **198,997 [101 GB]** |
| **Data Units Written:** | **305,302 [156 GB]** |
| **Host Read Commands:** | **3,480,816** |
| **Host Write Commands:** | **10,176,457** |
| **Error Information Log Entries:** | **5** |

### Broken Left-Ctrl Key

One thing I noticed after just a few hours of use is that the left-control key pops off if pressed in the upper-left corner:

 ![](http://keithcu.com/wordpress/wp-content/uploads/2017/01/Yoga900-7-1.png) 

_Broken Yoga 900 key: Note the tiny cylinder missing in the left box vs the right
_

The layout of the Yoga 900 keyboard is the same as the Yoga 2 Pro, but the internals are different. The keys of the Yoga 2 Pro cannot be removed and replaced individually, and there is no way to pop off any of the keys without doing permanent damage. The Yoga 900 has the old style Thinkpad keys: which can be detached, and replaced individually.

However, there is a defect and one of the 4 tiny cylinder notches in the hinge was missing so that it only connects to the key top at 3 points, and if you don’t press the key in the middle, it will slip off.

I contacted Lenovo about this. Even though the keys are replaceable and serviceable, they will only replace the entire keyboard, and refuse to mail out any parts. They recommend I mail the computer in, or take it to the Geek Squad service center. I knew that mailing it in would take 2 weeks, so I called my local store to ask if they had Yoga keyboard parts in stock. They told me they don’t take the computers apart, they just mail them to Atlanta. There used to be places that could make many repairs to IBM laptops, and stocked the common parts, but that industry is apparently gone.

I noticed this mistake within a couple of hours of using the computer, so I’m pretty sure it was a manufacturing defect. It is such a tiny piece of plastic that was deformed or broke off during assembly.

Even though the computer is under warranty and could be fixed for free, I didn’t want to wait for something so minor, so I just went on the Internet and found a website called laptopkey.com and ordered a replacement key and hinge. It was actually tricky because there are 3 types of hinges! It took me several minutes to figure out which one my computer has because y’all look the same to me:

 ![](http://keithcu.com/wordpress/wp-content/uploads/2017/01/BigHinges-2.jpg) 

So I ordered the part, but I read it would arrive in about a week. It was very frustrating because I use left-Ctrl all the time when doing copy/paste, skipping through video or by word in text editors, etc. so I thought maybe I could swap the hinge from the right-ctrl, which I never use.

So I tried to remove this key following instructions I found on the Internet: I got my fingernail under the upper left corner, and lifted till it clicked. And then I put my nail under the upper right corner, and did the same thing. But another one of those tiny pieces of plastic broke off, so now I have two broken hinges. It might not be possible to remove the keys without breaking these very tiny clips. These keyboards are serviceable perhaps only in theory.

So I decided to go old-school and use superglue. I’d rather have the damn key stay on and have no urgent plans to replace them. It was tricky because I needed a small dab of glue about 1mm in diameter: too much in there it could gum up the works.

My experience building R/C airplanes came in handy and I fixed it and now the left-Ctrl key is holding on. The right one still slips off but I hardly use it. I was happy again! This is a long sidetrack, but it is important to keep in mind maintenance of a machine.

### Antergos vs. Arch

After 3 years with Arch Linux, I had no interest in trying anything else. The Intel drivers had regressions, but otherwise Arch has been painless to run on a daily basis, and it got a little better every week. It’s exciting to be up to date with everything. I often had packages newer than what was in Ubuntu on their release date. Ubuntu users can find newer software in custom PPAs, but there isn’t any testing or coordination across them, so that people who use multiple run into problems.

People also complain about Ubuntu upgrades hosing the machine and forcing a re-install, so even though their installation process is quicker, the ongoing maintenance isn’t. Every time I’ve read about someone borking an Arch installation, they would always admit it was a user error or something like btrfs corruption.

I wanted to install [Antergos][34], which provides a GUI installer for Arch. However, the setup looked unreadable on my screen, and it didn’t recognize the Clickpad in their minimal install, which is the only one I had space for on my old 1GB USB key. So I decided to just install Arch old-school again. Thankfully, the Yoga still supports legacy BIOS, so I didn’t have to mess with [UEFI][35].

I was sorry I didn’t try out Antergos, because I think it could be a great distro for less technical people or those who want to quickly get into Arch Linux. The Arch wiki is filled with tips for best running Linux. I’d love to have something which setup weekly TRIM for my SSD, [Profile-Sync-Daemon][36], Android support, hardware-accelerated video playback, etc. There are quite a few things that nearly all users would want, and are just a few lines to detect and enable.

Manjaro is a very popular Arch-based distribution with a GUI installer, but having run Arch for 3 years, I trust their packagers to work out issues between components. I’ve read a number of comments on Reddit from people who found their Manjaro installation broken after an update.

My only complaint about my Arch installation now is the ugly unreadable bootloader screen. I just need to copy over the **grub.cfg** from my old machine.

### Arch Install

At first I just wanted to just move the hard drive from one laptop to the next so that I wouldn’t even have to install anything, but after taking the computers apart, I noticed the M.2 SSDs are a different shape. I could have done a low-level block copy, but just decided to start from scratch because it would be a good refresher. It had been 3 years. I had installed a lot of random crap over the years, and even when I remembered to un-install it there were all kinds of digital remnants.

The Arch install went quite smoothly this time because the hardware had been around for so long. I still needed to do **rfkill unblock wifi**, but other than that everything else just worked. Apparently Linux still doesn’t know how to properly read the rfkill information from this model. Fortunately **systemd** has the ability to restore rfkill values on startup.

### Kernel Buglist

One of the things that continues to surprise me is that the Linux buglist is a mess. I know there are all of these people and this great rate of change, but what isn’t changing is the worst case scenario for a bug report. I don’t know why bugs sit around for years, but there clearly is no escalation process.

I wrote an analogy in my last review I think is useful. Imagine if it took an airline 1-2 years to return your lost luggage. Would you use trust that company? In fact, what’s the point of making a new release if you’ve still got thousands of known bugs and hundreds of regressions? If 1% of every Boeing airplane crashed, would they just keep continuing like that for years?

Maybe the Linux Foundation should hire some engineers to work on all the bugs that everyone else seems to be ignoring. There are a lot of people paid to work on Linux, and there are a lot of old bugs – which is usually what amateurs do. In my opinion the kernel would be better off not releasing anything for months until the bug count was under 50\. Right now it is 4672\. That would be a good reason to increment the major release number.

There is something contradictory about making a new stable release every week, but they’ve been doing it that way for years, and they have critical fixes every time, so they are clearly doing something valuable. The kernel gets better at a great rate, so far be it for me to criticize, but I do think they should try something different.

At least, bugs should get resolved within a specific timeframe. If that is exceeded, than it should escalate up to the maintainer and eventually to Linus. If there is a problem area with a lot of old bugs in a place that no one is working on, then Linus can point this out and crack the whip on the relevant parties. They need to think more like Boeing.

### Lenovo

Many Linux users hammer Lenovo for their lack of support on their consumer laptops, but they build quality hardware at a good price. As I wrote years ago, it was obvious not one person at Lenovo had bothered to install Linux on the Yoga 2 before they released it, and it is true for the Yoga 900 because it was impossible.

I think everyone in their company should be dual-booting. It isn’t that hard to setup, and their customers might want that. Lenovo has 60,000 employees. At least, they need to hire a few people on their Yoga team willing to try out this thing called **Linux**. Windows is painful to use compared to Linux in various ways. Windows runs more applications, but I think perhaps half of their users would be happier with a properly configured Linux installation.

While it is bad how Lenovo is still ignoring Linux, their problems apply to more than the software. On many models, the RAM chips are soldered on. In some devices, there are whitelists and only pre-approved cards can be installed. The Yogas don’t have a discrete graphics card, but even Lenovos that do provide no mechanism to upgrade the card, like you can with a desktop. I think someone needs to put a horse head in the bed of the Lenovo CEO.

### Conclusion

This Yoga 900 is an amazing laptop for the price, and it’s a definite step up from the Yoga 2 with the improvements. A similar Apple Macbook Pro is $1500, but it has 40% less pixels.

Windows is adopting some of the best features of Linux, but they still don’t have native support for a package manager with all of the interesting free software components pre-compiled. Installing **ffmpeg** on Windows is a huge pain because of all the [dependent libraries][37] it uses.

Microsoft built a Windows store, which is sort of like a repository, but it doesn’t handle inter-package dependencies, and isn’t setup to manage individual libraries. Microsoft also has a new package manager called [NuGet][38], but it seems to be used mostly for .Net software. It did have a package for ffmpeg, but it didn’t have any dependencies for the codecs so even after installing it, it won’t do anything useful yet.

Last March, [Microsoft demonstrated][39] the ability to run Ubuntu command-line applications, which is quite a revolution. (They should have [started with Debian][40].) There’s even [a discussion][41] in their buglist to add support for more distros which could be quite tempting.

For me at least, I have no need for Windows apps, and the extra maintenance time. Fixing issues in Windows involves hunting down things in lots of different places. Linux still has a fair number of places to configure a system, but overall it’s much simpler.

I have friends who install 3<sup>rd</sup> party software on Windows just to keep their drivers up to date, because it grabs code from many more websites than just Microsoft’s. Windows has gotten better over the years, and it has more games and desktop applications, but it is an aging, closed system.

I find Gnome classic a streamlined experience. I wish it wasn’t written in the clunky [fad Javascript][42], and they re-enabled a community around custom themes and color schemes. It’s also still missing some nice features from Gnome 2 and Windows 10, and could be a bit more stable. Gnome 3.0 in 2011 was a step backwards, but six years later we’re up to Gnome 3.22, and things are mature again.

Gnome Classic is one of the best GUIs, but there are a [number of good ones][43] and all are getting better. This machine is working quite well now and I’m just going to sit back and keep waiting for the HiDPI and other improvements! I’m looking forward to deep learning inside the grammar checker of LibreOffice.

--------------------------------------------------------------------------------

via: http://keithcu.com/wordpress/?p=3739

作者：[keithccurtis][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://twitter.com/keithccurtis
[1]:https://www.amazon.com/Lenovo-13-3-inch-Multitouch-Convertible-Platinum/dp/B01NA6ANNK/
[2]:http://keithcu.com/wordpress/?p=3270
[3]:http://configure.us.dell.com/dellstore/config.aspx?oc=cax13w10ph5122&model_id=xps-13-9360-laptop&c=us&l=en&s=bsd&cs=04
[4]:http://blog.lenovo.com/en/blog/why-you-should-give-in-to-the-new-thinkpad-keyboard
[5]:https://www.freedesktop.org/wiki/Software/libinput/
[6]:https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=762ce4458974534a2407cc924db05840c89105df
[7]:https://mjg59.dreamwidth.org/41713.html
[8]:https://en.wikipedia.org/wiki/Electromigration
[9]:http://support.lenovo.com/us/en/products/Laptops-and-netbooks/Yoga-Series/yoga-900-13isk2/80UE/downloads/DS112754
[10]:http://support.lenovo.com/us/en/products/laptops-and-netbooks/yoga-series/yoga-900-13isk2/downloads/ds119354
[11]:https://linux.slashdot.org/comments.pl?sid=9861381&cid=53241071
[12]:https://www.reddit.com/r/linux/comments/54gtpc/letter_to_the_federal_trade_commission_regarding/
[13]:http://venturebeat.com/2016/09/21/lenovo-confirms-that-linux-wont-work-on-yoga-900-and-900s-laptops/
[14]:http://venturebeat.com/2016/09/21/lenovo-confirms-that-linux-wont-work-on-yoga-900-and-900s-laptops/
[15]:https://www.reddit.com/user/baronhk/
[16]:https://www.reddit.com/user/baronhk/
[17]:https://www.reddit.com/user/baronhk/
[18]:https://duckduckgo.com/?q=lenovo+yoga+linux+compatibility&t=hs&ia=web
[19]:https://duckduckgo.com/?q=lenovo+yoga+linux+compatibility&t=hs&ia=web
[20]:https://duckduckgo.com/?q=lenovo+yoga+linux+compatibility&t=hs&ia=web
[21]:https://www.spinics.net/lists/linux-ide/msg53370.html
[22]:http://ark.intel.com/products/codename/37572/Skylake
[23]:http://ark.intel.com/products/codename/37572/Skylake
[24]:http://ark.intel.com/products/codename/37572/Skylake
[25]:http://ark.intel.com/products/codename/42174/Haswell#@All
[26]:http://www.anandtech.com/show/9562/intels-skylake-gpu-analyzing-the-media-capabilities
[27]:http://www.anandtech.com/show/9562/intels-skylake-gpu-analyzing-the-media-capabilities
[28]:https://trac.ffmpeg.org/wiki/HWAccelIntro
[29]:http://www.game-debate.com/gpu/index.php?gid=3295&gid2=3285&compare=iris-graphics-540-mobile-vs-intel-hd-graphics-520-mobile
[30]:https://www.freedesktop.org/wiki/Software/Beignet/
[31]:http://keithcu.com/wordpress/?p=3444
[32]:https://cgit.freedesktop.org/libreoffice/core/log/?qt=grep&q=hidpi
[33]:http://wiki.audacityteam.org/wiki/Linux_Issues#Hi-DPI
[34]:https://antergos.com/
[35]:https://wiki.archlinux.org/index.php/Unified_Extensible_Firmware_Interface
[36]:https://wiki.archlinux.org/index.php/Profile-sync-daemon
[37]:https://ffmpeg.zeranoe.com/builds/
[38]:https://www.nuget.org/
[39]:https://blogs.windows.com/buildingapps/2016/03/30/run-bash-on-ubuntu-on-windows/
[40]:http://keithcu.com/wordpress/?page_id=558
[41]:https://github.com/Microsoft/BashOnWindows/issues/992
[42]:http://notes.ericjiang.com/posts/751
[43]:https://wiki.archlinux.org/index.php/Desktop_environment
