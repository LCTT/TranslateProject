translating by lujun9972
NETSTAT Command: Learn to use netstat with examples
======
Netstat is a command line utility that tells us about all the tcp/udp/unix socket connections on our system. It provides list of all connections that are currently established or are in waiting state. This tool is extremely useful in identifying the port numbers on which an application is working and we can also make sure if an application is working or not on the port it is supposed to work.

Netstat command also displays various other network related information such as routing tables, interface statistics, masquerade connections, multicast memberships etc.,

In this tutorial, we will learn about Netstat with examples.

(Recommended Read: [Learn to use CURL command with examples][1] )

Netstat with examples
============================================================

### 1- Checking all connections

To list out all the connections on a system, we can use ‘a’ option with netstat command,

$ netstat -a

This will produce all tcp, udp & unix connections from the system.

### 2- Checking all tcp or udp or unix socket connections

To list only the tcp connections our system, use ‘t’ options with netstat,

$ netstat -at

Similarly to list out only the udp connections on our system, we can use ‘u’ option with netstat,

$ netstat -au

To only list out Unix socket connections, we can use ‘x’ options,

$ netstat -ax

### 3- List process id/Process Name with

To get list of all connections along with PID or process name, we can use ‘p’ option & it can be used in combination with any other netstat option,

$ netstat -ap

### 4- List only port number & not the name

To speed up our output, we can use ‘n’ option as it will perform any reverse lookup & produce output with only numbers. Since no lookup is performed, our output will much faster.

$ netstat -an

### 5- Print only listening ports

To print only the listening ports , we will use ‘l’ option with netstat. It will not be used with ‘a’ as it prints all ports,

$ netstat -l

### 6- Print network stats

To print network statistics of each protocol like packet received or transmitted, we can use ‘s’ options with netstat,

$ netstat -s

### 7- Print interfaces stats

To display only the statistics on network interfaces, use ‘I’ option,

$ netstat -i

### 8-Display multicast group information

With option ‘g’ , we can print the multicast group information for IPV4 & IPV6,

$ netstat -g

### 9- Display the network routing information

To print the network routing information, use ‘r’ option,

$ netstat -r

### 10- Continuous output

To get continuous output of netstat, use ‘c’ option

$ netstat -c

### 11- Filtering a single port

To filter a single port connections, we can combine ‘grep’ command with netstat,

$ netstat -anp | grep 3306

### 12- Count number of connections

To count the number of connections from port, we can further add ‘wc’ command with netstat & grep command,

$ netstat -anp | grep 3306 | wc -l

This will print the number of connections for the port mysql port i.e. 3306.

This was our brief tutorial on Netstat with examples, hope it was informative enough. If you have any query or suggestion, please mention it in the comment box below.

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/learn-use-netstat-with-examples/

作者：[Shusain][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/learn-use-curl-command-examples/
