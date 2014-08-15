Translating by GOLinux ...
Linux FAQs with Answers--How to turn off server signature on Apache web server
================================================================================
> **Question**: Whenever Apache2 web server returns error pages (e.g., 404 not found, 403 access forbidden pages), it shows web server signature (e.g., Apache version number and operating system info) at the bottom of the pages. Also, when Apache2 web server serves any PHP pages, it reveals PHP version info. How can I turn off these web server signatures in Apache2 web server? 

Revealing web server signature with server/PHP version info can be a security risk as you are essentially telling attackers known vulnerabilities of your system. Thus it is recommended you disable all web server signatures as part of server hardening process.

![](https://farm4.staticflickr.com/3897/14902970545_c3d406322f_o.png)

### Disable Apache Web Server Signature ###

Disabling Apache web server signature can be achieved by editing Apache config file.

On Debian, Ubuntu or Linux Mint:

    $ sudo vi /etc/apache2/apache2.conf

On CentOS, Fedora, RHEL or Arch Linux:

    $ sudo vi /etc/httpd/conf/httpd.conf

Add the following two lines at the end of Apache config file.

> ServerSignature Off
> 
> ServerTokens Prod

Then restart web server to activate the change:

    $ sudo service apache2 restart (Debian, Ubuntu or Linux Mint)
    $ sudo service httpd restart (CentOS/RHEL 6)
    $ sudo systemctl restart httpd.service (Fedora, CentOS/RHEL 7, Arch Linux)

The first line 'ServerSignature Off' makes Apache2 web server hide Apache version info on any error pages.

![](https://farm6.staticflickr.com/5556/14879982016_7c7b8bbf3d_o.png)

However, without the second line 'ServerTokens Prod', Apache server will still include a detailed server token in HTTP response headers, which reveals Apache version number.

![](https://farm4.staticflickr.com/3889/14902970535_e84ec23090_z.jpg)

What the second line '**ServerTokens Prod**' does is to suppress a server token in HTTP response headers to a bare minimal.

So with both lines in place, Apache will not reveal Apache version info in either web pages or HTTP response headers.

![](https://farm4.staticflickr.com/3902/14902970505_d79225f25d_z.jpg)

### Hide PHP Version ###

Another potential security threat is PHP version info leak in HTTP response headers. By default, Apache web server includes PHP version info via "X-Powered-By" field in HTTP response headers. If you want to hide PHP version in HTTP headers, open php.ini file with a text editor, look for "expose_php = On", and change it to "expose_php = Off".

![](https://farm4.staticflickr.com/3853/14899917981_aaef71eb0a.jpg)

On Debian, Ubuntu, or Linux Mint:

    $ sudo vi /etc/php5/apache2/php.ini

On CentOS, Fedora, RHEL or Arch Linux:

    $ sudo vi /etc/php.ini

> expose_php = Off

Finally, restart Apache2 web server to reload updated PHP config file.

Now you will no longer see "X-Powered-By" field in HTTP response headers.

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/turn-off-server-signature-apache-web-server.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
