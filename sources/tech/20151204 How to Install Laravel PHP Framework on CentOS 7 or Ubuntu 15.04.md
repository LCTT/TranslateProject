How to Install Laravel PHP Framework on CentOS 7 / Ubuntu 15.04
================================================================================
Hi All, In this article we are going to setup Laravel on CentOS 7 and Ubuntu 15.04. If you are a PHP web developer then you don't need to worry about of all modern PHP frameworks, Laravel is the easiest to get up and running that saves your time and effort and makes web development a joy. Laravel embraces a general development philosophy that sets a high priority on creating maintainable code by following some simple guidelines, you should be able to keep a rapid pace of development and be free to change your code with little fear of breaking existing functionality.

Laravel's PHP framework installation is not a big deal. You can simply follow the step by step guide in this article for your CentOS 7 or Ubuntu 15 server.

### 1) Server Requirements ###

Laravel depends upon a number of prerequisites that must be setup before installing it. Those prerequisites includes some basic tuning parameter of server like your system update, sudo rights and installation of required packages.

Once you are connected to your server make sure to configure the fully qualified domain name then run the commands below to enable EPEL Repo and update your server.

#### CentOS-7 ####

    # yum install epel-release

----------

    # rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    # rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

----------

    # yum update

#### Ubuntu ####

    # apt-get install python-software-properties
    # add-apt-repository ppa:ondrej/php5

----------

    # apt-get update

----------

    # apt-get install -y php5 mcrypt php5-mcrypt php5-gd

### 2) Firewall Setup ###

System Firewall and SELinux setup is an important part regarding the security of your applications in production. You can make firewall off if you are working on test server and keep SELinux to permissive mode using the below command, so that you installing setup won't be affected by it.

    # setenforce 0

### 3) Apache, MariaDB, PHP Setup ###

Laravel installation requires a complete LAMP stack with OpenSSL, PDO, Mbstring and Tokenizer PHP Extensions. If you are already running LAMP server then you can skip this step to move on and just make sure that the required PHP extensions are installed.

To install AMP stack you can use the below commands on your respective server.

#### CentOS ####

    # yum install httpd mariadb-server php56w php56w-mysql php56w-mcrypt php56w-dom php56w-mbstring

To start and enable Apache web and MySQL/Mariadb services at bootup on CentOS 7 , we will use below commands.

    # systemctl start httpd
    # systemctl enable httpd

----------

    #systemctl start mysqld
    #systemctl enable mysqld

After starting MariaDB service, we will configure its secured password with below command.

    #mysql_secure_installation

#### Ubuntu ####

    # apt-get install mysql-server apache2 libapache2-mod-php5 php5-mysql

### 4) Install Composer ###

Now we are going to install composer that is one of the most important requirement before starting the Laravel installation that helps in installing Laravel's dependencies.

#### CentOS/Ubuntu ####

Run the below commands to setup 'composer' in CentOS/Ubuntu.

    # curl -sS https://getcomposer.org/installer | php
    # mv composer.phar /usr/local/bin/composer
    # chmod +x /usr/local/bin/composer

![composer installation](http://blog.linoxide.com/wp-content/uploads/2015/11/14.png)

### 5) Installing Laravel ###

Laravel's installation package can be downloaded from github using the command below.

# wget https://github.com/laravel/laravel/archive/develop.zip

To extract the archived package and move into the document root directory use below commands.

    # unzip develop.zip

----------

    # mv laravel-develop /var/www/

Now use the following compose command that will install all required dependencies for Laravel within its directory.

    # cd /var/www/laravel-develop/
    # composer install

![compose laravel](http://blog.linoxide.com/wp-content/uploads/2015/11/25.png)

### 6) Key Encryption ###

For encrypter service, we will be generating a 32 digit encryption key using the command below.

    # php artisan key:generate

    Application key [Lf54qK56s3qDh0ywgf9JdRxO2N0oV9qI] set successfully

Now put this key into the 'app.php' file as shown below.

    # vim /var/www/laravel-develop/config/app.php

![Key encryption](http://blog.linoxide.com/wp-content/uploads/2015/11/45.png)

### 7) Virtua Host and Ownership ###

After composer installation assign the permissions and apache user ownership to the document root directory as shown.

    # chmod 775 /var/www/laravel-develop/app/storage

----------

    # chown -R apache:apache /var/www/laravel-develop

Open the default configuration file of apache web server using any editor to add the following lines at the end file for new virtual host entry.

    # vim /etc/httpd/conf/httpd.conf

----------

    ServerName laravel-develop
    DocumentRoot /var/www/laravel/public

    start Directory /var/www/laravel
    AllowOverride All
    Directory close

Now the time is to restart apache web server services as shown below and then open your web browser to check your localhost page.

#### CentOS ####

    # systemctl restart httpd

#### Ubuntu ####

    # service apache2 restart

### 8) Laravel 5 Web Access ###

Open your web browser and give your server IP or Fully Qualified Domain name and you will see the default web page of Laravel 5 frame work.

![Laravel Default](http://blog.linoxide.com/wp-content/uploads/2015/11/35.png)

### Conclusion ###

Laravel Framework is a great tool to develop your web applications. So, at the end of this article you have learned its installation setup on Ubuntu 15 and CentOS 7 , Now start using this awesome PHP framework that provides you a lot of more features and comfort in your development work. Feel free to comment us back for your valuable suggestions an feedback to guide you in more specific and easiest way.

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-laravel-php-centos-7-ubuntu-15-04/

作者：[Kashif][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/kashifs/