How to Setup Lighttpd Web server on Ubuntu 15.04 / CentOS 7
=================================================================================

Lighttpd is an open source web server which is secure, fast, compliant, and very flexible and is optimized for high-performance environments. It uses very low memory compared to other web servers , small CPU load and speed optimization making it popular among the server for its efficiency and speed. Its advanced feature-set (FastCGI, CGI, Auth, Output-Compression, URL-Rewriting and many more) makes lighttpd the perfect webserver-software for every server that suffers load problems.

Here are some simple easy setups on how we can setup Lighttpd web server on our machine running Ubuntu 15.04 or CentOS 7 linux distributions.

### Installing Lighttpd

#### Installing using Package Manager

Here, we'll install Lighttpd using package manager as its the easiest method to install it. So, we can simply run the following command under `sudo` mode in a terminal or console to install Lighttpd.

**CentOS 7**

As lighttpd is not available in the official repository of CentOS 7, we'll need to install epel additional repository to our system. To do so, we'll need to run the following `yum` command.

    # yum install epel-release

Then, we'll gonna update our system and proceed towards the installation of lighttpd.

    # yum update
    # yum install lighttpd

![Install Lighttpd Centos](http://blog.linoxide.com/wp-content/uploads/2016/02/install-lighttpd-centos.png)

**Ubuntu 15.04**

Lighttpd is available on the official repository of Ubuntu 15.04 so, we'll simply update our local repository index and then go for the installation of lighttpd using `apt-get` command.

    # apt-get update
    # apt-get install lighttpd

![Install lighttpd ubuntu](http://blog.linoxide.com/wp-content/uploads/2016/02/install-lighttpd-ubuntu.png)

#### Installing from Source

If we wanna install lighttpd from the latest version of source code ie 1.4.39, we'll need to compile the source code and install it into our system. First of all, we'll need to install the dependencies required to compile it.

    # cd /tmp/
    # wget http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-1.4.39.tar.gz

After its downloaded, we'll need to extract it the tarball by running the following.

    # tar -zxvf lighttpd-1.4.39.tar.gz

Then, we'll compile it by running the following commands.

    # cd lighttpd-1.4.39
    # ./configure
    # make

**Note:** In this tutorial, we are installing lighttpd with its standard configuration. If you wanna configure beyond the standard configuration and want to install more features like support for SSL, `mod_rewrite`, `mod_redirect` then you can configure.

Once, its compiled, we'll install it in our system.

    # make install

### Configuring Lighttpd

If we need to configure our lighttpd web server further as our requirements, we can make changes to the default configuration file ie `/etc/lighttpd/lighttpd.conf` . As wee'll go with the default configuration here in this tutorial, we'll not gonna make changes to it. If we had made any changes and we wanna check for errors in the config file, we'll need to run the following command.

    # lighttpd -t -f /etc/lighttpd/lighttpd.conf

#### On CentOS 7

If we are running CentOS 7, we'll need to create a new directory for our webroot defined in our lighttpd's default configuration ie `/src/www/htdocs/` .

    # mkdir -p /srv/www/htdocs/

Then, we'll copy the default welcome page from `/var/www/lighttpd/` directory to the above created directory.

    # cp -r /var/www/lighttpd/* /srv/www/htdocs/

### Starting and Enabling Services

Now, we'll gonna restart our  database server by executing the following `systemctl` command.

    # systemctl start lighttpd

Then, we'll enable it to start automatically in every system boot.

    # systemctl enable lighttpd

### Allowing Firewall

To allow our webpages or websites running lighttpd web server on the internet or inside the same network, we'll need to allow port 80 from the firewall program. As both CentOS 7 and Ubuntu 15.04 are shipped with systemd as the default init system, we will have firewalld installed as a firewall solution. To allow port 80 or http service, we'll need to run the following commands.

    # firewall-cmd --permanent --add-service=http
    success
    # firewall-cmd --reload
    success

### Accessing Web Server

As we have allowed port 80 which is the default port of lighttpd, we should be able to access lighttpd's welcome page by default. To do so, we'll need to point our browser to the ip address or domain of our machine running lighttpd according to our configuration. In this tutorial, we'll point our browser to [http://lighttpd.linoxide.com/](http://lighttpd.linoxide.com/) as we have pointed our sub-domain to its ip address. On doing so, we'll see the following welcome page in our browser.

![Lighttpd Welcome Page](http://blog.linoxide.com/wp-content/uploads/2016/02/lighttpd-welcome-page.png)

Further, we can add our website's files to the webroot directory and remove the default lighttpd's index file to make our static website live to the internet.

If we want to run our PHP application in our lighttpd webserver, we'll need to follow the following steps.

### Installing PHP5 Modules

Once our lighttpd is installed successfully, we'll need to install PHP and some PHP modules to run PHP5 scripts in our lighttpd web server.

#### On Ubuntu 15.04

    # apt-get install php5 php5-cgi php5-fpm php5-mysql php5-curl php5-gd php5-intl php5-imagick php5-mcrypt php5-memcache php-pear

#### On CentOS 7

    # yum install php php-cgi php-fpm php-mysql php-curl php-gd php-intl php-pecl-imagick php-mcrypt php-memcache php-pear lighttpd-fastcgi

### Configuring Lighttpd with PHP

To make PHP work with lighttpd web server, we'll need to follow the following methods respect to the distribution we are running.

#### On CentOS 7

First of all, we'll need to edit our php configuration ie `/etc/php.ini` and uncomment a line **cgi.fix_pathinfo=1** using a text editor.

    # nano /etc/php.ini

After its done, we'll need to change the ownership of PHP-FPM process from apache to lighttpd. To do so, we'll need to open the configuration file `/etc/php-fpm.d/www.conf` using a text editor.

    # nano /etc/php-fpm.d/www.conf

Then, we'll append the file with the following configurations.

    user = lighttpd
    group = lighttpd

Once done, we'll need to save the file and exit the text editor. Then, we'll need to include fastcgi module from `/etc/lighttpd/modules.conf` configuration file.

    # nano /etc/lighttpd/modules.conf

Then, we'll need to uncomment the following line by removing `#` from it.

    include "conf.d/fastcgi.conf"

At last, we'll need to configure our fastcgi configuration file using our favorite text editor.

    # nano /etc/lighttpd/conf.d/fastcgi.conf

Then, we'll need to add the following lines at the end of the file.

    fastcgi.server += ( ".php" =>
    ((
    "host" => "127.0.0.1",
    "port" => "9000",
    "broken-scriptfilename" => "enable"
    ))
    )

After its done, we'll save the file and exit the text editor.

#### On Ubuntu 15.04

To enable fastcgi with lighttpd web server, we'll simply need to execute the following commands.

    # lighttpd-enable-mod fastcgi

    Enabling fastcgi: ok
    Run /etc/init.d/lighttpd force-reload to enable changes

    # lighttpd-enable-mod fastcgi-php

    Enabling fastcgi-php: ok
    Run `/etc/init.d/lighttpd` force-reload to enable changes

Then, we'll reload our lighttpd by running the following command.

    # systemctl force-reload lighttpd

### Testing if PHP is working

In order to see if PHP is working as expected or not, we'll need to create a new php file under the webroot of our lighttpd web server. Here, in this tutorial we have `/var/www/html` in Ubuntu and `/srv/www/htdocs` in CentOS as the default webroot so, we'll create a info.php file under it using a text editor.

**On CentOS 7**

    # nano  /var/www/info.php

**On Ubuntu 15.04**

    # nano /srv/www/htdocs/info.php

Then, we'll simply add the following line into the file.

    <?php phpinfo(); ?>

Once done, we'll simply save the file and exit from the text editor.

Now, we'll point our web browser to our machine running lighttpd using its ip address or domain name with the info.php file path as [http://lighttpd.linoxide.com/info.php](http://lighttpd.linoxide.com/info.php) If everything was done as described above, we will see our PHP information page as shown below.

![phpinfo lighttpd](http://blog.linoxide.com/wp-content/uploads/2016/02/phpinfo-lighttpd.png)

### Conclusion

Finally we have successfully installed the world's lightweight, fast and secure web server Lighttpd in our machine running CentOS 7 and Ubuntu 15.04 linux distributions. Once its ready, we can upload our website files into our web root, configure virtual host, enable ssl, connect database, run web apps and much more with our lighttpd web server. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you ! Enjoy :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-lighttpd-web-server-ubuntu-15-04-centos-7/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
