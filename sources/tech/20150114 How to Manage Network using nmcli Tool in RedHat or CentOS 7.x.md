translating-----geekpi

How to Manage Network using nmcli Tool in RedHat / CentOS 7.x
================================================================================
A new feature of [**Red Hat Enterprise Linux 7**][1] and **CentOS 7** is that the default networking service is provided by **NetworkManager**, a dynamic network control and configuration daemon that attempts to keep network devices and connections up and active when they are available while still supporting the traditional ifcfg type configuration files. NetworkManager can be used with the following types of connections: Ethernet, VLANs, Bridges, Bonds, Teams, Wi-Fi, mobile broadband (such as cellular 3G), and IP-over-InfiniBand. For these connection types, NetworkManager can configure network aliases, IP addresses, static routes, DNS information, and VPN connections, as well as many connection-specific parameters.

The NetworkManager can be controlled with the command-line tool, **nmcli**.

### General nmcli usage ###

The general syntax for nmcli is:

    # nmcli [ OPTIONS ] OBJECT { COMMAND | help }

One cool thing is that you can use the TAB key to complete actions when you write the command so if at any time you forget the syntax you can just press TAB to see a list of available options.

![nmcli tab](http://blog.linoxide.com/wp-content/uploads/2014/12/nmcli-tab.jpg)

Some examples of general nmcli usage:

    # nmcli general status

Will display the overall status of NetworkManager.

    # nmcli connection show

Will display all connections.

    # nmcli connection show -a

Will display only the active connections.

    # nmcli device status

Will display a list of devices recognized by NetworkManager and their current state.

![nmcli general](http://blog.linoxide.com/wp-content/uploads/2014/12/nmcli-gneral.jpg)

### Starting / stopping network interfaces ###

You can use the nmcli tool to start or stop network interfaces from the command line, this is the equivalent of up/down in ifconfig.

To stop an interface use the following syntax:

    # nmcli device disconnect eno16777736

To start it you can use this syntax:

    # nmcli device connect eno16777736

### Adding an ethernet connection with static IP ###

To add a new ethernet connection with a static IP address you can use the following command:

    # nmcli connection add type ethernet con-name NAME_OF_CONNECTION ifname interface-name ip4 IP_ADDRESS gw4 GW_ADDRESS

replacing the NAME_OF_CONNECTION with the name you wish to apply to the new connection, the IP_ADDRESS with the IP address you wish to use and the GW_ADDRESS with the gateway address you use (if you don't use a gateway you can omit this last part).

    # nmcli connection add type ethernet con-name NEW ifname eno16777736 ip4 192.168.1.141 gw4 192.168.1.1

To set the DNS servers for this connection you can use the following command:

    # nmcli connection modify NEW ipv4.dns "8.8.8.8 8.8.4.4"

To bring up the new Ethernet connection, issue a command as follows:

    # nmcli connection up NEW ifname eno16777736

To view detailed information about the newly configured connection, issue a command as follows:

    # nmcli -p connection show NEW

![nmcli add static](http://blog.linoxide.com/wp-content/uploads/2014/12/nmcli-add-static.jpg)

### Adding a connection that will use DHCP ###

If you wish to add a new connection that will use DHCP to configure the interface IP address, gateway address and dns servers, all you have to do is omit the ip/gw address part of the command and Network Manager will use DHCP to get the configuration details.

For example, to create a DHCP configured connection profile named NEW_DHCP, on device
eno16777736 you can use the following command:

    # nmcli connection add type ethernet con-name NEW_DHCP ifname eno16777736

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/nmcli-tool-red-hat-centos-7/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/7.0_Release_Notes/
