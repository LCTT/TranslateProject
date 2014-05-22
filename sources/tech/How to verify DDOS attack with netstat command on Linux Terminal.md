Translating by shipsw
How to verify DDOS attack with netstat command on Linux Terminal
================================================================================
![](http://cdn.linuxaria.com/wp-content/uploads/2010/12/terminal1.jpg)

Your server appearing pretty slow could be many things from wrong configs, scripts and dodgy hardware – but sometimes it could be because someone is flooding your server with traffic known as DoS ( Denial of Service ) or DDoS ( Distributed Denial of Service ).

Denial-of-service attack (DoS attack) or Distributed Denial-of-service attack (DDoS attack) is an attempt to make a machine or [network][1] resource unavailable to its intended users. This attack generally target sites or services hosted on high-profile web servers such as banks, credit card payment gateways, and even root nameservers. DoS attacks are implemented by either forcing the targeted computer to reset, or consuming its resources so that it can no longer provide its services or obstructs the communication media between the users and the victim so that they can no longer communicate adequately.

In this small article you’ll see how to check if your server is under attack from the Linux [Terminal][2] with the netstat command

From the man page of netstat “netstat – Print network connections, routing tables, interface statistics, masquerade connections, and multicast memberships”

### Some examples with explanation ###

    netstat -na

This display all active Internet connections to the server and only established connections are included.

    netstat -an | grep :80 | sort

Show only active Internet connections to the server on port 80, this is the http port and so it’s useful if you have a web server, and sort the results. Useful in detecting a single flood by allowing you to recognize many connections coming from one IP.

    netstat -n -p|grep SYN_REC | wc -l

This command is useful to find out how many active SYNC_REC are occurring on the server. The number should be pretty low, preferably less than 5. On DoS attack incidents or mail bombs, the number can jump to pretty high. However, the value always depends on system, so a high value may be average on another server.

    netstat -n -p | grep SYN_REC | sort -u

List out the all IP addresses involved instead of just count.

    netstat -n -p | grep SYN_REC | awk '{print $5}' | awk -F: '{print $1}'

List all the unique IP addresses of the node that are sending SYN_REC connection status.

    netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n

Use netstat command to calculate and count the number of connections each IP address makes to the server.

    netstat -anp |grep 'tcp|udp' | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n

List count of number of connections the IPs are connected to the server using TCP or UDP protocol.

    netstat -ntu | grep ESTAB | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr

Check on ESTABLISHED connections instead of all connections, and displays the connections count for each IP.

    netstat -plan|grep :80|awk {'print $5'}|cut -d: -f 1|sort|uniq -c|sort -nk 1

Show and list IP address and its connection count that connect to port 80 on the server. Port 80 is used mainly by HTTP web page request.

### How to mitigate a DOS attack ###

Once that you have found the IP that are attacking your server you can use the following commands to block their connection to your server:

    iptables -A INPUT 1 -s $IPADRESS -j DROP/REJECT

Please note that you have to replace $IPADRESS with the IP numbers that you have found with netstat.
After firing the above command, KILL all httpd connections to clean your system and than restart httpd service by
using the following commands:

    killall -KILL httpd
     
    service httpd start           #For Red Hat systems 
    /etc/init/d/apache2 restart   #For Debian systems

--------------------------------------------------------------------------------

via: http://linuxaria.com/howto/how-to-verify-ddos-attack-with-netstat-command-on-linux-terminal

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linuxaria.com/tag/network
[2]:http://linuxaria.com/tag/shell
