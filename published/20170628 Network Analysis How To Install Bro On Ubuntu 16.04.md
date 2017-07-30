网络分析利器：在 Ubuntu 16.04 上安装 Bro
============================================================


 [![Bro Network Analysis Logo](https://www.unixmen.com/wp-content/uploads/2017/07/brologo-696x696.jpg "brologo")][4]

### 简介：Bro 网络分析框架

Bro 是一个开源的网络分析框架，侧重于网络安全监控。这是一项长达 15 年的研究成果，被各大学、研究实验室、超级计算机中心和许多开放科学界广泛使用。它主要由伯克利国际计算机科学研究所和伊利诺伊大学厄巴纳-香槟分校的国家超级计算机应用中心开发。

Bro 的功能包括：

*   Bro 的脚本语言支持针对站点定制监控策略
*   针对高性能网络
*   分析器支持许多协议，可以在应用层面实现高级语义分析
*   它保留了其所监控的网络的丰富的应用层统计信息
*   Bro 能够与其他应用程序接口实时地交换信息
*   它的日志全面地记录了一切信息，并提供网络活动的高级存档

本教程将介绍如何从源代码构建，并在 Ubuntu 16.04 服务器上安装 Bro。

### 准备工作

Bro 有许多依赖文件:

*   Libpcap ([http://www.tcpdump.org][2])
*   OpenSSL 库 ([http://www.openssl.org][3])
*   BIND8 库
*   Libz
*   Bash (BroControl 所需要)
*   Python 2.6+ (BroControl 所需要)

从源代码构建还需要：

*   CMake 2.8+
*   Make
*   GCC 4.8+ or Clang 3.3+
*   SWIG
*   GNU Bison
*   Flex
*   Libpcap headers
*   OpenSSL headers
*   zlib headers

### 起步

首先，通过执行以下命令来安装所有必需的依赖项：

```
# apt-get install cmake make gcc g++ flex bison libpcap-dev libssl-dev python-dev swig zlib1g-dev
```

#### 安装定位 IP 地理位置的 GeoIP 数据库

Bro 使用 GeoIP 的定位地理位置。安装 IPv4 和 IPv6 版本：

```
$ wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
$wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz
```

解压这两个压缩包：

```
$ gzip -d GeoLiteCity.dat.gz
$ gzip -d GeoLiteCityv6.dat.gz
```

将解压后的文件移动到 `/usr/share/GeoIP` 目录下：

```
# mvGeoLiteCity.dat /usr/share/GeoIP/GeoIPCity.dat
# mv GeoLiteCityv6.dat /usr/share/GeoIP/GeoIPCityv6.dat
```

现在，可以从源代码构建 Bro 了。

### 构建 Bro

最新的 Bro 开发版本可以通过 `git` 仓库获得。执行以下命令：

```
$ git clone --recursive git://git.bro.org/bro
```

转到克隆下来的目录，然后使用以下命令就可以简单地构建 Bro：

```
$ cd bro
$ ./configure
$ make
```

`make` 命令需要一些时间来构建一切。确切的时间取决于服务器的性能。

可以使用一些参数来执行 `configure` 脚本，以指定要构建的依赖关系，特别是 `--with-*` 选项。

### 安装 Bro

在克隆的 `bro` 目录中执行：

```
# make install
```

默认安装路径为 `/usr/local/bro`。

### 配置 Bro

Bro 的配置文件位于 `/usr/local/bro/etc` 目录下。 这里有三个文件:

*   `node.cfg`，用于配置要监视的单个节点（或多个节点）。
*   `broctl.cfg`，BroControl 的配置文件。
*   `networks.cgf`，包含一个使用 CIDR 标记法表示的网络列表。

#### 配置邮件设置

打开 `broctl.cfg` 配置文件:

```
# $EDITOR /usr/local/bro/etc/broctl.cfg
```

查看 `Mail Options` 选项，并编辑 `MailTo` 行如下:

```
# Recipient address for emails sent out by Bro and BroControl
MailTo = admin@example.com
```

保存并关闭。还有许多其他选项，但在大多数情况下，默认值就足够好了。

#### 选择要监视的节点

开箱即用，Bro 被配置为以独立模式运行。在本教程中，我们就是做一个独立的安装，所以没有必要改变。但是，也请查看 `node.cfg` 配置文件：

```
# $EDITOR /usr/local/bro/etc/node.cfg
```

在 `[bro]` 部分，你应该看到这样的东西：

```
[bro]
type=standalone
host=localhost
interface=eth0
```

请确保 `inferface` 与 Ubuntu 16.04 服务器的公网接口相匹配。

保存并退出。

#### 配置监视节点的网络

最后一个要编辑的文件是 `network.cfg`。使用文本编辑器打开它：

```
# $EDITOR /usr/local/bro/etc/networks.cfg
```

默认情况下，你应该看到以下内容：

```
# List of local networks in CIDR notation, optionally followed by a
# descriptive tag.
# For example, "10.0.0.0/8" or "fe80::/64" are valid prefixes.

10.0.0.0/8          Private IP space
172.16.0.0/12       Private IP space
192.168.0.0/16      Private IP space
```

删除这三个条目（这只是如何使用此文件的示例），并输入服务器的公用和专用 IP 空间，格式如下：

```
X.X.X.X/X        Public IP space
X.X.X.X/X        Private IP space
```

保存并退出。

### 使用 BroControl 管理 Bro 的安装

管理 Bro 需要使用 BroControl，它支持交互式 shell 和命令行工具两种形式。启动该 shell：

```
# /usr/local/bro/bin/broctl
```

要想使用命令行工具，只需将参数传递给上一个命令，例如：

```
# /usr/local/bro/bin/broctl status
```

这将通过显示以下的输出来检查 Bro 的状态：

```
Name         Type       Host          Status    Pid    Started
bro          standalone localhost     running   6807   20 Jul 12:30:50
```

### 结论

这是一篇 Bro 的安装教程。我们使用基于源代码的安装，因为它是获得可用的最新版本的最有效的方法，但是该网络分析框架也可以下载预构建的二进制格式文件。

下次见！

--------------------------------------------------------------------------------

via: https://www.unixmen.com/how-to-install-bro-ubuntu-1604/

作者：[Giuseppe Molica][a]
译者：[firmianay](https://github.com/firmianay)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/tutan/
[1]:https://www.unixmen.com/author/tutan/
[2]:http://www.tcpdump.org/
[3]:http://www.openssl.org/
[4]:https://www.unixmen.com/wp-content/uploads/2017/07/brologo.jpg
