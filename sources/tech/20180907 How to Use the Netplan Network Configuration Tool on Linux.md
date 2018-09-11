How to Use the Netplan Network Configuration Tool on Linux
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/netplan.jpg?itok=Gu_ZfNGa)

For years Linux admins and users have configured their network interfaces in the same way. For instance, if you’re a Ubuntu user, you could either configure the network connection via the desktop GUI or from within the /etc/network/interfaces file. The configuration was incredibly easy and never failed to work. The configuration within that file looked something like this:

```
auto enp10s0

iface enp10s0 inet static

address 192.168.1.162

netmask 255.255.255.0

gateway 192.168.1.100

dns-nameservers 1.0.0.1,1.1.1.1

```

Save and close that file. Restart networking with the command:

```
sudo systemctl restart networking

```

Or, if you’re not using a non-systemd distribution, you could restart networking the old fashioned way like so:

```
sudo /etc/init.d/networking restart

```

Your network will restart and the newly configured interface is good to go.

That’s how it’s been done for years. Until now. With certain distributions (such as Ubuntu Linux 18.04), the configuration and control of networking has changed considerably. Instead of that interfaces file and using the /etc/init.d/networking script, we now turn to [Netplan][1]. Netplan is a command line utility for the configuration of networking on certain Linux distributions. Netplan uses YAML description files to configure network interfaces and, from those descriptions, will generate the necessary configuration options for any given renderer tool.

I want to show you how to use Netplan on Linux, to configure a static IP address and a DHCP address. I’ll be demonstrating on Ubuntu Server 18.04. I will give you one word of warning, the .yaml files you create for Netplan must be consistent in spacing, otherwise they’ll fail to work. You don’t have to use a specific spacing for each line, it just has to remain consistent.

### The new configuration files

Open a terminal window (or log into your Ubuntu Server via SSH). You will find the new configuration files for Netplan in the /etc/netplan directory. Change into that directory with the command cd /etc/netplan. Once in that directory, you will probably only see a single file:

```
01-netcfg.yaml

```

You can create a new file or edit the default. If you opt to edit the default, I suggest making a copy with the command:

```
sudo cp /etc/netplan/01-netcfg.yaml /etc/netplan/01-netcfg.yaml.bak

```

With your backup in place, you’re ready to configure.

### Network Device Name

Before you configure your static IP address, you’ll need to know the name of device to be configured. To do that, you can issue the command ip a and find out which device is to be used (Figure 1).

![netplan][3]

Figure 1: Finding our device name with the ip a command.

[Used with permission][4]

I’ll be configuring ens5 for a static IP address.

### Configuring a Static IP Address

Open the original .yaml file for editing with the command:

```
sudo nano /etc/netplan/01-netcfg.yaml

```

The layout of the file looks like this:

network:

Version: 2

Renderer: networkd

ethernets:

DEVICE_NAME:

Dhcp4: yes/no

Addresses: [IP/NETMASK]

Gateway: GATEWAY

Nameservers:

Addresses: [NAMESERVER, NAMESERVER]

Where:

  * DEVICE_NAME is the actual device name to be configured.

  * yes/no is an option to enable or disable dhcp4.

  * IP is the IP address for the device.

  * NETMASK is the netmask for the IP address.

  * GATEWAY is the address for your gateway.

  * NAMESERVER is the comma-separated list of DNS nameservers.




Here’s a sample .yaml file:

```
network:

 version: 2

 renderer: networkd

 ethernets:

 ens5:

 dhcp4: no

 addresses: [192.168.1.230/24]

 gateway4: 192.168.1.254

 nameservers:

 addresses: [8.8.4.4,8.8.8.8]

```

Edit the above to fit your networking needs. Save and close that file.

Notice the netmask is no longer configured in the form 255.255.255.0. Instead, the netmask is added to the IP address.

### Testing the Configuration

Before we apply the change, let’s test the configuration. To do that, issue the command:

```
sudo netplan try

```

The above command will validate the configuration before applying it. If it succeeds, you will see Configuration accepted. In other words, Netplan will attempt to apply the new settings to a running system. Should the new configuration file fail, Netplan will automatically revert to the previous working configuration. Should the new configuration work, it will be applied.

### Applying the New Configuration

If you are certain of your configuration file, you can skip the try option and go directly to applying the new options. The command for this is:

```
sudo netplan apply

```

At this point, you can issue the command ip a to see that your new address configurations are in place.

### Configuring DHCP

Although you probably won’t be configuring your server for DHCP, it’s always good to know how to do this. For example, you might not know what static IP addresses are currently available on your network. You could configure the device for DHCP, get an IP address, and then reconfigure that address as static.

To use DHCP with Netplan, the configuration file would look something like this:

```
network:

 version: 2

 renderer: networkd

 ethernets:

 ens5:

 Addresses: []

 dhcp4: true

 optional: true

```

Save and close that file. Test the file with:

```
sudo netplan try

```

Netplan should succeed and apply the DHCP configuration. You could then issue the ip a command, get the dynamically assigned address, and then reconfigure a static address. Or, you could leave it set to use DHCP (but seeing as how this is a server, you probably won’t want to do that).

Should you have more than one interface, you could name the second .yaml configuration file 02-netcfg.yaml. Netplan will apply the configuration files in numerical order, so 01 will be applied before 02. Create as many configuration files as needed for your server.

### That’s All There Is

Believe it or not, that’s all there is to using Netplan. Although it is a significant change to how we’re accustomed to configuring network addresses, it’s not all that hard to get used to. But this style of configuration is here to stay… so you will need to get used to it.

Learn more about Linux through the free ["Introduction to Linux" ][5]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/9/how-use-netplan-network-configuration-tool-linux

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[1]: https://netplan.io/
[3]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/netplan_1.jpg?itok=XuIsXWbV (netplan)
[4]: /licenses/category/used-permission
[5]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
