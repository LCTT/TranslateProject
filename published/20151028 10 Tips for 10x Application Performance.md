将程序性能提高十倍的10条建议
================================================================================

提高 web 应用的性能从来没有比现在更重要过。网络经济的比重一直在增长；全球经济超过 5% 的价值是在因特网上产生的（数据参见下面的资料）。这个时刻在线的超连接世界意味着用户对其的期望值也处于历史上的最高点。如果你的网站不能及时的响应，或者你的 app 不能无延时的工作，用户会很快的投奔到你的竞争对手那里。

举一个例子，一份亚马逊十年前做过的研究可以证明，甚至在那个时候，网页加载时间每减少100毫秒，收入就会增加1%。另一个最近的研究特别强调一个事实，即超过一半的网站拥有者在调查中承认它们会因为应用程序性能的问题流失用户。

网站到底需要多快呢？对于页面加载，每增加1秒钟就有4%的用户放弃使用。顶级的电子商务站点的页面在第一次交互时可以做到1秒到3秒加载时间，而这是提供最高舒适度的速度。很明显这种利害关系对于 web 应用来说很高，而且在不断的增加。

想要提高效率很简单，但是看到实际结果很难。为了在你的探索之旅上帮助到你，这篇文章会给你提供10条最高可以提升10倍网站性能的建议。这是系列介绍提高应用程序性能的第一篇文章，包括充分测试的优化技术和一点 NGINX 的帮助。这个系列也给出了潜在的提高安全性的帮助。

### Tip #1: 通过反向代理来提高性能和增加安全性 ###

如果你的 web 应用运行在单个机器上，那么这个办法会明显的提升性能：只需要换一个更快的机器，更好的处理器，更多的内存，更快的磁盘阵列，等等。然后新机器就可以更快的运行你的 WordPress 服务器, Node.js 程序, Java 程序，以及其它程序。（如果你的程序要访问数据库服务器，那么解决方法依然很简单：添加两个更快的机器，以及在两台电脑之间使用一个更快的链路。）

问题是，机器速度可能并不是问题。web 程序运行慢经常是因为计算机一直在不同的任务之间切换：通过成千上万的连接和用户交互，从磁盘访问文件，运行代码，等等。应用服务器可能会抖动（thrashing）-比如说内存不足、将内存数据交换到磁盘，以及有多个请求要等待某个任务完成，如磁盘I/O。

你可以采取一个完全不同的方案来替代升级硬件：添加一个反向代理服务器来分担部分任务。[反向代理服务器][1] 位于运行应用的机器的前端，是用来处理网络流量的。只有反向代理服务器是直接连接到互联网的；和应用服务器的通讯都是通过一个快速的内部网络完成的。

使用反向代理服务器可以将应用服务器从等待用户与 web 程序交互解放出来，这样应用服务器就可以专注于为反向代理服务器构建网页，让其能够传输到互联网上。而应用服务器就不需要等待客户端的响应，其运行速度可以接近于优化后的性能水平。

添加反向代理服务器还可以给你的 web 服务器安装带来灵活性。比如，一个某种类型的服务器已经超载了，那么就可以轻松的添加另一个相同的服务器；如果某个机器宕机了，也可以很容易替代一个新的。

因为反向代理带来的灵活性，所以反向代理也是一些性能加速功能的必要前提，比如：

- **负载均衡** (参见 [Tip #2][2]) – 负载均衡运行在反向代理服务器上，用来将流量均衡分配给一批应用。有了合适的负载均衡，你就可以添加应用服务器而根本不用修改应用。
- **缓存静态文件** (参见 [Tip #3][3]) – 直接读取的文件，比如图片或者客户端代码，可以保存在反向代理服务器，然后直接发给客户端，这样就可以提高速度、分担应用服务器的负载，可以让应用运行的更快。
- **网站安全** – 反向代理服务器可以提高网站安全性，以及快速的发现和响应攻击，保证应用服务器处于被保护状态。

NGINX 软件为用作反向代理服务器而专门设计，也包含了上述的多种功能。NGINX 使用事件驱动的方式处理请求，这会比传统的服务器更加有效率。NGINX plus 添加了更多高级的反向代理特性，比如应用的[健康度检查][4]，专门用来处理请求路由、高级缓冲和相关支持。

![NGINX Worker Process helps increase application performance](https://www.nginx.com/wp-content/uploads/2015/10/Graph-11.png)

### Tip #2: 添加负载平衡 ###

添加一个[负载均衡服务器][5] 是一个相当简单的用来提高性能和网站安全性的的方法。与其将核心 Web 服务器变得越来越大和越来越强，不如使用负载均衡将流量分配到多个服务器。即使程序写的不好，或者在扩容方面有困难，仅是使用负载均衡服务器就可以很好的提高用户体验。

负载均衡服务器首先是一个反向代理服务器（参见[Tip #1][6]）——它接受来自互联网的流量，然后转发请求给另一个服务器。特别是负载均衡服务器支持两个或多个应用服务器，使用[分配算法][7]将请求转发给不同服务器。最简单的负载均衡方法是轮转法（round robin），每个新的请求都会发给列表里的下一个服务器。其它的复制均衡方法包括将请求发给活动连接最少的服务器。NGINX plus 拥有将特定用户的会话分配给同一个服务器的[能力][8]。

负载均衡可以很好的提高性能是因为它可以避免某个服务器过载而另一些服务器却没有需要处理的流量。它也可以简单的扩展服务器规模，因为你可以添加多个价格相对便宜的服务器并且保证它们被充分利用了。

可以进行负载均衡的协议包括 HTTP、HTTPS、SPDY、HTTP/2、WebSocket、[FastCGI][9]、SCGI、uwsgi、 memcached 等，以及几种其它的应用类型，包括基于 TCP 的应用和其它的第4层协议的程序。分析你的 web 应用来决定你要使用哪些以及哪些地方性能不足。

相同的服务器或服务器群可以被用来进行负载均衡，也可以用来处理其它的任务，如 SSL 末端服务器，支持客户端的 HTTP/1.x 和 HTTP/2 请求，以及缓存静态文件。

NGINX 经常被用于进行负载均衡；要想了解更多的情况，可以下载我们的电子书 [选择软件负载均衡器的五个理由][10]。你也可以从 [使用 NGINX 和 NGINX Plus 配置负载均衡，第一部分][11] 中了解基本的配置指导，在 NGINX Plus 管理员指南中有完整的 [NGINX 负载均衡][12]的文档。。我们的商业版本 [NGINX Plus][15] 支持更多优化了的负载均衡特性，如基于服务器响应时间的加载路由和Microsoft’s NTLM 协议上的负载均衡。

### Tip #3: 缓存静态和动态的内容 ###

缓存可以通过加速内容的传输速度来提高 web 应用的性能。它可以采用以下几种策略：当需要的时候预处理要传输的内容，保存数据到速度更快的设备，把数据存储在距离客户端更近的位置，或者将这几种方法结合起来使用。

有两种不同类型数据的缓冲：

- **静态内容缓存**。不经常变化的文件，比如图像(JPEG、PNG) 和代码(CSS,JavaScript)，可以保存在外围服务器上，这样就可以快速的从内存和磁盘上提取。
- **动态内容缓存**。很多 web 应用会针对每次网页请求生成一个新的 HTML 页面。在短时间内简单的缓存生成的 HTML 内容，就可以很好的减少要生成的内容的数量，而且这些页面足够新，可以满足你的需要。

举个例子，如果一个页面每秒会被浏览10次，你将它缓存 1 秒，90%请求的页面都会直接从缓存提取。如果你分开缓存静态内容，甚至新生成的页面可能都是由这些缓存构成的。

下面由是 web 应用发明的三种主要的缓存技术：

- **缩短数据与用户的网络距离**。把一份内容的拷贝放的离用户更近的节点来减少传输时间。
- **提高内容服务器的速度**。内容可以保存在一个更快的服务器上来减少提取文件的时间。
- **从过载服务器上移走数据**。机器经常因为要完成某些其它的任务而造成某个任务的执行速度比测试结果要差。将数据缓存在不同的机器上可以提高缓存资源和非缓存资源的性能，而这是因为主机没有被过度使用。

对 web 应用的缓存机制可以在 web 应用服务器内部实现。首先，缓存动态内容是用来减少应用服务器加载动态内容的时间。其次，缓存静态内容（包括动态内容的临时拷贝）是为了更进一步的分担应用服务器的负载。而且缓存之后会从应用服务器转移到对用户而言更快、更近的机器，从而减少应用服务器的压力，减少提取数据和传输数据的时间。

改进过的缓存方案可以极大的提高应用的速度。对于大多数网页来说，静态数据，比如大图像文件，构成了超过一半的内容。如果没有缓存，那么这可能会花费几秒的时间来提取和传输这类数据，但是采用了缓存之后不到1秒就可以完成。

举一个在实际中缓存是如何使用的例子， NGINX 和 NGINX Plus 使用了两条指令来[设置缓存机制][16]：proxy_cache_path 和 proxy_cache。你可以指定缓存的位置和大小、文件在缓存中保存的最长时间和其它一些参数。使用第三条（而且是相当受欢迎的一条）指令 proxy_cache_use_stale，如果提供新鲜内容的服务器忙碌或者挂掉了，你甚至可以让缓存提供较旧的内容，这样客户端就不会一无所得。从用户的角度来看这可以很好的提高你的网站或者应用的可用时间。

NGINX plus 有个[高级缓存特性][17]，包括对[缓存清除][18]的支持和在[仪表盘][19]上显示缓存状态信息。

要想获得更多关于 NGINX 的缓存机制的信息可以浏览 NGINX Plus 管理员指南中的 [参考文档][20] 和 [NGINX 内容缓存][21] 。

**注意**：缓存机制分布于应用开发者、投资决策者以及实际的系统运维人员之间。本文提到的一些复杂的缓存机制从[DevOps 的角度][23]来看很具有价值，即对集应用开发者、架构师以及运维操作人员的功能为一体的工程师来说可以满足它们对站点功能性、响应时间、安全性和商业结果（如完成的交易数）等需要。

### Tip #4: 压缩数据 ###

压缩是一个具有很大潜力的提高性能的加速方法。现在已经有一些针对照片（JPEG 和PNG）、视频（MPEG-4）和音乐（MP3）等各类文件精心设计和高压缩率的标准。每一个标准都或多或少的减少了文件的大小。

文本数据 —— 包括HTML（包含了纯文本和 HTML 标签），CSS 和代码，比如 Javascript —— 经常是未经压缩就传输的。压缩这类数据会在对应用程序性能的感觉上，特别是处于慢速或受限的移动网络的客户端，产生更大的影响。

这是因为文本数据经常是用户与网页交互的有效数据，而多媒体数据可能更多的是起提供支持或者装饰的作用。智能的内容压缩可以减少 HTML，Javascript，CSS和其它文本内容对带宽的要求，通常可以减少 30% 甚至更多的带宽和相应的页面加载时间。

如果你使用 SSL，压缩可以减少需要进行 SSL 编码的的数据量，而这些编码操作会占用一些 CPU 时间而抵消了压缩数据减少的时间。

压缩文本数据的方法很多，举个例子，在定义小说文本压缩模式的 [HTTP/2 部分]就对于头数据来特别适合。另一个例子是可以在 NGINX 里打开使用 GZIP 压缩。你在你的服务里[预先压缩文本数据][25]之后，你就可以直接使用 gzip_static 指令来处理压缩过的 .gz 版本。

### Tip #5: 优化 SSL/TLS ###

安全套接字（[SSL][26]) 协议和它的下一代版本传输层安全（TLS）协议正在被越来越多的网站采用。SSL/TLS 对从原始服务器发往用户的数据进行加密提高了网站的安全性。影响这个趋势的部分原因是 Google 正在使用 SSL/TLS，这在搜索引擎排名上是一个正面的影响因素。

尽管 SSL/TLS 越来越流行，但是使用加密对速度的影响也让很多网站望而却步。SSL/TLS 之所以让网站变的更慢，原因有二：

1. 任何一个连接第一次连接时的握手过程都需要传递密钥。而采用 HTTP/1.x 协议的浏览器在建立多个连接时会对每个连接重复上述操作。
2. 数据在传输过程中需要不断的在服务器端加密、在客户端解密。

为了鼓励使用 SSL/TLS，HTTP/2 和 SPDY（在[下一章][27]会描述）的作者设计了新的协议来让浏览器只需要对一个浏览器会话使用一个连接。这会大大的减少上述第一个原因所浪费的时间。然而现在可以用来提高应用程序使用 SSL/TLS 传输数据的性能的方法不止这些。

web 服务器有对应的机制优化 SSL/TLS 传输。举个例子，NGINX 使用 [OpenSSL][28] 运行在普通的硬件上提供了接近专用硬件的传输性能。NGINX 的 [SSL 性能][29] 有详细的文档，而且把对 SSL/TLS 数据进行加解密的时间和 CPU 占用率降低了很多。

更进一步，参考这篇[文章][30]了解如何提高 SSL/TLS 性能的更多细节，可以总结为一下几点：

- **会话缓冲**。使用指令 [ssl_session_cache][31] 可以缓存每个新的 SSL/TLS 连接使用的参数。
- **会话票据或者 ID**。把 SSL/TLS 的信息保存在一个票据或者 ID 里可以流畅的复用而不需要重新握手。
- **OCSP 分割**。通过缓存 SSL/TLS 证书信息来减少握手时间。

NGINX 和 NGINX Plus 可以被用作 SSL/TLS 服务端，用于处理客户端流量的加密和解密，而同时以明文方式和其它服务器进行通信。要设置 NGINX 和 NGINX Plus 作为 SSL/TLS 服务端，参看 [HTTPS 连接][32] 和[加密的 TCP 连接][33]

### Tip #6: 使用 HTTP/2 或 SPDY ###

对于已经使用了 SSL/TLS 的站点，HTTP/2 和 SPDY 可以很好的提高性能，因为每个连接只需要一次握手。而对于没有使用 SSL/TLS 的站点来说，从响应速度的角度来说 HTTP/2 和 SPDY 将让迁移到 SSL/TLS 没有什么压力（原本会降低效率）。

Google 在2012年开始把 SPDY 作为一个比 HTTP/1.x 更快速的协议来推荐。HTTP/2 是目前 IETF 通过的标准，是基于 SPDY 的。SPDY 已经被广泛的支持了，但是很快就会被 HTTP/2 替代。

SPDY 和 HTTP/2 的关键是用单一连接来替代多路连接。单个连接是被复用的，所以它可以同时携带多个请求和响应的分片。

通过使用单一连接，这些协议可以避免像在实现了 HTTP/1.x 的浏览器中一样建立和管理多个连接。单一连接在对 SSL 特别有效，这是因为它可以最小化 SSL/TLS 建立安全链接时的握手时间。

SPDY 协议需要使用 SSL/TLS，而 HTTP/2 官方标准并不需要，但是目前所有支持 HTTP/2 的浏览器只有在启用了 SSL/TLS 的情况下才能使用它。这就意味着支持 HTTP/2 的浏览器只有在网站使用了 SSL 并且服务器接收 HTTP/2 流量的情况下才会启用 HTTP/2。否则的话浏览器就会使用 HTTP/1.x 协议。

当你实现 SPDY 或者 HTTP/2 时，你不再需要那些常规的 HTTP 性能优化方案，比如按域分割、资源聚合，以及图像拼合。这些改变可以让你的代码和部署变得更简单和更易于管理。要了解 HTTP/2 带来的这些变化可以浏览我们的[白皮书][34]。

![NGINX Supports SPDY and HTTP/2 for increased web application performance](https://www.nginx.com/wp-content/uploads/2015/10/http2-27.png)

作为支持这些协议的一个样例，NGINX 已经从一开始就支持了 SPDY，而且[大部分使用 SPDY 协议的网站][35]都运行的是 NGINX。NGINX 同时也[很早][36]对 HTTP/2 的提供了支持，从2015 年9月开始，开源版 NGINX 和 NGINX Plus 就[支持][37]它了。

经过一段时间，我们 NGINX 希望更多的站点完全启用 SSL 并且向 HTTP/2 迁移。这将会提高安全性，同时也会找到并实现新的优化手段，简化的代码表现的会更加优异。

### Tip #7: 升级软件版本 ###

一个提高应用性能的简单办法是根据软件的稳定性和性能的评价来选在你的软件栈。进一步说，因为高性能组件的开发者更愿意追求更高的性能和解决 bug ，所以值得使用最新版本的软件。新版本往往更受开发者和用户社区的关注。更新的版本往往会利用到新的编译器优化，包括对新硬件的调优。

稳定的新版本通常比旧版本具有更好的兼容性和更高的性能。一直进行软件更新，可以非常简单的保持软件保持最佳的优化，解决掉 bug，以及提高安全性。

一直使用旧版软件也会阻止你利用新的特性。比如上面说到的 HTTP/2，目前要求 OpenSSL 1.0.1。在2016 年中期开始将会要求1.0.2 ，而它是在2015年1月才发布的。

NGINX 用户可以开始迁移到 [NGINX 最新的开源软件][38] 或者 [NGINX Plus][39]；它们都包含了最新的能力，如 socket 分割和线程池（见下文），这些都已经为性能优化过了。然后好好看看的你软件栈，把它们升级到你能升级到的最新版本吧。

### Tip #8: Linux 系统性能调优 ###

Linux 是大多数 web 服务器使用的操作系统，而且作为你的架构的基础，Linux 显然有不少提高性能的可能。默认情况下，很多 Linux 系统都被设置为使用很少的资源，以符合典型的桌面应用使用。这就意味着 web 应用需要一些微调才能达到最大效能。

这里的 Linux 优化是专门针对 web 服务器方面的。以 NGINX 为例，这里有一些在加速 Linux 时需要强调的变化：

- **缓冲队列**。如果你有挂起的连接，那么你应该考虑增加 net.core.somaxconn 的值，它代表了可以缓存的连接的最大数量。如果连接限制太小，那么你将会看到错误信息，而你可以逐渐的增加这个参数直到错误信息停止出现。
- **文件描述符**。NGINX 对一个连接使用最多2个文件描述符。如果你的系统有很多连接请求，你可能就需要提高sys.fs.file_max ，以增加系统对文件描述符数量整体的限制，这样才能支持不断增加的负载需求。
- **临时端口**。当使用代理时，NGINX 会为每个上游服务器创建临时端口。你可以设置net.ipv4.ip_local_port_range 来提高这些端口的范围，增加可用的端口号。你也可以减少非活动的端口的超时判断来重复使用端口，这可以通过 net.ipv4.tcp_fin_timeout 来设置，这可以快速的提高流量。

对于 NGINX 来说，可以查阅 [NGINX 性能调优指南][40]来学习如果优化你的 Linux 系统，这样它就可以很好的适应大规模网络流量而不会超过工作极限。

### Tip #9: web 服务器性能调优 ###

无论你是用哪种 web 服务器，你都需要对它进行优化来提高性能。下面的推荐手段可以用于任何 web 服务器，但是一些设置是针对 NGINX 的。关键的优化手段包括：

- **访问日志**。不要把每个请求的日志都直接写回磁盘，你可以在内存将日志缓存起来然后批量写回磁盘。对于NGINX 来说，给指令 **access_log** 添加参数 **buffer=size** 可以让系统在缓存满了的情况下才把日志写到磁盘。如果你添加了参数 **flush=time** ，那么缓存内容会每隔一段时间再写回磁盘。
- **缓存**。缓存会在内存中存放部分响应，直到满了为止，这可以让与客户端的通信更加高效。内存放不下的响应会写回磁盘，而这就会降低效能。当 NGINX [启用][42]了缓存机制后，你可以使用指令 **proxy_buffer_size** 和 **proxy_buffers** 来管理缓存。
- **客户端保活**。保活连接可以减少开销，特别是使用 SSL/TLS 时。对于 NGINX 来说，你可以从 **keepalive_requests** 的默认值 100 开始增加最大连接数，这样一个客户端就可以在一个指定的连接上请求多次，而且你也可以通过增加 **keepalive_timeout** 的值来允许保活连接存活更长时间，这样就可以让后来的请求处理的更快速。
- **上游保活**。上游的连接——即连接到应用服务器、数据库服务器等机器的连接——同样也会受益于连接保活。对于上游连接来说，你可以增加 **keepalive**，即每个工人进程的空闲保活连接个数。这就可以提高连接的复用次数，减少需要重新打开全新连接的次数。更多关于保活连接的信息可以参见[这篇“ HTTP 保活连接和性能”][41]。
- **限制**。限制客户端使用的资源可以提高性能和安全性。对于 NGINX 来说，指令 **limit_conn** 和 **limit_conn_zone**  限制了给定来源的连接数量，而 **limit_rate** 限制了带宽。这些限制都可以阻止合法用户*扒取*资源，同时也避免了攻击。指令 **limit_req** 和 **limit_req_zone**  限制了客户端请求。对于上游服务器来说，可以在 upstream 的配置块里的 server 指令使用 max_conns 参数来限制连接到上游服务器的连接数。 这样可以避免服务器过载。关联的 queue 指令会创建一个队列来在连接数抵达 **max_conn** 限制时在指定长度的时间内保存特定数量的请求。
- **工人进程**。工人进程负责处理请求。NGINX 采用事件驱动模型和操作系统特定的机制来有效的将请求分发给不同的工人进程。这条建议推荐设置 **worker_processes** 为每个 CPU 一个 。worker_connections 的最大数（默认512）可以在大部分系统上根据需要增加，实验性地找到最适合你的系统的值。
- **套接字分割**。通常一个套接字监听器会把新连接分配给所有工人进程。套接字分割会为每个工人进程创建一个套接字监听器，这样一来以当套接字监听器可用时，内核就会将连接分配给它。这可以减少锁竞争，并且提高多核系统的性能，要启用[套接字分隔][43]需要在 **listen** 指令里面加上 **reuseport** 参数。
- **线程池**。计算机进程可能被一个单一的缓慢的操作所占用。对于 web 服务器软件来说，磁盘访问会影响很多更快的操作，比如计算或者在内存中拷贝。使用了线程池之后慢操作可以分配到不同的任务集，而主进程可以一直运行快速操作。当磁盘操作完成后结果会返回给主进程的循环。在 NGINX 里有两个操作——read() 系统调用和 sendfile() ——被分配到了[线程池][44]

![Thread pools help increase application performance by assigning a slow operation to a separate set of tasks](https://www.nginx.com/wp-content/uploads/2015/10/Graph-17.png)

**技巧**。当改变任何操作系统或支持服务的设置时，一次只改变一个参数然后测试性能。如果修改引起问题了，或者不能让你的系统更快，那么就改回去。

在[文章“调优 NGINX 性能”][45]里可以看到更详细的 NGINX 调优方法。

### Tip #10: 监视系统活动来解决问题和瓶颈 ###

在应用开发中要使得系统变得非常高效的关键是监视你的系统在现实世界运行的性能。你必须能通过特定的设备和你的 web 基础设施上监控程序活动。

监视活动是最积极的——它会告诉你发生了什么，把问题留给你发现和最终解决掉。

监视可以发现几种不同的问题。它们包括：

- 服务器宕机。
- 服务器出问题一直在丢失连接。
- 服务器出现大量的缓存未命中。
- 服务器没有发送正确的内容。

应用的总体性能监控工具，比如 New Relic 和 Dynatrace，可以帮助你监控到从远程加载网页的时间，而 NGINX 可以帮助你监控到应用交付端。当你需要考虑为基础设施添加容量以满足流量需求时，应用性能数据可以告诉你你的优化措施的确起作用了。

为了帮助开发者快速的发现、解决问题，NGINX Plus 增加了[应用感知健康度检查][46] ——对重复出现的常规事件进行综合分析并在问题出现时向你发出警告。NGINX Plus 同时提供[会话过滤][47] 功能，这可以阻止当前任务完成之前接受新的连接，另一个功能是慢启动，允许一个从错误恢复过来的服务器追赶上负载均衡服务器群的进度。当使用得当时，健康度检查可以让你在问题变得严重到影响用户体验前就发现它，而会话过滤和慢启动可以让你替换服务器，并且这个过程不会对性能和正常运行时间产生负面影响。下图就展示了内建的 NGINX Plus 模块[实时活动监视][48]的仪表盘，包括了服务器群，TCP 连接和缓存信息等 Web 架构信息。

![Use real-time application performance monitoring tools to identify and resolve issues quickly](https://www.nginx.com/wp-content/uploads/2015/10/Screen-Shot-2015-10-05-at-4.16.32-PM.png)

### 总结: 看看10倍性能提升的效果 ###

这些性能提升方案对任何一个 web 应用都可用并且效果都很好，而实际效果取决于你的预算、你能花费的时间、目前实现方案的差距。所以你该如何对你自己的应用实现10倍性能提升？

为了指导你了解每种优化手段的潜在影响，这里是上面详述的每个优化方法的关键点，虽然你的情况肯定大不相同：

- **反向代理服务器和负载均衡**。没有负载均衡或者负载均衡很差都会造成间歇的性能低谷。增加一个反向代理，比如 NGINX ，可以避免 web 应用程序在内存和磁盘之间波动。负载均衡可以将过载服务器的任务转移到空闲的服务器，还可以轻松的进行扩容。这些改变都可以产生巨大的性能提升，很容易就可以比你现在的实现方案的最差性能提高10倍，对于总体性能来说可能提高的不多，但是也是有实质性的提升。
- **缓存动态和静态数据**。如果你有一个负担过重的 web 服务器，那么毫无疑问肯定是你的应用服务器，只通过缓存动态数据就可以在峰值时间提高10倍的性能。缓存静态文件可以提高几倍的性能。
- **压缩数据**。使用媒体文件压缩格式，比如图像格式 JPEG，图形格式 PNG，视频格式 MPEG-4，音乐文件格式 MP3 可以极大的提高性能。一旦这些都用上了，然后压缩文件数据可以将初始页面加载速度提高两倍。
- **优化 SSL/TLS**。安全握手会对性能产生巨大的影响，对它们的优化可能会对初始响应产生2倍的提升，特别是对于大量文本的站点。优化 SSL/TLS 下媒体文件只会产生很小的性能提升。
- **使用 HTTP/2 和 SPDY*。当你使用了 SSL/TLS，这些协议就可以提高整个站点的性能。
- **对 Linux 和 web 服务器软件进行调优**。比如优化缓存机制，使用保活连接，分配时间敏感型任务到不同的线程池可以明显的提高性能；举个例子，线程池可以加速对磁盘敏感的任务[近一个数量级][49]。

我们希望你亲自尝试这些技术。我们希望知道你说取得的各种性能提升案例。请在下面评论栏分享你的结果或者在标签 #NGINX 和 #webperf 下 tweet 你的故事。

### 网上资源 ###

[Statista.com – Share of the internet economy in the gross domestic product in G-20 countries in 2016][50]

[Load Impact – How Bad Performance Impacts Ecommerce Sales][51]

[Kissmetrics – How Loading Time Affects Your Bottom Line (infographic)][52]

[Econsultancy – Site speed: case studies, tips and tools for improving your conversion rate][53]

--------------------------------------------------------------------------------

via: https://www.nginx.com/blog/10-tips-for-10x-application-performance/ 

作者：[Floyd Smith][a]
译者：[Ezio](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

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
[10]:https://www.nginx.com/resources/library/five-reasons-choose-software-load-balancer/
[11]:https://www.nginx.com/blog/load-balancing-with-nginx-plus/
[12]:https://www.nginx.com/resources/admin-guide/load-balancer//
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
