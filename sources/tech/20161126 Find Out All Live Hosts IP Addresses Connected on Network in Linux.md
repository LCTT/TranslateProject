Find Out All Live Hosts IP Addresses Connected on Network in Linux
============================================================

There are plenty of [network monitoring tools][1] you can find in the Linux ecosystem, that can generate for you a summary of the total number of devices on a network including all their IP addresses and more.

However, sometimes what you actually need may be a simple command line tool that can provide you the same information by running a single command.

This tutorial will explain you how to find out all live hosts IP addresses connected to a given network. Here, we will use [Nmap tool to find out all IP addresses][2] of devices connected on a same network.

The [Nmap][3] (short form for Network Mapper) is an open source, powerful and a very versatile command line tool for exploring networks, [perform security scans, network audit][4] and [finding open ports on remote machine][5] and so much more.

In case you do not have Nmap installed on your system, run the appropriate command below for your distribution to install it:

```
$ sudo yum install nmap         [On RedHat based systems]
$ sudo dnf install nmap         [On Fedora 22+ versions]
$ sudo apt-get install nmap     [On Debian/Ubuntu based systems]
```

Once you have Nmap installed, the syntax for using it is:

```
$ nmap  [scan type...]  options  {target specification}
```

Where the argument {target specification}, can be replaced by hostnames, IP addresses, networks and so on.

Therefore to list the IP addresses of all hosts connected to a given network, first of all identify the network and its subnet mask using the [ifconfig command][6] or [ip command][7] like so:

```
$ ifconfig
OR
$ ip addr show
```
[
 ![Find Network Details in Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Find-Network-Details-in-Linux.png) 
][8]

Find Network Details in Linux

Next, run the Nmap command below:

```
$ nmap  -sn  10.42.0.0/24
```
[
 ![Find All Live Hosts on Network](http://www.tecmint.com/wp-content/uploads/2016/11/Find-All-Live-Hosts-on-Network.png) 
][9]

Find All Live Hosts on Network

In the command above:

1.  `-sn` – is the type of scan, which means a ping scan. By default, Nmap performs port scanning, but this scan will disable port scanning.
2.  `10.42.0.0/24` – is the target network, replace it with your actual network.

For a comprehensive usage information, make an effort to look into Nmap man page:

```
$ man nmap
```

Else, run Nmap without any options and arguments to view a summarized usage information:

```
$ nmap
```

In addition, for those interested in learning security scanning techniques in Linux, you can read through this practical guide to [Nmap in Kali Linux][10].

Well, that’s it for now, remember to send us your questions or comments through the response form below. You can as well share with us other methods for listing the IP addresses of all devices connected to a given network.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/find-live-hosts-ip-addresses-on-linux-network/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[2]:http://www.tecmint.com/nmap-network-security-scanner-in-kali-linux/
[3]:http://www.tecmint.com/nmap-command-examples/
[4]:http://www.tecmint.com/audit-network-performance-security-and-troubleshooting-in-linux/
[5]:http://www.tecmint.com/find-open-ports-in-linux/
[6]:http://www.tecmint.com/ifconfig-command-examples/
[7]:http://www.tecmint.com/ip-command-examples/
[8]:http://www.tecmint.com/wp-content/uploads/2016/11/Find-Network-Details-in-Linux.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/11/Find-All-Live-Hosts-on-Network.png
[10]:http://www.tecmint.com/nmap-network-security-scanner-in-kali-linux/
