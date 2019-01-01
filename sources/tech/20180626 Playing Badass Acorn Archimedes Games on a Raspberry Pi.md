[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Playing Badass Acorn Archimedes Games on a Raspberry Pi)
[#]: via: (https://blog.dxmtechsupport.com.au/playing-badass-acorn-archimedes-games-on-a-raspberry-pi/)
[#]: author: (James Mawson https://blog.dxmtechsupport.com.au/author/james-mawson/)

Playing Badass Acorn Archimedes Games on a Raspberry Pi
======

![Cannon Fodder on the Raspberry Pi][1]

The Acorn Archimedes was an excellent machine and years ahead of its time.

Debuting in 1987, it featured a point and click graphic interface not so different to Windows 95, 32 bit processing, and enough 3D graphics power to portal you to a new decade.

These days, it’s best remembered for launching the Acorn RISC Machines processor. ARM processors went on to rule the world. You almost certainly keep one in your pocket.

What’s less well appreciated is that the Archimedes was rad for games. For a few years, it was the most powerful desktop in the world and developers were eager to show what they could do with it.

But with such power came a great price tag. The Archimedes was never going to be in as many homes to make as many memories as Sega or Nintendo.

But now, the Raspberry Pi’s ARM chip makes it cheap and easy to play these games on the same operating system and CPU architecture they were written for.

Even better, the rights holders to much of this machine’s gaming catalogue have been generous enough to allow hobbyists to legally download their work for free.

This is a cheap and easy project. In fact, if you already run a Raspberry Pi home theatre or retro gaming rig, all you really need is a spare SD card.

### Introduction

None of this will be on the exam, so if you already know the story of the Acorn Archimedes – or just want to get straight into gaming – feel free to skip ahead to the next section.

But if you’re wondering what we’re even talking about, here it is:

#### What on Earth is an Acorn Archimedes?

Me and Acorn computers go way back.

For the earliest part of my life that I can remember, Dad ran his business from home, writing timetabling software for schools. This was the early 80s, before the desktop computer market had been whittled down to Mac and PC. There were Amstrad CPCs, Sinclairs, Commodores, Ataris, TRSs, the list goes on.

They all had their operating systems and ran their own software. If you wanted to port your software over to a new platform, you had to buy it.

So, at a time when it was somewhat novel for a family to have even one computer, we had about a dozen, many of them already quite antique. There was a Microbee, an Apple IIc, an IBM XT, all sorts of stuff.

The ones Dad liked most though were the BBC machines by [Acorn Computers][2]. He had several. There was a Model B, a Master 128 and a Master Compact.

They were named that way because the British Broadcasting Corporation were developing a course to teach children how to program and they needed. Because of this educational focus, they’d found their way into a lot of schools – exactly the market he was selling to.

At some point, I figured out you could play games on these things. I was straight away hooked like it was crack. All I cared about was games games games. It must have taken me several years to figure out that computers had a different use, because I can vividly recall how annoyed I was to be starting school while Dad got to stay home and play games all day.

On my 7th birthday I got a second hand BBC Master Compact all of my own. This was probably as much to keep me away from his work computers as it was to introduce me to computing. I started learning to program in BASIC and Logo. I also played epic amounts of space shooters, 2D platformers and adventure games.

Being obsessed with these things, I tagged along to the local BBC Users Group. This was a monthly get-together where enthusiasts would discuss what was new, bring their machines to show off what they’re doing and engage in some casual software piracy. Back before internet forums and torrents, people did this in person.

This was where I first saw an Archimedes. I can’t really remember the exact year or the exact model – I just remember my jaw dropping to the floor at the 3D graphics and the 8 channel stereo sound. It would be about a decade before I saw anything similar on a gaming console.

<https://www.youtube.com/embed/CsqsX2Nlfeg?feature=oembed>

#### The Birth of a Legend

Looking back, this has very good claim to be the first modern desktop computer. It was a 32-bit machine, an interface that looks more like what we use today than anything built in the 1980s, a palette of 4096 colours, and more horsepower than a lot of people knew what to do with.

Now, don’t get me wrong: the 8-bit BBC machines were loads of fun and great for what they were – but what they were was fairly primitive. It was basically just a big box you typed commands on to make it beep and stuff. In theory it had 8 colours, but when you saw one in the wild it was usually hooked up to a monochrome screen and you didn’t feel like you were missing out on too much because of it.

In 1984, Apple launched their Macintosh, featuring the first Graphical User Interface available on the mass market. Acorn knew they’d need a point and click graphic interface to stay in the game. And they knew the aging MOS 6502 they’d used in all their machines so far was just not going to be the CPU of the future.

So, what to replace it with?

The Acorn engineers looked at the available processors and found that none of them could quite do what they want. They decided to build their own – and it would be radically different.

Up until that point, chip makers took a bit of a Swiss Army Knife approach to processor design – to compete, you added more and more useful stuff to the instruction set.

There was a certain logic to this – hardware could be mass produced, while good software engineers were expensive. It made sense to handle as much as possible in the hardware. For device manufacturers with bills to pay, it was a real selling point.

But this came at a cost – more and more complex instructions required more and more clock cycles to complete. Often there was a whole extra layer of processing to convert the complex machine code instructions into smaller instructions. As RAM became bigger and faster, CPUs were struggling to keep pace with the available memory bandwidth.

Acorn turned this idea on its head, with a stripped-back approach in the great British tradition of the [de Havilland Mosquito][3]: Every instruction could be completed in a single cycle.

While testing the prototype CPU, the engineers noticed something weird: they’d disconnected the power and yet the chip was running. What they’d built was so power-efficient that it kept running on residual power from nearby components.

It was also 25 times faster than the 6502 CPU they used in the old BBC machines. Even better, it was several times more powerful than the Motorola 68000 found in the Apple Macintosh, Atari ST and Commodore Amiga – and several time more powerful than the 386 in the new Compaq too.

With such radically new hardware, they needed a new operating system. What they come up with was Risc OS, and it was operated entirely through a graphic point-and-click desktop interface with a pinboard and an icon bar. This was pretty much Windows 95, 8 years before it happened.

In a single step, Acorn had gone from producing some perfectly serviceable 8-bit box that kids could learn to code one, to having the most powerful desktop computer in the world. I mean, it was technically possible to get something more powerful – but it would have been some kind of server or mainframe. As far as something that could sit on your desk, this was top of the pile.

It sold well in Acorn’s traditional education market in the UK. The sheer grunt also made it popular for certain power-hungry business tasks, like desktop publishing.

#### The Crucifixion

It wasn’t too long before Dad got an Archimedes – I can’t remember exactly which model. By this time, he’d moved his business out of home to an office. When school holidays rolled around, I’d sometimes have to spend the day at his work, where I had all the time in the world to fiddle around on it.

The software it came with was enough to keep a child entertained for a while. It came with a demo game called Lander – this was more about showing off the machine’s 3D graphics power than providing any lasting value. There was a card game, and also some drawing programs.

<https://www.youtube.com/embed/mFwpsb75omg?feature=oembed>

I played with the demo disc until I got bored – which I think was the most use that this particular machine ever got. For all the power under the hood, all the applications Dad used to actually run his business ran on DOS and Windows.

He’d spent more than $4000 in today’s money for the most sophisticated and advanced piece of computing technology for a mile in any direction and it just sat there.

He might have at least salvaged some beneficial utility out of it if he’d followed my advice of getting some games for it and letting me take it home.

He never got around to writing any software on it. The Archimedes was apparently a big hit with British schools, but never really got popular enough with his Australian customer base to be worth coding for.

Which I guess is kind of sums up where it all ultimately went wrong for the Acorn desktop.

As the 80s wore on to the ’90s, Compaq reverse engineered the BIOS on the IBM PC to release their own fully compatible PC, and big players like Amstrad left their proprietary platforms to produce their own compatible MS-DOS machines. It was also became increasingly easy for just about anyone with a slight technical bunt to build their own PC-compatible clone from off-the-shelf parts – and to upgrade old PCs with new hard drives, sound cards, and the latest 386 and 486 processors.

Small, independent computer shops and other local businesses started building their owns PCs and hardware manufacturers competed to sell parts to them. This was a computing platform that could serve all price points.

With so much of the user base now on MS-DOS, software developers followed. Which only reinforced the idea that this was the obvious system to buy, which in turn reinforced that it was the system to code for.

The days when just any computer maker could make a go of it with their own proprietary hardware and operating system had passed. Third-party support was everything. It didn’t actually matter how good your technology was if nothing would run on it. Even Apple nearly went to the wall.

Acorn hung on through the 90s, and there was even a successor to the Archimedes called the [RiscPC][4]. But while the technology itself was again very good, these things were relatively marginal affairs in the marketplace. The era of the Acorn desktop had passed.

#### The Resurrection

It was definitely good for our family business when the market consolidated to Mac and PC. We didn’t need to maintain so many versions of the same software.

But the Acorn machines had so much sentimental value. We both liked them and were sad to see them go. I’ve never been that into sport, but watching them slowly disappear might have been a bit like watching your football team lose match after match before finally going broke.

We totally had no idea that they were, very quietly, on a path to total domination.

The ARM was originally only built to go in the Archimedes. But it turned out that having a massively powerful processor with a simple instruction set and very little heat emission was useful for all sorts of stuff: DVD players, set top boxes, photocopiers, televisions, vending machines, home and small business routers, you name it.

The ARM’s low power consumption made it especially useful for portable devices like PDAs, digital cameras, GPS navigators and – eventually – tablets and smartphones. Intel tried to compete in the smartphone market, but was [eventually forced to admit that this technology was just better for phones][5].

So in the end, Dad’s old BBC machines went on to conquer the world.

### The Acorn Archimedes as a Gaming Platform

While Microsoft operating systems were ultimately to become the only real choice for the serious desktop gamer, for a while the Archimedes was the most powerful desktop computer in the world. This attracted a lot of games developers, eager to show what they could do with it.

This would have been about more than just selling to a well moneyed section of the desktop computer market that was clearly quite willing to throw cash at shiny things. It would have been a chance to make your reputation in the industry with a flagship product that just wasn’t possible on lesser hardware.

So it is that you see Star Fighter 3000, Chocks Away and Zarch all charting new territory in what was possible on a desktop computer.

But while the 3D graphics power was this system’s headline feature, the late 80s and early 90s were really the era of Sonic and Mario: the heyday of 2D platform games. Here, the Archimedes also excels, with offerings like Mad Professor Mariarti, Bug Hunter, F.R.E.D. and Hamsters, all of which are massively playable, have vibrant graphics and a boatload of personality.

As you dig further into the library, you also find a few games that show that not every developer really knew what to do with this machine. Some games – like Repton 3 – are just old BBC micro games given the most meagre of facelifts.

Many of the games in the Archimedes catalogue you’ll recognise from other platforms: Populous, Lemmings, James Pond, Battle Chess, the list goes on.

Here, the massive hardware advantage of the Archimedes means that it usually had the best version of the game to play. You’re not getting a whole new game here: but it’s noticeably smoother graphics and gameplay, especially compared to the console releases.

All in all, the Archimedes never had a catalogue as expansive as MS-DOS, the Commodore Amiga, or the Sega and Nintendo consoles. But there are enough truly excellent games to make it worth an SD card.

### Configuring Your Raspberry Pi

This is a bit different to other retro gaming options on the Raspberry Pi – we’re not running an emulator. The ARM chip in the Pi is a direct descendant of the one in the Archimedes, and there’s an [open source version of Risc OS][6] we can install on it.

For the most hardcore retro gaming purist, nothing less than using the hardware will do. For everyone else, using the same operating system from back in the day to load up your games means that your retro gaming rig becomes just that little bit more of a time machine.

But even with all these similarities, there’s still going to be a few things that change in 30 years of computing.

The most visible difference is that our Raspberry Pi doesn’t come with an internal 3.5″ floppy disk drive. You might be able to hook up a USB one, but most of us don’t have this lying around and don’t really want one. So we’re going to need a different way to boot floppy images.

The more major difference is how much RAM the operating system is written to handle. The earliest versions of Risc OS made efficient use of the ARM’s 32-bit register by using 26 bits for the memory address and the remaining 6 bits for status flags. A 26-bit scheme gives you enough addressing space for up to 64 megabytes of RAM.

When this was first devised, the fact that an Archimedes came with a whole megabyte of RAM was considered incredibly luxurious by the standards of the day. By contrast, the first Commodore Amiga had 256kb of RAM. The Sega Mega Drive had 72kb.

But as time wore on, and later versions of Risc OS moved to a 32-bit addressing scheme. This is what we have on our Raspberry Pi. A few games have been [recompiled to run on 32 bit addressing][7], but most have not.

The Archimedes also used different display drivers for different screens. These days, our GPU can handle all of this for us. We just need to install a patch to get that working.

There are free utilities you can download to handle all of these things.

#### Hardware Requirements

I’ve tested this to work with a Raspberry Pi Model 3 B, but I expect that any Pi from the Model A onwards should manage this. The ARM processor on the slowest Pi is a great many times more powerful than the on the fastest Archimedes.

The lack of ports on a Raspberry Pi Zero means it’s probably not the most convenient choice, but if you can navigate around this, then it should be powerful enough.

In addition to the board, you’ll need something to put it in, a micro SD card, a USB SD card adapter, a power supply, a screen with an HDMI input, a USB keyboard and a 3 button mouse – a clickable scroll wheel works fine for your middle button.

If you already have a Raspberry Pi home theatre or retro gaming rig, then you’ve already got all this, so all you really need is a new micro SD card to swap in for Risc OS.

#### Installing Risc OS Open

When I first wrote this guide, Risc OS wasn’t an available option for the Raspberry Pi 3 on the NOOBS and PINN installers. That meant you had to download the image from the [Risc OS Open downloads page][8] and burn it to a new micro SD card.

You can still do this if you like, and if you can’t connect your Raspberry Pi to the internet via Wi-Fi or Ethernet then that’s still your best option. If you’re not sure how to write an image to an SD card, here’s some good guides for [Windows][9] and for [Mac][10].

For everyone else, now that Risc OS is available in the [NOOBS installer][11] again, I recommend using that. What’s really cool about NOOBS is that it makes it super simple to dual boot with something like [Retropie][12] or [Recalbox][13] for the ultimate all-in-one retro gaming device.

Risc OS is as an extremely good option for a dual boot machine because it only uses a few gigabytes – a small fraction of even the smallest SD cards around these days. This leaves most of it available for other operating systems and saves you having to swap cards, which can be a right pain if you have to unscrew the case. The games themselves vary from about 300kb to about 5 megabytes at the very largest, so don’t worry about that.

This image requires a card with at least 2 gigabytes, which for what we’re doing is plenty. Don’t worry about tracking down the largest SD card you can find. The operating system is extremely lightweight and the games themselves vary from about 300kb to about 5 megabytes at the very largest. Even a very small card offers enough space for hundreds of games – more than you will ever play.

If you’re unsure how to use the NOOBS installer, please [click here for instructions][14].

#### Navigating Risc OS

Compared to your first Linux experience, using Risc OS for the first time is, in my opinion, far more gentle. This is in large part thanks to a graphical interface that’s both fairly intuitive and actually very useful for configuring things.

The command line is there if you want it, but we won’t need it just to play some games. You can kind of tell that this was first built with a mass-market audience in mind.

So let’s jump right in.

Insert your card into your Pi, hook it up to your screen, keyboard, mouse and power supply. It shouldn’t take all that long before you’re at the desktop.

###### The Risc OS Mouse

Risc OS uses a three button mouse.

You use the left button – or “Select” button – in much the same way as you’re already used to: one click to select icons and a double click to open folders and execute programs.

The middle button – ie, your scroll wheel – is used to open menus in much the same way as the right mouse button is used in Windows. We’ll be using this a lot.

The right button – or “Adjust” button – has behaviours that vary between applications.

###### Browsing Directories

Ok, so let’s start taking a look around. At the bottom of the screen you’ll see an icon bar. In the bottom left are icons for storage devices.

Click once with the left mouse button on the SD card and a window will open to show you what’s on it. You can take a look inside the directories by double clicking.

###### The Pling

As you start to browse Risc OS, you’ll notice that a lot of what you see inside the directories has exclamation marks at the beginning. This is said out aloud as a “pling”, and it’s used to mark an application that you can execute.

One of the quirks of Risc OS is that these executables aren’t really files – they’re directories. If you hold shift while double clicking, you can open them and start looking inside, same as any other directory – but be careful with this, it’s a good way to break stuff.

Risc OS comes with some applications installed – including a web browser called !NetSurf. We’ll be using that soon to download our games and some small utilities we need to get them running.

###### Creating Directories

Risc OS comes with a basic directory structure, but you’ll probably want to create some new ones to put your floppy images and .zip files.

To do this, click with the middle button inside the folder where you want to place your new directory. This will open up a menu. Move your mouse over the arrow next to “New Directory” and a prompt will open where you can name it and press OK.

###### Copying Files and Directories

To copy a file or directory somewhere else, just drag and drop it with the left mouse button to the new location.

###### Forcing Applications to Quit

Sometimes, if you haven’t configured something right, if you’ve downloaded something that just doesn’t work, or if you plain forgot to look up the controls in the manual, you might find yourself stuck inside an application that has a blank screen or isn’t responding.

Here, you can press Ctrl-Shift-F12 to quit back to the desktop.

###### Shutting Down and Rebooting

If you want to power down or reboot your Pi, just click the middle button on the raspberry icon in the bottom right corner and select “Shutdown”. This will give you an option to reboot the Pi or you can just remove the power cable.

#### Connecting to the Internet

Okay, so I’ve got good news and bad news. I’ll get the bad news right out of the way first:

Risc OS Open doesn’t yet support wireless networking through either the onboard wireless or a wireless dongle in the USB port. It’s on the [to-do list][15].

In the meantime, if you can a way to connect to the internet through the Ethernet port, it makes the rest of this project a lot easier. If you were going to use an Ethernet cable anyway, this will be no big deal. And if you have a wireless bridge handy, you can just use that.

If you don’t have a wireless bridge, but do have a second Raspberry Pi board lying around (hey, who doesn’t these days :p), you can [set it up as a wireless bridge][16]. This is what I did and it’s actually pretty easy if you just follow the steps.

Another option might be to set up a temporary tinkering area next to your router so that you can plug straight in to get everything in configured.

Ok, so what’s the good news?

It’s this: once you’ve got the internet in your front hole, the rest is rather easy. In fact, the only bit that’s not done for your is configuring name servers.

So let’s get to it.

Double-click on !Configure, click once on Network, click on Internet and then on Host Names. Then enter the IPs of your name servers in the name server fields. If you’re not sure what IP to put in here, just use Google’s publicly available name servers – 8.8.8.8 and 8.8.4.4.

When you click Set, it will ask you if you want to reboot. Click yes.

Now double-click on !NetSurf. You’ll see the logo is now added to the bottom right corner. Click on this to open a new browser window.

Compared to Chrome, Firefox, et al, !NetSurf is a primitive web browser. I do not recommend it as a daily driver. But to download Risc OS software directly to the Pi, it’s actually pretty damn convenient.

###### Short Link to This Guide

As you go through the rest of this guide, it’s going to get annoying copying by hand all the URLs you’ll want to visit.

To save you this trouble, type bit.do/riscpi into the browser bar to load this page. With this loaded, you can follow the links.

###### If You’re Still Getting Host Name Error Messages

One little quirk of Risc OS is that it seems to check for name servers as part of the boot process. If it doesn’t find them then, it assumes they’re not there for the rest of the session.

This means that if you connect your Pi to the internet when it’s already booted, you will get an error message when you try to browse the internet with !NetSurf.

To fix this, just double check that your wireless bridge is switched on or that your Pi is plugged into the router, reboot, and the OS should find the name servers.

###### If You Can’t Connect to the Internet

If this is all too hard and you absolutely can’t connect to the internet, there’s always sneakernet – downloading files to another machine and then transferring by USB stick.

This is what I tried at first; It does work, but I found it terribly annoying.

One frustration is that using a Windows 10 machine to download Risc OS software seems to strip out the filetype information – even when you aren’t unzipping the archives. It’s not that difficult to repair this, it’s just tedious when you have to do it all the time.

The other problem is that running USB sticks from computer to computer all the time just got a bit old.

Still, if you have to do it, it’s an option.

#### Unzipping Compressed Files

Most of the files we’ll be downloading will come in .zip format – this is a good thing, because it preserves the file type information. But we’ll need a way to uncompress these files.

For this we’ll use a program called !SparkFS. This is proprietary software, but you can download a read-only version for free. This will let us extract files from .zip archives.

To download and install !SparkFS, click [this link][17] and follow the instructions. You want the version of this software for machines with more than 2MB of RAM.

#### Installing ADFFS and Anymode

Now we need to install ADFFS, a floppy disk imaging program written by Jon Abbot of the [Archimedes Software Preservation Project][18].

This gives us a virtual floppy drive we can use to boot floppy images. It also takes care of the 26 bit memory addressing issues.

To get your copy, browse to the [ADFFS subforum][19] and click the thread for the latest public release – at the time of writing that’s 2.64.

Download the .zip file, open it and then drag and drop !ADFFS to somewhere on your SD card where it’s conveniently accessible – we’ll be using it a lot.

###### Configuring Boot Scripts

For ADFFS to work properly, we’re going to need to add a little boot script.

Follow these instructions carefully – if you do the wrong thing here you can really mess up your OS, or even brick your Pi.

###### Creating !Boot.Loader.CMDLINE/TXT

Remember how I showed you that you could open up applications as directories by holding down shift when you double-click? We can also do this to get inside the Risc OS boot process. We’ll need to do this now to add our boot script.

Start by left clicking once on the SD card icon on the icon bar, then hold down shift and double-click !Boot with your left mouse button. Then double click the folder labeled Loader to open it. This is where we’re going to put our script.

To write our script, click Apps on the icon bar, then double-click !StrongEd. Now click on the fist icon that appeared on the bottom right of the icon bar to open a text editor window, and type:

```
disable_mode_changes
```

Computers are fussy so take a moment to double-check your spelling.

To save this file, click the middle button on the text editor and hover your cursor over the arrow next to Save. Then delete the existing text in the Name field and replace it with:

```
CMDLINE/TXT
```

Now, see that button marked Save? It’s a trap! Instead, drag and drop the pen and paper icon to the Loader folder.

We’re now finished with this folder, so you can close it and also close the text editor.

###### Installing Anymode

Now we need to install the Anymode module. This is to make the screen modes on our software play nice with our GPU and HDMI output.

Download Anymode from [here,][20] copy the .zip file to somewhere temporary and open it.

Now go back to the root directory on your SD card, double-click on !Boot again, then open the folders marked Choices, Boot and Predesk.

Then use your left mouse button to drag and drop the Anymode module from your .zip file to the Predesk folder.

#### Configuring USB Joysticks and Gamepads

Over at the Archimedes Software Preservation Project, there’s a [USB joystick driver][21] in development.

This module is still in alpha testing, and you’ll need to use the command line to configure it, but it’s there if you’d like to give it a try.

If you can’t get this working, don’t worry too much. It was actually pretty normal back in the day for people either to not have a joystick, or not to be able to get it to work. So pretty much every game can be played with keyboard and mouse.

I’ll be updating this section as this project develops.

#### Setting File Types

Risc OS uses an [ADFS][22] filesystem, different to anything used on Windows or Linux.

Instead of using a filename extension, ADFS files have a “file type” associated with them to show what. When these files pass through a different operating system, this information can get stripped from the file.

In theory, if we don’t open our .zip archives until it reaches our Risc OS machine, the file type should be preserved. Usually this works, but sometimes you unzip the archive and find files with no file type attached. You’ll be able to tell when this has happened because you’ll be faced with a green icon labeled “data”.

Fortunately, this is pretty easy to fix.

Just click on the file with your middle button. A menu will appear.

The second item on this menu will include the name of the file and it will have an arrow next to it. Hover your cursor over the arrow and a second menu will appear.

Near the bottom of this menu will be an option marked “Set Type”, and it will also have an arrow next to it. Hover your cursor over this arrow and a field will appear where you can enter the file type.

To set the file type on a floppy image, type:

```
&FCE
```

[Click here for more file type codes.][23]

### Finding, Loading and Playing Games

The best start looking for floppy images is in the [Games subforum][24] at the Archimedes Software Preservation Project.

There’s also a [Risc OS downloads section at Acorn Arcade][25].

There are definitely other websites that host Archimedes games, but I have no idea how legal these copies are.

###### Booting and Switching Floppy Disc Images

Some games might have specific instructions for how to boot the floppy. If so, then follow them.

Generally, though, you drag and drop the image file to, then click on it with the middle button and press “boot floppy”. Your game should start straight away.

Many of the games use more than one floppy disc. To play these, boot disc 1. When you’re asked to switch floppy discs, press control and shift and the function key corresponding to the disc you want to change to.

### Which Games Should You Play?

This is a matter of opinion really and everyone’s taste differs.

Still, if you’re wondering what to try, here are my recommendations.

This is still a work in progress. I’ll be adding more games as I find what I like.

#### Cannon Fodder

<https://www.youtube.com/embed/qgfIAjJ5w8Y?feature=oembed>

This is a top-down action/strategy game that’s extremely playable and wickedly funny.

You control a team of soldiers indirectly by clicking on areas of the screen to tell them where to move and who to kill. Everyone dies with a single shot.

At the start your enemies are all very easy to beat but the game progresses in difficulty. As you go, you’ll need to start dividing your team up into squads to command separately.

I used to play this on the Mega Drive back in the day, but it’s so much more playable with an actual mouse.

[Click here to get Cannon Fodder.][26]

#### Star Fighter 3000

<https://www.youtube.com/embed/omnpVCsDmng?feature=oembed>

This is a 3D space shooter that really laid down the gauntlet for what the Archimedes could do.

You fly around and blast stuff with lasers and missiles. It’s pretty awesome. It’s kind of a forerunner to Terminal Velocity, if you ever played that.

It was later ported to the 3D0, Sega Saturn and Playstation, but they could never render the 3D graphics to the same distance.

[Click here to get Star Fighter 3000.][27]

You want the download marked “Star Fighter 3000 version 3.20”. This one doesn’t use a floppy image, so don’t use ADFFS to run this file. Just double click the program and go.

#### Aggressor

<https://www.youtube.com/embed/kFinTfqs-nU?feature=oembed>

This is a side-scrolling run-and-gun where you have unlimited ammo and a whole lot of aliens and robots to kill. Badass.

#### Bug Hunter

<https://www.youtube.com/embed/TFNF0voQce4?feature=oembed>

This is a really unique puzzle/platform game – you’re a robot with sticky legs who can walk up and down walls and across the ceiling, and your job is to squash bugs by dropping objects lying around.

Which is harder than it sounds, because you can easily get yourself into situations where you dropped something in the wrong place, making it impossible to complete your objective, so your only way out is to initiate your self destruct sequence in futility and shame. Which I guess is kinda rather dark, if you dwell on it.

It’s fun though.

[Click here to get Bug Hunter.][28]

#### Mad Professor Mariarti

<https://www.youtube.com/embed/pQMv-CqktLQ?feature=oembed>

This is a platformer where you’re a mad scientist who shoots spanners and other weapons at bad guys. It has good music and gameplay and an immersive puzzle element as well.

[Click here to get Mad Professor Mariarti.][29]

#### Chuckie Egg

Ok, now we’re getting really retro.

Strictly speaking, this doesn’t really belong in this list, because it’s not even an Archimedes game – it’s an old BBC Micro game that I played the hell out of back in the day that some nice chap has ported to Risc OS.

But there’s a version that runs and it’s awesome so you should play it.

Basically you’re just this guy who goes around stealing eggs. That’s it. That’s all you do.

It’s absolutely amazing.

If you’ve never played it, you really should check it out.

You can [get Chuckie Egg here][30].

This isn’t a floppy image, so you don’t need ADFFS to run it. Just double click on the program and go.

### Over to You

Got any favourite Acorn Archimedes games?

Got any tips for getting them running on the Pi?

Please let me know in the comments section 🙂

--------------------------------------------------------------------------------

via: https://blog.dxmtechsupport.com.au/playing-badass-acorn-archimedes-games-on-a-raspberry-pi/

作者：[James Mawson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.dxmtechsupport.com.au/author/james-mawson/
[b]: https://github.com/lujun9972
[1]: https://blog.dxmtechsupport.com.au/wp-content/uploads/2018/06/cannonfodder-1024x768.jpg
[2]: http://www.computinghistory.org.uk/det/897/Acorn-Computers/
[3]: http://davetrott.co.uk/2017/03/strategy-is-sacrifice/
[4]: http://www.old-computers.com/museum/computer.asp?c=1015
[5]: https://www.theverge.com/2016/8/16/12507568/intel-arm-mobile-chips-licensing-deal-idf-2016
[6]: https://www.riscosopen.org/content/
[7]: https://www.riscosopen.org/wiki/documentation/show/ARMv6%2Fv7%20software%20compatibility%20list#games
[8]: https://www.riscosopen.org/content/downloads/raspberry-pi
[9]: http://www.raspberry-projects.com/pi/pi-operating-systems/win32diskimager
[10]: http://osxdaily.com/2018/01/11/write-img-to-sd-card-mac-etcher/
[11]: https://www.raspberrypi.org/downloads/noobs/
[12]: https://retropie.org.uk/
[13]: https://www.recalbox.com/
[14]: https://www.raspberrypi.org/documentation/installation/noobs.md
[15]: https://www.riscosopen.org/wiki/documentation/show/RISC%20OS%20Roadmap
[16]: https://pimylifeup.com/raspberry-pi-wifi-bridge/
[17]: http://www.riscos.com/ftp_space/generic/sparkfs/index.htm
[18]: https://forums.jaspp.org.uk/forum/index.php
[19]: https://forums.jaspp.org.uk/forum/viewforum.php?f=14&sid=d0f037e95c560144f3910503b776aef5
[20]: http://www.pi-star.co.uk/anymode/
[21]: https://forums.jaspp.org.uk/forum/viewtopic.php?f=8&t=396
[22]: https://en.wikipedia.org/wiki/Advanced_Disc_Filing_System
[23]: https://www.riscosopen.org/wiki/documentation/show/File%20Types
[24]: https://forums.jaspp.org.uk/forum/viewforum.php?f=25
[25]: http://www.acornarcade.com/downloads/
[26]: https://forums.jaspp.org.uk/forum/viewtopic.php?f=25&t=188
[27]: http://starfighter.acornarcade.com/
[28]: https://forums.jaspp.org.uk/forum/viewtopic.php?f=25&t=330
[29]: https://forums.jaspp.org.uk/forum/viewtopic.php?f=25&t=148
[30]: http://homepages.paradise.net.nz/mjfoot/riscos.htm
