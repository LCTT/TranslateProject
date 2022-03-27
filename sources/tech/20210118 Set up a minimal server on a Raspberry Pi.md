[#]: collector: (lujun9972)
[#]: translator: (hwlife )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Set up a minimal server on a Raspberry Pi)
[#]: via: (https://opensource.com/article/21/1/minimal-server-raspberry-pi)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Set up a minimal server on a Raspberry Pi
======
Don't decommission that old Raspberry Pi just yet! This step-by-step
guide shows how I set up my Raspberry Pi with the most minimal
configuration to conserve precious system resources.
![Raspberry Pi board Model B][1]

Recently, the microSD (secure digital) card in my [Raspberry Pi][2] stopped working. It had been in constant use as a server for almost two years, and this provided a good opportunity to start fresh and correct a few problems. After its initial installation, it began experiencing disk problems and the official Raspberry Pi operating system (OS) received a significant update (and was renamed from Raspbian to Raspberry Pi OS). So I acquired a new microSD card and preceded to rebuild.

Although this Raspberry Pi 3 Model B isn't the latest hardware, it is still adequate for running a minimal server for various services. I think my original installation used the full operating system image that includes the graphical user interface and a lot of other software packages unnecessary for my needs.

This step-by-step guide shows how I set up my Raspberry Pi with the most minimal configuration to conserve precious system resources.

### Get started

To begin, create a new operating system drive for the Pi. This requires two things: an OS image file and a microSD card.

#### Download the Raspberry Pi OS image file

While several operating systems are available, I chose to stick to the officially supported OS.

The first step is to download the newest OS image file from the official [Raspberry Pi OS][3] site to a computer you can use to write to a microSD card. Three different images are offered, and I chose the Raspberry Pi OS Lite. It is the smallest OS and includes only the essential files required for a base OS, so it will consume the least amount of disk space and system RAM. (When I downloaded the OS, the release date was August 20, 2020, but it has been updated since then. I do not expect any major differences, but as always, I recommend reading the release notes.)

#### Write the OS to the microSD Card

The second step is to write the downloaded OS image file to the microSD card. My card was used previously, and when I inserted it into my Linux desktop, it automatically mounted its two existing partitions. I couldn't write the image until I unmounted these partitions. To do so, I had to determine their path with the `lsblk` command, which identified the device as `/dev/mmcblk0`:


```
`# lsblk -p`
```

I then unmounted the partitions with the `umount` command:


```
# umount /dev/mmcblk0p2
# umount /dev/mmcblk0p1
```

Once the partitions are unmounted, write the image file to the microSD card. Although there are many graphical image-writing tools available, I used the venerable `dd` command:


```
`# dd bs=4M if=/home/alan/Downloads/raspios/2020-08-20-raspios-buster-armhf-lite.img of=/dev/mmcblk0 status=progress conv=fsync`
```

#### Boot the Pi

You just need a monitor, keyboard, and power adapter to access the Raspberry Pi. I also have an Ethernet cable for network connectivity, which I prefer over wireless—especially for a dedicated server.

Insert the microSD card and power on the Pi. Once it boots, log in with the default credentials: user `pi` and password `raspberry`.

### Configure the OS

Take the following steps to minimize your installation, disk space, and memory usage as much as possible. I recommend spending time to research each configuration to be as correct as possible. There are often several ways to apply a configuration, and configuration files and directives can be deprecated. Always review a product's documentation to ensure you're not applying an outdated configuration.

#### Run raspi-config

The main configuration program in Raspberry Pi OS is called raspi-config. Run it immediately after logging in:


```
`# raspi-config`
```

![Raspberry Pi config main window][4]

It presents an option to expand the root filesystem to use all of the available space on the microSD card. After taking this option, reboot and log in again.

Verify that the card's full capacity is being used with the `df` command:


```
`# df -h`
```

If you need to configure other options, run `raspi-config` again. Some of these will vary according to your requirements or preferences. Go through all of them just to be sure you don't miss anything. I recommend the following changes for best performance. (I will skip the sections where I did not make any changes.)

  * **System options:** You can set the hostname, preferably using a fully qualified domain name (FQDN). You can also change your password here, which is always highly recommended.
  * **Interface options:** Enable SSH.
  * **Performance options:** Reduce GPU memory to the lowest setting (16MB).
  * **Localization options:** Choose your time zone, location, and keyboard type.
  * **Advanced options:** This section contains the Expand Filesystem option to expand the root filesystem. If you didn't do this above, be sure to do it here so that you have access to all storage available on the microSD card.
  * **Update:** Entering the Update section immediately checks for an update to the raspi-config tool. If an update is available, it will be downloaded and applied. Otherwise, raspi-config will re-launch after a few seconds.



Once you complete these configurations in raspi-config, select **Finish** to exit the tool.

#### Manual configurations

There are several other changes that I recommend. They are all manual changes that require editing certain configuration files.

##### Configure static IP

Generally, it is best to configure a server with a static IP address. To configure the IP and your default gateway (router) and domain name service (DNS) addresses, begin by identifying the network interface device with the `ip` command:


```
# ip link
1: lo: &lt;LOOPBACK,UP,LOWER_UP&gt; mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eth0: &lt;BROADCAST,MULTICAST,UP,LOWER_UP&gt; mtu 1500 qdisc pfifo_fast state UP mode DEFAULT group default qlen 1000
    link/ether b8:27:eb:48:3f:46 brd ff:ff:ff:ff:ff:ff
```

You also need to know the IP address of your default gateway and one or more DNS servers. Add this information to the file `/etc/dhcpcd.conf` (_I strongly suggest making a backup of this file before making changes)_:


```
# cd /etc
# cp -a dhcpcd.conf dhcpcd.conf.original
```

Edit the file as shown:


```
# vi dhcpcd.conf

# static IP configuration:
interface eth0
static ip_address=192.168.1.5/24
static routers=192.168.1.1
static domain_name_servers=192.168.1.3 192.168.1.4
```

##### Disable IPv6

Unless you specifically need to use IPv6, you might prefer to disable it. Do this by creating two new files that include a one-line directive instructing the Linux kernel not to use IPv6.

First, create the file `/etc/sysctl.d/disable-ipv6.conf` with the line
`net.ipv6.conf.all.disable_ipv6 = 1`:


```
# cd /etc/sysctl.d
# echo "net.ipv6.conf.all.disable_ipv6 = 1" &gt; disable-ipv6.conf
```

Then create the file `/etc/modprobe.d/blacklist-ipv6.conf` with the line `blacklist ipv6`:


```
# cd /etc/modprobe.d
# echo "blacklist ipv6" &gt; blacklist-ipv6.conf
```

##### Disable WiFi, Bluetooth, and audio

My server's specific purpose will not need Bluetooth or audio. Also, since it's connected with Ethernet, it will not use wireless (WiFi). Unless you plan to use them, disable them with the following steps.

Make the following changes to the file `/boot/config.txt` _(again, I suggest making a backup of this file)_:


```
# cd /boot
# cp -a config.txt config.txt.original
```

Add the following two directives to the bottom of the file to disable Bluetooth and WiFi:

  * `dtoverlay=disable-bt`
  * `dtoverlay=disable-wifi`



These echo commands will do the trick:


```
# cd /boot
# echo "dtoverlay=disable-bt" &gt;&gt; config.txt
# echo "dtoverlay=disable-wifi" &gt;&gt; config.txt
```

To disable audio, change the parameter `dtparam=audio` to `off`. You can do this with a short `sed` command:


```
`# sed -i '/dtparam=audio/c dtparam=audio=off' config.txt`
```

The last step is to disable the WiFi service. Use the `systemctl mask` command:


```
`systemctl mask wpa_supplicant.service`
```

You can disable a couple of other services if you won't need them:

  * **Disable modem service:** [code]`systemctl disable hciuart`
```
* **Disable Avahi-daemon:** [code]`systemctl disable avahi-daemon.service`
```



### Final steps

  * **Check your memory usage:** [code]`# free -h`[/code] I was astonished: My OS only uses 30MB of RAM.
  * **Create personal accounts:** It is advisable to create user accounts for any individuals who will log into this server. You can assign them to the sudo group to allow them to issue administrative commands. For example, to give a user named George an account: [code] # adduser george
# usermod -a -G adm,sudo,users george 
```
  * **Get updates:** This is an important step. Apply updates to get the latest fixes to the Raspberry Pi OS: [code] # apt update
# apt full-upgrade
```
  * **Reboot:** It's a good idea to reboot your new server: [code]`# systemctl reboot`
```
* **Install Cockpit:** You can install [Cockpit][5], also known as the Linux Web Console, on Raspberry Pi OS. It provides an HTML-based interface for managing and monitoring your server remotely. I recently wrote about [getting started with Cockpit][6]. Install it with: [code]`# apt install cockpit`
```



Now my Raspberry Pi is ready to host a server. I could use it for a [web server][7], a [VPN server][8], a game server such as [Minetest][9], or (as I did) an [ad blocker based on Pi-Hole][10].

### Keep old hardware alive

Regardless of what hardware you have available, carefully minimizing and controlling your operating system and packages can keep your resource usage low so that you can get the most out of it. This also improves security by reducing the number of services and packages available to would-be mal-actors trying to exploit a vulnerability.

So, before you decommission older hardware, consider all the possibilities for how it can continue to be used.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/minimal-server-raspberry-pi

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/RaspberryPi.SUNY_.jpg?itok=uS_-VUcb (Raspberry Pi board Model B)
[2]: https://opensource.com/resources/raspberry-pi
[3]: https://www.raspberrypi.org/software/operating-systems
[4]: https://opensource.com/sites/default/files/uploads/raspi-config-main.png (Raspberry Pi config main window)
[5]: https://cockpit-project.org/
[6]: https://opensource.com/article/20/11/cockpit-server-management
[7]: https://opensource.com/article/17/3/building-personal-web-server-raspberry-pi-3
[8]: https://opensource.com/article/19/6/raspberry-pi-vpn-server
[9]: https://github.com/minetest
[10]: https://opensource.com/article/18/2/block-ads-raspberry-pi
