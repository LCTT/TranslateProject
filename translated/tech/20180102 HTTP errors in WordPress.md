WordPress 中的HTTP错误
======
![http error wordpress][1]

我们会向你介绍，如何修复WordPress中的HTTP错误(在Linux VPS上)。 下面列出了WordPress用户遇到的最常见的HTTP错误，我们的建议侧重于如何发现错误原因以及解决方法。




### 1\. 修复在上传图像时出现的HTTP错误

如果你在基于WordPress的网页中上传图像时出现错误，这也许是因为服务器上PHP配置，例如存储空间不足或者其他配置问题造成的。


用如下命令查找php配置文件：


```
#php -i | grep php.ini
Configuration File (php.ini) Path => /etc
Loaded Configuration File => /etc/php.ini
```

根据输出结果，php配置文件位于 '/etc'文件夹下。编辑 '/etc/php.ini'文件，找出下列行，并按照下面的例子修改其中相对应的值:


```
vi /etc/php.ini
```
```
upload_max_filesize = 64M
post_max_size = 32M
max_execution_time = 300
max_input_time 300
memory_limit = 128M
```

当然，如果你不习惯使用vi文本编辑器，你可以选用自己喜欢的。


不要忘记重启你的网页服务器来让改动生效。


如果你安装的网页服务器是Apache,你需要使用 .htaccess文件。首先，找到 .htaccess 文件。它位于WordPress安装路径的根文件夹下。如果没有找到 .htaccess文件，需要自己手动创建一个，然后加入如下内容:


```
vi /www/html/path_to_wordpress/.htaccess
```
```
php_value upload_max_filesize 64M
php_value post_max_size 32M
php_value max_execution_time 180
php_value max_input_time 180

# BEGIN WordPress
<IfModule mod_rewrite.c>
RewriteEngine On
RewriteBase /
RewriteRule ^index\.php$ - [L]
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]
</IfModule>
# END WordPress
```
如果你使用的网页服务器是nginx,在WordPress实例中具体配置nginx服务器的设置。详细配置和下面的例子相似:

```
server {

listen 80;
client_max_body_size 128m;
client_body_timeout 300;

server_name your-domain.com www.your-domain.com;

root /var/www/html/wordpress;
index index.php;

location = /favicon.ico {
log_not_found off;
access_log off;
}

location = /robots.txt {
allow all;
log_not_found off;
access_log off;
}

location / {
try_files $uri $uri/ /index.php?$args;
}

location ~ \.php$ {
include fastcgi_params;
fastcgi_pass 127.0.0.1:9000;
fastcgi_index index.php;
fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
}

location ~* \.(js|css|png|jpg|jpeg|gif|ico)$ {
expires max;
log_not_found off;
}
}
```

根据自己的PHP配置，你需要将 'fastcgi_pass 127.0.0.1:9000;' 用类似于 'fastcgi_pass unix:/var/run/php7-fpm.sock;' 替换掉（依照实际连接方式）


重启nginx服务来使改动生效。



### 2\. 修复因为不恰当的文件权限而产生的HTTP错误

如果你在WordPress中出现一个意外错误，也许是因为不恰当的文件权限导致的，所以需要给WordPress文件和文件夹设置一个正确的权限：

```
chown www-data:www-data -R /var/www/html/path_to_wordpress/
```

将 'www-data' 替换成实际的网页服务器用户，将 '/var/www/html/path_to_wordpress' 换成WordPress的实际安装路径。


### 3\. 修复因为内存不足而产生的HTTP错误

你可以通过在wp-config.php中添加如下内容来设置PHP的最大内存限制：

```
 define('WP_MEMORY_LIMIT', '128MB');
```

### 4\. 修复因为PHP.INI文件错误配置而产生的HTTP错误

编辑PHP配置主文件，然后找到 'cgi.fix_pathinfo' 这一行。 这一行内容默认情况下是被注释掉的，默认值为1。取消这一行的注释(删掉这一行最前面的分号)，然后将1改为0.同时需要修改 'date.timezone' 这一PHP设置，再次编辑 PHP 配置文件并将这一选项改成 'date.timezone = US/Central' (或者将等号后内容改为你所在的时区)

```
 vi /etc/php.ini
```
```
 cgi.fix_pathinfo=0
 date.timezone = America/New_York
```

### 5. 修复因为Apache mod_security模块而产生的HTTP错误

如果你在使用 Apache mod_security 模块，这可能也会引起问题。试着禁用这一模块，确认是否因为在 .htaccess 文件中加入如下内容而引起了问题：

```
<IfModule mod_security.c>
SecFilterEngine Off
SecFilterScanPOST Off
</IfModule>
```

### 6.  修复因为有问题的插件/主题而产生的HTTP错误

一些插件或主题也会导致HTTP错误以及其他问题。你可以首先禁用有问题的插件/主题，或暂时禁用所有WordPress插件。如果你有phpMyAdmin，使用它来禁用所有插件：在其中找到 wp_options这一表格，在 option_name 这一列中找到 'active_plugins' 这一行，然后将 option_value 改为 ：a:0:{}


或者用以下命令通过SSH重命名插件所在文件夹：

```
 mv /www/html/path_to_wordpress/wp-content/plugins /www/html/path_to_wordpress/wp-content/plugins.old
```

通常情况下，HTTP错误会被记录在网页服务器的日志文件中，所以寻找错误时一个很好的切入点就是查看服务器日志。


如果你在使用WordPress VPS主机服务的话，你不需要自己去修复WordPress中出现的HTTP错误。你只要让你的Linux管理员来处理它们，他们24小时在线并且会立刻开始着手解决你的问题。



--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/http-error-wordpress/

作者：[rosehosting][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com
[1]:https://www.rosehosting.com/blog/wp-content/uploads/2018/01/http-error-wordpress.jpg
[2]:https://www.rosehosting.com/wordpress-hosting.html
