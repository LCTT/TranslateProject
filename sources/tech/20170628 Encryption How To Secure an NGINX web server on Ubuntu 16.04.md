translating----geekpi

Encryption: How To Secure an NGINX web server on Ubuntu 16.04
============================================================

By [Giuseppe Molica][1]</header>

 [![Let's Encrypt Encryption CA](https://www.unixmen.com/wp-content/uploads/2017/06/le-logo-standard.png "le-logo-standard")][2] 

### What is Let’s Encrypt

[Let’s Encrypt][3] is a free certificate authority brought by the Internet Security Research Group (ISRG). It provides an easy and automated way to obtain free SSL/TLS certificates – a required step for enabling encryption and HTTPS traffic on web servers. Most of the steps in obtaining and installing a certificate can be automated by using a tool called [Certbot][4].

In particular, this software can be used in presence of shell access to the server: in other words, when it’s possible to connect to the server through SSH.

In this tutorial we will see how to use `certbot` to obtain a free SSL certificate and use it with Nginx on an Ubuntu 16.04 server.

### Install Certbot

The first step is to install `certbot`, the software client which will automate almost everything in the process. Certbot developers maintain their own Ubuntu software repository which contain software newer than those present in the Ubuntu repositories.

Add the Certbot repository:

```
# add-apt-repository ppa:certbot/certbot
```

Next, update the APT sources list:

```
# apt-get update
```

At this point, it is possible to install `certbot` with the following `apt` command:

```
# apt-get install certbot
```

Certbot is now installed and ready to use.

### Obtain a Certificate

There are various Certbot plugins for obtaining SSL certificates. These plugins help in obtaining a certificate, while its installation and web server configuration are both left to the admin.

We will use a plugin called **Webroot** to obtain a SSL certificate.

This plugin is recommended in those cases where there is the ability to modify the content being served. There is no need to stop the web server during the certificate issuance process.

#### Configure NGINX

Webroot works by creating a temporary file for each domain in a directory called `.well-known`, placed inside the web root directory. In our case, the web root directory is `/var/www/html`. Ensure that the directory is accessible to Let’s Encrypt for validation. To do so, edit the NGINX configuration. With a text editor, open the `/etc/nginx/sites-available/default` file:

```
# $EDITOR /etc/nginx/sites-available/default
```

In this file, in the server block, place the following content:

```
 location ~ /.well-known {
    allow all;
 }
```

Save, exit and check the NGINX configuration:

```
# nginx -t
```

Without errors, it should display:

```
nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

Restart NGINX:

```
# systemctl restart nginx
```

#### Obtain Certificate with Certbot

The next step is to obtain a new certificate using Certbot with the Webroot plugin. In this tutorial, we will secure (as example) the domain www.example.com. It is required to specify every domain that should be secured by the certificate. Execute the following command:

```
# certbot certonly --webroot --webroot-path=/var/www/html -d www.example.com
```

During the process, Cerbot will ask for a valid email address for notification purposes. It will also ask to share it with the EFF, but this is not required. After agreeing the Terms of Services, it will obtain a new certificate.

At the end, the directory `/etc/letsencrypt/archive` will contain the following files:

*   chain.pem: Let’s Encrypt chain certificate.

*   cert.pem: domain certificate.

*   fullchain.pem: combination of `cert.pem` and `chain.pem`.

*   privkey.pem: certificate’s private key.

Certbot will also create symbolic links to the most recent certificate files in `/etc/letsencrypt/live/**domain_name**/`. This is the path we will use in server configuration.

### Configure SSL/TLS on NGINX

The next step is server configuration. Create a new snippet in the `/etc/nginx/snippets/`. A **snippet** is a part of a configuration file that can be included in virtual host configuration files. So, create a new file:

```
# $EDITOR /etc/nginx/snippets/secure-example.conf
```

The content of this file will be the directives specifying the locations of the certificate and key. Paste the following content:

```
ssl_certificate /etc/letsencrypt/live/domain_name/fullchain.pem;
ssl_certificate_key /etc/letsencrypt/live/domain_name/privkey.pem;
```

In our case, `domain_name` would be `example.com`.

#### Edit NGINX Configuration

Edit the default Virtual Host file:

```
# $EDITOR /etc/nginx/sites-available/default
```

As follows:

```
server {
 listen 80 default_server;
 listen [::]:80 default_server;
 server_name www.example.com
 return 301 https://$server_name$request_uri;

 # SSL configuration
 #
 listen 443 ssl default_server;
 listen [::]:443 ssl default_server;
 include snippets/secure-example.conf
 #
 # Note: You should disable gzip for SSL traffic.
 # See: https://bugs.debian.org/773332
...
```

This will enable encryption on NGINX.

Save, exit and check the NGINX configuration file:

```
# nginx -t

nginx: the configuration file /etc/nginx/nginx.conf syntax is ok
nginx: configuration file /etc/nginx/nginx.conf test is successful
```

Restart NGINX:

```
# systemctl restart nginx
```

### Conclusion

Following all the steps above, at this point we have a secured NGINX-based web server, with encryption granted by Certbot and Let’s Encrypt. This is just a basic configuration, of course, and it’s possible to use many NGINX configuration parameters for personalizing everything, but that depends on specific web server requirements.

--------------------------------------------------------------------------------

via: https://www.unixmen.com/encryption-secure-nginx-web-server-ubuntu-16-04/

作者：[Giuseppe Molica ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.unixmen.com/author/tutan/
[1]:https://www.unixmen.com/author/tutan/
[2]:https://www.unixmen.com/wp-content/uploads/2017/06/le-logo-standard.png
[3]:https://letsencrypt.org/
[4]:https://certbot.eff.org/
