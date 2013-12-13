29 Practical Examples of Nmap Commands for Linux System/Network Administrators
================================================================================
The **Nmap** aka **Network Mapper** is an open source and a very versatile tool for Linux system/network administrators. **Nmap** is used for **exploring networks, perform security scans, network audit** and **finding open ports** on remote machine. It scans for Live hosts, Operating systems, packet filters and open ports running on remote hosts.

![Nmap Commands](http://www.tecmint.com/wp-content/uploads/2013/12/Nmap-Commands.png)
*Nmap Commands and Examples*

I’ll be covering most of **NMAP** usage in two different parts and this is the first part of nmap serious. Here in this setup, I have used two servers without firewall to test the working of the Nmap command.

- 192.168.0.100 – server1.tecmint.com
- 192.168.0.101 – server2.tecmint.com

### Nmap command usage ###

    # nmap [Scan Type(s)] [Options] {target specification}

### How to Install NMAP in Linux ###

Most of the today’s Linux distributions like **Red Hat, CentOS, Fedoro, Debian** and **Ubuntu** have included **Nmap** in their default package management repositories called [Yum][1] and [APT][2]. The both tools are used to install and manage software packages and updates. To install **Nmap** on distribution specific use the following command.

    # yum install nmap		[on Red Hat based systems]
    $ sudo apt-get install nmap	[on Debian based systems]

Once you’ve install latest nmap application, you can follow the example instructions provided in this article.

### 1. Scan a System with Hostname and IP Address ###

The **Nmap** tool offers various methods to scan a system. In this example, I am performing a scan using hostname as **server2.tecmint.com** to find out all open ports, services and MAC address on the system.

#### Scan using Hostname ####

    [root@server1 ~]# nmap server2.tecmint.com
    
    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 15:42 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.415 seconds
    You have new mail in /var/spool/mail/root

#### Scan using IP Address ####

    [root@server1 ~]# nmap 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-18 11:04 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    958/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.465 seconds
    You have new mail in /var/spool/mail/root

### 2. Scan using “-v” option ###

You can see that the below command with “**-v**” option is giving more detailed information about the remote machine.

    [root@server1 ~]# nmap -v server2.tecmint.com

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 15:43 EST
    Initiating ARP Ping Scan against 192.168.0.101 [1 port] at 15:43
    The ARP Ping Scan took 0.01s to scan 1 total hosts.
    Initiating SYN Stealth Scan against server2.tecmint.com (192.168.0.101) [1680 ports] at 15:43
    Discovered open port 22/tcp on 192.168.0.101
    Discovered open port 80/tcp on 192.168.0.101
    Discovered open port 8888/tcp on 192.168.0.101
    Discovered open port 111/tcp on 192.168.0.101
    Discovered open port 3306/tcp on 192.168.0.101
    Discovered open port 957/tcp on 192.168.0.101
    The SYN Stealth Scan took 0.30s to scan 1680 total ports.
    Host server2.tecmint.com (192.168.0.101) appears to be up ... good.
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.485 seconds
                   Raw packets sent: 1681 (73.962KB) | Rcvd: 1681 (77.322KB)

#### Scan Multiple Hosts ####

You can scan multiple hosts by simply writing their IP addresses or hostnames with Nmap.

    [root@server1 ~]# nmap 192.168.0.101 192.168.0.102 192.168.0.103

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 16:06 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)
    Nmap finished: 3 IP addresses (1 host up) scanned in 0.580 seconds

### 4. Scan a whole Subnet ###

You can scan a whole subnet or IP range with Nmap by providing *** wildcard** with it.

    [root@server1 ~]# nmap 192.168.0.*

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 16:11 EST
    Interesting ports on server1.tecmint.com (192.168.0.100):
    Not shown: 1677 closed ports
    PORT    STATE SERVICE
    22/tcp  open  ssh
    111/tcp open  rpcbind
    851/tcp open  unknown

    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 256 IP addresses (2 hosts up) scanned in 5.550 seconds
    You have new mail in /var/spool/mail/root

On above output you can see that nmap scanned a whole subnet and gave the information about those hosts which are **Up** in the **Network**.

### 5. Scan Multiple Servers using last octet of IP address ###

You can perform scans on multiple IP address by simple specifying last octet of IP address. For example, here I performing a scan on IP addresses 192.168.0.101, 192.168.0.102 and 192.168.0.103.

    [root@server1 ~]# nmap 192.168.0.101,102,103

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 16:09 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 3 IP addresses (1 host up) scanned in 0.552 seconds
    You have new mail in /var/spool/mail/root

### 6. Scan list of Hosts from a File ###

If you have more hosts to scan and all host details are written in a file , you can directly ask nmap to read that file and perform scans. Let’s see how to do that.

Create a text file called “**nmaptest.txt**” and define all the IP addresses or hostname of the server that you want to do a scan.

    [root@server1 ~]# cat > nmaptest.txt

    localhost
    server2.tecmint.com
    192.168.0.101

Next, run the following command with “**iL**” option with nmap command to scan all listed IP address in the file.

    [root@server1 ~]# nmap -iL nmaptest.txt

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-18 10:58 EST
    Interesting ports on localhost.localdomain (127.0.0.1):
    Not shown: 1675 closed ports
    PORT    STATE SERVICE
    22/tcp  open  ssh
    25/tcp  open  smtp
    111/tcp open  rpcbind
    631/tcp open  ipp
    857/tcp open  unknown

    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    958/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    958/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 3 IP addresses (3 hosts up) scanned in 2.047 seconds

### 7. Scan an IP Address Range ###

You can specify an IP range while performing scan with Nmap.

    [root@server1 ~]# nmap 192.168.0.101-110

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 16:09 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 10 IP addresses (1 host up) scanned in 0.542 seconds

### 8. Scan Network Excluding Remote Hosts ###

You can exclude some hosts while performing a full network scan or when you are scanning with wildcards with “**–exclude**” option.

    [root@server1 ~]# nmap 192.168.0.* --exclude 192.168.0.100

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 16:16 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 255 IP addresses (1 host up) scanned in 5.313 seconds
    You have new mail in /var/spool/mail/root

### 9. Scan OS information and Traceroute ###

With Nmap, you can detect which OS and version is running on the remote host. To enable OS & version detection, script scanning and traceroute, we can use “**-A**” option with NMAP.

    [root@server1 ~]# nmap -A 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 16:25 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE VERSION
    22/tcp   open  ssh     OpenSSH 4.3 (protocol 2.0)
    80/tcp   open  http    Apache httpd 2.2.3 ((CentOS))
    111/tcp  open  rpcbind  2 (rpc #100000)
    957/tcp  open  status   1 (rpc #100024)
    3306/tcp open  mysql   MySQL (unauthorized)
    8888/tcp open  http    lighttpd 1.4.32
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)
    No exact OS matches for host (If you know what OS is running on it, see http://www.insecure.org/cgi-bin/nmap-submit.cgi).
    TCP/IP fingerprint:
    SInfo(V=4.11%P=i686-redhat-linux-gnu%D=11/11%Tm=52814B66%O=22%C=1%M=080027)
    TSeq(Class=TR%IPID=Z%TS=1000HZ)
    T1(Resp=Y%DF=Y%W=16A0%ACK=S++%Flags=AS%Ops=MNNTNW)
    T2(Resp=N)
    T3(Resp=Y%DF=Y%W=16A0%ACK=S++%Flags=AS%Ops=MNNTNW)
    T4(Resp=Y%DF=Y%W=0%ACK=O%Flags=R%Ops=)
    T5(Resp=Y%DF=Y%W=0%ACK=S++%Flags=AR%Ops=)
    T6(Resp=Y%DF=Y%W=0%ACK=O%Flags=R%Ops=)
    T7(Resp=Y%DF=Y%W=0%ACK=S++%Flags=AR%Ops=)
    PU(Resp=Y%DF=N%TOS=C0%IPLEN=164%RIPTL=148%RID=E%RIPCK=E%UCK=E%ULEN=134%DAT=E)

    Uptime 0.169 days (since Mon Nov 11 12:22:15 2013)

    Nmap finished: 1 IP address (1 host up) scanned in 22.271 seconds
    You have new mail in /var/spool/mail/root

In above Output, you can see that nmap is came up with TCP/IP fingerprint of the OS running on remote hosts and being more specific about the port and services running on the remote hosts.

### 10. Enable OS Detection with Nmap ###

Use the option “-O” and “-osscan-guess” also helps to discover OS information.

    [root@server1 ~]# nmap -O server2.tecmint.com

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 17:40 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)
    No exact OS matches for host (If you know what OS is running on it, see http://www.insecure.org/cgi-bin/nmap-submit.cgi).
    TCP/IP fingerprint:
    SInfo(V=4.11%P=i686-redhat-linux-gnu%D=11/11%Tm=52815CF4%O=22%C=1%M=080027)
    TSeq(Class=TR%IPID=Z%TS=1000HZ)
    T1(Resp=Y%DF=Y%W=16A0%ACK=S++%Flags=AS%Ops=MNNTNW)
    T2(Resp=N)
    T3(Resp=Y%DF=Y%W=16A0%ACK=S++%Flags=AS%Ops=MNNTNW)
    T4(Resp=Y%DF=Y%W=0%ACK=O%Flags=Option -O and -osscan-guess also helps to discover OSR%Ops=)
    T5(Resp=Y%DF=Y%W=0%ACK=S++%Flags=AR%Ops=)
    T6(Resp=Y%DF=Y%W=0%ACK=O%Flags=R%Ops=)
    T7(Resp=Y%DF=Y%W=0%ACK=S++%Flags=AR%Ops=)
    PU(Resp=Y%DF=N%TOS=C0%IPLEN=164%RIPTL=148%RID=E%RIPCK=E%UCK=E%ULEN=134%DAT=E)

    Uptime 0.221 days (since Mon Nov 11 12:22:16 2013)

    Nmap finished: 1 IP address (1 host up) scanned in 11.064 seconds
    You have new mail in /var/spool/mail/root

### 11. Scan a Host to Detect Firewall ###

The below command will perform a scan on a remote host to detect if any packet filters or Firewall is used by host.

    [root@server1 ~]# nmap -sA 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 16:27 EST
    All 1680 scanned ports on server2.tecmint.com (192.168.0.101) are UNfiltered
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.382 seconds
    You have new mail in /var/spool/mail/root

### 12. Scan a Host to check its protected by Firewall ###

To scan a host if it is protected by any packet filtering software or Firewalls.

    [root@server1 ~]# nmap -PN 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 16:30 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.399 seconds

### 13. Find out Live hosts in a Network ###

With the help of “**-sP**” option we can simply check which hosts are live and up in Network, with this option nmap skips port detection and other things.

    [root@server1 ~]# nmap -sP 192.168.0.*

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-18 11:01 EST
    Host server1.tecmint.com (192.168.0.100) appears to be up.
    Host server2.tecmint.com (192.168.0.101) appears to be up.
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)
    Nmap finished: 256 IP addresses (2 hosts up) scanned in 5.109 seconds

### 14. Perform a Fast Scan ###

You can perform a fast scan with “**-F**” option to scans for the ports listed in the nmap-services files and leaves all other ports.

    [root@server1 ~]# nmap -F 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 16:47 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1234 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.322 seconds

### 15. Find Nmap version ###

You can find out Nmap version you are running on your machine with “**-V**” option.

    [root@server1 ~]# nmap -V

    Nmap version 4.11 ( http://www.insecure.org/nmap/ )
    You have new mail in /var/spool/mail/root

### 16. Scan Ports Consecutively ###

Use the “**-r**” flag to don’t randomize.

    [root@server1 ~]# nmap -r 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 16:52 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.363 seconds

17. Print Host interfaces and Routes

You can find out host interface and route information with nmap by using “**–iflist**” option.

    [root@server1 ~]# nmap --iflist

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 17:07 EST
    ************************INTERFACES************************
    DEV  (SHORT) IP/MASK          TYPE     UP MAC
    lo   (lo)    127.0.0.1/8      loopback up
    eth0 (eth0)  192.168.0.100/24 ethernet up 08:00:27:11:C7:89
    
    **************************ROUTES**************************
    DST/MASK      DEV  GATEWAY
    192.168.0.0/0 eth0
    169.254.0.0/0 eth0

In above output, you can see that map is listing interfaces attached to your system and their respective routes.

### 18. Scan for specific Port ###

There are various options to discover ports on remote machine with Nmap. You can specify the port you want nmap to scan with “**-p**” option, by default nmap scans only **TCP** ports.

    [root@server1 ~]# nmap -p 80 server2.tecmint.com

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 17:12 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    PORT   STATE SERVICE
    80/tcp open  http
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) sca

### 19. Scan a TCP Port ###

You can also specify specific port types and numbers with nmap to scan.

    [root@server1 ~]# nmap -p T:8888,80 server2.tecmint.com

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 17:15 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    PORT     STATE SERVICE
    80/tcp   open  http
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.157 seconds

### 20. Scan a UDP Port ###

    [root@server1 ~]# nmap -sU 53 server2.tecmint.com

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 17:15 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    PORT     STATE SERVICE
    53/udp   open  http
    8888/udp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.157 seconds

### 21. Scan Multiple Ports ###

You can also scan multiple ports using option “**-p**“.

    [root@server1 ~]# nmap -p 80,443 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-18 10:56 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    PORT    STATE  SERVICE
    80/tcp  open   http
    443/tcp closed https
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.190 seconds

### 22. Scan Ports by Network Range ###

You can scan ports with ranges using expressions.

    [root@server1 ~]#  nmap -p 80-160 192.168.0.101

### 23. Find Host Services version Numbers ###

We can find out service’s versions which are running on remote hosts with “**-sV**” option.

    [root@server1 ~]# nmap -sV 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 17:48 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE VERSION
    22/tcp   open  ssh     OpenSSH 4.3 (protocol 2.0)
    80/tcp   open  http    Apache httpd 2.2.3 ((CentOS))
    111/tcp  open  rpcbind  2 (rpc #100000)
    957/tcp  open  status   1 (rpc #100024)
    3306/tcp open  mysql   MySQL (unauthorized)
    8888/tcp open  http    lighttpd 1.4.32
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 12.624 seconds

#### 24. Scan remote hosts using TCP ACK (PA) and TCP Syn (PS) ####

Sometimes packet filtering firewalls blocks standard **ICMP** ping requests, in that case, we can use **TCP ACK** and **TCP Syn** methods to scan remote hosts.

    [root@server1 ~]# nmap -PS 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 17:51 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.360 seconds
    You have new mail in /var/spool/mail/root

### 25. Scan Remote host for specific ports with TCP ACK ###

    [root@server1 ~]# nmap -PA -p 22,80 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 18:02 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    PORT   STATE SERVICE
    22/tcp open  ssh
    80/tcp open  http
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.166 seconds
    You have new mail in /var/spool/mail/root

### 26. Scan Remote host for specific ports with TCP Syn ###

    [root@server1 ~]# nmap -PS -p 22,80 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 18:08 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    PORT   STATE SERVICE
    22/tcp open  ssh
    80/tcp open  http
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.165 seconds
    You have new mail in /var/spool/mail/root

### 27. Perform a stealthy Scan ###

    [root@server1 ~]# nmap -sS 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 18:10 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.383 seconds
    You have new mail in /var/spool/mail/root

### 28. Check most commonly used Ports with TCP Syn ###

    [root@server1 ~]# nmap -sT 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 18:12 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE SERVICE
    22/tcp   open  ssh
    80/tcp   open  http
    111/tcp  open  rpcbind
    957/tcp  open  unknown
    3306/tcp open  mysql
    8888/tcp open  sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 0.406 seconds
    You have new mail in /var/spool/mail/root

### 29. Perform a tcp null scan to fool a firewall ###

    [root@server1 ~]# nmap -sN 192.168.0.101

    Starting Nmap 4.11 ( http://www.insecure.org/nmap/ ) at 2013-11-11 19:01 EST
    Interesting ports on server2.tecmint.com (192.168.0.101):
    Not shown: 1674 closed ports
    PORT     STATE         SERVICE
    22/tcp   open|filtered ssh
    80/tcp   open|filtered http
    111/tcp  open|filtered rpcbind
    957/tcp  open|filtered unknown
    3306/tcp open|filtered mysql
    8888/tcp open|filtered sun-answerbook
    MAC Address: 08:00:27:D9:8E:D7 (Cadmus Computer Systems)

    Nmap finished: 1 IP address (1 host up) scanned in 1.584 seconds
    You have new mail in /var/spool/mail/root

That’s it with **NMAP** for now, I’ll be coming up more creative options of **NMAP** in our second part of this serious. Till then, stay tuned with us and don’t forget to share your valuable comments.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/nmap-command-examples/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[2]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/