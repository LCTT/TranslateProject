[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 Ways To Check Whether A Port Is Open On The Remote Linux System?)
[#]: via: (https://www.2daygeek.com/how-to-check-whether-a-port-is-open-on-the-remote-linux-system-server/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

3 Ways To Check Whether A Port Is Open On The Remote Linux System?
======

This is an important topic, which is not only for Linux administrator and it will be very helpful for all.

I mean to say. It’s very useful for users who are working in IT Infra.

They have to check whether the port is open or not on Linux server before proceeding to next steps.

If it’s not open then they can directly ask the Linux admin to check on this.

If it’s open then we need to check with application team, etc,.

In this article, we will show you, how to check this using three methods.

It can be done using the following Linux commands.

  * **`nc:`** Netcat is a simple Unix utility which reads and writes data across network connections, using TCP or UDP protocol.
  * **`nmap:`** Nmap (“Network Mapper”) is an open source tool for network exploration and security auditing. It was designed to rapidly scan large networks.
  * **`telnet:`** The telnet command is used for interactive communication with another host using the TELNET protocol.



### How To Check Whether A Port Is Open On The Remote Linux System Using nc (netcat) Command?

nc stands for netcat. Netcat is a simple Unix utility which reads and writes data across network connections, using TCP or UDP protocol.

It is designed to be a reliable “back-end” tool that can be used directly or easily driven by other programs and scripts.

At the same time, it is a feature-rich network debugging and exploration tool, since it can create almost any kind of connection you would need and has several interesting built-in capabilities.

Netcat has three main modes of functionality. These are the connect mode, the listen mode, and the tunnel mode.

**Common Syntax for nc (netcat):**

```
$ nc [-options] [HostName or IP] [PortNumber]
```

In this example, we are going to check whether the port 22 is open or not on the remote Linux system.

If it’s success then you will be getting the following output.

```
# nc -zvw3 192.168.1.8 22
Connection to 192.168.1.8 22 port [tcp/ssh] succeeded!
```

**Details:**

  * **`nc:`** It’s a command.
  * **`z:`** zero-I/O mode (used for scanning).
  * **`v:`** For verbose.
  * **`w3:`** timeout wait seconds
  * **`192.168.1.8:`** Destination system IP.
  * **`22:`** Port number needs to be verified.



If it’s fail then you will be getting the following output.

```
# nc -zvw3 192.168.1.95 22
nc: connect to 192.168.1.95 port 22 (tcp) failed: Connection refused
```

### How To Check Whether A Port Is Open On The Remote Linux System Using nmap Command?

Nmap (“Network Mapper”) is an open source tool for network exploration and security auditing. It was designed to rapidly scan large networks, although it works fine against single hosts.

Nmap uses raw IP packets in novel ways to determine what hosts are available on the network, what services (application name and version) those hosts are offering, what operating systems (and OS versions) they are running, what type of packet filters/firewalls are in use, and dozens of other characteristics.

While Nmap is commonly used for security audits, many systems and network administrators find it useful for routine tasks such as network inventory, managing service upgrade schedules, and monitoring host or service uptime.

**Common Syntax for nmap:**

```
$ nmap [-options] [HostName or IP] [-p] [PortNumber]
```

If it’s success then you will be getting the following output.

```
# nmap 192.168.1.8 -p 22

Starting Nmap 7.70 ( https://nmap.org ) at 2019-03-16 03:37 IST Nmap scan report for 192.168.1.8 Host is up (0.00031s latency).

PORT STATE SERVICE

22/tcp open ssh 

Nmap done: 1 IP address (1 host up) scanned in 13.06 seconds
```

If it’s fail then you will be getting the following output.

```
# nmap 192.168.1.8 -p 80
Starting Nmap 7.70 ( https://nmap.org ) at 2019-03-16 04:30 IST
Nmap scan report for 192.168.1.8
Host is up (0.00036s latency).

PORT   STATE  SERVICE
80/tcp closed http

Nmap done: 1 IP address (1 host up) scanned in 13.07 seconds
```

### How To Check Whether A Port Is Open On The Remote Linux System Using telnet Command?

The telnet command is used for interactive communication with another host using the TELNET protocol.

**Common Syntax for telnet:**

```
$ telnet [HostName or IP] [PortNumber]
```

If it’s success then you will be getting the following output.

```
$ telnet 192.168.1.9 22
Trying 192.168.1.9...
Connected to 192.168.1.9.
Escape character is '^]'.
SSH-2.0-OpenSSH_5.3
^]
Connection closed by foreign host.
```

If it’s fail then you will be getting the following output.

```
$ telnet 192.168.1.9 80
Trying 192.168.1.9...
telnet: Unable to connect to remote host: Connection refused
```

We had found only the above three methods. If you found any other ways, please let us know by updating your query in the comments section.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-check-whether-a-port-is-open-on-the-remote-linux-system-server/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
