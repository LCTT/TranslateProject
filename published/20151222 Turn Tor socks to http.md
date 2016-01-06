将 Tor socks 转换成 http 代理
================================================================================
![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/12/tor-593x445.jpg)

你可以通过不同的 Tor 工具来使用 Tor 服务，如 Tor 浏览器、Foxyproxy 和其它东西，像 wget 和 aria2 这样的下载管理器不能直接使用 Tor socks 开始匿名下载，因此我们需要一些工具来将 Tor socks 转换成 http 代理，这样就能用它来下载了。

**注意**：本教程基于 Debian ，其他发行版会有些不同，因此如果你的发行版是基于 Debian 的，就可以直接使用下面的配置了。

### Polipo

这个服务会使用 8123 端口和 127.0.0.1 的 IP 地址，使用下面的命令来在计算机上安装 Polipo：

    sudo apt install polipo

现在使用如下命令打开 Polipo 的配置文件：

    sudo nano /etc/polipo/config

在文件最后加入下面的行：

    proxyAddress = "::0"
    allowedClients = 192.168.1.0/24
    socksParentProxy = "localhost:9050"
    socksProxyType = socks5

用如下的命令来重启 Polipo：

    sudo service polipo restart

现在 Polipo 已经安装好了！在匿名的世界里做你想做的吧！下面是使用的例子：

    pdmt -l "link" -i 127.0.01 -p 8123

通过上面的命令 PDMT（Persian 下载器终端）会匿名地下载你的文件。

### Proxychains

在此服务中你可以设置使用 Tor 或者 Lantern 代理，但是在使用上它和 Polipo 和 Privoxy 有点不同，它不需要使用任何端口！使用下面的命令来安装：

    sudo apt install proxychains

用这条命令来打开配置文件：

    sudo nano /etc/proxychains.conf

现在添加下面的代码到文件底部，这里是 Tor 的端口和 IP：

    socks5 127.0.0.1 9050

如果你在命令的前面加上“proxychains”并运行，它就能通过 Tor 代理来运行：

    proxychains firefoxt
    proxychains aria2c
    proxychains wget

### Privoxy

Privoxy 使用 8118 端口，可以很轻松地通过 privoxy 包来安装：

    sudo apt install privoxy

我们现在要修改配置文件：

    sudo nano /etc/pivoxy/config

在文件底部加入下面的行：

    forward-socks5 / 127.0.0.1:9050  .
    forward-socks4a / 127.0.0.1:9050 .
    forward-socks5t             /     127.0.0.1:9050 .
    forward         192.168.*.*/     .
    forward            10.*.*.*/     .
    forward           127.*.*.*/     .
    forward           localhost/     .

重启服务：

    sudo service privoxy restart

服务已经好了！端口是 8118，IP 是 127.0.0.1，就尽情使用吧！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/turn-tor-socks-http/

作者：[Hossein heydari][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/hossein/
