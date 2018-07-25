Translating by qhwdw
A sysadmin's guide to network management
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/openwires_fromRHT_520_0612LL.png?itok=PqZi55Ab)

If you're a sysadmin, your daily tasks include managing servers and the data center's network. The following Linux utilities and commands—from basic to advanced—will help make network management easier.

In several of these commands, you'll see `<fqdn>`, which stands for "fully qualified domain name." When you see this, substitute your website URL or your server (e.g., `server-name.company.com`), as the case may be.

### Ping

As the name suggests, `ping` is used to check the end-to-end connectivity from your system to the one you are trying to connect to. It uses [ICMP][1] echo packets that travel back to your system when a ping is successful. It's also a good first step to check system/network connectivity. You can use the `ping` command with IPv4 and IPv6 addresses. (Read my article "[How to find your IP address in Linux][2]" to learn more about IP addresses.)

**Syntax:**

  * IPv4: `ping <ip address>/<fqdn>`
  * IPv6: `ping6 <ip address>/<fqdn>`



You can also use `ping` to resolve names of websites to their corresponding IP address, as shown below:

![](https://opensource.com/sites/default/files/uploads/ping-screen-0.png)

### Traceroute

`ping` checks end-to-end connectivity, the `traceroute` utility tells you all the router IPs on the path you travel to reach the end system, website, or server. `traceroute` is usually is the second step after `ping` for network connection debugging.

This is a nice utility for tracing the full network path from your system to another. Wherechecks end-to-end connectivity, theutility tells you all the router IPs on the path you travel to reach the end system, website, or server.is usually is the second step afterfor network connection debugging.

**Syntax:**

  * `traceroute <ip address>/<fqdn>`



### Telnet

**Syntax:**

  * `telnet <ip address>/<fqdn>` is used to [telnet][3] into any server.



### Netstat

The network statistics (`netstat`) utility is used to troubleshoot network-connection problems and to check interface/port statistics, routing tables, protocol stats, etc. It's any sysadmin's must-have tool.

**Syntax:**

  * `netstat -l` shows the list of all the ports that are in listening mode.
  * `netstat -a` shows all ports; to specify only TCP, use `-at` (for UDP use `-au`).
  * `netstat -r` provides a routing table.

  ![](https://opensource.com/sites/default/files/uploads/netstat-r.png)

  * `netstat -s` provides a summary of statistics for each protocol.

  ![](https://opensource.com/sites/default/files/uploads/netstat-s.png)

  * `netstat -i` displays transmission/receive (TX/RX) packet statistics for each interface.

  ![](https://opensource.com/sites/default/files/uploads/netstat-i.png)

### Nmcli

`nmcli` is a good utility for managing network connections, configurations, etc. It can be used to control Network Manager and modify any device's network configuration details.

**Syntax:**

  * `nmcli device` lists all devices on the system.

  * `nmcli device show <interface>` shows network-related details of the specified interface.

  * `nmcli connection` checks a device's connection.

  * `nmcli connection down <interface>` shuts down the specified interface.

  * `nmcli connection up <interface>` starts the specified interface.

  * `nmcli con add type vlan con-name <connection-name> dev <interface> id <vlan-number> ipv4 <ip/cidr> gw4 <gateway-ip>` adds a virtual LAN (VLAN) interface with the specified VLAN number, IP address, and gateway to a particular interface.

  ![](https://opensource.com/sites/default/files/uploads/nmcli.png)


### Routing

There are many commands you can use to check and configure routing. Here are some useful ones:

**Syntax:**

  * `ip route` shows all the current routes configured for the respective interfaces.

  ![](https://opensource.com/sites/default/files/uploads/ip-route.png)

  * `route add default gw <gateway-ip>` adds a default gateway to the routing table.
  * `route add -net <network ip/cidr> gw <gateway ip> <interface>` adds a new network route to the routing table. There are many other routing parameters, such as adding a default route, default gateway, etc.
  * `route del -net <network ip/cidr>` deletes a particular route entry from the routing table.

  ![](https://opensource.com/sites/default/files/uploads/route-add-del.png)

  * `ip neighbor` shows the current neighbor table and can be used to add, change, or delete new neighbors.

![](https://opensource.com/sites/default/files/uploads/ip-neighbor.png)

![](https://opensource.com/sites/default/files/uploads/ip-neigh-help.png)

  * `arp` (which stands for address resolution protocol) is similar to `ip neighbor`. `arp` maps a system's IP address to its corresponding MAC (media access control) address.

![](https://opensource.com/sites/default/files/uploads/arp.png)

### Tcpdump and Wireshark

Linux provides many packet-capturing tools like `tcpdump`, `wireshark`, `tshark`, etc. They are used to capture network traffic in packets that are transmitted/received and hence are very useful for a sysadmin to debug any packet losses or related issues. For command-line enthusiasts, `tcpdump` is a great tool, and for GUI users, `wireshark` is a great utility to capture and analyze packets. `tcpdump` is a built-in Linux utility to capture network traffic. It can be used to capture/show traffic on specific ports, protocols, etc.

**Syntax:**

  * `tcpdump -i <interface-name>` shows live packets from the specified interface. Packets can be saved in a file by adding the `-w` flag and the name of the output file to the command, for example: `tcpdump -w <output-file.> -i <interface-name>`.

![](https://opensource.com/sites/default/files/uploads/tcpdump-i.png)

  * `tcpdump -i <interface> src <source-ip>` captures packets from a particular source IP.
  * `tcpdump -i <interface> dst <destination-ip>` captures packets from a particular destination IP.
  * `tcpdump -i <interface> port <port-number>` captures traffic for a specific port number like 53, 80, 8080, etc.
  * `tcpdump -i <interface> <protocol>` captures traffic for a particular protocol, like TCP, UDP, etc.



### Iptables

`iptables` is a firewall-like packet-filtering utility that can allow or block certain traffic. The scope of this utility is very wide; here are some of its most common uses.

**Syntax:**

  * `iptables -L` lists all existing `iptables` rules.
  * `iptables -F` deletes all existing rules.



The following commands allow traffic from the specified port number to the specified interface:

  * `iptables -A INPUT -i <interface> -p tcp –dport <port-number> -m state –state NEW,ESTABLISHED -j ACCEPT`
  * `iptables -A OUTPUT -o <interface> -p tcp -sport <port-number> -m state – state ESTABLISHED -j ACCEPT`



The following commands allow loopback access to the system:

  * `iptables -A INPUT -i lo -j ACCEPT`
  * `iptables -A OUTPUT -o lo -j ACCEPT`



### Nslookup

The `nslookup` tool is used to obtain IP address mapping of a website or domain. It can also be used to obtain information on your DNS server, such as all DNS records on a website (see the example below). A similar tool to `nslookup` is the `dig` (Domain Information Groper) utility.

**Syntax:**

  * `nslookup <website-name.com>` shows the IP address of your DNS server in the Server field, and, below that, gives the IP address of the website you are trying to reach.
  * `nslookup -type=any <website-name.com>` shows all the available records for the specified website/domain.



### Network/interface debugging

Here is a summary of the necessary commands and files used to troubleshoot interface connectivity or related network issues.

**Syntax:**

  * `ss` is a utility for dumping socket statistics.
  * `nmap <ip-address>`, which stands for Network Mapper, scans network ports, discovers hosts, detects MAC addresses, and much more.
  * `ip addr/ifconfig -a` provides IP addresses and related info on all the interfaces of a system.
  * `ssh -vvv user@<ip/domain>` enables you to SSH to another server with the specified IP/domain and username. The `-vvv` flag provides "triple-verbose" details of the processes going on while SSH'ing to the server.
  * `ethtool -S <interface>` checks the statistics for a particular interface.
  * `ifup <interface>` starts up the specified interface.
  * `ifdown <interface>` shuts down the specified interface.
  * `systemctl restart network` restarts a network service for the system.
  * `/etc/sysconfig/network-scripts/<interface-name>` is an interface configuration file used to set IP, network, gateway, etc. for the specified interface. DHCP mode can be set here.
  * `/etc/hosts` this file contains custom host/domain to IP mappings.
  * `/etc/resolv.conf` specifies the DNS nameserver IP of the system.
  * `/etc/ntp.conf` specifies the NTP server domain.



--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/sysadmin-guide-networking-commands

作者：[Archit Modi][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/architmodi
[1]:https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol
[2]:https://opensource.com/article/18/5/how-find-ip-address-linux
[3]:https://en.wikipedia.org/wiki/Telnet
