wyangsun翻译中
How to Create Own Online Shopping Store Using “OpenCart” in Linux
================================================================================
In the Internet world we are doing everything using a computer. Electronic Commerce aka e-commerce is one one of them. E-Commerce is nothing new and it started in the early days of ARPANET, where ARPANET used to arrange sale between students of Massachusetts Institute of Technology and Stanford Artificial Intelligence Laboratory.

These days there are some 100’s of E-Commerce site viz., Flipcart, eBay, Alibaba, Zappos, IndiaMART, Amazon, etc. Have you thought of making your own Amazon and Flipcart like web-based Application Server? If yes! This article is for you.

Opencart is a free and open source E-Commerce Application written in PHP, which can be used to develop a shopping cart system similar to Amazon and Flipcart. If you want to sell your products online or want to serve your customers even when you are closed Opencart is for you. You can build a successful online store (for online merchants) using reliable and professional Opencart Application.

### OpenCart Web Panel Demo ###

- Store Front – [http://demo.opencart.com/][1]
- Admin Login – [http://demo.opencart.com/admin/][2]

    ------------------ Admin Login ------------------
    Username: demo
    Password: demo

#### Features of Opencart ####

Opencart is an application that meets all the requirements of an online merchant. It has all the features (see below) using which you can make your own E-Commerce Website.

- It is a Free (as in beer) and Open Source (as in speech) Application released under GNU GPL License.
- Everything is well documented, means you don’t need to Google and shout for help.
- Free Life time support and updates.
- Unlimited number of categories, Products and manufacturer supported.
- Everything is Template based.
- Multi-Language and Multi-Currency Supported. It ensures your product gets a global reach.
- Built-in Product Review and Rating Features.
- Downloadable Products (viz., ebook) supported.
- Automatic Image Resizing supported.
- Features like Multi tax Rates (as in various country), Viewing Related Products, Information Page, Shipping Weight Calculation, Availing Discount Coupons, etc are well implemented by default.
- Built-in Backup and Restore tools.
- Well implemented SEO.
- Invoice Printing, Error Log and sales report are supported as well.

#### System Requirements ####

- Web Server (Apache HTTP Server Preferred)
- PHP (5.2 and above).
- Database (MySQLi Preferred but I am using MariaDB).

#### Required PHP Libraries and Modules ####

These extensions must be installed and enabled on your system to install Opencart properly on the web server.

- Curl
- Zip
- Zlib
- GD Library
- Mcrypt
- Mbstrings

### Step 1: Installing Apache, PHP and MariaDB ###

1. As I said, OpenCart requires certain technical requirements such as Apache, PHP with extensions and Database (MySQL or MariaDB) to be installed on the system, in order to run Opencart properly.

Let’s install Apache, PHP and MariaDB using following Command.

**Install Apache**

    # apt-get install apache2 		 (On Debian based Systems)
    # yum install httpd			 (On RedHat based Systems)

**Install PHP and Extensions**

    # apt-get install php5 libapache2-mod-php5 php5-curl php5-mcrypt 	(On Debian based Systems)
    # yum install php php-mysql php5-curl php5-mcrypt			(On RedHat based Systems)

**Install MariaDB**

    # apt-get install mariadb-server mariadb-client				(On Debian based Systems)
    # yum install mariadb-server mariadb					(On RedHat based Systems)

2. After installing all the above required things, you can start the Apache and MariaDB services using following commands.

    ------------------- On Debian based Systems ------------------- 
    # systemctl restart apache2.service					
    # systemctl restart mariadb.service	

----------

    ------------------- On RedHat based Systems ------------------- 
    # systemctl restart httpd.service 		
    # systemctl restart mariadb.service 				

### Step 2: Downloading and Setting OpenCart ###

3. The most recent version of OpenCart (2.0.2.0) can be obtained from [OpenCart website][3] or directly from github.

Alternatively, you may use following wget command to download the latest version of OpenCart directly from github repository as shown below.

    # wget https://github.com/opencart/opencart/archive/master.zip

4. After downloading zip file, copy to Apache Working directory (i.e. /var/www/html) and unzip the master.zip file.

    # cp master.zip /var/www/html/
    # cd /var/www/html
    # unzip master.zip

5. After extracting ‘master.zip‘ file, cd to extracted directory and move the content of upload directory to the root of the application folder (opencart-master).

    # cd opencart-master
    # mv -v upload/* ../opencart-master/

6. Now you need to rename or copy OpenCart configuration files as shown below.

    # cp /var/www/html/opencart-master/admin/config-dist.php /var/www/html/opencart-master/admin/config.php
    # cp /var/www/html/opencart-master/config-dist.php /var/www/html/opencart-master/config.php

7. Next, set correct Permissions to the files and folders of /var/www/html/opencart-master. You need to provide RWX permission to all the files and folders there, recursively.

    # chmod 777 -R /var/www/html/opencart-master 

**Important**: Setting permission 777 may be dangerous, so as soon as you finish setting up everything, revert back to permission 755 recursively on the above folder.

### Step 3: Creating OpenCart Database ###

8. Next step is to create a database (say opencartdb) for the E-Commerce site to store data on the database. Connect to databaser server and create a database, user and grant correct privileges on the user to have full control over the database.

    # mysql -u root -p
    CREATE DATABASE opencartdb;
    CREATE USER 'opencartuser'@'localhost' IDENTIFIED BY 'mypassword';
    GRANT ALL PRIVILEDGES ON opencartdb.* TO 'opencartuser'@'localhost' IDENTIFIED by 'mypassword';

### Step 4: OpenCart Web Installation ###

9. Once everything set correctly, navigate to the web browser and type `http://<web server IP address>` to access the OpenCart web installation.

Click ‘CONTINUE‘ to Agree the License Agreement.

![Accept OpenCart License](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart-License.png)

Accept OpenCart License

10. The next screen is Pre-installation Server Setup Check, to see that the server has all the required modules are installed properly and have correct permission on the OpenCart files.

If any red marks are highlighted on #1 or #2, that means you need to install those components properly on the server to meet web server requirements.

If there are any red marks on #3 or #4, that means there is issue with your files. If everything is correctly configured you should see all green marks are visible (as seen below), you may press “Continue“.

![Server Requirement Check](http://www.tecmint.com/wp-content/uploads/2015/05/Server-Checkup.png)

Server Requirement Check

11. On the next screen enter your Database Credentials like Database Driver, Hostname, User-name, Password, database. You should not touch db_port and Prefix, until and unless you know what you are doing.

Also Enter User_name, Password and Email Address for Administrative account. Note these credentials will be used for logging in to Opencart Admin Panel as root, so keep it safe. Click continue when done!

![OpenCart Database Details](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart-Database.png)

OpenCart Database Details

12. The next screen shows message like “Installation Complete” with the Tag Line Ready to Start Selling. Also it warns to delete the installation directory, as everything required to setup using this directory has been accomplished.

![OpenCart Installation Completes](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart-Installation-Completes.png)

OpenCart Installation Completes

To Remove install directory, you may like to run the below command.

    # rm -rf /var/www/html/opencart-master/install

### Step 4: Access OpenCart Web and Admin ###

13. Now point your browser to `http://<web server IP address>/opencart-master/` and you would see something like the below screenshot.

![OpenCart Product Showcase](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart.jpg)

OpenCart Product Showcase

14. In order to login to Opencart Admin Panel, point your browser to http://<web server IP address>/opencart-master/admin and fill the Admin Credentials you input, while setting it up.

![OpenCart Admin Login](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart-Admin-Login.png)

OpenCart Admin Login

15. If everything ok! You should be able to see the Admin Dashboard of Opencart.

![OpenCart Dashboard](http://www.tecmint.com/wp-content/uploads/2015/05/OpenCart-Dashboard.png)

OpenCart Dashboard

Here in Admin Dashboard you may set up a lots of options like categories, product, options, Manufacturers, Downloads, Review, Information, Extension Installer, Shipping, Payment options, order totals, gift voucher, Paypal, Coupons, Affiliates, marketing, mails, Design and Settings, Error logs, in-built analytics and what not.

#### What after testing the tools? ####

If you have already tested the Application and finds it customizable, flexible, Rock Solid, Easy to maintain and use, you may need a good hosting provider to host OpenCart application, that remains live 24X7 support. Though there are a lot of options for hosting providers we recommend Hostgator.

Hostgator is a Domain Registrant and Hosting Provider that is very well known for the service and feature it provides. It Provides you with UNLIMITED Disk Space, UNLIMITED Bandwidth, Easy to install (1-click install script), 99.9% Uptime, Award winning 24x7x365 Technical Support and 45 days money back guarantee, which means if you didn’t like the product and service you get your money back within 45 days of purchasing and mind it 45 days is a long time to Test.

So if you have something to sell you can do it for free (by free I mean, Think of the cost you would spend on getting a physical store and then compare it with virtual store setting-up cost. You will feel its free).

**Note**: When you buy hosting (and/or Domain) from Hostgator you will get a **Flat 25% OFF**. This offer is valid only for the readers of Tecmint Site.

All you have to do is to Enter Promocode “**TecMint025**” during the payment of hosting. For reference see the preview of payment screen with promo code.

![Hostgator 25% Discount - TecMint025](http://www.tecmint.com/wp-content/uploads/2015/05/Hostgator-Discount-Code.png)

[Sign up for Hostgator][4] (Coupon code: TecMint025)

**Note**: Also worth mentioning, that for each hosting you buy from Hostgator to host OpenCart, we will get a small amount of commission, just to keep Tecmint Live (by Paying Bandwidth and hosting charges of server).

So If you buy it using the above code, you get discount and we will get a small amount. Also note that you won’t pay anything extra, infact you will be paying 25% less on total bill.

### Conclusion ###

OpenCart is an application that performs out-of-the box. It is easy to install and you have the option to choose best suited templates, add your products and you become an online merchant.

A lots of community made extensions(free and paid) makes it rich. It is a wonderful application for those who want to setup a virtual store and remain accessible to their customer 24X7. Let me know yours experience with the application. Any suggestion and feedback is welcome as well.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/create-e-commerce-online-shopping-store-using-opencart-in-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://demo.opencart.com/
[2]:http://demo.opencart.com/admin/
[3]:http://www.opencart.com/index.php?route=download/download/
[4]:http://secure.hostgator.com/%7Eaffiliat/cgi-bin/affiliates/clickthru.cgi?id=tecmint
