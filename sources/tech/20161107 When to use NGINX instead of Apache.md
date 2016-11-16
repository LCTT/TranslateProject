OneNewLife translating

When to use NGINX instead of Apache
=====

>They're both popular open-source web servers but, according to NGINX CEO Gus Robertson, they have different use cases. And Microsoft? Its web server has dropped below 10 percent of all active websites for the first time in 20 years.

 ![web-server-popularity-october-2016.png](http://zdnet1.cbsistatic.com/hub/i/r/2016/11/07/f38d190e-046c-49e6-b451-096ee0776a04/resize/770xauto/b009f53417e9a4af207eff6271b90c43/web-server-popularity-october-2016.png)

Apache is the top web server, but NGINX continues to gain and Microsoft IIS falls below 10 percent for the first time in decades.

[NGINX][4] has risen to become the number two web server. It surpassed [Microsoft Internet Information Services (IIS)][5] long ago and has been creeping up on long-time top web server [Apache][6]. But, NGINX CEO Gus Roberston said in an interview, Apache and NGINX are not after the same audiences.

"I think Apache is a great web server. NGINX is different use case," said Robertson. "We don't see Apache as a rival. Our customers use NGINX to replace hardware load balancers and build micro-services neither of which is Apache."

Indeed, Robertson finds that many customers use both open-source web services. "Customers will use NGINX in front of Apache for load balancing and applications. Our architecture is quite different and we can do better concurrent web services." He also said NGINX works better in cloud configurations.

He concluded, "We're the only web server still growing, everyone else is still shrinking."

These gains, coupled with Microsoft's loss of 1.2 million active sites, led to Microsoft's share of active sites dropping to 9.27 percent, the first time that it has fallen below 10 percent. Apache increased its market share by 0.19 percentage points and continues to dominate, now with 46.30 percent of active sites. Still, it is true that over the years Apache has been slowly declining, while NGINX is now at 19 percent.That's not quite true. According to the [October Netcraft web server survey][7], Apache saw the largest increase of active sites this month, gaining 1.8 million, while NGINX gained 400,000, the second-largest growth.

NGINX's developers are seeking to make their open-core commercial web server, [NGINX Plus][8], more competitive by continuing to improve it. With the latest release, [NGINX Plus Release 11 (R11][9]), the server is both easier to extend and customize, and support a broader range of deployments.

The biggest addition is binary compatibility for [dynamic modules][10]. This means that dynamic modules that have been compiled against the [open-source NGINX software][11] can be loaded into NGINX Plus.

This means you can leverage the large number of [third‑party NGINX modules][12] to extend and add functionality to NGINX Plus, drawing from a range of open-source and commercially produced modules. Developers can create custom extensions, add‑ons, and new products based on the supported NGINX Plus core.

NGINX Plus R11 also added other enhancements:

*   [Improved TCP/UDP load balancing][1] -- New features include SSL server name routing, new logging functionality, additional variables, and improved PROXY protocol support. These new features enhance debugging capabilities and enable you to support a broader range of enterprise applications.
*   [Better geolocation by IP address][2] -- The third‑party GeoIP2 module is now certified and provided to NGINX Plus customers. This new version provides localized and richer location detail than the original GeoIP module.
*   [Enhanced nginScript module][3] -- nginScript is the next‑generation configuration language for NGINX Plus, based on JavaScript. New features enable you to modify request and response data on the fly in the Stream (TCP/UDP) module.

The end result? NGINX is poised to continue to make the race for the top web server a two-horse race. Microsoft IIS? It continues to slowly fade away.

--------------------------------------------------------------------------------

via: http://www.zdnet.com/article/when-to-use-nginx-instead-of-apache/

作者：[ Steven J. Vaughan-Nichols][a]
译者：[译者ID](https://github.com/译者ID)
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
