How to create an AP in Ubuntu 15.04 to connect to Android/iPhone
================================================================================
I tried creating a wireless access point via Gnome Network Manager in 15.04 and was successful. I’m sharing the steps with our readers. Please note: you must have a wifi card which allows you to create an Access Point. If you want to know how to find that, type iw list in a terminal.

If you don’t have iw installed, you can install iw in Ubuntu using the command sudo apt-get install iw.

After you type iw list, look for supported interface section, where it should be a entry called AP like the one shown below:

Supported interface modes:

* IBSS
* managed
* AP
* AP/VLAN
* monitor
* mesh point

Let’s see the steps in detail

1. Disconnect WIFI. Get a an internet cable and plug into your laptop so that you are connected to a wired internet connection
1. Go to Network Icon on the top panel -> Edit Connections then click the Add button in the pop-up window
1. Choose Wi-Fi from the drop-down menu
1. Next,

a. Type in a connection name e.g. Hotspot

b. Type in a SSID e.g. Hotspot

c. Select mode: Infrastructure

d. Device MAC address: select your wireless card from drop-down menu

![](http://i2.wp.com/www.linuxveda.com/wp-content/uploads/2015/08/ubuntu-ap-gnome1.jpg)

1. Go to Wi-Fi Security tab, select security type WPA & WPA2 Personal and set a password
1. Go to IPv4 Settings tab, from Method drop-down box, select Shared to other computers

![](http://i1.wp.com/www.linuxveda.com/wp-content/uploads/2015/08/ubuntu-ap-gnome4.jpg)

1. Go to IPv6 tab and set Method to ignore (do this only if you do not use IPv6)
1. Hit the “Save” button to save the configuration
1. Open a terminal from the menu/dash
1. Now, edit the connection with you just created via network settings

VIM editor:

    sudo vim /etc/NetworkManager/system-connections/Hotspot

Gedit:

    gksu gedit /etc/NetworkManager/system-connections/Hotspot

Replace name Hotspot with the connection name you have given in step 4

![](http://i2.wp.com/www.linuxveda.com/wp-content/uploads/2015/08/ubuntu-ap-gnome2.jpg?resize=640%2C402)

1. Change the line mode=infrastructure to mode=ap and save the file
1. Once you save the file, you should be able to see the wifi named Hotspot showing up in the list of available wifi networks. (If the network does not show, disable and enable wifi )

![](http://i1.wp.com/www.linuxveda.com/wp-content/uploads/2015/08/ubuntu-ap-gnome3.jpg?resize=290%2C375)

1. You can now connect your Android phone. Connection tested using Xioami Mi4i running Android 5.0 (Downloaded 1GB to test speed and reliability)

--------------------------------------------------------------------------------

via: http://www.linuxveda.com/2015/08/23/how-to-create-an-ap-in-ubuntu-15-04-to-connect-to-androidiphone/

作者：[Sayantan Das][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxveda.com/author/sayantan_das/