Translating------------geekpi

10 basic examples of linux netstat command
================================================================================
### Netstat ###

Netstat is a command line utility that can be used to list out all the network (socket) connections on a system. It lists out all the tcp, udp socket connections and the unix socket connections. Apart from connected sockets it can also list listening sockets that are waiting for incoming connections. So by verifying an open port 80 you can confirm if a web server is running on the system or not. This makes it a very useful tool for network and system administrators. So in this tutorial we shall be checking out few examples of how to use netstat to find information about network connections and open ports on a system.

Here is a quick intro to netstat from the man pages

> netstat - Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships

### 1. List out all connections ###

The first and most simple command is to list out all the current connections. Simply run the netstat command with the a option.

    $ netstat -a

    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 enlightened:domain      *:*                     LISTEN     
    tcp        0      0 localhost:ipp           *:*                     LISTEN     
    tcp        0      0 enlightened.local:54750 li240-5.members.li:http ESTABLISHED
    tcp        0      0 enlightened.local:49980 del01s07-in-f14.1:https ESTABLISHED
    tcp6       0      0 ip6-localhost:ipp       [::]:*                  LISTEN     
    udp        0      0 enlightened:domain      *:*                                
    udp        0      0 *:bootpc                *:*                                
    udp        0      0 enlightened.local:ntp   *:*                                
    udp        0      0 localhost:ntp           *:*                                
    udp        0      0 *:ntp                   *:*                                
    udp        0      0 *:58570                 *:*                                
    udp        0      0 *:mdns                  *:*                                
    udp        0      0 *:49459                 *:*                                
    udp6       0      0 fe80::216:36ff:fef8:ntp [::]:*                             
    udp6       0      0 ip6-localhost:ntp       [::]:*                             
    udp6       0      0 [::]:ntp                [::]:*                             
    udp6       0      0 [::]:mdns               [::]:*                             
    udp6       0      0 [::]:63811              [::]:*                             
    udp6       0      0 [::]:54952              [::]:*                             
    Active UNIX domain sockets (servers and established)
    Proto RefCnt Flags       Type       State         I-Node   Path
    unix  2      [ ACC ]     STREAM     LISTENING     12403    @/tmp/dbus-IDgfj3UGXX
    unix  2      [ ACC ]     STREAM     LISTENING     40202    @/dbus-vfs-daemon/socket-6nUC6CCx

The above command shows all connections from different protocols like tcp, udp and unix sockets. However this is not quite useful. Administrators often want to pick out specific connections based on protocols or port numbers for example.

### 2. List only TCP or UDP connections ###

To list out only tcp connections use the t options.

    $ netstat -at
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 enlightened:domain      *:*                     LISTEN     
    tcp        0      0 localhost:ipp           *:*                     LISTEN     
    tcp        0      0 enlightened.local:36310 del01s07-in-f24.1:https ESTABLISHED
    tcp        0      0 enlightened.local:45038 a96-17-181-10.depl:http ESTABLISHED
    tcp        0      0 enlightened.local:37892 ABTS-North-Static-:http ESTABLISHED
    .....

Similarly to list out only udp connections use the u option.

    $ netstat -au
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    udp        0      0 *:34660                 *:*                                
    udp        0      0 enlightened:domain      *:*                                
    udp        0      0 *:bootpc                *:*                                
    udp        0      0 enlightened.local:ntp   *:*                                
    udp        0      0 localhost:ntp           *:*                                
    udp        0      0 *:ntp                   *:*                                
    udp6       0      0 fe80::216:36ff:fef8:ntp [::]:*                             
    udp6       0      0 ip6-localhost:ntp       [::]:*                             
    udp6       0      0 [::]:ntp                [::]:*

The above output shows both ipv4 and ipv6 connections.

### 3. Disable reverse dns lookup for faster output ###

By default, the netstat command tries to find out the hostname of each ip address in the connection by doing a reverse dns lookup. This slows down the output. If you do not need to know the host name and just the ip address is sufficient then suppress the hostname lookup with the n option.

    $ netstat -ant
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 127.0.1.1:53            0.0.0.0:*               LISTEN     
    tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN     
    tcp        0      0 192.168.1.2:49058       173.255.230.5:80        ESTABLISHED
    tcp        0      0 192.168.1.2:33324       173.194.36.117:443      ESTABLISHED
    tcp6       0      0 ::1:631                 :::*                    LISTEN

The above command shows ALL TCP connections with NO dns resolution. Got it ? Good.

### 4. List out only listening connections ###

Any network daemon/service keeps an open port to listen for incoming connections. These too are like socket connections and are listed out by netstat. To view only listening ports use the l options.

    $ netstat -tnl
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State      
    tcp        0      0 127.0.1.1:53            0.0.0.0:*               LISTEN     
    tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN     
    tcp6       0      0 ::1:631                 :::*                    LISTEN

Now we can see only listening tcp ports/connections. If you want to see all listening ports, remove the t option. If you want to see only listening udp ports use the u option instead of t.
Make sure to remove the 'a' option, otherwise all connections would get listed and not just the listening connections.

### 5. Get process name/pid and user id ###

When viewing the open/listening ports and connections, its often useful to know the process name/pid which has opened that port or connection. For example the Apache httpd server opens port 80. So if you want to check whether any http server is running or not, or which http server is running, apache or nginx, then track down the process name.

The process details are made available by the 'p' option.

    ~$ sudo netstat -nlpt
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 127.0.1.1:53            0.0.0.0:*               LISTEN      1144/dnsmasq    
    tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      661/cupsd       
    tcp6       0      0 ::1:631                 :::*                    LISTEN      661/cupsd

When using the p option, netstat must be run with root privileges, otherwise it cannot detect the pids of processes running with root privileges and most services like http and ftp often run with root privileges.

Along with process name/pid its even more useful to get the username/uid owning that particular process. Use the e option along with the p option to get the username too.

    $ sudo netstat -ltpe
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       User       Inode       PID/Program name
    tcp        0      0 enlightened:domain      *:*                     LISTEN      root       11090       1144/dnsmasq    
    tcp        0      0 localhost:ipp           *:*                     LISTEN      root       9755        661/cupsd       
    tcp6       0      0 ip6-localhost:ipp       [::]:*                  LISTEN      root       9754        661/cupsd

The above example lists out Listening connections of Tcp type with Process information and Extended information.
The extended information contains the username and inode of the process. This is a useful command for network administrators.

**Note** - If you use the n option with the e option, the uid would be listed and not the username.

### 6. Print statistics ###

The netstat command can also print out network statistics like total number of packets received and transmitted by protocol type and so on.

To list out statistics of all packet types

    $ netstat -s
    Ip:
        32797 total packets received
        0 forwarded
        0 incoming packets discarded
        32795 incoming packets delivered
        29115 requests sent out
        60 outgoing packets dropped
    Icmp:
        125 ICMP messages received
        0 input ICMP message failed.
        ICMP input histogram:
            destination unreachable: 125
        125 ICMP messages sent
        0 ICMP messages failed
        ICMP output histogram:
            destination unreachable: 125
    ... OUTPUT TRUNCATED ...

To print out statistics of only select protocols like TCP or UDP use the corresponding options like t and u along with the s option. Simple!

### 7. Display kernel routing information ###

The kernel routing information can be printed with the r option. It is the same output as given by the route command. We also use the n option to disable the hostname lookup.

    $ netstat -rn
    Kernel IP routing table
    Destination     Gateway         Genmask         Flags   MSS Window  irtt Iface
    0.0.0.0         192.168.1.1     0.0.0.0         UG        0 0          0 eth0
    192.168.1.0     0.0.0.0         255.255.255.0   U         0 0          0 eth0

### 8. Print network interfaces ###

The netstat command can also print out the information about the network interfaces. The i option does the task.

    $ netstat -i
    Kernel Interface table
    Iface   MTU Met   RX-OK RX-ERR RX-DRP RX-OVR    TX-OK TX-ERR TX-DRP TX-OVR Flg
    eth0       1500 0     31611      0      0 0         27503      0      0      0 BMRU
    lo        65536 0      2913      0      0 0          2913      0      0      0 LRU

The above output contains information in a very raw format. To get a more human friendly version of the output use the e option along with i.

    $ netstat -ie
    Kernel Interface table
    eth0      Link encap:Ethernet  HWaddr 00:16:36:f8:b2:64  
              inet addr:192.168.1.2  Bcast:192.168.1.255  Mask:255.255.255.0
              inet6 addr: fe80::216:36ff:fef8:b264/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:31682 errors:0 dropped:0 overruns:0 frame:0
              TX packets:27573 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:29637117 (29.6 MB)  TX bytes:4590583 (4.5 MB)
              Interrupt:18 Memory:da000000-da020000 
    
    lo        Link encap:Local Loopback  
              inet addr:127.0.0.1  Mask:255.0.0.0
              inet6 addr: ::1/128 Scope:Host
              UP LOOPBACK RUNNING  MTU:65536  Metric:1
              RX packets:2921 errors:0 dropped:0 overruns:0 frame:0
              TX packets:2921 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0 
              RX bytes:305297 (305.2 KB)  TX bytes:305297 (305.2 KB)

The above output is similar to the output shown by the ifconfig command.

### 9. Get netstat output continuously ###

Netstat can output connection information continuously with the c option.

    $ netstat -ct

The above command will output tcp connections continuously.

### 10. Display multicast group information ###

The g option will display the multicast group information for IPv4 and IPv6 protocols.

    $ netstat -g
    IPv6/IPv4 Group Memberships
    Interface       RefCnt Group
    --------------- ------ ---------------------
    lo              1      all-systems.mcast.net
    eth0            1      224.0.0.251
    eth0            1      all-systems.mcast.net
    lo              1      ip6-allnodes
    lo              1      ff01::1
    eth0            1      ff02::fb
    eth0            1      ff02::1:fff8:b264
    eth0            1      ip6-allnodes
    eth0            1      ff01::1
    wlan0           1      ip6-allnodes
    wlan0           1      ff01::1

### More examples of netstat command ###

Okay, we covered the basic examples of netstat command above. Now its time to do some geek stuff with style.

### Print active connections ###

Active socket connections are in "ESTABLISHED" state. So to get all current active connections use netstat with grep as follows

    $ netstat -atnp | grep ESTA
    (Not all processes could be identified, non-owned process info
     will not be shown, you would have to be root to see it all.)
    tcp        0      0 192.168.1.2:49156       173.255.230.5:80        ESTABLISHED 1691/chrome     
    tcp        0      0 192.168.1.2:33324       173.194.36.117:443      ESTABLISHED 1691/chrome

To watch a continous list of active connections, use the watch command along with netstat and grep

    $ watch -d -n0 "netstat -atnp | grep ESTA"

### Check if a service is running ###

If you want to check if a server like http,smtp or ntp is running or not, use grep again.

    $ sudo netstat -aple | grep ntp
    udp        0      0 enlightened.local:ntp   *:*                                 root       17430       1789/ntpd       
    udp        0      0 localhost:ntp           *:*                                 root       17429       1789/ntpd       
    udp        0      0 *:ntp                   *:*                                 root       17422       1789/ntpd       
    udp6       0      0 fe80::216:36ff:fef8:ntp [::]:*                              root       17432       1789/ntpd       
    udp6       0      0 ip6-localhost:ntp       [::]:*                              root       17431       1789/ntpd       
    udp6       0      0 [::]:ntp                [::]:*                              root       17423       1789/ntpd       
    unix  2      [ ]         DGRAM                    17418    1789/ntpd

So we found that ntp server is running. Grep for http or smtp or whatever you are looking for.

Well, that was most of what netstat is used for. If you are looking for more advanced information or want to dig deeper, read up the netstat manual (man netstat).

And do leave your feedback and suggestions in the comments box below.

--------------------------------------------------------------------------------

via: http://www.binarytides.com/linux-netstat-command-examples/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]: