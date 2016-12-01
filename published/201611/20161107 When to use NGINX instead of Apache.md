何时 NGINX 将取代 Apache？
=====

> NGINX 和 Apache 两者都是主流的开源 web 服务器，但是据 NGINX 的首席执行官 Gus Robertson 所言，他们有不同的使用场景。此外还有微软，其 web 服务器 IIS 在活跃网站的份额在 20 年间首次跌破 10%。

![活跃网站的 web 服务器市场份额](http://zdnet1.cbsistatic.com/hub/i/r/2016/11/07/f38d190e-046c-49e6-b451-096ee0776a04/resize/770xauto/b009f53417e9a4af207eff6271b90c43/web-server-popularity-october-2016.png)

*Apache 是最受欢迎的 web 服务器，不过 NGINX 正逐渐增长，而微软的 IIS 几十年来首次跌破 10%。*

[NGINX][4] 已经成为第二大 web 服务器。它在很久以前就已经超越了[微软 IIS][5]，并且一直在老大 [Apache][6] 的身后穷追不舍。但是，NGINX 的首席执行官Gus Roberston 在接受采访时表示，Apache 和 NGINX 的用户群体不一样。

“我认为 Apache 是很好的 web 服务器。NGINX 和它的使用场景不同，”Robertson 说。“我们没有把 Apache 当成竞争对手。我们的用户使用 NGINX 来取代硬件负载均衡器和构建微服务，这两个都不是 Apache 的长处。”

事实上，Robertson 发现许多用户同时使用了这两种开源的 web 服务。“用户会在 Apache 的上层使用 NGINX 来实现负载均衡。我们的架构差异很大，我们可以提供更好的并发 web 服务。”他还表示 NGINX 在云环境中表现更优秀。

他总结说，“我们是唯一一个仍然在持续增长的 web 服务器，其它的 web 服务器都在慢慢缩小份额。”

这不太准确。根据 [Netcraft 十月份的网络服务器调查][7]，Apache 当月的活跃网站增加得最多，获得了 180 万个新站点，而 NGINX 增加了 40 万个新站点，排在第二位。

这些增长，加上微软损失的 120 万个活跃站点，导致微软的活跃网站份额下降到 9.27%，这是他们第一次跌破 10%。Apache 的市场份额提高了 0.19%，并继续领跑市场，现在坐拥 46.3% 的活跃站点。尽管如此，多年来 Apache 一直在缓慢下降，而 NGINX 现在上升到了 19%。

NGINX 的开发者正在努力创造他们的核心开放（open-core ）的商业 web 服务器 —— [NGINX Plus][8]，通过不断的改进使其变得更有竞争力。NGINX Plus 最新的版本是 [NGINX Plus 11 版（R11）][9]，该服务器易于扩展和自定义，并支持更广泛的部署。

这次最大的补充是 [动态模块][10] 的二进制兼容性。也就是说为 [开源 NGINX 软件][11] 编译的动态模块也可以加载到 NGINX Plus。

这意味着你可以利用大量的[第三方 NGINX 模块][12] 来扩展 NGINX Plus 的功能，借鉴一系列开源和商业化生产的模块。开发者可以基于支持 NGINX Plus 的内核创建自定义扩展、附加组件和新产品。

NGINX Plus R11 还增强了其它功能：

* [提升 TCP/UDP 负载均衡][1] —— 新功能包括 SSL 服务器路由、新的日志功能、附加变量以及改进的代理协议支持。这些新功能增强了调试功能，使你能够支持更广泛的企业应用。
* [更好的 IP 定位][2] —— 第三方的 GeoIP2 模块现在已经通过认证，并提供给 NGINX Plus 用户。这个新版本提供比原来的 GeoIP 模块更精准和丰富的位置信息。
* [增强的 nginScript 模块][3] —— nginScript 是基于 JavaScript 的 NGINX Plus 的下一代配置语言。新功能可以让你在流（TCP/UDP）模块中即时修改请求和响应数据。

最终结果？NGINX 准备继续与 Apache 竞争顶级 web 服务器的宝座。至于微软的 IIS？它将逐渐淡出市场。

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/when-to-use-nginx-instead-of-apache/

作者：[Steven J. Vaughan-Nichols][a]
译者：[OneNewLife](https://github.com/OneNewLife)
校对：[jasminepeng](https://github.com/jasminepeng)

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
