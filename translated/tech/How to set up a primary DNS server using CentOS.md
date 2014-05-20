Translated by GOLinux!

CentOS上配置主DNS服务器
================================================================================
任何运作中的域名至少有两台DNS服务器，一台称为主域名服务器（ns1），而另一台称为从域名服务器（ns2）。这些服务器通常用于故障转移：如果一台宕机，另外一台就激活成为DNS服务器。包括负载均衡、防火墙和集群在内的更为复杂的故障转移机制也可实现。

用于特定域的所有DNS条目被添加到主域名服务器，从服务器只会根据主服务器上的计数器类型参数从主服务器同步所有信息。

此教程将会讲述**如何创建一台在CentOS上运行的主DNS服务器**。请注意，本教程中提到的DNS服务器将会是一台公共DNS服务器，这也就是说该服务器将会回应来自任何IP地址的查询。对于服务器的访问控制将在[此教程][]中讨论。

在开始之前，我想要提一下的是，DNS可以在chroot监牢环境中配置，也可以在非chroot监牢环境中配置。chroot监牢环境将DNS服务器限制在系统中某个特定目录中，以避免让服务器具有系统范围的访问权限。在此环境中，任何DNS服务器的漏洞不会造成整个系统的破坏。将DNS服务器置于chroot环境中，对于测试部署也很有用。
### 目标 ###
我们将在基于域名example.tst的测试环境中配置一台DNS服务器，这个域名是假定的（非真实存在的）。这样，我们就不会意外干扰到其它存活的域名。

在该域中，有以下三台服务器。

<table>
<tbody><tr>
<td>服务器</td>
<td>IP地址</td>
<td>托管的服务</td>
<td>完全合格域名</td>
</tr>
<tr>
<td>Server A</td>
<td>172.16.1.1</td>
<td>Mail</td>
<td>mail.example.tst</td>
</tr>
<tr>
<td>Server B</td>
<td>172.16.1.2</td>
<td>Web, FTP</td>
<td>www.example.tst<br>ftp.example.tst</td>
</tr>
<tr>
<td>Server C</td>
<td>172.16.1.3</td>
<td>Primary DNS server</td>
<td>ns1.example.tst</td>
</tr>
</tbody></table>

我们将会配置一台主域名服务器，并添加上表中必要的域和DNS记录。
### 设置主机名 ###
所有的主机名必须以完全合格域名的方式正确定义，可以通过以下方法完成设置。

    # vim /etc/sysconfig/network 

> HOSTNAME=ns1.example.tst

注：该文件中指定的主机名参数在服务器启动后才会启用，因此，该设置不会马上生效。下面的命令可以立刻临时性地修改主机名。

    # hostname ns1.example.tst 

一旦设置，主机名可以通过以下命令验证。

    # hostname 

> ns1.example.tst

在进入下一步之前，请确保三台服务器上的主机名已经设置正确。

### 安装软件包 ###
我们将使用bind来配置DNS服务，该软件可以很方便地通过yum来安装。

安装DNS所需软件包：

    # yum install bind bind-chroot 

### 准备配置文件 ###
正如前面提到的，bind可以在chroot环境下配置，或者在非chroot环境下配置，配置文件的路径会因为是否安装chroot包而不同。

<table>
<tbody><tr>
<td></td>
<td>配置文件路径</td>
<td>区域文件路径</td>
</tr>
<tr>
<td>
不带有 <tt>chroot</tt>
</td>
<td>
/etc/
</td>
<td>
/var/named/
</td>
</tr>
<tr>
<td>
带有 <tt>chroot</tt>
</td>
<td>
/var/named/chroot/etc/
</td>
<td>
/var/named/chroot/var/named/
</td>
</tr>
</tbody></table>

可以使用默认提供的named.conf配置文件，但是为了更方便使用，我们将使用另外一个配置文件模板。

非`chroot`环境：

    # cp /usr/share/doc/bind-9.8.2/sample/etc/named.rfc1912.zones /etc/named.conf

`chroot`环境：

    # cp /usr/share/doc/bind-9.8.2/sample/etc/named.rfc1912.zones /var/named/chroot/etc/named.conf

现在来备份并修改配置文件。

非`chroot`环境：

    # vim /etc/named.conf 

`chroot`环境：

    # vim /var/named/chroot/etc/named.conf 

添加/修改以下行：

    options {
    ## path to zone files ##
    directory "/var/named";
    
    ## forwarding the query to Google public DNS server for non-local domains ##
    forwarders { 8.8.8.8; };
    };
    
    ## declaration of the forward zone for example.tst ##
    zone "example.tst" IN {
            type master;
            file "example-fz"; ## filename for the forward zone stored in /var/named ##
            allow-update { none; };
    };
    
    ## declaration of reverse zone for network 172.16.1.0 ##
    zone "1.16.172.in-addr.arpa" IN {
            type master;
            file "rz-172-16-1"; ## filename for the reverse zone stored in /var/named ##
            allow-update { none; };
    };

### 准备区域文件 ###
默认的区域文件会自动创建到`/var/named` 或者`/var/named/chroot/var/named` (`chroot`环境)。如果在这些地方找不到这些文件，`/usr/share/doc/bind`目录中提供了模板文件，可以从这里拷贝。

假设默认区域文件没有提供，我们可以从`/usr`拷贝模板文件。

非`chroot`环境：

    # cp /usr/share/doc/bind-9.8.2/sample/var/named/named.* /var/named/

`chroot`环境：

    # cp /usr/share/doc/bind-9.8.2/sample/var/named/named.* /var/named/chroot/var/named

太棒了！由于现在默认的区域文件已经准备好，我们可以为example.tst和172.16.1.0网络创建区域文件了，以下要点必须时刻谨记。

- 区域文件中的特殊字符‘@’意味着空。
- 所有的完全合格域名必须以点‘.’结束。如：example.tst.如果没有这个点，你会发生问题。
#### 1. 转发区域 ####
转发区域包含了名称到IP地址的映射。对于公共域，域名托管提供商的DNS存储了转发区域文件。

非`chroot`环境：

    # vim /var/named/example-fz 

`chroot`环境：

    # vim /var/named/chroot/var/named/example-fz 

----------

    $TTL 1D
    @       IN SOA  ns1.example.tst. sarmed.example.tst. (
                                            0       ; serial
                                            1D      ; refresh
                                            1H      ; retry
                                            1W      ; expire
                                            3H )    ; minimum
    IN NS      ns1.example.tst.
    IN A       172.16.1.3
    mail		IN A		172.16.1.1
    		IN MX 10	mail.example.tst.
    www		IN A		172.16.1.2
    ns1		IN A		172.16.1.3
    ftp		IN CNAME	www.example.tst.

**说明**：在区域文件中，SOA是开始授权的意思。此处是授权名称服务器的完全合格域名。完全合格域名后面跟着的是电子邮件地址。由于不能在sarmed@example.tst这样的格式中使用‘@’符号，我们将电子邮件地址重写成sarmed.example.tst.这样的格式。

- **NS**：名称服务器
- **A**: 记录或者地址记录，记录IP地址
- **MX**: 邮件交换记录。这里我们只使用一个邮件交换记录，设置其优先级为10。如果有多个邮件交换记录，我们可以使用多个数值优先级，数字小的优先级最高。例如，MX 0比MX 1优先级更高。
- **CNAME**: 标准名。如果在一台单一服务器上托管了多个服务，也很可能将多个名称解析到此台单一服务器。CNAME指定了一台服务器可能有的其它名称，并且将它们指向具有实际A记录的名称。
#### 2. 反向区域 ####
反向区域包含了IP地址到名称的映射。这里，我们为172.16.1.0网络创建反向区域。在生产域中，公共IP区块的拥有者拥有的DNS服务器存储反向区域文件。

非`chroot`环境：

    # vim /var/named/rz-172-16-1 

`chroot`环境：

    # vim /var/named/chroot/var/named/rz-172-16-1 

----------

    $TTL 1D
    @       IN SOA  ns1.example.tst. sarmed.example.tst. (
                                            0       ; serial
                                            1D      ; refresh
                                            1H      ; retry
                                            1W      ; expire
                                            3H )    ; minimum
    IN NS      ns1.example.tst.
    1		IN PTR	mail.example.tst.
    2		IN PTR	www.example.tst.
    3		IN PTR	ns1.example.tst.

**说明**:除了下面的参数外，反向区域文件中的大多数参数和转发区域文件中的相同。

- PTR: PTR或者指针记录指向完全合格域名

### 结束工作 ###
既然区域文件已经准备好，我们接下来调整它们的权限。

非`chroot`环境：

    # chgrp named /var/named/* 

`chroot`环境：

    # chgrp named /var/named/chroot/var/named/* 

现在，我们为DNS服务器设置IP地址。

    # vim /etc/resolv.conf 

----------

    nameserver 172.16.1.3

最后，我们可以启动DNS服务，并确保将它添加到启动服务中。

    # service named restart
    # chkconfig named on 

DNS服务器开动后，建议关注一下日志文件/var/log/messages，这里头包含了后台运行的一些有用信息。如果没有发现错误，我们可以开始测试DNS服务器。
### 测试DNS ###
我们可以使用dig或者nslookup来测试DNS。首先，我们需要安装必要的软件包。

    # yum install bind-utils 

#### 1. 使用dig测试转发区域 ####
使用dig来测试时，必须时刻关注状态信息：“NOERROR”，任何其它值都表明存在问题。

    # dig example.tst 

----------

    ;; ->>HEADER<<- opcode: QUERY,  status: NOERROR, id: 31184
    
    ;; QUESTION SECTION:
    ;example.com.                   IN      A
    
    ;; ANSWER SECTION:
    example.com.            86400   IN      A       172.16.1.3
    
    ;; AUTHORITY SECTION:
    example.com.            86400   IN      NS      ns1.example.com.
    
    ;; ADDITIONAL SECTION:
    ns1.example.com.        86400   IN      A       172.16.1.3

#### 2. 使用dig测试PTR记录 ####
使用dig来测试时，必须时刻关注状态信息：“NOERROR”，任何其它值都表明存在问题。
    
    # dig -x 172.16.1.1 

----------

    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 27415
    
    ;; QUESTION SECTION:
    ;1.1.17.172.in-addr.arpa.       IN      PTR
    
    ;; ANSWER SECTION:
    1.1.16.172.in-addr.arpa. 86400  IN      PTR     mail.example.tst.
    
    ;; AUTHORITY SECTION:
    1.16.172.in-addr.arpa.  86400   IN      NS      ns1.example.tst.
    
    ;; ADDITIONAL SECTION:
    ns1.example.tst.        86400   IN      A       172.16.1.3

#### 3. 使用dig测试MX记录 ####

    # dig example.tst mx 

----------

    ;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 35405
    
    ;; QUESTION SECTION:
    ;example.tst.                        IN      MX
    
    ;; ANSWER SECTION:
    example.tst.         14366   IN      MX     10	mail.example.tst.

### 排障提示 ###
1. 我已经把SELinux关闭。
1. 保证防火墙没有阻挡UDP 53端口
1. 万一出错，可在/var/log/messages中查看到有用的信息
1. 确保区域文件的拥有者为‘named’
1. 确保DNS服务器的IP地址是/etc/resolv.conf中的第一条目
1. 如果你使用example.tst作为实验环境，确保将服务器从互联网断开，因为example.tst是一个不存在的域。

最后小结，该教程关注的是实验环境中配置example.tst域用作为演示。请注意，该教程中创建了一台公共DNS服务器，此服务器会回应来自任何源IP地址的查询。如果你是在配置DNS生产服务器，请确保检查与公共DNS相关的策略。其它教程涵盖了[创建从DNS服务器][2], [限制对DNS服务器的访问][3]以及部署DNSSEC。

希望此教程对您有所帮助。
--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/04/primary-dns-server-using-centos.html

译者：[GOLinux](https://github.com/GOLinux) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/2014/04/close-open-dns-resolver.html
[2]:http://xmodulo.com/2014/04/secondary-dns-server-centos.html
[3]:http://xmodulo.com/2014/04/close-open-dns-resolver.html
