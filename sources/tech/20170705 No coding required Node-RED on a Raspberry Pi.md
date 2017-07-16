No coding required: Node-RED on a Raspberry Pi
============================================================

### Check out this tutorial to see how easy it is to set up hardware flows with Node-RED's drag-and-drop interface.

 
![No coding required: Node-RED on a Raspberry Pi](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/hardware_hammer_sign.jpg?itok=vh76LBib "No coding required: Node-RED on a Raspberry Pi")
Image by : 

Thomas Hawk on [Flickr][12]. [CC BY-NC 2.0][13]. Modified by Opensource.com

Node-RED is a programming tool that lets you quickly connect hardware devices using a browser-based editor. It comes with a wide range of nodes that can be used to build flows in a drag-and-drop manner, significantly reducing your development time. [Node-RED][14] is installed with Raspian Jessie for Raspberry Pi, and there is also an option to download Node-RED separately.

More on Raspberry Pi

*   [Our latest on Raspberry Pi][1]

*   [What is Raspberry Pi?][2]

*   [Getting started with Raspberry Pi][3]

*   [Send us your Raspberry Pi projects and tutorials][4]

To show you how it works, we'll build a simple tool using Node-RED to communicate with a cellular modem connected to a Raspberry Pi. With cellular modems, you can send/receive data from your Raspberry Pi over a cellular network. You can use one of the 3G/4G USB dongles commonly available through cellular network providers, or you can connect a development board with a 3G or 4G wireless modem.

Whether you're connecting with a USB dongle or a development board, the connection interface to the Raspberry Pi is through a USB port. In this tutorial, I'm connecting a [SIM900][15] development board to Raspberry Pi through a USB-to-serial converter cable.

### [node_red1.png][5]

![Connecting SIM900 to Raspberry Pi through a USB-to-serial converter cable](https://opensource.com/sites/default/files/u128651/node_red1.png "Connecting SIM900 to Raspberry Pi through a USB-to-serial converter cable")

The first step is to check that the SIM900 development board is connected to the Raspberry Pi.

### [node_red2a.png][6]

![Checking that the SIM900 development board is connected](https://opensource.com/sites/default/files/u128651/node_red2a.png "Checking that the SIM900 development board is connected")

The USB-to-serial adapter shows up here as one of the USB devices connected to the Raspberry Pi.

Next, check the USB port number the SIM900 board is connected to.

### [node_red3a.png][7]

![Checking the SIM900 board's USB port number](https://opensource.com/sites/default/files/u128651/node_red3a.png "Checking the SIM900 board's USB port number")

In the last line above, you can see that the SIM900 board (connected through the USB-to-serial converter) is connected to **ttyUSB0** on the Raspberry Pi. Now we're ready to start using Node-RED.

Launch Node-RED on the Raspberry Pi.

### [node_red4a.png][8]

![​​​​Launching Node-RED in Raspberry Pi](https://opensource.com/sites/default/files/u128651/node_red4a.png "​​​​Launching Node-RED in Raspberry Pi")

Download this [sample flow][16] and import it into Node-RED. Note that the flow file is a JSON representation of the graphical UI.

The imported flow should look like this in Node-RED:

### [node_red5.png][9]

![The imported flow in Node-RED](https://opensource.com/sites/default/files/u128651/node_red5.png "The imported flow in Node-RED")

Injection nodes set up [AT commands][17] required to query the modem. The **Add Newline**function node appends **\r\n** to the AT commands passed from the injection nodes. Output from **Add Newline** is then wired to the **Serial Out** node, which writes data to the serial port. The AT command response from the modem is read through the **Serial In** node, which outputs the response to the **Debug **window. Make sure the serial port number and port speed are configured in both the **Serial In** and **Serial Out** nodes.

Node-RED is an easy-to-use programming tool that can be used to quickly integrate and test hardware devices. As you can see from this tutorial, connecting and testing a cellular mode with Raspberry Pi using Node-RED required no coding at all.

For more information about Node-RED and other ways it can be used, visit [the project's website][18].

--------------------------------------------------------------------------------

作者简介：

Surya G - My interest is in software development for IOT projects especially those that uses cellular modems.


via: https://opensource.com/article/17/7/nodered-raspberrypi-hardware

作者：[ Surya G ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/gssm2m
[1]:https://opensource.com/tags/raspberry-pi?src=raspberry_pi_resource_menu1
[2]:https://opensource.com/resources/what-raspberry-pi?src=raspberry_pi_resource_menu2
[3]:https://opensource.com/article/16/12/getting-started-raspberry-pi?src=raspberry_pi_resource_menu3
[4]:https://opensource.com/article/17/2/raspberry-pi-submit-your-article?src=raspberry_pi_resource_menu4
[5]:https://opensource.com/file/359036
[6]:https://opensource.com/file/359086
[7]:https://opensource.com/file/359091
[8]:https://opensource.com/file/359716
[9]:https://opensource.com/file/359056
[10]:https://opensource.com/article/17/7/nodered-raspberrypi-hardware?rate=NjMvod1gAOI2Tf9t0YLr-4tbe_K1XWfHWNjVkTkPuzU
[11]:https://opensource.com/user/137861/feed
[12]:https://www.flickr.com/photos/thomashawk/3048157616/in/photolist-5DmB4E-BzrZ4-5aUXCN-nvBWYa-qbkwAq-fEFeDm-fuZxgC-dufA8D-oi8Npd-b6FiBp-7ChGA3-aSn7xK-7NXMyh-a9bQQr-5NG9W7-agCY7E-4QD9zm-7HLTtj-4uCiHy-bYUUtG
[13]:https://creativecommons.org/licenses/by-nc/2.0/
[14]:https://nodered.org/
[15]:http://m2msupport.net/m2msupport/simcom-sim900-gprs-2g-module/
[16]:http://m2msupport.net/m2msupport/wp-content/themes/admired/Node-RED/modem_commands
[17]:http://m2msupport.net/m2msupport/software-and-at-commands-for-m2m-modules/
[18]:https://nodered.org/
[19]:https://opensource.com/users/gssm2m
[20]:https://opensource.com/users/gssm2m
