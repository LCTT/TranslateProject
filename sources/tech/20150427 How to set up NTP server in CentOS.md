Translating by ictlyh
How to set up NTP server in CentOS
================================================================================
Network Time Protocol (NTP) is used to synchronize system clocks of different hosts over network. All managed hosts can synchronize their time with a designated time server called an NTP server. An NTP server on the other hand synchronizes its own time with any public NTP server, or any server of your choice. The system clocks of all NTP-managed devices are synchronized to the millisecond precision.

In a corporate environment, if they do not want to open up their firewall for NTP traffic, it is necessary to set up in-house NTP server, and let employees use the internal server as opposed to public NTP servers. In this tutorial, we will describe how to configure a CentOS system as an NTP server. Before going into the detail, let's go over the concept of NTP first.

### Why Do We Need NTP? ###

Due to manufacturing variances, all (non-atomic) clocks do not run at the exact same speed. Some clocks tend to run faster, while some run slower. So over a large timeframe, the time of one clock gradually drifts from another, causing what is known as "clock drift" or "time drift". To minimize the effect of clock drift, the hosts using NTP should periodically communicate with a designated NTP server to keep their clock in sync.

Time synchrony across different hosts is important for things like scheduled backup, [intrusion detection][1] logging, [distributed job scheduling ][2]or transaction bookkeeping. It may even be required as part of regulatory compliance.

### NTP Hierarchy ###

NTP clocks are organized in a layered hierarchy. Each level of the hierarchy is called a *stratum*. The notion of stratum describes how many NTP hops away a machine is from an authoritative time source.

![](https://farm8.staticflickr.com/7590/16645732413_3b7af58186_c.jpg)

Stratum 0 is populated with clocks that have virtually no time drifts, such as atomic clocks. These clocks cannot be directly used over the network. Stratum N (N > 1) servers synchronize their time against Stratum N-1 servers. Stratum N clocks may be connected with each other over network.

NTP supports up to 15 stratums in the hierarchy. Stratum 16 is considered unsynchronized and unusable.

### Preparing CentOS Server ###

Now let's proceed to set up an NTP server on CentOS.

First of all, we need to make sure that the time zone of the server is set up correctly. In CentOS 7, we can use the timedatectl command to view and change the server time zone (e.g., "Australia/Adelaide")

    # timedatectl list-timezones | grep Australia
    # timedatectl set-timezone Australia/Adelaide
    # timedatectl

![](https://farm8.staticflickr.com/7605/16645732463_db75a0bdcd_o.png)

Go ahead and set up necessary software using yum.

    # yum install ntp

Then we will add the global NTP servers to synchronize time with.

    # vim /etc/ntp.conf

----------

    server 0.oceania.pool.ntp.org
    server 1.oceania.pool.ntp.org
    server 2.oceania.pool.ntp.org
    server 3.oceania.pool.ntp.org

By default, NTP server logs are saved in /var/log/messages. If you want to use a custom log file, that can be specified as well.

    logfile /var/log/ntpd.log

If you opt for a custom log file, make sure to change its ownership and SELinux context.

    # chown ntp:ntp /var/log/ntpd.log
    # chcon -t ntpd_log_t /var/log/ntpd.log

Now initiate NTP service and make sure it's added to startup.

    # systemctl restart ntp
    # systemctl enable ntp

### Verifying NTP Server Clock ###

We can use the ntpq command to check how the local server's clock is synchronized via NTP.

![](https://farm9.staticflickr.com/8713/16645732513_1823736ca8_b.jpg)

The following table explains the output columns.

注：表格
<table id="content">
<tbody><tr>
<td>remote</td>
<td>The sources defined at ntp.conf. '*' indicates the current and best source; '+' indicates that these sources are available as NTP source. Sources with - are considered unusable.</td>
</tr>
<tr>
<td>refid</td>
<td>The IP address of the clock with which the remote server clock is synchronized with.</td>
</tr>
<tr>
<td>st</td>
<td>Stratum</td>
</tr>
<tr>
<td>t</td>
<td>Type. 'u' is for unicast. Other values may include local, multicast, broadcast.</td>
</tr>
<tr>
<td>when</td>
<td>The time elapsed (in seconds) since the last contact with the server.</td>
</tr>
<tr>
<td>poll</td>
<td>Polling frequency with the server in seconds.</td>
</tr>
<tr>
<td>reach</td>
<td>An octal value that indicates whether there are any errors in communication with the server. The value 377 indicates 100% success.</td>
</tr>
<tr>
<td>delay</td>
<td>The round trip time between our server and the remote server.</td>
</tr>
<tr>
<td>offset</td>
<td>The time difference between our server and the remote server in milliseconds.</td>
</tr>
<tr>
<td>jitter</td>
<td>The average time difference in milliseconds between two samples.</td>
</tr>
</tbody></table>

### Controlling Access to NTP Server ###

By default, NTP server allows incoming queries from all hosts. If you want to filter incoming NTP synchronization connections, you could add a rule in your firewall to filter the traffic.

    # iptables -A INPUT -s 192.168.1.0/24 -p udp --dport 123 -j ACCEPT
    # iptables -A INPUT -p udp --dport 123 -j DROP

The rule will allow NTP traffic (on port UDP/123) from 192.168.1.0/24, and deny traffic from all other networks. You can update the rule to match your requirements.

### Configuring NTP Clients ###

#### 1. Linux ####

NTP client hosts need the ntpdate package to synchronize time against the server. The package can be easily installed using yum or apt-get. After installing the package, run the command with the IP address of the server.

    # ntpdate <server-IP-address>

The command is identical for RHEL and Debian based systems.

#### 2. Windows ####

If you are using Windows, look for 'Internet Time' under Date and Time settings.

#### 3. Cisco Devices ####

If you want to synchronize the time of a Cisco device, you can use the following command from the global configuration mode.

    # ntp server <server-IP-address>

NTP enabled devices from other vendors have their own parameters for Internet time. Please check the documentation of the device if you want to synchronize its time with the NTP server.

### Conclusion ###

To sum up, NTP is a protocol that keeps the clocks across all your hosts in sync. We have demonstrated how we can set up an NTP server, and let NTP enabled devices synchronize their time against the server.

Hope this helps.

--------------------------------------------------------------------------------

via: http://xmodulo.com/setup-ntp-server-centos.html

作者：[Sarmed Rahman][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/sarmed
[1]:http://xmodulo.com/how-to-compile-and-install-snort-from-source-code-on-ubuntu.html
[2]:http://xmodulo.com/how-to-install-hdfs-and-hadoop-using.html