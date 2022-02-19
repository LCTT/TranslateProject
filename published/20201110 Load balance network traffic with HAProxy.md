[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14247-1.html)
[#]: subject: (Load balance network traffic with HAProxy)
[#]: via: (https://opensource.com/article/20/11/load-balancing-haproxy)
[#]: author: (Jim O'Connell https://opensource.com/users/jimoconnell)

用 HAProxy 实现网络流量的负载平衡
======

> 安装、配置和运行 HAProxy，在几个网络或应用服务器之间分配网络流量。

![](https://img.linux.net.cn/data/attachment/album/202202/06/114005n44h5xx934549133.jpg)

不是只有在一个大型公司工作才需要使用负载平衡器。你可能是一个业余爱好者，用几台树莓派电脑自我托管一个网站。也许你是一个小企业的服务器管理员；也许你确实在一家大公司工作。无论你的情况如何，你都可以使用 [HAProxy][2] 负载平衡器来管理你的流量。

HAProxy 被称为“世界上最快和使用最广泛的软件负载平衡器”。它包含了许多可以使你的应用程序更加安全可靠的功能，包括内置的速率限制、异常检测、连接排队、健康检查以及详细的日志和指标。学习本教程中所涉及的基本技能和概念，将有助于你使用 HAProxy 建立一个更强大的、远为强大的基础设施。

### 为什么需要一个负载平衡器？

负载平衡器是一种在几个网络或应用服务器之间轻松分配连接的方法。事实上，HAProxy 可以平衡任何类型的传输控制协议（[TCP][3]）流量，包括 RDP、FTP、WebSockets 或数据库连接。分散负载的能力意味着你不需要因为你的网站流量比谷歌大就购买一个拥有几十万 G 内存的大型网络服务器。

负载平衡器还为你提供了灵活性。也许你现有的网络服务器不够强大，无法满足一年中繁忙时期的峰值需求，你想增加一个，但只是暂时的。也许你想增加一些冗余，以防一个服务器出现故障。有了 HAProxy，你可以在需要时向后端池添加更多的服务器，在不需要时删除它们。

你还可以根据情况将请求路由到不同的服务器。例如，你可能想用几个缓存服务器（如 [Varnish][4]）来处理你的静态内容，但把任何需要动态内容的东西，如 API 端点，路由到一个更强大的机器。

在这篇文章中，我将通过设置一个非常基本的 HAProxy 环境，使用 HTTPS 来监听安全端口 443，并利用几个后端 Web 服务器。它甚至会将所有进入预定义 URL（如 `/api/`）的流量发送到不同的服务器或服务器池。

### 安装 HAProxy

要开始安装，请启动一个新的 CentOS 8 服务器或实例，并使系统达到最新状态：

```
$ sudo yum update -y
```

这通常会持续一段时间。在等待的时候给自己拿杯咖啡。

这个安装有两部分：第一部分是安装 yum 版本的 HAProxy，第二部分是编译和安装你的二进制文件，用最新的版本覆盖以前的 HAProxy。用 yum 安装，在生成 systemd 启动脚本等方面做了很多繁重的工作，所以运行 `yum install`，然后从源代码编译，用最新的版本覆盖 HAProxy 二进制：

```
$ sudo yum install -y haproxy
```

启用 HAProxy 服务：

```
$ sudo systemctl enable haproxy
```

要升级到最新版本（[版本 2.2][5]，截至本文写作为止），请编译源代码。许多人认为从源代码编译和安装一个程序需要很高的技术能力，但这是一个相当简单的过程。首先，使用 `yum` 安装一些提供编译代码工具的软件包：

```
$ sudo yum install dnf-plugins-core
$ sudo yum config-manager --set-enabled PowerTools
$ sudo yum install -y git ca-certificates gcc glibc-devel \
    lua-devel pcre-devel openssl-devel systemd-devel \
    make curl zlib-devel 
```

使用 `git` 获得最新的源代码，并改变到 `haproxy` 目录：

```
$ git clone http://git.haproxy.org/git/ haproxy
$ cd haproxy
```

运行以下三个命令来构建和安装具有集成了 Prometheus 支持的 HAProxy：

```
$ make TARGET=linux-glibc USE_LUA=1 USE_OPENSSL=1 USE_PCRE=1 \
    PCREDIR= USE_ZLIB=1 USE_SYSTEMD=1 \
    EXTRA_OBJS="contrib/prometheus-exporter/service-prometheus.o"

$ sudo make PREFIX=/usr install # 安装到 /usr/sbin/haproxy
```

通过查询版本来测试它：

```
$ haproxy -v
```

你应该看到以下输出：

```
HA-Proxy version 2.2.4-b16390-23 2020/10/09 - https://haproxy.org/
```

### 创建后端服务器

HAProxy 并不直接提供任何流量，这是后端服务器的工作，它们通常是网络或应用服务器。在这个练习中，我使用一个叫做 [Ncat][6] 的工具，它是网络领域的“瑞士军刀”，用来创建一些极其简单的服务器。安装它：

```
$ sudo yum install nc -y
```

如果你的系统启用了 [SELinux][7]，你需要启用端口 8404，这是用于访问 HAProxy 统计页面的端口（下面有解释），以及你的后端服务器的端口：

```
$ sudo dnf install policycoreutils-python-utils
$ sudo semanage port -a -t http_port_t  -p tcp 8404
$ sudo semanage port -a -t http_port_t  -p tcp 10080
$ sudo semanage port -a -t http_port_t  -p tcp 10081
$ sudo semanage port -a -t http_port_t  -p tcp 10082
```

创建两个 Ncat 网络服务器和一个 API 服务器：

```
$ while true ;
do
nc -l -p 10080 -c 'echo -e "HTTP/1.1 200 OK\n\n This is Server ONE"' ;
done &

$ while true ;
do
nc -l -p 10081 -c 'echo -e "HTTP/1.1 200 OK\n\n This is Server TWO"' ;
done &

$ while true ;
do
nc -l -p 10082 -c 'echo -e "HTTP/1.1 200 OK\nContent-Type: application/json\n\n { \"Message\" :\"Hello, World!\" }"' ;
done &
```

这些简单的服务器打印出一条信息（如“This is Server ONE”），并运行到服务器停止为止。在现实环境中，你会使用实际的网络和应用程序服务器。

### 修改 HAProxy 的配置文件

HAProxy 的配置文件是 `/etc/haproxy/haproxy.cfg`。你在这里进行修改以定义你的负载平衡器。这个 [基本配置][8] 将让你从一个工作的服务器开始：

```
global
    log         127.0.0.1 local2
    user        haproxy
    group       haproxy

defaults 
    mode                    http
    log                     global
    option                  httplog

frontend main
    bind *:80
        
    default_backend web
    use_backend api if { path_beg -i /api/ }
    
    #-------------------------
    # SSL termination - HAProxy handles the encryption.
    #    To use it, put your PEM file in /etc/haproxy/certs  
    #    then edit and uncomment the bind line (75)
    #-------------------------
    # bind *:443 ssl crt /etc/haproxy/certs/haproxy.pem ssl-min-ver TLSv1.2
    # redirect scheme https if !{ ssl_fc }

#-----------------------------
# Enable stats at http://test.local:8404/stats
#-----------------------------

frontend stats
    bind *:8404
    stats enable
    stats uri /stats
#-----------------------------
# round robin balancing between the various backends
#-----------------------------

backend web
    server web1 127.0.0.1:10080 check
    server web2 127.0.0.1:10081 check

#-----------------------------

# API backend for serving up API content
#-----------------------------
backend api
    server api1 127.0.0.1:10082 check
```

### 重启并重新加载 HAProxy

HAProxy 可能还没有运行，所以发出命令 `sudo systemctl restart haproxy` 来启动（或重新启动）它。“重启” 的方法在非生产情况下是很好的，但是一旦你开始运行，你要养成使用 `sudo systemctl reload haproxy` 的习惯，以避免服务中断，即使你的配置中出现了错误。

例如，当你对 `/etc/haproxy/haproxy.cfg` 进行修改后，你需要用 `sudo systemctl reload haproxy` 来重新加载守护进程，使修改生效。如果有错误，它会让你知道，但继续用以前的配置运行。用 `sudo systemctl status haproxy` 检查 HAProxy 的状态。

如果它没有报告任何错误，你就有一个正在运行的服务器。在服务器上用 `curl` 测试，在命令行输入 `curl http://localhost/`。如果你看到 “This is Server ONE”，那就说明一切都成功了！运行 `curl` 几次，看着它在你的后端池中循环，然后看看当你输入 `curl http://localhost/api/` 时会发生什么。在 URL 的末尾添加 `/api/` 将把所有的流量发送到你池子里的第三个服务器。至此，你就有了一个正常运作的负载平衡器

### 检查你的统计资料

你可能已经注意到，配置中定义了一个叫做 `stats` 的前端，它的监听端口是 8404：

```
frontend stats
    bind *:8404
    stats uri /stats
    stats enable
```

在你的浏览器中，加载 `http://localhost:8404/stats`。阅读 HAProxy 的博客 [学习 HAProxy 的统计页面][9]，了解你在这里可以做什么。

### 一个强大的负载平衡器

虽然我只介绍了 HAProxy 的几个功能，但你现在有了一个服务器，它可以监听 80 和 443 端口，将 HTTP 流量重定向到 HTTPS，在几个后端服务器之间平衡流量，甚至将匹配特定 URL 模式的流量发送到不同的后端服务器。你还解锁了非常强大的 HAProxy 统计页面，让你对你的系统有一个很好的概览。
 
这个练习可能看起来很简单，不要搞错了，你刚刚建立和配置了一个非常强大的负载均衡器，能够处理大量的流量。

为了你方便，我把本文中的所有命令放在了 [GitHub Gist][10] 中。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/load-balancing-haproxy

作者：[Jim O'Connell][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jimoconnell
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/water-stone-balance-eight-8.png?itok=1aht_V5V (eight stones balancing)
[2]: https://www.haproxy.org/
[3]: https://en.wikipedia.org/wiki/Transmission_Control_Protocol
[4]: https://varnish-cache.org/
[5]: https://www.haproxy.com/blog/announcing-haproxy-2-2/
[6]: https://nmap.org/ncat
[7]: https://www.redhat.com/en/topics/linux/what-is-selinux
[8]: https://gist.github.com/haproxytechblog/38ef4b7d42f16cfe5c30f28ee3304dce
[9]: https://www.haproxy.com/blog/exploring-the-haproxy-stats-page/
[10]: https://gist.github.com/haproxytechblog/d656422754f1b5eb1f7bbeb1452d261e
