10 Tips for 10x Application Performance

将程序性能提高十倍的10条建议
================================================================================
Improving web application performance is more critical than ever. The share of economic activity that’s online is growing; more than 5% of the developed world’s economy is now on the Internet (see Resources below for statistics). And our always-on, hyper-connected modern world means that user expectations are higher than ever. If your site does not respond instantly, or if your app does not work without delay, users quickly move on to your competitors.
提高web 应用的性能从来没有比现在更关键过。网络经济的比重一直在增长；全球经济超过5% 的价值是在因特网上产生的（数据参见下面的资料）。我们的永远在线、超级连接的世界意味着用户的期望值也处于历史上的最高点。如果你的网站不能及时的响应，或者你的app 不能无延时的工作，用户会很快的投奔到你的竞争对手那里。

For example, a study done by Amazon almost 10 years ago proved that, even then, a 100-millisecond decrease in page-loading time translated to a 1% increase in its revenue. Another recent study highlighted the fact that that more than half of site owners surveyed said they lost revenue or customers due to poor application performance.
举一个例子，一份亚马逊十年前做过的研究可以证明，甚至在那个时候，网页加载时间每减少100毫秒，收入就会增加1%。另一个最近的研究特别强调一个事实，即超过一半的网站拥有着在调查中说他们会因为应用程序性能的问题流失用户。

How fast does a website need to be? For each second a page takes to load, about 4% of users abandon it. Top e-commerce sites offer a time to first interaction ranging from one to three seconds, which offers the highest conversion rate. It’s clear that the stakes for web application performance are high and likely to grow.
网站到底需要多块呢？对于页面加载，每增加1秒钟就有4%的用户放弃使用。顶级的电子商务站点的页面在第一次交互时可以做到1秒到3秒加载时间，而这是提供最高舒适度的速度。很明显这种利害关系对于web 应用来说很高，而且在不断的增加。

Wanting to improve performance is easy, but actually seeing results is difficult. To help you on your journey, this blog post offers you ten tips to help you increase your website performance by as much as 10x. It’s the first in a series detailing how you can increase your application performance with the help of some well-tested optimization techniques, and with a little support from NGINX. This series also outlines potential improvements in security that you can gain along the way.
想要提高效率很简单，但是看到实际结果很难。要在旅途上帮助你，这篇blog 会给你提供10条最高可以10倍的提升网站性能的建议。这是系列介绍提高应用程序性能的第一篇文章，包括测试充分的优化技术和一点NGIX 的帮助。这个系列给出了潜在的提高安全性的帮助。

### Tip #1: 通过反向代理来提高性能和增加安全性 ###

If your web application runs on a single machine, the solution to performance problems might seem obvious: just get a faster machine, with more processor, more RAM, a fast disk array, and so on. Then the new machine can run your WordPress server, Node.js application, Java application, etc., faster than before. (If your application accesses a database server, the solution might still seem simple: get two faster machines, and a faster connection between them.)
如果你的web 应用运行在单个机器上，那么这个办法会明显的提升性能：只需要添加一个更快的机器，更好的处理器，更多的内存，更快的磁盘阵列，等等。然后新机器就可以更快的运行你的WordPress 服务器, Node.js 程序, Java 程序，以及其它程序。（如果你的程序要访问数据库服务器，那么这个办法还是很简单：添加两个更快的机器，以及在两台电脑之间使用一个更快的链路。）

Trouble is, machine speed might not be the problem. Web applications often run slowly because the computer is switching among different kinds of tasks: interacting with users on thousands of connections, accessing files from disk, and running application code, among others. The application server may be thrashing – running out of memory, swapping chunks of memory out to disk, and making many requests wait on a single task such as disk I/O.
问题是，机器速度可能并不是问题。web 程序运行慢经常是因为计算机一直在不同的任务之间切换：和用户的成千上万的连接，从磁盘访问文件，运行代码，等等。应用服务器可能会抖动-内存不足，将内存数据写会磁盘，以及多个请求等待一个任务完成，如磁盘I/O。

Instead of upgrading your hardware, you can take an entirely different approach: adding a reverse proxy server to offload some of these tasks. A [reverse proxy server][1] sits in front of the machine running the application and handles Internet traffic. Only the reverse proxy server is connected directly to the Internet; communication with the application servers is over a fast internal network.
你可以采取一个完全不同的方案来替代升级硬件：添加一个反向代理服务器来分担部分任务。[反向代理服务器][1] 位于运行应用的机器的前端，是用来处理网络流量的。只有反向代理服务器是直接连接到互联网的；和程序的通讯都是通过一个快速的内部网络完成的。

Using a reverse proxy server frees the application server from having to wait for users to interact with the web app and lets it concentrate on building pages for the reverse proxy server to send across the Internet. The application server, which no longer has to wait for client responses, can run at speeds close to those achieved in optimized benchmarks.
使用反向代理服务器可以将应用服务器从等待用户与web 程序交互解放出来，这样应用服务器就可以专注于为反向代理服务器构建网页，让其能够传输到互联网上。而应用服务器就不需要在能带客户端的响应，可以运行与接近优化过的性能水平。

Adding a reverse proxy server also adds flexibility to your web server setup. For instance, if a server of a given type is overloaded, another server of the same type can easily be added; if a server is down, it can easily be replaced.
添加方向代理服务器还可以给你的web 服务器安装带来灵活性。比如，一个已知类型的服务器已经超载了，那么就可以轻松的添加另一个相同的服务器；如果某个机器宕机了，也可以很容易的被替代。

Because of the flexibility it provides, a reverse proxy server is also a prerequisite for many other performance-boosting capabilities, such as:
因为反向代理带来的灵活性，所以方向代理也是一些性能加速功能的必要前提，比如：

- **负载均衡** (参见 [Tip #2][2]) – 负载均衡运行在方向代理服务器上，用来将流量均衡分配给一批应用。有了合适的负载均衡，你就可以在不改变程序的前提下添加应用服务器。

- A load balancer runs on a reverse proxy server to share traffic evenly across a number of application servers. With a load balancer in place, you can add application servers without changing your application at all.

- **缓存静态文件** (参见 [Tip #3][3]) – 直接读取的文件，比如图像或者代码，可以保存在方向代理服务器，然后直接发给客户端，这样就可以提高速度、分担应用服务器的负载，可以让应用运行的更快

Files that are requested directly, such as image files or code files, can be stored on the reverse proxy server and sent directly to the client, which serves assets more quickly and offloads the application server, allowing the application to run faster.

- **网站安全** – 反响代理服务器可以提高网站安全性，以及快速的发现和响应攻击，保证应用服务器处于被保护状态。
The reverse proxy server can be configured for high security and monitored for fast recognition and response to attacks, keeping the application servers protected.

NGINX software is specifically designed for use as a reverse proxy server, with the additional capabilities described above. NGINX uses an event-driven processing approach which is more efficient than traditional servers. NGINX Plus adds more advanced reverse proxy features, such as application [health checks][4], specialized request routing, advanced caching, and support.
NGINX 软件是一个专门设计的反响代理服务器，也包含了上述的多种功能。NGINX 使用事件驱动的方式处理问题，着回避传统的服务器更加有效率。NGINX plus 天价了更多高级的反向代理特性，比如程序[健康度检查][4]，专门用来处理request 路由，高级缓冲和相关支持。

![NGINX Worker Process helps increase application performance](https://www.nginx.com/wp-content/uploads/2015/10/Graph-11.png)

### Tip #2: 添加负载平衡 ###

Adding a [load balancer][5] is a relatively easy change which can create a dramatic improvement in the performance and security of your site. Instead of making a core web server bigger and more powerful, you use a load balancer to distribute traffic across a number of servers. Even if an application is poorly written, or has problems with scaling, a load balancer can improve the user experience without any other changes.

A load balancer is, first, a reverse proxy server (see [Tip #1][6]) – it receives Internet traffic and forwards requests to another server. The trick is that the load balancer supports two or more application servers, using [a choice of algorithms][7] to split requests between servers. The simplest load balancing approach is round robin, with each new request sent to the next server on the list. Other methods include sending requests to the server with the fewest active connections. NGINX Plus has [capabilities][8] for continuing a given user session on the same server, which is called session persistence.

Load balancers can lead to strong improvements in performance because they prevent one server from being overloaded while other servers wait for traffic. They also make it easy to expand your web server capacity, as you can add relatively low-cost servers and be sure they’ll be put to full use.

Protocols that can be load balanced include HTTP, HTTPS, SPDY, HTTP/2, WebSocket, [FastCGI][9], SCGI, uwsgi, memcached, and several other application types, including TCP-based applications and other Layer 4 protocols. Analyze your web applications to determine which you use and where performance is lagging.

The same server or servers used for load balancing can also handle several other tasks, such as SSL termination, support for HTTP/1/x and HTTP/2 use by clients, and caching for static files.

NGINX is often used for load balancing; to learn more, please see our [overview blog post][10], [configuration blog post][11], [ebook][12] and associated [webinar][13], and [documentation][14]. Our commercial version, [NGINX Plus][15], supports more specialized load balancing features such as load routing based on server response time and the ability to load balance on Microsoft’s NTLM protocol.

### Tip #3: 缓存静态和动态的内容 ###

Caching improves web application performance by delivering content to clients faster. Caching can involve several strategies: preprocessing content for fast delivery when needed, storing content on faster devices, storing content closer to the client, or a combination.

There are two different types of caching to consider:

- **Caching of static content**. Infrequently changing files, such as image files (JPEG, PNG) and code files (CSS, JavaScript), can be stored on an edge server for fast retrieval from memory or disk.
- **Caching of dynamic content**. Many Web applications generate fresh HTML for each page request. By briefly caching one copy of the generated HTML for a brief period of time, you can dramatically reduce the total number of pages that have to be generated while still delivering content that’s fresh enough to meet your requirements.

If a page gets ten views per second, for instance, and you cache it for one second, 90% of requests for the page will come from the cache. If you separately cache static content, even the freshly generated versions of the page might be made up largely of cached content.

There are three main techniques for caching content generated by web applications:

- **Moving content closer to users**. Keeping a copy of content closer to the user reduces its transmission time.
- **Moving content to faster machines**. Content can be kept on a faster machine for faster retrieval.
- **Moving content off of overused machines**. Machines sometimes operate much slower than their benchmark performance on a particular task because they are busy with other tasks. Caching on a different machine improves performance for the cached resources and also for non-cached resources, because the host machine is less overloaded.

Caching for web applications can be implemented from the inside – the web application server – out. First, caching is used for dynamic content, to reduce the load on application servers. Then, caching is used for static content (including temporary copies of what would otherwise be dynamic content), further off-loading application servers. And caching is then moved off of application servers and onto machines that are faster and/or closer to the user, unburdening the application servers, and reducing retrieval and transmission times.

Improved caching can speed up applications tremendously. For many web pages, static data, such as large image files, makes up more than half the content. It might take several seconds to retrieve and transmit such data without caching, but only fractions of a second if the data is cached locally.

As an example of how caching is used in practice, NGINX and NGINX Plus use two directives to [set up caching][16]: proxy_cache_path and proxy_cache. You specify the cache location and size, the maximum time files are kept in the cache, and other parameters. Using a third (and quite popular) directive, proxy_cache_use_stale, you can even direct the cache to supply stale content when the server that supplies fresh content is busy or down, giving the client something rather than nothing. From the user’s perspective, this may strongly improves your site or application’s uptime.

NGINX Plus has [advanced caching features][17], including support for [cache purging][18] and visualization of cache status on a [dashboard][19] for live activity monitoring.

For more information on caching with NGINX, see the [reference documentation][20] and [NGINX Content Caching][21] in the NGINX Plus Admin Guide.

**Note**: Caching crosses organizational lines between people who develop applications, people who make capital investment decisions, and people who run networks in real time. Sophisticated caching strategies, like those alluded to here, are a good example of the value of a [DevOps perspective][22], in which application developer, architectural, and operations perspectives are merged to help meet goals for site functionality, response time, security, and business results, )such as completed transactions or sales.

### Tip #4: 压缩数据 ###

Compression is a huge potential performance accelerator. There are carefully engineered and highly effective compression standards for photos (JPEG and PNG), videos (MPEG-4), and music (MP3), among others. Each of these standards reduces file size by an order of magnitude or more.

Text data – including HTML (which includes plain text and HTML tags), CSS, and code such as JavaScript – is often transmitted uncompressed. Compressing this data can have a disproportionate impact on perceived web application performance, especially for clients with slow or constrained mobile connections.

That’s because text data is often sufficient for a user to interact with a page, where multimedia data may be more supportive or decorative. Smart content compression can reduce the bandwidth requirements of HTML, Javascript, CSS and other text-based content, typically by 30% or more, with a corresponding reduction in load time.

If you use SSL, compression reduces the amount of data that has to be SSL-encoded, which offsets some of the CPU time it takes to compress the data.

Methods for compressing text data vary. For example, see the [section on HTTP/2][23] for a novel text compression scheme, adapted specifically for header data. As another example of text compression you can [turn on][24] GZIP compression in NGINX. After you [pre-compress text data][25] on your services, you can serve the compressed .gz version directly using the gzip_static directive.

### Tip #5: 优化 SSL/TLS ###

The Secure Sockets Layer ([SSL][26]) protocol and its successor, the Transport Layer Security (TLS) protocol, are being used on more and more websites. SSL/TLS encrypts the data transported from origin servers to users to help improve site security. Part of what may be influencing this trend is that Google now uses the presence of SSL/TLS as a positive influence on search engine rankings.

Despite rising popularity, the performance hit involved in SSL/TLS is a sticking point for many sites. SSL/TLS slows website performance for two reasons:

1. The initial handshake required to establish encryption keys whenever a new connection is opened. The way that browsers using HTTP/1.x establish multiple connections per server multiplies that hit.
1. Ongoing overhead from encrypting data on the server and decrypting it on the client.

To encourage the use of SSL/TLS, the authors of HTTP/2 and SPDY (described in the [next section][27]) designed these protocols so that browsers need just one connection per browser session. This greatly reduces one of the two major sources of SSL overhead. However, even more can be done today to improve the performance of applications delivered over SSL/TLS.

The mechanism for optimizing SSL/TLS varies by web server. As an example, NGINX uses [OpenSSL][28], running on standard commodity hardware, to provide performance similar to dedicated hardware solutions. NGINX [SSL performance][29] is well-documented and minimizes the time and CPU penalty from performing SSL/TLS encryption and decryption.

In addition, see [this blog post][30] for details on ways to increase SSL/TLS performance. To summarize briefly, the techniques are:

- **Session caching**. Uses the [ssl_session_cache][31] directive to cache the parameters used when securing each new connection with SSL/TLS.
- **Session tickets or IDs**. These store information about specific SSL/TLS sessions in a ticket or ID so a connection can be reused smoothly, without new handshaking.
- **OCSP stapling**. Cuts handshaking time by caching SSL/TLS certificate information.

NGINX and NGINX Plus can be used for SSL/TLS termination – handling encryption and decyption for client traffic, while communicating with other servers in clear text. Use [these steps][32] to set up NGINX or NGINX Plus to handle SSL/TLS termination. Also, here are [specific steps][33] for NGINX Plus when used with servers that accept TCP connections.

### Tip #6: 使用 HTTP/2 或 SPDY ###

For sites that already use SSL/TLS, HTTP/2 and SPDY are very likely to improve performance, because the single connection requires just one handshake. For sites that don’t yet use SSL/TLS, HTTP/2 and SPDY makes a move to SSL/TLS (which normally slows performance) a wash from a responsiveness point of view.

Google introduced SPDY in 2012 as a way to achieve faster performance on top of HTTP/1.x. HTTP/2 is the recently approved IETF standard based on SPDY. SPDY is broadly supported, but is soon to be deprecated, replaced by HTTP/2.

The key feature of SPDY and HTTP/2 is the use of a single connection rather than multiple connections. The single connection is multiplexed, so it can carry pieces of multiple requests and responses at the same time.

By getting the most out of one connection, these protocols avoid the overhead of setting up and managing multiple connections, as required by the way browsers implement HTTP/1.x. The use of a single connection is especially helpful with SSL, because it minimizes the time-consuming handshaking that SSL/TLS needs to set up a secure connection.

The SPDY protocol required the use of SSL/TLS; HTTP/2 does not officially require it, but all browsers so far that support HTTP/2 use it only if SSL/TLS is enabled. That is, a browser that supports HTTP/2 uses it only if the website is using SSL and its server accepts HTTP/2 traffic. Otherwise, the browser communicates over HTTP/1.x.

When you implement SPDY or HTTP/2, you no longer need typical HTTP performance optimizations such as domain sharding, resource merging, and image spriting. These changes make your code and deployments simpler and easier to manage. To learn more about the changes that HTTP/2 is bringing about, read our [white paper][34].

![NGINX Supports SPDY and HTTP/2 for increased web application performance](https://www.nginx.com/wp-content/uploads/2015/10/http2-27.png)

As an example of support for these protocols, NGINX has supported SPDY from early on, and [most sites][35] that use SPDY today run on NGINX. NGINX is also [pioneering support][36] for HTTP/2, with [support][37] for HTTP/2 in NGINX open source and NGINX Plus as of September 2015.

Over time, we at NGINX expect most sites to fully enable SSL and to move to HTTP/2. This will lead to increased security and, as new optimizations are found and implemented, simpler code that performs better.

### Tip #7: 升级软件版本 ###

One simple way to boost application performance is to select components for your software stack based on their reputation for stability and performance. In addition, because developers of high-quality components are likely to pursue performance enhancements and fix bugs over time, it pays to use the latest stable version of software. New releases receive more attention from developers and the user community. Newer builds also take advantage of new compiler optimizations, including tuning for new hardware.

Stable new releases are typically more compatible and higher-performing than older releases. It’s also easier to keep on top of tuning optimizations, bug fixes, and security alerts when you stay on top of software updates.

Staying with older software can also prevent you from taking advantage of new capabilities. For example, HTTP/2, described above, currently requires OpenSSL 1.0.1. Starting in mid-2016, HTTP/2 will require OpenSSL 1.0.2, which was released in January 2015.

NGINX users can start by moving to the [[latest version of the NGINX open source software][38] or [NGINX Plus][39]; they include new capabilities such as socket sharding and thread pools (see below), and both are constantly being tuned for performance. Then look at the software deeper in your stack and move to the most recent version wherever you can.

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
