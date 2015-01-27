LinSSID – A Graphical Wi-Fi Scanner for Linux
================================================================================
### Introduction ###

As you may know, **LinSSID** is a simple graphical software that can be used to find the wireless networks available.It is completely open source, written in C++ using Linux wireless tools, Qt5, and Qwt 6.1., and is similar to **Inssider** (MS Windows) in terms of look and functionality.

### Installation ###

You can install it either using source, or using a PPA if you use DEB based systems such as Ubuntu, and LinuxMint etc.

You can download and install LinSSID using source packages from [this link][1].

Here, we will install and test this software on Ubuntu 14.04 LTS using PPA.

Add the LinSSID PPA, and install it by typing.

    sudo add-apt-repository ppa:wseverin/ppa
    sudo apt-get update
    sudo apt-get install linssid

### Usage ###

Once you installed, launch it either from menu or unity.

You”ll be asked to enter the administrative user password of your system.

![Password required for iwlist scan_001](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/Password-required-for-iwlist-scan_001.png)

This is how LinSSID interface looks.

![LinSSID_002](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/LinSSID_002.png)

Now, select the network interface you used to connect to the Wireless networks, for example wlan0 in my case. Click the Play button to search the list of available wi-fi networks.

After a new seconds, LinSSID will display the wi-fi networks.

![LinSSID_003](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/LinSSID_003.png)

As you see in the above screenshot, LinSSID displays the details of SSID names, MAC Id, Channel, Privacy, Cipher, Signal, and Protocol etc. Ofcourse, you can make LinSSID to display more options such as Security, bandwidth details etc. To do that, go to **View** menu, and select the desired option. Also, it displays the graphs of signal strength by channel and over time. Additionally, It works both on 2.4Ghz, and 5Ghz channels.

That’s it. Hope this tool will useful for you.

Cheers!!

Reference Links:

- [LinSSID Homepage][2]

--------------------------------------------------------------------------------

via: http://www.unixmen.com/linssid-graphical-wi-fi-scanner-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://sourceforge.net/projects/linssid/files/
[2]:http://sourceforge.net/projects/linssid/