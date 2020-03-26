[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Adding a display to a travel-ready Raspberry Pi Zero)
[#]: via: (https://opensource.com/article/20/3/pi-zero-display)
[#]: author: (Peter Garner https://opensource.com/users/petergarner)

Adding a display to a travel-ready Raspberry Pi Zero
======
A small eInk display turns a Raspberry Pi into a self-contained,
pocket-sized travel computer.
![Pi Zero][1]

In my earlier article, I explained how I [transformed a Raspberry Pi Zero][2] into a minimal, portable, go-anywhere computer system that, although small, can actually achieve useful things. I've since made iterations that have proved interesting and made the little Pi even more useful. Read on to learn what I've done.

### After the road trip

My initial Pi Zero setup [proved its worth][3] on a road trip to Whitby, but afterward, it was largely consigned to the "pending" shelf, waiting for another assignment. It was powered up weekly to apply updates, but other than that, it was idle. Then one day, as I was flicking through emails from various Pi suppliers, I came across a (slightly) reduced e-Ink display offer: hmmm… and there was a version for the Pi Zero as well. What could I do with one?

ModMyPi was selling a rather neat [display and driver board combination][4] and a [small case][5] with a transparent window on top. I read the usual reviews, and apart from one comment about the _boards being a very tight fit_, it sounded positive. I ordered it, and it turned up a few days later. I had noted from the product description that the display board didn't have GPIO headers installed, so I ordered a Pi Zero WH (wireless + headers pre-installed) to save me the bother of soldering one on.

### Some assembly required

As with most of these things, some self-assembly was required, so I carefully opened the boxes and laid out the parts on the desk. The case was nicely made apart from ridiculous slots for a watch strap (?!) and some strange holes in the side to allow tiny fingers to press the five I/O buttons on the display. "_Could I get a top without holes?"_ I inquired on the review page. "_No."_ Okay then.

With the case unpacked, it was time to open the display box. A nicely designed board was first out, and there were clear instructions on the Pi-Supply website. The display was so thin (0.95mm) that I nearly threw it out with the bubble wrap.

The first job was to mount the display board on the Pi Zero. I checked to make sure I could attach the display cable to the driver board when it was joined to the Pi and decided that, with my sausage fingers, I'd attach the display first and leave it flapping in the breeze while I attached the driver board to the Pi. I carefully got the boards lined up on the GPIO pins, and, with those in place, I folded over the display "screen" to sit on top of the board. With the piggy-backed boards in place, I then _verrrry_ carefully shoe-horned the assembly into place in the case. Tight fit? Yeah, you're not kidding, but I got it all safely in place and snapped the top on, and nothing appeared to be broken. Phew!

### How to set up your display

I'm going to skip a chunk of messing about here and refer you to the maker's [instructions][6] instead. Suffice to say that after a few installs, reboots, and coffees, I managed to get a working e-Ink display! Now all I had to do was figure out what to do with it.

One of the main challenges of working with a small device like [my "TravelPi"][2] is that you don't have access to as much screen real estate as you would on a larger machine. I like the size and power of the device though, so it's really a compromise as to what you get out of it. For example, there's a single screen accessible via the HDMI port, and I've used tmux to split that into four separate, usable panes. If I really need to view something else urgently, I could always **Ctrl+Z** into another prompt and do the necessary configs, but that's messy.

I wanted to see various settings and maybe look at some system settings, and the e-Ink display enabled me to do all that! As you can see from the image below, I ended up with a very usable info panel that is updated by a simple(-ish) Python script (**qv**) either manually or by a crontab entry every 10 minutes. The manufacturer states that the update frequency should be "no more than 1Hz if you want your display to last for a long time." Ten minutes is fine, thank you.

Here's what I wanted to be able to see at a glance:

Hostname | And device serial number
---|---
IP address | Current internal IP address
VPN status | Inactive/country/IP address
Tor status | Inactive/IP address
"Usage" | Percentage disk space and memory used
Uptime | So satisfying to see those long uptimes

And here it is: a display that's the same size as the Pi Zero and 1" deep.

![PiZero Display][7]

### How to populate the display

Now I needed to populate the display. As seems to be the norm these days, the e-Ink support software is in Python, which, of course, is installed as standard with most Linux distros. _Disclaimer:_ Python is not my first (dev) language, but the code below works for me. It'll probably work for you, too.


```
#!/usr/bin/env python

import os
import sys
import time
import datetime
import socket
import netifaces as ni
import psutil
import subprocess

from netifaces import AF_INET, AF_INET6, AF_LINK, AF_PACKET
from papirus import PapirusText, PapirusTextPos, Papirus
from subprocess import check_output
from datetime import timedelta

rot     = 0
screen  = Papirus(rotation = rot)
fbold   = '/usr/share/fonts/truetype/dejavu/DejaVuSansMono-Bold.ttf'
fnorm   = '/usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf'
text    = PapirusTextPos(rotation = rot)

def GetBootTime():
        return datetime.datetime.fromtimestamp(psutil.boot_time())

def GetUptime():
     with open('/proc/uptime','r') as f:
       uptime_seconds = float(f.readline().split()[0])
     u = str(timedelta(seconds = uptime_seconds))
     duration,junk = u.split(".")
     hr,mi,sc = duration.split(":")
     return "%sh %sm %ss" % ( hr,mi,sc )

def getHostname():
        hostname = socket.gethostname()
        return hostname

def getWiFiIPaddress():
        try:
                ni.interfaces()
                [ 'wlan0', ]
                return ni.ifaddresses('wlan0')[AF_INET][0]['addr']
        except:
                return 'inactive'

def getVPNIPaddress():
        try:
                ni.interfaces()
                [ 'tun0', ]
                return ni.ifaddresses('tun0')[AF_INET][0]['addr']
        except:
                return 'inactive'

def GetTmuxEnv():
        if 'TMUX_PANE' in os.environ:
                return ' (t)'
        return ' '

def GetCPUserial():
        cpuinfo = subprocess.check_output(["/bin/cat", "/proc/cpuinfo"])
        cpuinfo = cpuinfo.replace("\t","")
        cpuinfo = cpuinfo.split("\n")
        [ legend, cpuserial ] = cpuinfo[12].split(' ')
        cpuserial = cpuserial.lstrip("0")
        return cpuserial

def GetMemUsed():
        memUsed = psutil.virtual_memory()[2]
        return memUsed

def GetDiskUsed():
        diskUsed = psutil.disk_usage('/')[3]
        return diskUsed

def CheckTor():
        try:
                TS = "active: pid %s" %check_output(['pidof','tor'])   
        except:
                TS = 'inactive'
        return TS      

def CheckVPN():
        return VPNlo
# ---------------------------------------------------------------------------
def main():
        pass

if __name__ == '__main__':
        main()

VPNlo = 'inactive'

if (len(sys.argv) == 2):
        try:
                VPNlo = sys.argv[1]
        except:
                VPNlo = 'inactive'

text = PapirusTextPos(False,rotation=rot)
text.AddText("%s %s %s"% (getHostname(),GetCPUserial(),GetTmuxEnv()),x=1,y=0,size=12,invert=True,fontPath=fbold)
text.AddText("IP  %s" % getWiFiIPaddress(),x=1,y=16,size=12,fontPath=fnorm)
if ( getVPNIPaddress() == 'inactive' ):
        text.AddText("VPN %s" % CheckVPN(),x=1,y=30,size=12,fontPath=fnorm)
else:
        text.AddText("VPN %s" % getVPNIPaddress(),x=1,y=30,size=12,fontPath=fnorm)
text.AddText("TOR %s" % CheckTor(),x=1,y=44,size=12,fontPath=fnorm)
text.AddText("MEM %s% DISK %s% used" % (GetMemUsed(),GetDiskUsed()),x=1,y=58,size=12,fontPath=fnorm,maxLines=1)
text.AddText("UPTIME %s" % GetUptime(),x=1,y=72,size=12,fontPath=fnorm)
text.WriteAll()

sys.exit(0)
```

Normally, the script runs without any arguments and is called by a series of Bash scripts that I've written to start up various subsystems; these are, in turn, called from a menu system written in Whiptail, which is pretty versatile. In the case of the VPN system, I have a list of access points to choose from and that update the location on the display. Initially, I call the display updater with the location name (e.g., Honolulu), but at that point, I can't display the VPN IP address because I don't know it:


```
   dispupdate.py ${accesspoint}
   openvpn --config $PATH/Privacy-${accesspoint}.conf --auth-user-pass credfile
```

When the display updater runs again (outside the VPN startup script), the IP address is readable from the **tun0** interface and the display is updated with the IP address. I may change this later, but it works fine now. I use the **PapirusTextPos** function (rather than **PapirusText**), as this allows multiple lines to be written before the display is updated, leading to a much faster write. The **text.WriteAll()** function does the actual update.

### Adding more software

I was very pleased with my initial choice of applications, but since I'd managed to slim the whole installation down to 1.7GB, I had plenty of available space. So, I decided to see if there was anything else that could be useful. Here's what I added:

Irssi | IRC client
---|---
FreeBSD games | There are still many text-mode games to enjoy
nmon | A _very_ comprehensive top-alike utility for all aspects of the system
Newsbeuter | Text-mode Atom/RSS feed reader

And I still have about 300MB free space to take me up to 2GB, so I may add more.

### We keed to talk about ~~Kevin~~ Bluetooth

Observant readers will remember my hatred for Bluetooth and trying to pair terminal-based software with a Bluetooth device. When I bought a new Pi, I realized that I had to pair the damn thing up with the keyboards again. Oh, woe is me! But a search-engine session and a calming coffee enabled me to actually do it! It goes something like this:


```
sudo su
bluetoothctl {enter}

[bluetooth]#

[bluetooth]# scan on
Discovery started
[CHG] Controller B8:27:EB:XX:XX:XX Discovering: yes

[bluetooth]# agent on
Agent registered
[NEW] Device B2:2B:XX:XX:XX:XX Bluetooth Keyboard
Attempting to pair with B2:2B:XX:XX:XX:XX
[CHG] Device B2:2B:XX:XX:XX:XX Connected: yes
[agent] PIN code: 834652
[CHG] Device B2:2B:XX:XX:XX:XX Modalias: usb:v05ACp0220d0001
[CHG] Device B2:2B:XX:XX:XX:XX UUIDs: zzzzz
[CHG] Device B2:2B:XX:XX:XX:XX UUIDs: yyyyy
[CHG] Device B2:2B:XX:XX:XX:XX ServicesResolved: yes
[CHG] Device B2:2B:XX:XX:XX:XX Paired: yes
Pairing successful
[CHG] Device B2:2B:XX:XX:XX:XX ServicesResolved: no
[CHG] Device B2:2B:XX:XX:XX:XX Connected: no

[bluetooth]# trust B2:2B:XX:XX:XX:XX
[CHG] Device B2:2B:XX:XX:XX:XX Trusted: yes
Changing B2:2B:XX:XX:XX:XX trust succeeded
[CHG] Device B2:2B:XX:XX:XX:XX RSSI: -53

[bluetooth]# scan off
[CHG] Device B2:2B:XX:XX:XX:XX RSSI is nil
Discovery stopped
[CHG] Controller B8:27:EB:XX:XX:XX Discovering: no

[bluetooth]# exit
Agent unregistered

$
```

I was gobsmacked! No, really. I paired my other keyboard and am now considering pairing a speaker, but we'll see. I had a beer that night to celebrate my new-found "l33t" tech skills! Here is an [excellent guide][8] on how to do it.

### One more hardware mod

Until recently, I've been using as large a good-quality microSDHC card as I could afford, and in case of problems, I created a backup copy using the rsync-based rpi-clone. However, after reading various articles on the 'net where people complain about corrupted cards due to power problems, unclean shutdowns, and other mishaps, I decided to invest in a higher-quality card that hopefully will survive all this and more. This is important if you're traveling long distances and _really_ need your software to work at the destination.

After a long search, I found the [ATP Industrial-Grade MicroSD/MicroSDHC][9] cards, which are rated military-spec for demanding applications. That sounded perfect. However, with quality comes a cost, as well as (in this case) limited capacity. In order to keep my wallet happy, I limited myself to an 8GB card, which may not sound like a lot for a working computer, but bearing in mind I have a genuine 5.3GB of that 8GB free, it works just fine. I also have a level of reassurance that bigger but lower-quality cards can't give me, and I can create an ISO of that card that's small enough to email if need be. Result!

### What's next?

The Zero goes from strength to strength, only needing to go out more. I've gone technically about as far as I can for now, and any other changes will be small and incremental.

* * *

_This was originally published on [Peter Garner's blog][10] under a CC BY-NC-ND 4.0 and is reused here with the author's permission._

The new issue of the official Raspberry Pi magazine, The MagPi, comes with a free computer stuck to...

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/pi-zero-display

作者：[Peter Garner][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/petergarner
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/zero-osdc-lead.png?itok=bK70ON2W (Pi Zero)
[2]: https://opensource.com/article/20/3/raspberry-pi-zero-w-road
[3]: https://petergarner.net/notes/index.php?thisnote=20180511-Travels+with+a+Pi+%282%29
[4]: https://www.modmypi.com/raspberry-pi/screens-and-displays/epaper/papirus-zero-epaper--eink-screen-phat-for-pi-zero-medium
[5]: https://www.modmypi.com/raspberry-pi/cases-183/accessories-1125/watch-straps/pi-supply-papirus-zero-case
[6]: https://github.com/PiSupply/PaPiRus
[7]: https://opensource.com/sites/default/files/uploads/pizerodisplay.jpg (PiZero Display)
[8]: https://www.sigmdel.ca/michel/ha/rpi/bluetooth_01_en.html
[9]: https://www.digikey.com/en/product-highlight/a/atp/industrial-grade-microsd-microsdhc-cards
[10]: https://petergarner.net/notes/index.php?thisnote=20190205-Travels+with+a+Pi+%283%29
