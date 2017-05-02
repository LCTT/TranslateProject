在 Linux 上使用 Nginx 和 Gunicorn 托管 Django 应用
==========

![](https://linuxconfig.org/images/gunicorn_logo.png?58963dfd)


### 介绍

托管 Django Web 应用程序相当简单，虽然它比标准的 PHP 应用程序更复杂一些。 让 Web 服务器对接 Django 的方法有很多。 Gunicorn 就是其中最简单的一个。

Gunicorn（Green Unicorn 的缩写）在你的 Web 服务器 Django 之间作为中间服务器使用，在这里，Web 服务器就是 Nginx。 Gunicorn 服务于应用程序，而 Nginx 处理静态内容。

### Gunicorn

#### 安装

使用 Pip 安装 Gunicorn 是超级简单的。 如果你已经使用 virtualenv 搭建好了你的 Django 项目，那么你就有了 Pip，并且应该熟悉 Pip 的工作方式。 所以，在你的 virtualenv 中安装 Gunicorn。

```
$ pip install gunicorn
```

#### 配置

Gunicorn 最有吸引力的一个地方就是它的配置非常简单。处理配置最好的方法就是在 Django 项目的根目录下创建一个名叫 `Gunicorn` 的文件夹。然后在该文件夹内，创建一个配置文件。

在本篇教程中，配置文件名称是 `gunicorn-conf.py`。在该文件中，创建类似于下面的配置：

```
import multiprocessing

bind = 'unix:///tmp/gunicorn1.sock'
workers = multiprocessing.cpu_count() * 2 + 1
reload = True
daemon = True
```

在上述配置的情况下，Gunicorn 会在 `/tmp/` 目录下创建一个名为 `gunicorn1.sock` 的 Unix 套接字。 还会启动一些工作进程，进程数量相当于 CPU 内核数量的 2 倍。 它还会自动重新加载并作为守护进程运行。

#### 运行

Gunicorn 的运行命令有点长，指定了一些附加的配置项。 最重要的部分是将 Gunicorn 指向你项目的 `.wsgi` 文件。

```
gunicorn -c gunicorn/gunicorn-conf.py -D --error-logfile gunicorn/error.log yourproject.wsgi
```

上面的命令应该从项目的根目录运行。 `-c` 选项告诉 Gunicorn 使用你创建的配置文件。 `-D` 再次指定 gunicorn 为守护进程。 最后一部分指定 Gunicorn 的错误日志文件在你创建 `Gunicorn` 文件夹中的位置。 命令结束部分就是为 Gunicorn 指定 `.wsgi` 文件的位置。

### Nginx

现在 Gunicorn 配置好了并且已经开始运行了，你可以设置 Nginx 连接它，为你的静态文件提供服务。 本指南假定你已经配置好了 Nginx，而且你通过它托管的站点使用了单独的 server 块。 它还将包括一些 SSL 信息。

如果你想知道如何让你的网站获得免费的 SSL 证书，请查看我们的 [Let'sEncrypt 指南][8]。

```nginx
# 连接到 Gunicorn
upstream yourproject-gunicorn {
    server unix:/tmp/gunicorn1.sock fail_timeout=0;
}

# 将未加密的流量重定向到加密的网站
server {
    listen       80;
    server_name  yourwebsite.com;
    return       301 https://yourwebsite.com$request_uri;
}

# 主服务块
server {
	# 设置监听的端口，指定监听的域名
    listen 443 default ssl;
    client_max_body_size 4G;
    server_name yourwebsite.com;

	# 指定日志位置
    access_log /var/log/nginx/yourwebsite.access_log main;
    error_log /var/log/nginx/yourwebsite.error_log info;

	# 告诉 nginx 你的 ssl 证书
    ssl on;
    ssl_certificate /etc/letsencrypt/live/yourwebsite.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourwebsite.com/privkey.pem;

	# 设置根目录
	root /var/www/yourvirtualenv/yourproject;

	# 为 Nginx 指定静态文件路径
    location /static/ {
		# Autoindex the files to make them browsable if you want
        autoindex on;
        # The location of your files
        alias /var/www/yourvirtualenv/yourproject/static/;
		# Set up caching for your static files
        expires 1M;
        access_log off;
        add_header Cache-Control "public";
        proxy_ignore_headers "Set-Cookie";
    }

	# 为 Nginx 指定你上传文件的路径
    location /media/ {
		Autoindex if you want
        autoindex on;
        # The location of your uploaded files
        alias /var/www/yourvirtualenv/yourproject/media/;
		# Set up aching for your uploaded files
        expires 1M;
        access_log off;
        add_header Cache-Control "public";
        proxy_ignore_headers "Set-Cookie";
    }

	location / {
        # Try your static files first, then redirect to Gunicorn
        try_files $uri @proxy_to_app;
    }

	# 将请求传递给 Gunicorn
    location @proxy_to_app {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_pass   http://njc-gunicorn;
    }

	# 缓存 HTML、XML 和 JSON
    location ~* \.(html?|xml|json)$ {
        expires 1h;
    }

	# 缓存所有其他的静态资源
    location ~* \.(jpg|jpeg|png|gif|ico|css|js|ttf|woff2)$ {
        expires 1M;
        access_log off;
        add_header Cache-Control "public";
        proxy_ignore_headers "Set-Cookie";
    }
}
```
配置文件有点长，但是还可以更长一些。其中重点是指向 Gunicorn 的 `upstream` 块以及将流量传递给 Gunicorn 的 `location` 块。大多数其他的配置项都是可选，但是你应该按照一定的形式来配置。配置中的注释应该可以帮助你了解具体细节。

保存文件之后，你可以重启 Nginx，让修改的配置生效。

```
# systemctl restart nginx
```

一旦 Nginx 在线生效，你的站点就可以通过域名访问了。

### 结语

如果你想深入研究，Nginx 可以做很多事情。但是，上面提供的配置是一个很好的开始，并且你可以用于实践中。 如果你见惯了 Apache 和臃肿的 PHP 应用程序，像这样的服务器配置的速度应该是一个惊喜。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux

作者：[Nick Congleton][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux
[1]: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h2-1-installation
[2]: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h2-2-configuration
[3]: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h2-3-running
[4]: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h1-introduction
[5]: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h2-gunicorn
[6]: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h3-nginx
[7]: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h4-closing-thoughts
[8]: https://linuxconfig.org/generate-ssl-certificates-with-letsencrypt-debian-linux