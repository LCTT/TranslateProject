How to Install and Configure Multihomed ISC DHCP Server on Debian Linux
================================================================================
Dynamic Host Control Protocol (DHCP) offers an expedited method for network administrators to provide network layer addressing to hosts on a constantly changing, or dynamic, network. One of the most common server utilities to offer DHCP functionality is ISC DHCP Server. The goal of this service is to provide hosts with the necessary network information to be able to communicate on the networks in which the host is connected. Information that is typically served by this service can include: DNS server information, network address (IP), subnet mask, default gateway information, hostname, and much more.

This tutorial will cover ISC-DHCP-Server version 4.2.4 on a Debian 7.7 server that will manage multiple virtual local area networks (VLAN) but can very easily be applied to a single network setup as well.

The test network that this server was setup on has traditionally relied on a Cisco router to manage the DHCP address leases. The network currently has 12 VLANs needing to be managed by one centralized server. By moving this responsibility to a dedicated server, the router can regain resources for more important tasks such as routing, access control lists, traffic inspection, and network address translation.

The other benefit to moving DHCP to a dedicated server will, in a later guide, involve setting up Dynamic Domain Name Service (DDNS) so that new host’s host-names will be added to the DNS system when the host requests a DHCP address from the server.

### Step 1: Installing and Configuring ISC DHCP Server ###

1. To start the process of creating this multi-homed server, the ISC software needs to be installed via the Debian repositories using the ‘apt‘ utility. As with all tutorials, root or sudo access is assumed. Please make the appropriate modifications to the following commands.

    # apt-get install isc-dhcp-server 		[Installs the ISC DHCP Server software]
    # dpkg --get-selections isc-dhcp-server		[Confirms successful installation]
    # dpkg -s isc-dhcp-server 			[Alternative confirmation of installation]

![Install ISC DHCP Server in Debian](http://www.tecmint.com/wp-content/uploads/2015/04/Install-ISC-DHCP-Server.jpg)

2. Now that the server software is confirmed installed, it is now necessary to configure the server with the network information that it will need to hand out. At the bare minimum, the administrator needs to know the following information for a basic DHCP scope:

- The network addresses
- The subnet masks
- The range of addresses to be dynamically assigned

Other useful information to have the server dynamically assign includes:

- Default gateway
- DNS server IP addresses
- The Domain Name
- Host name
- Network Broadcast addresses

These are merely a few of the many options that the ISC DHCP server can handle. To get a complete list as well as a description of each option, enter the following command after installing the package:

    # man dhcpd.conf

3. Once the administrator has concluded all the necessary information for this server to hand out it is time to configure the DHCP server as well as the necessary pools. Before creating any pools or server configurations though, the DHCP service must be configured to listen on one of the server’s interfaces.

On this particular server, a NIC team has been setup and DHCP will listen on the teamed interfaces which were given the name `'bond0'`. Be sure to make the appropriate changes given the server and environment in which everything is being configured. The defaults in this file are okay for this tutorial.

![Configure ISC DHCP Network](http://www.tecmint.com/wp-content/uploads/2015/04/Configure-ISC-DHCP-Network.jpg)

This line will instruct the DHCP service to listen for DHCP traffic on the specified interface(s). At this point, it is time to modify the main configuration file to enable the DHCP pools on the necessary networks. The main configuration file is located at /etc/dhcp/dhcpd.conf. Open the file with a text editor to begin:

    # nano /etc/dhcp/dhcpd.conf

This file is the configuration for the DHCP server specific options as well as all of the pools/hosts one wishes to configure. The top of the file starts of with a ‘ddns-update-style‘ clause and for this tutorial it will remain set to ‘none‘ however in a future article, Dynamic DNS will be covered and ISC-DHCP-Server will be integrated with BIND9 to enable host name to IP address updates.

4. The next section is typically the area where and administrator can configure global network settings such as the DNS domain name, default lease time for IP addresses, subnet-masks, and much more. Again to know more about all the options be sure to read the man page for the dhcpd.conf file.

    # man dhcpd.conf

For this server install, there were a couple of global network options that were configured at the top of the configuration file so that they wouldn’t have to be implemented in every single pool created.

![Configure ISC DDNS](http://www.tecmint.com/wp-content/uploads/2015/04/Configure-ISC-DDNS.png)

Lets take a moment to explain some of these options. While they are configured globally in this example, all of them can be configured on a per pool basis as well.

- option domain-name “comptech.local”; – All hosts that this DHCP server hosts, will be a member of the DNS domain name “comptech.local”
- option domain-name-servers 172.27.10.6; DHCP will hand out DNS server IP of 172.27.10.6 to all of the hosts on all of the networks it is configured to host.
- option subnet-mask 255.255.255.0; – The subnet mask handed out to every network will be a 255.255.255.0 or a /24
- default-lease-time 3600; – This is the time in seconds that a lease will automatically be valid. The host can re-request the same lease if time runs out or if the host is done with the lease, they can hand the address back early.
- max-lease-time 86400; – This is the maximum amount of time in seconds a lease can be held by a host.
- ping-check true; – This is an extra test to ensure that the address the server wants to assign out isn’t in use by another host on the network already.
- ping-timeout; – This is how long in second the server will wait for a response to a ping before assuming the address isn’t in use.
- ignore client-updates; For now this option is irrelevant since DDNS has been disabled earlier in the configuration file but when DDNS is operating, this option will ignore a hosts to request to update its host-name in DNS.

5. The next line in this file is the authoritative DHCP server line. This line means that if this server is to be the server that hands out addresses for the networks configured in this file, then uncomment the authoritative stanza.

This server will be the only authority on all the networks it manages so the global authoritative stanza was un-commented by removing the ‘#’ in front of the keyword authoritative.

![Enable ISC Authoritative](http://www.tecmint.com/wp-content/uploads/2015/04/ISC-authoritative.png)
Enable ISC Authoritative

By default the server is assumed to NOT be an authority on the network. The rationale behind this is security. If someone unknowingly configures the DHCP server improperly or on a network they shouldn’t, it could cause serious connectivity issues. This line can also be used on a per network basis. This means that if the server is not the entire network’s DHCP server, the authoritative line can instead be used on a per network basis rather than in the global configuration as seen in the above screen-shot.

6. The next step is to configure all of the DHCP pools/networks that this server will manage. For brevities sake, this guide will only walk through one of the pools configured. The administrator will need to have gathered all of the necessary network information (ie domain name, network addresses, how many addresses can be handed out, etc).

For this pool the following information was obtained from the network administrator: network id of 172.27.60.0, subnet mask of 255.255.255.0 or a /24, the default gateway for the subnet is 172.27.60.1, and a broadcast address of 172.27.60.255.
This information is important to building the appropriate network stanza in the dhcpd.conf file. Without further ado, let’s open the configuration file again using a text editor and then add the new network to the server. This must be done with root/sudo!

    # nano /etc/dhcp/dhcpd.conf

![Configure DHCP Pools and Networks](http://www.tecmint.com/wp-content/uploads/2015/04/ISC-network.png)
Configure DHCP Pools and Networks

This is the sample created to hand out IP addresses to a network that is used for the creation of VMWare virtual practice servers. The first line indicates the network as well as the subnet mask for that network. Then inside the brackets are all the options that the DHCP server should provide to hosts on this network.

The first stanza, range 172.27.60.50 172.27.60.254;, is the range of dynamically assignable addresses that the DHCP server can hand out to hosts on this network. Notice that the first 49 addresses aren’t in the pool and can be assigned statically to hosts if needed.

The second stanza, option routers 172.27.60.1; , hands out the default gateway address for all hosts on this network.

The last stanza, option broadcast-address 172.27.60.255;, indicates what the network’s broadcast address. This address SHOULD NOT be a part of the range stanza as the broadcast address can’t be assigned to a host.

Some pointers, be sure to always end the option lines with a semi-colon (;) and always make sure each network created is enclosed in curly braces { }.

7. If there are more networks to create, continue creating them with their appropriate options and then save the text file. Once all configurations have been completed, the ISC-DHCP-Server process will need to be restarted in order to apply the new changes. This can be accomplished with the following command:

    # service isc-dhcp-server restart

This will restart the DHCP service and then the administrator can check to see if the server is ready for DHCP requests several different ways. The easiest is to simply see if the server is listening on port 67 via the [lsof command][1]:

    # lsof -i :67

![Check DHCP Listening Port](http://www.tecmint.com/wp-content/uploads/2015/04/lsof.png)
Check DHCP Listening Port

This output indicates that the DHCPD (DHCP Server daemon) is running and listening on port 67. Port 67 in this output was actually converted to ‘bootps‘ due to a port number mapping for port 67 in /etc/services file.

This is very common on most systems. At this point, the server should be ready for network connectivity and can be confirmed by connecting a machine to the network and having it request a DHCP address from the server.

### Step 2: Testing Client Connectivity ###

8. Most systems now-a-days are using Network Manager to maintain network connections and as such the device should be pre-configured to pull DHCP when the interface is active.

However on machines that aren’t using Network Manager, it may be necessary to manually attempt to pull a DHCP address. The next few steps will show how to do this as well as how to see whether the server is handing out addresses.

The ‘[ifconfig][2]‘ utility can be used to check an interface’s configuration. The machine used to test the DHCP server only has one network adapter and it is called ‘eth0‘.

    # ifconfig eth0

![Check Network Interface IP Address](http://www.tecmint.com/wp-content/uploads/2015/04/No-ip.png)
Check Network Interface IP Address

From this output, this machine currently doesn’t have an IPv4 address, great! Let’s instruct this machine to reach out to the DHCP server and request an address. This machine has the DHCP client utility known as ‘dhclient‘ installed. The DHCP client utility may very from system to system.

    # dhclient eth0

![Request IP Address from DHCP](http://www.tecmint.com/wp-content/uploads/2015/04/IP.png)
Request IP Address from DHCP

Now the `'inet addr:'` field shows an IPv4 address that falls within the scope of what was configured for the 172.27.60.0 network. Also notice that the proper broadcast address was handed out as well as subnet mask for this network.

Things are looking promising but let’s check the server to see if it was actually the place where this machine received this new IP address. To accomplish this task, the server’s system log file will be consulted. While the entire log file may contain hundreds of thousands of entries, only a few are necessary for confirming that the server is working properly. Rather than using a full text editor, this time a utility known as ‘tail‘ will be used to only show the last few lines of the log file.

    # tail /var/log/syslog

![Check DHCP Logs](http://www.tecmint.com/wp-content/uploads/2015/04/DHCP-Log.png)
Check DHCP Logs

Voila! The server recorded handing out an address to this host (HRTDEBXENSRV). It is a safe assumption at this point that the server is working as intended and handing out the appropriate addresses for the networks that it is an authority. At this point the DHCP server is up and running. Configure the other networks, troubleshoot, and secure as necessary.

Enjoy the newly functioning ISC-DHCP-Server and tune in later for more Debian tutorials. In the not too distant future there will be an article on Bind9 and DDNS that will tie into this article.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-and-configure-multihomed-isc-dhcp-server-on-debian-linux/

作者：[Rob Turner][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/robturner/
[1]:http://www.tecmint.com/10-lsof-command-examples-in-linux/
[2]:http://www.tecmint.com/ifconfig-command-examples/