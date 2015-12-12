如何更新ISPConfig 3 SSL证书
================================================================================
本教程描述了如何再ISPConfig 3控制面板中更新SSL证书。有两个可选的方法：

- 用OpenSSL创建一个新的OpenSSL证书和CSR。
- 用ISPConfig updater更新SSL证书

我将会用手工的方法更新ssl证书。

### 1）用OpenSSL创建一个新的ISPConfig 3 SSL 证书 ###

用root用户登录你的服务器。在创建一个新的SSL证书之前，备份现有的。SSL证书是安全敏感的，因此我将它存储在/root/目录下。

    tar pcfz /root/ispconfig_ssl_backup.tar.gz /usr/local/ispconfig/interface/ssl
    chmod 600 /root/ispconfig_ssl_backup.tar.gz

> 现在创建一个新的SSL证书密钥，证书请求（csr）和自签发证书。

    cd /usr/local/ispconfig/interface/ssl
    openssl genrsa -des3 -out ispserver.key 4096
    openssl req -new -key ispserver.key -out ispserver.csr
    openssl x509 -req -days 3650 -in ispserver.csr \
    -signkey ispserver.key -out ispserver.crt
    openssl rsa -in ispserver.key -out ispserver.key.insecure
    mv ispserver.key ispserver.key.secure
    mv ispserver.key.insecure ispserver.key

重启apache来加载新的SSL证书

    service apache2 restart

### 2）用ISPConfig安装器来更新SSL证书 ###

另一个获取新的SSL证书的替代方案是使用ISPConfig更新脚本。下载ISPConfig到/tmp目录下，解压包并运行脚本。

    cd /tmp
    wget http://www.ispconfig.org/downloads/ISPConfig-3-stable.tar.gz
    tar xvfz ISPConfig-3-stable.tar.gz
    cd ispconfig3_install/install
    php -q update.php

更新脚本会在更新时询问下面的额问题：

    Create new ISPConfig SSL certificate (yes,no) [no]:

这里回答“yes”，SSL证书创建对话框就会启动。

--------------------------------------------------------------------------------

via: http://www.faqforge.com/linux/how-to-renew-the-ispconfig-3-ssl-certificate/

作者：[Till][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.faqforge.com/author/till/
