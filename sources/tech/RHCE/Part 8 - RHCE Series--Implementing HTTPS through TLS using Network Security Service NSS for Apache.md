RHCE Series: Implementing HTTPS through TLS using Network Security Service (NSS) for Apache
================================================================================
If you are a system administrator who is in charge of maintaining and securing a web server, you can’t afford to not devote your very best efforts to ensure that data served by or going through your server is protected at all times.

![Setup Apache HTTPS Using SSL/TLS](http://www.tecmint.com/wp-content/uploads/2015/09/Setup-Apache-SSL-TLS-Server.png)

RHCE Series: Implementing HTTPS through TLS using Network Security Service (NSS) for Apache – Part 8

In order to provide more secure communications between web clients and servers, the HTTPS protocol was born as a combination of HTTP and SSL (Secure Sockets Layer) or more recently, TLS (Transport Layer Security).

Due to some serious security breaches, SSL has been deprecated in favor of the more robust TLS. For that reason, in this article we will explain how to secure connections between your web server and clients using TLS.

This tutorial assumes that you have already installed and configured your Apache web server. If not, please refer to following article in this site before proceeding further.

- [Install LAMP (Linux, MySQL/MariaDB, Apache and PHP) on RHEL/CentOS 7][1]

### Installation of OpenSSL and Utilities ###

First off, make sure that Apache is running and that both http and https are allowed through the firewall:

    # systemctl start http
    # systemctl enable http
    # firewall-cmd --permanent –-add-service=http
    # firewall-cmd --permanent –-add-service=https

Then install the necessary packages:

    # yum update && yum install openssl mod_nss crypto-utils

**Important**: Please note that you can replace mod_nss with mod_ssl in the command above if you want to use OpenSSL libraries instead of NSS (Network Security Service) to implement TLS (which one to use is left entirely up to you, but we will use NSS in this article as it is more robust; for example, it supports recent cryptography standards such as PKCS #11).

Finally, uninstall mod_ssl if you chose to use mod_nss, or viceversa.

    # yum remove mod_ssl

### Configuring NSS (Network Security Service) ###

After mod_nss is installed, its default configuration file is created as /etc/httpd/conf.d/nss.conf. You should then make sure that all of the Listen and VirtualHost directives point to port 443 (default port for HTTPS):

nss.conf – Configuration File

----------

    Listen 443
    VirtualHost _default_:443

Then restart Apache and check whether the mod_nss module has been loaded:

    # apachectl restart
    # httpd -M | grep nss

![Check Mod_NSS Module in Apache](http://www.tecmint.com/wp-content/uploads/2015/09/Check-Mod_NSS-Module-in-Apache.png)

Check Mod_NSS Module Loaded in Apache

Next, the following edits should be made in `/etc/httpd/conf.d/nss.conf` configuration file:

1. Indicate NSS database directory. You can use the default directory or create a new one. In this tutorial we will use the default:

    NSSCertificateDatabase /etc/httpd/alias

2. Avoid manual passphrase entry on each system start by saving the password to the database directory in /etc/httpd/nss-db-password.conf:

    NSSPassPhraseDialog file:/etc/httpd/nss-db-password.conf

Where /etc/httpd/nss-db-password.conf contains ONLY the following line and mypassword is the password that you will set later for the NSS database:

    internal:mypassword

In addition, its permissions and ownership should be set to 0640 and root:apache, respectively:

    # chmod 640 /etc/httpd/nss-db-password.conf
    # chgrp apache /etc/httpd/nss-db-password.conf

3. Red Hat recommends disabling SSL and all versions of TLS previous to TLSv1.0 due to the POODLE SSLv3 vulnerability (more information [here][2]).

Make sure that every instance of the NSSProtocol directive reads as follows (you are likely to find only one if you are not hosting other virtual hosts):

    NSSProtocol TLSv1.0,TLSv1.1

4. Apache will refuse to restart as this is a self-signed certificate and will not recognize the issuer as valid. For this reason, in this particular case you will have to add:

    NSSEnforceValidCerts off

5. Though not strictly required, it is important to set a password for the NSS database:

    # certutil -W -d /etc/httpd/alias

![Set Password for NSS Database](http://www.tecmint.com/wp-content/uploads/2015/09/Set-Password-for-NSS-Database.png)

Set Password for NSS Database

### Creating a Apache SSL Self-Signed Certificate ###

Next, we will create a self-signed certificate that will identify the server to our clients (please note that this method is not the best option for production environments; for such use you may want to consider buying a certificate verified by a 3rd trusted certificate authority, such as DigiCert).

To create a new NSS-compliant certificate for box1 which will be valid for 365 days, we will use the genkey command. When this process completes:

    # genkey --nss --days 365 box1

Choose Next:

![Create Apache SSL Key](http://www.tecmint.com/wp-content/uploads/2015/09/Create-Apache-SSL-Key.png)

Create Apache SSL Key

You can leave the default choice for the key size (2048), then choose Next again:

![Select Apache SSL Key Size](http://www.tecmint.com/wp-content/uploads/2015/09/Select-Apache-SSL-Key-Size.png)

Select Apache SSL Key Size

Wait while the system generates random bits:

![Generating Random Key Bits](http://www.tecmint.com/wp-content/uploads/2015/09/Generating-Random-Bits.png)

Generating Random Key Bits

To speed up the process, you will be prompted to enter random text in your console, as shown in the following screencast. Please note how the progress bar stops when no input from the keyboard is received. Then, you will be asked to:

1. Whether to send the Certificate Sign Request (CSR) to a Certificate Authority (CA): Choose No, as this is a self-signed certificate.

2. to enter the information for the certificate.

注：youtube 视频
<iframe width="720" height="405" frameborder="0" src="//www.youtube.com/embed/mgsfeNfuurA" allowfullscreen="allowfullscreen"></iframe>

Finally, you will be prompted to enter the password to the NSS certificate that you set earlier:

    # genkey --nss --days 365 box1

![Apache NSS Certificate Password](http://www.tecmint.com/wp-content/uploads/2015/09/Apache-NSS-Password.png)

Apache NSS Certificate Password

At anytime, you can list the existing certificates with:

    # certutil –L –d /etc/httpd/alias

![List Apache NSS Certificates](http://www.tecmint.com/wp-content/uploads/2015/09/List-Apache-Certificates.png)

List Apache NSS Certificates

And delete them by name (only if strictly required, replacing box1 by your own certificate name) with:

    # certutil -d /etc/httpd/alias -D -n "box1"

if you need to.c

### Testing Apache SSL HTTPS Connections ###

Finally, it’s time to test the secure connection to our web server. When you point your browser to https://<web server IP or hostname>, you will get the well-known message “This connection is untrusted“:

![Check Apache SSL Connection](http://www.tecmint.com/wp-content/uploads/2015/09/Check-Apache-SSL-Connection.png)

Check Apache SSL Connection

In the above situation, you can click on Add Exception and then Confirm Security Exception – but don’t do it yet. Let’s first examine the certificate to see if its details match the information that we entered earlier (as shown in the screencast).

To do so, click on View… –> Details tab above and you should see this when you select Issuer from the list:

![Confirm Apache SSL Certificate Details](http://www.tecmint.com/wp-content/uploads/2015/09/Check-Apache-SSL-Certificate-Details.png)

Confirm Apache SSL Certificate Details

Now you can go ahead, confirm the exception (either for this time or permanently) and you will be taken to your web server’s DocumentRoot directory via https, where you can inspect the connection details using your browser’s builtin developer tools:

In Firefox you can launch it by right clicking on the screen, and choosing Inspect Element from the context menu, specifically through the Network tab:

![Inspect Apache HTTPS Connection](http://www.tecmint.com/wp-content/uploads/2015/09/Inspect-Apache-HTTPS-Connection.png)

Inspect Apache HTTPS Connection

Please note that this is the same information as displayed before, which was entered during the certificate previously. There’s also a way to test the connection using command line tools:

On the left (testing SSLv3):

    # openssl s_client -connect localhost:443 -ssl3

On the right (testing TLS):

    # openssl s_client -connect localhost:443 -tls1

![Testing Apache SSL and TLS Connections](http://www.tecmint.com/wp-content/uploads/2015/09/Testing-Apache-SSL-and-TLS.png)

Testing Apache SSL and TLS Connections

Refer to the screenshot above for more details.

### Summary ###

As I’m sure you already know, the presence of HTTPS inspires trust in visitors who may have to enter personal information in your site (from user names and passwords all the way to financial / bank account information).

In that case, you will want to get a certificate signed by a trusted Certificate Authority as we explained earlier (the steps to set it up are identical with the exception that you will need to send the CSR to a CA, and you will get the signed certificate back); otherwise, a self-signed certificate as the one used in this tutorial will do.

For more details on the use of NSS, please refer to the online help about [mod-nss][3]. And don’t hesitate to let us know if you have any questions or comments.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-apache-https-self-signed-certificate-using-nss/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/install-lamp-in-centos-7/
[1]:http://www.tecmint.com/author/gacanepa/
[2]:https://access.redhat.com/articles/1232123
[3]:https://git.fedorahosted.org/cgit/mod_nss.git/plain/docs/mod_nss.html