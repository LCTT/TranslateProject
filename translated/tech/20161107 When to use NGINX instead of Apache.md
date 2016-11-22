OneNewLife translated

什么时候用 NGINX 来取代 Apache
=====

>两者都是主流的开源网络服务器，但是据 NGINX 的首席执行官 Gus Robertson 所言，他们有不同的使用场景。还有微软呢？他们家的服务器的活跃网站份额在 20 年间首次跌破 10%。

 ![web 服务器热度，2016 年 10 月](http://zdnet1.cbsistatic.com/hub/i/r/2016/11/07/f38d190e-046c-49e6-b451-096ee0776a04/resize/770xauto/b009f53417e9a4af207eff6271b90c43/web-server-popularity-october-2016.png)

Apache 是最受欢迎的网络服务器，不过 NGINX 正迎头直上，而微软的 IIS 几十年来首次跌破 10%。

[NGINX][4] 已经成为第二大网络服务器。它在很久以前就已经超越了[微软因特网信息服务（IIS）][5]，并且一直在老大 [Apache][6] 的身后穷追不舍。但是，NGINX 的首席执行官在接受采访时表示，Apache 和 NGINX 的用户群体不一样。

“我认为 Apache 是一个伟大的网络服务器。NGINX 和它的使用场景不同，”Robertson 说。“我们没有把 Apache 当成竞争对手。我们的用户使用 NGINX 来取代硬件负载均衡器和构建微服务，这两个都不是 Apache 的长处。”

事实上，Robertson 发现许多用户同时使用了两种开源的网络服务。“用户会在 Apache 的上层使用 NGINX 来实现负载均衡。我们的架构是完全不同的，我们可以做更好的并发网络服务。”他还表示 NGINX 在云配置方面的表现更优秀。

他总结说，“我们是唯一一个仍然在持续增长的网络服务器，其它的网络服务器都在慢慢成为明日黄花。”

这些增长，加上微软损失的 120 万个活跃站点，导致微软的活跃网站份额下降到 9.27%，这是他们第一次跌破 10%。Apache 的市场份额提高了 0.19%，并继续领跑市场，现在坐拥 46.3% 的活跃站点。尽管如此，多年来 Apache 一直在缓慢下降，而 NGINX 现在上升到了 19%。这不太准确。根据[Netcraft 十月份的网络服务器调查][7]，Apache 当月的活跃网站增加得最多，获得了 180 万个新站点，而 NGINX 增加了 40 万个新站点，增长率排第二。

NGINX 的开发者正在努力创造他们的开放商业网络服务器 —— [NGINX Plus][8]，通过不断的改进使其变得更有竞争力。NGINX Plus 最新的 [第 11 个发行版（R11）][9]发行了，这个版本更易于扩展和自定义，并支持更广泛的部署。

这次最大的补充是 [动态模块][10] 的二进制兼容性。这意味着通过 [开源 NGINX 软件][11] 编译的动态模块可以加载到 NGINX Plus。

这意味着你可以利用大量的 [第三方 NGINX 模块][12] 来扩展 NGINX Plus 的功能，仿照一系列开源和商业化的生产模块。开发者可以基于支持 NGINX Plus 的内核创建自定义扩展、附加组件和新产品。

NGINX Plus R11 还增强了其它功能：

* [提升 TCP/UDP 负载均衡][1] —— 新功能包括 SSL 服务器路由、新的日志功能、附加变量以及改进的代理协议支持。这些新功能增强了调试功能，使你能够支持更广泛的企业应用。
* [更好的 IP 定位][2] —— 第三方的 GeoIP2 模块现在已经通过认证，并提供给 NGINX Plus 用户。这个新版本提供比原来的 GeoIP 模块更精准和丰富的位置信息。
* [增强的 nginScript 模块][3] —— nginScript 是基于 JavaScript 的 NGINX Plus 的下一代配置语言。新功能可以让你在流（TCP/UDP）模块中即时修改请求和响应数据。

The end result? NGINX is poised to continue to make the race for the top web server a two-horse race. Microsoft IIS? It continues to slowly fade away.
最终结果？NGINX 准备继续与 Apache 竞争顶级网络服务器的宝座。至于微软的 IIS？它将逐渐消亡。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/when-to-use-nginx-instead-of-apache/

作者：[ Steven J. Vaughan-Nichols][a]
译者：[OneNewLife](https://github.com/OneNewLife)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.zdnet.com/meet-the-team/us/steven-j-vaughan-nichols/
[1]:https://www.nginx.com/blog/nginx-plus-r11-released/?utm_source=nginx-plus-r11-released&utm_medium=blog#r11-tcp-udp-lb
[2]:https://www.nginx.com/blog/nginx-plus-r11-released/?utm_source=nginx-plus-r11-released&utm_medium=blog#r11-geoip2
[3]:https://www.nginx.com/blog/nginx-plus-r11-released/?utm_source=nginx-plus-r11-released&utm_medium=blog#r11-nginScript
[4]:https://www.nginx.com/
[5]:https://www.iis.net/
[6]:https://httpd.apache.org/
[7]:https://news.netcraft.com/archives/2016/10/21/october-2016-web-server-survey.html
[8]:https://www.nginx.com/products/
[9]:https://www.nginx.com/blog/nginx-plus-r11-released/
[10]:https://www.nginx.com/blog/nginx-plus-r11-released/?utm_source=nginx-plus-r11-released&utm_medium=blog#r11-dynamic-modules
[11]:https://www.nginx.com/products/download-oss/
[12]:https://www.nginx.com/resources/wiki/modules/index.html?utm_source=nginx-plus-r11-released&utm_medium=blog
