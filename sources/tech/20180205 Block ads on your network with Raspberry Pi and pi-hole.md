Translating by qhwdw
Block ads on your network with Raspberry Pi and pi-hole
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/pi-hole-banner.png?itok=1TXcp3hm)

Got an old Raspberry Pi lying around? Hate seeing ads while browsing the web? [Pi-hole][1] is an open source software project that blocks ads for all devices on your home network by routing all advertising servers into nowhere. What's best is it takes just a few minutes to set up.

Pi-hole blocks over 100,000 ad-serving domains, blocks advertisements on any device (including mobiles, tablets, and PCs), and because it completely blocks ads rather than just hiding them, this improves overall network performance (because ads are never downloaded). You can monitor performance and statistics in a web interface, and there's even an API you can use.

### What you will need

  * Raspberry Pi + SD card
  * USB power cable
  * Ethernet cable


![](https://opensource.com/sites/default/files/u128651/raspberry-pi.png)
![](https://opensource.com/sites/default/files/u128651/noobs-card.png)
![](https://opensource.com/sites/default/files/u128651/power-supply.png)
![](https://opensource.com/sites/default/files/u128651/ethernet-cable.png)

You don't need a recent Raspberry Pi model—an older one will do the job, as long as it's got at least 512MB RAM—so a Pi 1 Model B (rev 2), a Model B+, or a Pi 2 or 3 would do. You could use a Pi Zero, but you'll need a USB micro Ethernet adapter too. You could use a Pi Zero W with WiFi rather than Ethernet, but as it's part of your network infrastructure, I'd recommend a good, solid, wired connection instead.

### Prepare the SD card

First of all, you'll probably want to install Raspbian Stretch Lite onto an SD card. The card should be at least 4GB (the full desktop Raspbian image requires at least 8GB but the Lite image is, well, lighter). You can use the full Raspbian desktop image if you prefer, but as this is going to be running as a headless application, you don't need anything more.

![](https://opensource.com/sites/default/files/u128651/raspbian-downloads.png)

Using your main PC, download the Raspbian Stretch Lite image from the Raspberry Pi website. Now unzip it to extract the `.img` file within, and you'll write this image to your SD card. It doesn't matter if the SD card is blank or not, as everything on it will be wiped.

If you're using Linux, the easiest way to write the image is using the command-line tool `dd`. Alternatively, you can use cross-platform software [Etcher][2] (follow the guide "[How to write SD cards for the Raspberry Pi][3]" by Les Pounder).

![](https://opensource.com/sites/default/files/etcher-win-520px.png)

Once your SD card image has burned, you can insert it into your Raspberry Pi, connect a keyboard, monitor, and Ethernet cable, and then plug in the power. After the initial setup, the Pi won't need the keyboard or monitor. If you're experienced in working with the Pi headless, you can [enable SSH][4] and set it up [remotely][5].

### Install Pi-hole

Once your Raspberry Pi boots up, log in with the default username (`pi`) and password (`raspberry`). Now you're at the command line, and you're ready to install Pi-hole. Simply type the following command and press Enter:
```
curl -sSL https://install.pi-hole.net | bash

```

This command downloads the Pi-hole installer script and executes it. You can take a look at the contents by browsing `https://install.pi-hole.net` in your browser and see what it's doing. It will generate an admin password for you, and print it to the screen along with other installer information.

That's it! In just a few minutes, your Pi will be ready to start blocking ads.

Before you disconnect the Pi, you need to know its IP address and your router's IP address (if you don't already know it). Just type `hostname -I` in the terminal for the Pi's IP address, and `ip route | grep default` to locate your router. It will look something like `192.168.1.1`.

### Configure your router

Your Raspberry Pi is now running a DNS server, and you can tell your router to use Pi-hole as its DNS server instead of your ISP's default. Log into your router's management console web interface. This can usually be found by typing your router's IP address into your web browser's address bar.

Look for DHCP/DNS settings under LAN settings and set your primary DNS server to the IP address of the Pi-hole. It should look something like this:

![](https://opensource.com/sites/default/files/u128651/pi-hole-dns.png)

See the [Pi-hole discourse][6] for more information on this step.

You'll also want to make sure your Pi-hole maintains the same IP address, so also look for DHCP IP reservations and add an entry for your Pi.

### Test it out

Now shut down the Pi by running the command `sudo halt` and disconnecting the power. You can remove the monitor cable and the keyboard and place the Pi-hole in its permanent location—probably plugged in near your router. Ensure the Ethernet is connected and boot it back up by reconnecting the power.

Navigate to a website on your PC or a device on your WiFi (I highly recommend [Opensource.com][7]) to check that your internet access is working correctly (if not, you may have misconfigured your DNS settings). If web browsing seems to work as expected, it's set up correctly. Now, when you browse the web, it should be ad-free! Even ads served within apps on your mobile devices won't get through! Happy surfing!

If you really want to flex your new ad-blocking muscles, you can try browsing some of the ad-ridden websites listed on this [test page][8].

Now access the Pi-hole's web interface by entering its IP address into your web browser's address bar (e.g. <http://192.168.1.4/admin> \- or `http://pi.hole/admin` should work too). You should see the Pi-hole dashboard and some statistics (they will be very low at this stage). Once you login using the password you were given during installation, you'll see some pretty graphs too:

![](https://opensource.com/sites/default/files/u128651/pi-hole-web.png)

You can also tweak your Pi-hole's settings, like whitelist and blacklist domains, disable permanently or temporarily, access the stats for blocked queries, and more.

Occasionally, you'll want to upgrade your Pi-hole installation. The web interface includes an update notification when one is available. If you have enabled SSH, you can log in remotely, otherwise you'll have to reconnect the monitor and keyboard. When logged in, simply run the command `pihole -up`.

![](https://opensource.com/sites/default/files/u128651/pi-hole-update.png)

Have you used Pi-hole or another open source ad blocker? Please share your experience in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/2/block-ads-raspberry-pi

作者：[Ben Nuttall][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/bennuttall
[1]:https://pi-hole.net/
[2]:https://etcher.io/
[3]:https://opensource.com/article/17/3/how-write-sd-cards-raspberry-pi
[4]:https://www.raspberrypi.org/blog/a-security-update-for-raspbian-pixel/
[5]:https://www.raspberrypi.org/documentation/remote-access/ssh/README.md
[6]:https://discourse.pi-hole.net/t/how-do-i-configure-my-devices-to-use-pi-hole-as-their-dns-server/245
[7]:https://opensource.com/
[8]:https://pi-hole.net/pages-to-test-ad-blocking-performance/
