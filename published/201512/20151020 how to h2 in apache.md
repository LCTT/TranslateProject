如何在 Apache 中启用 HTTP/2
================================================================================
Copyright (C) 2015 greenbytes GmbH

刚发布的 Apache httpd 2.4.17 终于支持 HTTP/2 了。这个页面给出了一些如何构建/部署/配置的建议。目的是为了大家发现 bugs 时能升级它，或者给一些能更好工作的建议。 

最后，这会归并回到官方 Apache 文档，这里只会留下一个到那里的链接。暂时我们还没做到。

### 源码 ###

你可以从[这里][1]得到 Apache 版本。Apache 2.4.17 及其更高版本都支持 HTTP/2。我不会再重复介绍如何构建该服务器的指令。在很多地方有很好的指南，例如[这里][2]。

（有任何这个试验性软件包的相关链接？在 Twitter 上告诉我吧 @icing）

#### 编译支持 HTTP/2 ####

在你编译版本之前，你要进行一些**配置**。这里有成千上万的选项。和 HTTP/2 相关的是：

- **--enable-http2**
	
	启用在 Apache 服务器内部实现该协议的 ‘http2’ 模块。

- **--with-nghttp2=\<dir>**

	指定 http2 模块需要的 libnghttp2 模块的非默认位置。如果 nghttp2 是在默认的位置，配置过程会自动采用。

- **--enable-nghttp2-staticlib-deps**

	很少用到的选项，你可能想将 nghttp2 库静态链接到服务器里。在大部分平台上，只有在找不到共享 nghttp2 库时才有用。

如果你想自己编译 nghttp2，你可以到 [nghttp2.org][3] 查看文档。最新的 Fedora 以及其它版本已经附带了这个库。

#### TLS 支持 ####

大部分人想在浏览器上使用 HTTP/2， 而浏览器只在使用 TLS 连接（**https:// 开头的 url）时才支持 HTTP/2。你需要一些我下面介绍的配置。但首先你需要的是支持 ALPN 扩展的 TLS 库。

ALPN 用来协商（negotiate）服务器和客户端之间的协议。如果你服务器上 TLS 库还没有实现 ALPN，客户端只能通过 HTTP/1.1 通信。那么，可以和 Apache 链接并支持它的是什么库呢？

- **OpenSSL 1.0.2** 及其以后。
- ??? （别的我也不知道了）

如果你的 OpenSSL 库是 Linux 版本自带的，这里使用的版本号可能和官方 OpenSSL 版本的不同。如果不确定的话检查一下你的 Linux 版本吧。

### 配置 ###

另一个给服务器的好建议是为 http2 模块设置合适的日志等级。添加下面的配置：

    # 放在某个地方的这样一行
    LoadModule http2_module modules/mod_http2.so
    
    <IfModule http2_module>
        LogLevel http2:info
    </IfModule>

当你启动服务器的时候，你可以在错误日志中看来类似的一行：

    [timestamp] [http2:info] [pid XXXXX:tid numbers] 
      mod_http2 (v1.0.0, nghttp2 1.3.4), initializing...

#### 协议 ####

那么，假设你已经编译部署好了服务器， TLS 库也是最新的，你启动了你的服务器，打开了浏览器。。。你怎么知道它在工作呢？

如果除此之外你没有添加其它的服务器配置，很可能它没有工作。

你需要告诉服务器在哪里使用该协议。默认情况下，你的服务器并没有启动 HTTP/2 协议。因为这样比较安全，也许才能让你已有的部署可以继续工作。

你可以用新的 **Protocols** 指令启用 HTTP/2 协议：

    # 对于 https 服务器
    Protocols h2 http/1.1
    ...
    
    # 对于 http 服务器
    Protocols h2c http/1.1

你可以给整个服务器或者指定的 **vhosts** 添加这个配置。

#### SSL 参数 ####

对于 TLS （SSL），HTTP/2 有一些特殊的要求。阅读下面的“ https:// 连接”一节了解更详细的信息。

### http:// 连接 (h2c) ###

尽管现在还没有浏览器支持，但是 HTTP/2 协议也工作在 http:// 这样的 url 上， 而且 mod_h[ttp]2 也支持。启用它你唯一所要做的是在 Protocols 配置中启用它：

    # 对于 http 服务器
    Protocols h2c http/1.1

这里有一些支持 **h2c** 的客户端（和客户端库）。我会在下面介绍：

#### curl ####

Daniel Stenberg 维护的用于访问网络资源的命令行客户端 curl 当然支持。如果你的系统上有 curl，有一个简单的方法检查它是否支持 http/2：

    sh> curl -V
    curl 7.43.0 (x86_64-apple-darwin15.0) libcurl/7.43.0 SecureTransport zlib/1.2.5
    Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
    Features: AsynchDNS IPv6 Largefile GSS-API Kerberos SPNEGO NTLM NTLM_WB SSL libz UnixSockets 
                
不好了。这些功能中没有 'HTTP2'。你想要的是下面这样：

    sh> curl -V
    url 7.45.0 (x86_64-apple-darwin15.0.0) libcurl/7.45.0 OpenSSL/1.0.2d zlib/1.2.8 nghttp2/1.3.4
    Protocols: dict file ftp ftps gopher http https imap imaps ldap ldaps pop3 pop3s rtsp smb smbs smtp smtps telnet tftp 
    Features: IPv6 Largefile NTLM NTLM_WB SSL libz TLS-SRP HTTP2 UnixSockets

如果你的 curl 支持 HTTP2 功能，你可以用一些简单的命令检查你的服务器：

    sh> curl -v --http2 http://<yourserver>/
    ...
    > Connection: Upgrade, HTTP2-Settings
    > Upgrade: h2c
    > HTTP2-Settings: AAMAAABkAAQAAP__
    > 
    < HTTP/1.1 101 Switching Protocols
    < Upgrade: h2c
    < Connection: Upgrade
    * Received 101
    * Using HTTP2, server supports multi-use
    * Connection state changed (HTTP/2 confirmed)
    ...
    <the resource>

恭喜，如果看到了有 **...101 Switching...** 的行就表示它正在工作！

有一些情况不会发生 HTTP/2 的升级切换（Upgrade）。如果你的第一个请求有内容数据（body），例如你上传一个文件时，就不会触发升级切换。[h2c 限制][5]部分有详细的解释。

#### nghttp ####

nghttp2 可以一同编译它自己的客户端和服务器。如果你的系统中有该客户端，你可以简单地通过获取一个资源来验证你的安装：

    sh> nghttp -uv http://<yourserver>/
    [  0.001] Connected
    [  0.001] HTTP Upgrade request
    ...
    Connection: Upgrade, HTTP2-Settings
    Upgrade: h2c
    HTTP2-Settings: AAMAAABkAAQAAP__
    ...
    [  0.005] HTTP Upgrade response
    HTTP/1.1 101 Switching Protocols
    Upgrade: h2c
    Connection: Upgrade
    
    [  0.006] HTTP Upgrade success
    ...


这和我们上面 **curl** 例子中看到的 Upgrade 输出很相似。

有另外一种在命令行参数中不用 **-u** 参数而使用 **h2c** 的方法。这个参数会指示 **nghttp** 进行 HTTP/1 升级切换过程。但如果我们不使用呢？

    sh> nghttp -v http://<yourserver>/
    [  0.002] Connected
    [  0.002] send SETTINGS frame 
    ...
    [  0.002] send HEADERS frame 
              ; END_STREAM | END_HEADERS | PRIORITY
              (padlen=0, dep_stream_id=11, weight=16, exclusive=0)
              ; Open new stream
              :method: GET
              :path: /
              :scheme: http
    ...

连接马上使用了 HTTP/2！这就是协议中所谓的直接（direct）模式，当客户端发送一些特殊的 24 字节到服务器时就会发生：

    0x505249202a20485454502f322e300d0a0d0a534d0d0a0d0a
    
用 ASCII 表示是: 

	PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n

支持 **h2c** 的服务器在一个新的连接中看到这些信息就会马上切换到 HTTP/2。HTTP/1.1 服务器则认为是一个可笑的请求，响应并关闭连接。

因此，**直接**模式只适合于那些确定服务器支持 HTTP/2 的客户端。例如，当前一个升级切换过程成功了的时候。

**直接**模式的魅力是零开销，它支持所有请求，即使带有请求数据部分（查看[h2c 限制][6]）。

对于 2.4.17 版本，明文连接时默认启用 **H2Direct** 。但是有一些模块和这不兼容。因此，在下一版本中，默认会设置为**off**，如果你希望你的服务器支持它，你需要设置它为：

    H2Direct on

### https:// 连接 (h2) ###

当你的 mod_h[ttp]2 可以支持 h2c 连接时，那就可以一同启用 **h2** 兄弟了，现在的浏览器仅支持它和 **https:** 一同使用。

HTTP/2 标准对 https:（TLS）连接增加了一些额外的要求。上面已经提到了 ALNP 扩展。另外的一个要求是不能使用特定[黑名单][7]中的加密算法。

尽管现在版本的 **mod_h[ttp]2** 不增强这些算法（以后可能会），但大部分客户端会这么做。如果让你的浏览器使用不恰当的算法打开 **h2** 服务器，你会看到不明确的警告**INADEQUATE_SECURITY**，浏览器会拒接连接。

一个可行的 Apache SSL 配置类似：

    SSLCipherSuite ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK
    SSLProtocol All -SSLv2 -SSLv3
    ...

（是的，这确实很长。）

这里还有一些应该调整，但不是必须调整的 SSL 配置参数：**SSLSessionCache**， **SSLUseStapling** 等，其它地方也有介绍这些。例如 Ilya Grigorik 写的一篇超赞的博客： [高性能浏览器网络][8]。

#### curl ####

再次回到 shell 使用 curl（查看上面的“curl h2c”章节了解要求），你也可以通过 curl 用简单的命令检测你的服务器：

    sh> curl -v --http2 https://<yourserver>/
    ...
    * ALPN, offering h2
    * ALPN, offering http/1.1
    ...
    * ALPN, server accepted to use h2
    ...
    <the resource>

恭喜你，能正常工作啦！如果还不能，可能原因是：

- 你的 curl 不支持 HTTP/2。查看上面的“检测 curl”一节。
- 你的 openssl 版本太低不支持 ALPN。
- 不能验证你的证书，或者不接受你的算法配置。尝试添加命令行选项 -k 停用 curl 中的这些检查。如果可以工作，就重新配置你的 SSL 和证书。

#### nghttp ####

我们已经在 **h2c** 讨论过 **nghttp**。如果你用它来进行 **https:** 连接，你会看到类似下面的信息：

    sh> nghttp https://<yourserver>/
    [ERROR] HTTP/2 protocol was not selected. (nghttp2 expects h2)

这有两种可能，你可以通过添加 -v 来检查。如果是：

    sh> nghttp -v https://<yourserver>/
    [  0.034] Connected
    [ERROR] HTTP/2 protocol was not selected. (nghttp2 expects h2)

这意味着你服务器使用的 TLS 库没有实现 ALPN。有时候正确安装有点困难。多看看 Stackoverflow 吧。 

你看到的也可能是：

    sh> nghttp -v https://<yourserver>/
    [  0.034] Connected
    The negotiated protocol: http/1.1
    [ERROR] HTTP/2 protocol was not selected. (nghttp2 expects h2)

这表示 ALPN 能正常工作，但并没有用 h2 协议。你需要像上面介绍的那样检查你服务器上的 Protocols 配置。如果一开始在 vhost 部分设置不能正常工作，试着在通用部分设置它。

#### Firefox ####

更新： [Apache Lounge][11] 的 Steffen Land 告诉我 [Firefox 上有个 HTTP/2 指示插件][12]。你可以看到有多少地方用到了 h2（提示：Apache Lounge 用 h2 已经有一段时间了。。。）

你可以在 Firefox 浏览器中打开开发者工具，在那里的网络标签页查看 HTTP/2 连接。当你打开了 HTTP/2 并重新刷新 html 页面时，你会看到类似下面的东西：

![](https://icing.github.io/mod_h2/images/firefox-h2.png)

在响应头中，你可以看到奇怪的  **X-Firefox-Spdy** 条目中列出了 “h2”。这表示在这个 **https:** 连接中使用了 HTTP/2。

#### Google Chrome ####

在 Google Chrome 中，你在开发者工具中看不到 HTTP/2 指示器。相反，Chrome 用特殊的地址 **chrome://net-internals/#http2** 给出了相关信息。（LCTT 译注：Chrome 已经有一个 “HTTP/2 and SPDY indicator” 可以很好的在地址栏识别  HTTP/2 连接）

如果你打开了一个服务器的页面，可以在 Chrome 中查看那个 net-internals 页面，你可以看到类似下面这样：

![](https://icing.github.io/mod_h2/images/chrome-h2.png)

如果你的服务器在上面的列表中，就表示它正在工作。

#### Microsoft Edge ####

Windows 10 中 Internet Explorer 的继任者 Edge 也支持 HTTP/2。你也可以在开发者工具的网络标签页看到 HTTP/2 协议。

![](https://icing.github.io/mod_h2/images/ie-h2.png)

#### Safari ####

在 Apple 的 Safari 中，打开开发者工具，那里有个网络标签页。重新加载你的服务器上的页面，并在开发者工具中选择显示了加载的那行。如果你启用了在右边显示详细视图，看 **Status** 部分。那里显示了 **HTTP/2.0 200**，像这样：

![](https://icing.github.io/mod_h2/images/safari-h2.png)

#### 重新协商 ####

https： 连接重新协商是指正在运行的连接中特定的 TLS 参数会发生变化。在 Apache httpd 中，你可以在 directory 配置中改变 TLS 参数。如果进来一个获取特定位置资源的请求，配置的 TLS 参数会和当前的 TLS 参数进行对比。如果它们不相同，就会触发重新协商。

这种最常见的情形是算法变化和客户端证书。你可以要求客户访问特定位置时需要通过验证，或者对于特定资源，你可以使用更安全的、对 CPU 压力更大的算法。

但不管你的想法有多么好，HTTP/2 中都**不可以**发生重新协商。在同一个连接上会有 100 多个请求，那么重新协商该什么时候做呢？

对于这种配置，现有的 **mod_h[ttp]2** 还没有办法。如果你有一个站点使用了 TLS 重新协商，别在上面启用 h2！

当然，我们会在后面的版本中解决这个问题，然后你就可以安全地启用了。

### 限制 ###

#### 非 HTTP 协议 ###

实现除 HTTP 之外协议的模块可能和 **mod_http2** 不兼容。这在其它协议要求服务器首先发送数据时无疑会发生。

**NNTP** 就是这种协议的一个例子。如果你在服务器中配置了 **mod\_nntp\_like\_ssl**，那么就不要加载 mod_http2。等待下一个版本。

#### h2c 限制 ####

**h2c** 的实现还有一些限制，你应该注意：

##### 在虚拟主机中拒绝 h2c #####

你不能对指定的虚拟主机拒绝 **h2c 直连**。连接建立而没有看到请求时会触发**直连**，这使得不可能预先知道 Apache 需要查找哪个虚拟主机。

##### 有请求数据时的升级切换 #####

对于有数据的请求，**h2c** 升级切换不能正常工作。那些是 PUT 和 POST 请求（用于提交和上传）。如果你写了一个客户端，你可能会用一个简单的 GET 或者 OPTIONS * 来处理那些请求以触发升级切换。

原因从技术层面来看显而易见，但如果你想知道：在升级切换过程中，连接处于半疯状态。请求按照 HTTP/1.1 的格式，而响应使用 HTTP/2 帧。如果请求有一个数据部分，服务器在发送响应之前需要读取整个数据。因为响应可能需要从客户端处得到应答用于流控制及其它东西。但如果仍在发送 HTTP/1.1 请求，客户端就仍然不能以 HTTP/2 连接。

为了使行为可预测，几个服务器在实现上决定不在任何带有请求数据的请求中进行升级切换，即使请求数据很小。

##### 302 时的升级切换 #####

有重定向发生时，当前的 h2c 升级切换也不能工作。看起来 mod_http2 之前的重写有可能发生。这当然不会导致断路，但你测试这样的站点也许会让你迷惑。

#### h2 限制 ####

这里有一些你应该意识到的 h2 实现限制：

##### 连接重用 #####

HTTP/2 协议允许在特定条件下重用 TLS 连接：如果你有带通配符的证书或者多个 AltSubject 名称，浏览器可能会重用现有的连接。例如：

你有一个 **a.example.org** 的证书，它还有另外一个名称 **b.example.org**。你在浏览器中打开 URL **https://a.example.org/**，用另一个标签页加载 **https://b.example.org/**。

在重新打开一个新的连接之前，浏览器看到它有一个到 **a.example.org** 的连接并且证书对于 **b.example.org** 也可用。因此，它在第一个连接上面发送第二个标签页的请求。

这种连接重用是刻意设计的，它使得使用了 HTTP/1 切分（sharding）来提高效率的站点能够不需要太多变化就能利用 HTTP/2。

Apache **mod_h[ttp]2** 还没有完全实现这点。如果 **a.example.org** 和 **b.example.org** 是不同的虚拟主机， Apache 不会允许这样的连接重用，并会告知浏览器状态码 **421 Misdirected Request**。浏览器会意识到它需要重新打开一个到 **b.example.org** 的连接。这仍然能工作，只是会降低一些效率。

我们期望下一次的发布中能有合适的检查。

Münster, 12.10.2015,

Stefan Eissing, greenbytes GmbH

Copying and distribution of this file, with or without modification, are permitted in any medium without royalty provided the copyright notice and this notice are preserved. This file is offered as-is, without warranty of any kind. See LICENSE for details. 


----------

该项目由 [icing][13] 维护。

--------------------------------------------------------------------------------

via: https://icing.github.io/mod_h2/howto.html

作者：[icing][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://github.com/icing
[1]:https://httpd.apache.org/download.cgi
[2]:https://httpd.apache.org/docs/2.4/install.html
[3]:https://nghttp2.org/
[4]:https://icing.github.io/mod_h2/howto.html#https
[5]:https://icing.github.io/mod_h2/howto.html#h2c-restrictions
[6]:https://icing.github.io/mod_h2/howto.html#h2c-restrictions
[7]:https://httpwg.github.io/specs/rfc7540.html#BadCipherSuites
[8]:http://chimera.labs.oreilly.com/books/1230000000545
[9]:https://icing.github.io/mod_h2/howto.html#curl
[10]:https://icing.github.io/mod_h2/howto.html#curl
[11]:https://www.apachelounge.com/
[12]:https://addons.mozilla.org/en-US/firefox/addon/spdy-indicator/
[13]:https://github.com/icing