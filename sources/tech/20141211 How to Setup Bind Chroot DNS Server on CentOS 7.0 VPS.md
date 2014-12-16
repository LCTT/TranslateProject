spccman translating
How to Setup Bind Chroot DNS Server on CentOS 7.0 VPS
================================================================================
BIND (Berkeley Internet Name Daemon) also known as NAMED is the most widely used DNS server in the internet. This tutorial will descibes how we can run BIND in a chroot jail, the process is simply unable to see any part of the filesystem outside the jail. For example, in this post, i will setting up BIND to run chrooted to the directory /var/named/chroot/. Well, to BIND, the contents of this directory will appear to be /, the root directory. A “jail” is a software mechanism for limiting the ability of a process to access resources outside a very limited area, and it’s purposely to enhance the security. Bind Chroot DNS server was by default configured to /var/named/chroot. You may follow this complete steps to implement Bind Chroot DNS Server on CentOS 7.0 virtual private server (VPS).

1. Install Bind Chroot DNS server :

    [root@centos7 ~]# yum install bind-chroot bind -y

2. Copy all bind related files to prepare bind chrooted environments :

    [root@centos7 ~]# cp -R /usr/share/doc/bind-*/sample/var/named/* /var/named/chroot/var/named/

3. Create bind related files into chrooted directory :

    [root@centos7 ~]# touch /var/named/chroot/var/named/data/cache_dump.db
    [root@centos7 ~]# touch /var/named/chroot/var/named/data/named_stats.txt
    [root@centos7 ~]# touch /var/named/chroot/var/named/data/named_mem_stats.txt
    [root@centos7 ~]# touch /var/named/chroot/var/named/data/named.run
    [root@centos7 ~]# mkdir /var/named/chroot/var/named/dynamic
    [root@centos7 ~]# touch /var/named/chroot/var/named/dynamic/managed-keys.bind

4. Bind lock file should be writeable, therefore set the permission to make it writable as below :

    [root@centos7 ~]# chmod -R 777 /var/named/chroot/var/named/data
    [root@centos7 ~]# chmod -R 777 /var/named/chroot/var/named/dynamic

5. Copy /etc/named.conf chrooted bind config folder :

    [root@centos7 ~]# cp -p /etc/named.conf /var/named/chroot/etc/named.conf

6.Configure main bind configuration in /etc/named.conf. Append the example.local zone information to the file :

    [root@centos7 ~]# vi /var/named/chroot/etc/named.conf

Create forward and reverse zone into named.conf:

    ..
    ..
    zone "example.local" {
        type master;
        file "example.local.zone";
    };
    
    zone "0.168.192.in-addr.arpa" IN {
            type master;
            file "192.168.0.zone";
    };
    ..
    ..

Full named.conf configuration :

    //
    // named.conf
    //
    // Provided by Red Hat bind package to configure the ISC BIND named(8) DNS
    // server as a caching only nameserver (as a localhost DNS resolver only).
    //
    // See /usr/share/doc/bind*/sample/ for example named configuration files.
    //
    
    options {
            listen-on port 53 { any; };
            listen-on-v6 port 53 { ::1; };
            directory       "/var/named";
            dump-file       "/var/named/data/cache_dump.db";
            statistics-file "/var/named/data/named_stats.txt";
            memstatistics-file "/var/named/data/named_mem_stats.txt";
            allow-query     { any; };
    
            /*
             - If you are building an AUTHORITATIVE DNS server, do NOT enable recursion.
             - If you are building a RECURSIVE (caching) DNS server, you need to enable
               recursion.
             - If your recursive DNS server has a public IP address, you MUST enable access
               control to limit queries to your legitimate users. Failing to do so will
               cause your server to become part of large scale DNS amplification
               attacks. Implementing BCP38 within your network would greatly
               reduce such attack surface
            */
            recursion yes;
    
            dnssec-enable yes;
            dnssec-validation yes;
            dnssec-lookaside auto;
    
            /* Path to ISC DLV key */
            bindkeys-file "/etc/named.iscdlv.key";
    
            managed-keys-directory "/var/named/dynamic";
        
            pid-file "/run/named/named.pid";
            session-keyfile "/run/named/session.key";
    };
    
    logging {
            channel default_debug {
                    file "data/named.run";
                    severity dynamic;
            };
    };
    
    zone "." IN {
            type hint;
            file "named.ca";
    };
    
    zone "example.local" {
        type master;
        file "example.local.zone";
    };
    
    zone "0.168.192.in-addr.arpa" IN {
            type master;
            file "192.168.0.zone";
    };
    
    include "/etc/named.rfc1912.zones";
    include "/etc/named.root.key";

7. Create Forward and Reverse zone files for domain example.local.

a) Create Forward Zone :

    [root@centos7 ~]# vi /var/named/chroot/var/named/example.local.zone

Add the following and save :

    ;
    ;       Addresses and other host information.
    ;
    $TTL 86400
    @       IN      SOA     example.local. hostmaster.example.local. (
                                   2014101901      ; Serial
                                   43200      ; Refresh
                                   3600       ; Retry
                                   3600000    ; Expire
                                   2592000 )  ; Minimum
    
    ;       Define the nameservers and the mail servers
    
                   IN      NS      ns1.example.local.
                   IN      NS      ns2.example.local.
                   IN      A       192.168.0.70
                   IN      MX      10 mx.example.local.
    
    centos7          IN      A       192.168.0.70
    mx               IN      A       192.168.0.50
    ns1              IN      A       192.168.0.70
    ns2              IN      A       192.168.0.80

b) Create Reverse Zone :

    [root@centos7 ~]# vi /var/named/chroot/var/named/192.168.0.zone

----------

    ;
    ;       Addresses and other host information.
    ;
    $TTL 86400
    @       IN      SOA     example.local. hostmaster.example.local. (
                                   2014101901      ; Serial
                                   43200      ; Refresh
                                   3600       ; Retry
                                   3600000    ; Expire
                                   2592000 )  ; Minimum
    
    0.168.192.in-addr.arpa. IN      NS      centos7.example.local.
    
    70.0.168.192.in-addr.arpa. IN PTR mx.example.local.
    70.0.168.192.in-addr.arpa. IN PTR ns1.example.local.
    80.0.168.192.in-addr.arpa. IN PTR ns2.example.local.

8. Stop and disable named service. Start and enable bind-chroot service at boot :

    [root@centos7 ~]# /usr/libexec/setup-named-chroot.sh /var/named/chroot on
    [root@centos7 ~]# systemctl stop named
    [root@centos7 ~]# systemctl disable named
    [root@centos7 ~]# systemctl start named-chroot
    [root@centos7 ~]# systemctl enable named-chroot
    ln -s '/usr/lib/systemd/system/named-chroot.service' '/etc/systemd/system/multi-user.target.wants/named-chroot.service'

As always if you need any help you can reach us on twitter @ehowstuff or drop us a comment below. [Jumping through archives page to read more articles..][1]

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-setup-bind-chroot-dns-server-on-centos-7-0-vps/

作者：[skytech][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/
[1]:http://www.ehowstuff.com/archives/
