[#]: subject: "Automatically Light Up a Sign When Your Webcam is in Use"
[#]: via: "https://fedoramagazine.org/automatically-light-up-a-sign-when-your-webcam-is-in-use/"
[#]: author: "John Boero https://fedoramagazine.org/author/boeroboy/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Automatically Light Up a Sign When Your Webcam is in Use
======

![][1]

Automatic WFH sign tells others when you're in a conference.

At the beginning of COVID lockdown and multiple people working from home it was obvious there was a need to let others know when I’m in a meeting or on a live webcam. So naturally it took me one year to finally do something about it. Now I’m here to share what I learned along the way. You too can have your very own “do not disturb” sign automatically light up outside your door to tell people not to walk in half-dressed on laundry day.

At first I was surprised Zoom doesn’t have this kind of feature built in. But then again I might use Teams, Meet, Hangouts, WebEx, Bluejeans, or any number of future video collaboration apps. Wouldn’t it make sense to just use a system-wide watch for active webcams or microphones? Like most problems in life, this one can be helped with the Linux kernel. A simple check of the _uvcvideo_ module will show if a video device is in use. Without using events all that is left is to poll it for changes. I chose to build a taskbar icon for this. I would normally do this with my trusty C++. But I decided to step out of my usual comfort zone and use Python in case someone wanted to port it to other platforms. I also wanted to renew my lesser Python-fu and face my inner white space demons. I came up with the following ~90 lines of practical and simple but insecure Python:

<https://github.com/jboero/livewebcam/blob/main/livewebcam>

Aside from the icon bits, a daemon thread performs the following basic check every 1s, calling scripts as changed:

```
def run(self):
    while True:
        val=subprocess.check_output(['lsmod | grep \'^uvcvideo\' | awk \'{print $3}\''], shell=True, text=True).strip()
        if val != self.status:
            self.status = val
            if val == '0':
                val=subprocess.check_output(['~/bin/webcam_deactivated.sh'])
            else:
                val=subprocess.check_output(['~/bin/webcam_activated.sh'])
        time.sleep(1)
```

Rather than implement the parsing of modules, just using a hard-coded shell command got the job done. Now whatever scripts you choose to put in ~/bin/ will be used when at least one webcam activates or deactivates. I recently had a futile go at the kernel maintainers regarding a bug in usb_core triggered by uvcvideo. I would just as soon not go a step further and attempt an events patch to uvcvideo. Also, this leaves room for Mac or Windows users to port their own simple checks.

Now that I had a happy icon that sits in my KDE system tray I could implement scripts for on and off. This is where things got complicated. At first I was going to stick a magnetic bluetooth LED badge on my door to flash “LIVE” whenvever I was in a call. These things are ubiquitous on the internet and cost about $10 for basically an embedded ARM Cortex-M0 with an LED screen, bluetooth, and battery. They are basically a full Raspberry Pi Pico kit but soldered onto the board.

![These Bluetooth LED badges with 48Mhz ARM Cortex-M0 chips have a lot of potential, but they need custom firmware to be any use.][2]

Unfortunately these badges use a fixed firmware that is either listening to Bluetooth transmissions or showing your message – it doesn’t do both which is silly. Many people have posted feedback that they should be so much more. Sure enough someone has already tinkered with [custom firmware][3]. Unfortunately the firmware was for older USB variants and I’m not about to de-solder or buy an ISP programmer to flash eeprom just for this. That would be a super interesting project for later and would be a great Rpi alternative but all I want right now is a remote controlled light outside my door. I looked at everything including WiFi [smart bulbs][4] to replace my recessed lighting bulbs, to [BTLE candles][5] which are an interesting option. Along the way I learned a lot about Bluetooth Low Energy including how a kernel update can waste 4 hours of weekend with bluetooth stack crashes. BTLE is really interesting and makes a lot more sense after reading up on it. Sure enough there is Python that can set the display [message on your LED badge][6] across the room, but once it is set, Bluetooth will stop listening for you to change it or shut it off. Darn. I guess I should just make do with USB, which actually has a standard command to control power to ports. Let’s see if something exists for this already.

![A programmable Bluetooth LED sign costs £10 or for £30 you can have a single LED up to 59 inches away.][7]

It looked like there are options out there even if they’re not ideal. Then suddenly I found it. Neon sign “ON AIR” for £15 and it’s as dumb as they come – just using 5v from USB power. Perfect.

![Bingo – now all I needed to do was control the power to it.][8]

The command to control USB power is _uhubctl_ which is in Fedora repos. Unfortunately most USB hubs don’t support this command. In fact very few support it [going back 20 years][9] which seems silly. Hubs will happily report that power has been disconnected even though no such disconnection has been made. I assume it’s just a few cents extra to build in this feature but I’m not a USB hub manufacturer. Therefore I needed to source a pre-owned one. In the end I found a BYTECC BT-UH340 from the US. This was all I needed to finalize it. Adding udev rules to allow the _wheel_ group to control USB power, I can now perform a simple _uhubctl -a off -l 1-1 -p 1_ to turn anything off.

![The BYTECC BT-UH340 is one of few hubs I could actually find to support uhubctl power.][10]

Now with a spare USB extension cable lead to my door I finally have a complete solution. There is an “ON AIR” sign on the outside of my door that lights up automatically whenever any of my webcams are in use. I would love to see a Mac port or improvements in pull requests. I’m sure it can all be better. Even further I would love to hone my IoT skills and sort out flashing those Bluetooth badges. If anybody wants to replicate this please be my guest, and suggestions are always welcome.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/automatically-light-up-a-sign-when-your-webcam-is-in-use/

作者：[John Boero][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/boeroboy/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/08/onair-1890x800-1-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2021/03/IMG_20210322_164346-1024x768.jpg
[3]: https://github.com/Effix/LedBadge
[4]: https://www.amazon.co.uk/AvatarControls-Dimmable-Bluetooth-Connection-2700K-6100K/dp/B08P21MSTW/ref=sr_1_6_mod_primary_lightning_deal?dchild=1&keywords=bluetooth+bulb+spot&qid=1616345349&sbo=Tc8eqSFhUl4VwMzbE4fw%2Fw%3D%3D&smid=A2GE8P68TQ1YXI&sr=8-6
[5]: http://nilhcem.com/iot/reverse-engineering-simple-bluetooth-devices
[6]: http://nilhcem.com/iot/reverse-engineering-bluetooth-led-name-badge
[7]: https://fedoramagazine.org/wp-content/uploads/2021/03/image-7-1024x416.png
[8]: https://fedoramagazine.org/wp-content/uploads/2021/03/IMG_20210322_163624-1024x768.jpg
[9]: https://github.com/mvp/uhubctl#compatible-usb-hubs
[10]: https://c1.neweggimages.com/ProductImage/17-145-089-02.jpg
