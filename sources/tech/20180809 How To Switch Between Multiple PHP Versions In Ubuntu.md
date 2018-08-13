translating---geekpi

How To Switch Between Multiple PHP Versions In Ubuntu
======

![](https://www.ostechnix.com/wp-content/uploads/2018/08/php-720x340.png)

Sometimes, the most recent version of an installed package might not work as you expected. Your application may not compatible with the updated package and support only a specific old version of package. In such cases, you can simply downgrade the problematic package to its earlier working version in no time. Refer our old guides on how to downgrade a package in Ubuntu and its variants [**here**][1] and how to downgrade a package in Arch Linux and its derivatives [**here**][2]. However, you need not to downgrade some packages. We can use multiple versions at the same time. For instance, let us say you are testing a PHP application in [**LAMP stack**][3] deployed in Ubuntu 18.04 LTS. After a while you find out that the application worked fine in PHP5.6, but not in PHP 7.2 (Ubuntu 18.04 LTS installs PHP 7.x by default). Are you going to reinstall PHP or the whole LAMP stack again? Not necessary, though. You don’t even have to downgrade the PHP to its earlier version. In this brief tutorial, I will show you how to switch between multiple PHP versions in Ubuntu 18.04 LTS. It’s not that difficult as you may think. Read on.

### Switch Between Multiple PHP Versions

To check the default installed version of PHP, run:
```
$ php -v
PHP 7.2.7-0ubuntu0.18.04.2 (cli) (built: Jul 4 2018 16:55:24) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.2.0, Copyright (c) 1998-2018 Zend Technologies
with Zend OPcache v7.2.7-0ubuntu0.18.04.2, Copyright (c) 1999-2018, by Zend Technologies

```

As you can see, the installed version of PHP is 7.2.7. After testing your application for couple days, you find out that your application doesn’t support PHP7.2. In such cases, it is a good idea to have both PHP5.x version and PHP7.x version, so that you can easily switch between to/from any supported version at any time.

You don’t need to remove PHP7.x or reinstall LAMP stack. You can use both PHP5.x and 7.x versions together.

I assume you didn’t uninstall php5.6 in your system yet. Just in case, you removed it already, you can install it again using a PPA like below.

You can install PHP5.6 from a PPA:
```
$ sudo add-apt-repository -y ppa:ondrej/php
$ sudo apt update
$ sudo apt install php5.6

```

#### Switch from PHP7.x to PHP5.x

First disable PHP7.2 module using command:
```
$ sudo a2dismod php7.2
Module php7.2 disabled.
To activate the new configuration, you need to run:
systemctl restart apache2

```

Next, enable PHP5.6 module:
```
$ sudo a2enmod php5.6

```

Set PHP5.6 as default version:
```
$ sudo update-alternatives --set php /usr/bin/php5.6

```

Alternatively, you can run the following command to to set which system wide version of PHP you want to use by default.
```
$ sudo update-alternatives --config php

```

Enter the selection number to set it as default version or simply press ENTER to keep the current choice.

In case, you have installed other PHP extensions, set them as default as well.
```
$ sudo update-alternatives --set phar /usr/bin/phar5.6

```

Finally, restart your Apache web server:
```
$ sudo systemctl restart apache2

```

Now, check if PHP5.6 is the default version or not:
```
$ php -v
PHP 5.6.37-1+ubuntu18.04.1+deb.sury.org+1 (cli)
Copyright (c) 1997-2016 The PHP Group
Zend Engine v2.6.0, Copyright (c) 1998-2016 Zend Technologies
with Zend OPcache v7.0.6-dev, Copyright (c) 1999-2016, by Zend Technologies

```

#### Switch from PHP5.x to PHP7.x

Likewise, you can switch from PHP5.x to PHP7.x version as shown below.
```
$ sudo a2enmod php7.2

$ sudo a2dismod php5.6

$ sudo update-alternatives --set php /usr/bin/php7.2

$ sudo systemctl restart apache2

```

**A word of caution:**

The final stable PHP5.6 version has reached the [**end of active support**][4] as of 19 Jan 2017. However, PHP 5.6 will continue to receive support for critical security issues until 31 Dec 2018. So, It is recommended to upgrade all your PHP applications to be compatible with PHP7.x as soon as possible.

If you want prevent PHP to be automatically upgraded in future, refer the following guide.

And, that’s all for now. Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-switch-between-multiple-php-versions-in-ubuntu/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/how-to-downgrade-a-package-in-ubuntu/
[2]:https://www.ostechnix.com/downgrade-package-arch-linux/
[3]:https://www.ostechnix.com/install-apache-mariadb-php-lamp-stack-ubuntu-16-04/
[4]:http://php.net/supported-versions.php
