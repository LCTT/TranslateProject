translating---geekpi

How to Check Remote Ports are Reachable Using ‘nc’ Command
============================================================

A port is a logical entity which acts as a endpoint of communication associated with an application or process on an Linux operating system. It is useful to know which ports are open and running services on a target machine before using them.

We can easily [list open ports in Linux][3] on a local machine using the [netstat][4] or several other Linux commands such [NMAP][5].

In this guide, we will show you how to determine if ports on a remote host are reachable/open using simple netcat (in short nc) command.

netcat (or nc in short) is a powerful and easy-to-use utility that can be employed for just about anything in Linux in relation to TCP, UDP, or UNIX-domain sockets.

```
# yum install nc                  [On CentOS/RHEL]
# dnf install nc                  [On Fedora 22+]
$ sudo apt-get install netcat     [On Debian/Ubuntu]
```

We can use it to: open TCP connections, listen on arbitrary TCP and UDP ports, send UDP packets, do port scanning under both IPv4 and IPv6 and beyond.

Using netcat, you can check if a single or multiple or a range of open ports as follows. The command below will help us see if the port 22 is open on the host 192.168.56.10:

```
$ nc -zv 192.168.1.15 22
```

In the command above, the flag:

1.  `-z` – sets nc to simply scan for listening daemons, without actually sending any data to them.
2.  `-v` – enables verbose mode.

The next command will check if ports 80, 22 and 21 are open on the remote host 192.168.5.10 (we can use the hostname as well):
nc -zv 192.168.56.10 80 22 21

It is also possible to specify a range of ports to be scanned:’

```
$ nc -zv 192.168.56.10 20-80
```

For more examples and usage of netcat command, read through our articles as follows.

1.  [Transfer Files Between Linux Servers Using netcat Command][1]
2.  [Linux Network Configuration and Troubleshooting Commands][2]

That’s all. In this article, we explained how to check if ports on a remote host are reachable/open using simple netcat commands. Make use of the comment section below to write back to us concerning about this tip.

--------------------------------------------------------------------------------

译者简介：

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/check-remote-port-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/transfer-files-between-two-linux-machines/
[2]:http://www.tecmint.com/linux-network-configuration-and-troubleshooting-commands/
[3]:http://www.tecmint.com/find-open-ports-in-linux/
[4]:http://www.tecmint.com/20-netstat-commands-for-linux-network-management/
[5]:http://www.tecmint.com/nmap-command-examples/
