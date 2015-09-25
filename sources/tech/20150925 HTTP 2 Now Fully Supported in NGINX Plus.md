struggling 翻译中

HTTP/2 Now Fully Supported in NGINX Plus
================================================================================
Earlier this week we released [NGINX Plus R7][1] with support for HTTP/2. As the latest standard for the HTTP protocol, HTTP/2 is designed to bring increased performance and security to modern web applications.

The HTTP/2 implementation in NGINX Plus works seamlessly with existing sites and applications. Minimal changes are required, as NGINX Plus delivers HTTP/1.x and HTTP/2 traffic in parallel for the best experience, no matter what browser your users choose.

HTTP/2 support is available in the optional **nginx‑plus‑http2** package only. The **nginx‑plus** and **nginx‑plus‑extras** packages provide SPDY support and are currently recommended for production sites because of wider browser support and code maturity.

### Why Move to HTTP/2? ###

HTTP/2 makes data transfer more efficient and more secure for your applications. HTTP/2 adds five key features that improve performance when compared to HTTP/1.x:

- **True multiplexing** – HTTP/1.1 enforces strict in-order completion of requests that come in over a keepalive connection. A request must be satisfied before processing on the next one can begin. HTTP/2 eliminates this requirement and allows requests to be satisfied in parallel and out of order.
- **Single, persistent connection** – As HTTP/2 allows for true multiplexing of requests, all objects on a web page can now be downloaded in parallel over a single connection. WIth HTTP/1.x, multiple connections are used to download resources in parallel, leading to inefficient use of the underlying TCP protocol.
- **Binary encoding** – Header information is sent in compact, binary format, rather than plain text, saving bytes on the wire.
- **Header compression** – Headers are compressed using a purpose-built algorithm, HPACK compression, which further reduces the amount of data crossing the network.
- **SSL/TLS encryption** – With HTTP/2, SSL/TLS encryption is mandatory. This is not enforced in the [RFC][2], which allows for plain-text HTTP/2, but rather by all web browsers that currently implement HTTP/2. SSL/TLS makes your site more secure, and with all the performance improvements in HTTP/2, the performance penalty from encryption and decryption is mitigated.

To learn more about HTTP/2:

- Please read our [white paper][3], which covers everything you need to know about HTTP/2.
- Download our [special edition of the High Performance Browser Networking ebook][4] by Ilya Grigorik of Google.

### How NGINX Plus Implements HTTP/2 ###

Our implementation of HTTP/2 is based on our support for SPDY, which is widely deployed (nearly 75% of websites that use SPDY use NGINX or NGINX Plus). With NGINX Plus, you can deploy HTTP/2 with very little change to your application infrastructure. This section discusses how NGINX Plus implements support for HTTP/2.

#### An HTTP/2 Gateway ####

![](https://www.nginx.com/wp-content/uploads/2015/09/http2-27-1024x300.png)

NGINX Plus acts an HTTP/2 gateway. It talks HTTP/2 to client web browsers that support it, but translates HTTP/2 requests back to HTTP/1.x (or FastCGI, SCGI, uWSGI, etc. – whatever protocol you are currently using) for communication with back-end servers.

#### Backward Compatibility ####

![](https://www.nginx.com/wp-content/uploads/2015/09/http2-281-1024x581.png)

For the foreseeable future you’ll need to support HTTP/2 and HTTP/1.x side by side. As of this writing, over 50% of users already run a web browser that [supports HTTP/2][5], but this also means almost 50% don’t.

To support both HTTP/1.x and HTTP/2 side by side, NGINX Plus implements the Next Protocol Negotiation (NPN) extension to TLS. When a web browser connects to a server, it sends a list of supported protocols to the server. If the browser includes h2 – that is, HTTP/2 – in the list of supported protocols, NGINX Plus uses HTTP/2 for connections to that browser. If the browser doesn’t implement NPN, or doesn’t send h2 in its list of supported protocols, NGINX Plus falls back to HTTP/1.x.

### Moving to HTTP/2 ###

NGINX, Inc. aims to make the transition to HTTP/2 as seamless as possible. This section goes through the changes that need to be made to enable HTTP/2 for your applications, which include just a few changes to the configuration of NGINX Plus.

#### Prerequisites ####

Upgrade to the NGINX Plus R7 **nginx‑plus‑http2** package. Note that an HTTP/2-enabled version of the **nginx‑plus‑extras** package is not available at this time.

#### Redirecting All Traffic to SSL/TLS ####

If your app is not already encrypted with SSL/TLS, now would be a good time to make that move. Encrypting your app protects you from spying as well as from man-in-the-middle attacks. Some search engines even reward encrypted sites with [improved rankings][6] in search results. The following configuration block redirects all plain HTTP requests to the encrypted version of the site.

    server {
        listen 80;
        location / {
            return 301 https://$host$request_uri;
        }
    }

#### Enabling HTTP/2 ####

To enable HTTP/2 support, simply add the http2 parameter to all [listen][7] directives. Also include the ssl parameter, required because browsers do not support HTTP/2 without encryption.

    server {
        listen 443 ssl http2 default_server;
    
        ssl_certificate     server.crt;
        ssl_certificate_key server.key;
        …
    }

If necessary, restart NGINX Plus, for example by running the nginx -s reload command. To verify that HTTP/2 translation is working, you can use the “HTTP/2 and SPDY indicator” plug-in available for [Google Chrome][8] and [Firefox][9].

### Caveats ###

- Before installing the **nginx‑plus‑http2** package, you must remove the spdy parameter on all listen directives in your configuration (replace it with the http2 and ssl parameters to enable support for HTTP/2). With this package, NGINX Plus fails to start if any listen directives have the spdy parameter.
- If you are using a web application firewall (WAF) that is sitting in front of NGINX Plus, ensure that it is capable of parsing HTTP/2, or move it behind NGINX Plus.
- The “Server Push” feature defined in the HTTP/2 RFC is not supported in this release. Future releases of NGINX Plus might include it.
- NGINX Plus R7 supports both SPDY and HTTP/2. In a future release we will deprecate support for SPDY. Google is [deprecating SPDY][10] in early 2016, making it unnecessary to support both protocols at that point.
- If [ssl_prefer_server_ciphers][11] is set to on and/or a list of [ssl_ciphers][12] that are defined in [Appendix A: TLS 1.2 Ciper Suite Black List][13] is used, the browser will experience handshake-errors and not work. Please refer to [section 9.2.2 of the HTTP/2 RFC][14] for more details.- 

### Special Thanks ###

NGINX, Inc. would like to thank [Dropbox][15] and [Automattic][16], who are heavy users of our software and graciously cosponsored the development of our HTTP/2 implementation. Their contributions have helped accelerate our ability to bring this software to you, and we hope you are able to support them in turn.

![](https://www.nginx.com/wp-content/themes/nginx-theme/assets/img/landing-page/highperf_nginx_ebook.png)

[O'REILLY'S BOOK ABOUT HTTP/2 & PERFORMANCE TUNING][17] 

--------------------------------------------------------------------------------

via: https://www.nginx.com/blog/http2-r7/

作者：[Faisal Memon][a]
译者：[struggling](https://github.com/struggling)
校对：[校对者ID](https://github.com/校对者ID)

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