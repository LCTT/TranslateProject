translating by chenxinlong
How to set up a personal web server with a Raspberry Pi
============================================================

 ![How to set up a personal web server with a Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/lightbulb_computer_person_general_.png?itok=ZY3UuQQa "How to set up a personal web server with a Raspberry Pi") 
>Image by : opensource.com

A personal web server is "the cloud," except you own and control it as opposed to a large corporation.

Owning a little cloud has a lot of benefits, including customization, free storage, free Internet services, a path into open source software, high-quality security, full control over your content, the ability to make quick changes, a place to experiment with code, and much more. Most of these benefits are immeasurable, but financially these benefits can save you over $100 per month.

 ![Building your own web server with Raspberry Pi](https://opensource.com/sites/default/files/1-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Building your own web server with Raspberry Pi") 

Image by Mitchell McLaughlin, CC BY-SA 4.0

I could have used AWS, but I prefer complete freedom, full control over security, and learning how things are built.

*   Self web-hosting: No BlueHost or DreamHost
*   Cloud storage: No Dropbox, Box, Google Drive, Microsoft Azure, iCloud, or AWS
*   On-premise security
*   HTTPS: Let’s Encrypt
*   Analytics: Google
*   OpenVPN: Do not need private Internet access (at an estimated $7 per month)

Things I used:

*   Raspberry Pi 3 Model B
*   MicroSD Card (32GB recommended, [Raspberry Pi Compatible SD Cards][1])
*   USB microSD card reader
*   Ethernet cable
*   Router connected to Wi-Fi
*   Raspberry Pi case
*   Amazon Basics MicroUSB cable
*   Apple wall charger
*   USB mouse
*   USB keyboard
*   HDMI cable
*   Monitor (with HDMI input)
*   MacBook Pro

### Step 1: Setting up the Raspberry Pi

Download the most recent release of Raspbian (the Raspberry Pi operating system). [Raspbian Jessie][6] ZIP version is ideal [1]. Unzip or extract the downloaded file. Copy it onto the SD card. [Pi Filler][7] makes this process easy. [Download Pi Filer 1.3][8] or the most recent version. Unzip or extract the downloaded file and open it. You should be greeted with this prompt:

 ![Pi Filler prompt](https://opensource.com/sites/default/files/2-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Pi Filler prompt") 

Make sure the USB card reader has NOT been inserted yet. If it has, eject it. Proceed by clicking Continue. A file explorer should appear. Locate the uncompressed Raspberry Pi OS file from your Mac or PC and select it. You should see another prompt like the one pictured below:

 ![USB card reader prompt](https://opensource.com/sites/default/files/3-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "USB card reader") 

Insert the MicroSD card (32GB recommended, 16GB minimum) into the USB MicroSD Card Reader. Then insert the USB reader into the Mac or PC. You can rename the SD card to "Raspberry" to distinguish it from others. Click Continue. Make sure the SD card is empty. Pi Filler will  _erase_  all previous storage at runtime. If you need to back up the card, do so now. When you are ready to continue, the Raspbian OS will be written to the SD card. It should take between one to three minutes. Once the write is completed, eject the USB reader, remove the SD card, and insert it into the Raspberry Pi SD card slot. Give the Raspberry Pi power by plugging the power cord into the wall. It should start booting up. The Raspberry Pi default login is:

**username: pi
password: raspberry**

When the Raspberry Pi has completed booting for the first time, a configuration screen titled "Setup Options" should appear like the image below [2]:

 ![Raspberry Pi software configuration setup](https://opensource.com/sites/default/files/4-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Raspberry Pi software configuration setup") 

Select the "Expand Filesystem" option and hit the Enter key [3]. Also, I recommend selecting the second option, "Change User Password." It is important for security. It also personalizes your Raspberry Pi.

Select the third option in the setup options list, "Enable Boot To Desktop/Scratch" and hit the Enter key. It will take you to another window titled "Choose boot option" as shown in the image below.

 ![Choose boot option](https://opensource.com/sites/default/files/5-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Choose boot option") 

In the "Choose boot option" window, select the second option, "Desktop log in as user 'pi' at the graphical desktop" and hit the Enter button [4]. Once this is done you will be taken back to the "Setup Options" page. If not, select the "OK" button at the bottom of this window and you will be taken back to the previous window.

Once both these steps are done, select the "Finish" button at the bottom of the page and it should reboot automatically. If it does not, then use the following command in the terminal to reboot.

**$ sudo reboot**

After the reboot from the previous step, if everything went well, you will end up on the desktop similar to the image below.

 ![Raspberry Pi desktop](https://opensource.com/sites/default/files/6-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Raspberry Pi desktop") 

Once you are on the desktop, open a terminal and enter the following commands to update the firmware of the Raspberry Pi.

```
$ sudo apt-get update

$ sudo apt-get upgrade-y

$ sudo apt-get dist-upgrade -y

$ sudo rpi-update
```

This may take a few minutes. Now the Raspberry Pi is up-to-date and running.

### Step 2: Configuring the Raspberry Pi

SSH, which stands for Secure Shell, is a cryptographic network protocol that lets you securely transfer data between your computer and your Raspberry Pi. You can control your Raspberry Pi from your Mac's command line without a monitor or keyboard.

To use SSH, first, you need your Pi's IP address. Open the terminal and type:

```
$ sudo ifconfig
```

If you are using Ethernet, look at the "eth0" section. If you are using Wi-Fi, look at the "wlan0" section.

Find "inet addr" followed by an IP address—something like 192.168.1.115, a common default IP I will use for the duration of this article.

With this address, open terminal and type:

```
$ ssh pi@192.168.1.115
```

For SSH on PC, see footnote [5].

Enter the default password "raspberry" when prompted, unless you changed it.

You are now logged in via SSH.

### Remote desktop

Using a GUI (graphical user interface) is sometimes easier than a command line. On the Raspberry Pi's command line (using SSH) type:

```
$ sudo apt-get install xrdp
```

Xrdp supports the Microsoft Remote Desktop Client for Mac and PC.

On Mac, navigate to the app store and search for "Microsoft Remote Desktop." Download it. (For a PC, see footnote [6].)

After installation, search your Mac for a program called "Microsoft Remote Desktop." Open it. You should see this:

 ![Microsoft Remote Desktop](https://opensource.com/sites/default/files/7-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Microsoft Remote Desktop") 

Image by Mitchell McLaughlin, CC BY-SA 4.0

Click "New" to set up a remote connection. Fill in the blanks as shown below.

 ![Setting up a remote connection](https://opensource.com/sites/default/files/8-image_by_mitchell_mclaughlin_cc_by-sa_4.0.png "Setting up a remote connection") 

Image by Mitchell McLaughlin, CC BY-SA 4.0

Save it by exiting out of the "New" window.

You should now see the remote connection listed under "My Desktops." Double click it.

After briefly loading, you should see your Raspberry Pi desktop in a window on your screen, which looks like this:

 ![Raspberry Pi desktop](https://opensource.com/sites/default/files/6-image_by_mitchell_mclaughlin_cc_by-sa_4.0_0.png "Raspberry Pi desktop") 

Perfect. Now, you don't need a separate mouse, keyboard, or monitor to control the Pi. This is a much more lightweight setup.

### Static local IP address

Sometimes the local IP address 192.168.1.115 will change. We need to make it static. Type:

```
$ sudo ifconfig
```

Write down from the "eth0" section or the "wlan0" section, the "inet addr" (Pi's current IP), the "bcast" (the broadcast IP range), and the "mask" (subnet mask address). Then, type:

```
$ netstat -nr
```

Write down the "destination" and the "gateway/network."

 ![Setting up a local IP address](https://opensource.com/sites/default/files/setting_up_local_ip_address.png "Setting up a local IP address") 

The cumulative records should look something like this:

```
net address 192.168.1.115
bcast 192.168.1.255
mask 255.255.255.0
gateway 192.168.1.1
network 192.168.1.1
destination 192.168.1.0
```

With this information, you can set a static internal IP easily. Type:

```
$ sudo nano /etc/dhcpcd.conf
```

Do not use **/etc/network/interfaces**.

Then all you need to do is append this to the bottom of the file, substituting the correct IP address you want.

```
interface eth0
static ip_address=192.168.1.115
static routers=192.168.1.1
static domain_name_servers=192.168.1.1
```

Once you have set the static internal IP address, reboot the Raspberry Pi with:

```
$ sudo reboot
```

After rebooting, from terminal type:

```
$ sudo ifconfig
```

Your new static settings should appear for your Raspberry Pi.

### Static global IP address

If your ISP (internet service provider) has already given you a static external IP address, you can skip ahead to the port forwarding section. If not, continue reading.

You have set up SSH, a remote desktop, and a static internal IP address, so now computers inside the local network will know where to find the Pi. But you still can't access your Raspberry Pi from outside the local Wi-Fi network. You need your Raspberry Pi to be accessible publicly from anywhere on the Internet. This requires a static external IP address [7].

It can be a sensitive process initially. Call your ISP and request a static external (sometimes referred to as static global) IP address. The ISP holds the decision-making power, so I would be extremely careful dealing with them. They may refuse your static external IP address request. If they do, you can't fault the ISP because there is a legal and operational risk with this type of request. They particularly do not want customers running medium- or large-scale Internet services. They might explicitly ask why you need a static external IP address. It is probably best to be honest and tell them you plan on hosting a low-traffic personal website or a similar small not-for-profit internet service. If all goes well, they should open a ticket and call you in a week or two with an address.

### Port forwarding

This newly obtained static global IP address your ISP assigned is for accessing the router. The Raspberry Pi is still unreachable. You need to set up port forwarding to access the Raspberry Pi specifically.

Ports are virtual pathways where information travels on the Internet. You sometimes need to forward a port in order to make a computer, like the Raspberry Pi, accessible to the Internet because it is behind a network router. A YouTube video titled [What is TCP/IP, port, routing, intranet, firewall, Internet][9] by VollmilchTV helped me visually understand ports.

Port forwarding can be used for projects like a Raspberry Pi web server, or applications like VoIP or peer-to-peer downloading. There are [65,000+ ports][10] to choose from, so you can assign a different port for every Internet application you build.

The way to set up port forwarding can depend on your router. If you have a Linksys, a YouTube video titled  _[How to go online with your Apache Ubuntu server][2]_  by Gabriel Ramirez explains how to set it up. If you don't have a Linksys, read the documentation that comes with your router in order to customize and define ports to forward.

You will need to port forward for SSH as well as the remote desktop.

Once you believe you have port forwarding configured, check to see if it is working via SSH by typing:

```
$ ssh pi@your_global_ip_address
```

It should prompt you for the password.

Check to see if port forwarding is working for the remote desktop as well. Open Microsoft Remote Desktop. Your previous remote connection settings should be saved, but you need to update the "PC name" field with the static external IP address (for example, 195.198.227.116) instead of the static internal address (for example, 192.168.1.115).

Now, try connecting via remote desktop. It should briefly load and arrive at the Pi's desktop.

 ![Raspberry Pi desktop](https://opensource.com/sites/default/files/6-image_by_mitchell_mclaughlin_cc_by-sa_4.0_1.png "Raspberry Pi desktop") 

Good job. The Raspberry Pi is now accessible from the Internet and ready for advanced projects.

As a bonus option, you can maintain two remote connections to your Pi. One via the Internet and the other via the LAN (local area network). It's easy to set up. In Microsoft Remote Desktop, keep one remote connection called "Pi Internet" and another called "Pi Local." Configure Pi Internet's "PC name" to the static external IP address—for example, 195.198.227.116\. Configure Pi Local's "PC name" to the static internal IP address—for example, 192.168.1.115\. Now, you have the option to connect globally or locally.

If you have not seen it already, watch  _[How to go online with your Apache Ubuntu server][3]_  by Gabriel Ramirez as a transition into Project 2\. It will show you the technical architecture behind your project. In our case, you are using a Raspberry Pi instead of an Ubuntu server. The dynamic DNS sits between the domain company and your router, which Ramirez omits. Beside this subtlety, the video is spot on when explaining visually how the system works. You might notice this tutorial covers the Raspberry Pi setup and port forwarding, which is the server-side or back end. See the original source for more advanced projects covering the domain name, dynamic DNS, Jekyll (static HTML generator), and Apache (web hosting), which is the client-side or front end.

### Footnotes

[1] I do not recommend starting with the NOOBS operating system. I prefer starting with the fully functional Raspbian Jessie operating system.

[2] If "Setup Options" does not pop up, you can always find it by opening Terminal and executing this command:

```
$ sudo-rasps-config
```

[3] We do this to make use of all the space present on the SD card as a full partition. All this does is expand the operating system to fit the entire space on the SD card, which can then be used as storage memory for the Raspberry Pi.

[4] We do this because we want to boot into a familiar desktop environment. If we do not do this step, the Raspberry Pi boots into a terminal each time with no GUI.

[5]

 ![PuTTY configuration](https://opensource.com/sites/default/files/putty_configuration.png "PuTTY configuration") 

[Download and run PuTTY][11] or another SSH client for Windows. Enter your IP address in the field, as shown in the above screenshot. Keep the default port at 22\. Hit Enter, and PuTTY will open a terminal window, which will prompt you for your username and password. Fill those in, and begin working remotely on your Pi.

[6] If it is not already installed, download [Microsoft Remote Desktop][12]. Search your computer for Microsoft Remote Desktop. Run it. Input the IP address when prompted. Next, an xrdp window will pop up, prompting you for your username and password.

[7] The router has a dynamically assigned external IP address, so in theory, it can be reached from the Internet momentarily, but you'll need the help of your ISP to make it permanently accessible. If this was not the case, you would need to reconfigure the remote connection on each use.

 _For the original source, visit [Mitchell McLaughlin's Full-Stack Computer Projects][4]._

--------------------------------------------------------------------------------

作者简介：

Mitchell McLaughlin - I'm an open-web contributor and developer. My areas of interest are broad, but specifically I enjoy open source software/hardware, bitcoin, and programming in general. I reside in San Francisco. My work experience in the past has included brief stints at GoPro and Oracle.

-------------


via: https://opensource.com/article/17/3/building-personal-web-server-raspberry-pi-3

作者：[Mitchell McLaughlin ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/mitchm
[1]:http://elinux.org/RPi_SD_cards
[2]:https://www.youtube.com/watch?v=i1vB7JnPvuE#t=07m08s
[3]:https://www.youtube.com/watch?v=i1vB7JnPvuE#t=07m08s
[4]:https://mitchellmclaughlin.com/server.html
[5]:https://opensource.com/article/17/3/building-personal-web-server-raspberry-pi-3?rate=Zdmkgx8mzy9tFYdVcQZSWDMSy4uDugnbCKG4mFsVyaI
[6]:https://www.raspberrypi.org/downloads/raspbian/
[7]:http://ivanx.com/raspberrypi/
[8]:http://ivanx.com/raspberrypi/files/PiFiller.zip
[9]:https://www.youtube.com/watch?v=iskxw6T1Wb8
[10]:https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers
[11]:http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
[12]:https://www.microsoft.com/en-us/store/apps/microsoft-remote-desktop/9wzdncrfj3ps
[13]:https://opensource.com/user/41906/feed
[14]:https://opensource.com/article/17/3/building-personal-web-server-raspberry-pi-3#comments
[15]:https://opensource.com/users/mitchm
