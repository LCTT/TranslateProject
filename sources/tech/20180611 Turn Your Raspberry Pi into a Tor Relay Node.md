Turn Your Raspberry Pi into a Tor Relay Node
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/tor-onion-router.jpg?itok=6WUl0ElH)

If you’re anything like me, you probably got yourself a first- or second-generation Raspberry Pi board when they first came out, played with it for a while, but then shelved it and mostly forgot about it. After all, unless you’re a robotics enthusiast, you probably don’t have that much use for a computer with a pretty slow processor and 256 megabytes of RAM. This is not to say that there aren’t cool things you can do with one of these, but between work and other commitments, I just never seem to find the right time for some good old nerding out.

However, if you would like to put it to good use without sacrificing too much of your time or resources, you can turn your old Raspberry Pi into a perfectly functioning Tor relay node.

### What is a Tor Relay node

You have probably heard about the [Tor project][1] before, but just in case you haven’t, here’s a very quick summary. The name “Tor” stands for “The Onion Router” and it is a technology created to combat online tracking and other privacy violations.

Everything you do on the Internet leaves a set of digital footprints in every piece of equipment that your IP packets traverse: all of the switches, routers, load balancers and destination websites log the IP address from which your session originated and the IP address of the internet resource you are accessing (and often its hostname, [even when using HTTPS][2]). If you’re browsing from home, then your IP can be directly mapped to your household. If you’re using a VPN service ([as you should be][3]), then your IP can be mapped to your VPN provider, and then they are the ones who can map it to your household. In any case, odds are that someone somewhere is assembling an online profile on you based on the sites you visit and how much time you spend on each of them. Such profiles are then sold, aggregated with matching profiles collected from other services, and then monetized by ad networks. At least, that’s the optimist’s view of how that data is used -- I’m sure you can think of many examples of how your online usage profiles can be used against you in much more nefarious ways.

The Tor project attempts to provide a solution to this problem by making it impossible (or, at least, unreasonably difficult) to trace the endpoints of your IP session. Tor achieves this by bouncing your connection through a chain of anonymizing relays, consisting of an entry node, relay node, and exit node:

  1. The **entry node** only knows your IP address, and the IP address of the relay node, but not the final destination of the request;

  2. The **relay node** only knows the IP address of the entry node and the IP address of the exit node, and neither the origin nor the final destination

  3. The **exit node** **** only knows the IP address of the relay node and the final destination of the request; it is also the only node that can decrypt the traffic before sending it over to its final destination




Relay nodes play a crucial role in this exchange because they create a cryptographic barrier between the source of the request and the destination. Even if exit nodes are controlled by adversaries intent on stealing your data, they will not be able to know the source of the request without controlling the entire Tor relay chain.

As long as there are plenty of relay nodes, your privacy when using the Tor network remains protected -- which is why I heartily recommend that you set up and run a relay node if you have some home bandwidth to spare.

#### Things to keep in mind regarding Tor relays

A Tor relay node only receives encrypted traffic and sends encrypted traffic -- it never accesses any other sites or resources online, so you do not need to worry that someone will browse any worrisome sites directly from your home IP address. Having said that, if you reside in a jurisdiction where offering anonymity-enhancing services is against the law, then, obviously, do not operate your own Tor relay. You may also want to check if operating a Tor relay is against the terms and conditions of your internet access provider.

### What you will need

  * A Raspberry Pi (any model/generation) with some kind of enclosure

  * An SD card with [Raspbian Stretch Lite][4]

  * An ethernet cable

  * A micro-USB cable for power

  * A keyboard and an HDMI-capable monitor (to use during the setup)




This guide will assume that you are setting this up on your home connection behind a generic cable or ADSL modem router that performs NAT translation (and it almost certainly does). Most of them have a USB port you can use to power up your Raspberry Pi, and if you’re only using the wifi functionality of the router, then it should have a free ethernet port for you to plug into. However, before we get to the point where we can set-and-forget your Raspberry Pi, we’ll need to set it up as a Tor relay node, for which you’ll need a keyboard and a monitor.

### The bootstrap script

I’ve adapted a popular Tor relay node bootstrap script for use with Raspbian Stretch -- you can find it in my GitHub repository here: <https://github.com/mricon/tor-relay-bootstrap-rpi>. Once you have booted up your Raspberry Pi and logged in with the default “pi” user, do the following:
```
sudo apt-get install -y git
git clone https://github.com/mricon/tor-relay-bootstrap-rpi
cd tor-relay-bootstrap-rpi
sudo ./bootstrap.sh

```

Here is what the script will do:

  1. Install the latest OS updates to make sure your Pi is fully patched

  2. Configure your system for automated unattended updates, so you automatically receive security patches when they become available

  3. Install Tor software

  4. Tell your NAT router to forward the necessary ports to reach your relay (the ports we’ll use are 443 and 8080, since they are least likely to be filtered by your internet provider)




Once the script is done, you’ll need to configure the torrc file -- but first, decide how much bandwidth you’ll want to donate to Tor traffic. First, type “[Speed Test][5]” into Google and click the “Run Speed Test” button. You can disregard the “Download speed” result, as your Tor relay can only operate as fast as your maximum upload bandwidth.

Therefore, take the “Mbps upload” number, divide by 8 and multiply by 1024 to find out the bandwidth speed in Kilobytes per second. E.g. if you got 21.5 Mbps for your upload speed, then that number is:
```
21.5 Mbps / 8 * 1024 = 2752 KBytes per second

```

You’ll want to limit your relay bandwidth to about half that amount, and allow bursting to about three-quarters of it. Once decided, open /etc/tor/torrc using your favourite editor and tweak the bandwidth settings.
```
RelayBandwidthRate 1300 KBytes
RelayBandwidthBurst 2400 KBytes

```

Of course, if you’re feeling more generous, then feel free to put in higher numbers, though you don’t want to max out your outgoing bandwidth -- it will noticeably impact your day-to-day usage if these numbers are set too high.

While you have that file open, you should set two more things. First, the Nickname -- just for your own recordkeeping, and second the ContactInfo line, which should list a single email address. Since your relay will be running unattended, you should use an email address that you regularly check -- you will receive an alert from the “Tor Weather” service if your relay goes offline for longer than 48 hours.
```
Nickname myrpirelay
ContactInfo you@example.com

```

Save the file and reboot the system to start the Tor relay.

### Testing to make sure Tor traffic is flowing

If you would like to make sure that the relay is functioning, you can run the “arm” tool:
```
sudo -u debian-tor arm

```

It will take a while to start, especially on older-generation boards, but eventually it will show you a bar chart of incoming and outgoing traffic (or error messages that will help you troubleshoot your setup).

Once you are convinced that everything is functioning, you can unplug the keyboard and the monitor and relocate the Raspberry Pi into the basement where it will quietly sit and shuffle encrypted bits around. Congratulations, you’ve helped improve privacy and combat malicious tracking online!

Learn more about Linux through the free ["Introduction to Linux" ][6] course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2018/6/turn-your-raspberry-pi-tor-relay-node

作者：[Konstantin Ryabitsev][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/mricon
[1]:https://www.torproject.org/
[2]:https://en.wikipedia.org/wiki/Server_Name_Indication#Security_implications
[3]:https://www.linux.com/blog/2017/10/tips-secure-your-network-wake-krack
[4]:https://www.raspberrypi.org/downloads/raspbian/
[5]:https://www.google.com/search?q=speed+test
[6]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
