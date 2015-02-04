在 CentOS7.0 上搭建 Chroot 的 Bind DNS 服务器
====================

BIND（Berkeley internet Name Daemon)也叫做NAMED，是现今互联网上使用最为广泛的DNS 服务器程序。这篇文章将要讲述如何在 chroot 监牢中运行 BIND，这样它就无法访问文件系统中除“监牢”以外的其它部分。

例如，在这篇文章中，我会将BIND的运行根目录改为 /var/named/chroot/。当然，对于BIND来说，这个目录就是 /（根目录）。 “jail”（监牢，下同）是一个软件机制，其功能是使得某个程序无法访问规定区域之外的资源，同样也为了增强安全性（LCTT 译注：chroot “监牢”，所谓“监牢”就是指通过chroot机制来更改某个进程所能看到的根目录，即将某进程限制在指定目录中，保证该进程只能对该目录及其子目录的文件进行操作，从而保证整个服务器的安全）。Bind Chroot DNS 服务器的默认“监牢”为 /var/named/chroot。你可以按照下列步骤，在CentOS 7.0 上部署 Bind Chroot DNS 服务器。

### 1、安装Bind Chroot DNS 服务器

    	[root@centos7 ~]# yum install bind-chroot bind -y

### 2、拷贝bind相关文件,准备bind chroot 环境

    	[root@centos7 ~]# cp -R /usr/share/doc/bind-*/sample/var/named/* /var/named/chroot/var/named/

### 3、在bind chroot 的目录中创建相关文件

   	    [root@centos7 ~]# touch /var/named/chroot/var/named/data/cache_dump.db

    	[root@centos7 ~]# touch /var/named/chroot/var/named/data/named_stats.txt

    	[root@centos7 ~]# touch /var/named/chroot/var/named/data/named_mem_stats.txt

    	[root@centos7 ~]# touch /var/named/chroot/var/named/data/named.run

    	[root@centos7 ~]# mkdir /var/named/chroot/var/named/dynamic

    	[root@centos7 ~]# touch /var/named/chroot/var/named/dynamic/managed-keys.bind


### 4、 将 Bind 锁定文件设置为可写

    	[root@centos7 ~]# chmod -R 777 /var/named/chroot/var/named/data
    	[root@centos7 ~]# chmod -R 777 /var/named/chroot/var/named/dynamic

### 5、 将 /etc/named.conf 拷贝到 bind chroot目录

    	[root@centos7 ~]# cp -p /etc/named.conf /var/named/chroot/etc/named.conf

### 6、 在/etc/named.conf中对 bind 进行配置。

在 named.conf 文件尾添加 **example.local** 域信息， 创建转发域（Forward Zone）与反向域（Reverse Zone）（LCTT 译注：这里example.local 并非一个真实有效的互联网域名，而是通常用于本地测试的一个域名；如果你需要做权威 DNS 解析，你可以将你拥有的域名如这里所示配置解析。）：

    	[root@centos7 ~]# vi /var/named/chroot/etc/named.conf

--
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

named.conf 完全配置如下：

    //
    // named.conf
    //
    // 由Red Hat提供，将 ISC BIND named(8) DNS服务器 
    // 配置为暂存域名服务器 (用来做本地DNS解析).
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
             - 如果你要建立一个 授权域名服务器 服务器, 那么不要开启 recursion（递归） 功能。
             - 如果你要建立一个 递归 DNS 服务器, 那么需要开启recursion 功能。
             - 如果你的递归DNS服务器有公网IP地址, 你必须开启访问控制功能，
               只有那些合法用户才可以发询问. 如果不这么做的话，那么你的服
               服务就会受到DNS 放大攻击。实现BCP38将有效抵御这类攻击。
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

### 7、 为 example.local 域名创建转发域与反向域文件

#### a)创建转发域

    [root@centos7 ~]# vi /var/named/chroot/var/named/example.local.zone

添加如下内容并保存：

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

#### b)创建反向域

    [root@centos7 ~]# vi /var/named/chroot/var/named/192.168.0.zone

--

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
    80.0.168.192.in-addr.arpa. IN PTR ns2.example.local.。
    
### 8、开机自启动 bind-chroot 服务：

    [root@centos7 ~]# /usr/libexec/setup-named-chroot.sh /var/named/chroot on
    [root@centos7 ~]# systemctl stop named
    [root@centos7 ~]# systemctl disable named
    [root@centos7 ~]# systemctl start named-chroot
    [root@centos7 ~]# systemctl enable named-chroot
    ln -s '/usr/lib/systemd/system/named-chroot.service' '/etc/systemd/system/multi-user.target.wants/named-chroot.service'

------------------

via: http://www.ehowstuff.com/how-to-setup-bind-chroot-dns-server-on-centos-7-0-vps/

作者：[skytech][a]
译者：[SPccman](https://github.com/SPccman)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/
[1]:http://www.ehowstuff.com/archives/

