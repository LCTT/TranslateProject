在 Linux 上用 DNS 实现简单的负载均衡
======

> DNS 轮询将多个服务器映射到同一个主机名，并没有为这里展示的魔法做更多的工作。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/american-robin-920.jpg?itok=_B_RRbfj)

如果你的后端服务器是由多台服务器构成的，比如集群化或者镜像的 Web 或者文件服务器，通过负载均衡器提供了单一的入口点。业务繁忙的大型电商在高端负载均衡器上花费了大量的资金，用它来执行各种各样的任务：代理、缓存、状况检查、SSL 处理、可配置的优先级、流量整形等很多任务。

但是你并不需要做那么多工作的负载均衡器。你需要的是一个跨服务器分发负载的简单方法，它能够提供故障切换，并且不太在意它是否高效和完美。DNS 轮询和使用轮询的子域委派是实现这个目标的两种简单方法。

DNS 轮询是将多台服务器映射到同一个主机名上，当用户访问 `foo.example.com` 时多台服务器都可用于处理它们的请求，使用的就是这种方式。

当你有多个子域或者你的服务器在地理上比较分散时，使用轮询的子域委派就比较有用。你有一个主域名服务器，而子域有它们自己的域名服务器。你的主域名服务器将所有的到子域的请求指向到它们自己的域名服务器上。这将提升响应时间，因为 DNS 协议会自动查找最快的链路。

### DNS 轮询

轮询和<ruby>旅鸫鸟<rt>robins</rt></ruby>没有任何关系，据我相熟的图书管理员说，它最初是一个法语短语，_ruban rond_、或者 _round ribbon_。很久以前，法国政府官员以不分级的圆形、波浪线、或者直线形状来在请愿书上签字，以盖住原来的发起人。

DNS 轮询也是不分级的，简单配置一个服务器列表，然后将请求转到每个服务器上。它并不做真正的负载均衡，因为它根本就不测量负载，也没有状况检查，因此如果一个服务器宕机，请求仍然会发送到那个宕机的服务器上。它的优点就是简单。如果你有一个小的文件或者 Web 服务器集群，想通过一个简单的方法在它们之间分散负载，那么 DNS 轮询很适合你。

你所做的全部配置就是创建多条 A 或者 AAAA 记录，映射多台服务器到单个的主机名。这个 BIND 示例同时使用了 IPv4 和 IPv6 私有地址类：

```
fileserv.example.com. IN A 172.16.10.10
fileserv.example.com. IN A 172.16.10.11
fileserv.example.com. IN A 172.16.10.12

fileserv.example.com. IN AAAA fd02:faea:f561:8fa0:1::10
fileserv.example.com. IN AAAA fd02:faea:f561:8fa0:1::11
fileserv.example.com. IN AAAA fd02:faea:f561:8fa0:1::12
```

Dnsmasq 在 `/etc/hosts` 文件中保存 A 和 AAAA 记录：

```
172.16.1.10 fileserv fileserv.example.com
172.16.1.11 fileserv fileserv.example.com
172.16.1.12 fileserv fileserv.example.com
fd02:faea:f561:8fa0:1::10 fileserv fileserv.example.com
fd02:faea:f561:8fa0:1::11 fileserv fileserv.example.com
fd02:faea:f561:8fa0:1::12 fileserv fileserv.example.com
```

请注意这些示例都是很简化的，解析完全合格域名有多种方法，因此，关于如何配置 DNS 请自行学习。

使用 `dig` 命令去检查你的配置能否按预期工作。将 `ns.example.com` 替换为你的域名服务器：

```
$ dig @ns.example.com fileserv A fileserv AAA
```

它将同时显示出 IPv4 和 IPv6 的轮询记录。

### 子域委派和轮询

子域委派结合轮询要做的配置会更多，但是这样有一些好处。当你有多个子域或者地理位置比较分散的服务器时，就应该去使用它。它的响应时间更快，并且宕机的服务器不会去响应，因此客户端不会因为等待回复而被挂住。一个短的 TTL，比如 60 秒，就能帮你做到。

这种方法需要多台域名服务器。在最简化的场景中，你需要一台主域名服务器和两个子域，每个子域都有它们自己的域名服务器。在子域服务器上配置你的轮询记录，然后在你的主域名服务器上配置委派。

在主域名服务器上的 BIND 中，你至少需要两个额外的配置，一个区声明以及在区数据文件中的 A/AAAA 记录。主域名服务器中的委派应该像如下的内容：

```
ns1.sub.example.com. IN A 172.16.1.20
ns1.sub.example.com. IN AAAA fd02:faea:f561:8fa0:1::20
ns2.sub.example.com. IN A 172.16.1.21
ns2.sub.example.com. IN AAA fd02:faea:f561:8fa0:1::21

sub.example.com. IN NS ns1.sub.example.com.
sub.example.com. IN NS ns2.sub.example.com.
```

接下来的每台子域服务器上有它们自己的区文件。在这里它的关键点是每个服务器去返回它**自己的** IP 地址。在 `named.conf` 中的区声明，所有的服务上都是一样的：

```
zone "sub.example.com" {
    type master;
    file "db.sub.example.com";
};
```

然后数据文件也是相同的，除了那个 A/AAAA 记录使用的是各个服务器自己的 IP 地址。SOA 记录都指向到主域名服务器：

```
; first subdomain name server
$ORIGIN sub.example.com.
$TTL 60
sub.example.com  IN SOA ns1.example.com. admin.example.com. (
        2018123456      ; serial
        3H              ; refresh
        15              ; retry
        3600000         ; expire
)

sub.example.com. IN NS ns1.sub.example.com.
sub.example.com. IN A  172.16.1.20
ns1.sub.example.com.  IN AAAA  fd02:faea:f561:8fa0:1::20
; second subdomain name server
$ORIGIN sub.example.com.
$TTL 60
sub.example.com  IN SOA ns1.example.com. admin.example.com. (
        2018234567      ; serial
        3H              ; refresh
        15              ; retry
        3600000         ; expire
)

sub.example.com. IN NS ns1.sub.example.com.
sub.example.com. IN A  172.16.1.21
ns2.sub.example.com.  IN AAAA  fd02:faea:f561:8fa0:1::21
```

接下来生成子域服务器上的轮询记录，方法和前面一样。现在你已经有了多个域名服务器来处理到你的子域的请求。再说一次，BIND 是很复杂的，做同一件事情它有多种方法，因此，给你留的家庭作业是找出适合你使用的最佳配置方法。

在 Dnsmasq 中做子域委派很容易。在你的主域名服务器上的 `dnsmasq.conf` 文件中添加如下的行，去指向到子域的域名服务器：

```
server=/sub.example.com/172.16.1.20
server=/sub.example.com/172.16.1.21
server=/sub.example.com/fd02:faea:f561:8fa0:1::20
server=/sub.example.com/fd02:faea:f561:8fa0:1::21
```

然后在子域的域名服务器上的 `/etc/hosts` 中配置轮询。

获取配置方法的详细内容和帮助，请参考这些资源：

- [Dnsmasq][2]
- [DNS and BIND, 5th Edition][3]

通过来自 Linux 基金会和 edX 的免费课程 ["Linux 入门" ][1] 学习更多 Linux 的知识。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/3/simple-load-balancing-dns-linux

作者：[CARLA SCHRODER][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[2]:http://www.thekelleys.org.uk/dnsmasq/doc.html
[3]:http://shop.oreilly.com/product/9780596100575.do