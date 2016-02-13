如何更新 ISPConfig 3 SSL 证书
================================================================================
本教程描述了如何在 ISPConfig 3控制面板中更新 SSL 证书。有两个可选的方法：

- 用 OpenSSL 创建一个新的 OpenSSL 证书和 CSR。
- 用 ISPConfig updater 更新 SSL 证书

我将从用手工的方法更新 SSL 证书开始。

### 1）用 OpenSSL 创建一个新的 ISPConfig 3 SSL 证书 ###

用 root 用户登录你的服务器。在创建一个新的 SSL 证书之前，先备份现有的。SSL 证书是安全敏感的，因此我将它存储在 /root/ 目录下。

    tar pcfz /root/ispconfig_ssl_backup.tar.gz /usr/local/ispconfig/interface/ssl
    chmod 600 /root/ispconfig_ssl_backup.tar.gz

> 现在创建一个新的 SSL 证书密钥，证书请求（CSR）和自签发证书。

    cd /usr/local/ispconfig/interface/ssl
    openssl genrsa -des3 -out ispserver.key 4096
    openssl req -new -key ispserver.key -out ispserver.csr
    openssl x509 -req -days 3650 -in ispserver.csr \
    -signkey ispserver.key -out ispserver.crt
    openssl rsa -in ispserver.key -out ispserver.key.insecure
    mv ispserver.key ispserver.key.secure
    mv ispserver.key.insecure ispserver.key

重启 apache 来加载新的 SSL 证书

    service apache2 restart

### 2）用 ISPConfig 安装器来更新 SSL 证书 ###

另一个获取新的 SSL 证书的替代方案是使用 ISPConfig 更新脚本。下载 ISPConfig 到 /tmp 目录下，解压包并运行脚本。

    cd /tmp
    wget http://www.ispconfig.org/downloads/ISPConfig-3-stable.tar.gz
    tar xvfz ISPConfig-3-stable.tar.gz
    cd ispconfig3_install/install
    php -q update.php

更新脚本会在更新时询问下面的问题：

    Create new ISPConfig SSL certificate (yes,no) [no]:

这里回答“yes”，SSL 证书创建对话框就会启动。

--------------------------------------------------------------------------------

via: http://www.faqforge.com/linux/how-to-renew-the-ispconfig-3-ssl-certificate/

作者：[Till][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.faqforge.com/author/till/
