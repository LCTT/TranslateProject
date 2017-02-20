How to Enable HTTP/2 in Nginx on Ubuntu and CentOS
============================================================


 ![](https://www.rosehosting.com/blog/wp-content/uploads/2017/02/enable-http2-nginx.jpg) 

HTTP/2 is a major revision of the HTTP network protocol and it focuses on performance improvements. Its goal is to reduce the latency as well as to make the web applications faster by allowing multiple concurrent requests between the web browser and the server across a single TCP connection. In this tutorial, we are going to show you how to enable HTTP/2 in Nginx on a Linux VPS using Ubuntu or CentOS as an operating system. If you use Apache, you can check our tutorial on [how to enable HTTP/2 in Apache on Ubuntu][6].

### Prerequisites

In order to be able to follow the instructions and enable HTTP/2 on your server, you need to have [Nginx][7] already preinstalled. Make sure that it is functional and there are no errors with its configuration. You can check this using the command below:

```
sudo nginx -t
```

Additionally, you need to have root access to the server or at least you need to have a non-root system user with sudo privileges so you can make changes in the Nginx configuration files without having permission problems. Finally, you need to have a [domain name][8] and valid [SSL certificate][9] issued for the domain name.

### Enable HTTP/2 in Nginx on Ubuntu

To enable HTTP/2 in Nginx on an [Ubuntu VPS][10] you should edit the default Nginx server block. We will use `nano`but you can use a text editor of your choice.

```
sudo nano /etc/nginx/sites-available/default
```

Add the following server block:

```
server {  
        server_name domain.com www.domain.com;
        listen 443 ssl http2 default_server;
        root /var/www/html;
        index index.html;

        location / {
                try_files $uri $uri/ =404;
        }

        ssl_certificate /etc/nginx/ssl/domain.com.crt;
        ssl_certificate_key /etc/nginx/ssl/domain.com.key;
}

server {
       listen         80;
       server_name    domain.com www.domain.com;
       return         301 https://$server_name$request_uri;
}
```

Make sure that `domain.com` is replaced with your real domain name. Additionally, the document root and the path to the SSL certificate and key should be correctly set.

Once you finish with editing the server block, save and close the file. Check if there are errors in the Nginx configuration using the command:

```
sudo nginx -t
```

And then restart Nginx for the changes to take effect

```
sudo systemctl restart nginx.service
```

If you’d like to enable HTTP/2 for another domain name, you can check our blog post on [how to set up Nginx server blocks on Ubuntu and CentOS][11].

### Enable HTTP/2 in Nginx on CentOS

To enable HTTP/2 on a [CentOS VPS][12] you need to follow the exact same steps as on Ubuntu. The location of the Nginx block file is the only difference. To edit the default Nginx server block on CentOS you should look into the `/etc/nginx/conf.d` directory.

```
# nano /etc/nginx/conf.d/default.conf
```

Once again, check if there are errors with the configuration, save and close the file, then restart the Nginx service using the command below:

```
# systemctl restart nginx.service
```

To check whether HTTP/2 is enabled in Nginx you can use some [online HTTP/2 checker tool][13].

Of course you don’t have to do any of this if you use one of our [Linux VPS hosting][14] services, in which case you can simply ask our expert Linux admins to help you enable HTTP/2 in Nginx on your server. They are available 24×7 and will take care of your request immediately.

PS. If you liked this post please share it with your friends on the social networks using the buttons below or simply leave a comment. Thanks.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/

作者：[rosehosting.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/
[1]:https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/
[2]:https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/#comments
[3]:https://www.rosehosting.com/blog/category/tutorials/
[4]:https://plus.google.com/share?url=https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/
[5]:http://www.linkedin.com/shareArticle?mini=true&url=https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/&title=How%20to%20Enable%20HTTP%2F2%20in%20Nginx%20on%20Ubuntu%20and%20CentOS&summary=HTTP/2%20is%20a%20major%20revision%20of%20the%20HTTP%20network%20protocol%20and%20it%20focuses%20on%20performance%20improvements.%20Its%20goal%20is%20to%20reduce%20the%20latency%20as%20well%20as%20to%20make%20the%20web%20applications%20faster%20by%20allowing%20multiple%20concurrent%20requests%20between%20the%20web%20browser%20and%20the%20server%20across%20a%20single%20TCP%20connection.%20In%20...
[6]:https://www.rosehosting.com/blog/how-to-set-up-apache-with-http2-support-on-ubuntu-16-04/
[7]:https://www.rosehosting.com/nginx-hosting.html
[8]:https://secure.rosehosting.com/clientarea/index.php?/checkdomain/domain-registration/
[9]:https://www.rosehosting.com/ssl-certificates.html
[10]:https://www.rosehosting.com/ubuntu-vps.html
[11]:https://www.rosehosting.com/blog/how-to-set-up-nginx-server-blocks-on-ubuntu-and-centos/
[12]:https://www.rosehosting.com/centos-vps.html
[13]:https://www.rosehosting.com/network-tools/http2-support.html
[14]:https://www.rosehosting.com/linux-vps-hosting.html
