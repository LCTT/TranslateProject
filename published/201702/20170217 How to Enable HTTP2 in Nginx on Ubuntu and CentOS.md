如何在 Ubuntu 和 CentOS 上启用 Nginx 的 HTTP/2 协议支持
===

![](https://www.rosehosting.com/blog/wp-content/uploads/2017/02/enable-http2-nginx.jpg) 

HTTP/2 是 HTTP 网络协议的主要修订版本，其专注于 HTTP 协议的性能改进。HTTP/2 协议的目标是减少延迟，并且允许在 Web 浏览器和服务器之间的一个连接上并行发起多个请求，因此 Web 应用程序会更快。在本篇教程中，我们将像你展示如何在安装有 Ubuntu 或 CentOS 作为操作系统的 Linux VPS 上使用开启 Nginx 的 HTTP/2 协议。如果你使用 Apache，你可以查看我们的另一篇教程：[如何在 Ubuntu 上开启 Apache 的 HTTP/2 协议][6]。

### 必备条件

为了能够按照本篇教程最终在服务器上启用 HTTP/2 协议，你需要先安装好 [Nginx][7] 。并且确保功能正常而且配置没有错误。你可以使用下面的命令来检查一下：

```
sudo nginx -t
```

此外，你需要有服务器的 root 访问权限，或者至少有一个具有 sudo 权限的非 root 系统用户，以便你在修改 Nginx 配置文件的时候不会出现权限问题。最后你需要有一个[域名][8]和一个颁发给这个域名的有效的 [SSL 证书][9]。 

### 在 Ubuntu 上开启 Nginx 的 HTTP/2 协议

为了在 [Ubuntu VPS][10] 上开启 Nginx 的 HTTP/2 协议，你需要编辑默认的 Nginx 的服务（`server`）块，我们使用的是 `nano`，你可以使用你自己的文本编辑器。

```
sudo nano /etc/nginx/sites-available/default
```

增加下面的服务块：

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

确保 `domain.com` 替换成你真正的域名。 此外，应正确设置文档根（`root`）目录，还有 SSL 证书和密钥的路径。

当你编辑完成这个服务块之后，需要保存并关闭文件。使用以下命令检查 Nginx 配置是否有错误：

```
sudo nginx -t
```

为了刚刚的改变生效，需要重启 Nginx：

```
sudo systemctl restart nginx.service
```

如果你想为另一个域名开启 HTTP/2 协议，你可以查看我们的博客[如何在 Ubuntu 和 CentOS 上设置 Nginx 服务块][11]。

### 在 CentOS 上开启 Nginx 的 HTTP/2 协议

为了在 [CentOS VPS][12] 开启 Nginx 的 HTTP/2 协议，你需要按照 Ubuntu 上完全相同的步骤做。唯一的不同点是 Nginx 块文件的位置。为了在 CentOS 上编辑默认的 Nginx 服务块，你需要进入 `/etc/nginx/conf.d`  这个文件夹。

```
# nano /etc/nginx/conf.d/default.conf
```

再次检查配置是否有错误，保存并关闭文件，然后使用以下命令重新启动 Nginx 服务：

```
# systemctl restart nginx.service
```

为了检测 Nginx 的 HTTP/2 协议是否开启成功，你可以使用一些[在线 HTTP/2 检测工具][13]。

当然如果你使用我们的 [Linux VPS 主机][14]服务，在这种情况下你可以简易地要求我们的专家级的 Linux 管理员帮助你在你的服务器上启用 Nginx 的 HTTP/2 协议。他们提供 7×24 小时的服务，并且会很快关注的你要求。

PS：如果你喜欢这篇文章，请使用下面的按钮分享给你社交网络上的朋友们，或者发表一下评论。谢谢。

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/

作者：[rosehosting.com][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/
[1]: https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/
[2]: https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/#comments
[3]: https://www.rosehosting.com/blog/category/tutorials/
[4]: https://plus.google.com/share?url=https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/
[5]: http://www.linkedin.com/shareArticle?mini=true&amp;url=https://www.rosehosting.com/blog/how-to-enable-http2-in-nginx-on-ubuntu-and-centos/&amp;title=How%20to%20Enable%20HTTP%2F2%20in%20Nginx%20on%20Ubuntu%20and%20CentOS&amp;summary=HTTP/2%20is%20a%20major%20revision%20of%20the%20HTTP%20network%20protocol%20and%20it%20focuses%20on%20performance%20improvements.%20Its%20goal%20is%20to%20reduce%20the%20latency%20as%20well%20as%20to%20make%20the%20web%20applications%20faster%20by%20allowing%20multiple%20concurrent%20requests%20between%20the%20web%20browser%20and%20the%20server%20across%20a%20single%20TCP%20connection.%20In%20...
[6]: https://www.rosehosting.com/blog/how-to-set-up-apache-with-http2-support-on-ubuntu-16-04/
[7]: https://www.rosehosting.com/nginx-hosting.html
[8]: https://secure.rosehosting.com/clientarea/index.php?/checkdomain/domain-registration/
[9]: https://www.rosehosting.com/ssl-certificates.html
[10]: https://www.rosehosting.com/ubuntu-vps.html
[11]: https://www.rosehosting.com/blog/how-to-set-up-nginx-server-blocks-on-ubuntu-and-centos/
[12]: https://www.rosehosting.com/centos-vps.html
[13]: https://www.rosehosting.com/network-tools/http2-support.html
[14]: https://www.rosehosting.com/linux-vps-hosting.html