How to Hide PHP Version in Linux
================================================================================
In general, most of the web server software has been installed with default settings that will lead to information leakage. One of them is a PHP software. PHP (Hypertest Preprocessor) is one of the most popular server-side HTML embedded scripting language for the websites today. In the current challenging times, there are lots of attacker will try to discover the weaknesses in your your server system. Hence, i will describe the simple way to hide the PHP information in Linux server.

By default **expose_php** is set to On. Turning off the “expose_php” parameter causes that PHP will hide it version details.

    [root@centos66 ~]# vi /etc/php.ini

In your php.ini, locate the line containing expose_php On and set it to Off:

    expose_php = Off

Before the changes, web server header will look like below :

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

After the changes, PHP will no longer show the version to the web server header :

[root@centos66 ~]# curl -I http://www.ehowstuff.com/

HTTP/1.1 200 OK
Server: nginx
Date: Wed, 11 Feb 2015 15:38:14 GMT
Content-Type: text/html; charset=UTF-8
Vary: Accept-Encoding
X-Pingback: http://www.ehowstuff.com/xmlrpc.php
Date: Wed, 11 Feb 2015 14:10:43 GMT
X-Page-Speed: 1.9.32.2-4321
Cache-Control: max-age=0, no-cache

As always if you need any help you can reach us on twitter @ehowstuff or drop us a comment below. [Jumping through archives page to read more articles..][1]

--------------------------------------------------------------------------------

via: http://www.ehowstuff.com/how-to-hide-php-version-in-linux/

作者：[skytech][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ehowstuff.com/author/mhstar/
[1]:http://www.ehowstuff.com/archives/