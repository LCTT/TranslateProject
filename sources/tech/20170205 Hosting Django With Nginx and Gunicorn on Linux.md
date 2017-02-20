Translating by Flowsnow
### Hosting Django With Nginx and Gunicorn on Linux

![](https://linuxconfig.org/images/gunicorn_logo.png?58963dfd)

Contents

*   *   [1. Introduction][4]
    *   [2. Gunicorn][5]
        *   [2.1. Installation][1]
        *   [2.2. Configuration][2]
        *   [2.3. Running][3]
    *   [3. Nginx][6]
    *   [4. Closing Thoughts][7]

### Introduction

Hosting Django web applications is fairly simple, though it can get more complex than a standard PHP application. There are a few ways to handle making Django interface with a web server. Gunicorn is easily one of the simplest. 

Gunicorn(short for Green Unicorn) acts as in intermediary server between your web server, Nginx in this case, and Django itself. It handles serving the application itself while Nginx picks up the static content.

### Gunicorn

### Installation

Installing Gunicorn is super easy with Pip. If you've already set up your Django project using virtualenv, you have Pip and should be familiar with the way it works. So, install Gunicorn in your virtualenv.
```
$ pip install gunicorn
```

### Configuration

One of the things that makes Gunicorn an appealing choice is the simplicity of its configuration. The best way to handle the configuration is to create a `Gunicorn` folder in the root directory of your Django project. Inside that folder, create a configuration file. 

For this guide, it'll be called `gunicorn-conf.py`. In that file, create something similar to the configuration below.
```
import multiprocessing

bind = 'unix:///tmp/gunicorn1.sock'
workers = multiprocessing.cpu_count() * 2 + 1
reload = True
daemon = True
```
In the case of the above configuration, Gunicorn will create a Unix socket at `/tmp/gunicorn1.sock`. It will also spin up a number of worker processes equivalent to the double the number of CPU cores plus one. It will also automatically reload and run as a daemonized process.

### Running

The command to run Gunicorn is a bit long, but it has additional configuration options specified in it. The most important part is to point Gunicorn to your project's `.wsgi` file.
```
gunicorn -c gunicorn/gunicorn-conf.py -D --error-logfile gunicorn/error.log yourproject.wsgi
```
The command above should be run from your project's root. It tells Gunicorn to use the configuration that you created with the `-c` flag. `-D` once again specifies that it should be daemonized. The last part specifies the location of Gunicorn's error long in the `Gunicorn` folder that you created. The command ends by telling Gunicorn the location of your `.wsgi`file.

### Nginx

Now that Gunicorn is configured and running, you can set up Nginx to connect with it and serve your static files. This guide is going to assume that you have Nginx already configured and that you are using separate `server` blocks for the sites hosted through it. It is also going to include some SSL info. 

If you want to learn how to get free SSL certificates for your site, take a look at our [LetsEncrypt Guide][8].
```
# Set up the connection to Gunicorn
upstream yourproject-gunicorn {
    server unix:/tmp/gunicorn1.sock fail_timeout=0;
}

# Redirect unencrypted traffic to the encrypted site
server {
    listen       80;
    server_name  yourwebsite.com;
    return       301 https://yourwebsite.com$request_uri;
}

# The main server block
server {
	# Set the port to listen on and specify the domain to listen for
    listen 443 default ssl;
    client_max_body_size 4G;
    server_name yourwebsite.com;

	# Specify log locations
    access_log /var/log/nginx/yourwebsite.access_log main;
    error_log /var/log/nginx/yourwebsite.error_log info;

	# Point Nginx to your SSL certs
    ssl on;
    ssl_certificate /etc/letsencrypt/live/yourwebsite.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourwebsite.com/privkey.pem;

	# Set your root directory
	root /var/www/yourvirtualenv/yourproject;

	# Point Nginx at your static files
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

	# Point Nginx at your uploaded files
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

	# Pass off requests to Gunicorn
    location @proxy_to_app {
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header Host $http_host;
        proxy_redirect off;
        proxy_pass   http://njc-gunicorn;
    }

	# Caching for HTML, XML, and JSON
    location ~* \.(html?|xml|json)$ {
        expires 1h;
    }

	# Caching for all other static assets
    location ~* \.(jpg|jpeg|png|gif|ico|css|js|ttf|woff2)$ {
        expires 1M;
        access_log off;
        add_header Cache-Control "public";
        proxy_ignore_headers "Set-Cookie";
    }
}
```
Okay, so that's a bit much, and there can be a lot more. The important points to note are the `upstream` block that points to Gunicorn and the `location` blocks that pass traffic to Gunicorn. Most of the rest is fairly optional, but you should do it in some form. The comments in the configuration should help you with the specifics. 

Once that file is saved, you can restart Nginx for the changes to take effect.
```
# systemctl restart nginx
```
Once Nginx comes back online, your site should be accessible via your domain.

### Closing Thoughts

There is much more that can be done with Nginx, if you want to dig deep. The configurations provided, though, are a good starting point and are something you can actually use. If you're used to Apache and bloated PHP applications, the speed of a server configuration like this should come as a pleasant surprise.

--------------------------------------------------------------------------------

via: https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux

作者：[Nick Congleton][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux
[1]:https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h2-1-installation
[2]:https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h2-2-configuration
[3]:https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h2-3-running
[4]:https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h1-introduction
[5]:https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h2-gunicorn
[6]:https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h3-nginx
[7]:https://linuxconfig.org/hosting-django-with-nginx-and-gunicorn-on-linux#h4-closing-thoughts
[8]:https://linuxconfig.org/generate-ssl-certificates-with-letsencrypt-debian-linux
