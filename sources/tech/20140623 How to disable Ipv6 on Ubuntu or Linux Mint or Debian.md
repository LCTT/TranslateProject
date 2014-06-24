Translating--------------geekpi


How to disable Ipv6 on Ubuntu, Linux Mint, Debian
================================================================================
### Ipv6 ###

Ipv6 is the next version of the addressing scheme Ipv4 that is currently being used to assign numerical address to domain names like google.com over the internet.

Ipv6 allows for more addresses than what Ipv4 supports. However it is not yet widely supported and its adoption is still in progress.

### Does your system support ipv6 ? ###

For Ipv6 to work for you, there are many things needed. First of all you need a system/OS that supports IPv6. Ubuntu Linux Mint and most modern distros do that. If you take a look at the output of ifconfig you can see ipv6 addresses assigned to the network interfaces

    $ ifconfig
    eth0      Link encap:Ethernet  HWaddr 00:1c:c0:f8:79:ee  
              inet addr:192.168.1.2  Bcast:192.168.1.255  Mask:255.255.255.0
              inet6 addr: fe80::21c:c0ff:fef8:79ee/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:110880 errors:0 dropped:0 overruns:0 frame:0
              TX packets:111960 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:62289395 (62.2 MB)  TX bytes:25169458 (25.1 MB)
              Interrupt:20 Memory:e3200000-e3220000 
    
    lo        Link encap:Local Loopback  
              inet addr:127.0.0.1  Mask:255.0.0.0
              inet6 addr: ::1/128 Scope:Host
              UP LOOPBACK RUNNING  MTU:65536  Metric:1
              RX packets:45258 errors:0 dropped:0 overruns:0 frame:0
              TX packets:45258 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:0 
              RX bytes:4900560 (4.9 MB)  TX bytes:4900560 (4.9 MB)

Check the line "inet6 addr".

Next you need a router/modem that also supports ipv6. And beyond that, your ISP must also support ipv6.

Instead of checking every part of the network infrastructure, its better to just find out if you can connect to websites over ipv6.
There are lots of websites that test ipv6 support on your connection. Check out [http://testmyipv6.com/][1] for example.

The kernel parameters that enable ipv6 are as follows

    $ sysctl net.ipv6.conf.all.disable_ipv6
    net.ipv6.conf.all.disable_ipv6 = 0
    
    $ sysctl net.ipv6.conf.default.disable_ipv6
    net.ipv6.conf.default.disable_ipv6 = 0
    
    $ sysctl net.ipv6.conf.lo.disable_ipv6
    net.ipv6.conf.lo.disable_ipv6 = 0

The same can be also be checked from the proc files

    $ cat /proc/sys/net/ipv6/conf/all/disable_ipv6
    0

Note that the variables control "disabling" of ipv6. So setting them to 1 would disable ipv6

### Disable ipv6 if its not supported ###

So if ipv6 is not supported on your network infrastructure, it might be useful to disable it all together. Why ? It can cause issues like delayed domain lookups, un-necessary attempts to connect to ipv6 addresses causing delay in network connection etc.

I did come across some problems like that. The apt-get command occasionally tries to connect to ipv6 addresses and fails and then retries an ipv4 address. Take a look at this output

    $ sudo apt-get update
    Ign http://archive.canonical.com trusty InRelease
    Ign http://archive.canonical.com raring InRelease                                                                                                    
    Err http://archive.canonical.com trusty Release.gpg                                                                                                  
      Cannot initiate the connection to archive.canonical.com:80 (2001:67c:1360:8c01::1b). - connect (101: Network is unreachable) [IP: 2001:67c:1360:8c01::1b 80]
    Err http://archive.canonical.com raring Release.gpg                                                                                                  
      Cannot initiate the connection to archive.canonical.com:80 (2001:67c:1360:8c01::1b). - connect (101: Network is unreachable) [IP: 2001:67c:1360:8c01::1b 80]
    
    .....

Errors like those have been more frequent in the recent Ubuntu versions, probably because they try to use Ipv6 more than before.

I noticed similar issues happen in other applications like Hexchat and also Google Chrome which would sometimes take longer than usual to lookup a domain name.

So the best solution is to disable Ipv6 entirely to get rid of those things. It takes only a small configuration and can help you solve many network issues on your system. Users have even reported an increase in internet speed.

#### Disable Ipv6 - Method 1 ####

Edit the file - /etc/sysctl.conf

    $ sudo gedit /etc/sysctl.conf

And fill in the following lines at the end of that file

    # IPv6 disabled
    net.ipv6.conf.all.disable_ipv6 = 1
    net.ipv6.conf.default.disable_ipv6 = 1
    net.ipv6.conf.lo.disable_ipv6 = 1

Save the file and close it

Restart sysctl with

    $ sudo sysctl -p

Check the output of ifconfig again and there should be no ipv6 address

    $ ifconfig
    eth0      Link encap:Ethernet  HWaddr 08:00:27:5f:28:8b  
              inet addr:192.168.1.3  Bcast:192.168.1.255  Mask:255.255.255.0
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:1346 errors:0 dropped:0 overruns:0 frame:0
              TX packets:965 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:1501691 (1.5 MB)  TX bytes:104883 (104.8 KB)

If it does not work, then try rebooting the system and check ifconfig again.

#### Disable ipv6 - GRUB method ####

Ipv6 can also be disabled by editing the grub configuration file

    $ sudo gedit /etc/default/grub

Look for the line containing "GRUB_CMDLINE_LINUX" and edit it as follows

    GRUB_CMDLINE_LINUX="ipv6.disable=1"

The same can also be added to the value of the variable named "GRUB_CMDLINE_LINUX_DEFAULT" and either would work. Save the file, close it and regenerate the grub configuration

    $ sudo update-grub2

Reboot. Now ipv6 should be disabled.

--------------------------------------------------------------------------------

via: http://www.binarytides.com/disable-ipv6-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://testmyipv6.com/
