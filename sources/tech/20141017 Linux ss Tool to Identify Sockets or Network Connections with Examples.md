Translating-----geekpi

Linux ss Tool to Identify Sockets / Network Connections with Examples
================================================================================
ss is part of the iproute2 (utilities for controlling TCP/IP networking and traffic) package. iproute2 is intended to replace an entire suite of standard Unix networking tools (often called "net-tools") that were previously used for the tasks of configuring network interfaces, routing tables, and managing the ARP table. The ss utility is used to dump socket statistics, it allows showing information similar to netstat and its able display more TCP and state information. It should also be faster as it gets its information directly from kernel space. The options used with the ss commands are very similar to netstat making it an easy replacement.

### Usage and common options ###

ss is very similar to netstat, by default it will show you a list of open non-listening TCP sockets that have established connection and you can shape the output with the following options:

- **-n** - Do now try to resolve service names.
- **-r** - Try to resolve numeric address/ports.
- **-a** - Display all sockets.
- **-l** - Display listening sockets.
- **-p** - Show process using socket.
- **-s** - Print summary statistics.
- **-t** - Display only TCP sockets.
- **-u** - Display only UDP sockets.
- **-d** - Display only DCCP sockets.
- **-w** - Display only RAW sockets.
- **-x** - Display only Unix domain sockets.
- **-f FAMILY** - Display sockets of type FAMILY. Currently the following families are supported: unix, inet, inet6, link, netlink.
- **-A QUERY** - List of socket tables to dump, separated by commas. The following identifiers are understood: all, inet, tcp, udp, raw, unix, packet, netlink, unix_dgram, unix_stream, packet_raw, packet_dgram.

### ss command examples ###

**1.** Display all open TCP ports and the process that uses them:

    # ss -tnap

![ss tnap](http://blog.linoxide.com/wp-content/uploads/2014/09/ss-tnap.jpg)

**2.** You can use -4 flag to display the IPv4 connections and the -6 flag to display IPv6 connections, for example:

    # ss -tnap6

![ss tnap6](http://blog.linoxide.com/wp-content/uploads/2014/09/ss-tnap6.jpg)

**3.** In the same manner, to show all open UDP ports you just have to replace t with n.

    # ss -tnap

![ss unap](http://blog.linoxide.com/wp-content/uploads/2014/09/ss-unap.jpg)

**4.** To print various useful statistics you can use the -s flag:

    # ss -s

![ss stats](http://blog.linoxide.com/wp-content/uploads/2014/09/ss-stats.jpg)

**5.** To check all connections in a different state you can use the -o flag, for example to display all the established connection:

    # ss -tn -o state established -p

![ss est](http://blog.linoxide.com/wp-content/uploads/2014/09/ss-est.jpg)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/ss-sockets-network-connection/

作者：[Adrian Dinu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/