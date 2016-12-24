Securi-Pi：使用树莓派作为安全跳板
================================================================================

像很多 LinuxJournal 的读者一样，我也过上了当今非常普遍的“科技游牧”生活，在网络之间，从一个接入点到另一个接入点，我们身处现实世界的不同地方却始终保持连接到互联网和日常使用的其它网络上。近来我发现越来越多的网络环境开始屏蔽对外的常用端口比如 SMTP（端口25），SSH（端口22）之类的。当你走进一家咖啡馆然后想 SSH 到你的一台服务器上做点事情的时候发现端口 22 被屏蔽了是一件很烦的事情。

不过，我到目前为止还没发现有什么网络环境会把 HTTPS 给墙了（端口443）。在稍微配置了一下家中的树莓派 2 之后，我成功地让自己通过接入树莓派的 443 端口充当跳板，从而让我在各种网络环境下都能连上想要的目标端口。简而言之，我把家中的树莓派设置成了一个 OpenVPN 的端点和 SSH 端点，同时也是一个 Apache 服务器，所有这些服务都监听在 443 端口上，以便可以限制我不想暴露的网络服务。


### 备注

此解决方案能搞定大多数有限制的网络环境，但有些防火墙会对外部流量调用深度包检查（Deep packet inspection），它们时常能屏蔽掉用本篇文章里的方式传输的信息。不过我到目前为止还没在这样的防火墙后测试过。同时，尽管我使用了很多基于密码学的工具（OpenVPN，HTTPS，SSH），我并没有非常严格地审计过这套配置方案（LCTT 译注：作者的意思是指这套方案能帮你绕过端口限制，但不代表你的活动就是完全安全的）。有时候甚至 DNS 服务都会泄露你的信息，很可能在我没有考虑周到的角落里会有遗漏。我强烈不推荐把此跳板配置方案当作是万无一失的隐藏网络流量的办法，此配置只是希望能绕过一些端口限制连上网络，而不是做一些危险的事情。

### 起步

让我们先从你需要什么说起，我用的是树莓派 2，装载了最新版本的 Raspbian，不过这个配置也应该能在树莓派 Model B 上运行；512MB 的内存对我们来说绰绰有余了，虽然性能可能没有树莓派 2这么好，毕竟相比于四核心的树莓派 2， Model B 只有一颗单核心 CPU。我的树莓派放置在家里的防火墙和路由器的后面，所以我还能用这个树莓派作为跳板访问家里的其他电子设备。同时这也意味着我的流量在互联网上看起来仿佛来自我家的 ip 地址，所以这也算某种意义上保护了我的匿名性。如果你没有树莓派，或者不想从家里运行这个服务，那你完全可以把这个配置放在一台小型云服务器上（LCTT 译注：比如 IPS ）。你只要确保服务器运行着基于 Debian 的 Linux 发行版即可，这份指南依然可用。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1002061/11913f1.jpg)

*图 1 树莓派，即将成为我们的加密网络端点*


### 安装并配置 BIND

无论你是用树莓派还是一台服务器，当你成功启动之后你就可以安装 BIND 了，这是一个驱动了互联网相当一部分的域名服务软件。你将会把 BIND 仅仅作为缓存域名服务使用，而不用把它配置为用来处理来自互联网的域名请求。安装 BIND 会让你拥有一个可以被 OpenVPN 使用的 DNS 服务器。安装 BIND 十分简单，`apt-get` 就可以直接搞定:

```
root@test:~# apt-get install bind9
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following extra packages will be installed:
  bind9utils
Suggested packages:
  bind9-doc resolvconf ufw
The following NEW packages will be installed:
  bind9 bind9utils
0 upgraded, 2 newly installed, 0 to remove and 0 not upgraded.
Need to get 490 kB of archives.
After this operation, 1,128 kB of additional disk space will be used.
Do you want to continue [Y/n]? y
```

在我们把 BIND 作为缓存域名服务器之前，还有一些小细节需要配置。两个修改都在`/etc/bind/named.conf.options`里完成。首先你要取消注释掉 forwarders 这一节内容，同时你还要增加一个可以转发域名请求的目标服务器。作为例子我会用 Google 的 DNS 服务器（8.8.8.8）（LCTT 译注：国内的话需要找一个替代品）；文件的 forwarders 节看上去大致是这样的：


```
forwarders {
    8.8.8.8;
};
```

第二点你需要做的更改是允许来自内网和本机的查询请求，直接把这一行加入配置文件的后面，记得放在最后一个`};`之前就可以了：


```
allow-query { 192.168.1.0/24; 127.0.0.0/16; };
```

上面那行配置会允许此 DNS 服务器接收来自其所在的网络（在本例中，我的网络就在我的防火墙之后）和本机的请求。下一步，你需要重启一下 BIND 的服务：

```
root@test:~# /etc/init.d/bind9 restart
[....] Stopping domain name service...: bind9waiting for pid 13209 to die
. ok
[ ok ] Starting domain name service...: bind9.
```

现在你可以测试一下 `nslookup` 来确保你的服务正常运行了：


```
root@test:~# nslookup
> server localhost
Default server: localhost
Address: 127.0.0.1#53
> www.google.com
Server:		localhost
Address:	127.0.0.1#53

Non-authoritative answer:
Name:	www.google.com
Address: 173.194.33.176
Name:	www.google.com
Address: 173.194.33.177
Name:	www.google.com
Address: 173.194.33.178
Name:	www.google.com
Address: 173.194.33.179
Name:	www.google.com
Address: 173.194.33.180
```

完美！现在你的系统里已经有一个正常的域名服务在工作了，下一步我们来配置一下OpenVPN。


### 安装并配置 OpenVPN

OpenVPN 是一个运用 SSL/TLS 作为密钥交换的开源 VPN 解决方案。同时它也非常便于在 Linux 环境下部署。配置 OpenVPN 可能有一点点难，不过其实你也不需要在默认的配置文件里做太多修改。首先你需要运行一下 `apt-get` 来安装 OpenVPN：


```
root@test:~# apt-get install openvpn
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following extra packages will be installed:
  liblzo2-2 libpkcs11-helper1
Suggested packages:
  resolvconf
The following NEW packages will be installed:
  liblzo2-2 libpkcs11-helper1 openvpn
0 upgraded, 3 newly installed, 0 to remove and 0 not upgraded.
Need to get 621 kB of archives.
After this operation, 1,489 kB of additional disk space will be used.
Do you want to continue [Y/n]? y
```

现在 OpenVPN 已经安装好了，你需要去配置它了。OpenVPN 是基于 SSL 的，并且它同时依赖于服务端和客户端两方的证书来工作。为了生成这些证书，你需要在机器上配置一个证书签发（CA）。幸运地，OpenVPN 在安装中自带了一些用于生成证书的脚本比如 “easy-rsa” 来帮助你加快这个过程。你将要创建一个文件目录用于放置 easy-rsa 脚本，从模板目录复制过来：


```
root@test:~# mkdir /etc/openvpn/easy-rsa
root@test:~# cp -rpv /usr/share/doc/openvpn/examples/easy-rsa/2.0/* /etc/openvpn/easy-rsa/
 ```

下一步，把 vars 文件复制一个备份：


```
root@test:/etc/openvpn/easy-rsa# cp vars vars.bak
```

接下来，编辑一下 vars 以让其中的信息符合你的状态。我将以我需要编辑的信息作为例子：

```
KEY_SIZE=4096
KEY_COUNTRY="US"
KEY_PROVINCE="CA"
KEY_CITY="Silicon Valley"
KEY_ORG="Linux Journal"
KEY_EMAIL="bill.childers@linuxjournal.com"
```

下一步是导入（source）一下 vars 中的环境变量，这样系统就能把其中的信息当作环境变量处理了：


```
root@test:/etc/openvpn/easy-rsa# source ./vars
NOTE: If you run ./clean-all, I will be doing a rm -rf on /etc/openvpn/easy-rsa/keys
 ```

### 搭建 CA（证书签发）

接下来你要运行一下 `clean-all` 来确保有一个清理干净的系统工作环境，紧接着你就要做证书签发了。注意一下我修改了一些 changeme 的所提示修改的内容以符合我需要的安装情况：


```
root@test:/etc/openvpn/easy-rsa# ./clean-all
root@test:/etc/openvpn/easy-rsa# ./build-ca
Generating a 4096 bit RSA private key
...................................................++
...................................................++
writing new private key to 'ca.key'
-----
You are about to be asked to enter information that
will be incorporated into your certificate request.
What you are about to enter is what is called a
Distinguished Name or a DN.
There are quite a few fields but you can leave some
blank. For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [US]:
State or Province Name (full name) [CA]:
Locality Name (eg, city) [Silicon Valley]:
Organization Name (eg, company) [Linux Journal]:
Organizational Unit Name (eg, section) [changeme]:SecTeam
Common Name (eg, your name or your server's hostname) [changeme]:test.linuxjournal.com
Name [changeme]:test.linuxjournal.com
Email Address [bill.childers@linuxjournal.com]:
```


### 生成服务端证书

一旦 CA 创建好了，你接着就可以生成客户端的 OpenVPN 证书了：


```
root@test:/etc/openvpn/easy-rsa# ./build-key-server test.linuxjournal.com
Generating a 4096 bit RSA private key
...................................................++
writing new private key to 'test.linuxjournal.com.key'
-----
You are about to be asked to enter information that
will be incorporated into your certificate request.
What you are about to enter is what is called a
Distinguished Name or a DN.
There are quite a few fields but you can leave some
blank. For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [US]:
State or Province Name (full name) [CA]:
Locality Name (eg, city) [Silicon Valley]:
Organization Name (eg, company) [Linux Journal]:
Organizational Unit Name (eg, section) [changeme]:SecTeam
Common Name (eg, your name or your server's hostname) [test.linuxjournal.com]:
Name [changeme]:test.linuxjournal.com
Email Address [bill.childers@linuxjournal.com]:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
Using configuration from /etc/openvpn/easy-rsa/openssl-1.0.0.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'US'
stateOrProvinceName   :PRINTABLE:'CA'
localityName          :PRINTABLE:'Silicon Valley'
organizationName      :PRINTABLE:'Linux Journal'
organizationalUnitName:PRINTABLE:'SecTeam'
commonName            :PRINTABLE:'test.linuxjournal.com'
name                  :PRINTABLE:'test.linuxjournal.com'
emailAddress           :IA5STRING:'bill.childers@linuxjournal.com'
Certificate is to be certified until Sep  1 06:23:59 2025 GMT (3650 days)
Sign the certificate? [y/n]:y

1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
```

下一步需要用掉一些时间来生成 OpenVPN 服务器需要的 Diffie-Hellman 密钥。这个步骤在一般的桌面级 CPU 上会需要几分钟的时间，但在 ARM 构架的树莓派上，会用掉超级超级长的时间。耐心点，只要终端上的点还在跳，那么一切就在按部就班运行（下面的示例省略了不少的点）：


```
root@test:/etc/openvpn/easy-rsa# ./build-dh
Generating DH parameters, 4096 bit long safe prime, generator 2
This is going to take a long time
....................................................+
<snipped out many more dots>
```

### 生成客户端证书

现在你要生成一下客户端用于登录 OpenVPN 的密钥。通常来说 OpenVPN 都会被配置成使用证书验证的加密方式，在这个配置下客户端需要持有由服务端签发的一份证书：

```
root@test:/etc/openvpn/easy-rsa# ./build-key bills-computer
Generating a 4096 bit RSA private key
...................................................++
...................................................++
writing new private key to 'bills-computer.key'
-----
You are about to be asked to enter information that
will be incorporated into your certificate request.
What you are about to enter is what is called a
Distinguished Name or a DN. There are quite a few
fields but you can leave some blank.
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [US]:
State or Province Name (full name) [CA]:
Locality Name (eg, city) [Silicon Valley]:
Organization Name (eg, company) [Linux Journal]:
Organizational Unit Name (eg, section) [changeme]:SecTeam
Common Name (eg, your name or your server's hostname) [bills-computer]:
Name [changeme]:bills-computer
Email Address [bill.childers@linuxjournal.com]:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
Using configuration from /etc/openvpn/easy-rsa/openssl-1.0.0.cnf
Check that the request matches the signature
Signature ok
The Subject's Distinguished Name is as follows
countryName           :PRINTABLE:'US'
stateOrProvinceName   :PRINTABLE:'CA'
localityName          :PRINTABLE:'Silicon Valley'
organizationName      :PRINTABLE:'Linux Journal'
organizationalUnitName:PRINTABLE:'SecTeam'
commonName            :PRINTABLE:'bills-computer'
name                  :PRINTABLE:'bills-computer'
emailAddress           :IA5STRING:'bill.childers@linuxjournal.com'
Certificate is to be certified until Sep  1 07:35:07 2025 GMT (3650 days)
Sign the certificate? [y/n]:y

1 out of 1 certificate requests certified, commit? [y/n]y
Write out database with 1 new entries
Data Base Updated
root@test:/etc/openvpn/easy-rsa#
```

现在你需要再生成一个 HMAC 码作为共享密钥来进一步增加整个加密提供的安全性：


```
root@test:~# openvpn --genkey --secret /etc/openvpn/easy-rsa/keys/ta.key
```

### 配置服务器

最后，我们到了配置 OpenVPN 服务的时候了。你需要创建一个 `/etc/openvpn/server.conf` 文件；这个配置文件的大多数地方都可以套用模板解决。设置 OpenVPN 服务的主要修改在于让它只用 TCP 而不是 UDP 链接。这是下一步所必需的---如果不是 TCP 连接那么你的服务将不能工作在端口 443 上。创建 `/etc/openvpn/server.conf` 然后把下述配置丢进去：


```
port 1194
proto tcp
dev tun
ca easy-rsa/keys/ca.crt
cert easy-rsa/keys/test.linuxjournal.com.crt ## or whatever your hostname was
key easy-rsa/keys/test.linuxjournal.com.key  ## Hostname key - This file should be kept secret
management localhost 7505
dh easy-rsa/keys/dh4096.pem
tls-auth /etc/openvpn/certs/ta.key 0
server 10.8.0.0 255.255.255.0 # The server will use this subnet for clients connecting to it
ifconfig-pool-persist ipp.txt
push "redirect-gateway def1 bypass-dhcp" # Forces clients to redirect all traffic through the VPN
push "dhcp-option DNS 192.168.1.1" # Tells the client to use the DNS server at 192.168.1.1 for DNS - replace with the IP address of the OpenVPN machine and clients will use the BIND server setup earlier
keepalive 30 240
comp-lzo # Enable compression
persist-key
persist-tun
status openvpn-status.log
verb 3
```

最后，你将需要在服务器上启用 IP 转发，配置 OpenVPN 为开机启动，并立刻启动 OpenVPN 服务：


```
root@test:/etc/openvpn/easy-rsa/keys# echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.conf
root@test:/etc/openvpn/easy-rsa/keys# sysctl -p /etc/sysctl.conf
net.core.wmem_max = 12582912
net.core.rmem_max = 12582912
net.ipv4.tcp_rmem = 10240 87380 12582912
net.ipv4.tcp_wmem = 10240 87380 12582912
net.core.wmem_max = 12582912
net.core.rmem_max = 12582912
net.ipv4.tcp_rmem = 10240 87380 12582912
net.ipv4.tcp_wmem = 10240 87380 12582912
net.core.wmem_max = 12582912
net.core.rmem_max = 12582912
net.ipv4.tcp_rmem = 10240 87380 12582912
net.ipv4.tcp_wmem = 10240 87380 12582912
net.ipv4.ip_forward = 0
net.ipv4.ip_forward = 1

root@test:/etc/openvpn/easy-rsa/keys# update-rc.d openvpn defaults
update-rc.d: using dependency based boot sequencing

root@test:/etc/openvpn/easy-rsa/keys# /etc/init.d/openvpn start
[ ok ] Starting virtual private network daemon:.
```

### 配置 OpenVPN 客户端

客户端的安装取决于客户端的操作系统，但你需要将之前生成的证书和密钥复制到你的客户端上，并导入你的 OpenVPN 客户端并新建一个配置文件。每种操作系统下的 OpenVPN 客户端在操作上会有些稍许不同，这也不在这篇文章的覆盖范围内，所以你最好去看看特定操作系统下的 OpenVPN 文档来获取更多信息。请参考本文档里的资源那一节。

### 安装 SSLH —— "魔法"多协议切换工具

本文章介绍的解决方案最有趣的部分就是运用 SSLH 了。SSLH 是一个多重协议工具——它可以监听 443 端口的流量，然后分析他们是 SSH，HTTPS 还是 OpenVPN 的通讯包，并把它们分别转发给正确的系统服务。这就是为何本解决方案可以让你绕过大多数端口封杀——你可以一直使用 HTTPS 通讯，因为它几乎从来不会被封杀。

同样，直接 `apt-get` 安装：


```
root@test:/etc/openvpn/easy-rsa/keys# apt-get install sslh
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following extra packages will be installed:
  apache2 apache2-mpm-worker apache2-utils apache2.2-bin apache2.2-common
  libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libconfig9
Suggested packages:
  apache2-doc apache2-suexec apache2-suexec-custom openbsd-inetd inet-superserver
The following NEW packages will be installed:
  apache2 apache2-mpm-worker apache2-utils apache2.2-bin apache2.2-common
  libapr1 libaprutil1 libaprutil1-dbd-sqlite3 libaprutil1-ldap libconfig9 sslh
0 upgraded, 11 newly installed, 0 to remove and 0 not upgraded.
Need to get 1,568 kB of archives.
After this operation, 5,822 kB of additional disk space will be used.
Do you want to continue [Y/n]? y
```

在 SSLH 被安装之后，包管理器会询问要在 inetd 还是 standalone 模式下允许。选择 standalone 模式，因为你希望 SSLH 在它自己的进程里运行。如果你没有安装 Apache，apt 包管理器会自动帮你下载并安装的，尽管它也不是完全不可或缺。如果你已经有 Apache 了，那你需要确保它只监听 localhost 端口而不是所有的端口（不然的话 SSLH 会无法运行，因为 443 端口已经被 Apache 监听占用）。安装后，你会看到一个如下所示的错误信息：

```
[....] Starting ssl/ssh multiplexer: sslhsslh disabled, please adjust the configuration to your needs
[FAIL] and then set RUN to 'yes' in /etc/default/sslh to enable it. ... failed!
failed!
```

这其实并不是错误信息，只是 SSLH 在提醒你它还未被配置所以无法启动，这很正常。配置 SSLH 相对来说比较简单。它的配置文件放置在 `/etc/default/sslh`，你只需要修改 `RUN` 和 `DAEMON_OPTS` 变量就可以了。我的 SSLH 配置文件如下所示：

```
# Default options for sslh initscript
# sourced by /etc/init.d/sslh

# Disabled by default, to force yourself
# to read the configuration:
# - /usr/share/doc/sslh/README.Debian (quick start)
# - /usr/share/doc/sslh/README, at "Configuration" section
# - sslh(8) via "man sslh" for more configuration details.
# Once configuration ready, you *must* set RUN to yes here
# and try to start sslh (standalone mode only)

RUN=yes

# binary to use: forked (sslh) or single-thread (sslh-select) version
DAEMON=/usr/sbin/sslh

DAEMON_OPTS="--user sslh --listen 0.0.0.0:443 --ssh 127.0.0.1:22 --ssl 127.0.0.1:443 --openvpn 127.0.0.1:1194 --pidfile /var/run/sslh/sslh.pid"
 ```

保存编辑并启动 SSLH：

```
 root@test:/etc/openvpn/easy-rsa/keys# /etc/init.d/sslh start
[ ok ] Starting ssl/ssh multiplexer: sslh.
```

现在你应该可以从 443 端口 ssh 到你的树莓派了，它会正确地使用 SSLH 转发：

```
$ ssh -p 443 root@test.linuxjournal.com
root@test:~#
```

SSLH 现在开始监听端口 443 并且可以转发流量信息到 SSH、Apache 或者 OpenVPN ，这取决于抵达流量包的类型。这套系统现已整装待发了！

### 结论

现在你可以启动 OpenVPN 并且配置你的客户端连接到服务器的 443 端口了，然后 SSLH 会从那里把流量转发到服务器的 1194 端口。但鉴于你正在和服务器的 443 端口通信，你的 VPN 流量不会被封锁。现在你可以舒服地坐在陌生小镇的咖啡店里，畅通无阻地通过你的树莓派上的 OpenVPN 浏览互联网。你顺便还给你的链接增加了一些安全性，这个额外作用也会让你的链接更安全和私密一些。享受通过安全跳板浏览互联网把！


### 参考资源

- 安装与配置 OpenVPN: [https://wiki.debian.org/OpenVPN](https://wiki.debian.org/OpenVPN) 和 [http://cryptotap.com/articles/openvpn](http://cryptotap.com/articles/openvpn)
- OpenVPN 客户端下载: [https://openvpn.net/index.php/open-source/downloads.html](https://openvpn.net/index.php/open-source/downloads.html)
- OpenVPN iOS 客户端: [https://itunes.apple.com/us/app/openvpn-connect/id590379981?mt=8](https://itunes.apple.com/us/app/openvpn-connect/id590379981?mt=8)
- OpenVPN Android 客户端: [https://play.google.com/store/apps/details?id=net.openvpn.openvpn&hl=en](https://play.google.com/store/apps/details?id=net.openvpn.openvpn&hl=en)
- Tunnelblick for Mac OS X (OpenVPN 客户端): [https://tunnelblick.net](https://tunnelblick.net)
- SSLH 介绍: [http://www.rutschle.net/tech/sslh.shtml](http://www.rutschle.net/tech/sslh.shtml) 和 [https://github.com/yrutschle/sslh](https://github.com/yrutschle/sslh)


----------
via: http://www.linuxjournal.com/content/securi-pi-using-raspberry-pi-secure-landing-point?page=0,0

作者：[Bill Childers][a]
译者：[Moelf](https://github.com/Moelf)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/bill-childers
