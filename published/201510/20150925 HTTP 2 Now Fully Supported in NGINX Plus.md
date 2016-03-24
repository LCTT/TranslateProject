NGINX Plus 现在完全支持 HTTP/2 
================================================================================
早些时候，我们发布了支持 HTTP/2 协议的 [NGINX Plus R7][1]。作为 HTTP 协议的最新标准，HTTP/2 的设计为现在的 web 应用程序带来了更高的性能和安全性。（LCTT 译注： [开源版本的 NGINX 1.95 也支持 HTTP/2 了][18]。）

NGINX Plus 所实现的 HTTP/2 协议可与现有的网站和应用程序进行无缝衔接。只需要一点改变，不管用户选择什么样的浏览器，NGINX Plus 都能为用户同时提供 HTTP/1.x 与HTTP/2 的最佳体验。

要支持 HTTP/2 仅需通过可选的 **nginx‑plus‑http2** 软件包。**nginx‑plus** 和 **nginx‑plus‑extras** 软件包支持 SPDY 协议，目前推荐用于生产站点，因为其被大多数浏览器所支持并且代码也是相当成熟了。

### 为什么要使用 HTTP/2？ ###

HTTP/2 使数据传输更高效，对你的应用程序更安全。 HTTP/2 相比于 HTTP/1.x 有五个提高性能特点：

- **完全复用** – 在一个保持激活（keepalive）的连接上，HTTP/1.1 强制按严格的顺序来处理请求。一个请求必须在下一个请求开始前结束。 HTTP/2 消除了这一要求，允许并行和乱序来处理请求。

- **单一，持久连接** – 由于 HTTP/2 允许请求完全复用，所以可以通过单一连接并行下载网页上的所有对象。在 HTTP/1.x 中，使用多个连接来并行下载资源，从而导致使用底层 TCP 协议效率很低。

- **二进制编码** – Header 信息使用紧凑的二进制格式发送，而不是纯文本格式，节省了传输字节。

- **Header 压缩** – Headers 使用专用的 HPACK 压缩算法来进行压缩，这进一步降低数据通过网络传输的字节。

- **SSL/TLS 加密** – 在 HTTP/2 中，强制使用 SSL/TLS。在 [RFC][2] 中并没有强制，其允许纯文本的 HTTP/2，但是当前所有实现 HTTP/2的 Web 浏览器都只支持加密。 SSL/TLS 可以使你的网站更安全，并且使用 HTTP/2 各项性能会有提升，加密和解密过程的性能损失就减少了。

要了解更多关于 HTTP/2:

- 请阅读我们的 [白皮书][3]，它涵盖了你需要了解HTTP/2 的一切。
- 下载由 Google 的 Ilya Grigorik 编写的 [特别版的高性能浏览器网络电子书][4] 。

### NGINX Plus 如何实现 HTTP/2 ###

我们的 HTTP/2 实现是基于 SPDY 支持的，它已经被广泛部署（使用了 NGINX 或 NGINX Plus 的网站近 75％ 都使用了 SPDY）。使用 NGINX Plus 部署 HTTP/2 时，几乎不会改变你应用程序的配置。本节将讨论 NGINX Plus如何实现对 HTTP/2 的支持。

#### 一个 HTTP/2 网关 ####

![](https://www.nginx.com/wp-content/uploads/2015/09/http2-27-1024x300.png)

NGINX Plus 作为一个 HTTP/2 网关。它与支持 HTTP/2 的客户端 Web 浏览器用 HTTP/2 通讯，而转换 HTTP/2 请求给后端服务器通信时使用 HTTP/1.x（或者 FastCGI, SCGI, uWSGI, 等等. – 取决于你目前正在使用的协议）。

#### 向后兼容性 ####

![](https://www.nginx.com/wp-content/uploads/2015/09/http2-281-1024x581.png)

在一段时间内，你需要同时支持 HTTP/2 和 HTTP/1.x。在撰写本文时，超过50％的用户使用的 Web 浏览器已经[支持 HTTP/2][5]，但这也意味着近50％的人还没有使用。

为了同时支持 HTTP/1.x 和 HTTP/2，NGINX Plus 实现了 TLS 上的 Next Protocol Negotiation (NPN)扩展。当 Web 浏览器连接到服务器时，其将所支持的协议列表发送到服务器端。如果浏览器支持的协议列表中包括 h2 - 即 HTTP/2，NGINX Plus 将使用 HTTP/2 连接到浏览器。如果浏览器不支持 NPN 或在发送支持的协议列表中没有 h2，NGINX Plus 将继续回落到 HTTP/1.x。

### 转向 HTTP/2 ###

NGINX 公司会尽可能帮助大家无缝过渡到使用 HTTP/2。本节介绍了通过对你应用进行改变来启用对 HTTP/2 支持，其中只需对 NGINX Plus 配置进行几个变化。

#### 前提条件 ####

使用 **nginx‑plus‑http2** 软件包升级到 NGINX Plus R7。注意现在还没有支持 HTTP/2 版本的 **nginx‑plus‑extras** 软件包。

#### 重定向所有流量到 SSL/TLS ####

如果你的应用尚未使用 SSL/TLS 加密，现在启用它正是一个好的时机。加密你的应用程序可以保护你免受间谍以及来自其他中间人的攻击。一些搜索引擎甚至在搜索结果中对加密站点[提高排名][6]。下面的配置块重定向所有的普通 HTTP 请求到该网站的加密版本。

    server {
        listen 80;
        location / {
            return 301 https://$host$request_uri;
        }
    }

#### 启用 HTTP/2 ####

要启用对 HTTP/2 的支持，只需将 http2 参数添加到所有的 [listen][7] 指令中，也要包括 SSL 参数，因为浏览器不支持不加密的 HTTP/2 请求。

    server {
        listen 443 ssl http2 default_server;
    
        ssl_certificate     server.crt;
        ssl_certificate_key server.key;
        …
    }

如果有必要，重启 NGINX Plus，例如通过运行 `nginx -s reload` 命令。要验证 HTTP/2 是否正常工作，你可以在 [Google Chrome][8] 和 [Firefox][9] 中使用 “HTTP/2 and SPDY indicator” 插件来检查。

### 注意事项 ###

- 在安装 **nginx‑plus‑http2** 包之前, 你必须删除配置文件中所有 listen 指令后的 SPDY 参数（使用 http2 和 ssl 参数来替换它以启用对 HTTP/2 的支持）。使用这个包后，如果 listen 指令后有 spdy 参数，NGINX Plus 将无法启动。

- 如果你在 NGINX Plus 前端使用了 Web 应用防火墙（WAF），请确保它能够解析 HTTP/2，或者把它移到  NGINX Plus 后面。

- 此版本不支持在 HTTP/2 RFC 中定义的 “Server Push” 特性。 NGINX Plus 以后的版本可能会支持它。

- NGINX Plus R7 同时支持 SPDY 和 HTTP/2（LCTT 译注：但是你只能同时使用其中一种）。在以后的版本中，我们将弃用对 SPDY 的支持。谷歌在2016年初将 [弃用 SPDY][10]，因此同时支持这两种协议也非必要。

- 如果 [ssl_prefer_server_ciphers][11] 设置为 on 或者使用了定义在 [Appendix A: TLS 1.2 Ciper Suite Black List][13] 中的 [ssl_ciphers][12] 列表时，浏览器会出现 handshake-errors 而无法正常工作。详细内容请参阅 [section 9.2.2 of the HTTP/2 RFC][14]。

### 特别感谢  ###

NGINX 公司要感谢 [Dropbox][15] 和 [Automattic][16]，他们是我们软件的重度使用者，并帮助我们实现 HTTP/2。他们的贡献帮助我们加速完成这个软件，我们希望你也能支持他们。

![](https://www.nginx.com/wp-content/themes/nginx-theme/assets/img/landing-page/highperf_nginx_ebook.png)

[O'REILLY'S BOOK ABOUT HTTP/2 & PERFORMANCE TUNING][17] 

--------------------------------------------------------------------------------

via: https://www.nginx.com/blog/http2-r7/

作者：[Faisal Memon][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.nginx.com/blog/author/fmemon/
[1]:https://www.nginx.com/blog/nginx-plus-r7-released/
[2]:https://tools.ietf.org/html/rfc7540
[3]:https://www.nginx.com/wp-content/uploads/2015/09/NGINX_HTTP2_White_Paper_v4.pdf
[4]:https://www.nginx.com/http2-ebook/
[5]:http://caniuse.com/#feat=http2
[6]:http://googlewebmastercentral.blogspot.co.uk/2014/08/https-as-ranking-signal.html
[7]:http://nginx.org/en/docs/http/ngx_http_core_module.html#listen
[8]:https://chrome.google.com/webstore/detail/http2-and-spdy-indicator/mpbpobfflnpcgagjijhmgnchggcjblin?hl=en
[9]:https://addons.mozilla.org/en-us/firefox/addon/spdy-indicator/
[10]:http://blog.chromium.org/2015/02/hello-http2-goodbye-spdy-http-is_9.html
[11]:http://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_prefer_server_ciphers
[12]:http://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_ciphers
[13]:https://tools.ietf.org/html/rfc7540#appendix-A
[14]:https://tools.ietf.org/html/rfc7540#section-9.2.2
[15]:http://dropbox.com/
[16]:http://automattic.com/
[17]:https://www.nginx.com/http2-ebook/
[18]:http://mailman.nginx.org/pipermail/nginx-announce/2015/000162.html