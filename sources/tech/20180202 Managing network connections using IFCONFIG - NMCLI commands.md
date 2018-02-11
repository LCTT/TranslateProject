Managing network connections using IFCONFIG & NMCLI commands
======
Earlier we have discussed how we can configure network connections using three different methods i.e. by editing network interface file, by using GUI & by using nmtui command ([ **READ ARTICLE HERE**][1]). In this tutorial, we are going to use two other methods to configure network connections on our RHEL/CentOS machines.
First utility that we will be using is ‘ifconfig’  & we can configure network on almost any Linux distribution using this method.

### Using Ifconfig

#### View current network settings

To view network settings for all the active network interfaces, run

```
$ ifconfig
```

To view network settings all active, inactive interfaces, run

```
$ ifconfig -a
```


Or to view network settings for a particular interface, run

```
$ ifconfig enOs3
```

#### Assigning IP address to an interface

To assign network information on an interface i.e. IP address, netmask & broadcast address, syntax is
ifconfig enOs3 IP_ADDRESS netmask SUBNET broadcast BROADCAST_ADDRESS
here, we need to pass information as per our network configurations. An example would be

```
$ ifconfig enOs3 192.168.1.100 netmask 255.255.255.0 broadcast 192.168.1.255
```


This will assign IP 192.168.1.100 on our network interface enOs3. We can also just modify IP or subnet or broadcast address by running the above command with only that parameter like,

```
$ ifconfig enOs3 192.168.1.100
$ ifconfig enOs3 netmask 255.255.255.0
$ ifconfig enOs3 broadcast 192.168.1.255
```


#### Enabling or disabling a network interface

To enable a network interface, run

```
$ ifconfig enOs3 up
```


To disable a network interface, run

```
$ ifconfig enOs3 down
```


( **Recommended read** :- [**Assigning multiple IP addresses to a single NIC**][2])

**Note:-** When using ifconfig , entries for the gateway address are to be made in /etc/network file or use the following ‘route’ command to add a default gateway,

```
$ route add default gw 192.168.1.1 enOs3
```


For adding DNS, make an entry in /etc/resolv.conf.

### Using NMCLI

NetworkManager is used as default networking service on RHEL/CentOS 7 versions. It is a very powerful & useful utility for configuring and maintaining network connections. & to control the NetworkManager daemon we can use ‘nmcli’.

**Syntax** for using nmcli is,
```
$ nmcli [ OPTIONS ] OBJECT { COMMAND | help }
```

#### Viewing current network settings

To display the status of NetworkManager, run

```
$ nmcli general status
```


to display only the active connections,

```
$ nmcli connection show -a
```


to display all active and inactive connections, run

```
$ nmcli connection show
```


to display a list of devices recognized by NetworkManager and their current status, run

```
$ nmcli device status
```


#### Assigning IP address to an interface

To assign IP address & default gateway to a network interface, syntax for command is as follows,

```
$ nmcli connection add type ethernet con-name CONNECTION_name ifname INTERFACE_name ip4 IP_address gw4 GATEWAY_address
```


Change the fields as per you network information, an example would be

```
$ nmcli connection add type ethernet con-name office ifname enOs3 ip4 192.168.1.100 gw4 192.168.1.1
```


Unlike ifconfig command , we can set up a DNS address using nmcli command. To assign a DNS server to an interface, run

```
$ nmcli connection modify office ipv4.dns “8.8.8.8”
```


Lastly, we will bring up the newly added connection,

```
$ nmcli connection up office ifname enOs3
```


#### Enabling or disabling a network interface

For enabling an interface using nnmcli, run

```
$ nmcli device connect enOs3
```


To disable an interface, run

```
$ nmcli device disconnect enOs3
```


That’s it guys. There are many other uses for both of these commands but examples mentioned here should get you started. If having any issues/queries, please mention them in the comment box down below.


--------------------------------------------------------------------------------

via: http://linuxtechlab.com/managing-network-using-ifconfig-nmcli-commands/

作者：[SHUSAIN][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/configuring-ip-address-rhel-centos/
[2]:http://linuxtechlab.com/ip-aliasing-multiple-ip-single-nic/
