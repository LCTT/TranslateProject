没人领我就继续做吧
Setup Apache 2.4 and Php FPM with mod proxy fcgi on Ubuntu 13.10
================================================================================
### mod_proxy_fcgi ###

The module mod_proxy_fcgi is a new one and it allows apache to connect to/forward requests to an external fastcgi process manager like php fpm. This allows for a complete separation between the running of php scripts and Apache. Earlier we had to use modules like mod_fcgid and mod_fastcgi which all had some limitations. Mod_fcgid for example did not properly utilise the process management capability of php-cgi whereas mod_fastcgi is a third party module.

With the arrival of mod_proxy_fcgi Apache finally gets the ability to neatly talk to external fastcgi process managers making it more efficient at the task. Delegating php requests to external fpm servers greatly reduces the load on web servers like apache resulting into efficient utilisation of machine resources and faster processing speed for users on the other end. Along with all that, php fpm can run opcode caching engines like apc in a very stable manner.

So in this post, our task is to setup apache + php-fpm using the mod_proxy_fcgi connector.

### 1. Setup Apache ###

Ubuntu 13.10 already ships with apache 2.4 so all installables are in the repository itself.

Install Apache if not already done

    $ sudo apt-get install apache2

Enable mod_proxy_fcgi

    $ sudo a2enmod proxy_fcgi
    Considering dependency proxy for proxy_fcgi:
    Enabling module proxy.
    Enabling module proxy_fcgi.
    To activate the new configuration, you need to run:
      service apache2 restart

Restart Apache

    $ sudo service apache2 restart

### Configure virtual host ###

Next task is to configure a vhost to use mod fcgi proxy to communicate with fpm. The vhost configuration files are stored in the following location

    /etc/apache2/sites-available

Get inside there any create your new vhost configuration file by copying the 000-default.conf file which comes with apache.

    $ cd /etc/apache2/sites-available
    $ sudo cp 000-default.conf mysite.conf
    $ sudo nano mysite.conf

Now its time to configure the virtualhost. Here is how I configured the file

> <VirtualHost *:80>
> 	# The ServerName directive sets the request scheme, hostname and port that
> 	# the server uses to identify itself. This is used when creating
> 	# redirection URLs. In the context of virtual hosts, the ServerName
> 	# specifies what hostname must appear in the request's Host: header to
> 	# match this virtual host. For the default virtual host (this file) this
> 	# value is not decisive as it is used as a last resort host regardless.
> 	# However, you must set it for any further virtual host explicitly.
> 
> 	ServerName fpm.localhost
> 
> 	ServerAdmin webmaster@localhost
> 	DocumentRoot /var/www/mysite
> 
> 	# Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
> 	# error, crit, alert, emerg.
> 	# It is also possible to configure the loglevel for particular
> 	# modules, e.g.
> 	#LogLevel info ssl:warn
> 
> 	ErrorLog ${APACHE_LOG_DIR}/error.log
> 	CustomLog ${APACHE_LOG_DIR}/access.log combined
> 
> 	# For most configuration files from conf-available/, which are
> 	# enabled or disabled at a global level, it is possible to
> 	# include a line for only one particular virtual host. For example the
> 	# following line enables the CGI configuration for this host only
> 	# after it has been globally disabled with "a2disconf".
> 	#Include conf-available/serve-cgi-bin.conf
> 
> 	ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/var/www/mysite/$1
> 	
> 	<Directory "/var/www/mysite">
> 		Order allow,deny
> 		Allow from all
> 		AllowOverride FileInfo All
> 		# New directive needed in Apache 2.4.3:
> 		Require all granted
> 	</Directory>
> 
> </VirtualHost>

The important things to note are :

1. **ServerName** - This is the domain or the subdomain of your vhost. In this example I used fpm.localhost so that when using that sub domain on localhost, php fpm is used. Its just an example.

2. **DocumentRoot** - This is the root of this vhost from where the web files shall be served.

3. **ProxyPassMatch** - This is the directive that tells forward all requests for ".php" files to fcgi server at 127.0.0.1:9000. This is where our php fpm process manager would be running. More on this in the next section.
The fcgi url must contain the exact path to the document root. Otherwise it would say "File Not Found" when requesting for files.

> ProxyPassMatch ^/(.*\.php(/.*)?)$ fcgi://127.0.0.1:9000/var/www/mysite/$1

The first parameter is the pattern to match. So all urls that have a ".php" in them followed by an option slash and anything else are matched and the matched part is forwarded to the fcgi server running at 127.0.0.1:9000.

4. **Require all granted** - After the ProxyPassMatch line we added a section with Require and AllowOverride directives. It is necessary as of Apache 2.4

Save the file and enable it using the a2ensite command which saves the effort to create the symlink in sites-enabled directory.

    $ sudo a2ensite mysite
    Enabling site mysite.
    To activate the new configuration, you need to run:
      service apache2 reload

Now reload apache configuration

    $ sudo service apache2 reload
    * Reloading web server apache2

That completes the apache configuration. The other half of the task is to configure php fpm so that it can finally work.

### 2. Setup Php-FPM ###

Next thing is to setup php fpm. Install it via synaptic, if not already done so.

    $ sudo apt-get install php5-fpm

The configuration files for fpm are located at

> /etc/php5/fpm

    /etc/php5/fpm$ ls
    conf.d  php-fpm.conf  php.ini  pool.d

The pool.d directory contains the configuration file for each fpm pool and php-fpm.conf is the main configuration file. Our only work is to configure a fpm pool that is to be used with apache or the specific virtual host.

The configuration file for a pool is quite large and there are many parameters that can be configured. But in this post we shall be talking about only the important fields that need be set to get fpm up and running

> ; Start a new pool named 'www'.
> ; the variable $pool can we used in any directive and will be replaced by the
> ; pool name ('www' here)
> [www]
> 
> ; Per pool prefix
> ; It only applies on the following directives:
> ; - 'slowlog'
> ; - 'listen' (unixsocket)
> ; - 'chroot'
> ; - 'chdir'
> ; - 'php_values'
> ; - 'php_admin_values'
> ; When not set, the global prefix (or /usr) applies instead.
> ; Note: This directive can also be relative to the global prefix.
> ; Default Value: none
> ;prefix = /path/to/pools/$pool
> 
> ; Unix user/group of processes
> ; Note: The user is mandatory. If the group is not set, the default user's group
> ;       will be used.
> user = enlightened
> group = enlightened
> 
> ; The address on which to accept FastCGI requests.
> ; Valid syntaxes are:
> ;   'ip.add.re.ss:port'    - to listen on a TCP socket to a specific address on
> ;                            a specific port;
> ;   'port'                 - to listen on a TCP socket to all addresses on a
> ;                            specific port;
> ;   '/path/to/unix/socket' - to listen on a unix socket.
> ; Note: This value is mandatory.
> listen = 127.0.0.1:9000
> 
> ; Set listen(2) backlog.
> ; Default Value: 128 (-1 on FreeBSD and OpenBSD)
> ;listen.backlog = 128

Create a new configuration file by copying the www.conf file. And edit the fields as explained next.

1. The first options is the name of the pool. We named it 'www' over here. Name it to anything you like or after the domain name it is going to be used with. 'yoursite' for example. That way it would be easier to remember.

2. Setup the user and group that this pool will run with. When you are setting up multiple sites/domains/virtualhosts on a server, you would always want to setup separate user accounts and corresponding pool for each of those. This is an essential security measure, so that every pool has privileges of its own user only.

3. Setup the listening socket. This is the socket on which the master fpm process shall listen for incoming requests. This can be a unix socket or a tcp socket. However [mod_proxy_fcgi does not yet support unix sockets][1], so we are limited to tcp sockets.
Over here its port number 9000 on localhost.

Now restart fpm

    $ sudo service php5-fpm restart

Now the new fpm pool should take effect. You can see the new pool process in htop for example.

### 3. Test the setup ###

Now that both apache and php fpm are configured and setup, its time to test. Get inside the document root directory and create a php file containing a call to phpinfo() function and open it in your browser.
The "Server API" should be reported as "FPM/FastCGI".

Now that apache and php are setup, you may want to install other things like APC, mariadb database, phpmyadmin etc. Move around this site to find how-to guides on those.

### Resources ###

Check out the following links to learn more
[https://wiki.apache.org/httpd/PHP-FPM][2]

--------------------------------------------------------------------------------

via: http://www.binarytides.com/setup-apache-php-fpm-mod-proxy-fcgi-ubuntu/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://issues.apache.org/bugzilla/show_bug.cgi?id=54101
[2]:https://wiki.apache.org/httpd/PHP-FPM
