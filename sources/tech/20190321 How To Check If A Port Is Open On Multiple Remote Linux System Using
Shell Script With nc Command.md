[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Check If A Port Is Open On Multiple Remote Linux System Using
Shell Script With nc Command?)
[#]: via: (https://www.2daygeek.com/check-a-open-port-on-multiple-remote-linux-server-using-nc-command/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Check If A Port Is Open On Multiple Remote Linux System Using
Shell Script With nc Command?
======

We had recently written an article to check if a port is open on the remote Linux server. It will help you to check for single server.

If you want to check for five servers then no issues, you can use any of the one following command such as nc (netcat), nmap and telnet.

If you would like to check for 50+ servers then what will be the solution?

It’s not easy to check all servers, if you do the same then there is no point and you will be wasting a lots of time unnecessarily.

To overcome this situation, i had coded a small shell script using nc command that will allow us to scan any number of servers with given port.

If you are looking for a single server scan then you have multiple options, to know more about it. Simply navigate to the following URL to **[Check Whether A Port Is Open On The Remote Linux System?][1]**

There are two scripts available in this tutorial and both the scripts are useful.

Both scripts are used for different purpose, which you can easily understand by reading a head line.

I will ask you few questions before you are reading this article, just answer yourself if you know or you can get it by reading this article.

How to check, if a port is open on the remote Linux server?

How to check, if a port is open on the multiple remote Linux server?

How to check, if multiple ports are open on the multiple remote Linux server?

### What Is nc (netcat) Command?

nc stands for netcat. Netcat is a simple Unix utility which reads and writes data across network connections, using TCP or UDP protocol.

It is designed to be a reliable “back-end” tool that can be used directly or easily driven by other programs and scripts.

At the same time, it is a feature-rich network debugging and exploration tool, since it can create almost any kind of connection you would need and has several interesting built-in capabilities.

Netcat has three main modes of functionality. These are the connect mode, the listen mode, and the tunnel mode.

**Common Syntax for nc (netcat):**

```
$ nc [-options] [HostName or IP] [PortNumber]
```

### How To Check If A Port Is Open On Multiple Remote Linux Server?

Use the following shell script if you would like to check the given port is open on multiple remote Linux servers or not.

In my case, we are going to check whether the port 22 is open in the following remote servers or not? Make sure you have to update your servers list in the file instead of us.

Make sure you have to update the servers list into `server-list.txt file`. Each server should be in separate line.

```
# cat server-list.txt
192.168.1.2
192.168.1.3
192.168.1.4
192.168.1.5
192.168.1.6
192.168.1.7
```

Use the following script to achieve this.

```
# vi port_scan.sh

#!/bin/sh
for server in `more server-list.txt`
do
#echo $i
nc -zvw3 $server 22
done
```

Set an executable permission to `port_scan.sh` file.

```
$ chmod +x port_scan.sh
```

Finally run the script to achieve this.

```
# sh port_scan.sh

Connection to 192.168.1.2 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.3 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.4 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.5 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.6 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.7 22 port [tcp/ssh] succeeded!
```

### How To Check If Multiple Ports Are Open On Multiple Remote Linux Server?

Use the following script if you want to check the multiple ports in multiple servers.

In my case, we are going to check whether the port 22 and 80 is open or not in the given servers. Make sure you have to replace your required ports and servers name instead of us.

Make sure you have to update the port lists into `port-list.txt` file. Each port should be in a separate line.

```
# cat port-list.txt
22
80
```

Make sure you have to update the servers list into `server-list.txt` file. Each server should be in separate line.

```
# cat server-list.txt
192.168.1.2
192.168.1.3
192.168.1.4
192.168.1.5
192.168.1.6
192.168.1.7
```

Use the following script to achieve this.

```
# vi multiple_port_scan.sh

#!/bin/sh
for server in `more server-list.txt`
do
for port in `more port-list.txt`
do
#echo $server
nc -zvw3 $server $port
echo ""
done
done
```

Set an executable permission to `multiple_port_scan.sh` file.

```
$ chmod +x multiple_port_scan.sh
```

Finally run the script to achieve this.

```
# sh multiple_port_scan.sh
Connection to 192.168.1.2 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.2 80 port [tcp/http] succeeded!

Connection to 192.168.1.3 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.3 80 port [tcp/http] succeeded!

Connection to 192.168.1.4 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.4 80 port [tcp/http] succeeded!

Connection to 192.168.1.5 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.5 80 port [tcp/http] succeeded!

Connection to 192.168.1.6 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.6 80 port [tcp/http] succeeded!

Connection to 192.168.1.7 22 port [tcp/ssh] succeeded!
Connection to 192.168.1.7 80 port [tcp/http] succeeded!
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/check-a-open-port-on-multiple-remote-linux-server-using-nc-command/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-check-whether-a-port-is-open-on-the-remote-linux-system-server/
