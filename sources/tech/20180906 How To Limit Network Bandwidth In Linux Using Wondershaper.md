How To Limit Network Bandwidth In Linux Using Wondershaper
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Wondershaper-1-720x340.jpg)

This tutorial will help you to easily limit network bandwidth and shape your network traffic in Unix-like operating systems. By limiting the network bandwidth usage, you can save unnecessary bandwidth consumption’s by applications, such as package managers (pacman, yum, apt), web browsers, torrent clients, download managers etc., and prevent the bandwidth abuse by a single or multiple users in the network. For the purpose of this tutorial, we will be using a command line utility named **Wondershaper**. Trust me, it is not that hard as you may think. It is one of the easiest and quickest way ever I have come across to limit the Internet or local network bandwidth usage in your own Linux system. Read on.

Please be mindful that the aforementioned utility can only limit the incoming and outgoing traffic of your local network interfaces, not the interfaces of your router or modem. In other words, Wondershaper will only limit the network bandwidth in your local system itself, not any other systems in the network. These utility is mainly designed for limiting the bandwidth of one or more network adapters in your local system. Hope you got my point.

Let us see how to use Wondershaper to shape the network traffic.

### Limit Network Bandwidth In Linux Using Wondershaper

**Wondershaper** is simple script used to limit the bandwidth of your system’s network adapter(s). It limits the bandwidth iproute’s tc command, but greatly simplifies its operation.

**Installing Wondershaper**

To install the latest version, git clone wondershaoer repository:

```
$ git clone https://github.com/magnific0/wondershaper.git

```

Go to the wondershaper directory and install it as show below

```
$ cd wondershaper

$ sudo make install

```

And, run the following command to start wondershaper service automatically on every reboot.

```
$ sudo systemctl enable wondershaper.service

$ sudo systemctl start wondershaper.service

```

You can also install using your distribution’s package manager (official or non-official) if you don’t mind the latest version.

Wondershaper is available in [**AUR**][1], so you can install it in Arch-based systems using AUR helper programs such as [**Yay**][2].

```
$ yay -S wondershaper-git

```

On Debian, Ubuntu, Linux Mint:

```
$ sudo apt-get install wondershaper

```

On Fedora:

```
$ sudo dnf install wondershaper

```

On RHEL, CentOS, enable EPEL repository and install wondershaper as shown below.

```
$ sudo yum install epel-release

$ sudo yum install wondershaper

```

Finally, start wondershaper service automatically on every reboot.

```
$ sudo systemctl enable wondershaper.service

$ sudo systemctl start wondershaper.service

```

**Usage**

First, find the name of your network interface. Here are some common ways to find the details of a network card.

```
$ ip addr

$ route

$ ifconfig

```

Once you find the network card name, you can limit the bandwidth rate as shown below.

```
$ sudo wondershaper -a <adapter> -d <rate> -u <rate>

```

For instance, if your network card name is **enp0s8** and you wanted to limit the bandwidth to **1024 Kbps** for **downloads** and **512 kbps** for **uploads** , the command would be:

```
$ sudo wondershaper -a enp0s8 -d 1024 -u 512

```

Where,

  * **-a** : network card name
  * **-d** : download rate
  * **-u** : upload rate



To clear the limits from a network adapter, simply run:

```
$ sudo wondershaper -c -a enp0s8

```

Or

```
$ sudo wondershaper -c enp0s8

```

Just in case, there are more than one network card available in your system, you need to manually set the download/upload rates for each network interface card as described above.

If you have installed Wondershaper by cloning its GitHub repository, there is a configuration named **wondershaper.conf** exists in **/etc/conf.d/** location. Make sure you have set the download or upload rates by modifying the appropriate values(network card name, download/upload rate) in this file.

```
$ sudo nano /etc/conf.d/wondershaper.conf

[wondershaper]
# Adapter
#
IFACE="eth0"

# Download rate in Kbps
#
DSPEED="2048"

# Upload rate in Kbps
#
USPEED="512"

```

Here is the sample before Wondershaper:

After enabling Wondershaper:

As you can see, the download rate has been tremendously reduced after limiting the bandwidth using WOndershaper in my Ubuntu 18.o4 LTS server.

For more details, view the help section by running the following command:

```
$ wondershaper -h

```

Or, refer man pages.

```
$ man wondershaper

```

As far as tested, Wondershaper worked just fine as described above. Give it a try and let us know what do you think about this utility.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-limit-network-bandwidth-in-linux-using-wondershaper/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://aur.archlinux.org/packages/wondershaper-git/
[2]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
