How To Find Out Which Port Number A Process Is Using In Linux
======
As a Linux administrator, you should know whether the corresponding service is binding/listening with correct port or not.

This will help you to easily troubleshoot further when you are facing port related issues.

A port is a logical connection that identifies a specific process on Linux. There are two kind of port are available like, physical and software.

Since Linux operating system is a software hence, we are going to discuss about software port.

Software port is always associated with an IP address of a host and the relevant protocol type for communication. The port is used to distinguish the application.

Most of the network related services have to open up a socket to listen incoming network requests. Socket is unique for every service.

**Suggested Read :**
**(#)** [4 Easiest Ways To Find Out Process ID (PID) In Linux][1]
**(#)** [3 Easy Ways To Kill Or Terminate A Process In Linux][2]

Socket is combination of IP address, software Port and protocol. The port numbers area available for both TCP and UDP protocol.

The Transmission Control Protocol (TCP) and the User Datagram Protocol (UDP) use port numbers for communication. It is a value from 0 to 65535.

Below are port assignments categories.

  * `0-1023:` Well Known Ports or System Ports
  * `1024-49151:` Registered Ports for applications
  * `49152-65535:` Dynamic Ports or Private Ports



You can check the details of the reserved ports in the /etc/services file on Linux.

```
# less /etc/services
# /etc/services:
# $Id: services,v 1.55 2013/04/14 ovasik Exp $
#
# Network services, Internet style
# IANA services version: last updated 2013-04-10
#
# Note that it is presently the policy of IANA to assign a single well-known
# port number for both TCP and UDP; hence, most entries here have two entries
# even if the protocol doesn't support UDP operations.
# Updated from RFC 1700, ``Assigned Numbers'' (October 1994). Not all ports
# are included, only the more common ones.
#
# The latest IANA port assignments can be gotten from
# http://www.iana.org/assignments/port-numbers
# The Well Known Ports are those from 0 through 1023.
# The Registered Ports are those from 1024 through 49151
# The Dynamic and/or Private Ports are those from 49152 through 65535
#
# Each line describes one service, and is of the form:
#
# service-name port/protocol [aliases ...] [# comment]

tcpmux 1/tcp # TCP port service multiplexer
tcpmux 1/udp # TCP port service multiplexer
rje 5/tcp # Remote Job Entry
rje 5/udp # Remote Job Entry
echo 7/tcp
echo 7/udp
discard 9/tcp sink null
discard 9/udp sink null
systat 11/tcp users
systat 11/udp users
daytime 13/tcp
daytime 13/udp
qotd 17/tcp quote
qotd 17/udp quote
msp 18/tcp # message send protocol (historic)
msp 18/udp # message send protocol (historic)
chargen 19/tcp ttytst source
chargen 19/udp ttytst source
ftp-data 20/tcp
ftp-data 20/udp
# 21 is registered to ftp, but also used by fsp
ftp 21/tcp
ftp 21/udp fsp fspd
ssh 22/tcp # The Secure Shell (SSH) Protocol
ssh 22/udp # The Secure Shell (SSH) Protocol
telnet 23/tcp
telnet 23/udp
# 24 - private mail system
lmtp 24/tcp # LMTP Mail Delivery
lmtp 24/udp # LMTP Mail Delivery

```

This can be achieved using the below six methods.

  * `ss:` ss is used to dump socket statistics.
  * `netstat:` netstat is displays a list of open sockets.
  * `lsof:` lsof – list open files.
  * `fuser:` fuser – list process IDs of all processes that have one or more files open
  * `nmap:` nmap – Network exploration tool and security / port scanner
  * `systemctl:` systemctl – Control the systemd system and service manager



In this tutorial we are going to find out which port number the SSHD daemon is using.

### Method-1: Using ss Command

ss is used to dump socket statistics. It allows showing information similar to netstat. It can display more TCP and state informations than other tools.

It can display stats for all kind of sockets such as PACKET, TCP, UDP, DCCP, RAW, Unix domain, etc.

```
# ss -tnlp | grep ssh
LISTEN 0 128 *:22 *:* users:(("sshd",pid=997,fd=3))
LISTEN 0 128 :::22 :::* users:(("sshd",pid=997,fd=4))
```

Alternatively you can check this with port number as well.

```
# ss -tnlp | grep ":22"
LISTEN 0 128 *:22 *:* users:(("sshd",pid=997,fd=3))
LISTEN 0 128 :::22 :::* users:(("sshd",pid=997,fd=4))
```

### Method-2: Using netstat Command

netstat – Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.

By default, netstat displays a list of open sockets. If you don’t specify any address families, then the active sockets of all configured address families will be printed. This program is obsolete. Replacement for netstat is ss.

```
# netstat -tnlp | grep ssh
tcp 0 0 0.0.0.0:22 0.0.0.0:* LISTEN 997/sshd
tcp6 0 0 :::22 :::* LISTEN 997/sshd
```

Alternatively you can check this with port number as well.

```
# netstat -tnlp | grep ":22"
tcp 0 0 0.0.0.0:22 0.0.0.0:* LISTEN 1208/sshd
tcp6 0 0 :::22 :::* LISTEN 1208/sshd
```

### Method-3: Using lsof Command

lsof – list open files. The Linux lsof command lists information about files that are open by processes running on the system.

```
# lsof -i -P | grep ssh
COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME
sshd 11584 root 3u IPv4 27625 0t0 TCP *:22 (LISTEN)
sshd 11584 root 4u IPv6 27627 0t0 TCP *:22 (LISTEN)
sshd 11592 root 3u IPv4 27744 0t0 TCP vps.2daygeek.com:ssh->103.5.134.167:49902 (ESTABLISHED)
```

Alternatively you can check this with port number as well.

```
# lsof -i tcp:22
COMMAND PID USER FD TYPE DEVICE SIZE/OFF NODE NAME
sshd 1208 root 3u IPv4 20919 0t0 TCP *:ssh (LISTEN)
sshd 1208 root 4u IPv6 20921 0t0 TCP *:ssh (LISTEN)
sshd 11592 root 3u IPv4 27744 0t0 TCP vps.2daygeek.com:ssh->103.5.134.167:49902 (ESTABLISHED)
```

### Method-4: Using fuser Command

The fuser utility shall write to standard output the process IDs of processes running on the local system that have one or more named files open.

```
# fuser -v 22/tcp
 USER PID ACCESS COMMAND
22/tcp: root 1208 F.... sshd
 root 12388 F.... sshd
 root 49339 F.... sshd
```

### Method-5: Using nmap Command

Nmap (“Network Mapper”) is an open source tool for network exploration and security auditing. It was designed to rapidly scan large networks, although it works fine against single hosts.

Nmap uses raw IP packets in novel ways to determine what hosts are available on the network, what services (application name and version) those hosts are offering, what operating systems (and OS versions) they are running, what type of packet filters/firewalls are in use, and dozens of other characteristics.

```
# nmap -sV -p 22 localhost

Starting Nmap 6.40 ( http://nmap.org ) at 2018-09-23 12:36 IST
Nmap scan report for localhost (127.0.0.1)
Host is up (0.000089s latency).
Other addresses for localhost (not scanned): 127.0.0.1
PORT STATE SERVICE VERSION
22/tcp open ssh OpenSSH 7.4 (protocol 2.0)

Service detection performed. Please report any incorrect results at http://nmap.org/submit/ .
Nmap done: 1 IP address (1 host up) scanned in 0.44 seconds
```

### Method-6: Using systemctl Command

systemctl – Control the systemd system and service manager. This is the replacement of old SysV init system management and most of the modern Linux operating systems were adapted systemd.

**Suggested Read :**
**(#)** [chkservice – A Tool For Managing Systemd Units From Linux Terminal][3]
**(#)** [How To Check All Running Services In Linux][4]

```
# systemctl status sshd
● sshd.service - OpenSSH server daemon
 Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
 Active: active (running) since Sun 2018-09-23 02:08:56 EDT; 6h 11min ago
 Docs: man:sshd(8)
 man:sshd_config(5)
 Main PID: 11584 (sshd)
 CGroup: /system.slice/sshd.service
 └─11584 /usr/sbin/sshd -D

Sep 23 02:08:56 vps.2daygeek.com systemd[1]: Starting OpenSSH server daemon...
Sep 23 02:08:56 vps.2daygeek.com sshd[11584]: Server listening on 0.0.0.0 port 22.
Sep 23 02:08:56 vps.2daygeek.com sshd[11584]: Server listening on :: port 22.
Sep 23 02:08:56 vps.2daygeek.com systemd[1]: Started OpenSSH server daemon.
Sep 23 02:09:15 vps.2daygeek.com sshd[11589]: Connection closed by 103.5.134.167 port 49899 [preauth]
Sep 23 02:09:41 vps.2daygeek.com sshd[11592]: Accepted password for root from 103.5.134.167 port 49902 ssh2
```

The above out will be showing the actual listening port of SSH service when you start the SSHD service recently. Otherwise it won’t because it updates recent logs in the output frequently.

```
# systemctl status sshd
● sshd.service - OpenSSH server daemon
 Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
 Active: active (running) since Thu 2018-09-06 07:40:59 IST; 2 weeks 3 days ago
 Docs: man:sshd(8)
 man:sshd_config(5)
 Main PID: 1208 (sshd)
 CGroup: /system.slice/sshd.service
 ├─ 1208 /usr/sbin/sshd -D
 ├─23951 sshd: [accepted]
 └─23952 sshd: [net]

Sep 23 12:50:36 vps.2daygeek.com sshd[23909]: Invalid user pi from 95.210.113.142 port 51666
Sep 23 12:50:36 vps.2daygeek.com sshd[23909]: input_userauth_request: invalid user pi [preauth]
Sep 23 12:50:37 vps.2daygeek.com sshd[23911]: pam_unix(sshd:auth): check pass; user unknown
Sep 23 12:50:37 vps.2daygeek.com sshd[23911]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=95.210.113.142
Sep 23 12:50:37 vps.2daygeek.com sshd[23909]: pam_unix(sshd:auth): check pass; user unknown
Sep 23 12:50:37 vps.2daygeek.com sshd[23909]: pam_unix(sshd:auth): authentication failure; logname= uid=0 euid=0 tty=ssh ruser= rhost=95.210.113.142
Sep 23 12:50:39 vps.2daygeek.com sshd[23911]: Failed password for invalid user pi from 95.210.113.142 port 51670 ssh2
Sep 23 12:50:39 vps.2daygeek.com sshd[23909]: Failed password for invalid user pi from 95.210.113.142 port 51666 ssh2
Sep 23 12:50:40 vps.2daygeek.com sshd[23911]: Connection closed by 95.210.113.142 port 51670 [preauth]
Sep 23 12:50:40 vps.2daygeek.com sshd[23909]: Connection closed by 95.210.113.142 port 51666 [preauth]
```

Most of the time the above output won’t shows the process actual port number. in this case i would suggest you to check the details using the below command from the journalctl log file.

```
# journalctl | grep -i "openssh\|sshd"
Sep 23 02:08:56 vps138235.vps.ovh.ca sshd[997]: Received signal 15; terminating.
Sep 23 02:08:56 vps138235.vps.ovh.ca systemd[1]: Stopping OpenSSH server daemon...
Sep 23 02:08:56 vps138235.vps.ovh.ca systemd[1]: Starting OpenSSH server daemon...
Sep 23 02:08:56 vps138235.vps.ovh.ca sshd[11584]: Server listening on 0.0.0.0 port 22.
Sep 23 02:08:56 vps138235.vps.ovh.ca sshd[11584]: Server listening on :: port 22.
Sep 23 02:08:56 vps138235.vps.ovh.ca systemd[1]: Started OpenSSH server daemon.
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-find-out-which-port-number-a-process-is-using-in-linux/

作者：[Prakash Subramanian][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[1]: https://www.2daygeek.com/how-to-check-find-the-process-id-pid-ppid-of-a-running-program-in-linux/
[2]: https://www.2daygeek.com/kill-terminate-a-process-in-linux-using-kill-pkill-killall-command/
[3]: https://www.2daygeek.com/chkservice-a-tool-for-managing-systemd-units-from-linux-terminal/
[4]: https://www.2daygeek.com/how-to-check-all-running-services-in-linux/
