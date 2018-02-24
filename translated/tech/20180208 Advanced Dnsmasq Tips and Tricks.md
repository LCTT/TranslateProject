Dnsmasq 进阶技巧
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner_3.25.47_pm.png?itok=2YaDe86d)

许多人熟知和热爱 Dnsmasq，并在他们的本地域名服务上使用它。今天我们将介绍进阶配置文件管理、如何测试你的配置、一些基础的安全知识、DNS 泛域名、快速 DNS 配置，以及其他一些技巧与窍门。下个星期我们将继续详细讲解如何配置 DNS 和 DHCP。

### 测试配置

当你测试新的配置的时候，你应该从命令行运行 Dnsmasq，而不是使用守护进程。下面的例子演示了如何不用守护进程运行它，同时显示指令的输出并保留运行日志：
```
# dnsmasq --no-daemon --log-queries
dnsmasq: started, version 2.75 cachesize 150
dnsmasq: compile time options: IPv6 GNU-getopt
 DBus i18n IDN DHCP DHCPv6 no-Lua TFTP conntrack
 ipset auth DNSSEC loop-detect inotify
dnsmasq: reading /etc/resolv.conf
dnsmasq: using nameserver 192.168.0.1#53
dnsmasq: read /etc/hosts - 9 addresses

```

在这个小例子中你能看到许多有用的信息，包括版本、编译参数、系统域名服务文件、以及它的监听地址。可以使用 Ctrl+C 停止进程。在默认情况下，Dnsmasq 没有自己的日志文件，所以日志会被记录到 `/var/log` 目录下的多个地方。你可以使用经典的 `grep` 来找到 Dnsmasq 的日志文件。下面这条指令会递归式地搜索 `/var/log`、在每个匹配的文件名之后显示匹配的行数，并忽略 `/var/log/dist-upgrade` 里的内容：
```
# grep -ir --exclude-dir=dist-upgrade dnsmasq /var/log/

```

使用 `grep --exclude-dir=` 时有一个有趣的小陷阱需要注意：不要使用完整路径，而应该只写目录名称。

你可以使用如下的命令行参数来让 Dnsmasq 使用你指定的文件作为它专属的日志文件：
```
# dnsmasq --no-daemon --log-queries --log-facility=/var/log/dnsmasq.log

```

或者在你的 Dnsmasq 配置文件中加上 `log-facility=/var/log/dnsmasq.log`。

### 配置文件

Dnsmasq 的配置文件位于 `/etc/dnsmasq.conf`。你的 Linux 发行版也可能会使用 `/etc/default/dnsmasq`、`/etc/dnsmasq.d/`，或者 `/etc/dnsmasq.d-available/`（不，我们不能统一标准，因为这违反了 Linux 七嘴八舌秘密议会的旨意）。你有很多自由来随意安置你的配置文件。

`/etc/dnsmasq.conf` 是德高望重的老大。Dnsmasq 在启动时会最先读取它。`/etc/dnsmasq.conf` 可以使用 `conf-file=` 选项来调用其他的配置文件，例如 `conf-file=/etc/dnsmasqextrastuff.conf`，或使用 `conf-dir=` 选项来调用目录下的所有文件，例如 `conf-dir=/etc/dnsmasq.d`。

每当你对配置文件进行了修改，你都必须重启 Dnsmasq。

你可以根据扩展名来包含或忽略配置文件。星号表示包含，不加星号表示忽略：
```
conf-dir=/etc/dnsmasq.d/,*.conf, *.foo
conf-dir=/etc/dnsmasq.d,.old, .bak, .tmp

```

你可以用 `--addn-hosts=` 选项来把你的主机配置分布在多个文件中。

Dnsmasq 包含了一个语法检查器：
```
$ dnsmasq --test
dnsmasq: syntax check OK.

```

### 实用配置

永远加入这几行：
```
domain-needed
bogus-priv

```

它们可以避免含有格式出错的域名或私人 IP 地址的数据包离开你的网络。

让你的域名服务只使用 Dnsmasq，而不去使用 `/etc/resolv.conf` 或任何其他的域名服务文件：
```
no-resolv

```

使用其他的域名服务器。第一个例子是只对于某一个域名使用不同的域名服务器。第二个和第三个例子是 OpenDNS 公用服务器：
```
server=/fooxample.com/192.168.0.1
server=208.67.222.222
server=208.67.220.220

```

你也可以将某些域名限制为只能本地解析，但不影响其他域名。这些被限制的域名只能从 `/etc/hosts` 或 DHCP 解析：
```
local=/mehxample.com/
local=/fooxample.com/

```

限制 Dnsmasq 监听的网络接口：
```
interface=eth0
interface=wlan1

```

Dnsmasq 在默认设置下会读取并使用 `/etc/hosts`。这是一个又快又好的配置大量域名的方法，并且 `/etc/hosts` 只需要和 Dnsmasq 在同一台电脑上。你还可以让这个过程再快一些，可以在 `/etc/hosts` 文件中只写主机名，然后用 Dnsmasq 来添加域名。`/etc/hosts` 看上去是这样的：
```
127.0.0.1 localhost
192.168.0.1 host2
192.168.0.2 host3
192.168.0.3 host4

```

然后把这几行写入 `dnsmasq.conf`（当然，要换成你自己的域名）：
```
expand-hosts
domain=mehxample.com

```

Dnsmasq 会自动把这些主机名扩展为完整的域名，比如 host2 会变为 host2.mehxample.com。

### DNS 泛域名

一般来说，使用 DNS 泛域名不是一个好习惯，因为它们太容易被误用了。但它们有时会很有用，比如在你的局域网的严密保护之下的时候。一个例子是使用 DNS 泛域名会让 Kubernetes 集群变得容易管理许多，除非你喜欢给你成百上千的应用写 DNS 记录。假设你的 Kubernetes 域名是 mehxample.com，那么下面这行配置可以让 Dnsmasq 解析所有对 mehxample.com 的请求：
```
address=/mehxample.com/192.168.0.5

```

这里使用的地址是你的集群的公网 IP 地址。这会响应对 mehxample.com 的所有主机名和子域名的请求，除非请求的目标地址已经在 DHCP 或者 `/etc/hosts` 中配置过。

下星期我们将探索更多的管理 DNS 和 DHCP 的细节，包括对不同的子网络使用不同的设置，以及提供权威域名服务器。

### 更多参考

*   [使用 Dnsmasq 进行 DNS 欺骗][1]

*   [使用 Dnsmasq 配置简单的局域网域名服务][2]

*   [Dnsmasq][3]



--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/2/advanced-dnsmasq-tips-and-tricks

作者：[CARLA SCHRODER][a]
译者：[yixunx](https://github.com/yixunx)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/learn/intro-to-linux/2017/7/dns-spoofing-dnsmasq
[2]:https://www.linux.com/learn/dnsmasq-easy-lan-name-services
[3]:http://www.thekelleys.org.uk/dnsmasq/doc.html
