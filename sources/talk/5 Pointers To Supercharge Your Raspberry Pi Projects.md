这年头，我先占个坑：）第一次
[sailing]
5 Pointers To Supercharge Your Raspberry Pi Projects
================================================================================
> From SSH to port forwarding, these advanced techniques will ease Raspberry Pi development.

You’re in command of the command line. You’re not a noob at setting up NOOBS. Slowly but surely, you’re learning your way around the affordable, credit card-size computer for DIY tinkering, Raspberry Pi.

> See also: [The Quantified Fish: How My Aquarium Uses Raspberry Pi][1]

However, there’s a steep jump-off point between the basics and the intermediate stuff. When you move from “setting up your Pi” tutorials to stuff like “building a media server,” the pre-project requirements start to get a little dicey. Many intermediate Pi tutorials, including some of the ones here on ReadWrite, assume a few things about your Raspberry Pi setup.

Not every project will require all of the techniques suggested here, but knowing these procedures will make projects that do require them go much more smoothly later. 

When you’re ready to go beyond the basics, here are some things you can do to prepare your Raspberry Pi for any pre-requirements that a tutorial could throw at you. 

### 1) Using SSH ###

SSH, which stands for [Secure Shell][2], is a cryptographic network protocol that lets you securely transfer data between your computer and your Raspberry Pi. Projects might require it so you can control your Raspberry Pi from your computer's command line without hooking it up to a monitor or keyboard.  

SSH now comes pre-installed in Raspberry Pi operating system [Raspbian][3], so if you have installed the latest or close-to-latest version of NOOBS, you already have it. 

To use SSH, first you need your Pi’s IP address. Boot your Pi to the command line and type:

    sudo ifconfig

[Three paragraphs will appear][4]. Your IP address will show up in either the first or the third line, depending on whether your Raspberry Pi is hooked up to an ethernet cable or via a wifi adaptor. If it's ethernet, look in the first paragraph, which starts with "eth0." If it's wifi, look in the third paragraph, which starts with "wlan0."

Either way, you'll see the words “inet addr” followed by an IP—something like 192.168.2.2, a pretty common default IP address that we’ll use for the duration of this article. 

Now you have the address that'll allow you to access the Pi from your computer. If you’re on a Mac, you already have built-in SSH. Launch the Terminal application and type:

    ssh pi@192.168.2.2

It’ll ask for your password. By default, this is always "raspberry." If you’ve changed it to something else, use that instead. Now, you’re in! 

If you’re on a PC, there’s an extra step. 

![](http://readwrite.com/files/putty2.jpg)

Download and run [PuTTY][5] or another SSH client for Windows. Enter your IP address in the field, as shown in the above screenshot. Keep the default port at 22. Hit enter, and PuTTY will open a terminal window which will prompt you for your username and password. Fill those in, and begin working remotely on your Pi.

### 2) Remote Desktop Your Raspberry Pi ###

SSH is great for remote controlling your Pi from the command line. But what if you’d like to work off of its Graphical User Interface (GUI)? Fortunately, this is already built in for Macs and PCs.

On your Raspberry Pi’s command line, (and yes, you can do this with SSH), type: 

    sudo apt-get install xrdp 

Xrdp is a [daemon][6], a computer process that runs in the background that can support Microsoft Remote Desktop Client on both Mac and PC. Once it's installed on your Raspberry Pi, your Mac or PC will be able to access it through the client. 

Search your computer for a program called Remote Desktop Client. It’s not exactly hidden per se, but it’s not stored in your application folder. 

![](http://readwrite.com/files/Screen%20Shot%202014-04-07%20at%2010.14.13%20PM.png)

Input the IP address when prompted. Next, an xrdp window will pop up, prompting you for your username and password. 

![](http://readwrite.com/files/Screen%20Shot%202014-04-07%20at%2010.14.31%20PM.png)

If all goes well, you’ll see your Raspberry Pi’s desktop in a window on your computer screen.

![](http://readwrite.com/files/Screen%20Shot%202014-04-07%20at%2010.14.48%20PM.png)

### 3) Static IP For Your Pi On The Home Network ###

That Raspberry Pi IP we found earlier (in Step 1) may work for now, but there’s no guarantee your router will keep assigning the same IP address to your Pi forever. That means the other computers on your network won’t know which IP address the Pi lives at. So how do you assign it a static IP instead of having to use the “sudo ifconfig” command every few days, or worse, hours? 

Predictably, we begin with "ifconfig." So type:

    sudo ifconfig

Get a pen and paper ready, and record the following three addresses [listed after eth0][7] (The comments after the hashes are my descriptions. They won't show up in the code.):

    inet addr: 192.168.2.2 # Pi's Current IP Address

    Bcast: 192.168.0.255 # The Broadcast IP Range

    Mask: 255.255.255.0 # Subnet Mask Address

You still need two more pieces of information. So type the following line to get the Gateway and Destination addresses:

    netstat -nr

Next, go to your router’s configuration. (How you do this is dependent on which router you have, so check the manual.) Find out which addresses the Dynamic Host Configuration Protocol (DHCP) is giving out to your devices. These are off-limits addresses, since the protocol is already using them. So pick one that isn’t being used—for example, 192.168.2.2. Your router may allow you to reserve an unused IP address and assign it to a local device like the Raspberry Pi. (If you have a Belkin router, this is probably the case.) **If so, you can stop here**.

If not, you need to let the Raspberry Pi know what its new IP address is. We’ll do this by editing a configuration file on the Pi in the nano text editor:

    sudo nano /etc/network/interfaces

Change the line “iface eth0 inet dhcp” to “iface eth0 inet static” to inform it that it’s now static.

Then enter the following, but replace the X's with the addresses you copied down earlier! The top address is the one we’ve decided to assign after looking at what our DHCP wasn’t already using. 

    address 192.168.2.2
    
    netmask XXX.XXX.XXX.X
    
    network XXX.XXX.X.X
    
    broadcast XXX.XXX.X.X
    
    gateway XXX.XXX.X.X

Reboot the Raspberry Pi with “sudo reboot” and run “ifconfig” one more time. Your new static settings should appear! 

### 4) Forwarding Ports To Raspberry Pi ###

Some Pi projects may require you forward a specific Internet port to your Raspberry Pi. Ports are virtual pathways where information travels on the Internet. You sometimes need to forward a port in order to make a computer, like the Raspberry Pi, accessible to the Internet even if it’s behind a router. It's kind of like dialing an extension on a phone network.

Port forwarding can be used for projects like a [Raspberry Pi web server][8], Voice Over IP on the Pi, or simply for peer-to-peer downloading. There are 65,000+ ports to choose from, so you can assign a different port for traffic for every Raspberry Pi project you do. 

Some ports are default for certain things. Port 80 is default for HTML pages. Port 21 is default for FTP (File Transfer Protocol) transferring. Port 1194 is default for setting up a VPN server. So a lot of the time, you can just go with whichever port is set as the default. 

The way to set up port forwarding is entirely dependent on your router, so it’s difficult to create a tutorial for port forwarding beyond [what it actually does][9]. Read the documentation that comes with your router in order to customize and define ports to forward. 

Here are some port forwarding tutorials for major router manufacturers:

- [Belkin][10]
- [Netgear][11]
- [Linksys][12]

### 5) Static IP For Your Pi On The Internet ###

Once again, if your ISP already gives you a static IP address, you don't need to worry about this section.

We’ve already set up a static internal IP address for the Raspberry Pi, which means computers inside your local network will always know where to find your Pi. But what about projects that require Raspberry Pi to be connected to the Internet? If you want to build a Web server with your Raspberry Pi, people outside your network need to know where your Pi lives, which means setting a public IP that always looks the same.

I say “looks the same” because we’re really setting up a pseudo-static IP. Your ISP will continue to change the address as usual. So every time somebody connects to your Pi, the script we’re about to write will say, “Looks like the Pi has moved! Let me redirect you to the new address."

We do this with a [Dynamic DNS][13] (DDNS), which maintains a name server that gets updated in real-time, and [DDClient][14], a program that will correspond with DDNS directly from your Pi. 

First sign up for a free dynamic host service like [DNS Dynamic][15]. Follow the instructions and create a new nameserver like Yourserver.dnsdynamic.com. 

Now go to the command line on your Raspberry Pi and install DDClient with the following line:

    sudo apt-get install ddclient

We need to edit the DDClient configuration with our DDNS's new name server:

    sudo nano /etc/ddclient/ddclient.conf 

Every service will have slightly different configuration, but the DDNS website should tell you what you need to do to configure this file. A standard configuration for DNS Dynamic, for example, [goes like this][16]. Copy and paste it in. 

Your ISP isn’t going to just stop updating the Raspberry Pi’s IP address because of this file, however, so we need to put a daemon at the very top of this script to tell it to continually check whether or not the IP address has changed. 

    daemon=600
    # check every 600 seconds

This one checks every 10 minutes, which is just good practice. If you set it up to check every second, your dynamic service may not appreciate it because you'll be literally spamming their servers. Press Control + X to save and exit this configuration file. 

After this, type:

    ddclient

> See also: [12 Cool Projects For Your Raspberry Pi][17]

Simply typing the name of the program will run it. It’ll continue to run as long as your Raspberry Pi is turned on. If you reboot your Pi, write “ddclient” to start running it again. 

Now your Raspberry Pi is tricked out and ready for more advanced tutorials. Have fun and learn lots! 

--------------------------------------------------------------------------------

via: http://readwrite.com/2014/04/09/raspberry-pi-projects-ssh-remote-desktop-static-ip-tutorial#feed=/hack&awesm=~oB1b7zvteUQGOV

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://readwrite.com/2014/03/04/raspberry-pi-quantified-fish-acquarium#awesm=~oAWz5ZbkX6w7ZL
[2]:http://en.wikipedia.org/wiki/Secure_Shell
[3]:http://www.raspbian.org/
[4]:https://learn.adafruit.com/adafruits-raspberry-pi-lesson-3-network-setup/finding-your-pis-ip-address
[5]:http://www.chiark.greenend.org.uk/~sgtatham/putty/
[6]:http://en.wikipedia.org/wiki/Daemon_(computing)
[7]:https://www.modmypi.com/blog/tutorial-how-to-give-your-raspberry-pi-a-static-ip-address
[8]:http://raspberrywebserver.com/serveradmin/get-your-raspberry-pi-web-site-on-line.html
[9]:http://portforward.com/help/portforwarding.htm
[10]:http://www.belkin.com/us/support-article?articleNum=10790
[11]:http://kb.netgear.com/app/answers/detail/a_id/24046/~/how-do-i-configure-port-forwarding-on-routers-with-the-netgear-genie-interface%3F
[12]:http://kb.linksys.com/Linksys/ukp.aspx?pid=80&vw=1&articleid=21470
[13]:http://en.wikipedia.org/wiki/Dynamic_DNS
[14]:http://sourceforge.net/p/ddclient/wiki/Home/
[15]:https://www.dnsdynamic.org/
[16]:http://dnsdynamic.blog.com/2011/06/26/using-ddclient-with-dnsdynamic/
[17]:http://readwrite.com/2014/01/21/raspberry-pi-great-projects#feed=/search?keyword=raspberry+pi&awesm=~oAWzuuuChYu9vm
