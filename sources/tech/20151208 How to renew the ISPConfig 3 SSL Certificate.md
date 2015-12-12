translating----geekpi

How to renew the ISPConfig 3 SSL Certificate
================================================================================
This tutorial describes the steps to renew the SSL Certificate of the ISPConfig 3 control panel. There are two alternative ways to achieve that:

- Create a new OpenSSL Certificate and CSR on the command line with OpenSSL.
- Renew the SSL Certificate with the ISPConfig updater

I'll start with the manual way to renew the ssl cert.

### 1) Create a new ISPConfig 3 SSL Certificate with OpenSSL ###

Login to your server on the shell as root user. Before we create a new SSL Cert, backup the current ones. SSL Certs are security sensitive so I'll store the backup in the /root/ folder.

    tar pcfz /root/ispconfig_ssl_backup.tar.gz /usr/local/ispconfig/interface/ssl
    chmod 600 /root/ispconfig_ssl_backup.tar.gz

> Now create a new SSL Certificate key, Certificate Request (csr) and a self signed Certificate.

    cd /usr/local/ispconfig/interface/ssl
    openssl genrsa -des3 -out ispserver.key 4096
    openssl req -new -key ispserver.key -out ispserver.csr
    openssl x509 -req -days 3650 -in ispserver.csr \
    -signkey ispserver.key -out ispserver.crt
    openssl rsa -in ispserver.key -out ispserver.key.insecure
    mv ispserver.key ispserver.key.secure
    mv ispserver.key.insecure ispserver.key

Restart Apache to load the new SSL Certificate.

    service apache2 restart

### 2) Renew the SSL Certificate with the ISPConfig installer ###

The alternative way to get a new SSL Certificate is to use the ISPConfig update script.
Download ISPConfig to the /tmp folder, unpack the archive and start the update script.

    cd /tmp
    wget http://www.ispconfig.org/downloads/ISPConfig-3-stable.tar.gz
    tar xvfz ISPConfig-3-stable.tar.gz
    cd ispconfig3_install/install
    php -q update.php

The update script will ask the following question during update:

    Create new ISPConfig SSL certificate (yes,no) [no]:

Answer "yes" here and the SSL Certificate creation dialog will start.

--------------------------------------------------------------------------------

via: http://www.faqforge.com/linux/how-to-renew-the-ispconfig-3-ssl-certificate/

作者：[Till][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.faqforge.com/author/till/
