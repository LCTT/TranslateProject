[#]: collector: (lujun9972)
[#]: translator: (qianmingtian)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Install and Use Wireshark on Ubuntu Linux)
[#]: via: (https://itsfoss.com/install-wireshark-ubuntu/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

Install and Use Wireshark on Ubuntu Linux
======

_**Brief: You’ll learn to install the latest Wireshark on Ubuntu and other Ubuntu-based distribution in this tutorial. You’ll also learn how to run Wireshark without sudo and how to set it up for packet sniffing.**_

[Wireshark][1] is a free and open-source network protocol analyzer widely used around the globe.

With Wireshark, you can capture incoming and outgoing packets of a network in real-time and use it for network troubleshooting, packet analysis, software and communication protocol development, and many more.

It is available on all major desktop operating systems like Windows, Linux, macOS, BSD and more.

In this tutorial, I will guide you to install Wireshark on Ubuntu and other Ubuntu-based distributions. I’ll also show a little about setting up and configuring Wireshark to capture packets.

### Installing Wireshark on Ubuntu based Linux distributions

![][2]

Wireshark is available on all major Linux distributions. You should check out the [official installation instructions][3]. because in this tutorial, I’ll focus on installing the latest Wireshark version on Ubuntu-based distributions only.

Wireshark is available in the Universe repository of Ubuntu. You can [enable universe repository][4] and then install it like this:

```
sudo add-apt-repository universe
sudo apt install wireshark
```

One slight problem in this approach is that you might not always get the latest version of Wireshark.

For example, in Ubuntu 18.04, if you [use the apt command][5] to check the available version of Wireshark, it is 2.6.

```
[email protected]:~$ apt show wireshark
Package: wireshark
Version: 2.6.10-1~ubuntu18.04.0
Priority: optional
Section: universe/net
Origin: Ubuntu
Maintainer: Balint Reczey <[email protected]>
```

However, [Wireshark 3.2 stable version][6] has been released months ago. New release brings new features, of course.

So, what do you do in such case? Thankfully, Wiresshark developers provide an official PPA that you can use to install the latest stable version of Wireshark on Ubuntu and other Ubuntu-based distributions.

I hope you are acquainted with PPA. If not, please [read our excellent guide on PPA to understand it completely][7].

Open a terminal and use the following commands one by one:

```
sudo add-apt-repository ppa:wireshark-dev/stable
sudo apt update
sudo apt install wireshark
```

Even if you have an older version of Wireshark installed, it will be updated to the newer version.

While installing, you will be asked whether to allow non-superusers to capture packets. Select Yes to allow and No to restrict non-superusers to capture packets &amp; finish the installation.

### Running Wireshark without sudo

If you have selected **No** in the previous installation, then run the following command as root:

```
sudo dpkg-reconfigure wireshark-common
```

And select **Yes** by pressing the tab key and then using enter key:

![][8]

Since you have allowed the non-superuser to capture packets, you have to add the user to wireshark group. Use the [usermod command][9] to add yourself to the wireshark group.

```
sudo usermod -aG wireshark $(whoami)
```

Finally, [restart your Ubuntu system][10] to make the necessary changes to your system.

Trivia

First released in 1998, Wireshark was initially known as Ethereal. Developers had to change its name to Wireshark in 2006 due to trademark issues.

### Starting Wireshark

Launching Wireshark application can be done from the application launcher or the CLI.

To start from CLI, just type **wireshark** on your console:

```
wireshark
```

From **GUI**, search for Wireshark application on the search bar and hit enter.

![][11]

Now let’s play with Wireshark.

### Capturing packets using Wireshark

When you start Wireshark, you will see a list of interfaces that you can use to capture packets to and from.

There are many types of interfaces available which you can monitor using Wireshark such as, Wired, External devices, etc. According to your preference, you can choose to show specific types of interfaces in the welcome screen from the marked area in the given image below.

![Select interface][12]

For instance, I listed only the **Wired** network interfaces.

![][13]

Next, to start capturing packets, you have to select the interface (which in my case is ens33) and click on the **Start capturing packets** icon as marked in the image below.

![Start capturing packets with Wireshark][14]

You can also capture packets to and from multiple interfaces at the same time. Just press and hold the **CTRL** button while clicking on the interfaces that you want to capture to and from and then hit the **Start capturing packets** icon as marked in the image below.

![][15]

Next, I tried using **ping google.com** command in the terminal and as you can see, many packets were captured.

![Captured packets][16]

Now you can select on any packet to check that particular packet. After clicking on a particular packet you can see the information about different layers of TCP/IP Protocol associated with it.

![Packet info][17]

You can also see the RAW data of that particular packet at the bottom as shown in the image below.

![Check RAW data in the captured packets][18]

This is why end-to-end encryption is important

Imagine you are logging into a website that doesn’t use HTTPS. Anyone on the same network as you can sniff the packets and see the user name and password in the RAW data.
This is why most chat applications use end to end encryption and most websites these days use https (instead of http).

#### Stopping packet capture in Wireshark

You can click on the red icon as marked in the given image to stop capturing Wireshark packets.

![Stop packet capture in Wireshark][19]

#### Save captured packets to a file

You can click on the marked icon in the image below to save captured packets to a file for future use.

![Save captured packets by Wireshark][20]

**Note**: _Output can be exported to XML, PostScript®, CSV, or plain text._

Next, select a destination folder, and type the file name and click on **Save**.
Then select the file and click on **Open**.

![][21]

Now you can open and analyze the saved packets anytime. To open the file, press **\ + o**
or go to **File &gt; Open** from Wireshark.

The captured packets should be loaded from the file.

![][22]

### Conclusion

Wireshark supports many different communication protocols. There are many options and features that provide you the power to capture and analyze the network packets in a unique way. You can learn more about Wireshark from their [official documentation][23].

I hope this detailed helped you to install Wireshark on Ubuntu. Please let me know your questions and suggestions.

![][24]

### Kushal Rai

A computer science student &amp; Linux and open source lover. He likes sharing knowledge for he believes technology shapes the perception of modern world. Kushal also loves music and photography.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-wireshark-ubuntu/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://www.wireshark.org/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/wireshark_ubuntu.png?ssl=1
[3]: https://www.wireshark.org/docs/wsug_html_chunked/ChBuildInstallUnixInstallBins.html
[4]: https://itsfoss.com/ubuntu-repositories/
[5]: https://itsfoss.com/apt-command-guide/
[6]: https://www.wireshark.org/news/20191218.html
[7]: https://itsfoss.com/ppa-guide/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/yes.png?ssl=1
[9]: https://linuxhandbook.com/usermod-command/
[10]: https://itsfoss.com/schedule-shutdown-ubuntu/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/wire.png?ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/interfaces.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/intoption.jpg?ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/singleinterface.jpg?ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/selint.jpg?ssl=1
[16]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/capture.jpg?ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/packetinfo.png?ssl=1
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/raw.png?ssl=1
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/stopcapture.png?ssl=1
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/savepackets.jpg?ssl=1
[21]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/savename.jpg?ssl=1
[22]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/openpacket.png?ssl=1
[23]: https://www.wireshark.org/docs/https://www.wireshark.org/docs/
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/kushal_rai.jpg?ssl=1
