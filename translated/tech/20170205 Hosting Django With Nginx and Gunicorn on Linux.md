### 在Linux上使用Nginx和Gunicorn托管Django

![](https://linuxconfig.org/images/gunicorn_logo.png?58963dfd)

内容

*   *   [1. 介绍][4]
    *   [2. Gunicorn][5]
        *   [2.1. 安装][1]
        *   [2.2. 配置][2]
        *   [2.3. 运行][3]
    *   [3. Nginx][6]
    *   [4. 结语][7]

### 介绍

托管Django Web应用程序相当简单，虽然它比标准的PHP应用程序更复杂一些。 处理带Web服务器的Django接口的方法有很多。 Gunicorn就是其中最简单的一个。

Gunicorn（Green Unicorn的缩写）在你的Web服务器Django之间作为中间服务器使用，在这里，Web服务器就是Nginx。 Gunicorn服务于应用程序，而Nginx处理静态内容。

### Gunicorn

### 安装

使用Pip安装Gunicorn是超级简单的。 如果你已经使用virtualenv搭建好了你的Django项目，那么你就有了Pip，并且应该熟悉Pip的工作方式。 所以，在你的virtualenv中安装Gunicorn。

```
$ pip install gunicorn
```

### 配置

Gunicorn 最有吸引力的一个地方就是它的配置非常简单。处理配置最好的方法就是在Django项目的根目录下创建一个名叫Gunicorn的文件夹。然后 在该文件夹内，创建一个配置文件。

在本篇教程中，配置文件名称是`gunicorn-conf.py`。在改文件中，创建类似于下面的配置

```
import multiprocessing

bind = 'unix:///tmp/gunicorn1.sock'
workers = multiprocessing.cpu_count() * 2 + 1
reload = True
daemon = True
```
在上述配置的情况下，Gunicorn会在`/tmp/`目录下创建一个名为`gunicorn1.sock`的Unix套接字。 还会启动一些工作进程，进程数量相当于CPU内核数量的2倍。 它还会自动重新加载并作为守护进程运行。

### 运行

Gunicorn的运行命令有点长，指定了一些附加的配置项。 最重要的部分是将Gunicorn指向你项目的`.wsgi`文件。

```
gunicorn -c gunicorn/gunicorn-conf.py -D --error-logfile gunicorn/error.log yourproject.wsgi
```
上面的命令应该从项目的根目录运行。 Gunicorn会使用你用`-c`选项创建的配置。 `-D`再次指定gunicorn为守护进程。 最后一部分指定Gunicorn的错误日志文件在`Gunicorn`文件夹中的位置。 命令结束部分就是为Gunicorn指定`.wsgi`file的位置。

### Nginx

现在Gunicorn配置好了并且已经开始运行了，你可以设置Nginx连接它，为你的静态文件提供服务。 本指南假定你已经配置了Nginx，而且你通过它托管的站点使用了单独的服务块。 它还将包括一些SSL信息。

如果你想知道如何让你的网站获得免费的SSL证书，请查看我们的[LetsEncrypt指南][8]。

```nginx
# 连接到Gunicorn
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

	# 将nginx指向你的ssl证书
    ssl on;
    ssl_certificate /etc/letsencrypt/live/yourwebsite.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourwebsite.com/privkey.pem;

	# 设置根目录
	root /var/www/yourvirtualenv/yourproject;

	# 为Nginx指定静态文件路径
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

	# 为Nginx指定你上传文件的路径
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

	# 将请求传递给Gunicorn
    location @proxy_to_app {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_pass   http://njc-gunicorn;
    }

	# 缓存HTML，XML和JSON
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
配置文件有点长，但是还可以更长一些。其中重点是指向 Gunicorn 的`upstream`块以及将流量传递给 Gunicorn 的`location`块。大多数其他的配置项都是可选，但是你应该按照一定的形式来配置。配置中的注释应该可以帮助你了解具体细节。

保存文件之后，你可以重启Nginx，让修改的配置生效。

```
# systemctl restart nginx
```
一旦Nginx在线生效，你的站点就可以通过域名访问了。

### 结语

如果你想深入研究，Nginx可以做很多事情。但是，上面提供的配置是一个很好的开始，并且你可以用于实践中。 如果你习惯于Apache和臃肿的PHP应用程序，像这样的服务器配置的速度应该是一个惊喜。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux

作者：[Nick Congleton][a]
译者：[Flowsnow](https://github.com/Flowsnow)
校对：[校对者ID](https://github.com/校对者ID)

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