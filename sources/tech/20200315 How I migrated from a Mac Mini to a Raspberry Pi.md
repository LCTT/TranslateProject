[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How I migrated from a Mac Mini to a Raspberry Pi)
[#]: via: (https://opensource.com/article/20/3/mac-raspberry-pi)
[#]: author: (Peter Garner https://opensource.com/users/petergarner)

How I migrated from a Mac Mini to a Raspberry Pi
======
Learn more about Linux by turning a Raspberry Pi Model 2 into a workable
desktop computer.
![Vector, generic Raspberry Pi board][1]

Some time ago, I decided to move my computing environment from a Mac Mini PowerPC to a Raspberry Pi Model 2. This article describes my reasons for doing so and how I did it. While it is quite technical in places, if you're considering switching from an existing system to something decidedly lean and mean, there are things that you need to know before making that leap. There are lots of links to click as well, which will lead you to the software and apps that I mention.

Enjoy!

## Saying goodbye to the Mac

I have to admit, I've never really been an Apple fanboi, especially following a short (and ultimately unsatisfactory) fling with a plastic polycarbonate MacBook back in 2006. Although it was beautifully designed, and the software "Just Worked," I was understandably upset when it decided to expire shortly after the warranty period expired (design faults, apparently). Ah well.

I swore never to "invest" in an Apple machine again—until I discovered a used Mac Mini PowerPC on eBay that could be had for around $100 in 2012. It was new back in 2005 but had apparently been refurbished. "What have I got to lose, especially at that price?" I asked myself. Nobody answered, so I placed a last-minute bid, won it, and invested about the same sum of money again in bumping the memory up to 1GB and buying the OS on DVD. The OS X version was 10.4.7 Tiger, and the architecture was Power PC. It was sedate but reliable, and I was happy. It didn't take a lot of power either; some 60 watts at full load, so that was a bonus. I spent many happy hours tinkering with it and trying to find software that was supported on a device that old.

Predictably though, as my computing requirements grew and the Mac got older, it started to get noticeably slower, and I was aware that even simple tasks—such as asking it to run a web browser and display an HTTPS page—were causing it problems. When I finally managed to find antivirus software for it, I became aware of just how noisy the Mini's cooling fan was as the CPU struggled with the extra load.

A quick check of the performance monitors revealed thousands of memory-paging faults, and I realized that my old friend was soon destined for the knackers yard. Of course, that meant searching for a replacement, and that's when the fun started.

## A(nother) small computer

My main problem was that I didn't have a big budget. I looked at eBay again and found a number of Mac Minis for sale, all around the $500 mark, and many of those were early basic-spec Intel units that, like my old Mac, people had simply grown out of. Essentially, I wanted something like the old Mini, ideally with similar power consumption. A new one was out of the question, obviously.

Let me state that my computer requirements are pretty undemanding, and for photo/graphics work, I have another computer that consumes power like there's no tomorrow and gives off enough heat to keep me warm in winter. And then I got to thinking about the [Raspberry Pi Model 2][2]. Now before you laugh, I have around six of the things running various servers, and they do just fine. One runs a small web server, another runs a mail server, and so on. Each one costs around $30, and most use a cheap microSDHC card, so if one fails, I can easily swap it out for another, and I can usually buy a suitable card at a local supermarket—try doing that when your laptop drive fails! I also have a Netgear ReadyNAS 102 with a couple of 2TB hard drives to act as my bulk storage.

Suddenly, my plan looked as though it might be viable after all!

## Spec'ing it out

The specification was a bit of a no-brainer: The Model 2 Pi comes with 1GB of memory standard, the Ethernet runs at 100Mbps maximum, the clock speed is 900MHz, there are four USB ports, and that's yer lot, mate. You can overclock it, but I've never wanted to try this for various reasons.

I had a Pi in my spares drawer, so no problem there. I ordered a posh aluminum case made by [Flirc][3] that was on offer for $20 and duly slotted in the Pi. The power supply unit (PSU) had to be a genuine two-amp device, and again, I had a spare lying around. If you take your Pi ownership seriously, I recommend the [Anker 40W][4] five-port desktop charger: it has intelligent power management, and I'm running five Pis from one unit. Incidentally, if you inadvertently use a PSU that can't deliver the required current, you'll keep seeing a square, multi-colored icon in the top-right corner of your screen, so be warned.

The microSDHC "disk" was more of an issue, though. I always use SanDisk, and this time I wanted something fast, especially as this was to be a "desktop" machine. In the end, I went for a [SanDisk 8GB Extreme Pro UHS-1][5] card that promised up to 90 to 95 Mbps write/read performance. "8GB? That's not a lot of space," I hear you Windows users cry, and because this is Linux, there doesn't need to be.

The way I envisioned it, I'd set up the Pi normally and use it primarily as a boot disk. I'd host all my documents and media files on the network-attached storage (NAS) box, and all would be well. The NAS shares would be accessed via network filesystem (NFS), and I'd just mount them as directories on the Pi.

Quite early on, I elected to move my entire home directory onto the NAS, and this has worked well, with some quirks. The problem I faced was a Pi quirk, and although I was sure there was a fix, I wanted to get it up and running before the Mac finally crapped out. When the Pi boots, it seems to enable the networking part quite late in the sequence, and I found that I couldn't do my NFS mounts because the networking interface hadn't come up yet. Rather than hack around with tricky scripts, I decided to simply mount the NFS shares by hand after I'd logged in after a successful boot. This seemed to work, and it's the solution I'm using now. Now that I had a basic strategy, it was time to implement it on the "live" machine.

That's the beauty of working with the Raspberry Pi—you can quickly hack together a testbed and have a system up and running in under 30 minutes.

Regarding video, I bought an HDMI-to-DVI cable to use with my Dell monitor, and in GUI desktop mode, this comes up as 1280x1024—plenty good enough for my use. If you have a monster flat-screen TV, you can always use that instead.

## My software environment

### Operating system

I ultimately decided on [Arch Linux for ARM][6] 7H as the operating system. I'm a [Raspbian][7] veteran, but I didn't need the educational software that comes with it (I have other Pis for that). Arch provides a minimal environment but is full-featured, well-supported, and powerful; it also has bucket-loads of software available. After its initial installation, I'd used just over 1.2GB of space, and even now, with all my software on the microSDHC, I'm only using 2.8GB of my 8GB card. Please note that the Pi 2 is officially Arch Linux ARM 7, not 6.

### Desktop

I wanted a graphical desktop environment (even though I'm a command-line sorta guy), but it needed to be in keeping with the lean and mean ethos. I'd used [LXDE][8] before and was happy with it, so I installed it; GNOME and KDE were just too big.

### Web browser

The web browser was a bit of a problem, but after trying the default Midori, Epiphany, and a couple of others, I decided on [Firefox][9]. It's a bit flabby, but it follows standards well, and if you're going to digitally sign LibreOffice ODT documents, you'll need it anyway. One problem on a machine of this power is the tremendous toll that web-based ads place on the overall memory usage. In fact, a badly ad'ed page can make the browser stop completely, so I had to make those ads disappear. One way would be to install an ad-blocker plugin, but that's another hit on available memory, so a simpler method was called for.

As this is a Linux box, I simply downloaded an [ad-blocking hosts file][10]. This is an amazing piece of community work that consists of over 15,000 hostnames for basically any server that spits out ads. All the entries point to an IP address of 0.0.0.0, so there's no time wasted and your bandwidth's your own again. It's a free download and can be added to the end of an existing hosts file. Of course, the major value, as far as I'm concerned, is that page load times are much quicker.

The screen capture below shows an ad-free Firefox overlaid with the same page in [ELinks][11].

![Firefox and eLinks browsers on Raspberry Pi][12]

No ads in either, but if you don't need all the eye candy rendered by Firefox, ELinks will provide a super-clean experience. (Normally, all that whitespace in the Firefox image is filled with ads.) The ELinks browser is an interesting hybrid browser that is primarily text-based and is similar to the classic pure-text Lynx browser.

### Messaging

It would be overkill, and undesirable from a security point of view, to have Microsoft Skype on the Pi, so I decided on a Jabber/XMPP client, [Psi][13]. Psi has the advantage of not having a multitude of dependencies, and it also works really well. It's easy to take part in multi-user chats, and I have another Pi hosting a Jabber server to test it on. There's no character-mode version, unfortunately, and most of the text-based clients I tried had problems, so it's a GUI-only situation at the moment. No matter; it works well and doesn't use a lot of resources.

### Email

I also tried a number of email applications: this was easily the most important application. Eventually, I chose [Claws Mail][14]. Sadly, it doesn't do HTML mail, but it's rock-solid reliable. I have to say that I can't get the GNU Privacy Guard (GPG) plugin working properly yet due to some unresolved version issues, but I can always encrypt messages in a terminal, if need be.

### Audio

Music is important to me, and I chose [SMPlayer][15] as my media player. It supports many options, including playlists for local and networked files and internet radio streaming. It does the job well.

### Video

I'll not go into the video player in any great detail. Bearing in mind the hardware specs of the Pi, reliably playing back a video stream, even on the same network, was problematic. I decided that if I wanted to watch videos, I had other devices more suited to it. I did try and experiment with the **gpu_mem** setting in the **[/boot/config.txt][16]**, switching it from the default 64MB to 96MB. I was prepared to borrow a bit of application memory for the video player, but even that didn't seem to make it work well. In the end, I kept that setting so that the desktop environment would run more smoothly, and so far, I haven't had problems. The irony of this is that I have another Pi that has a [DLNA][17] server installed, and this can stream video exceedingly well—not just to one client, but several. In its defense, though, it doesn't have a desktop environment to contend with. So, for now, I don't bother trying to play video.

### Image processing

I need to do simple, lightweight photo and image editing, and I knew from prior experience that GIMP and similar packages would bring the Pi to its knees. I found an app called [Pinta][18], which resembles an enhanced Microsoft Paint, but with more cojones. As someone with a large image collection, I also needed a slideshow application. After much evaluation, I decided on [feh][19]. Normally run from a terminal within the GUI desktop, it has an incredible array of options that can help you produce an image slideshow, and again, it has low memory requirements.

### Office suite

And then there was an office suite. On the old Mac Mini, I was happily (and legally) running a copy of Microsoft Mac Office 2004, and I was truly sorry to lose that. I just needed a Microsoft Word and Excel equivalent, but I had to bear in mind the Pi's limitations. Sure, there are standalone versions of word-processor and spreadsheet applications, but there was nothing that really gave me confidence that I could edit a full-featured document.

I already knew of [LibreOffice][20], but I had my doubts about it because of its Java Runtime Environment (JRE) requirement, or so I thought. Thankfully, JRE was optional, and as long as I didn't want to use (database) connection pooling of macros, there was no need to enable it. I also used as many built-in options as possible, rejecting skins and themes; this brought the overall memory footprint down to a reasonable level, and hey, I'm writing this on LibreOffice Writer now! I adopted the attitude that if it has a built-in theme, use it!

Here's the current [memory overview][21] (in MB) from within the GUI desktop:

![Raspberry Pi GUI memory usage][22]

### Miscellaneous

Other desktop software I've installed (not much as I wanted in order to keep this a minimal installation) is:

  * [FileZilla][23]: SFTP/FTP client
  * [PuTTY][24]: SSH/telnet terminal frontend
  * [Mousepad][25]: A versatile plain-text editor, similar to Wordpad or Notepad, but much more powerful **[Note: this link was broken. Is this ok?]**



Overall, the entire setup works as intended. I've found that it performs well, if a little slow sometimes, but this is to be expected, as it's running on a Raspberry Pi with a 900MHz clock speed and 1GB of memory. As long you're aware of and prepared to accept the limitations, you can have a cheap, very functional system that doesn't take up all your desk space.

## Lacking in characters

Life with a Pi desktop is not all about the GUI; it's a very competent command-line environment too, should you need one. As a Linux developer and geek, I am very comfortable in a character-mode environment, and this is where the Pi really comes into its own. The performance you can expect in the command-line environment, at least in my configuration, is dependent on a number of factors. I'm limited to a certain extent by the Pi's network-interface speed and the overall performance of my Netgear ReadyNAS 102, another slightly underpowered, consumer-grade ARM box. The one thing that did please me, though, was the noticeable increase in speed over the Mac Mini!

Running in a native terminal environment, this is the typical memory usage (in MB) you might expect:

![Raspberry Pi terminal memory usage][26]

One thing to note is the lack of a swap partition. It's generally accepted that any type of swap system on a Raspberry Pi is a Very Bad Thing™ and will wear out your SD card in no time. I considered setting up a swap partition on the NAS box, but I ruled this out early on, as it would very negatively impact the network as a whole, and as with the NFS mount issue, the swap partition would need to be mounted before the network came up. So no go.

Having lived with Raspberry Pis for some time now, let's just say that one has to learn to set things up carefully in the first place to avoid the need, and ultimately, it can teach you to manage computers better.

As part of my efforts to make the Pi as useful as possible, I had to envision a scenario where whatever I was working on was either so resource-hungry that I couldn't run a GUI desktop or the GUI was just not required. That meant reproducing as many of the desktop-only apps in a character-mode environment. In fact, this was easier than finding the equivalent desktop apps.

Here is my current lineup:

  * **File manager:** [Midnight Commander][27]; if you're old enough to remember Norton Commander, you'll know what it looks like.
  * **File transfer:** SSH/SFTP; normally handled by PuTTY and FileZilla on the desktop, you just use these two commands as provided.
  * **Web browser:** Lynx or Links are classic character-mode browsers that significantly speed up the internet experience.
  * **Music player:** Yes, you can play music in a character-mode terminal! [Mpg123][28] is the name of the app, and when it's run as **mpg123 -C**, it allows full keyboard control of all playback functions. If you want to be really cool, you can alter the way Midnight Commander handles MP3 files by editing **/etc/mc/mc.ext** and adding the code snippet below. This allows you to browse and play your music collection with ease. [code] shell/i/.mp3
      Open=/usr/bin/mpg123 -C %f
      View=%view{ascii} /usr/lib/mc/ext.d/sound.sh view mp3 
```
  * **Office:** Don't be silly! Oh wait, though; I installed the character-mode spreadsheet app called **sc** (Supercalc?), and there's always Vi if you want to edit a text document, but don't expect to able to edit any Microsoft files. If your need is truly great, you can install a supplementary application called Antiword, which will let you view a .doc file.
  * **Email:** A bit of a problem, as the Claws Mail mailbox format is not directly compatible with my character-mode app of choice, Mutt. There's a workaround, but I'm only going to do it if I get some spare time. For sending quick emails, I installed ssmtp, which is described as "a send-only sendmail emulator for machines which normally pick their mail up from a centralized mail hub." The setup is minimal, and overhead is practically nil, as normally it's invoked only when mail is being sent. So, you can do things like typing **echo "The donuts are on my desk" | mail -s"Important News" [everybody@myoffice.com][29]** from the command line without firing up a GUI mail app.



For everything else, it's just a question of flipping back to the GUI desktop. Speaking of which…

![Raspberry Pi GUI desktop environment][30]

Quite a busy screen, but the Raspberry Pi handles it well. Here, I'm using LibreOffice to write this article, there's a network status box, Firefox is on the mpg123 website, and there's a terminal running top showing how much memory (isn't) being used. The drop-down menu on the left shows the office suite apps.

## Other scenarios and thoughts

### What's where

With any hybrid system like this, it's important to remember what is located where so that, in the event of any problems, recovery will be easier. In my current configuration, the microSDHC card contains only the operating system, and as much as possible, any system-configuration files are also on there. Your own userland data will be on the NAS in your home directory. Ideally, you should be to replace or update the software on the microSDHC without having any adverse effects on your computing environment as a whole, but in IT, it's never that straightforward.

In the X11 GUI desktop system, although there is a default config file in **/etc/X11**, you will invariably have a customized version containing your own preferences. (This is by design.) Your own file on the NAS, however, will reference files on the microSDHC:

![Location of files][31]

The overall effect is that if you change one environment for another, you will invariably experience a change (or loss) in functionality. Hopefully, the changes will be minor, but you do need to be aware of the sometimes ambiguous links.

Please remember that the **root** user will _always_ be on the microSDHC, and if your NAS box fails for any reason, you'll still be able to boot your system and at least do some recovery work.

### NAS alternatives

While I'm in my home office, I have full access to my NAS box, which represents what (in today's terminology) would be a personal cloud. I much prefer this solution to a commercial cloud that is invariably managed by a company of unknown origin, location, security, and motives. For those reasons, I will always host my data where I can see it and physically get to it as required. Having said that, you may not be as paranoid as I am and will want to hook up your Pi desktop to an external cloud share.

In that case, using an NFS mount as a basis for your home directory should mean that it's simply a matter of editing your **/etc/fstab** to point the NFS client at a different location. In my setup, the NAS box is called, er, NASBOX, and the local NFS share mountpoint is called **/NASmount**. When you create your non-root user, you'll simply move their home directory to an existing directory called **/NASmount**:
```


NASBOX:/data/yourshare /NASmount nfs
nfsvers=3,rsize=8192,wsize=8192,timeo=60,intr,auto 0 0

mount -t nfs -v NASBOX:/data/yourshare /NASmount

```
and then your directory tree could look like this:
```
`/NASmount/home/user`
```
So, by simply changing the **/etc/fstab** entry, you could quickly be hooked up to someone else's cloud. This, as they say, is left as an exercise for the re