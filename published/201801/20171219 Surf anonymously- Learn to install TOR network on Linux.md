匿名上网：学习在 Linux 上安装 TOR 网络
======

Tor 网络是一个用来保护你的互联网以及隐私的匿名网络。Tor 网络是一组志愿者运营的服务器。Tor 通过在由志愿者运营的分布式中继系统之间跳转来保护互联网通信。这避免了人们窥探我们的网络，他们无法了解我们访问的网站或者用户身在何处，并且也可以让我们访问被屏蔽的网站。

在本教程中，我们将学习在各种 Linux 操作系统上安装 Tor 网络，以及如何使用它来配置我们的程序来保护通信。

 推荐阅读：[如何在 Linux 上安装 Tor 浏览器（Ubuntu、Mint、RHEL、Fedora、CentOS）][1]

### CentOS/RHEL/Fedora

Tor 包是 EPEL 仓库的一部分，所以如果我们安装了 EPEL 仓库，我们可以直接使用 `yum` 来安装 Tor。如果你需要在您的系统上安装 EPEL 仓库，请使用下列适当的命令（基于操作系统和体系结构）：

RHEL/CentOS 7：

```
$ sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-11.noarch.rpm
```

RHEL/CentOS 6 (64 位)：

```
$ sudo rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
```

RHEL/CentOS 6 (32 位)：

```
$ sudo rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
```

安装完成后，我们可以用下面的命令安装 Tor 浏览器：

```
$ sudo yum install tor
```

### Ubuntu

为了在 Ubuntu 机器上安装 Tor 网络，我们需要添加官方 Tor 仓库。我们需要将仓库信息添加到 `/etc/apt/sources.list` 中。

```
$ sudo nano /etc/apt/sources.list
```

现在根据你的操作系统添加下面的仓库信息：

Ubuntu 16.04：

```
deb http://deb.torproject.org/torproject.org xenial main
deb-src http://deb.torproject.org/torproject.org xenial main
```

Ubuntu 14.04

```
deb http://deb.torproject.org/torproject.org trusty main
deb-src http://deb.torproject.org/torproject.org trusty main
```

接下来打开终端并执行以下两个命令添加用于签名软件包的 gpg 密钥：

```
$ gpg -keyserver keys.gnupg.net -recv A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89
$ gpg -export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
```

现在运行更新并安装 Tor 网络：

```
$ sudo apt-get update
$ sudo apt-get install tor deb.torproject.org-keyring
```

### Debian

我们可以无需添加任何仓库在 Debian 上安装 Tor 网络。只要打开终端并以 root 身份执行以下命令：

```
$ apt install tor
```

### Tor 配置

如果你最终目的只是为了保护互联网浏览，而没有其他要求，直接使用 Tor 更好，但是如果你需要保护即时通信、IRC、Jabber 等程序，则需要配置这些应用程序进行安全通信。但在做之前，让我们先看看[Tor 网站上提到的警告][2]。

- 不要大流量使用 Tor
- 不要在 Tor 中使用任何浏览器插件
- 只使用 HTTPS 版本的网站
- 不要在线打开通过 Tor 下载的任何文档。
- 尽可能使用 Tor 桥

现在配置程序来使用 Tor，例如 jabber。首先选择 “SOCKS代理” 而不是使用 HTTP 代理，并使用端口号 `9050`，或者也可以使用端口 9150（Tor 浏览器使用）。

![install tor network][4]

你也可以配置 Firefox 浏览器使用 Tor 网络。打开 Firefox 浏览器，在“常规”选项卡的“首选项”中进入“网络代理”设置，并按以下步骤输入代理：

![install tor network][6]

现在你可以在 Firefox 中使用 Tor 网络完全匿名访问了。

这就是我们如何安装 Tor 网络并使用 Tor 浏览互联网的教程。请在下面的评论栏中提出你的问题和建议。

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/learn-install-tor-network-linux/

作者：[Shusain][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/install-tor-browser-linux-ubuntu-centos/
[2]:https://www.torproject.org/download/download.html.en#warning
[4]:https://i0.wp.com/linuxtechlab.com/wp-content/uploads/2017/12/tor-1-compressor.png?resize=333%2C240
[6]:https://i1.wp.com/linuxtechlab.com/wp-content/uploads/2017/12/tor-2-compressor.png?resize=730%2C640
