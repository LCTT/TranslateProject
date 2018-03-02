用 Apache 服务器模块保护您的网站免受应用层 DOS 攻击
======

有多种可以导致网站下线的攻击方法，比较复杂的方法要涉及数据库和编程方面的技术知识。一个更简单的方法被称为“<ruby>拒绝服务<rt>Denial Of Service</rt></ruby>”（DOS）攻击。这个攻击方法的名字来源于它的意图：使普通客户或网站访问者的正常服务请求被拒绝。

一般来说，有两种形式的 DOS 攻击：

1. OSI 模型的三、四层，即网络层攻击
2. OSI 模型的七层，即应用层攻击

第一种类型的 DOS 攻击——网络层，发生于当大量的垃圾流量流向网页服务器时。当垃圾流量超过网络的处理能力时，网站就会宕机。

第二种类型的 DOS 攻击是在应用层，是利用合法的服务请求，而不是垃圾流量。当页面请求数量超过网页服务器能承受的容量时，即使是合法访问者也将无法使用该网站。

本文将着眼于缓解应用层攻击，因为减轻网络层攻击需要大量的可用带宽和上游提供商的合作，这通常不是通过配置网络服务器就可以做到的。

通过配置普通的网页服务器，可以保护网页免受应用层攻击，至少是适度的防护。防止这种形式的攻击是非常重要的，因为 [Cloudflare][1] 最近 [报告称][2] 网络层攻击的数量正在减少，而应用层攻击的数量则在增加。

本文将介绍如何使用 [zdziarski][4] 开发的 Apache2 的模块 [mod_evasive][3]。

另外，mod_evasive 会阻止攻击者通过尝试数百个用户名和密码的组合来进行猜测（即暴力攻击）的企图。

mod_evasive 会记录来自每个 IP 地址的请求的数量。当这个数字超过相应 IP 地址的几个阈值之一时，会出现一个错误页面。错误页面所需的资源要比一个能够响应合法访问的在线网站少得多。

### 在 Ubuntu 16.04 上安装 mod_evasive

Ubuntu 16.04 默认的软件库中包含了 mod_evasive，名称为 “libapache2-mod-evasive”。您可以使用 `apt-get` 来完成安装：

```
apt-get update
apt-get upgrade
apt-get install libapache2-mod-evasive
```

现在我们需要配置 mod_evasive。

它的配置文件位于 `/etc/apache2/mods-available/evasive.conf`。默认情况下，所有模块的设置在安装后都会被注释掉。因此，在修改配置文件之前，模块不会干扰到网站流量。

```
<IfModule mod_evasive20.c>
   #DOSHashTableSize    3097
   #DOSPageCount        2
   #DOSSiteCount        50
   #DOSPageInterval     1
   #DOSSiteInterval     1
   #DOSBlockingPeriod   10

   #DOSEmailNotify      you@yourdomain.com
   #DOSSystemCommand    "su - someuser -c '/sbin/... %s ...'"
   #DOSLogDir           "/var/log/mod_evasive"
</IfModule>
```

第一部分的参数的含义如下：

   * `DOSHashTableSize` - 正在访问网站的 IP 地址列表及其请求数的当前列表。
   * `DOSPageCount` - 在一定的时间间隔内，每个页面的请求次数。时间间隔由 DOSPageInterval 定义。
   * `DOSPageInterval` - mod_evasive 统计页面请求次数的时间间隔。
   * `DOSSiteCount` - 与 `DOSPageCount` 相同，但统计的是来自相同 IP 地址对网站内任何页面的请求数量。
   * `DOSSiteInterval` - mod_evasive 统计网站请求次数的时间间隔。
   * `DOSBlockingPeriod` - 某个 IP 地址被加入黑名单的时长（以秒为单位）。

如果使用上面显示的默认配置，则在如下情况下，一个 IP 地址会被加入黑名单：

  * 每秒请求同一页面超过两次。
  * 每秒请求 50 个以上不同页面。

如果某个 IP 地址超过了这些阈值，则被加入黑名单 10 秒钟。

这看起来可能不算久，但是，mod_evasive 将一直监视页面请求，包括在黑名单中的 IP 地址，并重置其加入黑名单的起始时间。只要一个 IP 地址一直尝试使用 DOS 攻击该网站，它将始终在黑名单中。

其余的参数是：

   * `DOSEmailNotify` - 用于接收 DOS 攻击信息和 IP 地址黑名单的电子邮件地址。
   * `DOSSystemCommand` - 检测到 DOS 攻击时运行的命令。
   * `DOSLogDir` - 用于存放 mod_evasive 的临时文件的目录。

### 配置 mod_evasive

默认的配置是一个很好的开始，因为它不会阻塞任何合法的用户。取消配置文件中的所有参数（`DOSSystemCommand` 除外）的注释，如下所示：

```
<IfModule mod_evasive20.c>
   DOSHashTableSize   3097
   DOSPageCount       2
   DOSSiteCount       50
   DOSPageInterval    1
   DOSSiteInterval    1
   DOSBlockingPeriod  10

   DOSEmailNotify       JohnW@example.com
   #DOSSystemCommand    "su - someuser -c '/sbin/... %s ...'"
   DOSLogDir            "/var/log/mod_evasive"
</IfModule>
```

必须要创建日志目录并且要赋予其与 apache 进程相同的所有者。这里创建的目录是 `/var/log/mod_evasive` ，并且在 Ubuntu 上将该目录的所有者和组设置为 `www-data` ，与 Apache 服务器相同：

```
mkdir /var/log/mod_evasive
chown www-data:www-data /var/log/mod_evasive
```

在编辑了 Apache 的配置之后，特别是在正在运行的网站上，在重新启动或重新加载之前，最好检查一下语法，因为语法错误将影响 Apache 的启动从而使网站宕机。

Apache 包含一个辅助命令，是一个配置语法检查器。只需运行以下命令来检查您的语法：

```
apachectl configtest
```

如果您的配置是正确的，会得到如下结果：

```
Syntax OK
```

但是，如果出现问题，您会被告知在哪部分发生了什么错误，例如：

```
AH00526: Syntax error on line 6 of /etc/apache2/mods-enabled/evasive.conf:
DOSSiteInterval takes one argument, Set site interval
Action 'configtest' failed.
The Apache error log may have more information.
```

如果您的配置通过了 configtest 的测试，那么这个模块可以安全地被启用并且 Apache 可以重新加载：

```
a2enmod evasive
systemctl reload apache2.service
```

mod_evasive 现在已配置好并正在运行了。

### 测试

为了测试 mod_evasive，我们只需要向服务器提出足够的网页访问请求，以使其超出阈值，并记录来自 Apache 的响应代码。

一个正常并成功的页面请求将收到如下响应：

```
HTTP/1.1 200 OK
```

但是，被 mod_evasive 拒绝的将返回以下内容：

```
HTTP/1.1 403 Forbidden
```

以下脚本会尽可能迅速地向本地主机（127.0.0.1，localhost）的 80 端口发送 HTTP 请求，并打印出每个请求的响应代码。

你所要做的就是把下面的 bash 脚本复制到一个文件中，例如 `mod_evasive_test.sh`：

```
#!/bin/bash
set -e

for i in {1..50}; do
        curl -s -I 127.0.0.1 | head -n 1
done
```

这个脚本的部分含义如下：

   * `curl` - 这是一个发出网络请求的命令。
     * `-s` - 隐藏进度表。
     * `-I` - 仅显示响应头部信息。
   * `head` - 打印文件的第一部分。
     * `-n 1` - 只显示第一行。

然后赋予其执行权限：

```
chmod 755 mod_evasive_test.sh
```

在启用 mod_evasive **之前**，脚本运行时，将会看到 50 行 “HTTP / 1.1 200 OK” 的返回值。

但是，启用 mod_evasive 后，您将看到以下内容：

```
HTTP/1.1 200 OK
HTTP/1.1 200 OK
HTTP/1.1 403 Forbidden
HTTP/1.1 403 Forbidden
HTTP/1.1 403 Forbidden
HTTP/1.1 403 Forbidden
HTTP/1.1 403 Forbidden
...
```

前两个请求被允许，但是在同一秒内第三个请求发出时，mod_evasive 拒绝了任何进一步的请求。您还将收到一封电子邮件（邮件地址在选项 `DOSEmailNotify` 中设置），通知您有 DOS 攻击被检测到。

mod_evasive 现在已经在保护您的网站啦！

--------------------------------------------------------------------------------

via: https://bash-prompt.net/guides/mod_proxy/

作者：[Elliot Cooper][a]
译者：[jessie-pang](https://github.com/jessie-pang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://bash-prompt.net/about/
[1]:https://www.cloudflare.com
[2]:https://blog.cloudflare.com/the-new-ddos-landscape/
[3]:https://github.com/jzdziarski/mod_evasive
[4]:https://www.zdziarski.com/blog/