如何在 HTTP 头中隐藏 PHP 版本号
============================================================

PHP 配置默认允许服务器在 HTTP 响应头 `X-Powered-By` 中显示安装在服务器上的 PHP 版本。

出于服务器安全原因（虽然不是主要的要担心的威胁），建议你禁用或隐藏此信息，避免那些针对你的服务器的攻击者知道你是否运行了 PHP。

假设你服务器上安装的特定版本的 PHP 具有安全漏洞，另一方面，攻击者可以了解这一点，他们将更容易利用漏洞并通过脚本访问服务器。

在我以前的文章中，我已经展示了[如何隐藏 apache 版本号][1]，你已经看到如何不再显示 apache 的安装版本。但是如果你在你的 apache 服务器上运行 PHP，你还需要隐藏 PHP 的安装版本，这我们将在本文中展示。

因此，在本文中，我们将解释如何隐藏或关闭服务器 HTTP 响应头中的 PHP 版本号。

此设置可以在加载的 PHP 配置文件中配置。如果你不知道此配置文件在服务器上的位置，请运行以下命令找到它：

```
$ php -i | grep "Loaded Configuration File"
```
PHP 配置文件位置
```
---------------- 在 CentOS/RHEL/Fedora 上---------------- 
Loaded Configuration File => /etc/php.ini
---------------- 在 Debian/Ubuntu/Linux Mint 上---------------- 
Loaded Configuration File => /etc/php/7.0/cli/php.ini
```

在对 PHP 配置文件进行任何更改之前，我建议您首先备份您的 PHP 配置文件，如下所示：

```
----------------在 CentOS/RHEL/Fedora 上---------------- 
$ sudo cp /etc/php.ini /etc/php.ini.orig
---------------- 在 Debian/Ubuntu/Linux Mint 上---------------- 
$ sudo cp /etc/php/7.0/cli/php.ini  /etc/php/7.0/cli/php.ini.orig  
```

[用你最喜欢的编辑器][2]，使用超级用户权限打开文件：

```
---------------- 在 CentOS/RHEL/Fedora 上---------------- 
$ sudo vi /etc/php.ini
----------------在 Debian/Ubuntu/Linux Mint 上---------------- 
$ sudo vi /etc/php/7.0/cli/php.ini
```

定位到关键词 `expose_php`，并将值设置成 `Off`：

```
expose_php = Off
```

保存并退出文件。之后，重启 web 服务器：

```
---------------- 使用 SystemD ---------------- 
$ sudo systemctl restart httpd
$ sudo systemctl restart apache2 
---------------- 使用 SysVInit ---------------- 
$ sudo service httpd restart
$ sudo service apache2 restart
```

最后，不过同样重要，使用下面的命令检查服务器 HTTP 响应头是否仍然显示你的 PHP 版本号。

```
$ lynx -head -mime_header http://localhost 
或者
$ lynx -head -mime_header http://server-address
```

这里的标志含义是：

-  `-head` – 发送一个请求 mime 报头的 HEAD 请求。
-  `-mime_header` – 打印所提取文档的 MIME 标头及其源代码。

**注意**: 确保你系统中已经安装了[命令行 web 浏览器 lynx][3]。

就是这样了！在本文中，我们解释了如何隐藏服务器 HTTP 响应头中的 PHP 版本号以保护 web 服务器免受可能的攻击。你可以在下面的评论栏中留下你的想法或者相关的问题。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin 及 web 开发者，目前是 TecMint 的内容创作者，他喜欢用电脑工作，并坚信分享知识。

---------------------------------------------------------------------------------


via: http://www.tecmint.com/hide-php-version-http-header/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/hide-apache-web-server-version-information/
[2]:http://www.tecmint.com/linux-command-line-editors/
[3]:http://www.tecmint.com/command-line-web-browsers/
