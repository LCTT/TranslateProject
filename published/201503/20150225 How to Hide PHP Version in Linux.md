如何在Linux服务器中隐藏PHP版本
================================================================================
通常，大多数默认设置安装的web服务器存在信息泄露，这其中之一就是PHP。PHP 是如今流行的服务端html嵌入式语言（之一？）。在如今这个充满挑战的时代，有许多攻击者会尝试发现你服务端的漏洞。因此，我会简单描述如何在Linux服务器中隐藏PHP信息。

默认上**expose_php**默认是开的。关闭“expose_php”参数可以使php隐藏它的版本信息。

    [root@centos66 ~]# vi /etc/php.ini

在你的php.ini, 定位到含有expose_php的那行把On设成Off：

    expose_php = Off

在此之前，web服务器头看上去就像这样：

    [root@centos66 ~]# curl -I http://www.ehowstuff.com/

----------

    HTTP/1.1 200 OK
    Server: nginx
    Content-Type: text/html; charset=UTF-8
    Vary: Accept-Encoding
    X-Powered-By: PHP/5.3.3
    X-Pingback: http://www.ehowstuff.com/xmlrpc.php
    Date: Wed, 11 Feb 2015 14:10:43 GMT
    X-Page-Speed: 1.9.32.2-4321
    Cache-Control: max-age=0, no-cache

更改并重启 Web 服务后，php就不会在web服务头中显示版本了：

```[root@centos66 ~]# curl -I http://www.ehowstuff.com/

HTTP/1.1 200 OK
Server: nginx
Date: Wed, 11 Feb 2015 15:38:14 GMT
Content-Type: text/html; charset=UTF-8
Vary: Accept-Encoding
X-Pingback: http://www.ehowstuff.com/xmlrpc.php
Date: Wed, 11 Feb 2015 14:10:43 GMT
X-Page-Speed: 1.9.32.2-4321
Cache-Control: max-age=0, no-cache
```

LCTT译注：除了 PHP 的版本之外，Web 服务器也会默认泄露版本号。如果使用 Apache 服务器，请[参照此文章关闭Apache 版本显示][2]；如果使用 Nginx 服务器，请在 http 段内加入`server_tokens off;` 配置。以上修改请记得重启相关服务。 

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-hide-php-version-in-linux/

作者：[skytech][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/
[1]:http://www.ehowstuff.com/archives/
[2]:http://linux.cn/article-3642-1.html