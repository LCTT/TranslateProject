### Basics of network protocol analyzer Wireshark On Linux


Contents

*   *   [1. Installation][4]
    *   [2. Basic Configuration][5]
        *   [2.1. Layout][1]
        *   [2.2. Toolbars][2]
        *   [2.3. Functionality][3]
    *   [3. Capture][6]
    *   [4. Reading Data][7]
    *   [5. Closing Thoughts][8]

Wireshark is just one of the valuable tools provided by Kali Linux. Like the others, it can be used for either positive or negative purposes. Of course, this guide will cover monitoring  _your own_  network traffic to detect any potentially unwanted activity. 

Wireshark is incredibly powerful, and it can appear daunting at first, but it serves the single purpose of monitoring network traffic, and all of those many options that it makes available only serve to enhance it's monitoring ability.

### Installation

Kali ships with Wireshark. However, the `wireshark-gtk` package provides a nicer interface that makes working with Wireshark a much friendlier experience. So, the first step in using Wireshark is installing the `wireshark-gtk` package.
```
# apt install wireshark-gtk
```
Don't worry if you're running Kali on a live medium. It'll still work.

### Basic Configuration

Before you do anything else, it's probably best to set Wireshark up the way you will be most comfortable using it. Wireshark offers a number of different layouts as well as options that configure the program's behavior. Despite their numbers, using them is fairly straightforward. 

Start out by opening Wireshark-gtk. Make sure it is the GTK version. They are listed separately by Kali.


 ![Wireshark running on Kali](https://linuxconfig.org/images/wireshark-start.jpg?58a2b879) 


### Layout

By default, Wireshark has three sections stacked on top of one another. The top section is the list of packets. The middle section is the packet details. The bottom section contains the raw packet bytes. For most uses, the top two are much more useful than the last, but can still be great information for more advanced users. 

The sections can be expanded and contracted, but that stacked layout isn't for everyone. You can alter it in Wireshark's "Preferences" menu. To get there, click on "Edit" then "Preferences..." at the bottom of the drop down. That will open up a new window with more options. Click on "Layout" under "User Interface" on the side menu. 


 ![Wireshark's layout configuration](https://linuxconfig.org/images/wireshark-layouts.jpg?58a2b879) 


You will now see different available layout options. The illustrations across the top allow you to select the positioning of the different panes, and the radio button selectors allow you to select the data that will go in each pane. 

The tab below, labelled "Columns," allows you to select which columns will be displayed by Wireshark in the list of packets. Select only the ones with the data you need, or leave them all checked.

### Toolbars

There isn't too much that you can do with the toolbars in Wireshark, but if you want to customize them, you can find some useful setting on the same "Layout" menu as the pane arrangement tools in the last section. There are toolbar options directly below the pane options that allow you to change how the toolbars and toolbar items are displayed. 

You can also customize which toolbars are displayed under the "View" menu by checking and unchecking them.

### Functionality

The majority of the controls for altering how Wireshark captures packets are collected can be found under "Capture" in "Options." 

The top "Capture" section of the window allows you to select which networking interfaces Wireshark should monitor. This could differ greatly depending on your system and how it's configured. Just be sure to check the right boxes to get the right data. Virtual machines and their accompanying networks will show up in this list. There will also be multiple options for multiple network interface cards. 


 ![Wireshark's capture configuration](https://linuxconfig.org/images/wireshark-capture-config.jpg?58a2b879) 


Directly below the listing of network interfaces are two options. One allows you to select all interfaces. The other allows you to enable or disable promiscuous mode. This allows your computer to monitor the traffic of all other computers on the selected network. If you are trying to monitor your whole network, this is the option you want. 

**WARNING:** using promiscuous mode on a network that you do not own or have permission to monitor is illegal! 

On the bottom left of the screen are the "Display Options" and "Name Resolution" sections. For "Display Options," it's probably a good idea to leave all three checked. If you want to uncheck them, it's okay, but "Update list of packets in real time" should probably remain checked at all times. 

Under "Name Resolution" you can pick your preference. Having more options checked will create more requests and clutter up your packet list. Checking for MAC resolutions is a good idea to see the brand of the networking hardware being used. It helps you identify which machines and interfaces are interacting.

### Capture

Capture is at the core of Wireshark. It's primary purpose is it monitor and record traffic on a specified network. It does this, in its most basic form, very simply. Of course, more configuration and options can be used to utilize more of Wireshark's power. This intro section, though, will be sticking to the most basic recording. 

To start a new capture, press the new live capture button. It should look like a blue shark fin. 


 ![Wireshark listing packet information](https://linuxconfig.org/images/wireshark-packet-list.jpg?58a2b879) 


While capturing, Wireshark will gather all of the packet data that it can and record it. Depending on your settings, you should see new packets coming in on the "Packet Listing" pane. You can click on each one you find interesting and investigate in real time, or you can simply walk away and let Wireshark run. 

When you're done, press the red square "Stop" button. Now, you can choose to either save or discard your capture. To save, you can click on "File" then "Save" or "Save as."

### Reading Data

Wireshark aims to provide you with all of the data that you will need. In doing so, it collects a large amount of data related to the network packets that it is monitoring. It tries to make this data less daunting by breaking it down in collapsible tabs. Each tab corresponds to a piece of the request data tied to the packet. 

The tabs are stacked in order from lowest level to highest level. The top tab will always contain data on the bytes contained in the packet. The lowest tab will vary. In the case of an HTTP request, it will contain the HTTP information. The majority of packets that you encounter will be TCP data, and that will be the bottom tab. 


 ![Wireshark listing HTTP packet info](https://linuxconfig.org/images/wireshark-packet-info-http.jpg?58a2b879) 


Each tab contains data relevant data for that part of the packet. An HTTP packet will contain information pertaining to the type of request, the web browser used, IP address of the server, language, and encoding data. A TCP packet will contain information on which ports are being used on both the client and server as well as flags being used for the TCP handshake process. 


 ![Wireshark listing TCP packet info](https://linuxconfig.org/images/wireshark-packet-info-tcp.jpg?58a2b879) 


The other upper fields will contain less information that will interest most users. There is a tab containing information on whether or not the packet was transferred via IPv4 or IPv6 as well as the IP addresses of the client and the server. Another tab provides the MAC address information for both the client machine and the router or gateway used to access the internet.

### Closing Thoughts

Even with just these basics, you can see how powerful of a tool Wireshark can be. Monitoring your network traffic can help to stop cyber attacks or just improve connection speeds. It can also help you chase down problem applications. The next Wireshark guide will explore the options available for filtering packets with Wireshark.

--------------------------------------------------------------------------------

via: https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux

作者：[Nick Congleton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux
[1]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h2-1-layout
[2]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h2-2-toolbars
[3]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h2-3-functionality
[4]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h1-installation
[5]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h2-basic-configuration
[6]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h3-capture
[7]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h4-reading-data
[8]:https://linuxconfig.org/basic-of-network-protocol-analyzer-wireshark-on-linux#h5-closing-thoughts
