[bazz2 #$*@!^#@%]
How to spoof the MAC address of a network interface on Linux
================================================================================
A 48-bit MAC address (e.g., 08:4f:b5:05:56:a0) is a globally unique identifier associated with a physical network interface, which is assigned by a manufacturer of the corresponding network interface card. Higher 24 bits in a MAC address (also known as OUI or "Organizationally Unique Identifier") uniquely identify the organization which has issued the MAC address, so that there is no conflict among all existing MAC addresses.

While a MAC address is a manufacturer-assigned hardware address, it can actually be modified by a user. This practice is often called "MAC address spoofing." In this tutorial, I am going to show **how to spoof the MAC address of a network interface on Linux**.

### Why Spoof a MAC Address? ###

There could be several technical reasons you may want to change a MAC address. Some ISPs authenticate a subscriber's Internet connection via the MAC address of their home router. Suppose your router is just broken in such a scenario. While your ISP re-establishes your Internet access with a new router, you could temporarily restore the Internet access by changing the MAC address of your computer to that of the broken router.

Many DHCP servers lease IP addresses based on MAC addresses. Suppose for any reason you need to get a different IP address via DHCP than the current one you have. Then you could spoof your MAC address to get a new IP address via DHCP, instead of waiting for the current DHCP lease to expire who knows when.

Technical reasons aside, there are also legitimate privacy and security reasons why you wish to hide your real MAC address. Unlike your layer-3 IP address which can change depending on the networks you are connected to, your MAC address can uniquely identify you wherever you go. Call me a paranoid, but you know what this means to [your privacy][1]. There is also an exploit known as [piggybacking][2], where a hacker snoops on your MAC address on a public WiFi network, and attempts to impersonate you using your MAC address while you are away.

### How to Spoof a MAC Address Temporarily ###

On Linux, you can switch MAC addresses temporarily at run time. Note that you will lose your network connection momentarily during MAC address transition. In this case, the changed MAC address will revert to the original when you reboot. On Linux, there are several easy ways to change a MAC address at run time.

#### Method One: iproute2 ####

    $ sudo ip link set dev eth0 down
    $ sudo ip link set dev eth0 address 00:00:00:00:00:01
    $ sudo ip link set dev eth0 up 

#### Method Two: macchanger ####

A command-line utility called macchanger allows you to change MAC addresses from known vendor list.

To install macchanger on Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install macchanger 

To install macchanger on Fedora:

    $ sudo yum install macchanger 

To install macchanger on CentOS or RHEL:

    $ wget http://ftp.club.cc.cmu.edu/pub/gnu/macchanger/macchanger-1.6.0.tar.gz
    $ tar xvfvz macchanger-1.6.0.tar.gz
    $ cd macchanger-1.6.0 
    $ ./configure
    $ make
    $ sudo make install 

The following examples are some of advanced usages of macchanger. With macchanger, you no longer have to deactivate/reactivate a network interface manually.

To spoof a MAC address to a different value:

    $ sudo macchanger --mac=00:00:00:00:00:01 eth0 

To spoof a MAC address to a random value while preserving the same OUI:

    $ sudo macchanger -e eth0 

To spoof a MAC address to a completely random value:

    $ sudo macchanger -r eth0 

To get all MAC address OUIs associated with a particular vendor (e.g., Juniper):

    $ macchanger -l | grep -i juniper 

![](http://www.flickr.com/photos/xmodulo/12602895995/)

To show the original permanent and spoofed MAC addresses:

    $ macchanger -s eth0 

>     Current MAC:   56:95:ac:ee:6e:77 (unknown)
>     Permanent MAC: 00:0c:29:97:68:02 (Vmware, Inc.)

### How to Spoof a MAC Address Permanently ###

If you want to spoof your MAC address permanently across reboots, you can specify the spoofed MAC address in interface configuration files. For example, if you want to change the MAC address of eth0, do the following.

#### On Fedora, CentOS or RHEL: ####

    $ sudo vi /etc/sysconfig/network-scripts/ifcfg-eth0 

>     DEVICE=eth0
>     MACADDR=00:00:00:00:00:01

Alternatively, you can create a custom startup script in /etc/NetworkManager/dispatcher.d as follows, especially if you are using Network Manager. I assume that you already installed macchanger.

    $ sudo vi /etc/NetworkManager/dispatcher.d/000-changemac 

>     #!/bin/bash
>  
>     case "$2" in
>         up)
>             macchanger --mac=00:00:00:00:00:01 "$1"
>             ;;
>     esac

    $ sudo chmod 755 /etc/NetworkManager/dispatcher.d/000-changemac 

#### On Debian, Ubuntu or Linux Mint: ####

Create a custom startup script in /etc/network/if-up.d/ as follows.

    $ sudo vi /etc/network/if-up.d/changemac 

>     #!/bin/sh
>  
>     if [ "$IFACE" = eth0 ]; then
>       ip link set dev "$IFACE" address 00:00:00:00:00:01
>     fi

    $ sudo chmod 755 /etc/network/if-up.d/changemac 

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/02/spoof-mac-address-network-interface-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.identityblog.com/?p=1131
[2]:http://en.wikipedia.org/wiki/Piggybacking_(Internet_access)