translating----geekpi

How to Setup IonCube Loaders on Ubuntu 14.04 / 15.04
================================================================================
IonCube Loaders is an encryption/decryption utility for PHP applications which assists in speeding up the pages that are served. It also protects your website's PHP code from being viewed and ran on unlicensed computers. Using ionCube encoded and secured PHP files requires a file called ionCube Loader to be installed on the web server and made available to PHP which is often required for a lot of PHP based applications. It handles the reading and execution of encoded files at run time. PHP can use the loader with one line added to a PHP configuration file that ‘php.ini’.

### Prerequisites ###

In this article we will setup the installation of Ioncube Loader on Ubuntu 14.04/15.04, so that it can be used in all PHP Modes. The only requirement for this tutorial is to have "php.ini" file exists in your system with LEMP stack installed on the server.

### Download IonCube Loader ###

Login to your ubuntu server to download the latest IonCube loader package according to your operating system architecture whether your are using a 32 Bit or 64 Bit OS. You can get its package by issuing the following command with super user privileges or root user.

    # wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz

![download ioncube](http://blog.linoxide.com/wp-content/uploads/2015/09/download1.png)

After Downloading unpack the archive into the "/usr/local/src/" folder by issuing the following command.

    # tar -zxvf ioncube_loaders_lin_x86-64.tar.gz -C /usr/local/src/

![extracting archive](http://blog.linoxide.com/wp-content/uploads/2015/09/2-extract.png)

After extracting the archive, we can see the list of all modules present in it. But we needs only the relevant with the version of PHP installed on our system.

To check your PHP version, you can run the below command to find the relevant modules.

    # php -v

![ioncube modules](http://blog.linoxide.com/wp-content/uploads/2015/09/modules.png)

With reference to the output of above command we came to know that the PHP version installed on the system is 5.6.4, so we need to copy the appropriate module to the PHP modules folder.

To do so we will create a new folder with name "ioncube" within the "/usr/local/" directory and copy the required ioncube loader modules into it.

    root@ubuntu-15:/usr/local/src/ioncube# mkdir /usr/local/ioncube
    root@ubuntu-15:/usr/local/src/ioncube# cp ioncube_loader_lin_5.6.so ioncube_loader_lin_5.6_ts.so /usr/local/ioncube/

### PHP Configuration ###

Now we need to put the following line into the configuration file of PHP file "php.ini" which is located in "/etc/php5/cli/" folder then restart your web server’s services and php module.

    # vim /etc/php5/cli/php.ini

![ioncube zend extension](http://blog.linoxide.com/wp-content/uploads/2015/09/zend-extension.png)

In our scenario we have Nginx web server installed, so we will run the following commands to start its services.

    # service php5-fpm restart
    # service nginx restart

![web services](http://blog.linoxide.com/wp-content/uploads/2015/09/web-services.png)

### Testing IonCube Loader ###

To test the ioncube loader in the PHP configuration for your website, create a test file called "info.php" with the following content and place it into the web directory of your web server.

    # vim /usr/share/nginx/html/info.php

Then save the changes after placing phpinfo script and access "info.php" in your browser with your domain name or server’s IP address after reloading the web server services.

You will be able to see the below section at the bottom of your php modules information.

![php info](http://blog.linoxide.com/wp-content/uploads/2015/09/php-info.png)

From the terminal issue the following command to verify the php version that shows the ionCube PHP Loader is Enabled.

    # php -v

![php ioncube loader](http://blog.linoxide.com/wp-content/uploads/2015/09/php-ioncube.png)

The output shown in the PHP version's command clearly indicated that IonCube loader has been successfully integrated with PHP.

### Conclusion ###

At the end of this tutorial you learnt about the installation and configuration of ionCube Loader on Ubuntu with Nginx web server there will be no such difference if you are using any other web server. So, installing Loaders is simple when its done correctly, and on most servers its installation will work without a problem. However there is no such thing as a "standard PHP installation", and servers can be setup in many different ways, and with different features enabled or disabled.

If you are on a shared server, then make sure that you have run the ioncube-loader-helper.php script, and click the link to test run time installation. If you still face as such issue while doing your setup, feel free to contact us and leave us a comment.

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-ioncube-loaders-ubuntu-14-04-15-04/

作者：[Kashif Siddique][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/
