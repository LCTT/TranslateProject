Bringing a Bunch of Best Known Linux Network Tools
================================================================================
It is very useful to use command line tools to monitor the network on your system and there are a tons of them out there available for the linux user such as nethogs, ntopng, nload, iftop, iptraf, bmon, slurm, tcptrack, cbm, netwatch, collectl, trafshow, cacti, etherape, ipband, jnettop, netspeed and speedometer.

Since there are many linux gurus and developers out there it is obvious that other network monitoring tools exist but I am not going to cover all of them in this tutorial.

Each one of the above tools has its own specifics but at the end all they do is monitor network traffic and there is not really only one way to do the job. For example nethogs can be used to show bandwidth per process in case you want to know the application which is consuming your entire network resources, iftop can be used to show bandwidth per socket connection and tools like nload help to get information about the overall bandwidth.

### 1) nethogs ###

nethogs is a free tool that is very handy when it comes to find out which PID is causing the trouble with your network traffic as it groups bandwidth by process instead of breaking the traffic down per protocol or per subnet, like most tools do. It is feature rich, supports both IPv4 and IPv6 and in my opinion is the best utility when you want to identify programs that are consuming all your bandwidth on your linux machine.

A linux user can use **nethogs** to show TCP download and upload-speed per process, monitor a specific device by using the command **nethogs eth0** where eth0 is the name of the device you want to get information from and also get information on the speed at which the data is currently being transferred.

To me nethogs is very easy to use, maybe because I like it so much that I use it all the time to monitor network bandwidth on my Ubuntu 12.04 LTS machine.

For example to sniff in promiscious the option -p is used like shown in the following command.

    nethogs -p wlan0

If you like to learn more about nethogs and explore it in a very deep way than don't hesitate to read our full tutorial on this network bandwidth monitoring tool.

### 2) nload ###

nload is a console application which can be used to monitor network traffic and bandwidth usage in real time and it also visualizes the traffic by providing two easy to understand graphs. This cool network monitoring tool can also be used to switch between devices while monitoring and this can be done by pressing the left and right arrow keys.

![network monitoring tools in linux](http://blog.linoxide.com/wp-content/uploads/2015/01/nload8.png)

As you can see from the above screenshot graphs provided by the nload tool are very easy to understand, provide useful information and also display additional info like total amount of transferred data and min/max network usage.

And what is even cooler is the fact that you can run the tool nload with the help of the following command which seems to be very short and easy to remember.

    nload

I am very sure that our detailed tutorial on how to use nload will help new linux users and even experienced ones that are looking for more information on it.

### 3) slurm ###

slurm is another network load monitoring tool for linux which shows results in a nice ascii grap and it also supports many keys for interaction such as c to switch to classic mode, s to switch to split graph mode, **r** to redraw the screen, **L** to enable TX/RX led, **m** to switch between classic split and large view, and **q** to quit slurm.

![linux network load monitoring tools](http://blog.linoxide.com/wp-content/uploads/2013/12/slurm2.png)

There are also some other keys available in the network load monitoring tool slurm and you can easily study them in the manual page by using the following command.

    man slurm

slurm is available in the official repos of Ubuntu and Debian so users of these distros can easy download it by using the apt-get install command like shown below.

    sudo apt-get install slurm

We have covered slurm usage on a tutorial so please visit it and do not forget to share the knowledge with other linux friends.

### 4) iftop ###

iftop is a very useful tool when you want to display bandwidth usage on an interface by host. According to the manual page **iftop** listens to network traffic on a named interface, or on the first
interface it can find which looks like an external interface if none is specified, and displays a table of current bandwidth usage by pairs of hosts.

Ubuntu and Debian users can easily install iftop on their machines by using the following command on a terminal.

    sudo apt-get install iftop

Use the following command to install iftop on your machine using yum

    yum -y install iftop

### 5) collectl ###

collectl can be used to collect data that describes the current system status and it supports the following modes:

- Record Mode
- Playback Mode

**Record Mode** allows to take data from a live system and either display it on a terminal or writte to one or more files or a socket.

**Playback Mode**

According to the manual pages in this mode data is read from one or more data files that were generated in Record Mode.

Ubuntu and Debian users can use their default package manager to install collectl on their machines. The following command will do the job for them.

    sudo apt-get install collectl

Use the following command because these distros have collectl in their official repos too.

    yum install collectl

### 6) Netstat ###

Netstat is a command line tool for **monitoring incoming** and **outgoing network packets statistics** as well as interface statistics. It displays network connections for the Transmission Control Protocol (both incoming and outgoing),routing tables, and a number of network interface (network interface controller or software-defined network interface) and network protocol statistics.

Ubuntu and Debian users can use the default package manager to install netstat on their box. Netstat software includes inside the package net-tools. And can be installed by running the below commands in a shell or terminal:

    sudo apt-get install net-tools

CentOS, Fedora, RHEL users can use the default package manager to install netstat on their box. Netstat software includes inside the package net-tools. And can be installed by running the below commands in a shell or terminal:

    yum install net-tools

Simply, run the following to monitor the network packet statistic with Netstat:

    netstat

![Netstat](http://blog.linoxide.com/wp-content/uploads/2015/02/netstat.png)

For more information or manual about netstat, we can simply type man netstat in a shell or terminal:

    man netstat

![man netstat](http://blog.linoxide.com/wp-content/uploads/2015/02/man-netstat.png)

### 7) Netload ###

The netload command just displays a small report on the current traffic load, and the total number of bytes transferred since the program start. No more features are there. Its part of the netdiag.

We can install Netload using yum in fedora as it is in the default repository. But if you're running CentOS or RHEL, we'll need to install [rpmforge repository][1] .

    # yum install netdiag

Netload is available in the default repository as a part of netdiag so, we can easily install **netdiag** using **apt** manager using the command below.

    $ sudo install netdiag

To run netload, we must make sure to choose a working network interface name like eth0, eh1, wlan0, mon0, etc. And run the following command accordingly in a shell or a terminal.

    $ netload wlan2

Note: Please replace wlan2 with the network interface name you wanna use. If you wanna scan for your network interface name run ip link show in a terminal or shell.

### 8) Nagios ###

Nagios is a leading open source powerful monitoring system that enables network/system administrators to identify and resolve server related problems before they affect major business processes. With the Nagios system, administrators can able to monitor remote Linux, Windows, Switches, Routers and Printers on a single window. It shows critical warnings and indicates if something went wrong in your network/server which indirectly helps you to begin remediation processes before they occur.

Nagios has a web interface in which there is a graphical monitor of activities. One can login to the web interface by browsing to the url http://localhost/nagios/ or http://localhost/nagios3/ . Please replace localhost with your IP-address if on remote machine. Then enter the username and pass then, we'll get to see the information like shown below.

![Nagios3 on Chromium](http://blog.linoxide.com/wp-content/uploads/2015/02/nagios3-ubuntu.png)

### 9) EtherApe ###

EtherApe is a graphical network monitor for Unix modeled after etherman. Featuring link layer, IP and TCP modes and support interfaces Ethernet, FDDI, Token Ring, ISDN, PPP, SLIP and WLAN devices, plus several encapsulation formats. Hosts and links change in size with traffic and color coded protocols display. It can filter traffic to be shown, and can read packets from a file as well as live from the network.

It is easy to install etherape in CentOS, Fedora, RHEL distributions of Linux cause they are available default on their official repository. We can use yum manager to install it with the command shown below:

     yum install etherape

We can install EtherApe on Ubuntu, Debian and their derivatives using **apt** manager with the below command.

    sudo apt-get install etherape

After EtherApe is installed on the system, we'll need to run etherape in root permission as:

    sudo etherape

Then, the **GUI** of **etherape** will be executed. Then, up in the menu we can select the **Mode** (IP, Link Layer, TCP) and **Interface** under **Capture**. After everything are set, we'll need to click **Start** button. Then, we'll gonna see something like this.

![EtherApe](http://blog.linoxide.com/wp-content/uploads/2015/02/etherape.png)
 
### 10) tcpflow ###

tcpflow is a command line utility that captures data transmitted as part of TCP connections (flows), and stores the data in a way that is convenient for protocol analysis or debugging. It reconstructs the actual data streams and stores each flow in a separate file for later analysis. It understands TCP sequence numbers and will correctly reconstruct data streams regardless of retransmissions or out-of-order delivery .

Installing tcpflow in Ubuntu, Debian system is easy via **apt** manager as it is available by default in the official repository.

    $ sudo apt-get install tcpflow

We can install tcpflow in Fedora, CentOS, RHEL and their derivatives from repository using **yum** manager as shown below.

    # yum install tcpflow

If it is not available in the repository or can't be installed via yum manager, we need to install manually from **http://pkgs.repoforge.org/tcpflow/** as shown below.

If you are running 64 bit PC:

    # yum install --nogpgcheck http://pkgs.repoforge.org/tcpflow/tcpflow-0.21-1.2.el6.rf.x86_64.rpm

If you are running 32 bit PC:

    # yum install --nogpgcheck http://pkgs.repoforge.org/tcpflow/tcpflow-0.21-1.2.el6.rf.i686.rpm

We can use tcpflow to capture all/some tcp traffic and put it in an easy to read file. The below command does what we want but we'll need to run that command in an empty directory as it creates files of the format x.x.x.x.y-a.a.a.a.z and after done, just press Control-C that command to stop it.

     $ sudo tcpflow -i eth0 port 8000

Note: Please replace eth0 with the interface of the card you are trying to capture.

### 11) IPTraf ###

[IPTraf][2] is a console-based network statistics utility for Linux. It gathers a variety of figures such as TCP connection packet and byte counts, interface statistics and activity indicators, TCP/UDP traffic breakdowns, and LAN station packet and byte counts.

IPTraf is available in the default repository so, we can easily install IPTraf using **apt** manager using the command below.

    $ sudo apt-get install iptraf

IPTraf is available in the default repository so, we can easily install IPTraf using yum manager using the command below.

    # yum install iptraf

We need to run TPTraf in administration permission with a valid network interface name. Here, we have wlan2 so, we'll be using wlan2 as interface name.

    $ sudo iptraf

![IPTraf](http://blog.linoxide.com/wp-content/uploads/2015/02/iptraf.png)

To start the general interface statistics, enter:

    # iptraf -g

To see the detailed statistics facility on an interface called eth0

    # iptraf -d wlan2

To see the TCP and UDP monitor on an interface called eth0

    # iptraf -z wlan2

To displays the packet size counts on an interface called eth0

    # iptraf -z wlan2

Note: Please replace wlan2 with your interface name. You can check your interface by running command ip link show .

### 12) Speedometer ###

Speedometer is a small and simple tool that just draws out good looking graphs of incoming and outgoing traffic through a given interface.

Speedometer is available in the default repository so, we can easily install Speedometer using yum manager using the command below.

    # yum install speedometer

Speedometer is available in the default repository so, we can easily install Speedometer using apt manager using the command below.

    $ sudo apt-get install speedometer

Speedometer can simply be run by executing the following command in a shell or a terminal.

     $ speedometer -r wlan2 -t wlan2

![Speedometer](http://blog.linoxide.com/wp-content/uploads/2015/02/Speedometer.png)

Note: Please replace wlan2 with the network interface name you would like to use.

### 13) Netwatch ###

Netwatch is part of the netdiag collection of tools, and it too displays the connections between local host and other remote hosts, and the speed at which data is transferring on each connection.

We can install Netwatch using yum in fedora as it is in the default repository. But if you're running CentOS or RHEL, we'll need to install [rpmforge repository][3] .

    # yum install netwatch

Netwatch is available in the default repository as a part of netdiag so, we can easily install **netdiag** using **apt** manager using the command below.

    $ sudo install netdiag

To run netwatch, we'll need to execute the following command in a terminal or shell.

    $ sudo netwatch -e wlan2 -nt

![Netwatch](http://blog.linoxide.com/wp-content/uploads/2015/02/netwatch.png)

Note: Please replace wlan2 with the network interface name you wanna use. If you wanna scan for your network interface name run ip link show in a terminal or shell.

### 14) Trafshow ###

Trafshow reports the current active connections like netwatch and pktstat, trafshow, their protocol and the data transfer speed on each connection. It can filter out connections using pcap type filters.

We can install Netwatch using yum in fedora as it is in the default repository. But if you're running CentOS or RHEL, we'll need to install [rpmforge repository][4] .

# yum install trafshow

Trafshow is available in the default repository so, we can easily install it using **apt** manager using the command below.

    $ sudo install trafshow

To monitor using trafshow, we'll need to run the following command in a shell or terminal.

    $ sudo trafshow -i wlan2

![Trafshow](http://blog.linoxide.com/wp-content/uploads/2015/02/trafshow-all.png)

To monitor specifically tcp connections add tcp as shown below.

     $ sudo trafshow -i wlan2 tcp

![Trafshow tcp](http://blog.linoxide.com/wp-content/uploads/2015/02/trafshow-tcp.png)

Note: Please replace wlan2 with the network interface name you wanna use. If you wanna scan for your network interface name run ip link show in a terminal or shell.

### 15) Vnstat ###

Vnstat is bit different from most of the other tools. It actually runs a background service/daemon and keeps recording the size of data transfer all the time. Next it can be used to generate a report of the history of network usage.

We'll need to turn on EPEL Repository then run **yum** manager to install vnstat.

    # yum install vnstat

Vnstat is available in the default repository. So, we can run **apt** manager to install it using the following command.

    $ sudo apt-get install vnstat

Running vnstat without any options would simply show the total amount of data transfer that took place since the date the daemon is running.

    $ vnstat

![vnstat](http://blog.linoxide.com/wp-content/uploads/2015/02/vnstat.png)

To monitor the bandwidth usage in realtime, use the '-l' option (live mode). It would then show the total bandwidth used by incoming and outgoing data, but in a very precise manner without any internal details about host connections or processes.

     $ vnstat -l

![Vnstat live mode](http://blog.linoxide.com/wp-content/uploads/2015/02/vnstat-live.png)

After done, press Ctrl-C to stop which will result the following type of output

![Vnstat Live Result](http://blog.linoxide.com/wp-content/uploads/2015/02/vnstat-live-result.png)

### 16) tcptrack ###

[tcptrack][5] displays the status of TCP connections that it sees on a given network interface. tcptrack monitors their state and displays information such as state, source/destination addresses and bandwidth usage in a sorted, updated list very much like the **top** command.

As tcptrack is in the repository , we can simply install tcptrack in Debian, Ubuntu from their repository using apt manager. To do so, we'll need to execute the following command in a shell or terminal:

    $ sudo apt-get install tcptrack

We can install it using yum in fedora as it is in the default repository. But if you're running CentOS or RHEL, we'll need to install [rpmforge repository][6] . To do so, we'll need to run the following commands.

    # wget http://apt.sw.be/redhat/el6/en/x86_64/rpmforge/RPMS/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

    # rpm -Uvh rpmforge-release*rpm

    # yum install tcptrack

Note: Here, we have downloaded current latest version of rpmforge-release ie 0.5.3-1 . You can always get the latest version from rpmforge repository and do replace with that you downloaded in the above command.

**tcptrack** needs to be run in root permission or superuser. We'll need to execute tcptrack with the network interface name we wanna monitor the TCP connections of. Here, we've wlan2 so will be using that as:

    sudo tcptrack -i wlan2

![tcptrack](http://blog.linoxide.com/wp-content/uploads/2015/02/tcptrack.png)

If you wanna monitor of specific ports then:

    # tcptrack -i wlan2 port 80

![tcptrack port 80](http://blog.linoxide.com/wp-content/uploads/2015/02/tcptrack-port-80.png)

Please replace 80 with the port number you wanna monitor .Note: Please replace wlan2 with the network interface name you wanna use. If you wanna scan for your network interface name run ip link show in a terminal or shell.

### 17) CBM ###

The CBM or Color Bandwidth Meter displays current traffic of all network device. This program is so simple that is should be self-explanatory. Source code and newer versions of CBM are available at [http://www.isotton.com/utils/cbm/][7] .

As CBM is in the repository , we can simply install CBM in Debian, Ubuntu from their repository using **apt** manager. To do so, we'll need to execute the following command in a shell or terminal:

    $ sudo apt-get install cbm

We simply need to run cbm in a shell or terminal as shown below:

    $ cbm

![Color Bandwidth Meter](http://blog.linoxide.com/wp-content/uploads/2015/02/cbm.png)

### 18) bmon ###

[Bmon][8] or Bandwidth Monitoring is a tool that intended for debugging and monitor bandwidth in real-time access. This tool is capable to retrieving statistics from various input modules. It provides various output methods including a curses based interface,lightweight HTML output but also formatable ASCII output.

bmon is available in the repository, so we can install it in Debian, Ubuntu from their repository using apt manager. To do so, we'll need to run the following command in a shell or terminal.

    $ sudo apt-get install bmon

We can run bmon and monitor our bandwidth status using the command below.

    $ bmon

![bmon](http://blog.linoxide.com/wp-content/uploads/2015/02/bmon.png)

### 19) tcpdump ###

[TCPDump][9] is a tool for network monitoring and data acquisition. It can save lots of time and can be used for debugging network or server related problems. It prints out a description of the contents of packets on a network interface that match the boolean expression.

tcpdump is available in the default repository of Debian, Ubuntu so, we can simply use apt manager to install it under sudo privilege . To do so, we'll need to run the following command in a shell or terminal.

    $ sudo apt -get install tcpdump

tcpdump is also available in the repository of Fedora, CentOS, RHEL so, we can install it via yum manager as:

    # yum install tcpdump

tcpdump needs to be run in root permission or superuser. We'll need to execute tcpdump with the network interface name we wanna monitor the TCP connections of. Here, we've wlan2 so will be using it as:

    $ sudo tcpdump -i wlan2

![tcpdump](http://blog.linoxide.com/wp-content/uploads/2015/02/tcpdump.png)

If you want to monitor to a specific port only, then can run the command as follows. Here is the example for port 80 (webserver).

    $ sudo tcpdump -i wlan2 'port 80'

![tcpdump port](http://blog.linoxide.com/wp-content/uploads/2015/02/tcpdump-port.png)

### 20) ntopng ###

[ntopng][20] is the next generation version of the original ntop. It is a network probe that shows network usage in a way similar to what top does for processes. ntopng is based on libpcap and it has been written in a portable way in order to virtually run on every Unix platform, MacOSX and on Win32 as well.

To install ntopng in Debian, Ubuntu system, we'll first need to install the required **dependencies packages to compile ntopng**.  You can install them all by running the below command in a shell or a terminal.

    $ sudo apt-get install libpcap-dev libglib2.0-dev libgeoip-dev redis-server wget libxml2-dev build-essential checkinstall

Now, we'll need to manually compile ntopng for our system as:

    $ sudo wget http://sourceforge.net/projects/ntop/files/ntopng/ntopng-1.1_6932.tgz/download
    $ sudo tar zxfv ntopng-1.1_6932.tgz
    $ sudo cd ntopng-1.1_6932
    $ sudo ./configure
    $ sudo make
    $ sudo make install

Now, you should have your ntopng installed in your Debian or Ubuntu system.

We have already covered tutorial on ntopng usages. It is available in both command line and web interface. We can go ahead to get knowledge on it.

### Conclusion ###

In this first part we covered some network load monitoring tools for linux that are very helpful to a sysadmin and even a novice user. Each one of the tools covered in this article has its own specifics, different options but at the end they all help you to monitor your network traffic.

--------------------------------------------------------------------------------

via: http://linoxide.com/monitoring-2/network-monitoring-tools-linux/

作者：[Bobbin Zachariah][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/bobbin/
[1]:http://pkgs.org/centos-7/repoforge-x86_64/netwatch-1.0c-1.el7.rf.x86_64.rpm.html
[2]:http://iptraf.seul.org/
[3]:http://pkgs.org/centos-7/repoforge-x86_64/netwatch-1.0c-1.el7.rf.x86_64.rpm.html
[4]:http://pkgs.org/centos-6/epel-x86_64/trafshow-5.2.3-6.el6.x86_64.rpm.html
[5]:http://linux.die.net/man/1/tcptrack
[6]:http://pkgs.org/centos-6/repoforge-x86_64/tcptrack-1.4.0-1.el6.rf.x86_64.rpm.html
[7]:http://www.isotton.com/utils/cbm/
[8]:https://github.com/tgraf/bmon/
[9]:http://www.tcpdump.org/
[10]:http://www.ntop.org/