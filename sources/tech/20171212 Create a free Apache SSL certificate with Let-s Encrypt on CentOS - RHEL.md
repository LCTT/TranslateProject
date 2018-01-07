Create a free Apache SSL certificate with Let’s Encrypt on CentOS & RHEL
======

Let's Encrypt is a free, automated & open certificate authority that is supported by ISRG, Internet Security Research Group. Let's encrypt provides X.509 certificates for TLS (Transport Layer Security) encryption via automated process which includes creation, validation, signing, installation, and renewal of certificates for secure websites.

In this tutorial, we are going to discuss how to create an apache SSL certificate with Let's Encrypt certificate on Centos/RHEL 6 & 7\. To automate the Let's encrypt process, we will use Let's encrypt recommended ACME client i.e. CERTBOT, there are other ACME Clients as well but we will be using Certbot only.

Certbot can automate certificate issuance and installation with no downtime, it automatically enables HTTPS on your website. It also has expert modes for people who don't want auto-configuration. It's easy to use, works on many operating systems, and has great documentation.

 **(Recommended Read:[Complete guide for Apache TOMCAT installation on Linux][1])**

Let's start with Pre-requisites for creating an Apache SSL certificate with Let's Encrypt on CentOS, RHEL 6 &7…..


## Pre-requisites

 **1-** Obviously we will need Apache server to installed on our machine. We can install it with the following command,

 **# yum install httpd**

For detailed Apache installation procedure, refer to our article[ **Step by Step guide to configure APACHE server.**][2]

 **2-** Mod_ssl should also be installed on the systems. Install it using the following command,

 **# yum install mod_ssl**

 **3-** Epel Repositories should be installed  & enables. EPEL repositories are required as not all the dependencies can be resolved with default repos, hence EPEL repos are also required. Install them using the following command,

 **RHEL/CentOS 7**

 **# rpm -Uvh https://dl.fedoraproject.org/pub/epel/7/x86_64/packages/e/epel-release-7-11.noarch.rpm**

 **RHEL/CentOS 6 (64 Bit)**

 **# rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm**

 **RHEL/CentOS 6 (32 Bit)**

 **# rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm**

Now let's start with procedure to install Let's Encrypt on CentOS /RHEL 7.

## Let's encrypt on CentOS RHEL 7

Installation on CentOS 7 can easily performed with yum, with the following command,

 **$ yum install certbot-apache**

Once installed, we can now create the SSL certificate with following command,

 **$ certbot -apache**

Now just follow the on screen instructions to generate the certificate. During the setup, you will also be asked to enforce the HTTPS or to use HTTP , select either of the one you like. But if you enforce HTTPS, than all the changes required to use HTTPS will made by certbot setup otherwise we will have to make changes on our own.

We can also generate certificate for multiple websites with single command,

 **$ certbot -apache -d example.com -d test.com**

We can also opt to create certificate only, without automatically making any changes to any configuration files, with the following command,

 **$ certbot -apache certonly**

Certbot issues SSL certificates hae 90 days validity, so we need to renew the certificates before that period is over. Ideal time to renew the certificate would be around 60 days. Run the following command, to renew the certifcate,

 **$ certbot renew**

We can also automate the renewal process with a crontab job. Open the crontab & create a job,

 **$ crontab -e**

 **0 0 1 * comic core.md Dict.md lctt2014.md lctt2016.md LCTT翻译规范.md LICENSE Makefile published README.md sign.md sources translated 选题模板.txt 中文排版指北.md /usr/bin/certbot renew >> /var/log/letsencrypt.log**

This job will renew you certificate 1st of every month at 12 AM.

## Let's Encrypt on CentOS 6

For using Let's encrypt on Centos 6, there are no cerbot packages for CentOS 6 but that does not mean we can't make use of let's encrypt on CentOS/RHEL 6, instead we can use the certbot script for creating/renewing the certificates. Install the script with the following command,

 **# wget https://dl.eff.org/certbot-auto**

 **# chmod a+x certbot-auto**

Now we can use it similarly as we used commands for CentOS 7 but instead of certbot, we will use script. To create new certificate,

 **# sh path/certbot-auto -apache -d example.com**

To create only cert, use

 **# sh path/certbot-auto -apache certonly**

To renew cert, use

 **# sh path/certbot-auto renew**

For creating a cron job, use

 **# crontab -e**

 **0 0 1 * * sh path/certbot-auto renew >> /var/log/letsencrypt.log**

This was our tutorial on how to install and use let's encrypt on CentOS , RHEL 6 & 7 for creating a free SSL certificate for Apache servers. Please do leave your questions or queries down below.

--------------------------------------------------------------------------------

via: http://linuxtechlab.com/create-free-apache-ssl-certificate-lets-encrypt-on-centos-rhel/

作者：[Shusain][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linuxtechlab.com/author/shsuain/
[1]:http://linuxtechlab.com/complete-guide-apache-tomcat-installation-linux/
[2]:http://linuxtechlab.com/beginner-guide-configure-apache/
