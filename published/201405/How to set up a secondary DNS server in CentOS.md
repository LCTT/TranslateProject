如何在CentOS中创建辅域名服务器
================================================================================
在[上篇教程][1]里，我们为一个测试域exmample.tst创建了一个主域名服务器（ns1）。在本篇中，我们会在CentOS中使用bind包为相同的域创建一个辅域名服务器（ns2）。

当创建一个辅DNS服务器的时候，下面的因素需要仔细考虑。

- 在辅域名服务器中，你不需要手动创建正向和反向区域文件。这些区域文件会定期从主域名服务器上面同步。
- 当主域名服务器上的任何区域文件被修改的时候，'serial'参数也应当被更新。只有当主服务器上面区域文件的serial被修改之后，辅DNS服务器才会进行同步。

我们假设辅DNS服务器的IP地址是172.16.1.4。让我们来进行安装。

### 设置主机名 ###

就像主域名服务器一样，辅域名服务器的主机名也应当是一个完全限定域名（FQDN）。

    # vim /etc/sysconfig/network

> HOSTNAME=ns2.example.tst

注意，在该文件中设置的主机名在服务器启动的时候会被使用。因此，如果你在系统启动之后修改该文件，修改结果不会立刻生效。下面的命令可以用来在系统运行的时候修改并及时生效。

    # hostname ns2.example.tst

设置之后，可以用下面的命令来查看主机名称。

    # hostname
----
	ns2.example.tst

在进行下面的步骤之前，确保所有三台服务器的主机名称已经被正确设置。

### 安装软件包 ###

就像[主服务器][1]一样，配置一台辅域名服务器可以使用chroot或者不用。必须的软件包可以使用yum轻松安装。

不使用 chroot:

    # yum install bind

使用 chroot:

    # yum install bind-chroot

### 为区域文件的传输准备配置文件 ###

在CentOS中使用bind创建域名服务器后，默认设置允许所有的区域文件被任意服务器同步。安全起见，我们需要配置主域名服务器，只允许它允许辅域名服务器进行同步。

#### 1. 主域名服务器 ####

不使用chroot：

    # vim /etc/named.conf

使用chroot：

    # vim /var/named/chroot/etc/named.conf

----------

    zone "example.tst" IN {
        type master;
        file "example-fz"; ## 文件example-fz在主域名服务器上 ##
        allow-update { none; };
        allow-transfer {172.16.1.4; }; ## 允许辅域名服务器进行传输 ##
    };

    zone "1.16.172.in-addr.arpa" IN {
        type master;
        file "rz-172-16-1"; ##文件rz-172-16-1在主域名服务器上##
        allow-update { none; };
        allow-transfer {172.16.1.4; }; ## 允许辅域名服务器进行传输 ##
    };

#### 2. 辅域名服务器 ####

软件安装后提供的默认配置文件就可以用来配置辅域名服务器。但是，我们使用会使用另外一个实例配置文件来进行配置，因为这样便于调整。

不使用chroot：

    # cp /usr/share/doc/bind-9.8.2/sample/etc/named.rfc1912.zones /etc/named.conf

使用chroot：

    # cp /usr/share/doc/bind-9.8.2/sample/etc/named.rfc1912.zones /var/named/chroot/etc/named.conf

当执行完上面的命令进行文件拷贝后，添加下面的内容到刚才那个拷贝后的文件中。

    options {
            directory "/var/named";
            forwarders {8.8.8.8; };

    };

    zone "example.tst" IN {
            type slave;  ## 该主机为辅域名服务器 ##
            file "example-fz"; ## 这个文件会被自动创建 ##
            //allow-update { none; };
            allow-transfer {172.16.1.3; };  ## 定义必要时进行从其传输的主域名服务器 ##
            masters {172.16.1.3; }; ## 定义主域名服务器 ##
    };

    zone "1.16.172.in-addr.arpa" IN {
            type slave; ## 该主机被定义为辅域名服务器 ##
            file "rz-172-16-1"; ## 这个文件会被自动创建 ##
    //      allow-update { none; };
            allow-transfer {172.16.1.3; };  ## 定义主域名服务器 ##
            masters {172.16.1.3; };
    };

### 结束工作 ###

为了确保没有权限相关的问题，我们需要做如下调整。

不使用chroot：

    chmod 770 /var/named/

使用chroot，你需在named服务启动后按照下面的命令修改权限。

    # chmod 770 /var/named/chroot/var/named

现在万事俱备，我们可以重启named服务。或者，确保named服务已经被加到了开始列表中。

    # service named restart
    # chkconfig named on

如果不出意外，辅域名服务器应该会向主域名服务器请求一个区域的传输，并且产生自己的/var/named目录。日志文件/var/log/messages会包含一些named服务的有用信息，包括区域文件传输过程中的信息。

### 测试一个辅域名服务器 ###

我们可以使用dig或者nslookup进行DNS测试操作。在本篇教程中我们会使用nslookup来进行演示。必要的软件包可以通过yum进行安装。

    # yum install bind-utils
    # nslookup

----------

    > server 172.16.1.4
    Default server:     172.16.1.4
    Address:            172.16.1.4#53

    > example.tst
    Server:             172.16.1.4
    Address:    172.16.1.4#53

    Name:       example.tst
    Address:    172.16.1.3

    > set type=mx
    > example.tst
    Server:             172.16.1.4
    Address:            172.16.1.4#53

    example.tst         mail exchanger = 10 mail.example.tst.

    > exit

### 排错提示 ###

1. 我们无需在辅域名服务器上创建任何区域文件。所有的区域文件都会与主域名服务器进行同步。

2. 辅域名服务器上的named服务会定期与主服务器进行同步。如果你想来一次及时的同步，可以使用命令"rncd retransfer <FQDN>"。如下：

    	# rndc retransfer example.tst

3. 只有当主服务器上区域文件的serial数字被修改变大的时候，辅域名服务器才会进行更新。

4. 确保用户named可以对文件夹/var/named或者/var/named/chroot/var/named（使用chroot的情况下）进行写操作。

5. /var/log/messages会包含有用的信息。

6. 我已经将SELinux关闭了。

7. 确保防火墙对UDP53端口开放。

希望这个可以帮到你。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/secondary-dns-server-centos.html

译者：[zzlyzq](https://github.com/zzlyzq) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-3092-1.html
