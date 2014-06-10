Translating by GOLinux ...
How to set up Internet connection sharing with iptables on Linux
================================================================================
In this tutorial, I'll explain how to share a single Internet connection among multiple devices on Linux. While consumer-grade WiFi routers have become mainstream nowadays, making this problem a non-issue, suppose you don't have one at home. However, say you have a Linux box already assembled with a modem and a LAN card. The modem is connected to the Internet with a dynamic public IP address, and the LAN card connected to your switch/hub. Other devices (Linux/Windows PC, laptop) are connected to the switch without having any Internet connection. To share the Internet connection of the Linux box, you have to turn the box into a gateway, so that it can relay traffic to and from other devices.

### Glossary of Terms ###

- **Private IP address** (non-routeable address) is an IP address used for a Local Area Network (not visible through Internet).
- **Public IP address** (routeable address) is an IP address that is visible through Internet.
- **IP masquerading** is a function that allows set of machines to reach the Internet via a MASQ gateway. Those machines behind the MASQ gateway is never visible to the Internet. Any outgoing and incoming traffic from and to the machines behind the MASQ gateway must pass through the MASQ gateway.
- **Network Address Translation** (NAT) is a function that can make a private IP address reaches the Internet with the help of IP masquerading.

### Hardware Requirements ###

- One Linux box with two interfaces (one public IP address and the other private IP address), which will be used as a gateway.
- One or more Linux/Windows PC or laptop with private IP addresses.
- Switch/HUB (optional).

### Step-by-Step Guide ###

The following procedure is required on the Linux box (the connection sharing gateway).

#### 1. Activate IP forwarding ####

In order to set up Internet connection sharing, you need to enable IP forwarding on the Linux box with a kernel parameter. Startup kernel parameters stored in /etc/sysctl.conf.

Open the file, and locate line with the following parameter "# net.ipv4.ip_forward = 0". Remove hash mark (i.e., uncomment it), and set the value to 1. It should look like the following:

    net.ipv4.ip_forward = 1

You may also activate IP forwaring at run time by the following command:

    $ sudo sysctl -w net.ipv4.ip_forward=1
    $ sudo sysctl -p

#### 2. NAT configuration ####

Another important part of Internet connection sharing is NAT configuration which can be done using iptables command. iptables maintains four firewall tables:

- FILTER (the default table)
- NAT
- MANGLE
- RAW

In this tutorial we will use only two tables: FILTER and NAT tables.

First, flush all active firewall rules.

    $ sudo iptables -X
    $ sudo iptables -F
    $ sudo iptables -t nat -X
    $ sudo iptables -t nat -F

On the INPUT table, you have to set chain FORWARD to ACCEPT target, so all packets passed through the box will be processed correctly.

    $ sudo iptables -I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    $ sudo iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

On the NAT table, you have to enable IP masquerading for your WAN interface. We assume that the WAN interface is ppp0. To enable IP masquerading on ppp0 interface, you can use the following command:

    $ sudo iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE

#### 3. Configuring a private IP address ####

After all configuration is completed on the Linux box, you have to configure the DNS server and default gateway of other devices (Linux/Windows PC, laptop), so that they point to the Linux box. Note that you don't need to set up a DNS server on the Linux box. Every DNS request from other devices are automatically forwarded by the Linux box to your upstream ISP.

If you are using Linux on the other devices, you can use the following command to change their default gateway and DNS servers. I assume that you are using 192.168.1.0/24 private IP address segment, and that 192.168.1.1 is the IP address assigned to the Linux box.

    $ sudo ip route del default
    $ sudo ip route add default via 192.168.1.1
    $ sudo sh -c "echo 'nameserver 192.168.1.1' > /etc/resolv.conf"

If you have other Linux devices, you can repeat the command above on other devices.

If you have a Windows device, you can change the default gateway and the DNS server via network connection properties on the control panel.

#### 4. The complete script ####

Here is the complete script which sets up Internet connection sharing on the Linux box. The WAN interface (ppp0) needs to be replaced according to your environment.

    $ sudo vi /usr/local/bin/ishare

----------

    #!/bin/bash
    
    ## Internet connection shating script
    
    sysctl -w net.ipv4.ip_forward=1
    sysctl -p
    iptables -X
    iptables -F
    iptables -t nat -X
    iptables -t nat -F
    iptables -I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
    iptables -I FORWARD  -m state --state RELATED,ESTABLISHED -j ACCEPT
    iptables -t nat -I POSTROUTING -o ppp0 -j MASQUERADE

Save the above script to /usr/local/bin/ishare, and then change the executable bit by the following command.

    $ sudo chmox +x /usr/local/bin/ishare

If you want the script executed every startup, you can register the script to /etc/rc.local. Open /etc/rc.local, before statement "exit 0", add the following line:

    /usr/local/bin/ishare

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/06/internet-connection-sharing-iptables-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
