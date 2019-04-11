[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Check The List Of Open Ports In Linux?)
[#]: via: (https://www.2daygeek.com/linux-scan-check-open-ports-using-netstat-ss-nmap/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How To Check The List Of Open Ports In Linux?
======

Recently we had written two articles in the same kind of topic.

Those articles helps you to check whether the given ports are open or not in the remote servers.

If you want to **[check whether a port is open on the remote Linux system][1]** then navigate to this article.

If you want to **[check whether a port is open on multiple remote Linux system][2]** then navigate to this article.

If you would like to **[check multiple ports status on multiple remote Linux system][2]** then navigate to this article.

But this article helps you to check the list of open ports on the local system.

There are few utilities are available in Linux for this purpose.

However, I’m including top four Linux commands to check this.

It can be done using the following four commands. These are very famous and widely used by Linux admins.

  * **`netstat:`** netstat (“network statistics”) is a command-line tool that displays network connections related information (both incoming and outgoing) such as routing tables, masquerade connections, multicast memberships and a number of network interface
  * **`nmap:`** Nmap (“Network Mapper”) is an open source tool for network exploration and security auditing. It was designed to rapidly scan large networks.
  * **`ss:`** ss is used to dump socket statistics. It allows showing information similar to netstat. It can display more TCP and state information than other tools.
  * **`lsof:`** lsof stands for List Open File. It is used to print all the open files which is opened by process.



### How To Check The List Of Open Ports In Linux Using netstat Command?

netstat stands for Network Statistics, is a command-line tool that displays network connections related information (both incoming and outgoing) such as routing tables, masquerade connections, multicast memberships and a number of network interface.

It lists out all the tcp, udp socket connections and the unix socket connections.

It is used for diagnosing network problems in the network and to determine the amount of traffic on the network as a performance measurement.

```
# netstat -tplugn

Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 0.0.0.0:25              0.0.0.0:*               LISTEN      2038/master
tcp        0      0 127.0.0.1:199           0.0.0.0:*               LISTEN      1396/snmpd
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      1398/httpd
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1388/sshd
tcp6       0      0 :::25                   :::*                    LISTEN      2038/master
tcp6       0      0 :::22                   :::*                    LISTEN      1388/sshd
udp        0      0 0.0.0.0:39136           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:56130           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:40105           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:11584           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:30105           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:50656           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:1632            0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:28265           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:40764           0.0.0.0:*                           1396/snmpd
udp        0      0 10.90.56.21:123         0.0.0.0:*                           895/ntpd
udp        0      0 127.0.0.1:123           0.0.0.0:*                           895/ntpd
udp        0      0 0.0.0.0:123             0.0.0.0:*                           895/ntpd
udp        0      0 0.0.0.0:53390           0.0.0.0:*                           1396/snmpd
udp        0      0 0.0.0.0:161             0.0.0.0:*                           1396/snmpd
udp6       0      0 :::123                  :::*                                895/ntpd

IPv6/IPv4 Group Memberships
Interface       RefCnt Group
--------------- ------ ---------------------
lo              1      224.0.0.1
eth0            1      224.0.0.1
lo              1      ff02::1
lo              1      ff01::1
eth0            1      ff02::1
eth0            1      ff01::1
```

If you would like to check any particular port status then use the following format.

```
# # netstat -tplugn | grep :22

tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      1388/sshd
tcp6       0      0 :::22                   :::*                    LISTEN      1388/sshd
```

### How To Check The List Of Open Ports In Linux Using ss Command?

ss is used to dump socket statistics. It allows showing information similar to netstat. It can display more TCP and state information than other tools.

```
# ss -lntu

Netid  State      Recv-Q Send-Q                     Local Address:Port                                    Peer Address:Port
udp    UNCONN     0      0                                      *:39136                                              *:*
udp    UNCONN     0      0                                      *:56130                                              *:*
udp    UNCONN     0      0                                      *:40105                                              *:*
udp    UNCONN     0      0                                      *:11584                                              *:*
udp    UNCONN     0      0                                      *:30105                                              *:*
udp    UNCONN     0      0                                      *:50656                                              *:*
udp    UNCONN     0      0                                      *:1632                                               *:*
udp    UNCONN     0      0                                      *:28265                                              *:*
udp    UNCONN     0      0                                      *:40764                                              *:*
udp    UNCONN     0      0                            10.90.56.21:123                                                *:*
udp    UNCONN     0      0                              127.0.0.1:123                                                *:*
udp    UNCONN     0      0                                      *:123                                                *:*
udp    UNCONN     0      0                                      *:53390                                              *:*
udp    UNCONN     0      0                                      *:161                                                *:*
udp    UNCONN     0      0                                     :::123                                               :::*
tcp    LISTEN     0      100                                    *:25                                                 *:*
tcp    LISTEN     0      128                            127.0.0.1:199                                                *:*
tcp    LISTEN     0      128                                    *:80                                                 *:*
tcp    LISTEN     0      128                                    *:22                                                 *:*
tcp    LISTEN     0      100                                   :::25                                                :::*
tcp    LISTEN     0      128                                   :::22                                                :::*
```

If you would like to check any particular port status then use the following format.

```
# # ss -lntu | grep ':25'

tcp    LISTEN     0      100       *:25                    *:*
tcp    LISTEN     0      100      :::25                   :::*
```

### How To Check The List Of Open Ports In Linux Using nmap Command?

Nmap (“Network Mapper”) is an open source tool for network exploration and security auditing. It was designed to rapidly scan large networks, although it works fine against single hosts.

Nmap uses raw IP packets in novel ways to determine what hosts are available on the network, what services (application name and version) those hosts are offering, what operating systems (and OS versions) they are running, what type of packet filters/firewalls are in use, and dozens of other characteristics.

While Nmap is commonly used for security audits, many systems and network administrators find it useful for routine tasks such as network inventory, managing service upgrade schedules, and monitoring host or service uptime.

```
# nmap -sTU -O localhost

Starting Nmap 6.40 ( http://nmap.org ) at 2019-03-20 09:57 CDT
Nmap scan report for localhost (127.0.0.1)
Host is up (0.00028s latency).
Other addresses for localhost (not scanned): 127.0.0.1
Not shown: 1994 closed ports

PORT    STATE SERVICE
22/tcp  open  ssh
25/tcp  open  smtp
80/tcp  open  http
199/tcp open  smux
123/udp open  ntp
161/udp open  snmp

Device type: general purpose
Running: Linux 3.X
OS CPE: cpe:/o:linux:linux_kernel:3
OS details: Linux 3.7 - 3.9
Network Distance: 0 hops

OS detection performed. Please report any incorrect results at http://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 1.93 seconds
```

If you would like to check any particular port status then use the following format.

```
# nmap -sTU -O localhost | grep 123

123/udp open  ntp
```

### How To Check The List Of Open Ports In Linux Using lsof Command?

It shows you the list of open files on the system and the processes that opened them. Also shows you other informations related to the files.

```
# lsof -i

COMMAND   PID   USER   FD   TYPE  DEVICE SIZE/OFF NODE NAME
ntpd      895    ntp   16u  IPv4   18481      0t0  UDP *:ntp
ntpd      895    ntp   17u  IPv6   18482      0t0  UDP *:ntp
ntpd      895    ntp   18u  IPv4   18487      0t0  UDP localhost:ntp
ntpd      895    ntp   20u  IPv4   23020      0t0  UDP CentOS7.2daygeek.com:ntp
sshd     1388   root    3u  IPv4   20065      0t0  TCP *:ssh (LISTEN)
sshd     1388   root    4u  IPv6   20067      0t0  TCP *:ssh (LISTEN)
snmpd    1396   root    6u  IPv4   22739      0t0  UDP *:snmp
snmpd    1396   root    7u  IPv4   22729      0t0  UDP *:40105
snmpd    1396   root    8u  IPv4   22730      0t0  UDP *:50656
snmpd    1396   root    9u  IPv4   22731      0t0  UDP *:pammratc
snmpd    1396   root   10u  IPv4   22732      0t0  UDP *:30105
snmpd    1396   root   11u  IPv4   22733      0t0  UDP *:40764
snmpd    1396   root   12u  IPv4   22734      0t0  UDP *:53390
snmpd    1396   root   13u  IPv4   22735      0t0  UDP *:28265
snmpd    1396   root   14u  IPv4   22736      0t0  UDP *:11584
snmpd    1396   root   15u  IPv4   22737      0t0  UDP *:39136
snmpd    1396   root   16u  IPv4   22738      0t0  UDP *:56130
snmpd    1396   root   17u  IPv4   22740      0t0  TCP localhost:smux (LISTEN)
httpd    1398   root    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
master   2038   root   13u  IPv4   21638      0t0  TCP *:smtp (LISTEN)
master   2038   root   14u  IPv6   21639      0t0  TCP *:smtp (LISTEN)
sshd     9052   root    3u  IPv4 1419955      0t0  TCP CentOS7.2daygeek.com:ssh->Ubuntu18-04.2daygeek.com:11408 (ESTABLISHED)
httpd   13371 apache    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
httpd   13372 apache    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
httpd   13373 apache    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
httpd   13374 apache    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
httpd   13375 apache    3u  IPv4   20337      0t0  TCP *:http (LISTEN)
```

If you would like to check any particular port status then use the following format.

```
# lsof -i:80

COMMAND   PID   USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
httpd    1398   root    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
httpd   13371 apache    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
httpd   13372 apache    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
httpd   13373 apache    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
httpd   13374 apache    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
httpd   13375 apache    3u  IPv4  20337      0t0  TCP *:http (LISTEN)
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/linux-scan-check-open-ports-using-netstat-ss-nmap/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/how-to-check-whether-a-port-is-open-on-the-remote-linux-system-server/
[2]: https://www.2daygeek.com/check-a-open-port-on-multiple-remote-linux-server-using-nc-command/
