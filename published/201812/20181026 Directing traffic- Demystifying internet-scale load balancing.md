流量引导：网络世界的负载均衡解密
======

> 均衡网络流量的常用技术，它们的优势和利弊权衡。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/traffic-light-go.png?itok=nC_851ys)

大型的多站点互联网系统，包括内容分发网络（CDN）和云服务提供商，用一些方法来均衡来访的流量。这篇文章我们讲一下常见的流量均衡设计，包括它们的技术手段和利弊权衡。

早期的云计算服务提供商，可以提供单一一台客户 Web 服务器，分配一个 IP 地址，然后用一个便于人读的域名配置一个 DNS 记录指向这个 IP 地址，再将 IP 地址通过边界网关协议（BGP）宣告出去，BGP 是在不同网络之间交换路由信息的标准方式。

这本身并不是负载均衡，但是能在冗余的多条网络路径中进行流量分发，而且可以利用网络技术让流量绕过不可用的网络，从而提高了可用性（也引起了[非对称路由][1]的现象）。

### 简单的 DNS 负载均衡

随着来自客户的流量变大，老板希望服务是高可用的。你上线第二台 web 服务器，它有自己独立的公网 IP 地址，然后你更新了 DNS 记录，把用户流量引到两台服务器上（内心希望它们均衡地提供服务）。在其中一台服务器出故障之前，这样做一直是没有问题的。假设你能很快地监测到故障，可以更新一下 DNS 配置（手动更新或者通过软件）删除解析到故障机器的记录。

不幸的是，因为 DNS 记录会被缓存，在客户端缓存和它们依赖的 DNS 服务器上的缓存失效之前，大约一半的请求会失败。DNS 记录都有一个几分钟或更长的生命周期（TTL），所以这种方式会对系统可用性造成严重的影响。

更糟糕的是，部分客户端会完全忽略 TTL，所以有一些请求会持续被引导到你的故障机器上。设置很短的 TTL 也不是个好办法，因为这意味着更高的 DNS 服务负载，还有更长的访问时延，因为客户端要做更多的 DNS 查询。如果 DNS 服务由于某种原因不可用了，那设置更短的 TTL 会让服务的访问量更快地下降，因为没那么多客户端有你网站 IP 地址的缓存了。

### 增加网络负载均衡

要解决上述问题，可以增加一对相互冗余的[四层][2]（L4）网络负载均衡器，配置一样的虚拟 IP 地址（VIP）。均衡器可以是硬件的，也可以是像 [HAProxy][3] 这样的软件。域名的 DNS 记录指向 VIP，不再承担负载均衡的功能。

![Layer 4 load balancers balance connections across webservers.][5]

*四层负载均衡器能够均衡用户和两台 web 服务器的连接*

四层均衡器将网络流量均衡地引导至后端服务器。通常这是基于对 IP 数据包的五元组做散列（数学函数）来完成的，五元组包括：源地址、源端口、目的地址、目的端口、协议（比如 TCP 或 UDP）。这种方法是快速和高效的（还维持了 TCP 的基本属性），而且不需要均衡器维持每个连接的状态。（更多信息请阅读[谷歌发表的 Maglev 论文][6]，这篇论文详细讨论了四层软件负载均衡器的实现细节。）

四层均衡器可以对后端服务做健康检查，只把流量分发到健康的机器上。和使用 DNS 做负载均衡不同的是，在某个后端 web 服务故障的时候，它可以很快地把流量重新分发到其他机器上，虽然故障机器的已有连接会被重置。

当后端服务器的能力不同时，四层均衡器可以根据权重做流量分发。它为运维人员提供了强大的能力和灵活性，而且硬件成本相对较小。

### 扩展到多站点

系统规模在持续增长。你的客户希望能一直使用服务，即使是数据中心发生故障的时候。所以你建设了一个新的数据中心，另外独立部署了一套服务和四层负载均衡器集群，仍然使用同样的 VIP。DNS 的设置不变。

两个站点的边缘路由器都把自己的地址空间宣告出去，包括 VIP 地址。发往该 VIP 的请求可能到达任何一个站点，取决于用户和系统之间的网络是如何连接的，以及各个网络的路由策略是如何配置的。这就是泛播。大部分时候这种机制可以很好的工作。如果一个站点出问题了，你可以停止通过 BGP 宣告 VIP 地址，客户的请求就会迅速地转移到另外一个站点去。

![Serving from multiple sites using anycast][8]

*多个站点使用泛播提供服务*

这种设置有一些问题。最大的问题是，不能控制请求流向哪个站点，或者限制某个站点的流量。也没有一个明确的方式把用户的请求转到距离他最近的站点（为了降低网络延迟），不过，网络协议和路由选路配置在大部分情况下应该能把用户请求路由到最近的站点。

### 控制多站点系统中的入站请求

为了维持稳定性，需要能够控制每个站点的流量大小。要实现这种控制，可以给每个站点分配不同的 VIP 地址，然后用简单的或者有权重的 DNS [轮询][9]来做负载均衡。

![Serving from multiple sites using a primary VIP][11]

*多站点提供服务，每个站点使用一个主 VIP，另外一个站点作为备份。基于能感知地理位置的 DNS。*

现在有两个问题。

第一、使用 DNS 均衡意味着会有被缓存的记录，如果你要快速重定向流量的话就麻烦了。

第二、用户每次做新的 DNS 查询，都可能连上任意一个站点，可能不是距离最近的。如果你的服务运行在分布广泛的很多站点上，用户会感受到响应时间有明显的变化，取决于用户和提供服务的站点之间有多大的网络延迟。

让每个站点都配置上其他所有站点的 VIP 地址，并宣告出去（因此也会包含故障的站点），这样可以解决第一个问题。有一些网络上的小技巧，比如备份站点宣告路由时，不像主站点使用那么具体的目的地址，这样可以保证每个 VIP 的主站点只要可用就会优先提供服务。这是通过 BGP 来实现的，所以我们应该可以看到，流量在 BGP 更新后的一两分钟内就开始转移了。

即使离用户最近的站点是健康而且有服务能力的，但是用户真正访问到的却不一定是这个站点，这个问题还没有很好的解决方案。很多大型的互联网服务利用 DNS 给不同地域的用户返回不同的解析结果，也能有一定的效果。不过，因为网络地址的结构和地理位置无关，一个地址段也可能会改变所在位置（例如，当一个公司重新规划网络时），而且很多用户可能使用了同一个 DNS 缓存服务器。所以这种方案有一定的复杂度，而且容易出错。

### 增加七层负载均衡

又过了一段时间，你的客户开始要更多的高级功能。

虽然四层负载均衡可以高效地在多个 web 服务器之间分发流量，但是它们只针对源地址、目标地址、协议和端口来操作，请求的内容是什么就不得而知了，所以很多高级功能在四层负载均衡上实现不了。而七层（L7）负载均衡知道请求的内容和结构，所以能做更多的事情。

七层负载均衡可以实现缓存、限速、错误注入，做负载均衡时可以感知到请求的代价（有些请求需要服务器花更多的时间去处理）。

七层负载均衡还可以基于请求的属性（比如 HTTP cookies）来分发流量，可以终结 SSL 连接，还可以帮助防御应用层的拒绝服务（DoS）攻击。规模大的 L7 负载均衡的缺点是成本 —— 处理请求需要更多的计算，而且每个活跃的请求都占用一些系统资源。在一个或者多个 L7 均衡器前面运行 L4 均衡器集群，对扩展规模有帮助。

### 结论

负载均衡是一个复杂的难题。除了上面说过的策略，还有不同的[负载均衡算法][13]，用来实现负载均衡器的高可用技术、客户端负载均衡技术，以及最近兴起的服务网络等等。

核心的负载均衡模式随着云计算的发展而不断发展，而且，随着大型 web 服务商致力于让负载均衡技术更可控和更灵活，这项技术会持续发展下去。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/internet-scale-load-balancing

作者：[Laura Nolan][a]
选题：[lujun9972][b]
译者：[BeliteX](https://github.com/belitex)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/lauranolan
[b]: https://github.com/lujun9972
[1]: https://www.noction.com/blog/bgp-and-asymmetric-routing
[2]: https://en.wikipedia.org/wiki/Transport_layer
[3]: https://www.haproxy.com/blog/failover-and-worst-case-management-with-haproxy/
[4]: /file/412596
[5]: https://opensource.com/sites/default/files/uploads/loadbalancing1_l4-network-loadbalancing.png "Layer 4 load balancers balance connections across webservers."
[6]: https://ai.google/research/pubs/pub44824
[7]: /file/412601
[8]: https://opensource.com/sites/default/files/uploads/loadbalancing2_going-multisite.png "Serving from multiple sites using anycast"
[9]: https://en.wikipedia.org/wiki/Round-robin_scheduling
[10]: /file/412606
[11]: https://opensource.com/sites/default/files/uploads/loadbalancing3_controlling-inbound-requests.png "Serving from multiple sites using a primary VIP"
[12]: https://landing.google.com/sre/book/chapters/load-balancing-frontend.html
[13]: https://medium.com/netflix-techblog/netflix-edge-load-balancing-695308b5548c
[14]: https://www.usenix.org/conference/lisa18/presentation/suriar
[15]: https://www.usenix.org/conference/lisa18
