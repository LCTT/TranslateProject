[#]: collector: (lujun9972)
[#]: translator: (qianmingtian)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to setup a DNS server with bind)
[#]: via: (https://fedoramagazine.org/how-to-setup-a-dns-server-with-bind/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

如何使用 bind 构建一台 DNS 服务器
======

![][1]

域名系统（ DNS ) 通常将域名转换成与该域名对应的 IP 地址。 DNS 是你能够通过名字找到你喜欢的网站而不是在浏览器中输入 IP 地址的原因。本指南向你展示了如何配置一个主 DNS 系统和一个客户端。

以下是本文例子中的系统细节:

```
dns01.fedora.local     (192.168.1.160 ) - Master DNS server
client.fedora.local    (192.168.1.136 ) - Client
```
### DNS 服务器配置

使用 sudo 安装 bind 包：

```
$ sudo dnf install bind bind-utils -y
```
配置文件 _/etc/named.conf_ 由 _bind_ 包提供，允许你配置 DNS 服务器。

编辑 _/etc/named.conf_ 配置文件：

```
sudo vi /etc/named.conf
```

查找如下内容：

```
listen-on port 53 { 127.0.0.1; };
```

添加你主 DNS 服务器的地址，具体如下：

```
listen-on port 53 { 127.0.0.1; 192.168.1.160; };
```

查找如下内容：

```
allow-query  { localhost; };
```

添加本地网络范围。示例系统使用了 192.168.1.X 网段的 IP 地址。具体如下:

```
allow-query  { localhost; 192.168.1.0/24; };
```

指定正向和反向区域。区域文件就是在你的系统上具有 DNS 信息（如 IP 地址和主机名）的文本文件。正向区域文件可以将主机名转换为其 IP 地址。反向区域文件执行相反的操作。它允许远程系统将 IP 地址转换为主机名。

在 _/etc/name.conf_ 文件的底部查找以下行:

```
include "/etc/named.rfc1912.zones";
```

在这里，你将要在 _**该行的上方**_ 指定区域文件信息，内容如下所示：

```
zone "dns01.fedora.local" IN {
type master;
file "forward.fedora.local";
allow-update { none; };
};

zone "1.168.192.in-addr.arpa" IN {
type master;
file "reverse.fedora.local";
allow-update { none; };
};
```

_forward.fedora.local_ 和文件 _reverse.fedora.local_ 只是你要创建的区域文件的名称。它们可以是任何你喜欢的名字。

保存并退出。

#### 创建区域文件

创建在 _/etc/named.conf_ 文件中指定的正向与反向区域文件：

```
$ sudo vi /var/named/forward.fedora.local
```

添加如下行：

```
$TTL 86400
@   IN  SOA     dns01.fedora.local. root.fedora.local. (
        2011071001  ;Serial
        3600        ;Refresh
        1800        ;Retry
        604800      ;Expire
        86400       ;Minimum TTL
)
@       IN  NS          dns01.fedora.local.
@       IN  A           192.168.1.160
dns01           IN  A   192.168.1.160
client          IN  A   192.168.1.136
```

_**加粗**_ 部分的所有内容指定了你的环境。保存该文件并退出。接下来，编辑 _reverse.fedora.local_ 文件：

```
$ sudo vi /var/named/reverse.fedora.local
```

添加如下行：

```
$TTL 86400
@   IN  SOA     dns01.fedora.local. root.fedora.local. (
        2011071001  ;Serial
        3600        ;Refresh
        1800        ;Retry
        604800      ;Expire
        86400       ;Minimum TTL
)
@       IN  NS          dns01.fedora.local.
@       IN  PTR         fedora.local.
dns01           IN  A   192.168.1.160
client          IN  A   192.168.1.136
160     IN  PTR         dns01.fedora.local.
136     IN  PTR         client.fedora.local.
```

_**加粗**_ 部分的所有内容指定了你的环境。保存该文件并退出。

你还需要配置 SELinux 并为配置文件添加正确的文件所有权。

```
sudo chgrp named -R /var/named
sudo chown -v root:named /etc/named.conf
sudo restorecon -rv /var/named
sudo restorecon /etc/named.conf
```

配置防火墙：

```
sudo firewall-cmd --add-service=dns --perm
sudo firewall-cmd --reload
```

#### 检查配置文件是否有语法错误

```
sudo named-checkconf /etc/named.conf
```

如果没有返回任何输出或错误，则配置有效。

检查正向区域和反向区域配置文件。

```
$ sudo named-checkzone forward.fedora.local /var/named/forward.fedora.local

$ sudo named-checkzone reverse.fedora.local /var/named/reverse.fedora.local
```

你应该能看到 OK 的响应：

```
zone forward.fedora.local/IN: loaded serial 2011071001
OK

zone reverse.fedora.local/IN: loaded serial 2011071001
OK
```

#### 启用并启动 DNS 服务

```
$ sudo systemctl enable named
$ sudo systemctl start named
```

#### 配置 resolv.conf 文件

编辑 _/etc/resolv.conf_ 文件：

```
$ sudo vi /etc/resolv.conf
```

查找你当前的名称服务器所在的行。在示例系统中，电缆调制解调器/路由器充当名称服务器，因此它当前看起来是这样的:

```
nameserver 192.168.1.1
```

它需要被修改为主 DNS 服务器的 IP 地址：

```
nameserver 192.168.1.160
```

保存修改并退出。

这里有一点需要注意。当系统或网络重启后， NetworkManager 会覆盖掉 _/etc/resolv.conf_ 文件。这意味着你会丢失你所做的所有修改。

为避免这种情况发生，将 _/etc/resolv.conf_ 不可被修改。

```
$ sudo chattr +i /etc/resolv.conf
```

如果你想把它设置回去，并允许它被再次覆盖:

```
$ sudo chattr -i /etc/resolv.conf
```

#### 测试 DNS 服务器

```
$ dig fedoramagazine.org
```

```
; <<>> DiG 9.11.13-RedHat-9.11.13-2.fc30 <<>> fedoramagazine.org
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8391
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 3, ADDITIONAL: 6

;; OPT PSEUDOSECTION:
 ; EDNS: version: 0, flags:; udp: 4096
 ; COOKIE: c7350d07f8efaa1286c670ab5e13482d600f82274871195a (good)
 ;; QUESTION SECTION:
 ;fedoramagazine.org.        IN  A

;; ANSWER SECTION:
 fedoramagazine.org.    50  IN  A   35.197.52.145

;; AUTHORITY SECTION:
 fedoramagazine.org.    86150   IN  NS  ns05.fedoraproject.org.
 fedoramagazine.org.    86150   IN  NS  ns02.fedoraproject.org.
 fedoramagazine.org.    86150   IN  NS  ns04.fedoraproject.org.

;; ADDITIONAL SECTION:
 ns02.fedoraproject.org.    86150   IN  A   152.19.134.139
 ns04.fedoraproject.org.    86150   IN  A   209.132.181.17
 ns05.fedoraproject.org.    86150   IN  A   85.236.55.10
 ns02.fedoraproject.org.    86150   IN  AAAA    2610:28:3090:3001:dead:beef:cafe:fed5
 ns05.fedoraproject.org.    86150   IN  AAAA    2001:4178:2:1269:dead:beef:cafe:fed5

 ;; Query time: 830 msec
 ;; SERVER: 192.168.1.160#53(192.168.1.160)
 ;; WHEN: Mon Jan 06 08:46:05 CST 2020
 ;; MSG SIZE  rcvd: 266
```

要验证 DNS 服务器是否正常工作，需要查看一些东西。显然，返回结果是很重要的，但这本身并不意味着 DNS 服务器起了作用。

顶部的 QUERY ， ANSWER ， AUTHORITY 字段应该显示非零，就像我们示例中的一样:

```
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 3, ADDITIONAL: 6
```

并且 SERVER　字段需要有你 DNS 服务器的 IP 的地址：

```
;; SERVER: 192.168.1.160#53(192.168.1.160)
```

如果这是你第一次运行 _dig_ 命令，请注意查询是如何花费 830 毫秒来完成的：

```
;; Query time: 830 msec
```

如果你再次运行它，查询将运行得更快:

```
$ dig fedoramagazine.org
```

```
;; Query time: 0 msec
;; SERVER: 192.168.1.160#53(192.168.1.160)
```

### 客户端配置

客户端的配置会简单很多。

安装 bind 应用程序：

```
$ sudo dnf install bind-utils -y
```

编辑 _/etc/resolv.conf_ 文件并且将主 DNS 服务器作为唯一的名称服务器：

```
$ sudo vi /etc/resolv.conf
```

配置后内容如下：

```
nameserver 192.168.1.160
```

保存并退出。然后，使 _/etc/resolv.conf_ 文件不可修改，避免它被覆盖为默认的配置。

```
$ sudo chattr +i /etc/resolv.conf
```

#### 测试客户端

你需要获得与 DNS 服务器测试相同的结果：

```
$ dig fedoramagazine.org
```

```
; <<>> DiG 9.11.13-RedHat-9.11.13-2.fc30 <<>> fedoramagazine.org
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 8391
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 3, ADDITIONAL: 6

;; OPT PSEUDOSECTION:
 ; EDNS: version: 0, flags:; udp: 4096
 ; COOKIE: c7350d07f8efaa1286c670ab5e13482d600f82274871195a (good)
 ;; QUESTION SECTION:
 ;fedoramagazine.org.        IN  A

;; ANSWER SECTION:
 fedoramagazine.org.    50  IN  A   35.197.52.145

;; AUTHORITY SECTION:
 fedoramagazine.org.    86150   IN  NS  ns05.fedoraproject.org.
 fedoramagazine.org.    86150   IN  NS  ns02.fedoraproject.org.
 fedoramagazine.org.    86150   IN  NS  ns04.fedoraproject.org.

;; ADDITIONAL SECTION:
 ns02.fedoraproject.org.    86150   IN  A   152.19.134.139
 ns04.fedoraproject.org.    86150   IN  A   209.132.181.17
 ns05.fedoraproject.org.    86150   IN  A   85.236.55.10
 ns02.fedoraproject.org.    86150   IN  AAAA    2610:28:3090:3001:dead:beef:cafe:fed5
 ns05.fedoraproject.org.    86150   IN  AAAA    2001:4178:2:1269:dead:beef:cafe:fed5

 ;; Query time: 1 msec
 ;; SERVER: 192.168.1.160#53(192.168.1.160)
 ;; WHEN: Mon Jan 06 08:46:05 CST 2020
 ;; MSG SIZE  rcvd: 266
```

确保 SERVER 输出包含有 DNS 服务器的 IP 地址。、

现在，你的 DNS 服务器就可以使用了，客户端所有的请求都会经过你的 DNS 服务器。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-setup-a-dns-server-with-bind/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[qianmingtian][c]
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[c]: (https://github.com/qianmingtian)
[1]: https://fedoramagazine.org/wp-content/uploads/2020/01/dns-server-bind-1-816x345.png
