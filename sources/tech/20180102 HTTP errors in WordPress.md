HTTP errors in WordPress
======
![http error wordpress][1]

We'll show you, how to fix HTTP errors in WordPress, on a Linux VPS. Listed below are the most common HTTP errors in WordPress, experienced by WordPress users, and our suggestions on how to investigate and fix them.

### 1\. Fix HTTP error in WordPress when uploading images

If you get an error when uploading an image to your WordPress based site, it may be due to PHP configuration settings on your server, like insufficient memory limit or so.

Locate the php configuration file using the following command:
```
#php -i | grep php.ini
Configuration File (php.ini) Path => /etc
Loaded Configuration File => /etc/php.ini
```

According to the output, the PHP configuration file is located in the '/etc' directory, so edit the '/etc/php.ini' file, find the lines below and modify them with these values:
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

Of course if you are unfamiliar with the vi text editor, use your favorite one.

Do not forget to restart your web server for the changes to take effect.

If the web server installed on your server is Apache, you may use .htaccess. First, locate the .htaccess file. It should be in the document root directory of the WordPress installation. If there is no .htaccess file, create one, then add the following content:
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

If you are using nginx, configure the nginx server block about your WordPress instance. It should look something like the example below:
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

Depending on the PHP configuration, you may need to replace 'fastcgi_pass 127.0.0.1:9000;' with 'fastcgi_pass unix:/var/run/php7-fpm.sock;' or so.

Restart nginx service for the changes to take effect.

### 2\. Fix HTTP error in WordPress due to incorrect file permissions

If you get an unexpected HTTP error in WordPress, it may be due to incorrect file permissions, so set a proper ownership of your WordPress files and directories:
```
chown www-data:www-data -R /var/www/html/path_to_wordpress/
```

Replace 'www-data' with the actual web server user, and '/var/www/html/path_to_wordpress' with the actual path of the WordPress installation.

### 3\. Fix HTTP error in WordPress due to memory limit

The PHP memory_limit value can be set by adding this to your wp-config.php file:
```
 define('WP_MEMORY_LIMIT', '128MB');
```

### 4\. Fix HTTP error in WordPress due to misconfiguration of PHP.INI

Edit the main PHP configuration file and locate the line with the content 'cgi.fix_pathinfo' . This will be commented by default and set to 1. Uncomment the line (remove the semi-colon) and change the value from 1 to 0. You may also want to change the 'date.timezone' PHP setting, so edit the PHP configuration file and modify this setting to 'date.timezone = US/Central' (or whatever your timezone is).
```
 vi /etc/php.ini
```
```
 cgi.fix_pathinfo=0
 date.timezone = America/New_York
```

### 5. Fix HTTP error in WordPress due to Apache mod_security modul

If you are using the Apache mod_security module, it might be causing problems. Try to disable it to see if that is the problem by adding the following lines in .htaccess:
```
<IfModule mod_security.c>
SecFilterEngine Off
SecFilterScanPOST Off
</IfModule>
```

### 6. Fix HTTP error in WordPress due to problematic plugin or theme

Some plugins and/or themes may cause HTTP errors and other problems in WordPress. You can try to disable the problematic plugins/themes, or temporarily disable all the plugins. If you have phpMyAdmin, use it to deactivate all plugins:
Locate the table wp_options, under the option_name column (field) find the 'active_plugins' row and change the option_value field to: a:0:{}

Or, temporarily rename your plugins directory via SSH using the following command:
```
 mv /www/html/path_to_wordpress/wp-content/plugins /www/html/path_to_wordpress/wp-content/plugins.old
```

In general, HTTP errors are logged in the web server log files, so a good starting point is to check the web server error log on your server.

You don't have to Fix HTTP errors in WordPress, if you use one of our [WordPress VPS Hosting][2] services, in which case you can simply ask our expert Linux admins to **fix HTTP errors in WordPress** for you. They are available 24 ×7 and will take care of your request immediately.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/http-error-wordpress/

作者：[rosehosting][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com
[1]:https://www.rosehosting.com/blog/wp-content/uploads/2018/01/http-error-wordpress.jpg
[2]:https://www.rosehosting.com/wordpress-hosting.html
