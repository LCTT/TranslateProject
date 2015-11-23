10 Tips for 10x Application Performance

将程序性能提高十倍的10条建议
================================================================================

提高web 应用的性能从来没有比现在更关键过。网络经济的比重一直在增长；全球经济超过5% 的价值是在因特网上产生的（数据参见下面的资料）。我们的永远在线、超级连接的世界意味着用户的期望值也处于历史上的最高点。如果你的网站不能及时的响应，或者你的app 不能无延时的工作，用户会很快的投奔到你的竞争对手那里。

举一个例子，一份亚马逊十年前做过的研究可以证明，甚至在那个时候，网页加载时间每减少100毫秒，收入就会增加1%。另一个最近的研究特别强调一个事实，即超过一半的网站拥有着在调查中说他们会因为应用程序性能的问题流失用户。

网站到底需要多块呢？对于页面加载，每增加1秒钟就有4%的用户放弃使用。顶级的电子商务站点的页面在第一次交互时可以做到1秒到3秒加载时间，而这是提供最高舒适度的速度。很明显这种利害关系对于web 应用来说很高，而且在不断的增加。

想要提高效率很简单，但是看到实际结果很难。要在旅途上帮助你，这篇blog 会给你提供10条最高可以10倍的提升网站性能的建议。这是系列介绍提高应用程序性能的第一篇文章，包括测试充分的优化技术和一点NGIX 的帮助。这个系列给出了潜在的提高安全性的帮助。

### Tip #1: 通过反向代理来提高性能和增加安全性 ###

如果你的web 应用运行在单个机器上，那么这个办法会明显的提升性能：只需要添加一个更快的机器，更好的处理器，更多的内存，更快的磁盘阵列，等等。然后新机器就可以更快的运行你的WordPress 服务器, Node.js 程序, Java 程序，以及其它程序。（如果你的程序要访问数据库服务器，那么这个办法还是很简单：添加两个更快的机器，以及在两台电脑之间使用一个更快的链路。）

问题是，机器速度可能并不是问题。web 程序运行慢经常是因为计算机一直在不同的任务之间切换：和用户的成千上万的连接，从磁盘访问文件，运行代码，等等。应用服务器可能会抖动-内存不足，将内存数据写会磁盘，以及多个请求等待一个任务完成，如磁盘I/O。

你可以采取一个完全不同的方案来替代升级硬件：添加一个反向代理服务器来分担部分任务。[反向代理服务器][1] 位于运行应用的机器的前端，是用来处理网络流量的。只有反向代理服务器是直接连接到互联网的；和程序的通讯都是通过一个快速的内部网络完成的。

使用反向代理服务器可以将应用服务器从等待用户与web 程序交互解放出来，这样应用服务器就可以专注于为反向代理服务器构建网页，让其能够传输到互联网上。而应用服务器就不需要在能带客户端的响应，可以运行与接近优化过的性能水平。

添加方向代理服务器还可以给你的web 服务器安装带来灵活性。比如，一个已知类型的服务器已经超载了，那么就可以轻松的添加另一个相同的服务器；如果某个机器宕机了，也可以很容易的被替代。

因为反向代理带来的灵活性，所以方向代理也是一些性能加速功能的必要前提，比如：

- **负载均衡** (参见 [Tip #2][2]) – 负载均衡运行在方向代理服务器上，用来将流量均衡分配给一批应用。有了合适的负载均衡，你就可以在不改变程序的前提下添加应用服务器。
- **缓存静态文件** (参见 [Tip #3][3]) – 直接读取的文件，比如图像或者代码，可以保存在方向代理服务器，然后直接发给客户端，这样就可以提高速度、分担应用服务器的负载，可以让应用运行的更快
- **网站安全** – 反响代理服务器可以提高网站安全性，以及快速的发现和响应攻击，保证应用服务器处于被保护状态。

NGINX 软件是一个专门设计的反响代理服务器，也包含了上述的多种功能。NGINX 使用事件驱动的方式处理问题，着回避传统的服务器更加有效率。NGINX plus 天价了更多高级的反向代理特性，比如程序[健康度检查][4]，专门用来处理request 路由，高级缓冲和相关支持。

![NGINX Worker Process helps increase application performance](https://www.nginx.com/wp-content/uploads/2015/10/Graph-11.png)

### Tip #2: 添加负载平衡 ###

添加一个[负载均衡服务器][5] 是一个相当简单的用来提高性能和网站安全性的的方法。使用负载均衡讲流量分配到多个服务器，是用来替代只使用一个巨大且高性能web 服务器的方案。即使程序写的不好，或者在扩容方面有困难，只使用负载均衡服务器就可以很好的提高用户体验。

负载均衡服务器首先是一个反响代理服务器（参见[Tip #1][6]）——它接收来自互联网的流量，然后转发请求给另一个服务器。小戏法是负载均衡服务器支持两个或多个应用服务器，使用[分配算法][7]将请求转发给不同服务器。最简单的负载均衡方法是轮转法，只需要将新的请求发给列表里的下一个服务器。其它的方法包括将请求发给负载最小的活动连接。NGINX plus 拥有将特定用户的会话分配给同一个服务器的[能力][8].

负载均衡可以很好的提高性能是因为它可以避免某个服务器过载而另一些服务器却没有流量来处理。它也可以简单的扩展服务器规模，因为你可以添加多个价格相对便宜的服务器并且保证它们被充分利用了。

可以进行负载均衡的协议包括HTTP, HTTPS, SPDY, HTTP/2, WebSocket，[FastCGI][9],SCGI,uwsgi, memcached，以及集中其它的应用类型，包括采用TCP 第4层协议的程序。分析你的web 应用来决定那些你要使用以及那些地方的性能不足。

相同的服务器或服务器群可以被用来进行负载均衡，也可以用来处理其它的任务，如SSL 终止，提供对客户端使用的HTTP/1/x  和 HTTP/2 ，以及缓存静态文件。

NGINX 经常被用来进行负载均衡；要想了解更多的情况可以访问我们的[overview blog post][10], [configuration blog post][11], [ebook][12] 以及相关网站 [webinar][13], 和 [documentation][14]。我们的商业版本 [NGINX Plus][15] 支持更多优化了的负载均衡特性，如基于服务器响应时间的加载路由和Microsoft’s NTLM 协议上的负载均衡。

### Tip #3: 缓存静态和动态的内容 ###

缓存通过加速内容的传输速度来提高web 应用的性能。它可以采用一下集中策略：当需要的时候预处理要传输的内容，保存数据到速度更快的设备，把数据存储在距离客户端更近的位置，或者结合起来使用。

下面要考虑两种不同类型数据的缓冲：

- **静态内容缓存**。不经常变化的文件，比如图像(JPEG,PNG) 和代码(CSS,JavaScript)，可以保存在边缘服务器，这样就可以快速的从内存和磁盘上提取。
- **动态内容缓存**。很多web 应用回针对每个网页请求生成不同的HTML 页面。在短时间内简单的缓存每个生成HTML 内容，就可以很好的减少要生成的内容的数量，这完全可以达到你的要求。

举个例子，如果一个页面每秒会被浏览10次，你将它缓存1 秒，99%请求的页面都会直接从缓存提取。如果你将将数据分成静态内容，甚至新生成的页面可能都是由这些缓存构成的。

下面由是web 应用发明的三种主要的缓存技术：

- **缩短数据与用户的距离**。把一份内容的拷贝放的离用户更近点来减少传输时间。
- **提高内容服务器的速度**。内容可以保存在一个更快的服务器上来减少提取文件的时间。
- **从过载服务器拿走数据**。机器经常因为要完成某些其它的任务而造成某个任务的执行速度比测试结果要差。将数据缓存在不同的机器上可以提高缓存资源和非缓存资源的效率，而这知识因为主机没有被过度使用。

对web 应用的缓存机制可以web 应用服务器内部实现。第一，缓存动态内容是用来减少应用服务器加载动态内容的时间。然后，缓存静态内容（包括动态内容的临时拷贝）是为了更进一步的分担应用服务器的负载。而且缓存之后会从应用服务器转移到对用户而言更快、更近的机器，从而减少应用服务器的压力，减少提取数据和传输数据的时间。

改进过的缓存方案可以极大的提高应用的速度。对于大多数网页来说，静态数据，比如大图像文件，构成了超过一半的内容。如果没有缓存，那么这可能会花费几秒的时间来提取和传输这类数据，但是采用了缓存之后不到1秒就可以完成。

举一个在实际中缓存是如何使用的例子， NGINX 和NGINX Plus使用了两条指令来[设置缓存机制][16]：proxy_cache_path 和 proxy_cache。你可以指定缓存的位置和大小，文件在缓存中保存的最长时间和其他一些参数。使用第三条（而且是相当受欢迎的一条）指令，proxy_cache_use_stale，如果服务器提供新鲜内容是忙或者挂掉之类的信息，你甚至可以让缓存提供旧的内容，这样客户端就不会一无所得。从用户的角度来看这可以很好的提高你的网站或者应用的上线时间。

NGINX plus 拥有[高级缓存特性][17]，包括对[缓存清除][18]的支持和在[仪表盘][19]上显示缓存状态信息。

要想获得更多关于NGINX 的缓存机制的信息可以浏览NGINX Plus 管理员指南中的 [reference documentation][20] 和 [NGINX Content Caching][21] 。

**注意**：缓存机制分布于应用开发者、投资决策者以及实际的系统运维人员之间。本文提到的一些复杂的缓存机制从[DevOps 的角度][23]来看很具有价值，即对集应用开发者、架构师以及运维操作人员的功能为一体的工程师来说可以满足他们对站点功能性、响应时间、安全性和商业结果，如完成的交易数。

### Tip #4: 压缩数据 ###

压缩是一个具有很大潜力的提高性能的加速方法。现在已经有一些针对照片（JPEG 和PNG）、视频（MPEG-4）和音乐（MP3）等各类文件精心设计和高压缩率的标准。每一个标准都或多或少的减少了文件的大小。

文本数据 —— 包括HTML（包含了纯文本和HTL 标签），CSS和代码，比如Javascript —— 经常是未经压缩就传输的。压缩这类数据会在对应用程序性能的感觉上，特别是处于慢速或受限的移动网络的客户端，产生不成比例的影响。

这是因为文本数据经常是用户与网页交互的有效数据，而多媒体数据可能更多的是起提供支持或者装饰的作用。聪明的内容压缩可以减少HTML，Javascript，CSS和其他文本内容对贷款的要求，通常可以减少30% 甚至更多的带宽和相应的页面加载时间。

如果你是用SSL，压缩可以减少需要进行SSL 编码的的数据量，而这些编码操作会占用一些CPU时间而抵消了压缩数据减少的时间。

压缩文本数据的方法很多，举个例子，在定义小说文本压缩模式的[HTTP/2 部分]就专门为适应头数据。另一个例子是可以在NGINX 里打开使用GZIP 压缩文本。你在你的服务里[预压缩文本数据][25]之后，你就可以直接使用gzip_static 指令来处理压缩过的.gz 版本。

### Tip #5: 优化 SSL/TLS ###

安全套接字（[SSL][26]) 协议和它的继承者，传输层安全（TLS）协议正在被越来越多的网站采用。SSL/TLS 对从原始服务器发往用户的数据进行加密提高了网站的安全性。影响这个趋势的部分原因是Google 正在使用SSL/TLS，这在搜索引擎排名上是一个正面的影响因素。

尽管SSL/TLS 越来越流行，但是使用加密对速度的影响也让很多网站望而却步。SSL/TLS 之所以让网站变的更慢，原因有二：

1. 任何一个连接第一次连接时的握手过程都需要传递密钥。而采用HTTP/1.x 协议的浏览器在建立多个连接时会对每个连接重复上述操作。
2. 数据在传输过程中需要不断的在服务器加密、在客户端解密。

要鼓励使用SSL/TLS，HTTP/2 和SPDY（在[下一章][27]会描述）的作者设计新的协议来让浏览器只需要对一个浏览器会话使用一个连接。这会大大的减少上述两个原因中的一个浪费的时间。然而现在可以用来提高应用程序使用SSL/TLS 传输数据的性能的方法不止这些。

web 服务器有对应的机制优化SSL/TLS 传输。举个例子，NGINX 使用[OpenSSL][28]运行在普通的硬件上提供接近专用硬件的传输性能。NGINX [SSL 性能][29] 有详细的文档，而且把对SSL/TLS 数据进行加解密的时间和CPU 占用率降低了很多。

更进一步，在这篇[blog][30]有详细的说明如何提高SSL/TLS 性能，可以总结为一下几点：

- **会话缓冲**。使用指令[ssl_session_cache][31]可以缓存每个新的SSL/TLS 连接使用的参数。
- **会话票据或者ID**。把SSL/TLS 的信息保存在一个票据或者ID 里可以流畅的复用而不需要重新握手。
- **OCSP 分割**。通过缓存SSL/TLS 证书信息来减少握手时间。

NGINX 和NGINX Plus 可以被用作SSL/TLS 终结——处理客户端流量的加密和解密，而同时和其他服务器进行明文通信。使用[这几步][32] 来设置NGINX 和NGINX Plus 处理SSL/TLS 终止。同时，这里还有一些NGINX Plus 和接收TCP 连接的服务器一起使用时的[特有的步骤][33]

### Tip #6: 使用 HTTP/2 或 SPDY ###

For sites that already use SSL/TLS, HTTP/2 and SPDY are very likely to improve performance, because the single connection requires just one handshake. For sites that don’t yet use SSL/TLS, HTTP/2 and SPDY makes a move to SSL/TLS (which normally slows performance) a wash from a responsiveness point of view.
对于已经使用了SSL/TLS 的站点，HTTP/2 和SPDY 可以很好的提高性能，因为每个连接只需要一次握手。而对于没有使用SSL/TLS 的站点来说，HTTP/2 和SPDY会在响应速度上有些影响（通常会将度效率）。

Google introduced SPDY in 2012 as a way to achieve faster performance on top of HTTP/1.x. HTTP/2 is the recently approved IETF standard based on SPDY. SPDY is broadly supported, but is soon to be deprecated, replaced by HTTP/2.
Google 在2012年开始把SPDY 作为一个比HTTP/1.x 更快速的协议来推荐。HTTP/2 是目前IETF 标准，他也基于SPDY。SPDY 已经被广泛的支持了，但是很快就会被HTTP/2 替代。

The key feature of SPDY and HTTP/2 is the use of a single connection rather than multiple connections. The single connection is multiplexed, so it can carry pieces of multiple requests and responses at the same time.
SPDY 和HTTP/2 的关键是用单连接来替代多路连接。单个连接是被复用的，所以它可以同时携带多个请求和响应的分片。

By getting the most out of one connection, these protocols avoid the overhead of setting up and managing multiple connections, as required by the way browsers implement HTTP/1.x. The use of a single connection is especially helpful with SSL, because it minimizes the time-consuming handshaking that SSL/TLS needs to set up a secure connection.
通过使用一个连接这些协议可以避免过多的设置和管理多个连接，就像浏览器实现了HTTP/1.x 一样。单连接在对SSL 特别有效，这是因为它可以最小化SSL/TLS 建立安全链接时的握手时间。

The SPDY protocol required the use of SSL/TLS; HTTP/2 does not officially require it, but all browsers so far that support HTTP/2 use it only if SSL/TLS is enabled. That is, a browser that supports HTTP/2 uses it only if the website is using SSL and its server accepts HTTP/2 traffic. Otherwise, the browser communicates over HTTP/1.x.
SPDY 协议需要使用SSL/TLS， 而HTTP/2 官方并不需要，但是目前所有支持HTTP/2的浏览器只有在使能了SSL/TLS 的情况下才会使用它。这就意味着支持HTTP/2 的浏览器只有在网站使用了SSL 并且服务器接收HTTP/2 流量的情况下才会启用HTTP/2。否则的话浏览器就会使用HTTP/1.x 协议。

When you implement SPDY or HTTP/2, you no longer need typical HTTP performance optimizations such as domain sharding, resource merging, and image spriting. These changes make your code and deployments simpler and easier to manage. To learn more about the changes that HTTP/2 is bringing about, read our [white paper][34].
当你实现SPDY 或者HTTP/2时，你不再需要通常的HTTP 性能优化方案，比如域分隔资源聚合，以及图像登记。这些改变可以让你的代码和部署变得更简单和更易于管理。要了解HTTP/2 带来的这些变化可以浏览我们的[白皮书][34]。

![NGINX Supports SPDY and HTTP/2 for increased web application performance](https://www.nginx.com/wp-content/uploads/2015/10/http2-27.png)

As an example of support for these protocols, NGINX has supported SPDY from early on, and [most sites][35] that use SPDY today run on NGINX. NGINX is also [pioneering support][36] for HTTP/2, with [support][37] for HTTP/2 in NGINX open source and NGINX Plus as of September 2015.
作为支持这些协议的一个样例，NGINX 已经从一开始就支持了SPDY，而且[大部分使用SPDY 协议的网站][35]都运行的是NGINX。NGINX 同时也[很早][36]对HTTP/2 的提供了支持,从2015 年9月开始开源NGINX 和NGINX Plus 就[支持][37]它了。

Over time, we at NGINX expect most sites to fully enable SSL and to move to HTTP/2. This will lead to increased security and, as new optimizations are found and implemented, simpler code that performs better.
经过一段时间，我们NGINX 希望更多的站点完全是能SSL 并且向HTTP/2 迁移。这将会提高安全性，同时新的优化手段也会被发现和实现，更简单的代码表现的更加优异。

### Tip #7: 升级软件版本 ###

One simple way to boost application performance is to select components for your software stack based on their reputation for stability and performance. In addition, because developers of high-quality components are likely to pursue performance enhancements and fix bugs over time, it pays to use the latest stable version of software. New releases receive more attention from developers and the user community. Newer builds also take advantage of new compiler optimizations, including tuning for new hardware.
一个提高应用性能的简单办法是根据软件的稳定性和性能的评价来选在你的软件栈。进一步说，因为高性能组件的开发者更愿意追求更高的性能和解决bug ，所以值得使用最新版本的软件。新版本往往更受开发者和用户社区的关注。更新的版本往往会利用到新的编译器优化，包括对新硬件的调优。

Stable new releases are typically more compatible and higher-performing than older releases. It’s also easier to keep on top of tuning optimizations, bug fixes, and security alerts when you stay on top of software updates.
稳定的新版本通常比旧版本具有更好的兼容性和更高的性能。一直进行软件更新，可以非常简单的保持软件保持最佳的优化，解决掉bug，以及安全性的提高。

Staying with older software can also prevent you from taking advantage of new capabilities. For example, HTTP/2, described above, currently requires OpenSSL 1.0.1. Starting in mid-2016, HTTP/2 will require OpenSSL 1.0.2, which was released in January 2015.
一直使用旧版软件也会组织你利用新的特性。比如上面说到的HTTP/2，目前要求OpenSSL 1.0.1.在2016 年中期开始将会要求1.0.2 ，而这是在2015年1月才发布的。

NGINX users can start by moving to the [[latest version of the NGINX open source software][38] or [NGINX Plus][39]; they include new capabilities such as socket sharding and thread pools (see below), and both are constantly being tuned for performance. Then look at the software deeper in your stack and move to the most recent version wherever you can.
NGINX 用户可以开始迁移到[NGINX 最新的开源软件][38] 或者[NGINX Plus][39];他们都包含了罪行的能力，如socket分区和线程池（见下文），这些都已经为性能优化过了。然后好好看看的你软件栈，把他们升级到你能能升级道德最新版本吧。

### Tip #8: linux 系统性能调优 ###

Linux is the underlying operating system for most web server implementations today, and as the foundation of your infrastructure, Linux represents a significant opportunity to improve performance. By default, many Linux systems are conservatively tuned to use few resources and to match a typical desktop workload. This means that web application use cases require at least some degree of tuning for maximum performance.

Linux optimizations are web server-specific. Using NGINX as an example, here are a few highlights of changes you can consider to speed up Linux:

- **Backlog queue**. If you have connections that appear to be stalling, consider increasing net.core.somaxconn, the maximum number of connections that can be queued awaiting attention from NGINX. You will see error messages if the existing connection limit is too small, and you can gradually increase this parameter until the error messages stop.
- **File descriptors**. NGINX uses up to two file descriptors for each connection. If your system is serving a lot of connections, you might need to increase sys.fs.file_max, the system-wide limit for file descriptors, and nofile, the user file descriptor limit, to support the increased load.
- **Ephemeral ports**. When used as a proxy, NGINX creates temporary (“ephemeral”) ports for each upstream server. You can increase the range of port values, set by net.ipv4.ip_local_port_range, to increase the number of ports available. You can also reduce the timeout before an inactive port gets reused with the net.ipv4.tcp_fin_timeout setting, allowing for faster turnover.

For NGINX, check out the [NGINX performance tuning guides][40] to learn how to optimize your Linux system so that it can cope with large volumes of network traffic without breaking a sweat!

### Tip #9: web 服务器性能调优 ###

Whatever web server you use, you need to tune it for web application performance. The following recommendations apply generally to any web server, but specific settings are given for NGINX. Key optimizations include:

- **Access logging**. Instead of writing a log entry for every request to disk immediately, you can buffer entries in memory and write them to disk as a group. For NGINX, add the *buffer=size* parameter to the *access_log* directive to write log entries to disk when the memory buffer fills up. If you add the **flush=time** parameter, the buffer contents are also be written to disk after the specified amount of time.
- **Buffering**. Buffering holds part of a response in memory until the buffer fills, which can make communications with the client more efficient. Responses that don’t fit in memory are written to disk, which can slow performance. When NGINX buffering is [on][42], you use the *proxy_buffer_size* and *proxy_buffers* directives to manage it.
- **Client keepalives**. Keepalive connections reduce overhead, especially when SSL/TLS is in use. For NGINX, you can increase the maximum number of *keepalive_requests* a client can make over a given connection from the default of 100, and you can increase the *keepalive_timeout* to allow the keepalive connection to stay open longer, resulting in faster subsequent requests.
- **Upstream keepalives**. Upstream connections – connections to application servers, database servers, and so on – benefit from keepalive connections as well. For upstream connections, you can increase *keepalive*, the number of idle keepalive connections that remain open for each worker process. This allows for increased connection reuse, cutting down on the need to open brand new connections. For more information about keepalives, refer to this [blog post][41].
- **Limits**. Limiting the resources that clients use can improve performance and security. For NGINX,the *limit_conn* and *limit_conn_zone* directives restrict the number of connections from a given source, while *limit_rate* constrains bandwidth. These settings can stop a legitimate user from “hogging” resources and also help prevent against attacks. The *limit_req* and *limit_req_zone* directives limit client requests. For connections to upstream servers, use the max_conns parameter to the server directive in an upstream configuration block. This limits connections to an upstream server, preventing overloading. The associated queue directive creates a queue that holds a specified number of requests for a specified length of time after the *max_conns* limit is reached.
- **Worker processes**. Worker processes are responsible for the processing of requests. NGINX employs an event-based model and OS-dependent mechanisms to efficiently distribute requests among worker processes. The recommendation is to set the value of *worker_processes* to one per CPU. The maximum number of worker_connections (512 by default) can safely be raised on most systems if needed; experiment to find the value that works best for your system.
- **Socket sharding**. Typically, a single socket listener distributes new connections to all worker processes. Socket sharding creates a socket listener for each worker process, with the kernel assigning connections to socket listeners as they become available. This can reduce lock contention and improve performance on multicore systems. To enable [socket sharding][43], include the reuseport parameter on the listen directive.
- **Thread pools**. Any computer process can be held up by a single, slow operation. For web server software, disk access can hold up many faster operations, such as calculating or copying information in memory. When a thread pool is used, the slow operation is assigned to a separate set of tasks, while the main processing loop keeps running faster operations. When the disk operation completes, the results go back into the main processing loop. In NGINX, two operations – the read() system call and sendfile() – are offloaded to [thread pools][44].

![Thread pools help increase application performance by assigning a slow operation to a separate set of tasks](https://www.nginx.com/wp-content/uploads/2015/10/Graph-17.png)

**Tip**. When changing settings for any operating system or supporting service, change a single setting at a time, then test performance. If the change causes problems, or if it doesn’t make your site run faster, change it back.

See this [blog post][45] for more details on tuning NGINX.

### Tip #10: 监视系统活动来解决问题和瓶颈 ###

The key to a high-performance approach to application development and delivery is watching your application’s real-world performance closely and in real time. You must be able to monitor activity within specific devices and across your web infrastructure.

Monitoring site activity is mostly passive – it tells you what’s going on, and leaves it to you to spot problems and fix them.

Monitoring can catch several different kinds of issues. They include:

- A server is down.
- A server is limping, dropping connections.
- A server is suffering from a high proportion of cache misses.
- A server is not sending correct content.

A global application performance monitoring tool like New Relic or Dynatrace helps you monitor page load time from remote locations, while NGINX helps you monitor the application delivery side. Application performance data tells you when your optimizations are making a real difference to your users, and when you need to consider adding capacity to your infrastructure to sustain the traffic.

To help identify and resolve issues quickly, NGINX Plus adds [application-aware health checks][46] – synthetic transactions that are repeated regularly and are used to alert you to problems. NGINX Plus also has [session draining][47], which stops new connections while existing tasks complete, and a slow start capability, allowing a recovered server to come up to speed within a load-balanced group. When used effectively, health checks allow you to identify issues before they significantly impact the user experience, while session draining and slow start allow you to replace servers and ensure the process does not negatively affect perceived performance or uptime. The figure shows the built-in NGINX Plus [live activity monitoring][48] dashboard for a web infrastructure with servers, TCP connections, and caching.

![Use real-time application performance monitoring tools to identify and resolve issues quickly](https://www.nginx.com/wp-content/uploads/2015/10/Screen-Shot-2015-10-05-at-4.16.32-PM.png)

### Conclusion: Seeing 10x Performance Improvement ###

The performance improvements that are available for any one web application vary tremendously, and actual gains depend on your budget, the time you can invest, and gaps in your existing implementation. So, how might you achieve 10x performance improvement for your own applications?

To help guide you on the potential impact of each optimization, here are pointers to the improvement that may be possible with each tip detailed above, though your mileage will almost certainly vary:

- **Reverse proxy server and load balancing**. No load balancing, or poor load balancing, can cause episodes of very poor performance. Adding a reverse proxy server, such as NGINX, can prevent web applications from thrashing between memory and disk. Load balancing can move processing from overburdened servers to available ones and make scaling easy. These changes can result in dramatic performance improvement, with a 10x improvement easily achieved compared to the worst moments for your current implementation, and lesser but substantial achievements available for overall performance.
- **Caching dynamic and static content**. If you have an overburdened web server that’s doubling as your application server, 10x improvements in peak-time performance can be achieved by caching dynamic content alone. Caching for static files can improve performance by single-digit multiples as well.
- **Compressing data**. Using media file compression such as JPEG for photos, PNG for graphics, MPEG-4 for movies, and MP3 for music files can greatly improve performance. Once these are all in use, then compressing text data (code and HTML) can improve initial page load times by a factor of two.
- **Optimizing SSL/TLS**. Secure handshakes can have a big impact on performance, so optimizing them can lead to perhaps a 2x improvement in initial responsiveness, particularly for text-heavy sites. Optimizing media file transmission under SSL/TLS is likely to yield only small performance improvements.
- **Implementing HTTP/2 and SPDY**. When used with SSL/TLS, these protocols are likely to result in incremental improvements for overall site performance.
- **Tuning Linux and web server software (such as NGINX)**. Fixes such as optimizing buffering, using keepalive connections, and offloading time-intensive tasks to a separate thread pool can significantly boost performance; thread pools, for instance, can speed disk-intensive tasks by [nearly an order of magnitude][49].

We hope you try out these techniques for yourself. We want to hear the kind of application performance improvements you’re able to achieve. Share your results in the comments below, or tweet your story with the hash tags #NGINX and #webperf!

### Resources for Internet Statistics ###

[Statista.com – Share of the internet economy in the gross domestic product in G-20 countries in 2016][50]

[Load Impact – How Bad Performance Impacts Ecommerce Sales][51]

[Kissmetrics – How Loading Time Affects Your Bottom Line (infographic)][52]

[Econsultancy – Site speed: case studies, tips and tools for improving your conversion rate][53]

--------------------------------------------------------------------------------

via: https://www.nginx.com/blog/10-tips-for-10x-application-performance/?hmsr=toutiao.io&utm_medium=toutiao.io&utm_source=toutiao.io

作者：[Floyd Smith][a]
译者：[Ezio]](https://github.com/oska874)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.nginx.com/blog/author/floyd/
[1]:https://www.nginx.com/resources/glossary/reverse-proxy-server
[2]:https://www.nginx.com/blog/10-tips-for-10x-application-performance/?hmsr=toutiao.io&utm_medium=toutiao.io&utm_source=toutiao.io#tip2
[3]:https://www.nginx.com/blog/10-tips-for-10x-application-performance/?hmsr=toutiao.io&utm_medium=toutiao.io&utm_source=toutiao.io#tip3
[4]:https://www.nginx.com/products/application-health-checks/
[5]:https://www.nginx.com/solutions/load-balancing/
[6]:https://www.nginx.com/blog/10-tips-for-10x-application-performance/?hmsr=toutiao.io&utm_medium=toutiao.io&utm_source=toutiao.io#tip1
[7]:https://www.nginx.com/resources/admin-guide/load-balancer/
[8]:https://www.nginx.com/blog/load-balancing-with-nginx-plus/
[9]:https://www.digitalocean.com/community/tutorials/understanding-and-implementing-fastcgi-proxying-in-nginx
[10]:https://www.nginx.com/blog/five-reasons-use-software-load-balancer/
[11]:https://www.nginx.com/blog/load-balancing-with-nginx-plus/
[12]:https://www.nginx.com/resources/ebook/five-reasons-choose-software-load-balancer/
[13]:https://www.nginx.com/resources/webinars/choose-software-based-load-balancer-45-min/
[14]:https://www.nginx.com/resources/admin-guide/load-balancer/
[15]:https://www.nginx.com/products/
[16]:https://www.nginx.com/blog/nginx-caching-guide/
[17]:https://www.nginx.com/products/content-caching-nginx-plus/
[18]:http://nginx.org/en/docs/http/ngx_http_proxy_module.html?&_ga=1.95342300.1348073562.1438712874#proxy_cache_purge
[19]:https://www.nginx.com/products/live-activity-monitoring/
[20]:http://nginx.org/en/docs/http/ngx_http_proxy_module.html?&&&_ga=1.61156076.1348073562.1438712874#proxy_cache
[21]:https://www.nginx.com/resources/admin-guide/content-caching
[22]:https://www.nginx.com/blog/network-vs-devops-how-to-manage-your-control-issues/
[23]:https://www.nginx.com/blog/10-tips-for-10x-application-performance/?hmsr=toutiao.io&utm_medium=toutiao.io&utm_source=toutiao.io#tip6
[24]:https://www.nginx.com/resources/admin-guide/compression-and-decompression/
[25]:http://nginx.org/en/docs/http/ngx_http_gzip_static_module.html
[26]:https://www.digicert.com/ssl.htm
[27]:https://www.nginx.com/blog/10-tips-for-10x-application-performance/?hmsr=toutiao.io&utm_medium=toutiao.io&utm_source=toutiao.io#tip6
[28]:http://openssl.org/
[29]:https://www.nginx.com/blog/nginx-ssl-performance/
[30]:https://www.nginx.com/blog/improve-seo-https-nginx/
[31]:http://nginx.org/en/docs/http/ngx_http_ssl_module.html#ssl_session_cache
[32]:https://www.nginx.com/resources/admin-guide/nginx-ssl-termination/
[33]:https://www.nginx.com/resources/admin-guide/nginx-tcp-ssl-termination/
[34]:https://www.nginx.com/resources/datasheet/datasheet-nginx-http2-whitepaper/
[35]:http://w3techs.com/blog/entry/25_percent_of_the_web_runs_nginx_including_46_6_percent_of_the_top_10000_sites
[36]:https://www.nginx.com/blog/how-nginx-plans-to-support-http2/
[37]:https://www.nginx.com/blog/nginx-plus-r7-released/
[38]:http://nginx.org/en/download.html
[39]:https://www.nginx.com/products/
[40]:https://www.nginx.com/blog/tuning-nginx/
[41]:https://www.nginx.com/blog/http-keepalives-and-web-performance/
[42]:http://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_buffering
[43]:https://www.nginx.com/blog/socket-sharding-nginx-release-1-9-1/
[44]:https://www.nginx.com/blog/thread-pools-boost-performance-9x/
[45]:https://www.nginx.com/blog/tuning-nginx/
[46]:https://www.nginx.com/products/application-health-checks/
[47]:https://www.nginx.com/products/session-persistence/#session-draining
[48]:https://www.nginx.com/products/live-activity-monitoring/
[49]:https://www.nginx.com/blog/thread-pools-boost-performance-9x/
[50]:http://www.statista.com/statistics/250703/forecast-of-internet-economy-as-percentage-of-gdp-in-g-20-countries/
[51]:http://blog.loadimpact.com/blog/how-bad-performance-impacts-ecommerce-sales-part-i/
[52]:https://blog.kissmetrics.com/loading-time/?wide=1
[53]:https://econsultancy.com/blog/10936-site-speed-case-studies-tips-and-tools-for-improving-your-conversion-rate/
