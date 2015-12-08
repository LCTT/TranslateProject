How to Install Revive Adserver on Ubuntu 15.04 / CentOS 7
================================================================================
Revive AdserverHow to Install Revive Adserver on Ubuntu 15.04 / CentOS 7 is a free and open source advertisement management system that enables publishers, ad networks and advertisers to serve ads on websites, apps, videos and manage campaigns for multiple advertiser with many features. Revive Adserver is licensed under GNU Public License which is also known as OpenX Source. It features an integrated banner management interface, URL targeting, geo-targeting and tracking system for gathering statistics. This application enables website owners to manage banners from both in-house advertisement campaigns as well as from paid or third-party sources, such as Google's AdSense. Here, in this tutorial, we'll gonna install Revive Adserver in our machine running Ubuntu 15.04 or CentOS 7.

### 1. Installing LAMP Stack ###

First of all, as Revive Adserver requires a complete LAMP Stack to work, we'll gonna install it. LAMP Stack is the combination of Apache Web Server, MySQL/MariaDB Database Server and PHP modules. To run Revive properly, we'll need to install some PHP modules like apc, zlib, xml, pcre, mysql and mbstring. To setup LAMP Stack, we'll need to run the following command with respect to the distribution of linux we are currently running.

#### On Ubuntu 15.04 ####

    # apt-get install apache2 mariadb-server php5 php5-gd php5-mysql php5-curl php-apc zlibc zlib1g zlib1g-dev libpcre3 libpcre3-dev libapache2-mod-php5 zip

#### On CentOS 7 ####

    # yum install httpd mariadb php php-gd php-mysql php-curl php-mbstring php-xml php-apc zlibc zlib1g zlib1g-dev libpcre3 libpcre3-dev zip

### 2. Starting Apache and MariaDB server ###

We’ll now start our newly installed Apache web server and MariaDB database server in our linux machine. To do so, we'll need to execute the following commands.

#### On Ubuntu 15.04 ####

Ubuntu 15.04 is shipped with Systemd as its default init system, so we'll need to execute the following commands to start apache and mariadb daemons.

    # systemctl start apache2 mysql

After its started, we'll now make it able to start automatically in every system boot by running the following command.

    # systemctl enable apache2 mysql

    Synchronizing state for apache2.service with sysvinit using update-rc.d...
    Executing /usr/sbin/update-rc.d apache2 defaults
    Executing /usr/sbin/update-rc.d apache2 enable
    Synchronizing state for mysql.service with sysvinit using update-rc.d...
    Executing /usr/sbin/update-rc.d mysql defaults
    Executing /usr/sbin/update-rc.d mysql enable

#### On CentOS 7 ####

Also in CentOS 7, systemd is the default init system so, we'll run the following command to start them.

    # systemctl start httpd mariadb

Next, we'll enable them to start automatically in every startup of init system using the following command.

    # systemctl enable httpd mariadb

    ln -s '/usr/lib/systemd/system/httpd.service' '/etc/systemd/system/multi-user.target.wants/httpd.service'
    ln -s '/usr/lib/systemd/system/mariadb.service' '/etc/systemd/system/multi-user.target.wants/mariadb.service'

### 3. Configuring MariaDB ###

#### On CentOS 7/Ubuntu 15.04 ####

Now, as we are starting MariaDB for the first time and no password has been assigned for MariaDB so, we’ll first need to configure a root password for it. Then, we’ll gonna create a new database so that it can store data for our Revive Adserver installation.

To configure MariaDB and assign a root password, we’ll need to run the following command.

    # mysql_secure_installation

This will ask us to enter the password for root but as we haven’t set any password before and its our first time we’ve installed mariadb, we’ll simply press enter and go further. Then, we’ll be asked to set root password, here we’ll hit Y and enter our password for root of MariaDB. Then, we’ll simply hit enter to set the default values for the further configurations.

    ….
    so you should just press enter here.

    Enter current password for root (enter for none):
    OK, successfully used password, moving on…

    Setting the root password ensures that nobody can log into the MariaDB
    root user without the proper authorisation.

    Set root password? [Y/n] y
    New password:
    Re-enter new password:
    Password updated successfully!
    Reloading privilege tables..
    … Success!
    …
    installation should now be secure.
    Thanks for using MariaDB!

![Configuring MariaDB](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-mariadb.png)

### 4. Creating new Database ###

After we have assigned the password to our root user of mariadb server, we'll now create a new database for Revive Adserver application so that it can store its data into the database server. To do so, first we'll need to login to our MariaDB console by running the following command.

    # mysql -u root -p

Then, it will ask us to enter the password of root user which we had just set in the above step. Then, we'll be welcomed into the MariaDB console in which we'll create our new database, database user and assign its password and grant all privileges to create, remove and edit the tables and data stored in it.

    > CREATE DATABASE revivedb;
    > CREATE USER 'reviveuser'@'localhost' IDENTIFIED BY 'Pa$$worD123';
    > GRANT ALL PRIVILEGES ON revivedb.* TO 'reviveuser'@'localhost';
    > FLUSH PRIVILEGES;
    > EXIT;

![Creating Mariadb Revive Database](http://blog.linoxide.com/wp-content/uploads/2015/11/creating-mariadb-revive-database.png)

### 5. Downloading Revive Adserver Package ###

Next, we'll download the latest release of Revive Adserver ie version 3.2.2 in the time of writing this article. So, we'll first get the download link from the official Download Page of Revive Adserver ie [http://www.revive-adserver.com/download/][1] then we'll download the compressed zip file using wget command under /tmp/ directory as shown bellow.

    # cd /tmp/
    # wget http://download.revive-adserver.com/revive-adserver-3.2.2.zip

    --2015-11-09 17:03:48-- http://download.revive-adserver.com/revive-adserver-3.2.2.zip
    Resolving download.revive-adserver.com (download.revive-adserver.com)... 54.230.119.219, 54.239.132.177, 54.230.116.214, ...
    Connecting to download.revive-adserver.com (download.revive-adserver.com)|54.230.119.219|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 11663620 (11M) [application/zip]
    Saving to: 'revive-adserver-3.2.2.zip'
    revive-adserver-3.2 100%[=====================>] 11.12M 1.80MB/s in 13s
    2015-11-09 17:04:02 (906 KB/s) - 'revive-adserver-3.2.2.zip' saved [11663620/11663620]

After the file is downloaded, we'll simply extract its files and directories using unzip command.

    # unzip revive-adserver-3.2.2.zip

Then, we'll gonna move the entire Revive directories including every files from /tmp to the default webroot of Apache Web Server ie /var/www/html/ directory.

    # mv revive-adserver-3.2.2 /var/www/html/reviveads

### 6. Configuring Apache Web Server ###

We'll now configure our Apache Server so that revive will run with proper configuration. To do so, we'll create a new virtualhost by creating a new configuration file named reviveads.conf . The directory here may differ from one distribution to another, here is how we create in the following distributions of linux.

#### On Ubuntu 15.04 ####

    # touch /etc/apache2/sites-available/reviveads.conf
    # ln -s /etc/apache2/sites-available/reviveads.conf /etc/apache2/sites-enabled/reviveads.conf
    # nano /etc/apache2/sites-available/reviveads.conf

Now, we'll gonna add the following lines of configuration into this file using our favorite text editor.

    <VirtualHost *:80>
    ServerAdmin info@reviveads.linoxide.com
    DocumentRoot /var/www/html/reviveads/
    ServerName reviveads.linoxide.com
    ServerAlias www.reviveads.linoxide.com
    <Directory /var/www/html/reviveads/>
    Options FollowSymLinks
    AllowOverride All
    </Directory>
    ErrorLog /var/log/apache2/reviveads.linoxide.com-error_log
    CustomLog /var/log/apache2/reviveads.linoxide.com-access_log common
    </VirtualHost>

![Configuring Apache2 Ubuntu](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-apache2-ubuntu.png)

After done, we'll gonna save the file and exit our text editor. Then, we'll restart our Apache Web server.

    # systemctl restart apache2

#### On CentOS 7 ####

In CentOS, we'll directly create the file reviveads.conf under /etc/httpd/conf.d/ directory using our favorite text editor.

    # nano /etc/httpd/conf.d/reviveads.conf

Then, we'll gonna add the following lines of configuration into the file.

    <VirtualHost *:80>
    ServerAdmin info@reviveads.linoxide.com
    DocumentRoot /var/www/html/reviveads/
    ServerName reviveads.linoxide.com
    ServerAlias www.reviveads.linoxide.com
    <Directory /var/www/html/reviveads/>
    Options FollowSymLinks
    AllowOverride All
    </Directory>
    ErrorLog /var/log/httpd/reviveads.linoxide.com-error_log
    CustomLog /var/log/httpd/reviveads.linoxide.com-access_log common
    </VirtualHost>

![Configuring httpd Centos](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-httpd-centos.png)

Once done, we'll simply save the file and exit the editor. And then, we'll gonna restart our apache web server.

    # systemctl restart httpd

### 7. Fixing Permissions and Ownership ###

Now, we'll gonna fix some file permissions and ownership of the installation path. First, we'll gonna set the ownership of the installation directory to Apache process owner so that apache web server will have full access of the files and directories to edit, create and delete.

#### On Ubuntu 15.04 ####

    # chown www-data: -R /var/www/html/reviveads

#### On CentOS 7 ####

    # chown apache: -R /var/www/html/reviveads

### 8. Allowing Firewall ###

Now, we'll gonna configure our firewall programs to allow port 80 (http) so that our apache web server running Revive Adserver will be accessible from other machines in the network across the default http port ie 80.

#### On Ubuntu 15.04/CentOS 7 ####

As CentOS 7 and Ubuntu 15.04 both has systemd installed by default, it contains firewalld running as firewall program. In order to open the port 80 (http service) on firewalld, we'll need to execute the following commands.

    # firewall-cmd --permanent --add-service=http

    success

    # firewall-cmd --reload

    success

### 9. Web Installation ###

Finally, after everything is done as expected, we'll now be able to access the web interface of the application using a web browser. We can go further towards the web installation, by pointing the web browser to the web server we are running in our linux machine. To do so, we'll need to point our web browser to http://ip-address/ or http://domain.com assigned to our linux machine. Here, in this tutorial, we'll point our browser to http://reviveads.linoxide.com/ .

Here, we'll see the Welcome page of the installation of Revive Adserver with the GNU General Public License V2 as Revive Adserver is released under this license. Then, we'll simply click on I agree button in order to continue the installation.

In the next page, we'll need to enter the required database information in order to connect Revive Adserver with the MariaDB database server. Here, we'll need to enter the database name, user and password that we had set in the above step. In this tutorial, we entered database name, user and password as revivedb, reviveuser and Pa$$worD123 respectively then, we set the hostname as localhost and continue further.

![Configuring Revive Adserver](http://blog.linoxide.com/wp-content/uploads/2015/11/configuring-revive-adserver.png)

We'll now enter the required information like administration username, password and email address so that we can use these information to login to the dashboard of our Adserver. After done, we'll head towards the Finish page in which we'll see that we have successfully installed Revive Adserver in our server.

Next, we'll be redirected to the Adverstiser page where we'll add new Advertisers and manage them. Then, we'll be able to navigate to our Dashboard, add new users to the adserver, add new campaign for our advertisers, banners, websites, video ads and everything that its built with.

For enabling more configurations and access towards the administrative settings, we can switch our Dashboard user to the Administrator account. This will add new administrative menus in the dashboard like Plugins, Configuration through which we can add and manage plugins and configure many features and elements of Revive Adserver.

### Conclusion ###

In this article, we learned some information on what is Revive Adserver and how we can setup on linux machine running Ubuntu 15.04 and CentOS 7 distributions. Though Revive Adserver's initial source code was bought from OpenX, currently the code base for OpenX Enterprise and Revive Adserver are completely separate. To extend more features, we can install more plugins which we can also find from [http://www.adserverplugins.com/][2] . Really, this piece of software has changed the way of managing the ads for websites, apps, videos and made it very easy and efficient. If you have any questions, suggestions, feedback please write them in the comment box below so that we can improve or update our contents. Thank you !

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-revive-adserver-ubuntu-15-04-centos-7/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.revive-adserver.com/download/
[2]:http://www.adserverplugins.com/