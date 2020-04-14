[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Build a private social network with a Raspberry Pi)
[#]: via: (https://opensource.com/article/20/3/raspberry-pi-open-source-social)
[#]: author: (Giuseppe Cassibba https://opensource.com/users/peppe8o)

Build a private social network with a Raspberry Pi
======
Step-by-step instructions on how to create your own social network with
low-cost hardware and simple setup.
![Team of people around the world][1]

Social networks have revolutionized people's lives in the last several years. People use social channels every day to stay connected with friends and family. But a common question remains regarding privacy and data security. Even if social networks have created complex privacy policies to protect users, maintaining your data in your own server is always the best option if you don't want to make them available to the public.

Again, a Raspberry Pi—Raspbian Lite version can be very versatile to help you put a number of useful home services (see also my [Raspberry Pi projects][2] article) in place. Some addictive features can be achieved by searching for open source software and testing it with this fantastic device. An interesting example to try is installing OpenSource Social Network in your Raspberry Pi.

### What Is OpenSource Social Network?

[OpenSource Social Network][3] (OSSN) is a rapid-development social networking software written in PHP, that essentially allows you to make a social networking website. OSSN can be used to build different types of social apps, such as:

  * Private Intranets
  * Public/Open Networks
  * Community



OSSN supports features like:

  * Photos
  * Profile
  * Friends
  * Smileys
  * Search
  * Chat



OSSN runs on a LAMP server. It has very poor hardware requirements, but an amazing user interface, which is also mobile-friendly.

### What we need

This project is very simple and, because we're installing only remote web services, we only need a few cheap parts. I'm going to use a Raspberry Pi 3 model B+, but it should also work with Raspberry Pi 3 model A+ or newer boards.

Hardware:

  * Raspberry Pi 3 model B+ with its power supply
  * a micro SD card (better if it is a performing card, at least 16GB)
  * a Desktop PC with an SFTP software (for example, the free [Filezilla][4]) to transfer installation packages into your RPI.



### Step-by-step procedure

We'll start by setting up a classic LAMP server. We'll then set up database users and install OpenSource Social Network.

#### 1\. Install Raspbian Buster Lite OS

For this step, you can simply follow my [Install Raspbian Buster Lite in your Raspberry Pi][5] article.

Make sure that your system is up to date. Connect via ssh terminal and type following commands:


```
sudo apt-get update
sudo apt-get upgrade
```

2\. Install LAMP server

LAMP (Linux–Apache–Mysql–Php) servers usually come with the MySQL database. In our project, we'll use MariaDB instead, because it is lighter and works with Raspberry Pi. 

#### 3\. Install Apache server:


```
`sudo apt-get install apache2 -y`
```

You should now be able to check that Apache installation has gone correctly by browsing http://&lt;&lt;YouRpiIPAddress&gt;&gt;:

![][6]

#### 4\. Install PHP:


```
`sudo apt-get install php -y`
```

5\. Install MariaDB server and PHP connector:


```
`sudo apt-get install mariadb-server php-mysql -y`
```

6\. Install PhpMyAdmin:

PhpMyAdmin is not mandatory in OpenSource Social Network, but I suggest that you install it because it simplifies database management.


```
`sudo apt-get install phpmyadmin`
```

In the phpMyAdmin setup screen, take the following steps:

  * Select apache (mandatory) with space and press OK.
  * Select Yes to configure the database for phpMyAdmin with dbconfig-common.
  * Enter your favorite phpMyAdmin password and press OK.
  * Enter your phpMyAdmin password again to confirm and press OK



#### 7\. Grant phpMyAdmin user DB privileges to manage DBs:

We'll connect to MariaDB with root user (default password is empty) to grant permissions. Remember to use semicolons at the end of each command row as shown below:


```
sudo mysql -uroot -p
grant all privileges on *.* to 'phpmyadmin'@'localhost';
flush privileges;
quit
```

8\. Finally, restart Apache service:


```
`sudo systemctl restart apache2.service`
```

And check that phpMyAdmin is working by browsing http://&lt;&lt;YouRpiIPAddress&gt;&gt;/phpmyadmin/. 

![][7]

Default phpMyAdmin login credentials are:

  * user: phpmyadmin
  * password: the one you set up in the phpMyAdmin installation step



### Installing other open source social network-required packages and setting up PHP

We need to prepare our system for OpenSource Social Network's first setup wizard. Required packages are:

  * PHP version any of 5.6, 7.0, 7.1
  * MYSQL 5 OR &gt;
  * APACHE
  * MOD_REWRITE
  * PHP Extensions cURL &amp; Mcrypt should be enabled
  * PHP GD Extension
  * PHP ZIP Extension
  * PHP settings allow_url_fopen enabled
  * PHP JSON Support
  * PHP XML Support
  * PHP OpenSSL



So we'll install them with following terminal commands:


```
`sudo apt-get install php7.3-curl php7.3-gd php7.3-zip php7.3-json php7.3-xml`
```

#### 1\. Enable MOD_REWRITE:


```
`sudo a2enmod rewrite`
```

2\. Edit default Apache config to use mod_rewrite:


```
`sudo nano /etc/apache2/sites-available/000-default.conf`
```

3\. Add the section so that your **000-default.conf** file appears like the following (excluding comments):


```
&lt;VirtualHost *:80&gt;
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
    # SECTION TO ADD --------------------------------
        &lt;Directory /var/www/html&gt;
            Options Indexes FollowSymLinks MultiViews
            AllowOverride All
            Require all granted
        &lt;/Directory&gt;
    # END SECTION TO ADD --------------------------------
&lt;/VirtualHost&gt;
```

4\. Install Mcrypt:


```
sudo apt install php-dev libmcrypt-dev php-pear
sudo pecl channel-update pecl.php.net
sudo pecl install mcrypt-1.0.2
```

5\. Enable Mcrypt module by adding (or uncommenting) “extension=mcrypt.so" in "/etc/php/7.3/apache2/php.ini":


```
`sudo nano /etc/php/7.3/apache2/php.ini`
```

**allow_url_fopen** should be already enabled in "/etc/php/7.3/apache2/php.ini". OpenSSL should be already installed in php7.3.

#### 6\. Another setting that I suggest is editing the PHP max upload file size up to 16 MB:


```
`sudo nano /etc/php/7.3/apache2/php.ini`
```

7\. Look for the row with the **upload_max_filesize** parameter and set it as the following:


```
`upload_max_filesize = 16M`
```

8\. Save and exit. Restart Apache:


```
`sudo systemctl restart apache2.service`
```

### Install OSSN

#### 1\. Create DB and set up user:

Go back to phpmyadmin web page (browse "http://&lt;&lt;YourRpiIPAddress&gt;&gt;/phpmyadmin/") and login:

User: phpmyadmin

Password: the one set up in phpmyadmin installation step

Click on database tab:

![][8]

Create a database and take note of the database name, as you will be required to enter it later in the installation process.

![][9]

It's time to create a database user for OSSN. In this example, I'll use the following credentials:

User: ossn_db_user

Password: ossn_db_password

So, terminal commands will be (root password is still empty, if not changed by you before):


```
sudo mysql -uroot -p
CREATE USER 'ossn_db_user'@'localhost' IDENTIFIED BY 'ossn_db_password';
GRANT ALL PRIVILEGES ON ossn_db.* TO 'ossn_db_user'@'localhost';
flush privileges;
quit
```

2\. Install OSSN software:

Download the OSSN installation zip file from the [OSSN download page][10] on your local PC. At the time of this writing, this file is named "ossn-v5.2-1577836800.zip."

Using your favorite SFTP software, transfer the entire zip file via SFTP to a new folder in the path "/home/pi/download" on your Raspberry Pi. Common (default) SFP connection parameters are:

  * Host: your Raspberry Pi IP address
  * User: pi
  * Password: raspberry (if you didn't change the pi default password)
  * Port: 22



Back to terminal:


```
cd /home/pi/download/ #Enter directory where OSSN installation files have been transferred
unzip ossn-v5.2-1577836800.zip #Extracts all files from zip
cd /var/www/html/ #Enter Apache web directory
sudo rm index.html #Removes Apache default page - we'll use OSSN one
sudo cp -R /home/pi/download/ossn-v5.2-1577836800/* ./ #Copy installation files to web directory
sudo chown -R www-data:www-data ./
```

Create a data folder:OSSN requires a folder to store data. OSSN suggests, for security reasons, to create this folder outside of the published document root. So, we'll create this opt-in folder and give grants:


```
sudo mkdir /opt/ossn_data
sudo chown -R www-data:www-data /opt/ossn_data/
```

Browse http://&lt;&lt;YourRpiIPAddress&gt;&gt; to start the installation wizard:

![][11]

All checks should be fine. Click the Next button at the end of the page.

![][12]

Read the license validation and click the Next button at the end of the page to accept.

![][13]

Enter the database user, password, and the DB name you chose. Remember also to enter the OSSN data folder. Press Install.

![][14]

Enter your admin account information and press the Create button.

![][15]

Everything should be fine now. Press Finish to access the administration dashboard.

![][16]

So, administration panel can be reached with URL "http://&lt;&lt;YourRpiIPAddress&gt;&gt;/administrator" while user link will be "http://&lt;&lt;YourRpiIPAddress&gt;&gt;".

![][17]

_This article was originally published at [peppe8o.com][18]. Reposted with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/raspberry-pi-open-source-social

作者：[Giuseppe Cassibba][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/peppe8o
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_global_people_gis_location.png?itok=Rl2IKo12 (Team of people around the world)
[2]: https://peppe8o.com/2019/04/best-raspberry-pi-projects-with-open-source-software/
[3]: https://www.opensource-socialnetwork.org/
[4]: https://filezilla-project.org/
[5]: https://peppe8o.com/2019/07/install-raspbian-buster-lite-in-your-raspberry-pi/
[6]: https://opensource.com/sites/default/files/uploads/ossn_1_0.jpg
[7]: https://opensource.com/sites/default/files/uploads/ossn_2.jpg
[8]: https://opensource.com/sites/default/files/uploads/ossn_3.jpg
[9]: https://opensource.com/sites/default/files/uploads/ossn_4.jpg
[10]: https://www.opensource-socialnetwork.org/download
[11]: https://opensource.com/sites/default/files/uploads/ossn_5.jpg
[12]: https://opensource.com/sites/default/files/uploads/ossn_6.jpg
[13]: https://opensource.com/sites/default/files/uploads/ossn_7.jpg
[14]: https://opensource.com/sites/default/files/uploads/ossn_8.jpg
[15]: https://opensource.com/sites/default/files/uploads/ossn_9.jpg
[16]: https://opensource.com/sites/default/files/uploads/ossn_10.jpg
[17]: https://opensource.com/sites/default/files/uploads/ossn_11.jpg
[18]: https://peppe8o.com/private-social-network-with-raspberry-pi-and-opensource-social-network/
