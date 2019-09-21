Plasma Mobile Could Give Life to a Mobile Linux Experience
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/plasma-mobile_0.png?itok=uUIQFRcm)

In the past few years, it’s become clear that, outside of powering Android, Linux on mobile devices has been a resounding failure. Canonical came close, even releasing devices running Ubuntu Touch. Unfortunately, the idea of [Scopes][1]was doomed before it touched down on its first piece of hardware and subsequently died a silent death.

The next best hope for mobile Linux comes in the form of the [Samsung DeX][2] program. With DeX, users will be able to install an app (Linux On Galaxy—not available yet) on their Samsung devices, which would in turn allow them to run a full-blown Linux distribution. The caveat here is that you’ll be running both Android and Linux at the same time—which is not exactly an efficient use of resources. On top of that, most Linux distributions aren’t designed to run on such small form factors. The good news for DeX is that, when you run Linux on Galaxy and dock your Samsung device to DeX, that Linux OS will be running on your connected monitor—so form factor issues need not apply.

Outside of those two options, a pure Linux on mobile experience doesn’t exist. Or does it?

You may have heard of the [Purism Librem 5][3]. It’s a crowdfunded device that promises to finally bring a pure Linux experience to the mobile landscape. This device will be powered by a i.MX8 SoC chip, so it should run most any Linux operating system.

Out of the box, the device will run an encrypted version of [PureOS][4]. However, last year Purism and KDE joined together to create a mobile version of the KDE desktop that could run on the Librem 5. Recently [ISOs were made available for a beta version of Plasma Mobile][5] and, judging from first glance, they’re onto something that makes perfect sense for a mobile Linux platform. I’ve booted up a live instance of Plasma Mobile to kick the tires a bit.

What I saw seriously impressed me. Let’s take a look.

### Testing platform

Before you download the ISO and attempt to fire it up as a VirtualBox VM, you should know that it won’t work well. Because Plasma Mobile uses Wayland (and VirtualBox has yet to play well with that particular X replacement), you’ll find VirtualBox VM a less-than-ideal platform for the beta release. Also know that the Calamares installer doesn’t function well either. In fact, I have yet to get the OS installed on a non-mobile device. And since I don’t own a supported mobile device, I’ve had to run it as a live session on either a laptop or an [Antsle][6] antlet VM every time.

### What makes Plasma Mobile special?

This could be easily summed up by saying, Plasma Mobile got it all right. Instead of Canonical re-inventing a perfectly functioning wheel, the developers of KDE simply re-tooled the interface such that a full-functioning Linux distribution (complete with all the apps you’ve grown to love and depend upon) could work on a smaller platform. And they did a spectacular job. Even better, they’ve created an interface that any user of a mobile device could instantly feel familiar with.

What you have with the Plasma Mobile interface (Figure 1) are the elements common to most Android home screens:

  * Quick Launchers

  * Notification Shade

  * App Drawer

  * Overview button (so you can go back to a previously used app, still running in memory)

  * Home button




![KDE mobile][8]

Figure 1: The Plasma Mobile desktop interface.

[Used with permission][9]

Because KDE went this route with the UX, it means there’s zero learning curve. And because this is an actual Linux platform, it takes that user-friendly mobile interface and overlays it onto a system that allows for easy installation and usage of apps like:

  * GIMP

  * LibreOffice

  * Audacity

  * Clementine

  * Dropbox

  * And so much more




Unfortunately, without being able to install Plasma Mobile, you cannot really kick the tires too much, as the live user doesn’t have permission to install applications. However, once Plasma Mobile is fully installed, the Discover software center will allow you to install a host of applications (Figure 2).


![Discover center][11]

Figure 2: The Discover software center on Plasma Mobile.

[Used with permission][9]

Swipe up (or scroll down—depending on what hardware you’re using) to reveal the app drawer, where you can launch all of your installed applications (Figure 3).

![KDE mobile][13]

Figure 3: The Plasma Mobile app drawer ready to launch applications.

[Used with permission][9]

Open up a terminal window and you can take care of standard Linux admin tasks, such as using SSH to log into a remote server. Using apt, you can install all of the developer tools you need to make Plasma Mobile a powerful development platform.

We’re talking serious mobile power—either from a phone or a tablet.

### A ways to go

Clearly Plasma Mobile is still way too early in development for it to be of any use to the average user. And because most virtual machine technology doesn’t play well with Wayland, you’re likely to get too frustrated with the current ISO image to thoroughly try it out. However, even without being able to fully install the platform (or get full usage out of it), it’s obvious KDE and Purism are going to have the ideal platform that will put Linux into the hands of mobile users.

If you want to test the waters of Plasma Mobile on an actual mobile device, a handy list of supported hardware can be found [here][14] (for PostmarketOS) or [here][15] (for Halium). If you happen to be lucky enough to have a device that also includes Wi-Fi support, you’ll find you get more out of testing the environment.

If you do have a supported device, you’ll need to use either [PostmarketOS][16] (a touch-optimized, pre-configured Alpine Linux that can be installed on smartphones and other mobile devices) or [Halium][15] (an application that creates an minimal Android layer which allows a new interface to interact with the Android kernel). Using Halium further limits the number of supported devices, as it has only been built for select hardware. However, if you’re willing, you can build your own Halium images (documentation for this process is found [here][17]). If you want to give PostmarketOS a go, [here are the necessary build instructions][18].

Suffice it to say, Plasma Mobile isn’t nearly ready for mass market. If you’re a Linux enthusiast and want to give it a go, let either PostmarketOS or Halium help you get the operating system up and running on your device. Otherwise, your best bet is to wait it out and hope Purism and KDE succeed in bringing this oustanding mobile take on Linux to the masses.

Learn more about Linux through the free ["Introduction to Linux" ][19]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/2/plasma-mobile-could-give-life-mobile-linux-experience

作者：[JACK WALLEN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://launchpad.net/unity-scopes
[2]:http://www.samsung.com/global/galaxy/apps/samsung-dex/
[3]:https://puri.sm/shop/librem-5/
[4]:https://www.pureos.net/
[5]:http://blog.bshah.in/2018/01/26/trying-out-plasma-mobile/
[6]:https://antsle.com/
[8]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kdemobile_1.jpg?itok=EK3_vFVP (KDE mobile)
[9]:https://www.linux.com/licenses/category/used-permission
[11]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kdemobile_2.jpg?itok=CiUQ-MnB (Discover center)
[13]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/kdemobile_3.jpg?itok=i6V8fgK8 (KDE mobile)
[14]:http://blog.bshah.in/2018/02/02/trying-out-plasma-mobile-part-two/
[15]:https://github.com/halium/projectmanagement/issues?q=is%3Aissue+is%3Aopen+label%3APorts
[16]:https://postmarketos.org/
[17]:http://docs.halium.org/en/latest/
[18]:https://wiki.postmarketos.org/wiki/Installation_guide
[19]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
