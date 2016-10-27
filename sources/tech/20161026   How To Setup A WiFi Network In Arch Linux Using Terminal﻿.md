zpl1025
How To Setup A WiFi Network In Arch Linux Using Terminal
===

![How To Setup A WiFi In Arch Linux Using Terminal﻿](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/how-to-connect-to-wifi-in-arch-linux-cli_orig.jpg)

If you're using [Linux distro][16] other than [Arch][15] CLI then it's one of the toughest tasks to setup WiFi on [Arch Linux][14] using terminal. Though the process is slightly straight forward. In this article, I'll walk you newbies through the step-by-step setup guide to connect your Arch Linux to your  WiFi network.There are a lot of programs to setup a wireless connection in Linux, we could use **ip** and **iw** to configure an Internet connection, but it would be a little complicated for newbies. So we'll use **netctl**, it's a cli-based tool used to configure and manage network connections via profiles.

Note: You must be root for all the configurations, also you can use sudo.

### Scanning Network

Run the command to know the name of your network interface -

```
iwconfig
```

Run the command - 

```
ip link set  _interface_ up
```

Run the command to search the available WiFi networks. Now move down to look for your WiFi network.

```
iwlist interface scan | less
```

**Note:** Where interface is your network interface that you found using the above  **iwconfig** command.

Run the command -

```
ip link set interface down
```

### Setup A Wi-Fi Using netctl:

Before configure a connection with netctl you must check the compatibility of your network card with Linux.

1.  Run the command:

```
lspci -k
```

This command is to check if kernel loaded the driver for wireless card. The output must look like this:

[![arch linux wifi kernel compatibility ](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-wifi-find-kernel-compatibility_orig.png)][12]

If the kernel didn't load the driver, you must install it using an Ethernet connection. Here is the Official Linux Wireless Wiki: [https://wireless.wiki.kernel.org/][11]

If your wireless card is compatible with Linux, you can start with **netctl configuration**.

**netctl** works with profiles, profile is a file that contains information about connection. A profile can be created by the hard way or the easy way.

### The Easy Way – Wifi-menu

If you want use wifi-menu, dialog must be installed.

1. Run the command: wifi-menu
2.  Select your Network
  [![wifi-menu to setup wifi in arch](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/wifi-menu-to-setup-wifi-in-arch_orig.png)][1] |
3. Type the correct password and wait.
  [![wifi-menu setup wifi password in arch](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/wifi-menu-type-wifi-password-in-arch.png?605)][9]

If you don't have a failed connection message, then you can prove it typing the command:

```
ping -c 3 www.google.com
```

Hurrah! If you're watching it pinging, then the network is setup successfully. You're now connected to WiFi network in Arch Linux. If you've any error then follow the above steps again. Perhaps you've missed something to do.

### The Hard Way

In camparison to the above wifi-menu method, this method is a little hard. That's I call it the hard way. In the above command, the network profile was setup automatically. In this method, we'll setup the profile manually. But don't worry this is not going to be much more complicated. So let's get started!

1.  The first thing that you must do is know the name of your interface, generally the name is wlan0/wlp2s0, but there are many exceptions. To know the name of your interface, you must type the command iwconfig and note it down.

  [![scan wifi networks in arch linux cli](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/scan-wifi-networks-in-arch-linux-cli_orig.png)][8]      

2. Run the command:

  ```
  cd /etc/netctl/examples
  ```

  In this subdirectory you can see different profile examples.

3.Copy your profile example to **_/etc/netctl/your_profile_**

```
cp /etc/netctl/examples/wireless-wpa /etc/netctl/your_profile
```

4. You can see the profile content typing: cat /etc/netctl/your_profile

[![view network profile in arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/view-network-profile-in-arch-linux_orig.png)][7]

5. Edit the following fields of your profile using vi or nano:

```
nano /etc/netctl/your_profile
```

1. **Interface**: it would be wlan0
2. **ESSID**: The name of your Internet connection
3. **key**: The password of your Internet connection**Note:** 

If you don't know how to use nano, only edit your text, when you finish type ctrl+o and return, then type ctrl+x.

[![edit network profile in arch](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edit-network-profile-in-arch_orig.png)][6]

### Running netctl

1. Run the command:

```
cd /etc/netctl

ls
```

  You must see the profile created by wifi-menu, for example wlan0-SSID; or if you used the hard way then you must see the profile created by yourself.

2. Start your connection profile typing the command: netctl start your_profile.
3. Test your connection typing:

```
ping -c 3 www.google.com
```

  The output must look like this:[![check internet connection in arch linux](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/check-internet-connection-in-arch-linux_orig.png)][5]       

6. Finally, you must run the following command: netctl enable your_profile. 

```
netctl enable your_profile
```

This will create and enable a systemd service that will start when the computer boots. So it's time shout Hurrah! You've setup wifi network in your Arch Linux.

### Other Utilities

Also, you can use other programs to setup a wireless connection: For example iw -

iw

1.  iw dev wlan0 link – status
2.  iw dev wlan0 scan – Scanning networks
3.  iw dev wlan0 connect your_essid – Connecting to open network
4.  iw dev wlan0 connect your_essid key your_key - Connecting to WEP encrypted network using hexadecimal key.

wpa_supplicant

[https://wiki.archlinux.org/index.php/WPA_supplicant][4]

Wicd

[https://wiki.archlinux.org/index.php/wicd][3]

NetworkManager

[https://wiki.archlinux.org/index.php/NetworkManager][2]

### Conclusion

So there you go! I have mentioned 3 ways to connect to a WiFi network in your  **Arch Linux** . One thing that I want to focus here is that when you're exeuting first command, please note down the interface. In the next command where we're scanning networks, don't just use interface but the name of your interface such wlan0 or wlp2s0 (you got from previous command). If you have any problem, then do talk to me in the comment section below. Also don't forget to share this article with your friends on social media. Thank you!

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/how-to-setup-a-wifi-in-arch-linux-using-terminal

作者：[Mohd Sohail][a]

译者：[译者ID](https://github.com/译者ID)

校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.linuxandubuntu.com/contact-us.html
[1]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/wifi-menu-to-setup-wifi-in-arch_orig.png
[2]:https://wiki.archlinux.org/index.php/NetworkManager
[3]:https://wiki.archlinux.org/index.php/wicd
[4]:https://wiki.archlinux.org/index.php/WPA_supplicant
[5]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/check-internet-connection-in-arch-linux_orig.png
[6]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/edit-network-profile-in-arch_orig.png
[7]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/view-network-profile-in-arch-linux_orig.png
[8]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/scan-wifi-networks-in-arch-linux-cli_orig.png
[9]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/wifi-menu-type-wifi-password-in-arch_orig.png?605
[10]:http://www.linuxandubuntu.com/home/5-best-arch-linux-based-linux-distributions
[11]:https://wireless.wiki.kernel.org/
[12]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/arch-wifi-find-kernel-compatibility_orig.png
[13]:http://www.linuxandubuntu.com/home/arch-linux-take-your-linux-knowledge-to-next-level-review
[14]:http://www.linuxandubuntu.com/home/category/arch-linux
[15]:http://www.linuxandubuntu.com/home/arch-linux-take-your-linux-knowledge-to-next-level-review
[16]:http://linuxandubuntu.com/home/category/distros
