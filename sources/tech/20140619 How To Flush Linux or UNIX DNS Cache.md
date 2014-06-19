How To Flush Linux / UNIX DNS Cache
================================================================================
![](http://figs.cyberciti.biz/3rdparty/configure.png)

I'm on a Dial UP Internet connection under Linux and frequent dial up disconnection causing dns problems. How do I flush DNS cache under UNIX / Linux distribution using a shell prompt?

Under MS-Windows you can use the [ipconfig command to flush dns cache][1]. However, Linux and UNIX provides various ways to flush cache. Linux can run nscd or BIND or dnsmasq as the name service caching daemon. Large and work-group servers may use BIND or dnsmasq as a dedicated caching server to speed up queries.

### HowTo: Flush nscd dns cache ###

Nscd caches libc-issued requests to the Name Service. If retrieving NSS data is fairly expensive, nscd is able to speed up consecutive access to the same data dramatically and increase overall system performance. Just restart nscd:

    $ sudo /etc/init.d/nscd restart

OR

    # service nscd restart

OR

    # service nscd reload

This daemon provides a cache for the most common name service requests. The default configuration file, /etc/nscd.conf, determines the behavior of the cache daemon.

### Flush dnsmasq dns cache ###

[dnsmasq is a lightweight DNS][2], TFTP and DHCP server. It is intended to provide coupled DNS and DHCP service to a LAN. Dnsmasq accepts DNS queries and either answers them from a small, local, cache or forwards them to a real, recursive, DNS server. This software is also installed many cheap routers to cache dns queries. Just restart the dnsmasq service to flush out dns cache:

    $ sudo /etc/init.d/dnsmasq restart

OR

    # service dnsmasq restart

### Flush caching BIND server dns cache ###

A caching BIND server obtains information from another server (a Zone Master) in response to a host query and then saves (caches) the data locally. All you have to do is restart bind to clear its cache:

    # /etc/init.d/named restart

You can also use rndc command as follows flush out all cache:

    # rndc restart

OR

    # rndc exec

BIND v9.3.0 and above will support flushing all of the records attached to a particular domain name with rndc flushname command. In this example flush all records releated to cyberciti.biz domain:

    # rndc flushname cyberciti.biz

It is also possible to flush out BIND views. For example, lan and wan views can be flushed using the following 
command:

    # rndc flush lan
    # rndc flush wan

### A note about Mac OS X Unix users ###

Type the following command as root user:

    # dscacheutil -flushcache

OR

    $ sudo dscacheutil -flushcache

If you are using OS X 10.5 or earlier try the following command:

    lookupd -flushcache

### A note about /etc/hosts file ###

/etc/hosts act as the static table lookup for hostnames. You need to remove and/or update records as per your requirements under Unix like operating systems:

    # vi /etc/hosts

#### Sample outputs: ####

    127.0.0.1	localhost
    127.0.1.1	wks01.WAG160N	wks01
    # The following lines are desirable for IPv6 capable hosts
    ::1     ip6-localhost ip6-loopback
    fe00::0 ip6-localnet
    ff00::0 ip6-mcastprefix
    ff02::1 ip6-allnodes
    ff02::2 ip6-allrouters
    10.37.34.2     build
    192.168.1.10	nas01
    192.168.1.11	nas02
    192.168.1.12	nas03
    #192.168.2.50	nfs2.nixcraft.net.in nfs2
    #192.168.2.51	nfs1.nixcraft.net.in nfs1
    172.168.232.50  nfs1.nixcraft.net.in nfs1
    172.168.232.51  nfs2.nixcraft.net.in nfs2
    192.168.1.101	vm01

### See also: ###

Related: [Windows Vista / XP Flush DNS Cache][3] with ipconfig Command

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/rhel-debian-ubuntu-flush-clear-dns-cache/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://theos.in/windows-vista/flush-dns-cache-with-ipconfig/
[2]:http://www.cyberciti.biz/tips/how-do-i-improve-dns-performance-on-linuxwindows-desktop.html
[3]:http://theos.in/windows-vista/flush-dns-cache-with-ipconfig/