translating by lujun9972
Learn how to use tcpdump command with examples
======
Tcpdump command is a famous network packet analysing tool that is used to display TCP\IP & other network packets being transmitted over the network attached to the system on which tcpdump has been installed. Tcpdump uses libpcap library to capture the network packets & is available on almost all Linux/Unix flavors.

Tcpdump command can read the contents from a network interface or from a previously created packet file or we can also write the packets to a file to be used for later. One must use the tcpdump command as root or as a user with sudo privileges.

In this tutorial, we are going to discuss the uses of tcpdump command along with some examples, but first let's start with installation of tcpdump on various Linux OS.

 **(Recommended Read:[Monitoring network bandwidth with iftop command][1])**

### Installation

By default, tcpdump is available on almost all Linux distributions but if that's not the case for you, install it on your system using the following method.

 **CentOS/RHEL**

Install tcpdump on CentOS & RHEL using the following command ,

 **$ sudo yum install tcpdump**

 **Fedora**

On Fedora, install tcpdump using the following command,

 **$ dnf install tcpdump**

 **Ubuntu/Debian/Linux Mint**

On Ubuntu or Debian or Linux Mint, install tcp dumo using the following command,

 **$ apt-get install tcpdump**

Now that we have install tcpdump on our systems, let's discuss some examples for tcpdump.

### Examples

 **Get packets from all interfaces**

To get the network packets from all network interfaces, run the following command,

 **$ tcpdump -i any**

**Get packets from a single interfaces**

To get the network packets from a single interface, use

 **$ tcpdump -i eth0**

**Writing captured packets to file**

To write all the captured packets to a file, use the '-w' option,

 **$ tcpdump -i eth1 -w packets_file**

**Reading an old tcpdump file**

To read an already created, old tcpdump file, use the following command,

 **$ tcpdump -r packets_file**

**Getting more packets information with readable timestamps**

To get more information regarding the packets along with readable timestamp, use

 **$ tcpdump -ttttnnvvS**

**Check packets of whole network**

To get the packets for whole network, execute the following command from terminal

 **$ tcpdump net 192.168.1.0/24**

**Check packets based on IP address**

Get all the packets based on the IP address, whether source or destination or both, using the following command,

 **$ tcpdump host 192.168.1.100**

To get packets based on source or destination of an IP address, use

 **$ tcpdump src 192.168.1.100**

 **$ tcpdump dst 192.168.1.100**

**Check packets for a protocol or port number**

To check all the packets used based on the protocol, run the following command

 **$ tcpdump ssh**

To get packets for a single port ot for a range of ports, use

 **$ tcpdump port 22**

 **$ tcpdump portrange 22-125**

We can also use ** 'src'** & **' dst'** options to get packets for ports based on source & destination.

We can also combine two conditions with AND (and , && ), OR ( or. || ) & EXCEPT (not , ! ). This helps when we have analyze network packets based on the some condtions.

**Using AND**
We can use  'and' or symbol '&&' to combine two conditions or mote with tcpdump. An example would be,

 **$ tcpdump src 192.168.1.100 && port 22 -w ssh_packets**

**Using OR**

OR will check the command agtcpdump -i eth0 src port not 22ainst one the mentioned conditions in the command, like

 **$ tcpdump src 192.168.1.100 or dst 192.168.1.50 && port 22 -w ssh_packets**

 **$ tcpdump port 443 or 80 -w http_packets**

**Using EXCEPT**

EXCEPT will be used when we want not fulfill a condition, like

 **$ tcpdump -i eth0 src port not 22**

This will monitor all the traffic on eth0 but will not capture port 22.

This was our tutorial on how to install & use tcpdump command to capture the network packets. Please feel free to send in any queries or suggestions using the comment box below.

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/learn-use-tcpdump-command-examples/

作者：[Shusain ][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/monitoring-network-bandwidth-iftop-command/
