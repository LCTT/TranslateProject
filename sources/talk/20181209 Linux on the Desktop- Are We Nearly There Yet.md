[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Linux on the Desktop: Are We Nearly There Yet?)
[#]: via: (https://blog.dxmtechsupport.com.au/linux-on-the-desktop-are-we-nearly-there-yet/)
[#]: author: (James Mawson https://blog.dxmtechsupport.com.au/author/james-mawson/)

Linux on the Desktop: Are We Nearly There Yet?
======

![][1]

The numbers are pretty stark: Linux might be the backbone of everything from embedded devices to mainframes and super computers. But it has just a 2% share of desktops and laptops.

It seems the only way to get most people to even touch it is to rip away everything you recognise as Linux to rebuild it as Android.

Until recently, I was in the 98%. I honestly wasn’t even conflicted. I used Linux most days both for work and for hobbies – but always in the cloud or on one of those handy little project boards that are everywhere now. For my daily driver, it was Windows all the way.

I guess what’s kept me with Windows so long is really that it’s just been good enough as a default option that I haven’t been prompted to even think about it. Which, to be fair, is a great quality in an operating system.

The last time I tried a dual boot Linux/Windows setup was about 15 years ago. I was using Unix at university, and was quite attracted to the idea of free and open source software, so I decided to give it a go.

This was back when, if you wanted to install Linux, you went to the newsagent and bought a magazine that had a CD-ROM on the front cover. I don’t exactly remember what distro it was – probably something like Slackware or Red Hat.

I got it running, poked around a bit and played some of the included games, which were relatively primitive but still quite a lot of fun. After that, I wasn’t sure what I was supposed to do with it. I never managed to connect it to the internet.

For a number of years, I had no say in my operating system: work was buying my computer for me. I was a junior developer at a small software company that wrote for Windows machines, so it made sense that it would be a Windows laptop. That was easy to arrange because that’s how they came anyway.

When I left this role to work for myself, I kept doing the laptop thing; they’re so convenient when you’re renting and it’s great to work outside on a lovely day. Whenever I bought a new one, it would come with Windows on it, which was great because that’s what I used.

I’ve managed to avoid most of the security headaches in Windows. I got a nasty rootkit about 7 years ago and it’s all been smooth sailing since.

### I Only Want the Command Line When I Want it

A big misgiving about Linux as a main OS is that it never really seemed like it was a total GUI operating system. Whatever desktop environment you used, it was just a nice little place to run your web browser, media player, and maybe an IDE or something. As soon as it’s time to install or configure anything, you opened a terminal window.

I’m okay with the command line – up to a point. You definitely want it for “nerd stuff” like server configuration or deploying a website.

But when I’m doing “normie stuff”, I’m like most people: I’d really rather just point and click. I want my mind to be on the actual task, not on what command I need to make it happen.

Using a Windows laptop felt like I could have the best of both worlds. Whenever I needed a bash shell, I’d just ssh into a Linux machine and do it from there.

Even when I started doing web tasks that required a bash shell on my local machine, that was no problem. Microsoft [had sorted one out for me][2] and it just worked.

In the end, what made me install [Ubuntu Studio][3] was not any intent of replacing Windows. I had just started messing around with Linux synthesizers on my home theatre rig and was curious to see what I could do with these on an x86 machine.

### Linux Very Quickly Became My Daily Driver

The first thing to really hit me was just how fast this is. It boots quick and programs just open. This makes it so much nicer as a place to get things done.

So it made sense to do my web browsing and word processing here as well. Booting back into the Windows partition for that would just be a drag.

I guess, up until this point, I’ve just taken it for granted as an immutable fact of life that laptops gradually slow down as they age and every few years it will be time for a new one. Every time Microsoft pushes out an update, it gets a little slower.

So it was that my cheap 4GB machine from 2015 felt like it was nearing the end. In my head, I was already pondering firewood and a longboat.

I suppose when you have a monopoly operating system, nudging your customers toward buying that new machine a little bit earlier might even help move a few more licenses.

I accepted that for a long time. I now thoroughly resent it.

I mean, given what I’m doing – web browsing, word processing, editing text files, opening ssh terminals, some very light image editing – I honestly reckon a 3 year old machine should be able to keep up. These are all tasks you could do in the 90s. It’s not like I’m playing the latest Battlefield while rendering the next Star Wars.

With Windows 10, my laptop was struggling with simple tasks. There seemed to be no way of avoiding the expense and hassle of getting a new one. After switching to Linux, I instead spent a pittance on another 4GB memory module for the spare slot.

I reckon I can at least get another year of use out of this machine now. This in itself has made changing worthwhile.

#### A Seamless Desktop Experience

Ubuntu studio comes with the [xfce][4] desktop. The default design is intuitive and beautifully styled with kind of a cyberpunk motif. I haven’t felt any desire to mess with the default theme, except to change the background image.

I love how simple the interface is. All your programs and settings are there in the menu where you might look for them. By comparison, the Windows 10 desktop seems to always grow more elaborate and crammed with obscurities.

I can’t really say how much of my enthusiasm for this desktop is the ease of use and how much is simply down to how much more snappy and responsive it is – you experience these things together.

#### A GUI You Can Set Your Watch to (Literally)

So far, it seems like you could actually do a lot with this without ever going near the command line. They’ve actually gotten it to a point where you don’t need to edit text files to connect to wi-fi or set your timezone.

I’d be lying if I said I wasn’t using the command line a bit more. But that’s only because an Ubuntu terminal window is also a great ssh client. For a couple of weeks I was using nano as my main text editor, but I decided that a mouse is actually pretty handy for navigating and selecting text.

For the great mass of people who aren’t that into nerd stuff, I don’t think you would need the terminal at all.

#### The Same Software, Only Better

One thing that I think will help open Linux up to a much larger audience is the graphical front end for the package manager. It’s honestly not much different to browsing apps on my Android phone.

I’ve found myself using both the graphical interface and the command line to install software. The graphical interface is great for browsing, while the command line makes it super simple when you already know what you want to install.

That’s just me though. Most people don’t know how to run a package manager from the command line because they’ve never had to learn. The good news for them is that they’re not obliged to – you can get by fine with just the graphical interface.

I guess it helps that I was already using so much open source software on Windows: [Firefox][5] for web browsing, [GIMP][6] to format images for web use, [OpenOffice][7] for word processing and the occasional spreadsheet. Moving to Linux has meant still using much the same software. I’ve switched from OpenOffice to [LibreOffice][8] and have barely noticed the difference.

Installing software from the repositories means that it’s actually easier than on Windows, because I’m not having to look up a bunch of websites. Closed source applications like [Dropbox][9] and [Slack][10] were no hassle to install and work the same as always.

Thanks to the package manager, updates and patches are now automated too. On Windows, Firefox knew to update itself, but other software expected you to download and install new versions manually, and I inevitably couldn’t be bothered

#### Smooth Operating System Updates

Every so often, when you boot Ubuntu Studio, there’s a little window that politely tells you that you have some updates to install. If you decide you want to install them right now, it will take a matter of minutes. You totally get on with other things in the meantime. Of course, if you absolutely need all your system resources, you’re not forced to run it at all until you’re ready.

It’s a nice change. Windows updates, by contrast, show up out of nowhere like a bank robber, yelling, waving an Uzi and marching you to a big blue update screen for as long as it has to take.

Having not booted into my Windows partition for about a month now, I’m dreading how much of it would have piled up and how long they will take to get through. And the longer I leave it, the worse it’s going to get. So maybe I’ll just never go back.

All in all, I’m very happy to now use Linux as my main OS. I could almost become a Linux evangelist.

Except for one thing:

### This Was an Absolute Pig to Install

I’m used to an easy install with Linux. You flash an SD card or buy a VPS, you’re up and running in minutes. Running a virtual machine on your own metal can take a little longer. But not a lot.

Installing Linux on a partition of my laptop was a Biblical effort. It took 6 days to get it to boot.

How could it take so long? Well, it starts with super slow download links: 7 to 13 hours for an image. Then there was the hardware support. Most time consuming of all were the mystery problems and all the time sunk trying to diagnose and fix them.

What had got me interested was playing around with a bit of audio. [KXStudio][11] and [AVLinux][12] seemed to be the popular choices. Both belong to the Ubuntu/Debian family, which is the style of Linux I know.

KXStudio booted fine from the USB stick. But it didn’t like my wireless adapter. The fix for this seemed to involve compiling something from github. This was a bother; I needed a working wireless adapter to connect to the internet.

I figured it might be possible to download either a binary or the source to my Windows partition so I could install it without an internet connection. But after much searching and no clear instructions, I was stuck.

So I downloaded AVLinux and flashed it to a USB stick. The installer connected to the internet fine, so I installed the damn thing, only to find that the partition wouldn’t boot and then neither would the USB stick. Also, I was locked out of the UEFI.

I did the only logical thing you can do when you brick your work machine: panic. Then I remembered that I had a live boot restoration utility on a USB stick stashed away somewhere for precisely this occasion.

I then tried Ubuntu Studio 18.10. The Live Boot worked fine and even connected to the internet. So I installed it. This seemed to go off without a hitch.

When I tried to boot into it though, I just got a blank screen. I spent a while trying various kernel parameters like “nomodeset”, but with no luck.

A helpful chap on Reddit recommended I try just bog standard Ubuntu, explaining to me that it’s easy enough to swap in a low-latency kernel once it’s installed.

So it was that I tried Ubuntu 18.04 and 18.10, then Ubuntu Studio 18.04.. then again and again, trying slightly different settings on the installer, all in vain.

Having made so many attempts and spent so much time trying to get these things to work, I was – reluctantly – having to face the possibility that perhaps a distribution based on Debian just wasn’t going to work on my machine.

#### Fedora Jam Worked First Time

I had no trouble installing this distribution. The installer was super simple and it just worked on my first try.

It didn’t boot much faster than Windows 10, but once you were in the desktop it was quite snappy and responsive.

Like Ubuntu Studio, this also has a graphical front end for the package manager. It doesn’t quite have the same smooth “app store” experience though. If you’re already familiar with command line package managers, it’s pretty easy, but I’m not sure how intuitive it would be for everyone else.

I quickly came to discover that Fedora doesn’t have anything like the kind of software library that Ubuntu and Debian has. Or at least, that’s how it was for the software I was interested. I know that it’s often still possible to install things that aren’t in the repositories – but we’re talking ease of use here. Having to compile it yourself is not an ease of use.

For web browsing and word processing, this was a great operating system. But when it came to tinkering with audio, I couldn’t even get [JACK][13] to start.

So, after a few days, it was time to move on.

All in all, even though I decided Fedora wasn’t really from me, I still rate it somewhat. There’s a very good workstation there for ordinary office work. And I can well believe the claims that it’s a great development environment – especially having the entire Red Hat ecosystem downstream of your OS.

Still, the hunt was back on. A friend told me how much he liked using [Linux Mint][14]. I’d heard of it before, but knew little about it. I was intrigued when my friend explained it was based on Ubuntu because I’d really missed those repositories. I decided to give it a go.

#### Linux Mint Was Excellent

As near as I can tell, Linux Mint is basically just Ubuntu with a few tweaks to make it really user friendly right out of the box.

The big one is the desktop environment Cinnamon. This is clearly very influenced by Windows XP – a fine OS to pay tribute to in my opinion. It’s probably even more beginner-friendly than the default desktop on Ubuntu Studio.

I liked Linux Mint and decided to install it. The fly in the ointment though was that the dreaded wireless adapter problem had reemerged. This was a showstopper for me earlier. But by this point I was willing to consider building a temporary wireless bridge from bits and pieces I had lying around so that I could have an internet connection to try to get the right driver.

I never got that far though. When I tried to, the installer kept aborting when it couldn’t install the boot loader. I tried it again and again and the same thing kept happening.

#### Back to Ubuntu Studio

I decided to go back to Ubuntu Studio 18.10. I’d at least gotten this to install before, even if it booted to a blank screen. I figured that there’d be some answer to this problem somewhere, if I only looked hard enough.

I went and installed it again, expecting to be faced with the same problem. But this time it just worked.

I’m pretty glad that it worked in the end. But I still have absolutely no idea what was going wrong or what I did differently to get it to work that one last time.

### Should it Really Be This Difficult Even for Nerds?

I admit it’s the other dudes in [DXM Tech Support team][15] who really know drivers and hardware. My own skills are mostly with web stuff.

But still, I’d like to think I can hold my own a bit. I wrote my first code at the age of 7, I’ve worked as a software developer before, I can use a bash shell a bit, and installing weird operating systems to play 30 year old video games is my idea of a fun Sunday afternoon.

And I reckon the things I was juggling a few things here that might be a bit beyond any kind of mass audience: things like kernel parameters, endlessly using Gparted and efibootmgr to clean up failed installs, or building my own wireless bridge.

Which is all just a longer way of saying that, while I’m not exactly Linus Torvalds, I can do a thing or two here and there with a computer.

But what if you actually are Linus Torvalds?

It turns out you also think the install is disgusting:

<https://www.youtube.com/embed/Lqzz3Zt0DbE?feature=oembed>

My favourite bit here is in the middle where the Debian fan approaches the microphone for what’s meant to be a question. It was totally within her power to just ask him what the difficulty was. Instead she completely dismisses his experience and tells him he should use her favourite Linux instead.

I doubt that she actually meant to be that much of a dick. It’d be more that she’s such a fan of the software that it’s difficult for her to see any complaint as a genuine area for improvement. For her, it has to be a user education problem.

You can literally have the whole damn thing named after you and still have to put up with that crap. No wonder he can be a bit cranky.

### It’s the Little Things Too

To install Linux, you have to first run all sorts of errands to prepare your machine.

You need the Windows 10 Disk Management tool to resize your C partition, delve into the UEFI to change some settings, install an image writer to burn the installer image to a USB stick, that sort of thing. Often you’re presented with multiple alternatives for each of these steps.

My suspicion is that each of these things feels so trivial to most Linux users that it just doesn’t occur to them that it’s a real point of friction for most people.

Using a different tool for each task is very much in keeping with the [UNIX Philosophy][16]: any one thing should do just one thing and do it well.

That’s actually excellent for anyone who uses a computer to build things. You have all these lego bricks that you can arrange however makes sense. You can totally just run a Python script, grep the most relevant bits, then make the output presentable by piping it to [cowsay][17].

But not everyone’s ready for cowsay. Joe Average has never even heard of UEFI or partitioning and he honestly shouldn’t have to.

So this might be the wrong place for a rigid application of the UNIX philosophy. It greatly adds to the number of steps and that’s always going to cut down on the number of people who make it to the end.

Even if you’ve always been amazing at computers, I think you can probably think of something else that once seemed too difficult. For me, that was cooking Indian recipes.

That’s been my favourite thing to eat ever since I was a kid. But every time I looked at a recipe, it was just line after line of ingredients I didn’t really understand. So I made do with the jars and recipe kits.

When I finally decided to actually give it a go, I realised the ingredients list was so long because of all the spices I’d never cooked with before. It turned out that the most difficult part of using them was bringing them home from the Indian grocers. Putting them in the pan added mere seconds to the actual cooking.

Pretty easy, right? And yet, until I knew that, it was enough to stop me even trying, literally for years.

That’s how this stuff works. Every unfamiliar step you add to a process brings people closer to thinking “hmm, that’s actually a bit too involved for me” – even if those extra steps are, individually, trivial.

Linux does this to potential new users every day.

The worst thing about adding this to the installation is that it’s all front loaded right at the start of someone’s decision to try Linux. If they don’t make it through the install, then none of the rest of it comes into play.

### What the Install Should Look Like

A big part of what sucks about an unsuccessful Linux install is the amount of time you spend and the number steps you take to reach a point of failure.

So what would be cool is a lightweight installation tool that began with a hardware scan to give you meaningful feedback on what’s supported, what’s unsupported, and what needs further attention.

Then, if it’s all good to go, it could download the live boot image, burn it to a USB stick, take care of the UEFI settings and so on. Then, when you decide you want to install it, it could also take care of defragmenting and resizing the C partition.

It’s a thought anyway.

### It’s Part of a Bigger Picture

Addressing the install nightmare won’t make anyone who wasn’t. It’s more about boosting the [conversion rate][18] of those already interested to actual users.

Off the top of my head, here are some of the other big things that stop people switching:

  * **Gaming:** A lot of the people who are most comfortable tinkering with drivers and the UEFI became that way because they’re really into playing the latest games.

Linux is more than ok for casual gamers. For console gamers, like me, it’s an irrelevance. But if playing the best and latest games on PC is hugely important to you, there’s no contest which platform has the best library.

There is an interesting push by the guys behind Steam to turn this around. There’s really no reason why Linux couldn’t be a major platform for gaming – not everyone realises that [the world’s best-selling console runs FreeBSD][19], a close cousin of Linux.

But even if this starts to take off, it will be a while before hardcore gamers start moving away from Windows.

  * **Business Realities:** The difficult installation matters much less in a professionally managed IT environment. But these are also the places where a need to preserve existing systems, configurations and procedures can complicate any change. Even just migrating from one version of Windows to another has pain points.

On top of this, the business owners and senior managers with the final say tend to be very busy and preoccupied with a dozen other challenges, and fairly reluctant to consider anything that seems weird and unfamiliar. This makes inertia hard to shift.

The IT staff who might lobby for such a move would be understandably wary of blame for any difficulties that arise with Linux, in a way they won’t be for difficulties with Windows.

  * **Home Networking:** This is one spot where Windows still is much more user friendly. Your Windows machines are generally pretty good at detecting each other on the LAN and then appearing in Windows Explorer. From there it’s pretty easy to decide what to make public using a GUI interface.

To do the same thing on Linux, you’re installing servers for various protocols and configuring them from the command line or in a text editor. Which is actually a lot less difficult than it first looks if you’re willing to roll your sleeves up. But, if we’re talking about going mainstream, then realistically most people will be repelled by this at a glance.

Compared to the difficulty of the install, I think this is a relatively minor pain point. For the average home user, so long as they can run their software and connect to the internet, they’re pretty happy. And from what I’ve both seen and heard of DIY Windows networking jobs in the workplace, part of me thinks it’s a bad idea to democratise this too far.

But it’s fairly normal for home users to want to copy things across a network to, say, a home theatre machine and they should be able to.

  * **Social Proof and Branding:** Properly covering all the social proof and branding problems Linux has with ordinary people would be a lengthy article in its own right.

The basic idea of [social proof][20] is that humans, as social animals, are highly influenced by what everyone. That’s a highly rational instinct in a paleolithic environment, where there is an obvious drawback to A/B testing all the things that might kill you. It also suits us in our modern world that throws vastly more decisions at us than anyone has the time or mental resources.

But being on the wrong side of it means you’re significantly penalised simply for not already being popular.

On top of this, to the extent that people are aware of Linux, it’s mostly as an operating system for a technical elite.




If you think about it, the difficulty of the install feeds back into most of these. Definitely, a larger user base would make games developers care more about the platform. Hypothetically, big titles that are properly optimised for a lighter weight operating system might run better. This is a huge drawcard for hardcore gamers.

Because of the legacy system issues of even fairly small businesses, one easier path into the workplace would be to get the business owner while it’s still a one person show.

A large number of new businesses are started by parents of young children, who are often struggling to afford everything. And a great many freelancers and solo entrepreneurs go through feast and famine periods often enough that they’ve learned to be protective of their cash buffers.

These are all people who’d rather get a couple more years out of a machine than be made to buy a new one. It’s a good use case for Linux. So long as they can actually install it.

And creating social proof means building a visibly larger use base. That will happen easier if more interested new users can install successfully.

### Is it Time for a Branded Linux Machine?

The easiest installation is one that’s already done. So perhaps it’s time for off-the-shelf Linux desktops and laptops.

These exist already of course. Big PC makers like Dell have a Linux lineup, while some boutique outfits are exclusively Linux in their product offering.

I’m picturing something kinda different though: an officially branded consumer product by one of the more user friendly distributions, pitched not tech professionals but to a mass market audience. Something that could be reviewed next to Apple and Samsung products.

The desktop environment is ready for a broader audience. The software library is quite excellent for anyone with ordinary computing needs – and with a good graphical front end, it’s pretty easy to find and install software. And because Linux is so much gentler on hardware requirements, there’s some real scope to offer some solid bang for back here.

I expect most open source developers have had no experience of and even less interest in. So what they could do is license the brand and a subdomain on their website for a given time period to someone already in the business of making and selling computers.

For the sake of the brand, it’d be important to license this to someone you could trust to do a good job of building a decent machine. That would take care and attention, but I don’t think it’s impossible.

As well as providing a small income stream to developers, and growing the user base through direct sales, the ordinary publicity effort to promote these products would help make Linux visible as a thing that the mass market could use.

I’m just spitballin’ really. But if anyone likes this idea, they’re welcome to it.

### It’s More a Matter of When than If

Maybe it seems like I spent a lot of this article talking down Linux on the desktop. The wider truth though is that I’ve voted with my feet. If I don’t stick with Ubuntu Studio forever, it will be because I went to a different flavour of Linux.

I really don’t want to go back to Windows if I can avoid it.

There are certainly still big obstacles to bringing Linux to a wider audience. But I can’t see why they wouldn’t be overcome.

--------------------------------------------------------------------------------

via: https://blog.dxmtechsupport.com.au/linux-on-the-desktop-are-we-nearly-there-yet/

作者：[James Mawson][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.dxmtechsupport.com.au/author/james-mawson/
[b]: https://github.com/lujun9972
[1]: https://blog.dxmtechsupport.com.au/wp-content/uploads/2018/11/Ubuntu-Desktop-1024x576.png
[2]: https://docs.microsoft.com/en-us/windows/wsl/about
[3]: https://ubuntustudio.org/
[4]: https://www.xfce.org/
[5]: https://www.mozilla.org/en-US/firefox/
[6]: https://www.gimp.org/
[7]: https://www.openoffice.org/
[8]: https://www.libreoffice.org/
[9]: https://www.dropbox.com/
[10]: https://slack.com/
[11]: https://kxstudio.linuxaudio.org/
[12]: http://www.bandshed.net/avlinux/
[13]: http://jackaudio.org/
[14]: https://linuxmint.com/
[15]: https://dxmtechsupport.com.au/about
[16]: https://homepage.cs.uri.edu/~thenry/resources/unix_art/ch01s06.html
[17]: https://medium.com/@jasonrigden/cowsay-is-the-most-important-unix-like-command-ever-35abdbc22b7f
[18]: https://www.wordstream.com/conversion-rate
[19]: http://www.extremetech.com/gaming/159476-ps4-runs-orbis-os-a-modified-version-of-freebsd-thats-similar-to-linux
[20]: https://conversionxl.com/blog/is-social-proof-really-that-important/
