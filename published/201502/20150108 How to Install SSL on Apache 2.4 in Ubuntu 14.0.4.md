如何在Ubuntu 14.04 上为Apache 2.4 安装SSL支持
================================================================================
今天我会讲述如何为你的个人网站或者博客安装**SSL 证书**，来保护你的访问者和网站之间通信的安全。

安全套接字层或称SSL，是一种加密网站和浏览器之间连接的标准安全技术。这确保服务器和浏览器之间传输的数据保持隐私和安全。它被成千上万的人使用来保护他们与客户的通信。要启用SSL链接，Web服务器需要安装SSL证书。

你可以创建你自己的SSL证书，但是这默认不会被浏览器所信任，要解决这个问题，你需要从受信任的证书机构（CA）处购买证书，我们会向你展示如何获取证书并在apache中安装。

### 生成一个证书签名请求 ###

证书机构（CA）会要求你在你的服务器上生成一个证书签名请求（CSR）。这是一个很简单的过程，只需要一会儿就行，你需要在你的服务器上运行下面的命令并输入需要的信息：

    # openssl req -new -newkey rsa:2048 -nodes -keyout yourdomainname.key -out yourdomainname.csr

输出看上去会像这样：

![generate csr](http://blog.linoxide.com/wp-content/uploads/2015/01/generate-csr.jpg)

这一步会生成两个文件：一个用于解密SSL证书的私钥文件，一个证书签名请求（CSR）文件（用于申请你的SSL证书）。

根据你申请的机构，你会需要上传csr文件或者在网站表格中粘帖该文件内容。

### 在Apache中安装实际的证书 ###

生成步骤完成之后，你会收到新的数字证书。本篇教程中我们使用[Comodo SSL][1]，并在一个它发给我们的zip文件中收到了证书。要在apache中使用它，你首先需要用下面的命令用收到的证书创建一个组合的证书：

    # cat COMODORSADomainValidationSecureServerCA.crt COMODORSAAddTrustCA.crt AddTrustExternalCARoot.crt > bundle.crt

![bundle](http://blog.linoxide.com/wp-content/uploads/2015/01/bundle.jpg)

用下面的命令确保ssl模块已经加载进apache了：

    # a2enmod ssl

如果你看到了“Module ssl already enabled”这样的信息就说明你成功了，如果你看到了“Enabling module ssl”，那么你还需要用下面的命令重启apache：

    # service apache2 restart

最后像下面这样修改你的虚拟主机文件（通常在/etc/apache2/sites-enabled 下）：

    DocumentRoot /var/www/html/
    ServerName linoxide.com
    SSLEngine on
    SSLCertificateFile /usr/local/ssl/crt/yourdomainname.crt
    SSLCertificateKeyFile /usr/local/ssl/yourdomainname.key
    SSLCACertificateFile /usr/local/ssl/bundle.crt

你现在应该可以用https://YOURDOMAIN/（注意使用‘https’而不是‘http’）来访问你的网站了，并可以看到SSL的进度条了（通常在你浏览器中用一把锁来表示）。

 
**注意：** 现在所有的内容链接都必须指向https，如果网站上的一些内容（像图片或者css文件等）仍旧指向http链接的话，你会在浏览器中得到一个警告，要修复这个问题，请确保每个链接都指向了https。

### 在你的网站上重定向HTTP请求到HTTPS中 ###

如果你希望重定向常规的HTTP请求到HTTPS，添加下面的文本到你希望修改的虚拟主机，或者如果希望给服务器上所有网站都添加的话就加入到apache.conf中：

    RewriteEngine On
    RewriteCond %{HTTPS} off
    RewriteRule (.*) https://%{HTTP_HOST}%{REQUEST_URI}

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/install-ssl-apache-2-4-in-ubuntu/

作者：[Adrian Dinu][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/adriand/
[1]:https://ssl.comodo.com/