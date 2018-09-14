HankChow translating

Randomize your MAC address using NetworkManager
======

![](https://fedoramagazine.org/wp-content/uploads/2018/09/randomizemacaddress-816x345.png)

Today, users run their notebooks everywhere. To stay connected you use the local wifi to access the internet, on the couch at home or in a little cafe with your favorite coffee. But modern hotspots track you based on your MAC address, [an address that is unique per network card][1], and in this way identifies your device. Read more below about how to avoid this kind of tracking.

Why is this a problem? Many people use the word “privacy” to talk about this issue. But the concern is not about someone accessing the private contents of your laptop (that’s a separate issue). Instead, it’s about legibility — in simple terms, the ability to be easily counted and tracked. You can and should [read more about legibility][2]. But the bottom line is legibility gives the tracker power over the tracked. For instance, timed WiFi leases at the airport can only be enforced when you’re legible.

Since a fixed MAC address for your laptop is so legible (easily tracked), you should change it often. A random address is a good choice. Since MAC-addresses are only used within a local network, a random MAC-address is unlikely to cause a [collision.][3]

### Configuring NetworkManager

To apply randomized MAC-addresses by default to all WiFi connections, create the following file /etc/NetworkManager/conf.d/00-macrandomize.conf :

```
[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=stable
ethernet.cloned-mac-address=stable
connection.stable-id=${CONNECTION}/${BOOT}

```

Afterward, restart NetworkManager:

```
systemctl restart NetworkManager

```

Set cloned-mac-address to stable to generate the same hashed MAC every time a NetworkManager connection activates, but use a different MAC with each connection. To get a truly random MAC with every activation, use random instead.

The stable setting is useful to get the same IP address from DHCP, or a captive portal might remember your login status based on the MAC address. With random you may be required to re-authenticate (or click “I agree”) on every connect. You probably want “random” for that airport WiFi. See the NetworkManager [blog post][4] for a more detailed discussion and instructions for using nmcli to configure specific connections from the terminal.

To see your current MAC addresses, use ip link. The MAC follows the word ether.

```
$ ip link
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
 link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: enp2s0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
 link/ether 52:54:00:5f:d5:4e brd ff:ff:ff:ff:ff:ff
3: wlp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP mode DORMANT group default qlen 1000
 link/ether 52:54:00:03:23:59 brd ff:ff:ff:ff:ff:ff

```

### When not to randomize your MAC address

Naturally, there are times when you do need to be legible. For instance, on your home network, you may have configured your router to assign your notebook a consistent private IP for port forwarding. Or you might allow only certain MAC addresses to use the WiFi. Your employer probably requires legibility as well.
To change a specific WiFi connection, use nmcli to see your NetworkManager connections and show the current settings:

```
$ nmcli c | grep wifi
Amtrak_WiFi 5f4b9f75-9e41-47f8-8bac-25dae779cd87 wifi --
StaplesHotspot de57940c-32c2-468b-8f96-0a3b9a9b0a5e wifi --
MyHome e8c79829-1848-4563-8e44-466e14a3223d wifi wlp1s0
...
$ nmcli c show 5f4b9f75-9e41-47f8-8bac-25dae779cd87 | grep cloned
802-11-wireless.cloned-mac-address: --
$ nmcli c show e8c79829-1848-4563-8e44-466e14a3223d | grep cloned
802-11-wireless.cloned-mac-address: stable

```

This example uses a fully random MAC for Amtrak (which is currently using the default), and the permanent MAC for MyHome (currently set to stable). The permanent MAC was assigned to your network interface when it was manufactured. Network admins like to use the permanent MAC to see [manufacturer IDs on the wire][5].

Now, make the changes and reconnect the active interface:

```
$ nmcli c modify 5f4b9f75-9e41-47f8-8bac-25dae779cd87 802-11-wireless.cloned-mac-address random
$ nmcli c modify e8c79829-1848-4563-8e44-466e14a3223d 802-11-wireless.cloned-mac-address permanent
$ nmcli c down e8c79829-1848-4563-8e44-466e14a3223d
$ nmcli c up e8c79829-1848-4563-8e44-466e14a3223d
$ ip link
...

```

You can also install NetworkManager-tui to get the nmtui command for nice menus when editing connections.

### Conclusion

When you walk down the street, you should [stay aware of your surroundings][6], and on the [alert for danger][7]. In the same way, learn to be aware of your legibility when using public internet resources.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/randomize-mac-address-nm/

作者：[sheogorath][a],[Stuart D Gathman][b]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/sheogorath/
[b]: https://fedoramagazine.org/author/sdgathman/
[1]: https://en.wikipedia.org/wiki/MAC_address
[2]: https://www.ribbonfarm.com/2010/07/26/a-big-little-idea-called-legibility/
[3]: https://serverfault.com/questions/462178/duplicate-mac-address-on-the-same-lan-possible
[4]: https://blogs.gnome.org/thaller/2016/08/26/mac-address-spoofing-in-networkmanager-1-4-0/
[5]: https://www.wireshark.org/tools/oui-lookup.html
[6]: https://www.isba.org/committees/governmentlawyers/newsletter/2013/06/becomingmoreawareafewtipsonkeepingy
[7]: http://www.selectinternational.com/safety-blog/aware-of-surroundings-can-reduce-safety-incidents
