[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Change MAC Address in Linux)
[#]: via: (https://itsfoss.com/change-mac-address-linux/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

How to Change MAC Address in Linux
======

Before I show you how to change Mac address in Linux, let’s first discuss why would you change it in the first place.

You may have several reasons. Maybe you don’t want your actual [MAC address][1] (also called physical address) to be exposed on a public network? Other case can be that the network administrator might have blocked a particular MAC address in the router or firewall.

One practical ‘benefit’ is that some public network (like Airport WiFi) allows free internet for a limited time. If you want to use the internet beyond that, spoofing your Mac address may trick the network in believing that it’s a new device. It’s a famous meme as well.

![Airport WiFi Meme][2]

I am going to show the steps for changing MAC address (also called spoofing/faking MAC address).

### Changing MAC address in Linux

Let’s go through each step:

#### Step 1: Find your MAC address and network interface

Let’s find out some [details about the network card in Linux][3]. Use this command to get the network interface details:

```
ip link show
```

In the output, you’ll see several details along with the MAC address:

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
2: eno1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state DOWN mode DEFAULT group default qlen 1000
    link/ether 94:c6:f8:a7:d7:30 brd ff:ff:ff:ff:ff:ff
3: enp0s31f6: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DORMANT group default qlen 1000
    link/ether 38:42:f8:8b:a7:68 brd ff:ff:ff:ff:ff:ff
4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN mode DEFAULT group default
    link/ether 42:02:07:8f:a7:38 brd ff:ff:ff:ff:ff:ff
```

As you can see, in this case, my network interface is called **enp0s31f6** and its MAC address is **38:42:f8:8b:a7:68**.

You may want to note it down on a secure place to revert to this original MAC address later on.

Now you may proceed to changing the MAC address.

Attention!

If you do this on a network interface which is currently in use, probably your network connection will be terminated. So either try this method on an additional card or be prepared to restart your network.

#### Method 1: Change MAC address using Macchanger

![][4]

[Macchanger][5] is simple utility to view, modify, and manipulate MAC addresses for your Network interface cards. It is available in almost all GNU/Linux operating systems and you can install is using the package installer of your distribution.

On Arch Linux or Manjaro:

```
sudo pacman -S macchanger
```

On Fedora, CentOS, RHEL:

```
sudo dnf install macchanger
```

On Debian, Ubuntu, Linux Mint, Kali Linux:

```
sudo apt install macchanger
```

**Important!** You’ll be asked to specify whether macchanger should be set up to run automatically every time a network device is brought up or down. This gives a new MAC address whenever you attach an Ethernet cable or re-enable WiFi.

![Not a good idea to run it automatically][6]

I recommend not to run it automatically, unless you really need to change your MAC address every time. So, choose No (by pressing tab key) and hit Enter key to continue.

##### How to Use Macchanger to change MAC address

Do you remember your network interface name? You got it in the Step 1 earlier.

Now, to assign any random MAC address to this network card, use:

```
sudo macchanger -r enp0s31f6
```

After changing the MAC id, verify it using command:

```
ip addr
```

You will now see that MAC has been spoofed.

To change the MAC address to a specific value, specify any custom MAC address using command:

```
macchanger --mac=XX:XX:XX:XX:XX:XX
```

Where XX:XX:XX:XX:XX:XX is the new MAC id that you want to change.

Finally, to revert the MAC address to its original hardware value, run the following command:

```
macchanger -p enp0s31f6
```

However, you don’t have to do this. Once you reboot the system, the changes will be automatically lost, and the actual MAC address will be restored again.

You can always check the man page for more details.

#### Method 2: Changing Mac address using iproute2 [intermediate knowledge]

I would recommend using Macchanger but if you don’t want to use it, there is another way to change the MAC address in Linux.

First, turn off the network card using command:

```
sudo ip link set dev enp0s31f6 down
```

Next, set the new MAC using command:

```
sudo ip link set dev enp0s31f6 address XX:XX:XX:XX:XX:XX
```

Finally, turn the network back on with this command:

```
sudo ip link set dev enp0s31f6 up
```

Now, verify new MAC address:

```
ip link show enp0s31f6
```

That’s it. You have successfully changed the MAC address in true Linux style. Stay tuned with It’s FOSS for more Linux tutorial and tips.

![][7]

### Dimitrios Savvopoulos

Dimitrios is an MSc Mechanical Engineer but a Linux enthusiast in heart. He is well settled in Solus OS but curiosity drives him to constantly test other distros. Challenge is part of his personality and his hobby is to compete from 5k to the marathon distance.

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-mac-address-linux/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/MAC_address
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/airport_wifi_meme.jpg?ssl=1
[3]: https://itsfoss.com/find-network-adapter-ubuntu-linux/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/Change_MAC_Address_Linux.jpg?ssl=1
[5]: https://github.com/alobbs/macchanger
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/configuring_mcchanger.jpg?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Dimitrios.jpg?ssl=1
