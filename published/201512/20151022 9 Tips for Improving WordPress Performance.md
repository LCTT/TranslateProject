深入浅出讲述提升 WordPress 性能的九大秘笈
================================================================================

在建站和 web 应用程序交付方面，WordPress 是全球最大的一个平台。全球大约[四分之一][1] 的站点现在正在使用开源 WordPress 软件，包括 eBay、 Mozilla、 RackSpace、 TechCrunch、 CNN、 MTV、纽约时报、华尔街日报 等等。

最流行的个人博客平台 WordPress.com，其也运行在 WordPress 开源软件上。[而 NGINX 则为 WordPress.com 提供了动力][2]。在 WordPress.com 的用户当中，许多站点起步于 WordPress.com，然后换成了自己运行 WordPress 开源软件；它们中越来越多的站点也使用了 NGINX 软件。

WordPress 的吸引力源于其简单性，无论是对于最终用户还是安装架设。然而，当使用量不断增长时，WordPress 站点的体系结构也存在一定的问题 - 这里有几个方法，包括使用缓存，以及将 WordPress 和 NGINX 组合起来，可以解决这些问题。

在这篇博客中，我们提供了九个提速技巧来帮助你解决 WordPress 中一些常见的性能问题：

- [缓存静态资源][3]
- [缓存动态文件][4]
- [迁移到 NGINX][5]
- [添加 NGINX 静态链接支持][6]
- [为 NGINX 配置 FastCGI][7]
- [为 NGINX 配置 W3_Total_Cache][8]
- [为 NGINX 配置 WP-Super-Cache][9]
- [为 NGINX 配置安全防范措施][10]
- [配置 NGINX 支持 WordPress 多站点][11]

###  在 LAMP 架构下 WordPress 的性能  ###

大多数 WordPress 站点都运行在传统的 LAMP 架构下：Linux 操作系统，Apache Web 服务器软件，MySQL 数据库软件（通常是一个单独的数据库服务器）和 PHP 编程语言。这些都是非常著名的，广泛应用的开源工具。在 WordPress 世界里，很多人都用的是 LAMP，所以很容易寻求帮助和支持。

当用户访问 WordPress 站点时，浏览器为每个用户创建六到八个连接来连接到 Linux/Apache 上。当用户请求连接时，PHP 即时生成每个页面，从 MySQL 数据库获取资源来响应请求。

LAMP 或许对于数百个并发用户依然能照常工作。然而，流量突然增加是常见的，并且通常这应该算是一件好事。

但是，当 LAMP 站点变得繁忙时，当同时在线的用户达到数千个时，它的瓶颈就会被暴露出来。瓶颈存在主要是两个原因：

1. Apache Web 服务器 - Apache 的每个/每次连接需要消耗大量资源。如果 Apache 接受了太多的并发连接，内存可能会耗尽，从而导致性能急剧降低，因为数据必须交换到磁盘了。如果以限制连接数来提高响应时间，新的连接必须等待，这也导致了用户体验变得很差。

1. PHP/MySQL 的交互 - 一个运行 PHP 和 MySQL 数据库服务器的应用服务器上每秒的请求量有一个最大限制。当请求的数量超过这个最大限制时，用户必须等待。超过这个最大限制时也会增加所有用户的响应时间。超过其两倍以上时会出现明显的性能问题。

LAMP 架构的网站出现性能瓶颈是常见的情况，这时就需要升级硬件了 - 增加 CPU，扩大磁盘空间等等。当 Apache 和 PHP/MySQL 的架构超载后，在硬件上不断的提升却跟不上系统资源指数增长的需求。

首选替代 LAMP 架构的是 LEMP 架构 – Linux, NGINX, MySQL, 和 PHP。 (这是 LEMP 的缩写，E 代表着 “engine-x.” 的发音。) 我们在 [技巧 3][12] 中会描述 LEMP 架构。

### 技巧 1. 缓存静态资源 ###

静态资源是指不变的文件，像 CSS，JavaScript 和图片。这些文件往往在网页的数据中占半数以上。页面的其余部分是动态生成的，像在论坛中评论，性能仪表盘，或个性化的内容（可以看看 Amazon.com 产品）。

缓存静态资源有两大好处：

- 更快的交付给用户 - 用户可以从它们浏览器的缓存或者从互联网上离它们最近的缓存服务器获取静态文件。有时候文件较大，因此减少等待时间对它们来说帮助很大。

- 减少应用服务器的负载 - 从缓存中检索到的每个文件会让 web 服务器少处理一个请求。你的缓存越多，用户等待的时间越短。

要让浏览器缓存文件，需要在静态文件中设置正确的 HTTP 首部。看看 HTTP Cache-Control 首部，特别是设置了 max-age 参数，Expires 首部，以及 Entity 标记。[这里][13] 有详细的介绍。

当启用本地缓存，然后用户请求以前访问过的文件时，浏览器首先检查该文件是否在缓存中。如果在，它会询问 Web 服务器该文件是否改变过。如果该文件没有改变，Web 服务器将立即响应一个304状态码（未改变），这意味着该文件没有改变，而不是返回状态码200 OK 并检索和发送已改变的文件。

要在浏览器之外支持缓存，可以考虑下面讲到的技巧，以及考虑使用内容分发网络（CDN）。CDN 是一​​种流行且​​强大的缓存工具，但我们在这里不详细描述它。在你实现了这里讲到的其它技术之后可以考虑 CDN。此外，当你的站点从 HTTP/1.x 过渡到 HTTP/2 协议时，CDN 的用处可能不太大；根据需要调查和测试，找到你网站需要的正确方法。

如果你转向 NGINX Plus 或将开源的 NGINX 软件作为架构的一部分，建议你考虑 [技巧 3][14]，然后配置 NGINX 缓存静态资源。使用下面的配置，用你 Web 服务器的 URL 替换 www.example.com。

    server {
        # substitute your web server's URL for www.example.com
        server_name www.example.com;
        root /var/www/example.com/htdocs;
        index index.php;
    
        access_log /var/log/nginx/example.com.access.log;
        error_log /var/log/nginx/example.com.error.log;
    
        location / {
            try_files $uri $uri/ /index.php?$args;
        }
    
        location ~ \.php$ {
            try_files $uri =404;
            include fastcgi_params;
            # 使用你 WordPress 服务器的套接字，地址和端口来替换
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            #fastcgi_pass 127.0.0.1:9000;
     	}   
    
        location ~* .(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|css|rss|atom|js|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {
            expires max;
            log_not_found off;
            access_log off;
        }
    }

### 技巧 2. 缓存动态文件 ###

WordPress 动态地生成网页，这意味着每次请求时它都要生成一个给定的网页（即使和前一次的结果相同）。这意味着用户随时获得的是最新内容。

想一下，当用户访问一个帖子时，并在文章底部有用户的评论时。你希望用户能够看到所有的评论 - 即使评论刚刚发布。动态内容就是处理这种情况的。

但现在，当帖子每秒出现十几二十几个请求时。应用服务器可能每秒需要频繁生成页面导致其压力过大，造成延误。为了给用户提供最新的内容，每个访问理论上都是新的请求，因此它们不得不在原始出处等待很长时间。

为了防止页面由于不断提升的负载而变得缓慢，需要缓存动态文件。这需要减少文件的动态内容来提高整个系统的响应速度。

要在 WordPress 中启用缓存中，需要使用一些流行的插件 - 如下所述。WordPress 的缓存插件会请求最新的页面，然后将其缓存短暂时间 - 也许只有几秒钟。因此，如果该网站每秒中会有几个请求，那大多数用户获得的页面都是缓存的副本。这也有助于提高所有用户的检索时间：

- 大多数用户获得页面的缓存副本。应用服务器没有做任何工作。
- 用户会得到一个之前的崭新副本。应用服务器只需每隔一段时间生成一个崭新页面。当服务器产生一个崭新页面（对于缓存过期后的第一个用户访问），它这样做要快得多，因为它的请求并没有超载。

你可以缓存运行在 LAMP 架构或者 [LEMP 架构][15] 上 WordPress 的动态文件（在 [技巧 3][16] 中说明了）。有几个缓存插件，你可以在 WordPress 中使用。运用到了最流行的缓存插件和缓存技术，从最简单到最强大的：

- [Hyper-Cache][17] 和 [Quick-Cache][18] – 这两个插件为每个 WordPress 页面创建单个 PHP 文件。它支持绕过多个 WordPress 与数据库的连接核心处理的一些动态功能，创建一个更快的用户体验。它们不会绕过所有的 PHP 处理，所以并不会如下面那些取得同样的性能提升。它们也不需要修改 NGINX 的配置。

- [WP Super Cache][19] – 最流行的 WordPress 缓存插件。在它易用的界面易用上提供了许多功能，如下所示。我们在 [技巧 7][20] 中展示了一个简单的 NGINX 配置实例。

- [W3 Total Cache][21] – 这是第二流行的 WordPress 缓存插件。它比 WP Super Cache 的功能更强大，但它有些配置选项比较复杂。样例 NGINX 配置，请看 [技巧 6][22]。

- [FastCGI][23] – CGI 的意思是通用网关接口（ Common Gateway Interface），在因特网上发送请求和接收文件的一种通用方式。它不是一个插件，而是一种与缓存交互缓存的方法。FastCGI 可以被用在 Apache 和 Nginx 上，它也是最流行的动态缓存方法；我们在 [技巧 5][24] 中描述了如何配置 NGINX 来使用它。

这些插件和技术的文档解释了如何在典型的 LAMP 架构中配置它们。配置方式包括数据库和对象缓存；最小化 HTML、CSS 和 JavaScript；集成流行的 CDN 集成环境。对于 NGINX 的配置，请看列表中的提示技巧。

**注意**：缓存不会用于已经登录的 WordPress 用户，因为他们的 WordPress 页面都是不同的。（对于大多数网站来说，只有一小部分用户可能会登录）此外，大多数缓存不会对刚刚评论过的用户显示缓存页面，因为当用户刷新页面时希望看到他们的评论。若要缓存页面的非个性化内容，如果它对整体性能来说很重要，可以使用一种称为 [碎片缓存（fragment caching）][25] 的技术。

### 技巧 3. 使用 NGINX ###

如上所述，当并发用户数超过某一数量时 Apache 会导致性能问题 – 可能是数百个用户同时使用。Apache 对于每一个连接会消耗大量的资源，因而容易耗尽内存。Apache 可以配置连接数的值来避免耗尽内存，但是这意味着，超过限制时，新的连接请求必须等待。

此外，Apache 为每个连接加载一个 mod_php 模块副本到内存中，即使只有服务于静态文件（图片，CSS，JavaScript 等）。这使得每个连接消耗更多的资源，从而限制了服务器的性能。

要解决这些问题，从 LAMP 架构迁到 LEMP 架构 – 使用 NGINX 取代 Apache 。NGINX 在一定的内存之下就能处理成千上万的并发连接数，所以你不必经历颠簸，也不必限制并发连接数到很小的数量。

NGINX 处理静态文件的性能也较好，它有内置的，容易调整的 [缓存][26] 控制策略。减少应用服务器的负载，你的网站的访问速度会更快，用户体验更好。

你可以在部署环境的所有 Web 服务器上使用 NGINX，或者你可以把一个 NGINX 服务器作为 Apache 的“前端”来进行反向代理 - NGINX 服务器接收客户端请求，将请求的静态文件直接返回，将 PHP 请求转发到 Apache 上进行处理。

对于动态页面的生成，这是 WordPress 核心体验，可以选择一个缓存工具，如 [技巧 2][27] 中描述的。在下面的技巧中，你可以看到 FastCGI，W3\_Total\_Cache 和 WP-Super-Cache 在 NGINX 上的配置示例。 （Hyper-Cache 和 Quick-Cache 不需要改变 NGINX 的配置。）

**技巧** 缓存通常会被保存到磁盘上，但你可以用 [tmpfs][28] 将缓存放在内存中来提高性能。

为 WordPress 配置 NGINX 很容易。仅需四步，其详细的描述在指定的技巧中：

1. 添加永久链接的支持 - 让 NGINX 支持永久链接。此步消除了对 **.htaccess** 配置文件的依赖，这是 Apache 特有的。参见 [技巧 4][29]。
2. 配置缓存 - 选择一个缓存工具并安装好它。可选择的有 FastCGI cache，W3 Total Cache, WP Super Cache, Hyper Cache, 和 Quick Cache。请看技巧 [5][30]、 [6][31] 和 [7][32]。
3. 落实安全防范措施 - 在 NGINX 上采用对 WordPress 最佳安全的做法。参见 [技巧 8][33]。
4. 配置 WordPress 多站点 - 如果你使用 WordPress 多站点，在 NGINX 下配置子目录，子域，或多域名架构。见 [技巧9][34]。

### 技巧 4. 让 NGINX 支持永久链接 ###

许多 WordPress 网站依赖于 **.htaccess** 文件，此文件为 WordPress 的多个功能所需要，包括永久链接支持、插件和文件缓存。NGINX 不支持 **.htaccess** 文件。幸运的是，你可以使用 NGINX 的简单而全面的配置文件来实现大部分相同的功能。

你可以在你的主 [server][36] 块下添加下面的 location 块中为使用 NGINX 的 WordPress 启用 [永久链接][35]。（此 location 块在其它代码示例中也会被包括）。

**try_files** 指令告诉 NGINX 检查请求的 URL 在文档根目录（**/var/www/example.com/htdocs**）下是作为文件(**$uri**)还是目录(**$uri/**) 存在的。如果都不是，NGINX 将重定向到 **/index.php**，并传递查询字符串参数作为参数。

    server {
        server_name example.com www.example.com;
        root /var/www/example.com/htdocs;
        index index.php;
    
        access_log /var/log/nginx/example.com.access.log;
        error_log  /var/log/nginx/example.com.error.log;
    
        location / {
            try_files $uri $uri/ /index.php?$args;
        }
    }

### 技巧 5. 在 NGINX 中配置 FastCGI ###

NGINX 可以缓存来自 FastCGI 应用程序的响应，如 PHP 响应。此方法可提供最佳的性能。

对于开源的 NGINX，编译入第三方模块 [ngx\_cache\_purge][37] 可以提供缓存清除能力，配置代码如下所示。NGINX Plus 已经包含了它自己实现此代码。

当使用 FastCGI 时，我们建议你安装 [NGINX 辅助插件][38] 并使用下面的配置文件，尤其是要注意 **fastcgi\_cache\_key** 的使用和包括 **fastcgi\_cache\_purge** 的 location 块。当页面发布或有改变时，有新评论被发布时，该插件会自动清除你的缓存，你也可以从 WordPress 管理控制台手动清除。

NGINX 的辅助插件还可以在你网页的底部添加一个简短的 HTML 代码，以确认缓存是否正常并显示一些统计数据。（你也可以使用 [$upstream\_cache\_status][39] 确认缓存功能是否正常。）

	fastcgi_cache_path /var/run/nginx-cache levels=1:2       
                   keys_zone=WORDPRESS:100m inactive=60m;
	fastcgi_cache_key "$scheme$request_method$host$request_uri";

    server {
        server_name example.com www.example.com;
        root /var/www/example.com/htdocs;
        index index.php;
    
        access_log /var/log/nginx/example.com.access.log;
        error_log  /var/log/nginx/example.com.error.log;
    
        set $skip_cache 0;
           
		# POST 请求和带有查询参数的网址应该交给 PHP
        if ($request_method = POST) {
            set $skip_cache 1;
        }   
    
        if ($query_string != "") {
            set $skip_cache 1;
        }   
    
		#以下 uris 中包含的部分不缓存
        if ($request_uri ~* "/wp-admin/|/xmlrpc.php|wp-.*.php|/feed/|index.php
                             |sitemap(_index)?.xml") {
            set $skip_cache 1;
        }   

		#不要为登录用户或最近的评论者进行缓存
        if ($http_cookie ~* "comment_author|wordpress_[a-f0-9]+|wp-postpass
            |wordpress_no_cache|wordpress_logged_in") {
            set $skip_cache 1;
        }
    
        location / {
            try_files $uri $uri/ /index.php?$args;
        }    
    
        location ~ \.php$ {
            try_files $uri /index.php;
            include fastcgi_params;
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            fastcgi_cache_bypass $skip_cache;
            fastcgi_no_cache $skip_cache;
            fastcgi_cache WORDPRESS;
            fastcgi_cache_valid  60m;
        }
    
        location ~ /purge(/.*) {
            fastcgi_cache_purge WORDPRESS "$scheme$request_method$host$1";
        }	
    
        location ~* ^.+\.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|css|rss|atom|js|jpg|jpeg|gif|png
                          |ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {
    
            access_log off;	
            log_not_found off;
            expires max;
        }
    
        location = /robots.txt {
            access_log off;
            log_not_found off;
        }
    
        location ~ /\. {
            deny  all; 
            access_log off;
            log_not_found off;
        }
    }

### 技巧 6. 为 NGINX 配置 W3\_Total\_Cache ###

[W3 Total Cache][40], 是 [W3-Edge][41] 的 Frederick Townes 出品的， 是一个支持 NGINX 的 WordPress 缓存框架。其有众多选项配置，可以替代 FastCGI 缓存。

这个缓存插件提供了各种缓存配置，还包括数据库和对象的缓存，最小化 HTML、CSS 和 JavaScript，并可选与流行的 CDN 整合。

这个插件会通过写入一个位于你的域的根目录的 NGINX 配置文件来控制 NGINX。

    server {
        server_name example.com www.example.com;
    
        root /var/www/example.com/htdocs;
        index index.php;
        access_log /var/log/nginx/example.com.access.log;
        error_log  /var/log/nginx/example.com.error.log;
    
        include /path/to/wordpress/installation/nginx.conf;
    
        location / {
            try_files $uri $uri/ /index.php?$args;
        }
    
        location ~ \.php$ {
            try_files $uri =404;
            include fastcgi_params;
            fastcgi_pass unix:/var/run/php5-fpm.sock;
        }
    }

### 技巧 7. 为 NGINX 配置 WP Super Cache ###

[WP Super Cache][42] 是由 Donncha O Caoimh 开发的, 他是 [Automattic][43] 的一个 WordPress 开发者, 这是一个 WordPress 缓存引擎，它可以将 WordPress 的动态页面转变成静态 HTML 文件，以使 NGINX 可以很快的提供服务。它是第一个 WordPress 缓存插件，和其它的相比，它更专注于某一特定的领域。

配置 NGINX 使用 WP Super Cache 可以根据你的喜好而进行不同的配置。以下是一个示例配置。

在下面的配置中，带有名为 supercache 的 location 块是 WP Super Cache 特有的部分。 WordPress 规则的其余代码用于不缓存已登录用户的信息，不缓存 POST 请求，并对静态资源设置过期首部，再加上标准的 PHP 处理；这部分可以根据你的需求进行定制。


    server {
        server_name example.com www.example.com;
        root /var/www/example.com/htdocs;
        index index.php;
    
        access_log /var/log/nginx/example.com.access.log;
        error_log  /var/log/nginx/example.com.error.log debug;
    
        set $cache_uri $request_uri;
    
        # POST 请求和带有查询字符串的网址应该交给 PHP
        if ($request_method = POST) {
            set $cache_uri 'null cache';
        }  
        if ($query_string != "") {
            set $cache_uri 'null cache';
        }   
    
        #以下 uris 中包含的部分不缓存
        if ($request_uri ~* "(/wp-admin/|/xmlrpc.php|/wp-(app|cron|login|register|mail).php
                              |wp-.*.php|/feed/|index.php|wp-comments-popup.php
                              |wp-links-opml.php|wp-locations.php |sitemap(_index)?.xml
                              |[a-z0-9_-]+-sitemap([0-9]+)?.xml)") {
    
            set $cache_uri 'null cache';
        }  
    	
        #不对已登录用户和最近的评论者使用缓存
        if ($http_cookie ~* "comment_author|wordpress_[a-f0-9]+
                             |wp-postpass|wordpress_logged_in") {
            set $cache_uri 'null cache';
        }
    
        #当请求的文件存在时使用缓存，否则将请求转发给 WordPress
        location / {
            try_files /wp-content/cache/supercache/$http_host/$cache_uri/index.html 
                      $uri $uri/ /index.php;
        }    
    
        location = /favicon.ico {
            log_not_found off; 
            access_log off;
        }
    
        location = /robots.txt {
            log_not_found off
            access_log off;
        }
    
        location ~ .php$ {
            try_files $uri /index.php;
            include fastcgi_params;
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            #fastcgi_pass 127.0.0.1:9000;
        }
    	
        # 尽可能的缓存静态文件
        location ~*.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|css
               |rss|atom|js|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2
               |doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {
            expires max;
            log_not_found off;
            access_log off;
        }
    }

### 技巧 8. 为 NGINX 配置安全防范措施 ###

为了防止攻击，可以控制对关键资源的访问并限制机器人对登录功能的过量攻击。

只允许特定的 IP 地址访问 WordPress 的仪表盘。

	#对访问 WordPress 的仪表盘进行限制
    location /wp-admin {
        deny  192.192.9.9;
        allow 192.192.1.0/24;
        allow 10.1.1.0/16;
        deny  all;
    }

只允许上传特定类型的文件，以防止恶意代码被上传和运行。

	#当上传的不是图像，视频，音乐等时，拒绝访问。
    location ~* ^/wp-content/uploads/.*.(html|htm|shtml|php|js|swf)$ {
        deny all;
    }

拒绝其它人访问 WordPress 的配置文件 **wp-config.php**。拒绝其它人访问的另一种方法是将该文件的一个目录移到域的根目录之上的目录。

    # 拒绝其它人访问 wp-config.php
    location ~* wp-config.php {
        deny all;
    }

对 **wp-login.php** 进行限速来防止暴力破解。

    # 拒绝访问 wp-login.php
    location = /wp-login.php {
        limit_req zone=one burst=1 nodelay;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        #fastcgi_pass 127.0.0.1:9000;
    }

### 技巧 9. 配置 NGINX 支持 WordPress 多站点 ###

WordPress 多站点（WordPress Multisite），顾名思义，这个版本 WordPress 可以让你以单个实例管理两个或多个网站。[WordPress.com][44] 运行的就是 WordPress 多站点，其主机为成千上万的用户提供博客服务。

你可以从单个域的任何子目录或从不同的子域来运行独立的网站。

使用此代码块添加对子目录的支持。

    # 在 WordPress 多站点中添加对子目录结构的支持
    if (!-e $request_filename) {
        rewrite /wp-admin$ $scheme://$host$uri/ permanent;	
        rewrite ^(/[^/]+)?(/wp-.*) $2 last;                     
        rewrite ^(/[^/]+)?(/.*\.php) $2 last;                   
    }

使用此代码块来替换上面的代码块以添加对子目录结构的支持，替换为你自己的子目录名。

    # 添加支持子域名
    server_name example.com *.example.com;

旧版本（3.4以前）的 WordPress 多站点使用 readfile() 来提供静态内容。然而，readfile() 是 PHP 代码，它会导致在执行时性能会显著降低。我们可以用 NGINX 来绕过这个非必要的 PHP 处理。该代码片段在下面被（==============）线分割出来了。

	# 避免对子目录中 /blogs.dir/ 结构执行  PHP readfile() 
    location ^~ /blogs.dir {
        internal;
        alias /var/www/example.com/htdocs/wp-content/blogs.dir;
        access_log off;
        log_not_found off;
        expires max;
    }
    
    ============================================================
    
	# 避免对子目录中 /files/ 结构执行  PHP readfile() 
	    location ~ ^(/[^/]+/)?files/(?.+) {
        try_files /wp-content/blogs.dir/$blogid/files/$rt_file /wp-includes/ms-files.php?file=$rt_file;
        access_log off;
        log_not_found off;
        expires max;
    }
    
    ============================================================
    
	# 子域路径的WPMU 文件结构
    location ~ ^/files/(.*)$ {
        try_files /wp-includes/ms-files.php?file=$1 =404;
        access_log off;
        log_not_found off;
        expires max;
    }
    
    ============================================================
    
    # 映射博客 ID 到特定的目录
    map $http_host $blogid {
        default           0;
        example.com       1;
        site1.example.com 2;
        site1.com 	      2;
    }

### 结论 ###

可扩展性对许多要让他们的 WordPress 站点取得成功的开发者来说是一项挑战。（对于那些想要跨越 WordPress 性能门槛的新站点而言。）为 WordPress 添加缓存，并将 WordPress 和 NGINX 结合，是不错的答案。

NGINX 不仅用于 WordPress 网站。世界上排名前 1000、10000 和 100000 网站中 NGINX 也是 [遥遥领先的 web 服务器][45]。

欲了解更多有关 NGINX 的性能，请看我们最近的博客，[让应用性能提升 10 倍的 10 个技巧][46]。

NGINX 软件有两个版本：

- NGINX 开源软件 - 像 WordPress 一样，此软件你可以自行下载，配置和编译。
- NGINX Plus - NGINX Plus 包括一个预构建的参考版本的软件，以及服务和技术支持。

想要开始，先到 [nginx.org][47] 下载开源软件并了解下 [NGINX Plus][48]。

--------------------------------------------------------------------------------

via: https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/

作者：[Floyd Smith][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.nginx.com/blog/author/floyd/
[1]:http://w3techs.com/technologies/overview/content_management/all
[2]:https://www.nginx.com/press/choosing-nginx-growth-wordpresscom/
[3]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#cache-static
[4]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#cache-dynamic
[5]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#adopt-nginx
[6]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#permalink
[7]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#fastcgi
[8]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#w3-total-cache
[9]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#wp-super-cache
[10]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#security
[11]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#multisite
[12]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#adopt-nginx
[13]:http://www.mobify.com/blog/beginners-guide-to-http-cache-headers/
[14]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#adopt-nginx
[15]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#lamp
[16]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#adopt-nginx
[17]:https://wordpress.org/plugins/hyper-cache/
[18]:https://wordpress.org/plugins/quick-cache/
[19]:https://wordpress.org/plugins/wp-super-cache/
[20]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#wp-super-cache
[21]:https://wordpress.org/plugins/w3-total-cache/
[22]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#w3-total-cache
[23]:http://www.fastcgi.com/
[24]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#fastcgi
[25]:https://css-tricks.com/wordpress-fragment-caching-revisited/
[26]:https://www.nginx.com/resources/admin-guide/content-caching/
[27]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#cache-dynamic
[28]:https://www.kernel.org/doc/Documentation/filesystems/tmpfs.txt
[29]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#permalink
[30]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#fastcgi
[31]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#w3-total-cache
[32]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#wp-super-cache
[33]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#security
[34]:https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/#multisite
[35]:http://codex.wordpress.org/Using_Permalinks
[36]:http://nginx.org/en/docs/http/ngx_http_core_module.html#server
[37]:https://github.com/FRiCKLE/ngx_cache_purge
[38]:https://wordpress.org/plugins/nginx-helper/
[39]:http://nginx.org/en/docs/http/ngx_http_upstream_module.html#variables
[40]:https://wordpress.org/plugins/w3-total-cache/
[41]:http://www.w3-edge.com/
[42]:https://wordpress.org/plugins/wp-super-cache/
[43]:http://automattic.com/
[44]:https://wordpress.com/
[45]:http://w3techs.com/technologies/cross/web_server/ranking
[46]:https://www.nginx.com/blog/10-tips-for-10x-application-performance/
[47]:http://www.nginx.org/en
[48]:https://www.nginx.com/products/
[49]:
[50]:
