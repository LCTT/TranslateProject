[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11997-1.html)
[#]: subject: (How to setup a DNS server with bind)
[#]: via: (https://fedoramagazine.org/how-to-setup-a-dns-server-with-bind/)
[#]: author: (Curt Warfield https://fedoramagazine.org/author/rcurtiswarfield/)

简明指南：使用 bind 设置 DNS 服务器
======

![][1]

<ruby>域名系统<rt>Domain Name System</rt></ruby>，我们更通常称为 DNS 的系统，可以将域名翻译或转换为与该域关联的 IP 地址。DNS 是能够让你通过名称找到自己喜欢的网站而不是在浏览器中输入 IP 地址的原因。本指南将向你展示如何配置一个主 DNS 系统以及客户端。

以下是本文示例中使用的系统细节：

```
dns01.fedora.local    （192.168.1.160）- 主 DNS 服务器
client.fedora.local     （192.168.1.136）- 客户端
```

### DNS 服务器配置

使用 `sudo` 安装 bind 包：

```
$ sudo dnf install bind bind-utils -y
```

bind 包提供了 `/etc/named.conf` 配置文件，来供你配置 DNS 服务器。

编辑 `/etc/named.conf` 文件：

```
sudo vi /etc/named.conf
```

查找以下行：

```
listen-on port 53 { 127.0.0.1; };
```

添加主 DNS 服务器的 IP 地址，如下所示：

```
listen-on port 53 { 127.0.0.1; 192.168.1.160; };
```

查找以下行：

```
allow-query  { localhost; };
```

添加本地网络范围。该示例系统使用的 IP 地址在 192.168.1.X 的范围内。指定如下：

```
allow-query  { localhost; 192.168.1.0/24; };
```

指定转发和反向区域。<ruby>区域文件<rt>Zone file</rt></ruby>就是具有系统上 DNS 信息（例如 IP 地址和主机名）的文本文件。<ruby>转发区域文件<rt>forward zone file</rt></ruby>使得将主机名转换为 IP 地址成为可能。<ruby>反向区域文件<rt>reverse zone file</rt></ruby>则相反。它允许远程系统将 IP 地址转换为主机名。

在 `/etc/named.conf` 文件的底部查找以下行：

```
include "/etc/named.rfc1912.zones";
```

在此处，你将在**该行的正上方**指定区域文件信息，如下所示：

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

`forward.fedora.local` 和 `reverse.fedora.local` 文件是要创建的区域文件的名称。它们可以是任意名字。

保存并退出。

#### 创建区域文件

创建你在 `/etc/named.conf` 文件中指定的转发和反向区域文件：

```
$ sudo vi /var/named/forward.fedora.local
```

添加以下行：

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

所有**粗体**（LCTT 译注：本译文中无法呈现粗体）内容都特定于你的环境。保存文件并退出。接下来，编辑 `reverse.fedora.local` 文件：

```
$ sudo vi /var/named/reverse.fedora.local
```

添加以下行：

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

所有**粗体**（LCTT 译注：本译文中无法呈现粗体）内容都特定于你的环境。保存文件并退出。

你还需要配置 SELinux 并为配置文件添加正确的所有权。

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

#### 检查配置是否存在语法错误

```
sudo named-checkconf /etc/named.conf
```

如果没有输出或返回错误，那么你的配置有效。

检查转发和反向区域文件。

```
$ sudo named-checkzone forward.fedora.local /var/named/forward.fedora.local

$ sudo named-checkzone reverse.fedora.local /var/named/reverse.fedora.local
```

你应该看到 “OK” 的响应：

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

编辑 `/etc/resolv.conf` 文件：

```
$ sudo vi /etc/resolv.conf
```

查找你当前的 `nameserver` 行。在示例系统上，使用调制解调器/路由器充当名称服务器，因此当前看起来像这样：

```
nameserver 192.168.1.1
```

这需要更改为主 DNS 服务器的 IP 地址：

```
nameserver 192.168.1.160
```

保存更改并退出。

不幸的是需要注意一点。如果系统重启或网络重启，那么 NetworkManager 会覆盖 `/etc/resolv.conf` 文件。这意味着你将丢失所做的所有更改。

为了防止这种情况发生，请将 `/etc/resolv.conf` 设为不可变：

```
$ sudo chattr +i /etc/resolv.conf
```

如果要重新设置，就需要允许其再次被覆盖：

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

需要检查几件事以验证 DNS 服务器是否正常运行。显然，取得结果很重要，但这本身并不意味着 DNS 服务器实际上正常工作。

顶部的 `QUERY`、`ANSWER` 和 `AUTHORITY` 字段应显示为非零，如我们的示例所示：

```
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 3, ADDITIONAL: 6
```

并且 `SERVER` 字段应有你的 DNS 服务器的 IP 地址：

```
;; SERVER: 192.168.1.160#53(192.168.1.160)
```

如果这是你第一次运行 `dig` 命令，请注意完成查询要花费 830 毫秒的时间：

```
;; Query time: 830 msec
```

如果再次运行它，查询将会更快：

```
$ dig fedoramagazine.org
```

```
;; Query time: 0 msec
;; SERVER: 192.168.1.160#53(192.168.1.160)
```

### 客户端配置

客户端配置将简单得多。

安装 bind 程序：

```
$ sudo dnf install bind-utils -y
```

编辑 `/etc/resolv.conf` 文件，并将主 DNS 配置为唯一的名称服务器：

```
$ sudo vi /etc/resolv.conf
```

它看起来像这样：

```
nameserver 192.168.1.160
```

保存更改并退出。然后，使 `/etc/resolv.conf` 文件不可变，防止其被覆盖并变回默认设置：

```
$ sudo chattr +i /etc/resolv.conf
```

#### 测试客户端

你应该获得与 DNS 服务器相同的结果：

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

确保 `SERVER` 输出的是你 DNS 服务器的 IP 地址。

你的 DNS 服务器设置完成了，现在所有来自客户端的请求都会经过你的 DNS 服务器了！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/how-to-setup-a-dns-server-with-bind/

作者：[Curt Warfield][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/rcurtiswarfield/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/01/dns-server-bind-1-816x345.png
