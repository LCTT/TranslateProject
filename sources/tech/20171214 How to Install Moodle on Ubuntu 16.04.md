How to Install Moodle on Ubuntu 16.04
======
![How to Install Moodle on Ubuntu 16.04][1]

Step-by-step Installation Guide on how to Install Moodle on Ubuntu 16.04. Moodle (acronym of Modular-object-oriented dynamic learning environment') is a free and open source learning management system built to provide teachers, students and administrators single personalized learning environment. Moodle is built by the Moodle project which is led and coordinated by [Moodle HQ][2]

,

**Moodle comes with a lot of useful features such as:**

  * Modern and easy to use interface
  * Personalised Dashboard
  * Collaborative tools and activities
  * All-in-one calendar
  * Simple text editor
  * Track progress
  * Notifications
  * and many more…



In this tutorial we will guide you through the steps of installing the latest version of Moodle on an Ubuntu 16.04 VPS with Apache web server, MySQL and PHP 7.

### 1. Login via SSH

First of all, login to your Ubuntu 16.04 VPS via SSH as user root

### 2. Update the OS Packages

Run the following command to update the OS packages and install some dependencies
```
apt-get update && apt-get upgrade
apt-get install git-core graphviz aspell
```

### 3. Install Apache Web Server

Install Apache web server from the Ubuntu repository
```
apt-get install apache2
```

### 4. Start Apache Web Server

Once it is installed, start Apache and enable it to start automatically upon system boot
```
systemctl enable apache2
```

### 5. Install PHP 7

Next, we will install PHP 7 and some additional PHP modules required by Moodle
```
apt-get install php7.0 libapache2-mod-php7.0 php7.0-pspell php7.0-curl php7.0-gd php7.0-intl php7.0-mysql php7.0-xml php7.0-xmlrpc php7.0-ldap php7.0-zip
```

### 6. Install and Configure MySQL Database Server

Moodle stores most of its data in a database, so we will install MySQL database server
```
apt-get install mysql-client mysql-server
```

After the installation, run the `mysql_secure_installation` script to set your MySQL root password and secure your MySQL installation.

Login to the MySQL server as user root and create a user and database for the Moodle installation
```
mysql -u root -p
mysql> CREATE DATABASE moodle;
mysql> GRANT ALL PRIVILEGES ON moodle.* TO 'moodleuser'@'localhost' IDENTIFIED BY 'PASSWORD';
mysql> FLUSH PRIVILEGES;
mysql> \q
```

Don't forget to replace 'PASSWORD' with an actual strong password.

### 7. Get Moodle from GitHub repository

Next, change the current working directory and clone Moodle from their official GitHub repository
```
cd /var/www/html/
git clone https://github.com/moodle/moodle.git
```

Go to the '/moodle' directory and check all available branches
```
cd moodle/
git branch -a
```

Select the latest stable version (currently it is MOODLE_34_STABLE) and run the following command to tell git which branch to track or use
```
git branch --track MOODLE_34_STABLE origin/MOODLE_34_STABLE
```

and checkout the specified version
```
git checkout MOODLE_34_STABLE

Switched to branch 'MOODLE_34_STABLE'
Your branch is up-to-date with 'origin/MOODLE_34_STABLE'.
```

Create a directory for the Moodle data
```
mkdir /var/moodledata
```

Set the correct ownership and permissions
```
chown -R www-data:www-data /var/www/html/moodle
chown www-data:www-data /var/moodledata
```

### 8. Configure Apache Web Server

Create Apache virtual host for your domain name with the following content
```
nano /etc/apache2/sites-available/yourdomain.com.conf

 	ServerAdmin admin@yourdomain.com
 	DocumentRoot /var/www/html/moodle
 	ServerName yourdomain.com
 	ServerAlias www.yourdomain.com

	Options Indexes FollowSymLinks MultiViews
	AllowOverride All
	Order allow,deny
	allow from all

 	ErrorLog /var/log/httpd/yourdomain.com-error_log
 	CustomLog /var/log/httpd/yourdomain.com-access_log common

```

save the file and enable the virtual host
```
a2ensite yourdomain.com

Enabling site yourdomain.com.
To activate the new configuration, you need to run:
 service apache2 reload
```

Finally, reload the web server as suggested, for the changes to take effect
```
service apache2 reload
```

### 9. Follow the on-screen instructions and complete the installation

Now, go to `http://yourdomain.com` and follow the on-screen instructions to complete the Moodle installation. For more information on how to configure and use Moodle, you can check their [official documentation][4].

You don't have to install Moodle on Ubuntu 16.04, if you use one of our [optimized Moodle hosting][5], in which case you can simply ask our expert Linux admins to install and configure the latest version of Moodle on Ubuntu 16.04 for you. They are available 24×7 and will take care of your request immediately.

**PS.** If you liked this post on how to install Moodle on Ubuntu 16.04, please share it with your friends on the social networks using the buttons on the left or simply leave a reply below. Thanks.

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/how-to-install-moodle-on-ubuntu-16-04/

作者：[RoseHosting][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.rosehosting.com
[1]:https://www.rosehosting.com/blog/wp-content/uploads/2017/12/How-to-Install-Moodle-on-Ubuntu-16.04.jpg
[2]:https://moodle.com/hq
[3]:https://www.rosehosting.com/cdn-cgi/l/email-protection
[4]:https://docs.moodle.org/34/en/Main_page
[5]:https://www.rosehosting.com/moodle-hosting.html
