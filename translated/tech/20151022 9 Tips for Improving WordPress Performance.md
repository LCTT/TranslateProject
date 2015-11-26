
提高 WordPress 性能的9个技巧
================================================================================

关于建站和 web 应用程序交付，WordPress 是全球最大的一个平台。全球大约 [四分之一][1] 的站点现在正在使用开源 WordPress 软件，包括 eBay, Mozilla, RackSpace, TechCrunch, CNN, MTV,纽约时报，华尔街日报。

WordPress.com，对于用户创建博客平台是最流行的，其也运行在WordPress 开源软件上。[NGINX powers WordPress.com][2]。许多 WordPress 用户刚开始在 WordPress.com 上建站，然后移动到搭载着 WordPress 开源软件的托管主机上;其中大多数站点都使用 NGINX 软件。

WordPress 的吸引力是它的简单性，无论是安装启动或者对于终端用户的使用。然而，当使用量不断增长时，WordPress 站点的体系结构也存在一定的问题 - 这里几个方法，包括使用缓存以及组合 WordPress 和 NGINX，可以解决这些问题。

在这篇博客中，我们提供了9个技巧来进行优化，以帮助你解决 WordPress 中一些常见的性能问题：

- [缓存静态资源][3]
- [缓存动态文件][4]
- [使用 NGINX][5]
- [添加支持 NGINX 的链接][6]
- [为 NGINX 配置 FastCGI][7]
- [为 NGINX 配置 W3_Total_Cache][8]
- [为 NGINX 配置 WP-Super-Cache][9]
- [为 NGINX 配置安全防范措施][10]
- [配置 NGINX 支持 WordPress 多站点][11]

###  在 LAMP 架构下 WordPress 的性能  ###

大多数 WordPress 站点都运行在传统的 LAMP 架构下：Linux 操作系统，Apache Web 服务器软件，MySQL 数据库软件 - 通常是一个单独的数据库服务器 - 和 PHP 编程语言。这些都是非常著名的，广泛应用的开源工具。大多数人都将 WordPress “称为” LAMP，并且很容易寻求帮助和支持。

当用户访问 WordPress 站点时，浏览器为每个用户创建六到八个连接来运行 Linux/Apache 的组合。当用户请求连接时，每个页面的 PHP 文件开始飞速的从 MySQL 数据库争夺资源来响应请求。

LAMP 对于数百个并发用户依然能照常工作。然而，流量突然增加是常见的并且 - 通常是 - 一件好事。

但是，当 LAMP 站点变得繁忙时，当同时在线的用户达到数千个时，它的瓶颈就会被暴露出来。瓶颈存在主要是两个原因：

1. Apache Web 服务器 - Apache 为每一个连接需要消耗大量资源。如果 Apache 接受了太多的并发连接，内存可能会耗尽，性能急剧降低，因为数据必须使用磁盘进行交换。如果以限制连接数来提高响应时间，新的连接必须等待，这也导致了用户体验变得很差。

1. PHP/MySQL 的交互 - 总之，一个运行 PHP 和 MySQL 数据库服务器的应用服务器上每秒的请求量不能超过最大限制。当请求的数量超过最大连接数时，用户必须等待。超过最大连接数时也会增加所有用户的响应时间。超过其两倍以上时会出现明显的性能问题。

 LAMP 架构的网站一般都会出现性能瓶颈，这时就需要升级硬件了 - 加 CPU，扩大磁盘空间等等。当 Apache 和 PHP/MySQL 的架构负载运行后，在硬件上不断的提升无法保证对系统资源指数增长的需求。

最先取代 LAMP 架构的是 LEMP 架构 – Linux, NGINX, MySQL, 和 PHP。 (这是 LEMP 的缩写，E 代表着 “engine-x.” 的发音。) 我们在 [技巧 3][12] 中会描述 LEMP 架构。

### 技巧 1. 缓存静态资源 ###

静态资源是指不变的文件，像 CSS，JavaScript 和图片。这些文件往往在网页的数据中占半数以上。页面的其余部分是动态生成的，像在论坛中评论，仪表盘的性能，或个性化的内容（可以看看Amazon.com 产品）。

缓存静态资源有两大好处：

- 更快的交付给用户 - 用户从他们浏览器的缓存或者从互联网上离他们最近的缓存服务器获取静态文件。有时候文件较大，因此减少等待时间对他们来说帮助很大。

- 减少应用服务器的负载 - 从缓存中检索到的每个文件会让 web 服务器少处理一个请求。你的缓存越多，用户等待的时间越短。

要让浏览器缓存文件，需要早在静态文件中设置正确的 HTTP 首部。当看到 HTTP Cache-Control 首部时，特别设置了 max-age，Expires 首部，以及 Entity 标记。[这里][13] 有详细的介绍。

当启用本地缓存然后用户请求以前访问过的文件时，浏览器首先检查该文件是否在缓存中。如果在，它会询问 Web 服务器该文件是否改变过。如果该文件没有改变，Web 服务器将立即响应一个304状态码（未改变），这意味着该文件没有改变，而不是返回状态码200 OK，然后继续检索并发送已改变的文件。

为了支持浏览器以外的缓存，可以考虑下面的方法，内容分发网络（CDN）。CDN 是一​​种流行且​​强大的缓存工具，但我们在这里不详细描述它。可以想一下 CDN 背后的支撑技术的实现。此外，当你的站点从 HTTP/1.x 过渡到 HTTP/2 协议时，CDN 的用处可能不太大;根据需要调查和测试，找到你网站需要的正确方法。

如果你转向 NGINX Plus 或开源的 NGINX 软件作为架构的一部分，建议你考虑 [技巧 3][14]，然后配置 NGINX 缓存静态资源。使用下面的配置，用你 Web 服务器的 URL 替换 www.example.com。

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

WordPress 是动态生成的网页，这意味着每次请求时它都要生成一个给定的网页（即使和前一次的结果相同）。这意味着用户随时获得的是最新内容。

想一下，当用户访问一个帖子时，并在文章底部有用户的评论时。你希望用户能够看到所有的评论 - 即使评论刚刚发布。动态内容就是处理这种情况的。

但现在，当帖子每秒出现十几二十几个请求时。应用服务器可能每秒需要频繁生成页面导致其压力过大，造成延误。为了给用户提供最新的内容，每个访问理论上都是新的请求，因此他们也不得不在首页等待。

为了防止页面由于负载过大变得缓慢，需要缓存动态文件。这需要减少文件的动态内容来提高整个系统的响应速度。

要在 WordPress 中启用缓存中，需要使用一些流行的插件 - 如下所述。WordPress 的缓存插件需要刷新页面，然后将其缓存短暂时间 - 也许只有几秒钟。因此，如果该网站每秒中只有几个请求，那大多数用户获得的页面都是缓存的副本。这也有助于提高所有用户的检索时间：

- 大多数用户获得页面的缓存副本。应用服务器没有做任何工作。
- 用户很快会得到一个新的副本。应用服务器只需每隔一段时间刷新页面。当服务器产生一个新的页面（对于第一个用户访问后，缓存页过期），它这样做要快得多，因为它的请求不会超载。

你可以缓存运行在 LAMP 架构或者 [LEMP 架构][15] 上 WordPress 的动态文件（在 [技巧 3][16] 中说明了）。有几个缓存插件，你可以在 WordPress 中使用。这里有最流行的缓存插件和缓存技术，从最简单到最强大的：

- [Hyper-Cache][17] 和 [Quick-Cache][18] – 这两个插件为每个 WordPress 页面创建单个 PHP 文件。它支持的一些动态函数会绕过多个 WordPress 与数据库的连接核心处理，创建一个更快的用户体验。他们不会绕过所有的 PHP 处理，所以使用以下选项他们不能给出相同的性能提升。他们也不需要修改 NGINX 的配置。

- [WP Super Cache][19] – 最流行的 WordPress 缓存插件。它有许多功能，它的界面非常简洁，如下图所示。我们展示了 NGINX 一个简单的配置实例在 [技巧 7][20] 中。

- [W3 Total Cache][21] – 这是第二大最受欢迎的 WordPress 缓存插件。它比 WP Super Cache 的功能更强大，但它有些配置选项比较复杂。一个 NGINX 的简单配置，请看 [技巧 6][22]。

- [FastCGI][23] – CGI 代表通用网关接口，在因特网上发送请求和接收文件。它不是一个插件只是一种能直接使用缓存的方法。FastCGI 可以被用在 Apache 和 Nginx 上，它也是最流行的动态缓存方法；我们在 [技巧 5][24] 中描述了如何配置 NGINX 来使用它。

这些插件的技术文档解释了如何在 LAMP 架构中配置它们。配置选项包括数据库和对象缓存；也包括使用 HTML，CSS 和 JavaScript 来构建 CDN 集成环境。对于 NGINX 的配置，请看列表中的提示技巧。

**注意**：WordPress 不能缓存用户的登录信息，因为它们的 WordPress 页面都是不同的。（对于大多数网站来说，只有一小部分用户可能会登录），大多数缓存不会对刚刚评论过的用户显示缓存页面，只有当用户刷新页面时才会看到他们的评论。若要缓存页面的非个性化内容，如果它对整体性能来说很重要，可以使用一种称为 [fragment caching][25] 的技术。

### 技巧 3. 使用 NGINX ###

如上所述，当并发用户数超过某一值时 Apache 会导致性能问题 – 可能数百个用户同时使用。Apache 对于每一个连接会消耗大量的资源，因而容易耗尽内存。Apache 可以配置连接数的值来避免耗尽内存，但是这意味着，超过限制时，新的连接请求必须等待。

此外，Apache 使用 mod_php 模块将每一个连接加载到内存中，即使只有静态文件（图片，CSS，JavaScript 等）。这使得每个连接消耗更多的资源，从而限制了服务器的性能。

开始解决这些问题吧，从 LAMP 架构迁到 LEMP 架构 – 使用 NGINX 取代 Apache 。NGINX 仅消耗很少量的内存就能处理成千上万的并发连接数，所以你不必经历颠簸，也不必限制并发连接数。

NGINX 处理静态文件的性能也较好，它有内置的，简单的 [缓存][26] 控制策略。减少应用服务器的负载，你的网站的访问速度会更快，用户体验更好。

你可以在部署的所有 Web 服务器上使用 NGINX，或者你可以把一个 NGINX 服务器作为 Apache 的“前端”来进行反向代理 - NGINX 服务器接收客户端请求，将请求的静态文件直接返回，将 PHP 请求转发到 Apache 上进行处理。

对于动态页面的生成 - WordPress 核心体验 - 选择一个缓存工具，如 [技巧 2][27] 中描述的。在下面的技巧中，你可以看到 FastCGI，W3_Total_Cache 和 WP-Super-Cache 在 NGINX 上的配置示例。 （Hyper-Cache 和 Quick-Cache 不需要改变 NGINX 的配置。）

**技巧** 缓存通常会被保存到磁盘上，但你可以用 [tmpfs][28] 将缓存放在内存中来提高性能。

为 WordPress 配置 NGINX 很容易。按照这四个步骤，其详细的描述在指定的技巧中：

1.添加永久的支持 - 添加对 NGINX 的永久支持。此步消除了对 **.htaccess** 配置文件的依赖，这是 Apache 特有的。参见 [技巧 4][29]
2.配置缓存 - 选择一个缓存工具并安装好它。可选择的有 FastCGI cache，W3 Total Cache, WP Super Cache, Hyper Cache, 和 Quick Cache。请看技巧 [5][30], [6][31], 和 [7][32].
3.落实安全防范措施 - 在 NGINX 上采用对 WordPress 最佳安全的做法。参见 [技巧 8][33]。
4.配置 WordPress 多站点 - 如果你使用 WordPress 多站点，在 NGINX 下配置子目录，子域，或多个域的结构。见 [技巧9][34]。

### 技巧 4. 添加支持 NGINX 的链接 ###

许多 WordPress 网站依靠 **.htaccess** 文件，此文件依赖  WordPress 的多个功能，包括永久支持，插件和文件缓存。NGINX 不支持 **.htaccess** 文件。幸运的是，你可以使用 NGINX 的简单而全面的配置文件来实现大部分相同的功能。

你可以在使用 NGINX 的 WordPress 中通过在主 [server][36] 块下添加下面的 location 块中启用 [永久链接][35]。（此 location 块在其他代码示例中也会被包括）。

**try_files** 指令告诉 NGINX 检查请求的 URL 在根目录下是作为文件(**$uri**)还是目录(**$uri/**)，**/var/www/example.com/htdocs**。如果都不是，NGINX 将重定向到 **/index.php**，通过查询字符串参数判断是否作为参数。

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

NGINX 可以从 FastCGI 应用程序中缓存响应，如 PHP 响应。此方法可提供最佳的性能。

对于开源的 NGINX，第三方模块 [ngx_cache_purge][37] 提供了缓存清除能力，需要手动编译，配置代码如下所示。NGINX Plus 已经包含了此代码的实现。

当使用 FastCGI 时，我们建议你安装 [NGINX 辅助插件][38] 并使用下面的配置文件，尤其是要使用 **fastcgi_cache_key**  并且 location 块下要包括 **fastcgi_cache_purge**。当页面被发布或有改变时，甚至有新评论被发布时，该插件会自动清除你的缓存，你也可以从 WordPress 管理控制台手动清除。

NGINX 的辅助插件还可以添加一个简短的 HTML 代码到你网页的底部，确认缓存是否正常并显示一些统计工作。（你也可以使用  [$upstream_cache_status][39] 确认缓存功能是否正常。）

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
           
		# POST 请求和查询网址的字符串应该交给 PHP
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

		#用户不能使用缓存登录或缓存最近的评论
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

### 技巧 6. 为 NGINX 配置 W3_Total_Cache ###

[W3 Total Cache][40], 是 Frederick Townes 的 [W3-Edge][41] 下的, 是一个支持 NGINX 的 WordPress 缓存框架。其有众多选项配置，可以替代 FastCGI 缓存。

缓存插件提供了各种缓存配置，还包括数据库和对象的缓存，对 HTML，CSS 和 JavaScript，可选择性的与流行的 CDN 整合。

使用插件时，需要将其配置信息写入位于你的域的根目录的 NGINX  配置文件中。

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

[WP Super Cache][42] 是由 Donncha O Caoimh 完成的, [Automattic][43] 上的一个 WordPress 开发者, 这是一个 WordPress 缓存引擎，它可以将 WordPress 的动态页面转变成静态 HTML 文件，以使 NGINX 可以很快的提供服务。它是第一个 WordPress 缓存插件，和其他的相比，它更专注于某一特定的领域。

配置 NGINX 使用 WP Super Cache 可以根据你的喜好而进行不同的配置。以下是一个示例配置。

在下面的配置中，location 块中使用了名为 WP Super Cache 的超级缓存中部分配置来工作。代码的其余部分是根据 WordPress 的规则不缓存用户登录信息，不缓存 POST 请求，并对静态资源设置过期首部，再加上标准的 PHP 实现;这部分可以进行定制，来满足你的需求。


    server {
        server_name example.com www.example.com;
        root /var/www/example.com/htdocs;
        index index.php;
    
        access_log /var/log/nginx/example.com.access.log;
        error_log  /var/log/nginx/example.com.error.log debug;
    
        set $cache_uri $request_uri;
    
        # POST 请求和查询网址的字符串应该交给 PHP
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
    	
        #用户不能使用缓存登录或缓存最近的评论
        if ($http_cookie ~* "comment_author|wordpress_[a-f0-9]+
                             |wp-postpass|wordpress_logged_in") {
            set $cache_uri 'null cache';
        }
    
        #当请求的文件存在时使用缓存，否则将请求转发给WordPress
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

为了防止攻击，可以控制对关键资源的访问以及当机器超载时进行登录限制。

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

拒绝其他人访问 WordPress 的配置文件 **wp-config.php**。拒绝其他人访问的另一种方法是将该文件的一个目录移到域的根目录下。

    # 拒绝其他人访问 wp-config.php
    location ~* wp-config.php {
        deny all;
    }

对 **wp-login.php** 进行限速来防止暴力攻击。

    # 拒绝访问 wp-login.php
    location = /wp-login.php {
        limit_req zone=one burst=1 nodelay;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        #fastcgi_pass 127.0.0.1:9000;
    }

### 技巧 9. 配置 NGINX 支持 WordPress 多站点 ###

WordPress 多站点，顾名思义，使用同一个版本的 WordPress 从单个实例中允许你管理两个或多个网站。[WordPress.com][44]  运行的就是 WordPress 多站点，其主机为成千上万的用户提供博客服务。

你可以从单个域的任何子目录或从不同的子域来运行独立的网站。

使用此代码块添加对子目录的支持。

    # 在 WordPress 中添加支持子目录结构的多站点
    if (!-e $request_filename) {
        rewrite /wp-admin$ $scheme://$host$uri/ permanent;	
        rewrite ^(/[^/]+)?(/wp-.*) $2 last;                     
        rewrite ^(/[^/]+)?(/.*\.php) $2 last;                   
    }

使用此代码块来替换上面的代码块以添加对子目录结构的支持，子目录名自定义。

    # 添加支持子域名
    server_name example.com *.example.com;

旧版本（3.4以前）的 WordPress 多站点使用 readfile() 来提供静态内容。然而，readfile() 是 PHP 代码，它会导致在执行时性能会显著降低。我们可以用 NGINX 来绕过这个非必要的 PHP 处理。该代码片段在下面被（==============）线分割出来了。

	# 避免 PHP readfile() 在 /blogs.dir/structure 子目录中
    location ^~ /blogs.dir {
        internal;
        alias /var/www/example.com/htdocs/wp-content/blogs.dir;
        access_log off;
        log_not_found off;
        expires max;
    }
    
    ============================================================
    
	# 避免 PHP readfile() 在 /files/structure 子目录中
    location ~ ^(/[^/]+/)?files/(?.+) {
        try_files /wp-content/blogs.dir/$blogid/files/$rt_file /wp-includes/ms-files.php?file=$rt_file;
        access_log off;
        log_not_found off;
        expires max;
    }
    
    ============================================================
    
	# WPMU 文件结构的子域路径
    location ~ ^/files/(.*)$ {
        try_files /wp-includes/ms-files.php?file=$1 =404;
        access_log off;
        log_not_found off;
        expires max;
    }
    
    ============================================================
    
    # 地图博客 ID 在特定的目录下
    map $http_host $blogid {
        default           0;
        example.com       1;
        site1.example.com 2;
        site1.com 	      2;
    }

### 结论 ###

可扩展性对许多站点的开发者来说是一项挑战，因为这会让他们在 WordPress 站点中取得成功。（对于那些想要跨越 WordPress 性能问题的新站点。）为 WordPress 添加缓存，并将 WordPress 和 NGINX 结合，是不错的答案。

NGINX 不仅对 WordPress 网站是有用的。世界上排名前 1000，10,000和100,000网站中 NGINX 也是作为 [领先的 web 服务器][45] 被使用。

欲了解更多有关 NGINX 的性能，请看我们最近的博客，[关于 10x 应用程序的 10 个技巧][46]。

NGINX 软件有两个版本：

- NGINX 开源的软件 - 像 WordPress 一样，此软件你可以自行下载，配置和编译。
- NGINX Plus - NGINX Plus 包括一个预构建的参考版本的软件，以及服务和技术支持。

想要开始，先到 [nginx.org][47] 下载开源软件并了解下 [NGINX Plus][48]。

--------------------------------------------------------------------------------

via: https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/

作者：[Floyd Smith][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[校对者ID](https://github.com/校对者ID)

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
