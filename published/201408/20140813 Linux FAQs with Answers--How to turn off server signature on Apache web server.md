Linux常见问题与答案—如何在Apache网站服务器上关闭服务器签名
================================================================================
>**问题**：每当Apache2网站服务器返回错误页时（如，404 页面无法找到，403 禁止访问页面），它会在页面底部显示网站服务器签名（如，Apache版本号和操作系统信息）。同时，当Apache2网站服务器为PHP页面服务时，它也会显示PHP的版本信息。我如何在Apache2网站服务器上关闭这些网站服务器签名呢？

透露网站服务器带有服务器/PHP版本信息的签名会带来安全隐患，因为你基本上将你系统上的已知漏洞告诉给了攻击者。因此，作为服务器加固的一个部分，强烈推荐你禁用所有网站服务器签名。

![](https://farm4.staticflickr.com/3897/14902970545_c3d406322f_o.png)

### 禁用Apache网站服务器签名 ###

禁用Apache网站服务器签名可以通过编辑Apache配置文件来实现。

在Debian，Ubunt或者Linux Mint上：

    $ sudo vi /etc/apache2/apache2.conf

在CentOS，Fedora，RHEL或者Arch Linux上：

    $ sudo vi /etc/httpd/conf/httpd.conf

将下面两行添加到Apache配置文件底部。

> ServerSignature Off
> 
> ServerTokens Prod

然后重启网站服务器以使修改生效：

    $ sudo service apache2 restart (Debian, Ubuntu or Linux Mint)
    $ sudo service httpd restart (CentOS/RHEL 6)
    $ sudo systemctl restart httpd.service (Fedora, CentOS/RHEL 7, Arch Linux)

第一行‘ServerSignature Off’使得Apache2网站服务器在所有错误页面上隐藏Apache版本信息。

![](https://farm6.staticflickr.com/5556/14879982016_7c7b8bbf3d_o.png)

然而，若没有第二行的‘ServerTokens Prod’，Apache服务器将仍然在HTTP回应头部包含详细的服务器标记，这会泄漏Apache的版本号。

![](https://farm4.staticflickr.com/3889/14902970535_e84ec23090_z.jpg)

第二行‘**ServerTokens Prod**’所要做的是在HTTP响应头中将服务器标记压缩到最小。

因此，同时放置两行时，Apache将不会在页面中或者HTTP响应头中泄漏版本信息。

![](https://farm4.staticflickr.com/3902/14902970505_d79225f25d_z.jpg)

### 隐藏PHP版本 ###

另外一个潜在的安全威胁是HTTP响应头中的PHP版本信息泄漏。默认情况下，Apache网站服务器通过HTTP响应头中的“X-Powered-By”字段包含有PHP版本信息。如果你想要在HTTP头部中隐藏PHP版本，请使用文本编辑器打开php.ini文件，找到“expose_php = On”这一行，将它改为“expose_php = Off”即可。

![](https://farm4.staticflickr.com/3853/14899917981_aaef71eb0a.jpg)

在Debian，Ubunt或者Linux Mint上：

    $ sudo vi /etc/php5/apache2/php.ini

在CentOS，Fedora，RHEL或者Arch Linux上：

    $ sudo vi /etc/php.ini

> expose_php = Off

最后，重启Apache2网站服务器来重新加载已更新的PHP配置文件。

现在，你不会再看到带有“X-Powered-By”字段的HTTP响应头了。 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/turn-off-server-signature-apache-web-server.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
