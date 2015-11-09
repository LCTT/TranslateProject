struggling 翻译中...
9 Tips for Improving WordPress Performance
================================================================================
WordPress is the single largest platform for website creation and web application delivery worldwide. About [a quarter][1] of all sites are now built on open-source WordPress software, including sites for eBay, Mozilla, RackSpace, TechCrunch, CNN, MTV, the New York Times, the Wall Street Journal.

WordPress.com, the most popular site for user-created blogs, also runs on WordPress open source software. [NGINX powers WordPress.com][2]. Among WordPress customers, many sites start on WordPress.com and then move to hosted WordPress open-source software; more and more of these sites use NGINX software as well.

WordPress’ appeal is its simplicity, both for end users and for implementation. However, the architecture of a WordPress site presents problems when usage ramps upward – and several steps, including caching and combining WordPress and NGINX, can solve these problems.

In this blog post, we provide nine performance tips to help overcome typical WordPress performance challenges:

- [Cache static resources][3]
- [Cache dynamic files][4]
- [Move to NGINX][5]
- [Add permalink support to NGINX][6]
- [Configure NGINX for FastCGI][7]
- [Configure NGINX for W3_Total_Cache][8]
- [Configure NGINX for WP-Super-Cache][9]
- [Add security precautions to your NGINX configuration][10]
- [Configure NGINX to support WordPress Multisite][11]

### WordPress Performance on LAMP Sites ###

Most WordPress sites are run on a traditional LAMP software stack: the Linux OS, Apache web server software, MySQL database software – often on a separate database server – and the PHP programming language. Each of these is a very well-known, widely used, open source tool. Most people in the WordPress world “speak” LAMP, so it’s easy to get help and support.

When a user visits a WordPress site, a browser running the Linux/Apache combination creates six to eight connections per user. As the user moves around the site, PHP assembles each page on the fly, grabbing resources from the MySQL database to answer requests.

LAMP stacks work well for anywhere from a few to, perhaps, hundreds of simultaneous users. However, sudden increases in traffic are common online and – usually – a good thing.

But when a LAMP-stack site gets busy, with the number of simultaneous users climbing into the many hundreds or thousands, it can develop serious bottlenecks. Two main causes of bottlenecks are:

1. The Apache web server – Apache consumes substantial resources for each and every connection. If Apache accepts too many simultaneous connections, memory can be exhausted and performance slows because data has to be paged back and forth to disk. If connections are limited to protect response time, new connections have to wait, which also leads to a poor user experience.
1. The PHP/MySQL interaction – Together, an application server running PHP and a MySQL database server can serve a maximum number of requests per second. When the number of requests exceeds the maximum, users have to wait. Exceeding the maximum by a relatively small amount can cause a large slowdown in responsiveness for all users. Exceeding it by two or more times can cause significant performance problems.

The performance bottlenecks in a LAMP site are particularly resistant to the usual instinctive response, which is to upgrade to more powerful hardware  – more CPUs, more disk space, and so on. Incremental increases in hardware performance can’t keep up with the exponential increases in demand for system resources that Apache and the PHP/MySQL combination experience when they get overloaded.

The leading alternative to a LAMP stack is a LEMP stack – Linux, NGINX, MySQL, and PHP. (In the LEMP acronym, the E stands for the sound at the start of “engine-x.”) We describe a LEMP stack in [Tip 3][12].

### Tip 1. Cache Static Resources ###

Static resources are unchanging files such as CSS files, JavaScript files, and image files. These files often make up half or more of the data on a web page. The remainder of the page is dynamically generated content like comments in a forum, a performance dashboard, or personalized content (think Amazon.com product recommendations).

Caching static resources has two big benefits:

- Faster delivery to the user – The user gets the static file from their browser cache or a caching server closer to them on the Internet. These are sometimes big files, so reducing latency for them helps a lot.
- Reduced load on the application server – Every file that’s retrieved from a cache is one less request the web server has to process. The more you cache, the more you avoid thrashing because resources have run out.

To support browser caching, set the correct HTTP headers for static files. Look into the HTTP Cache-Control header, specifically the max-age setting, the Expires header, and Entity tags. You can find a good introduction [here][13].

When local caching is enabled and a user requests a previously accessed file, the browser first checks whether the file is in the cache. If so, it asks the web server if the file has changed. If the file hasn’t changed, the web server can respond immediately with code 304 (Not Modified) meaning that the file is unchanged, instead of returning code 200 OK and then retrieving and delivering the changed file.

To support caching beyond the browser, consider the Tips below, and consider a content delivery network (CDN).CDNs are a popular and powerful tool for caching, but we don’t describe them in detail here. Consider a CDN after you implement the other techniques mentioned here. Also, CDNs may be less useful as you transition your site from HTTP/1.x to the new HTTP/2 standard; investigate and test as needed to find the right answer for your site.

If you move to NGINX Plus or the open source NGINX software as part of your software stack, as suggested in [Tip 3][14], then configure NGINX to cache static resources. Use the following configuration, replacing www.example.com with the URL of your web server.

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
            # substitute the socket, or address and port, of your WordPress server
            fastcgi_pass unix:/var/run/php5-fpm.sock;
            #fastcgi_pass 127.0.0.1:9000;
     	}   
    
        location ~* .(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|css|rss|atom|js|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2|doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {
            expires max;
            log_not_found off;
            access_log off;
        }
    }

### Tip 2. Cache Dynamic Files ###

WordPress generates web pages dynamically, meaning that it generates a given web page every time it is requested (even if the result is the same as the time before). This means that users always get the freshest content.

Think of a user visiting a blog post that has comments enabled at the bottom of the post. You want the user to see all comments – even a comment that just came in a moment ago. Dynamic content makes this happen.

But now let’s say that the blog post is getting ten or twenty requests per second. The application server might start to thrash under the pressure of trying to regenerate the page so often, causing big delays. The goal of delivering the latest content to new visitors becomes relevant only in theory, because they’re have to wait so long to get the page in the first place.

To prevent page delivery from slowing down due to increasing load, cache the dynamic file. This makes the file less dynamic, but makes the whole system more responsive.

To enable caching in WordPress, use one of several popular plug-ins – described below. A WordPress caching plug-in asks for a fresh page, then caches it for a brief period of time – perhaps just a few seconds. So, if the site is getting several requests a second, most users get their copy of the page from the cache. This helps the retrieval time for all users:

- Most users get a cached copy of the page. The application server does no work at all.
- Users who do get a fresh copy get it fast. The application server only has to generate a fresh page every so often. When the server does generate a fresh page (for the first user to come along after the cached page expires), it does this much faster because it’s not overloaded with requests.

You can cache dynamic files for WordPress running on a LAMP stack or on a [LEMP stack][15] (described in [Tip 3][16]). There are several caching plug-ins you can use with WordPress. Here are the most popular caching plug-ins and caching techniques, listed from the simplest to the most powerful:

- [Hyper-Cache][17] and [Quick-Cache][18] – These two plug-ins create a single PHP file for each WordPress page or post. This supports some dynamic functionality while bypassing much WordPress core processing and the database connection, creating a faster user experience. They don’t bypass all PHP processing, so they don’t give the same performance boost as the following options. They also don’t require changes to the NGINX configuration.
- [WP Super Cache][19] – The most popular caching plug-in for WordPress. It has many settings, which are presented through an easy-to-use interface, shown below. We show a sample NGINX configuration in [Tip 7][20].
- [W3 Total Cache][21] – This is the second most popular cache plug-in for WordPress. It has even more option settings than WP Super Cache, making it a powerful but somewhat complex option. For a sample NGINX configuration, see [Tip 6][22].
- [FastCGI][23] – CGI stands for Common Gateway Interface, a language-neutral way to request and receive files on the Internet. FastCGI is not a plug-in but a way to interact with a cache. FastCGI can be used in Apache as well as in NGINX, where it’s the most popular dynamic caching approach; we describe how to configure NGINX to use it in [Tip 5][24].

The documentation for these plug-ins and techniques explains how to configure them in a typical LAMP stack. Configuration options include database and object caching; minification for HTML, CSS, and JavaScript files; and integration options for popular CDNs. For NGINX configuration, see the Tips referenced in the list.

**Note**: Caches do not work for users who are logged into WordPress, because their view of WordPress pages is personalized. (For most sites, only a small minority of users are likely to be logged in.) Also, most caches do not show a cached page to users who have recently left a comment, as that user will want to see their comment appear when they refresh the page. To cache the non-personalized content of a page, you can use a technique called [fragment caching][25], if it’s important to overall performance.

### Tip 3. Move to NGINX ###

As mentioned above, Apache can cause performance problems when the number of simultaneous users rises above a certain point – perhaps hundreds of simultaneous users. Apache allocates substantial resources to each connection, and therefore tends to run out of memory. Apache can be configured to limit connections to avoid exhausting memory, but that means, when the limit is exceeded, new connection requests have to wait.

In addition, Apache loads another copy of the mod_php module into memory for every connection, even if it’s only serving static files (images, CSS, JavaScript, etc.). This consumes even more resources for each connection and limits the capacity of the server further.

To start solving these problems, move from a LAMP stack to a LEMP stack – replace Apache with (e)NGINX. NGINX handles many thousands of simultaneous connections in a fixed memory footprint, so you don’t have to experience thrashing, nor limit simultaneous connections to a small number.

NGINX also deals with static files better, with built-in, easily tuned [caching][26] controls. The load on the application server is reduced, and your site can serve far more traffic with a faster, more enjoyable experience for your users.

You can use NGINX on all the web servers in your deployment, or you can put an NGINX server “in front” of Apache as a reverse proxy  – the NGINX server receives client requests, serves static files, and sends PHP requests to Apache, which processes them.

For dynamically generated pages – the core use case for WordPress experience – choose a caching tool, as described in [Tip 2][27]. In the Tips below, you can find NGINX configuration suggestions for FastCGI, W3_Total_Cache, and WP-Super-Cache. (Hyper-Cache and Quick-Cache don’t require changes to NGINX configuration.)

**Tip.** Caches are typically saved to disk, but you can use [tmpfs][28] to store the cache in memory and increase performance.

Setting up NGINX for WordPress is easy. Just follow these four steps, which are described in further detail in the indicated Tips:

1. Add permalink support – Add permalink support to NGINX. This eliminates dependence on the **.htaccess** configuration file, which is Apache-specific. See [Tip 4][29].
1. Configure for caching – Choose a caching tool and implement it. Choices include FastCGI cache, W3 Total Cache, WP Super Cache, Hyper Cache, and Quick Cache. See Tips [5][30], [6][31], and [7][32].
1. Implement security precautions – Adopt best practices for WordPress security on NGINX. See [Tip 8][33].
1. Configure WordPress Multisite – If you use WordPress Multisite, configure NGINX for a subdirectory, subdomain, or multiple-domain architecture. See [Tip 9][34].

### Tip 4. Add Permalink Support to NGINX ###

Many WordPress sites depend on **.htaccess** files, which are required for several WordPress features, including permalink support, plug-ins, and file caching. NGINX does not support **.htaccess** files. Fortunately, you can use NGINX’s simple, yet comprehensive, configuration language to achieve most of the same functionality.

You can enable [Permalinks][35] in WordPress with NGINX by including the following location block in your main [server][36] block. (This location block is also included in other code samples below.)

The **try_files** directive tells NGINX to check whether the requested URL exists as a file ( **$uri**) or directory (**$uri/**) in the document root, **/var/www/example.com/htdocs**. If not, NGINX does a redirect to **/index.php**, passing the query string arguments as parameters.

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

### Tip 5. Configure NGINX for FastCGI ###

NGINX can cache responses from FastCGI applications like PHP. This method offers the best performance.

For NGINX open source, compile in the third-party module [ngx_cache_purge][37], which provides cache purging capability, and use the configuration code below. NGINX Plus includes its own implementation of this code. 

When using FastCGI, we recommend you install the [Nginx Helper plug-in][38] and use a configuration such as the one below, especially the use of **fastcgi_cache_key** and the location block including **fastcgi_cache_purge**. The plug-in automatically purges your cache when a page or a post is published or modified, a new comment is published, or the cache is manually purged from the WordPress Admin Dashboard.

The Nginx Helper plug-in can also add a short HTML snippet to the bottom of your pages, confirming the cache is working and displaying some statistics. (You can also confirm the cache is functioning properly using the [$upstream_cache_status][39] variable.)

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
    
        # POST requests and urls with a query string should always go to PHP
        if ($request_method = POST) {
            set $skip_cache 1;
        }   
    
        if ($query_string != "") {
            set $skip_cache 1;
        }   
    
        # Don't cache uris containing the following segments
        if ($request_uri ~* "/wp-admin/|/xmlrpc.php|wp-.*.php|/feed/|index.php
                             |sitemap(_index)?.xml") {
            set $skip_cache 1;
        }   
    
        # Don't use the cache for logged in users or recent commenters
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

### Tip 6. Configure NGINX for W3_Total_Cache ###

[W3 Total Cache][40], by Frederick Townes of [W3-Edge][41], is a WordPress caching framework that supports NGINX. It’s an alternative to FastCGI cache with a wide range of option settings.

The caching plug-in offers a variety of caching configurations and also includes options for database and object caching, minification of HTML, CSS, and JavaScript, as well as options to integrate with popular CDNs.

The plug-in handles NGINX configuration by writing to an NGINX configuration file located in the root directory of your domain.

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

### Tip 7. Configure NGINX for WP Super Cache ###

[WP Super Cache][42] by Donncha O Caoimh, a WordPress developer at [Automattic][43], is a WordPress caching engine that turns dynamic WordPress pages into static HTML files that NGINX can serve very quickly. It was one of the first caching plug-ins for WordPress and has a smaller, more focused range of options than others.

NGINX configurations for WP-Super-Cache can vary depending on your preference. One possible configuration follows.

In the configuration below, the location block with supercache named in it is the WP Super Cache-specific part, and is needed for the configuration to work. The rest of the code is made up of WordPress rules for not caching users who are logged into WordPress, not caching POST requests, and setting expires headers for static assets, plus standard PHP implementation; these parts can be customized to fit your needs.

    server {
        server_name example.com www.example.com;
        root /var/www/example.com/htdocs;
        index index.php;
    
        access_log /var/log/nginx/example.com.access.log;
        error_log  /var/log/nginx/example.com.error.log debug;
    
        set $cache_uri $request_uri;
    
        # POST requests and urls with a query string should always go to PHP
        if ($request_method = POST) {
            set $cache_uri 'null cache';
        }  
        if ($query_string != "") {
            set $cache_uri 'null cache';
        }   
    
        # Don't cache uris containing the following segments
        if ($request_uri ~* "(/wp-admin/|/xmlrpc.php|/wp-(app|cron|login|register|mail).php
                              |wp-.*.php|/feed/|index.php|wp-comments-popup.php
                              |wp-links-opml.php|wp-locations.php |sitemap(_index)?.xml
                              |[a-z0-9_-]+-sitemap([0-9]+)?.xml)") {
    
            set $cache_uri 'null cache';
        }  
    	
        # Don't use the cache for logged-in users or recent commenters
        if ($http_cookie ~* "comment_author|wordpress_[a-f0-9]+
                             |wp-postpass|wordpress_logged_in") {
            set $cache_uri 'null cache';
        }
    
        # Use cached or actual file if it exists, otherwise pass request to WordPress
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
    	
        # Cache static files for as long as possible
        location ~*.(ogg|ogv|svg|svgz|eot|otf|woff|mp4|ttf|css
               |rss|atom|js|jpg|jpeg|gif|png|ico|zip|tgz|gz|rar|bz2
               |doc|xls|exe|ppt|tar|mid|midi|wav|bmp|rtf)$ {
            expires max;
            log_not_found off;
            access_log off;
        }
    }

### Tip 8. Add Security Precautions to Your NGINX Configuration ###

To protect against attacks, you can control access to key resources and limit the ability of bots to overload the login utility.

Allow only specific IP addresses to access the WordPress Dashboard.

    # Restrict access to WordPress Dashboard
    location /wp-admin {
        deny  192.192.9.9;
        allow 192.192.1.0/24;
        allow 10.1.1.0/16;
        deny  all;
    }

Only allow uploading of specific types of files to prevent programs with malicious intent from being uploaded and running.

    # Deny access to uploads which aren’t images, videos, music, etc.
    location ~* ^/wp-content/uploads/.*.(html|htm|shtml|php|js|swf)$ {
        deny all;
    }

Deny access to **wp-config.php**, the WordPress configuration file. Another way to deny access is to move the file one directory level above the domain root.

    # Deny public access to wp-config.php
    location ~* wp-config.php {
        deny all;
    }

Rate limit **wp-login.php** to block against brute force attacks.

    # Deny access to wp-login.php
    location = /wp-login.php {
        limit_req zone=one burst=1 nodelay;
        fastcgi_pass unix:/var/run/php5-fpm.sock;
        #fastcgi_pass 127.0.0.1:9000;
    }

### Tip 9. Use NGINX with WordPress Multisite ###

WordPress Multisite, as its name implies, is a version of WordPress software that allows you to manage two or more sites from a single WordPress instance. The [WordPress.com][44] service, which hosts thousands of user blogs, is run from WordPress Multisite.

You can run separate sites from either subdirectories of a single domain or from separate subdomains.

Use this code block to add support for a subdirectory structure.

    # Add support for subdirectory structure in WordPress Multisite
    if (!-e $request_filename) {
        rewrite /wp-admin$ $scheme://$host$uri/ permanent;	
        rewrite ^(/[^/]+)?(/wp-.*) $2 last;                     
        rewrite ^(/[^/]+)?(/.*\.php) $2 last;                   
    }

Use this code block instead of the code block above to add support for a subdirectory structure, substituting your own subdirectory names.

    # Add support for subdomains
    server_name example.com *.example.com;

Older versions of WordPress Multisite (3.4 and earlier) use readfile() to serve static content. However, readfile() is PHP code, which causes a significant performance hit when it executes. We can use NGINX to bypass this unnecessary PHP processing. The code snippets below are separated by separator lines (==============).

    # Avoid PHP readfile() for /blogs.dir/structure in the subdirectory path.
    location ^~ /blogs.dir {
        internal;
        alias /var/www/example.com/htdocs/wp-content/blogs.dir;
        access_log off;
        log_not_found off;
        expires max;
    }
    
    ============================================================
    
    # Avoid php readfile() for /files/structure in the subdirectory path
    location ~ ^(/[^/]+/)?files/(?.+) {
        try_files /wp-content/blogs.dir/$blogid/files/$rt_file /wp-includes/ms-files.php?file=$rt_file;
        access_log off;
        log_not_found off;
        expires max;
    }
    
    ============================================================
    
    # WPMU files structure for the subdomain path
    location ~ ^/files/(.*)$ {
        try_files /wp-includes/ms-files.php?file=$1 =404;
        access_log off;
        log_not_found off;
        expires max;
    }
    
    ============================================================
    
    # Map blog ID to specific directory
    map $http_host $blogid {
        default           0;
        example.com       1;
        site1.example.com 2;
        site1.com 	      2;
    }

### Conclusion ###

Scalability is a challenge for more and more site developers as they achieve success with their WordPress sites. (And for new sites that want to head WordPress performance problems off at the pass.) Adding WordPress caching, and combining WordPress and NGINX, are solid answers.

NGINX is not only useful with WordPress sites. NGINX is the [leading web server][45] among the busiest 1,000, 10,000, and 100,000 sites in the world.

For more on NGINX performance, see our recent blog post, [10 Tips for 10x Application Performance][46]. 

NGINX software comes in two versions:

- NGINX open source software – Like WordPress, this is software you download, configure, and compile yourself.
- NGINX Plus – NGINX Plus includes a pre-built reference version of the software, as well as service and technical support.

To get started, go to [nginx.org][47] for the open source software or check out [NGINX Plus][48].

--------------------------------------------------------------------------------

via: https://www.nginx.com/blog/9-tips-for-improving-wordpress-performance-with-nginx/

作者：[Floyd Smith][a]
译者：[译者ID](https://github.com/译者ID)
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