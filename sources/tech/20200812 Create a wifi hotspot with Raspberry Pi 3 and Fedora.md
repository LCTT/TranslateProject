[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Create a wifi hotspot with Raspberry Pi 3 and Fedora)
[#]: via: (https://fedoramagazine.org/create-a-wifi-hotspot-with-raspberry-pi-3-and-fedora/)
[#]: author: (Nick Hardiman https://fedoramagazine.org/author/nickhardiman/)

Create a wifi hotspot with Raspberry Pi 3 and Fedora
======

![][1]

If you’re already [running Fedora on your Pi][2], you’re already most of the way to a wifi hotspot. A Raspberry Pi has a wifi interface that’s usually set up to join an existing wifi network. This interface can be reconfigured to provide a new wifi network. If a room has a good network cable and a bad wifi signal (a brick wall, foil-backed plasterboard, and even a window with a metal oxide coating are all obstacles), fix it with your Pi.

This article describes the procedure for setting up the hotspot. It was tested on third generation Pis – a [Model B v1.2][3], and a [Model B+][4] (the older [2][5] and the new [4][6] weren’t tested). These are the credit-card size Pis that have been around a few years.

This article also delves a little way into the network concepts behind the scenes. For instance, “hotspot” is the term that’s caught on in public places around the world, but it’s more accurate to use the term WLAN AP (Wireless Local Area Network Access Point).In fact, if you want to annoy your friendly neighborhood network administrator, call a hotspot a “wifi router”. The inaccuracy will make their eyes cross.

A few _nmcli_ commands configure the Raspberry Pi as a wifi AP. The _nmcli_ command-line tool controls the NetworkManager daemon. It’s not the only network configuration system available. More complex solutions are available for the adventurous. Check out the [hostapd][7] RPM package and the [OpenWRT distro][8]. Have a look at [Internet connection sharing with NetworkManager][9] for more ideas.

### A dive into network administration

The hotspot is a routed AP (Access Point). It sits between two networks, the current wired network and its new wireless network, and takes care of the post-office-style forwarding of IP packets between them.

#### Routing and interfaces

The wireless interface on the Raspberry Pi is named **wlan0** and the wired one is **eth0**. The new wireless network uses one range of IP addresses and the current wired network uses another. In this example, the current network range is 192.168.0.0/24 and the new network range is 10.42.0.0/24. If these numbers make no sense, that’s OK. You can carry on without getting to grips with IP subnets and netmasks. The Raspberry Pi’s two interfaces have IP addresses from these ranges.

Packets are sent to local computers or remote destinations based on their IP addresses. This is routing work, and it’s where the _routed_ part of _routed AP_ name comes from. If you’d like to build a more complex router with DHCP and DNS, pick up some tips from the article [How to use Fedora Server to create a router / gateway][10].

#### It’s not a bridged AP

Netowrk bridging is another way of extending a network, but it’s not how this Pi is set up. This routed AP is not a bridged AP. To understand the difference between routing and bridging, you have to know a little about the networking layers of the OSI network model. A good place to start is the [beginner’s guide to network troubleshooting in Linux][11]. Here’s the short answer.

  * layer 3, network ← Yes, our routed AP is here.
  * layer 2, data link ← No, it’s not a bridged AP.
  * layer 1, physical ← Radio transmission is covered here.



A [bridge][12] works at a lower layer of the network stack – it uses ethernet MAC addresses to send data. If this was a bridged AP, it wouldn’t have two sets of IP addresses; the new wireless network and the current wired network would use the same IP subnet.

#### IP masquerading

You won’t find an IP address starting with _10._ anywhere on the Internet. It’s a private address, not a public address. To get an IP packet routed out of the wifi network and back in again, packet addresses have to be changed. **IP masquerading** is a way of making this routing work. The masquerade name is used because the packets’ real addresses are hidden. the wired network doesn’t see any addresses from the wireless network.

IP masquerading is set up automatically by NetworkManager. NetworkManager adds nftables rules to handle [IP masquerading][13].

#### The Pi’s network stack

A stack of network hardware and software makes wifi work.

  * Network hardware
  * Kernel space software
  * User space software



You can see the network hardware. The Raspberry Pi has two main hardware components – a tiny antenna and Broadcom wifi chip. [MagPi magazine has some great photos][14].

Kernel software provides the plumbing. There’s no need to work on these directly – it’s all good to go in the Fedora distribution.

  * [Broadcom driver modules][15] talk to the hardware. List these with the command _lsmod | grep brcm_.
  * A TCP/IP stack handles protocols.
  * The [netfilter framework][16] filters packets.
  * A network system ties these all together.



User space software customizes the system. It’s full of utilities that either help the user, talk to the kernel, or connect other utilities together. For instance, the [firewall-cmd][17] tool talks to the [firewalld service][18], firewalld talks to the [nftables][19] tool, and nftables talks to the netfilter framework in the kernel. The [nmcli][20] commands talk to [NetworkManager][21]. And NetworkManager talks to pretty much everything.

### Create the AP

That’s enough theory — let’s get practical. Fire up your Raspberry Pi running Fedora and run these commands.

#### Install software

Nearly all the required software is included with the Fedora Minimal image. The only thing missing is the _dnsmasq_ package. This handles the DHCP and IP address part of the new wifi network, automatically. Run this command [using sudo][22]:

```
$ sudo dnf install dnsmasq
```

#### Create a new NetworkManager connection

NetworkManager sets up one network connection automatically, _Wired connection 1_. Use the _nmcli_ tool to tell NetworkManager how to add a wifi connection. NetworkManager saves these settings, and a bunch more, in a new config file.

The new configuration file is created in the directory _/etc/sysconfig/network-scripts/_. At first, it’s empty; the image has no configuration files for network interfaces. If you want to find out more about how NetworkManager uses the _network-scripts_ directory, the gory details are in the [nm-settings-ifcfg-rh man page][23].

```
[nick@raspi ~]$ ls /etc/sysconfig/network-scripts/
[nick@raspi ~]$
```

The first _nmcli_ command, to create a network connection, looks like this. There’s more to do — the Pi won’t work as a hotspot after running this.

```
nmcli con add \
  type wifi \
  ifname wlan0 \
  con-name 'raspi hotspot' \
  autoconnect yes \
  ssid 'raspi wifi'
```

The following commands complete several more steps:

  * Create a new connection.
  * List the connections.
  * Take another look at the _network-scripts_ folder. NetworkManager added a config file.
  * List available APs to connect to.



This requires running several commands as root [using _sudo_][22]:

```
$ sudo nmcli con add type wifi ifname wlan0 con-name 'raspi hotspot' autoconnect yes ssid 'raspi wifi'
Connection 'raspi wifi' (13ea67a7-a8e6-480c-8a46-3171d9f96554) successfully added.
$ sudo nmcli connection show
NAME UUID TYPE DEVICE
Wired connection 1 59b7f1b5-04e1-3ad8-bde8-386a97e5195d ethernet eth0
raspi wifi 13ea67a7-a8e6-480c-8a46-3171d9f96554 wifi wlan0
$ ls /etc/sysconfig/network-scripts/
ifcfg-raspi_wifi
$ sudo nmcli device wifi list
IN-USE BSSID SSID MODE CHAN RATE SIGNAL BARS SECURITY
       01:0B:03:04:C6:50 APrivateAP Infra 6 195 Mbit/s 52 ▂▄__ WPA2
       02:B3:54:05:C8:51 SomePublicAP Infra 6 195 Mbit/s 52 ▂▄__ --
```

You can remove the new config and start again with this command:

```
$ sudo nmcli con delete 'raspi hotspot'
```

#### Change the connection mode

A NetworkManager connection has many configuration settings. You can see these with the command _nmcli con show ‘raspi hotspot’_. Some of these settings start with the label _802-11-wireless_. This is to do with industry standards that make wifi work – the IEEE organization specified many protocols for wifi, named [802.11][24]. This new wifi connection is in _infrastructure_ mode, ready to connect to a wifi access point. The Pi isn’t supposed to connect to another AP; it’s supposed to be the AP that others connect to.

This command changes the mode from infrastructure to AP. It also sets a few other [wireless properties][25]. The **bg** value tells NetworkManager to follow two old IEEE standards – [802.11b][26] and [802.11g][27]. Basically it configures the radio to use the 2.4GHz frequency band, not the 5GHz band. **ipv4.method shared** means this connection will be shared with others.

  * Change the connection to a hotspot by changing the mode to _ap_.



```
sudo nmcli connection \
  modify "raspi hotspot" \
  802-11-wireless.mode ap \
  802-11-wireless.band bg \
  ipv4.method shared
```

The connection starts automatically. The _dnsmasq_ application gives the wlan0 interface an IP address of 10.42.0.1. The manual commands to start and stop the hotspot are:

```
$ sudo nmcli con up "raspi hotspot"
$ sudo nmcli con down "raspi hotspot"
```

#### Connect a device

The next steps are to:

  * Watch the log.
  * Connect a smartphone.
  * When you’ve seen enough, type ^C ([control][c]) to stop watching the log.



```
$ journalctl --follow
-- Logs begin at Wed 2020-04-01 18:23:45 BST. --
...
```

Use a wifi-enabled device, like your phone. The phone can find the new _raspi wifi_ network.

Messages about an associating client appear in the activity log:

```
Jun 10 18:08:05 raspi wpa_supplicant[662]: wlan0: AP-STA-CONNECTED 94:b0:1f:2e:d2:bd
Jun 10 18:08:05 raspi wpa_supplicant[662]: wlan0: CTRL-EVENT-SUBNET-STATUS-UPDATE status=0
Jun 10 18:08:05 raspi dnsmasq-dhcp[713]: DHCPREQUEST(wlan0) 10.42.0.125 94:b0:1f:2e:d2:bd
Jun 10 18:08:05 raspi dnsmasq-dhcp[713]: DHCPACK(wlan0) 10.42.0.125 94:b0:1f:2e:d2:bd nick
```

### Examine the firewall

A new security zone named _nm-shared_ has appeared. This is stopping some wifi access.

```
$ sudo firewall-cmd --get-active-zones
[sudo] password for nick:
nm-shared
  interfaces: wlan0
public
  interfaces: eth0
```

The new zone is set up to accept everything because the target is _ACCEPT_. Clients are able to use web, mail and SSH to get to the Internet.

```
$ sudo firewall-cmd --zone=nm-shared --list-all
nm-shared (active)
  target: ACCEPT
  icmp-block-inversion: no
  interfaces: wlan0
  sources:
  services: dhcp dns ssh
  ports:
  protocols: icmp ipv6-icmp
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
            rule priority="32767" reject
```

This big list of config settings takes a little examination.

The first line, the innocent-until-proven-guilty option _target: ACCEPT_ says all traffic is allowed through, unless a rule says otherwise. It’s the same as saying these types of traffic are all OK.

  * inbound packets – requests sent from wifi clients to the Raspberry Pi
  * forwarded packets – requests from wifi clients to the Internet
  * outbound packets – requests sent by the PI to wifi clients



However, there’s a hidden gotcha: requests from wifi clients (like your workstation) to the Raspberry Pi may be rejected. The final line — the mysterious rule in the _rich rules_ section — refers to the [routing policy database][28]. The rule stops you from connecting from your workstation to your Pi with a command like this: _ssh 10.42.0.1_. This rule only affects traffic sent to to the Raspberry Pi, not traffic sent to the Internet, so browsing the web works fine.

If an inbound packet matches something in the _services_ and _protocols_ lists, it’s allowed through. NetworkManager automatically adds ICMP, DHCP and DNS (Internet infrastructure services and protocols). An SSH packet doesn’t match, gets as far as the [post-processing][29] stage, and is rejected — _priority=”32767″_ translates as “do this after all the processing is done.”

If you want to know what’s happening behind the scenes, that rich rule creates an nftables rule. The nftables rule looks like this.

```
$ sudo nft list chain inet firewalld filter_IN_nm-shared_post
table inet firewalld {
  chain filter_IN_nm-shared_post {
    reject
  }
}
```

#### Fix SSH login

Connect from your workstation to the Raspberry Pi using SSH.This won’t work because of the rich rule. A protocol that’s not on the list gets instantly rejected.

Check that SSH is blocked:

```
$ ssh 10.42.0.1
ssh: connect to host 10.42.0.1 port 22: Connection refused
```

Next, add SSH to the list of allowed services. If you don’t remember what services are defined, list them all with _firewall-cmd ‐‐get-services_. For SSH, use option _‐‐add-service ssh_ or _‐‐remove-service ssh_. Don’t forget to make the change permanent.

```
$ sudo firewall-cmd --add-service ssh --permanent --zone=nm-shared
success
```

Now test with SSH again.

```
$ ssh 10.42.0.1
The authenticity of host '10.42.0.1 (10.42.0.1)' can't be established.
ECDSA key fingerprint is SHA256:dDdgJpDSMNKR5h0cnpiegyFGAwGD24Dgjg82/NUC3Bc.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.42.0.1' (ECDSA) to the list of known hosts.
Last login: Tue Jun 9 18:58:36 2020 from 10.0.1.35
nick@10.42.0.1's password:
```

SSH access is no longer blocked.

### Test as a headless computer

The raspberry pi runs fine as a [headless computer][30]. From here on, you can use SSH to work on your Pi.

  * Power off.
  * Remove keyboard and video monitor.
  * Power on.
  * Wait a couple minutes.
  * Connect from your workstation to the Raspberry Pi using SSH. Use either the wired interface or the wireless one; both work.



### Increase security with WPA-PSK

The WPA-PSK (Wifi Protected Access with Pre-Shared Key) system is designed for home users and small offices. It is password protected. Use nmcli again to add WPA-PSK:

```
$ sudo nmcli con modify "raspi hotspot" wifi-sec.key-mgmt wpa-psk
$ sudo nmcli con modify "raspi hotspot" wifi-sec.psk "hotspot-password"
```

### Troubleshooting

Here are a couple recommendations:

  * Mine journalctl, Google and forums.
  * Join the [Fedora ARM mailing list][31].



The bad news is, there are no troubleshooting tips here. There are so many things that can go wrong, there’s no way of covering them.

Troubleshooting a network stack is tricky. If one component goes wrong, it may all go wrong. And making changes like reloading firewall rules can upset services like NetworkManager and sshd. You know you’re in the weeds when you find yourself running [nftables commands][32] like _nft list ruleset_ and [firewalld commands][33] like _firewall-cmd ‐‐set-log-denied=all_.

### Play with your new platform

Add value to your new AP. Since you’re running a Pi, there are many hardware add-ons. Since it’s running Fedora, you have thousands of packages available. Try turning it into a mini-NAS, or adding battery back-up, or perhaps a music player.

* * *

_Photo by [Uriel SC][34] on [Unsplash][35]_.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/create-a-wifi-hotspot-with-raspberry-pi-3-and-fedora/

作者：[Nick Hardiman][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/nickhardiman/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/07/raspi3-wifi-816x345.jpg
[2]: https://fedoramagazine.org/install-fedora-on-a-raspberry-pi/
[3]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b/
[4]: https://www.raspberrypi.org/products/raspberry-pi-3-model-b-plus/
[5]: https://www.raspberrypi.org/products/raspberry-pi-2-model-b/
[6]: https://www.raspberrypi.org/products/raspberry-pi-4-model-b/
[7]: http://w1.fi/hostapd/
[8]: https://openwrt.org/toh/raspberry_pi_foundation/raspberry_pi
[9]: https://fedoramagazine.org/internet-connection-sharing-networkmanager/
[10]: https://fedoramagazine.org/use-fedora-server-create-router-gateway/
[11]: https://www.redhat.com/sysadmin/beginners-guide-network-troubleshooting-linux
[12]: https://wiki.linuxfoundation.org/networking/bridge
[13]: https://en.wikipedia.org/wiki/Network_address_translation
[14]: https://magpi.raspberrypi.org/articles/raspberry-pi-3-specs-benchmarks
[15]: https://wireless.wiki.kernel.org/en/users/drivers/brcm80211
[16]: https://www.netfilter.org/
[17]: https://firewalld.org/documentation/utilities/firewall-cmd.html
[18]: https://firewalld.org/
[19]: https://firewalld.org/2018/07/nftables-backend
[20]: https://developer.gnome.org/NetworkManager/stable/nmcli.html
[21]: https://wiki.gnome.org/Projects/NetworkManager
[22]: https://fedoramagazine.org/howto-use-sudo/
[23]: https://people.freedesktop.org/~lkundrak/nm-docs/nm-settings-ifcfg-rh.html
[24]: https://en.wikipedia.org/wiki/IEEE_802.11
[25]: https://developer.gnome.org/NetworkManager/stable/settings-802-11-wireless.html
[26]: https://en.wikipedia.org/wiki/IEEE_802.11#802.11b
[27]: https://en.wikipedia.org/wiki/IEEE_802.11#802.11g
[28]: https://www.man7.org/linux/man-pages/man8/ip-rule.8.html
[29]: https://firewalld.org/2018/12/rich-rule-priorities
[30]: https://en.wikipedia.org/wiki/Headless_computer
[31]: https://lists.fedoraproject.org/admin/lists/arm.lists.fedoraproject.org/
[32]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/getting-started-with-nftables_configuring-and-managing-networking
[33]: https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_and_managing_networking/using-and-configuring-firewalld_configuring-and-managing-networking
[34]: https://unsplash.com/@urielsc26?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[35]: https://unsplash.com/s/photos/network?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
