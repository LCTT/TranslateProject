[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to set up the Raspberry Pi Zero for travel)
[#]: via: (https://opensource.com/article/20/3/raspberry-pi-zero)
[#]: author: (Peter Garner https://opensource.com/users/petergarner)

How to set up the Raspberry Pi Zero for travel
======
You don't have to invest large amounts of money to build a relatively
powerful system that can be taken on the road and used productively.
![Airplane flying with a globe background][1]

For some time now, I've been a huge fan of the [Raspberry Pi][2] computer in all of its various forms. I have a number of them, and each has a server role to play. Most of the time, they work extremely well, and I'm safe in the knowledge that the small amount of power they consume is keeping the bills down.

If you've read my blog before, you may have read my account of how I [migrated my desktop computing][3] to a Pi 3. This worked well for quite a while, but I finally had to accept that editing large graphics and multimedia files was a problem, so I replaced it with an [Intel NUC][4]. My hankering for Pi experimentation was still there, though, and I decided to do a "what-if" exercise and see if it could survive on the road. And that's when I dragged my Pi Zero out of retirement from my spares box.

### Why travel with a Raspberry Pi

_"Why would I want to do this? Surely the trend is to travel with as powerful a device as possible?"_

Well, it's like this. Last year, my employer issued a decree that in order to conform to its security policy, we would no longer be able to check laptops in as luggage, and not long after, the US government decided to summarily ban carrying laptops in hand baggage to and from certain countries, y'know, for security. So how do we get around that one? The sensible option would be to not travel with a laptop and use a hot-desk style spare at the destination. After all, everything is in the cloud now, right? Or, you could carry your important, commercially sensitive data on a CD/DVD or memory stick, but only if it's encrypted to a standard and your employer's data handling policy allows that.

The problem is multi-faceted though: What if your role is such that you need to be able to fix software/systems on-the-go and you don't always have access to a "spare" laptop? On the occasions when I travel (by train), I have to lug my laptop with me, and it's a pain over the course of a day. Then there's the loss/theft/damage problem. Laptops can be easy targets, they can get left on trains, or you could be mugged. Or there's the "[evil maid][5]" scenario, in which someone interferes with your device without your knowledge. The list goes on.

So, here's what you can get with a Pi Zero portable computer:

  * It's small enough to fit in hand baggage or your pocket.
  * It's cheap enough at $8 to buy another if yours gets lost/stolen/damaged.
  * The entire OS and data are held on a "disk" that is as small as a fingernail, is cheap, and is easily bought in a wide variety of retail outlets. If need be, you can create a new one from a borrowed card from a phone.
  * A full development environment with the ability to work offline or online. It can also act as an SSH server so that more than one person can use it at once.
  * Safe storage: If you are paranoid or traveling on certain airlines, you can remove the "disk" and store it in your wallet or on your person. If your computer is stolen in transit, go and buy another one off the shelf: you're already set up with the OS.
  * Network-tolerant: Around the world, there are country-specific WiFi frequencies, and a simple text-file change enables you to be compliant within minutes.
  * Keyboard independent: You can use a compliant Bluetooth keyboard, but when you need to do something more demanding, you can just plug any USB keyboard into the spare USB connector using an On-The-Go cable.
  * Power supply tolerant: My 3300mAh power bank can run the Pi Zero for about eight hours, but if all else fails, you can use a TV's USB connector to power it. Generally speaking, if a TV has HDMI, it will also have a USB socket, and the Zero only draws about 120mA. Or use someone's phone charger!
  * Finally, if you're unfortunate enough to lose/damage your "disk," you can easily create another by downloading your 2GB image from a secure location in the cloud and burning it to a new card. Try doing _that_ with a normal laptop.



That's motivation enough for me!

Here is my finished product, with a beer coaster for scale.

![Pi Zero W setup][6]

### How I set up the Pi Zero for travel

The cheap-as-chips Pi Zero has always been a bit of an odd beast, in my opinion. It features a single-core CPU and has a frugal 512MB of memory, some of which it has to share with the onboard video. The Raspbian OS currently based on Debian Stretch is touted as being suitable for the Zero with the LXDE-based "Pixel" GUI desktop, and indeed it can be loaded and started—but in reality, the poor thing really struggles to manage a GUI _and_ run useful software.

Nevertheless, I was determined to give it a good try and set it up with the apps that have the smallest memory footprint. I'd already been around this loop with the Pi 3, so it was more of the same—only even more so! Bearing in mind this was to be a road warrior's computer, here's what I wanted to have on it:

Web browser | Lightweight but with privacy in mind
---|---
Email | IMAP-capable and seamlessly supporting GPG
XMPP/Jabber client | No-nonsense messaging
VPN client | I'm on the road, remember
Tor client | Always useful...
Music | I carry a few MP3s, but internet radio is cool, too
Multiple desktops | Useful with a small screen
Editor/IDE | Hey, it's a working computer!
FTP/SFTP client | Hey, it's a working computer!

All in all, it's a very useful bundle for my purposes, and if I achieve a balanced environment, it could actually work.

### Hardware

The hardware was a bit of a challenge. The battery was not a problem, as I have a variety of rechargeable power packs with varying capacity, so it is really just a question of picking a suitable one for the day. The only prerequisite was that the battery should be able to take a charge while being used, and all my Jackery brand batteries do this.

For my "disk," I opted for my in-house standard 32GB SanDisk Extreme microSDHC. They're very reliable, and the size is big enough to hold a lot of software and data while still remaining affordable.

The video output would, I anticipated, be HDMI-out using the Zero's mini-HDMI connector. This suited my purposes well, as the majority of hotel TVs use this interface. Audio would also go via HDMI.

That left the human interface devices (HID), and this, predictably, caused the most consternation. I hate Bluetooth with a passion, and with the Zero's limited connectors, I'd have to bite the bullet and use a Bluetooth keyboard and mouse, preferably a combined one—and small. There's no point in having a tiny computer if you have lug a great honking keyboard around as well, so my unhappy quest began.

### Bluetooth woes

The Zero has a limited number of USB connectors on board—just one, if you allow for the power connector, which obviously means you have limited connection options. You could always use a USB extender hub, but then that's more to carry—including another power supply. That basically leaves you trying to connect a keyboard and mouse via Bluetooth. I don't believe the hype about how it can "_easily connect a wide variety of devices together,_" and I wrestle with a variety of allegedly standard devices trying to get the bloody things to play nicely together. Part of the problem with the Pi (I think) is that there's some unintended interaction between WiFi and Bluetooth that causes weird stuff to happen. My problem was that I was able to connect to the Pi using a keyboard _or_ a mouse, but not both reliably at the same time. And yes, I have a variety of allegedly standards-following Bluetooth devices, none of which decided to work together properly.

At this point, I was wondering if there was a Bluetooth Samaritan's Helpline, but there wasn't, so what the heck was I going to do?! Temporarily, I resorted to using an Apple USB keyboard with two USB sockets; this was useful for setup but not for being on the road. In the end, I spent hours browsing eBay and Amazon, and then I found it: a "_3- in-1 Mini Wireless Bluetooth Keyboard Mouse Touchpad For Windows iOS Android UK - Backlit, Ultra-thin, Built-in Rechargeable Battery, QWERTY_." Perfect on paper, but would it work? I sent off the money, and four days later, a slim package arrived from China. And it bloody well worked!! First time, every time, it got on with the Pi like pie and chips. I promptly ordered another one—accidents happen, and I wouldn't want to be left in the lurch.

So, with my hardware lineup complete, I could settle down to setting up the Pi proper.

### The GUI and the Pi

Going back to my software requirements, I thought long and hard about the smallest desktop environment and went with the supplied LXDE desktop, which I'd used several times on other projects. Although the Pi struggled a bit with screen handling, it generally performed well, and I started setting up my software. 

Web browser 1

Midori: a good compromise between size and modernity. Supports private browsing and is bundled with the Pi

Web browser 2

Links2 in graphic mode: lightweight, fast, secure, works with proxies

Email

Sylpheed: small, light, and works well with GPG

XMPP/Jabber client

Profanity. It's great!

VPN client

OpenVPN

Tor client

Ha! Links2 again

Music

SMPlayer: the GUI for MPlayer

Editor/IDE

Geany: small and light but powerful

Image viewer/editor

Pinta

FTP/SFTP client

Filezilla

**Other stuff:**

Midnight Commander

Not just a file manager (more later)

Tor proxy server

Always on, so I can use Tor as needed

Nmap

I sometimes need to test stuff

vnStat

Monitor data usage on the wlan0 interface

SSH/SFTP server

Standard issue on this distro

UFW

Firewall; can't be too careful!

Gopher client

Gopherspace! It's still out there, and I use the _original_ Gopher client!

All of the above are tried, tested, and very stable packages. The web browser decision was a calculated one: the Zero doesn't _really_ have what it takes to negotiate a modern ~~bloated, ad-ridden~~ website, and honestly, I have a phone that can handle that sort of thing. Likewise, the decision to run a Tor proxy: it's very handy to be able to access Marianas Web, and using Links2 as a browser means that the risk is minimal.

Sylpheed is a mature package that I believe has largely been replaced by Claws but is actually less demanding of resources. GPG integrated seamlessly with it, and I was able to exchange signed/encrypted messages with ease. It renders both plain-text and HTML messages well, and the interface is uncluttered.

I needed a _simple_ XMPP/Jabber client. The problem I've found with many apps of this type is that they try to incorporate multiple messaging standards when I only really need XMPP. Profanity is ideal as it does one job and does it very well.

### System setup

I spent a considerable amount of time setting up the OS for the best performance; a task made easier because I have set up numerous Raspberry Pis before. In such a small (as in memory) system, the decision to use a swap file was not taken lightly, and unfortunately, using a GUI desktop meant that the swap is in frequent use. The alternative is to not have one and hope that the system doesn't freeze up too much. I went with the suggested default of 100MB.

I then looked at logging. As this was supposed to be a small, portable system, I didn't see much point in having extensive logging, especially as it would have a negative effect on the SDHC card in the long term. One solution was a combination of disabling logging in apps wherever possible and sacrificing a little memory to create a tmpfs in-memory filesystem. This would have the added advantage that it would be recreated on each boot. So, I worked out that 8MB could be used for this and duly updated **/etc/fstab**. This works extremely well.


```
`tmpfs /var/log tmpfs defaults,noatime,nosuid,mode=0755,size=8m 0 0`
```

I also had to update **/etc/rc.local** to provide some essential directories on startup; this kept the rsyslog and Tor daemons happy.


```
mkdir -p /var/log/rsyslog
mkdir -p /var/log/tor/
mkdir -p /var/log/vnstat/
chown vnstat.root /var/log/vnstat/
chown debian-tor /var/log/tor/
```

With all that in place, the little computer was almost ready for Prime Time. But there was a problem. I've already mentioned the frugal amount of memory on the Zero, and even with the GUI and apps pared down to the bone, I was regularly using swap space. To make matters worse, much worse, my carefully set up desktop menus were having problems.

The Pi desktop comes with an _incredible_ amount of software installed, mainly to satisfy its original purpose as an educational machine. I decided early on to edit the menus to remove a lot of the "junk" and replace it with my list of apps, so I fired up the Main Menu Editor app. Normally this is quite responsive, but on the resource-challenged Zero, it had worrying lags and pauses as I made changes. Ultimately, it meant that my ad-hoc menus were corrupted, and worse still, the default Pi menus had been reinstated. Searching for help with this problem revealed that the menu system is convoluted, and if an update is not saved properly, the defaults will be substituted.

I looked at the structure of the menus as best I could and decided that trying to pick the frigging things apart was more trouble than it was worth. So, I ditched LXDE/Pixel and installed XFCE (and its even lighter-weight GUI) in its place. This time, the menu editor seemed more stable, but as I made the changes, I realized that yes, it was happening again. At that point, I had a tantrum and threw my toys out of the pram. I'd reached a crossroads in my road-warrior setup: it worked very well apart from the menus, and I felt I couldn't go back after all that work, so, with a heavy heart, I had a drastic rethink. It was supposed to be a hacker's machine, right? It was Linux and, to many like-minded people, that meant a text-based interface, right?

So I did what I had to do: I ditched the accursed GUI! Yes, go back to the '90s, maybe even earlier, and Run it Like a Boss.™ The main problem I had in my mind was that I'd no longer have nice, safe, icon-driven apps and multiple desktops to work with. My WiFi/network switcher would be no more, and worse still, I'd have to try and manage Bluetooth from the command line. That was going to be a major challenge, but I decided to proceed anyway, and I had a cloned copy of my microSDHC just in case I lost my nerve.

### Set it up again

Incidentally, if I were using a full-spec Raspberry Pi 3, I wouldn't have been in this situation. But it was my choice, so… This exercise started out well. I was already rebooting into the terminal login prompt, and the Bluetooth keyboard was working, so I was able to log in (previously, I'd run **startx** to get to the desktop). Since I no longer had the desktop bloat to worry about, my memory usage was a mere 78MB and no swap usage; I felt better already. But what about the apps that make life easy? I did more hunting around, and here's what I came up with.

Web browser

Links2 _not_ in graphic mode: lightweight, fast, secure, works with proxies

Email

(Neo)Mutt: powerful, extensible and works well with GPG

XMPP/Jabber client

Profanity. It's great!

VPN client

OpenVPN

Tor client

Ha! Links2 again

Music

Midnight Commander + mpg123

Editor/IDE

Nano: I'm using it to write this

FTP/SFTP client

Midnight Commander

File manager

Midnight Commander

**Other stuff**

Tor proxy server

Always on, so I can use Tor as needed

Nmap

I sometimes need to test stuff

vnStat

Monitor data usage on the wlan0 interface

SSH/SFTP server

Standard issue on this distro

Gopher client

Gopherspace! It's still out there, and I use the _original_ Gopher client!

**Graphics workarounds**

fbcat

Takes a screenshot using the framebuffer device

fbi

Linux framebuffer imageviewer: displays images in a terminal

fbgs

Displays PostScript/PDF files using the Linux framebuffer device on a terminal

pnmtopng

Converts a PPM into a PNG file

You'll notice that there's not too much change there, with a few notable exceptions to display graphical content.

### Do it again, and do it properly

Things looked good, but I still had some issues to solve.

#### Desktops

"But what about the multiple desktops?!" I hear you asking, "How will you view images or connect to WiFi networks?" I needed to find a solution, and fast. For the multiple desktop thing, I decided to install tmux, the Linux Terminal Multiplexer. There are so many good reasons to run tmux on a Linux system, but my key reasons are that it makes multi-screen working possible, and it uses very little memory. It also enables me to connect to the Pi via SSH and take over the session, as you can see below.

![tmux running on Raspberry Pi][7]

#### Music

I must say that it's very important to me to be able to listen to music while I'm working or relaxing, so the loss of (S)MPlayer was a major blow. I was able to listen to single MP3s or complete playlists. I was able to stream internet radio. Sigh. Midnight Commander came to the rescue with its ability to handle various file types. The secret is in the Extension File menu, which looks like this for me:


```
shell/i/.mp3
    Open=/usr/lib/mc/ext.d/sound.sh open mp3
regex/i/\\.(m3u|pls)$
        Open=/usr/lib/mc/ext.d/sound.sh open playlist
```

And my sound.sh looks like this:


```
#!/bin/bash
do_open_action() {
    filetype=$1
    case "${filetype}" in
    playlist)
        mpg123 -C -@ "${MC_EXT_FILENAME}"
        ;;
    m3u)
        mpg123 -C -@ "${MC_EXT_FILENAME}"
        ;;
    mp3)
        mpg123 -C "${MC_EXT_FILENAME}"
        ;;
    *)
        ;;
    esac
        }
case "${action}" in
open)
    ("${MC_XDG_OPEN}" "${MC_EXT_FILENAME}" &gt;/dev/null 2&gt;&amp;1) || \
        do_open_action "${filetype}"
    ;;
*)
    ;;
esac
```

Tapping Enter on an MP3 will play the file, or tapping on an M3U playlist will play whatever's in the playlist. I used the **-C** option so that I could have access to mpg123's controls. Sorted!

#### SFTP/FTP clients

Midnight Commander again! You can set up a client connection entry with the built-in menu and use **CTL+\** to select it from a drop-down. The FTP site is rendered in one of the panels as a directory structure, and you can just treat it as you would a local filesystem. SFTP is a bit harder, as you have to set it up as an SSH connection and then copy as required; it's OK if you have password authentication, but for public key authentication, I found it less involved to use SFTP from the command line. For reference, this is the syntax:


```
sftp://[user@]machine:[port]/[remote-dir]

The user, port and remote-dir elements are optional.
```

![MC FTP client example][8]

#### WiFi selector

In the GUI world, I had had a nice, icon-based WiFi network manager app that I could use to switch between networks. The text-mode alternative is the bizarrely named wicd-curses*.* It's an app that communicates with wicd (wireless control daemon) using cursor keys, and it works very well. I had to disable the dhcpcd service using systemctl to get it to work, but at least it lets me select the appropriate network, including my home network or my phone's wireless hotspot when I'm out on the road. Here's [how to do it][9].

![wicd-curses WiFi app][10]

#### Email and web browsing

For email and web browsing, I use Mutt (Neomutt) and Links2, respectively, and they just work.

#### Gopher

Trust me; you're not old enough to remember Gopher, the text mode forerunner of the WWW. Strictly speaking, it was before my time as well, but I run a thriving Gopher server, so I need a client. Here's what a Gopher server looks like running on a Raspberry Pi.


```
                gopher://gopher.petergarner.net:70

__/\\\\\\\\\\\\\\\\\\_______/\\\\\\\\\\\\\\\\\\\\\\\\\\__________________/\\\\\\____
_/\\\\\///////\\\\\\____\/\\\\\/////////\\\\\\______________/\\\\\\\\\\____
_\/\\\\\\_____\/\\\\\\___\/\\\\\\_______\/\\\\\\__/\\\\\\_______/\\\\\/\\\\\\____
_\/\\\\\\\\\\\\\\\\\\\\\/____\/\\\\\\\\\\\\\\\\\\\\\\\\\/___\///______/\\\\\/\/\\\\\\____
_\/\\\\\//////\\\\\\____\/\\\\\/////////_____/\\\\\\_____/\\\\\/__\/\\\\\\____
_\/\\\\\\____\//\\\\\\___\/\\\\\\_____________\/\\\\\\____/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_
_\/\\\\\\_____\//\\\\\\__\/\\\\\\_____________\/\\\\\\\\__///////////\\\\\//__
_\/\\\\\\______\//\\\\\\_\/\\\\\\_____________\/\\\\\\_______________\/\\\\\\___
_\///________\///__\///______________\///_________________\///___

               Welcome to... "The Rpi4 Gopher"
               ... your source for local information, and beyond!

 --&gt;  [14] About this server (and legal)/

           -- Content

      [18] Tech-related/
      [19] Politics and Propaganda (from all sides)/
      [20] Cyber and Internet related/
      [21] Stuff (filed under "miscellany")/
.....
```

### Performance

Overall, I'm pleased to say that my switch to text mode has been very beneficial with userland tasks handled responsively. As you can see from a typical **top** display, there's plenty of available and cached memory remaining from the original 512MB. Right now, I'm listening to a playlist, writing this article in an SSH-connected tmux session, running top**,** and Mutt is handling emails.

On a regular basis, that's all I'll probably need to do, but it's great to have the option to develop and test software on the go, if I need to. Here's a simple Python script to get the Pi's CPU serial number (type):


```
&gt;&gt;&gt; #!/usr/bin/env python
...
&gt;&gt;&gt; import subprocess
&gt;&gt;&gt;
&gt;&gt;&gt; def GetCPUserial():
...     cpuinfo = subprocess.check_output(["/bin/cat", "/proc/cpuinfo"])
...     cpuinfo = cpuinfo.replace("\t","")
...     cpuinfo = cpuinfo.split("\n")
...     [ legend, cpuserial ] = cpuinfo[11].split(' ')
...     return cpuserial
...
&gt;&gt;&gt; print GetCPUserial()
9000c1
&gt;&gt;&gt;

[/code] [code]

top - 15:55:47 up  5:49,  6 users,  load average: 0.21, 0.25, 0.34
Tasks: 112 total,   1 running, 110 sleeping,   1 stopped,   0 zombie
%Cpu(s): 3.9 us, 5.8 sy, 0.0 ni, 90.3 id, 0.0 wa, 0.0 hi, 0.0 si,  

KiB Mem :   493252 total, 37984 free,  73248 used, 382020 buff/cache
KiB Swap:   102396 total, 102392 free,     4 used. 367336 avail Mem
```

I take regular backups, of course, using the indispensable [rpi-clone][11]. The beauty of this app is that I can copy the entire microSDHC card to another while the Pi is running. It also has the advantage that if I use a smaller capacity card, it will automatically and safely take this into account. I use a 32GB card, but I can dump it to an 8GB card because I'm only using about 4GB. The converse is true for a larger destination card. If you add only one utility to your Pi, this should be it—it's saved me more grief than _anything_ I've ever used! You can also use it to create distribution copies of your system.

#### Battery life

I can only describe the battery life as "impressive." Once the Zero is booted up, it takes an average 0.15A / 0.65W with the following running:

  * System
  * Bluetooth
  * WiFi
  * Audio (HDMI) subsystem
  * Video (HDMI) subsystem



I've measured 20 hours of mixed usage from my 6000mAh Jackery Jetpack power bank, and if I disable WiFi and just use it in "local" mode, possibly more. It's certainly practical to use it with my smaller, 3300mAh Anker battery, which unfortunately isn't rechargeable while in use. I also have a 20,000mAh battery for long trips: I have yet to try that out.

### Taking it on the road

In terms of computing as a challenge, setting up the Zero has been a really valuable exercise. It's taught me to become acquainted with the operating system and app software at a low level in order to squeeze the maximum amount of memory from the system. It's also taught me that I don't have to invest large amounts of money to build a relatively powerful system that can be taken on the road and used productively.

Now that I've almost finished setting it up, it's time to actually _take_ it on the road and see how it runs in the field. Hey, maybe I'll actually take into a field and see if I can do some work and listen to music.

* * *

_This was originally published on [Peter Garner's blog][12] under a CC BY-NC-ND 4.0 license and is reused here with the author's permission._

Having recently co-authored a book about building things with the Raspberry Pi ( Raspberry Pi Hacks...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/raspberry-pi-zero

作者：[Peter Garner][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/petergarner
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/plane_travel_world_international.png?itok=jG3sYPty (Airplane flying with a globe background)
[2]: https://opensource.com/resources/raspberry-pi
[3]: https://www.petergarner.net/projects/Mac_Mini_to_rpi-part_1.pdf
[4]: https://en.wikipedia.org/wiki/Next_Unit_of_Computing
[5]: http://threatbrief.com/evil-maid-attack/
[6]: https://opensource.com/sites/default/files/uploads/pi-zero-on-the-road.jpg (Pi Zero W setup)
[7]: https://opensource.com/sites/default/files/uploads/tmux-on-pi.png (tmux running on Raspberry Pi)
[8]: https://opensource.com/sites/default/files/uploads/ftp-client-mc.png (MC FTP client example)
[9]: https://www.raspberrypi.org/forums/viewtopic.php?t=150124#p987430
[10]: https://opensource.com/sites/default/files/uploads/wifi-selector.png (wicd-curses WiFi app)
[11]: https://github.com/billw2/rpi-clone
[12]: https://petergarner.net/notes/index.php?thisnote=20180202-Travels%20with%20a%20Pi
