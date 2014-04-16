How to set up a secondary DNS server in CentOS
================================================================================
In the [previous tutorial][1], we created a primary DNS server (ns1) for a test domain example.tst. In this tutorial, we will create a secondary DNS server (ns2) for the same domain by using bind package on CentOS.

When it comes to setting up a secondary DNS server, the following factors should be kept in mind.

- You do NOT need to manually create forward and reverse zone files in the secondary DNS server. The zone files will be periodically synced from the primary DNS server automatically.
- Whenever any zone file is modified in the primary DNS server, the parameter 'serial' should be updated. The secondary DNS server will initiate synchronization (zone transfer) only if serial at the primary server has been changed. 

We assume that the IP address of the secondary DNS server to be set up is 172.16.1.4. Let us start installing.

### Setting up Hostnames ###

Just like the primary DNS server, the hostname of the secondary name server should be defined as FQDN properly.

    # vim /etc/sysconfig/network

> HOSTNAME=ns2.example.tst

Note that the hostname parameter specified in this file is used while the server is booting up. Therefore, the change does not take effect immediately. The following command can be used to change the hostname of a server immediately at run-time.

    # hostname ns2.example.tst

Once set, hostname can be verified using the following command.

    # hostname

> ns2.example.tst

Before proceeding to the next step, make sure that the hostname of all three servers are set properly.

### Installing Packages ###

Just like a [primary server][2], a secondary DNS server can be set up with or without chroot. Necessary packages can be easily installed using yum.

Without chroot:

    # yum install bind

With chroot:

    # yum install bind-chroot

### Preparing Configuration File for Zone Transfers ###

The DNS server powered by bind on CentOS will by default allow zone transfers for any requesting server. For security reasons, we need to configure the primary DNS server, such that it permits zone transfers to the secondary DNS server (172.16.1.4) only.

#### 1. Primary DNS Server ####

Without chroot:

    # vim /etc/named.conf

With chroot:

    # vim /var/named/chroot/etc/named.conf
	
----------

    zone "example.tst" IN {
        type master;
        file "example-fz"; ## the zone file hosted at NS1 ##
        allow-update { none; };
        allow-transfer {172.16.1.4; }; ## NS2 is permitted ##
    };
 
    zone "1.16.172.in-addr.arpa" IN {
        type master;
        file "rz-172-16-1"; ##the zone file hosted at NS1##
        allow-update { none; };
        allow-transfer {172.16.1.4; }; ## NS2 is permitted ##
    };

#### 2. Secondary DNS Server ####

The default configuration file provided with the installation could be used to configure the secondary server. However, we will be using another sample configuration file as it is easier to tune.

Without chroot:

    # cp /usr/share/doc/bind-9.8.2/sample/etc/named.rfc1912.zones /etc/named.conf

With chroot:

    # cp /usr/share/doc/bind-9.8.2/sample/etc/named.rfc1912.zones /var/named/chroot/etc/named.conf

After the sample configuration file is copied over, the following lines are added/modified.
	
    options {
            directory "/var/named";
            forwarders {8.8.8.8; };
 
    };
 
    zone "example.tst" IN {
            type slave;  ## NS2 role is defined ##
            file "example-fz"; ## the name of the zone file to be automatically created ##
            //allow-update { none; };
            allow-transfer {172.16.1.3; };  ## NS1 is allowed for zone transfer when necessary ##
            masters {172.16.1.3; }; ## the master NS1 is defined ##
    };
 
    zone "1.16.172.in-addr.arpa" IN {
            type slave; ## NS2 role is defined ##
            file "rz-172-16-1"; ## the name of the zone file to be automatically created ##
    //      allow-update { none; };
            allow-transfer {172.16.1.3; };  ## the master NS1 is defined ##
            masters {172.16.1.3; };
    };

### Finalizing Installation ###

To make sure that there is no permission related issues, we need to adjust the following.

Without chroot:

    chmod 770 /var/named/

With chroot, you need to modify the permission as follows AFTER named service has started.

    # chmod 770 /var/named/chroot/var/named

Now that everything is ready, we can restart named service. Also, make sure that named service is added to startup list.

    # service named restart
    # chkconfig named on

If all goes well, the secondary DNS server should request a zone transfer from the primary DNS server, and populate its own /var/named. The log file /var/log/messages should contain useful information about the status of the named service as well as the zone transfer.

### Testing a Secondary DNS Server ###

We can use dig or nslookup to test DNS operations. We will be demonstrating the use of nslookup in this tutorial. Necessary packages can be installed using yum.

    # yum install bind-utils
    # nslookup

----------

    > server 172.16.1.4
    Default server: 	172.16.1.4
    Address: 		172.16.1.4#53

    > example.tst
    Server:		172.16.1.4
    Address:	172.16.1.4#53

    Name:	example.tst
    Address: 	172.16.1.3

    > set type=mx
    > example.tst
    Server:		172.16.1.4
    Address:		172.16.1.4#53

    example.tst		mail exchanger = 10 mail.example.tst.

    > exit

### Troubleshooting ###

1. We do not need to create any zone files in the secondary DNS server. All the zone files will be synchronized from the primary server.

2. The named service at the secondary server will periodically initiate zone transfers with the primary server. If you want to force a one-time zone transfer, the command "rndc retransfer <FQDN>" can be used. For example:

    # rndc retransfer example.tst

3. A secondary DNS server will update its zone files only if the serial at the primary server has been modified/incremented.

4. Make sure that the directory /var/named or /var/named/chroot/var/named (in case of chroot) is writable by named user.

5. /var/log/messages should contain useful information.

6. I have SELinux turned off.

7. Make sure UDP port 53 is allowed in the firewall.

Hope this helps.

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/secondary-dns-server-centos.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2014/04/primary-dns-server-using-centos.html
[2]:http://xmodulo.com/2014/04/primary-dns-server-using-centos.html